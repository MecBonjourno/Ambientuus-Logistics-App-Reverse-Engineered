package androidx.camera.video.internal.encoder;

import android.media.MediaCodec;
import android.media.MediaCodecInfo;
import android.media.MediaCrypto;
import android.media.MediaFormat;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.Range;
import android.util.Rational;
import android.view.Surface;
import androidx.arch.core.util.Function;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.Observable;
import androidx.camera.core.impl.Timebase;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.video.internal.BufferProvider;
import androidx.camera.video.internal.DebugUtils;
import androidx.camera.video.internal.compat.quirk.AudioEncoderIgnoresInputTimestampQuirk;
import androidx.camera.video.internal.compat.quirk.CameraUseInconsistentTimebaseQuirk;
import androidx.camera.video.internal.compat.quirk.CodecStuckOnFlushQuirk;
import androidx.camera.video.internal.compat.quirk.DeviceQuirks;
import androidx.camera.video.internal.compat.quirk.EncoderNotUsePersistentInputSurfaceQuirk;
import androidx.camera.video.internal.compat.quirk.PrematureEndOfStreamVideoQuirk;
import androidx.camera.video.internal.compat.quirk.PreviewFreezeAfterHighSpeedRecordingQuirk;
import androidx.camera.video.internal.compat.quirk.SignalEosOutputBufferNotComeQuirk;
import androidx.camera.video.internal.compat.quirk.StopCodecAfterSurfaceRemovalCrashMediaServerQuirk;
import androidx.camera.video.internal.compat.quirk.VideoEncoderSuspendDoesNotIncludeSuspendTimeQuirk;
import androidx.camera.video.internal.encoder.Encoder;
import androidx.camera.video.internal.encoder.EncoderImpl;
import androidx.camera.video.internal.utils.CodecUtil;
import androidx.camera.video.internal.workaround.VideoTimebaseConverter;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import j$.util.Objects;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.Future;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

/* carregado de: classes.dex */
public class EncoderImpl implements Encoder {
    private static final boolean DEBUG = false;
    private static final long NO_LIMIT_LONG = Long.MAX_VALUE;
    private static final Range<Long> NO_RANGE = Range.create(Long.MAX_VALUE, Long.MAX_VALUE);
    static final String PARAMETER_KEY_TIMELAPSE_ENABLED = "time-lapse-enable";
    static final String PARAMETER_KEY_TIMELAPSE_FPS = "time-lapse-fps";
    private static final long SIGNAL_EOS_TIMEOUT_MS = 1000;
    private static final long STOP_TIMEOUT_MS = 1000;
    private final Rational mCaptureToEncodeFrameRateRatio;
    private final boolean mCodecStopAsFlushWorkaroundEnabled;
    private final EncoderConfig mEncoderConfig;
    final Executor mEncoderExecutor;
    private final EncoderInfo mEncoderInfo;
    final Encoder.EncoderInput mEncoderInput;
    final Timebase mInputTimebase;
    final boolean mIsVideoEncoder;
    final MediaCodec mMediaCodec;
    final MediaFormat mMediaFormat;
    private final CallbackToFutureAdapter.Completer<Void> mReleasedCompleter;
    private final ListenableFuture<Void> mReleasedFuture;
    private Future<?> mSignalEosTimeoutFuture;
    InternalState mState;
    final String mTag;
    final TimeProvider mTimeProvider;
    final Object mLock = new Object();
    final Queue<Integer> mFreeInputBufferIndexQueue = new ArrayDeque();
    private final Queue<CallbackToFutureAdapter.Completer<InputBuffer>> mAcquisitionQueue = new ArrayDeque();
    private final Set<InputBuffer> mInputBufferSet = new HashSet();
    final Set<EncodedDataImpl> mEncodedDataSet = new HashSet();
    final Deque<Range<Long>> mActivePauseResumeTimeRanges = new ArrayDeque();
    EncoderCallback mEncoderCallback = EncoderCallback.EMPTY;
    Executor mEncoderCallbackExecutor = CameraXExecutors.directExecutor();
    Range<Long> mStartStopTimeRangeUs = NO_RANGE;
    long mTotalPausedDurationUs = 0;
    boolean mPendingCodecStop = false;
    Long mLastDataStopTimestamp = null;
    Future<?> mStopTimeoutFuture = null;
    private MediaCodecCallback mMediaCodecCallback = null;
    private boolean mIsFlushedAfterEndOfStream = false;
    private boolean mSourceStoppedSignalled = false;
    boolean mMediaCodecEosSignalled = false;

    enum InternalState {
        CONFIGURED,
        STARTED,
        PAUSED,
        STOPPING,
        PENDING_START,
        PENDING_START_PAUSED,
        PENDING_RELEASE,
        ERROR,
        RELEASED
    }

    public EncoderImpl(Executor executor, EncoderConfig encoderConfig, int sessionType) throws InvalidConfigException {
        boolean z = false;
        Preconditions.checkNotNull(executor);
        this.mEncoderConfig = (EncoderConfig) Preconditions.checkNotNull(encoderConfig);
        this.mMediaCodec = CodecUtil.createCodec(encoderConfig);
        MediaCodecInfo mediaCodecInfo = this.mMediaCodec.getCodecInfo();
        this.mEncoderExecutor = CameraXExecutors.newSequentialExecutor(executor);
        this.mMediaFormat = encoderConfig.toMediaFormat();
        this.mInputTimebase = encoderConfig.getInputTimebase();
        this.mTimeProvider = transformTimeProvider(new SystemTimeProvider(), new Function() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda10
            @Override // androidx.arch.core.util.Function
            public final Object apply(Object obj) {
                long presentationTimeUsByCaptureEncodeRatio;
                presentationTimeUsByCaptureEncodeRatio = EncoderImpl.this.toPresentationTimeUsByCaptureEncodeRatio(((Long) obj).longValue());
                return Long.valueOf(presentationTimeUsByCaptureEncodeRatio);
            }
        });
        if (encoderConfig instanceof AudioEncoderConfig) {
            AudioEncoderConfig audioEncoderConfig = (AudioEncoderConfig) encoderConfig;
            this.mTag = "AudioEncoder";
            this.mIsVideoEncoder = false;
            this.mEncoderInput = new ByteBufferInput();
            this.mEncoderInfo = new AudioEncoderInfoImpl(mediaCodecInfo, encoderConfig.getMimeType());
            this.mCaptureToEncodeFrameRateRatio = new Rational(audioEncoderConfig.getCaptureSampleRate(), audioEncoderConfig.getEncodeSampleRate());
        } else if (encoderConfig instanceof VideoEncoderConfig) {
            VideoEncoderConfig videoEncoderConfig = (VideoEncoderConfig) encoderConfig;
            this.mTag = "VideoEncoder";
            this.mIsVideoEncoder = true;
            this.mEncoderInput = new SurfaceInput();
            VideoEncoderInfo videoEncoderInfo = new VideoEncoderInfoImpl(mediaCodecInfo, encoderConfig.getMimeType());
            clampVideoBitrateIfNotSupported(videoEncoderInfo, this.mMediaFormat);
            this.mEncoderInfo = videoEncoderInfo;
            this.mCaptureToEncodeFrameRateRatio = new Rational(videoEncoderConfig.getCaptureFrameRate(), videoEncoderConfig.getEncodeFrameRate());
        } else {
            throw new InvalidConfigException("Unknown encoder config type");
        }
        Logger.d(this.mTag, "mInputTimebase = " + this.mInputTimebase);
        Logger.d(this.mTag, "mMediaFormat = " + this.mMediaFormat);
        Logger.d(this.mTag, "mCaptureToEncodeFrameRateRatio = " + this.mCaptureToEncodeFrameRateRatio);
        try {
            reset();
            final AtomicReference<CallbackToFutureAdapter.Completer<Void>> releaseFutureRef = new AtomicReference<>();
            this.mReleasedFuture = Futures.nonCancellationPropagating(CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda11
                @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                    return EncoderImpl.lambda$new$0(releaseFutureRef, completer);
                }
            }));
            this.mReleasedCompleter = (CallbackToFutureAdapter.Completer) Preconditions.checkNotNull(releaseFutureRef.get());
            if (this.mIsVideoEncoder && sessionType == 1 && DeviceQuirks.get(PreviewFreezeAfterHighSpeedRecordingQuirk.class) != null) {
                z = true;
            }
            this.mCodecStopAsFlushWorkaroundEnabled = z;
            setState(InternalState.CONFIGURED);
        } catch (MediaCodec.CodecException e) {
            throw new InvalidConfigException(e);
        }
    }

    static /* sintético */ Object lambda$new$0(AtomicReference releaseFutureRef, CallbackToFutureAdapter.Completer completer) throws Exception {
        releaseFutureRef.set(completer);
        return "mReleasedFuture";
    }

    private void clampVideoBitrateIfNotSupported(VideoEncoderInfo videoEncoderInfo, MediaFormat mediaFormat) {
        Preconditions.checkState(this.mIsVideoEncoder);
        if (mediaFormat.containsKey("bitrate")) {
            int origBitrate = mediaFormat.getInteger("bitrate");
            int newBitrate = videoEncoderInfo.getSupportedBitrateRange().clamp(Integer.valueOf(origBitrate)).intValue();
            if (origBitrate != newBitrate) {
                mediaFormat.setInteger("bitrate", newBitrate);
                Logger.d(this.mTag, "updated bitrate from " + origBitrate + " to " + newBitrate);
            }
        }
    }

    private void reset() {
        this.mStartStopTimeRangeUs = NO_RANGE;
        this.mTotalPausedDurationUs = 0L;
        this.mActivePauseResumeTimeRanges.clear();
        this.mFreeInputBufferIndexQueue.clear();
        for (CallbackToFutureAdapter.Completer<InputBuffer> completer : this.mAcquisitionQueue) {
            completer.setCancelled();
        }
        this.mAcquisitionQueue.clear();
        Logger.d(this.mTag, "mMediaCodec.reset()");
        this.mMediaCodec.reset();
        this.mIsFlushedAfterEndOfStream = false;
        this.mSourceStoppedSignalled = false;
        this.mMediaCodecEosSignalled = false;
        this.mPendingCodecStop = false;
        if (this.mStopTimeoutFuture != null) {
            this.mStopTimeoutFuture.cancel(true);
            this.mStopTimeoutFuture = null;
        }
        if (this.mSignalEosTimeoutFuture != null) {
            this.mSignalEosTimeoutFuture.cancel(false);
            this.mSignalEosTimeoutFuture = null;
        }
        if (this.mMediaCodecCallback != null) {
            this.mMediaCodecCallback.stop();
        }
        this.mMediaCodecCallback = new MediaCodecCallback();
        Logger.d(this.mTag, "mMediaCodec.setCallback()");
        this.mMediaCodec.setCallback(this.mMediaCodecCallback);
        Logger.d(this.mTag, "mMediaCodec.configure()");
        this.mMediaCodec.configure(this.mMediaFormat, (Surface) null, (MediaCrypto) null, 1);
        if (this.mEncoderInput instanceof SurfaceInput) {
            ((SurfaceInput) this.mEncoderInput).resetSurface();
        }
    }

    @Override // androidx.camera.video.internal.encoder.Encoder
    public Encoder.EncoderInput getInput() {
        return this.mEncoderInput;
    }

    @Override // androidx.camera.video.internal.encoder.Encoder
    public EncoderInfo getEncoderInfo() {
        return this.mEncoderInfo;
    }

    @Override // androidx.camera.video.internal.encoder.Encoder
    public int getConfiguredBitrate() {
        if (!this.mMediaFormat.containsKey("bitrate")) {
            return 0;
        }
        int configuredBitrate = this.mMediaFormat.getInteger("bitrate");
        return configuredBitrate;
    }

    @Override // androidx.camera.video.internal.encoder.Encoder
    public void start() {
        final long startTriggerTimeUs = generatePresentationTimeUs();
        this.mEncoderExecutor.execute(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                EncoderImpl.this.m289x86ab6b23(startTriggerTimeUs);
            }
        });
    }

    /* renomeado de: lambda$start$1$androidx-camera-video-internal-encoder-EncoderImpl, motivo: nome Java inválido */
    /* sintético */ void m289x86ab6b23(long startTriggerTimeUs) {
        switch (this.mState) {
            case CONFIGURED:
                this.mLastDataStopTimestamp = null;
                Logger.d(this.mTag, "Start on " + DebugUtils.readableUs(startTriggerTimeUs));
                try {
                    if (this.mIsFlushedAfterEndOfStream) {
                        reset();
                    }
                    this.mStartStopTimeRangeUs = Range.create(Long.valueOf(startTriggerTimeUs), Long.MAX_VALUE);
                    Logger.d(this.mTag, "mMediaCodec.start()");
                    this.mMediaCodec.start();
                    if (this.mEncoderInput instanceof ByteBufferInput) {
                        ((ByteBufferInput) this.mEncoderInput).setActive(true);
                    }
                    setState(InternalState.STARTED);
                    return;
                } catch (MediaCodec.CodecException e) {
                    handleEncodeError(e);
                    return;
                }
            case STARTED:
            case PENDING_START:
            case ERROR:
                return;
            case PAUSED:
                this.mLastDataStopTimestamp = null;
                Range<Long> pauseRange = this.mActivePauseResumeTimeRanges.removeLast();
                Preconditions.checkState(pauseRange != null && pauseRange.getUpper().longValue() == Long.MAX_VALUE, "There should be a \"pause\" before \"resume\"");
                long pauseTimeUs = pauseRange.getLower().longValue();
                this.mActivePauseResumeTimeRanges.addLast(Range.create(Long.valueOf(pauseTimeUs), Long.valueOf(startTriggerTimeUs)));
                Logger.d(this.mTag, "Resume on " + DebugUtils.readableUs(startTriggerTimeUs) + "\nPaused duration = " + DebugUtils.readableUs(startTriggerTimeUs - pauseTimeUs));
                if ((this.mIsVideoEncoder || DeviceQuirks.get(AudioEncoderIgnoresInputTimestampQuirk.class) == null) && (!this.mIsVideoEncoder || DeviceQuirks.get(VideoEncoderSuspendDoesNotIncludeSuspendTimeQuirk.class) == null)) {
                    setMediaCodecPaused(false);
                    if (this.mEncoderInput instanceof ByteBufferInput) {
                        ((ByteBufferInput) this.mEncoderInput).setActive(true);
                    }
                }
                if (this.mIsVideoEncoder) {
                    requestKeyFrameToMediaCodec();
                }
                setState(InternalState.STARTED);
                return;
            case STOPPING:
            case PENDING_START_PAUSED:
                setState(InternalState.PENDING_START);
                return;
            case PENDING_RELEASE:
            case RELEASED:
                throw new IllegalStateException("Encoder is released");
            default:
                throw new IllegalStateException("Unknown state: " + this.mState);
        }
    }

    @Override // androidx.camera.video.internal.encoder.Encoder
    public void stop() {
        stop(-1L);
    }

    @Override // androidx.camera.video.internal.encoder.Encoder
    public void stop(final long expectedStopTimeUs) {
        final long stopTriggerTimeUs = generatePresentationTimeUs();
        this.mEncoderExecutor.execute(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda4
            @Override // java.lang.Runnable
            public final void run() {
                EncoderImpl.this.m292lambda$stop$4$androidxcameravideointernalencoderEncoderImpl(expectedStopTimeUs, stopTriggerTimeUs);
            }
        });
    }

    /* renomeado de: lambda$stop$4$androidx-camera-video-internal-encoder-EncoderImpl, motivo: nome Java inválido */
    /* sintético */ void m292lambda$stop$4$androidxcameravideointernalencoderEncoderImpl(long expectedStopTimeUs, long stopTriggerTimeUs) {
        long stopTimeUs;
        switch (this.mState) {
            case CONFIGURED:
            case STOPPING:
            case ERROR:
                return;
            case STARTED:
            case PAUSED:
                InternalState currentState = this.mState;
                setState(InternalState.STOPPING);
                long startTimeUs = this.mStartStopTimeRangeUs.getLower().longValue();
                if (startTimeUs == Long.MAX_VALUE) {
                    throw new AssertionError("There should be a \"start\" before \"stop\"");
                }
                if (expectedStopTimeUs == -1) {
                    stopTimeUs = stopTriggerTimeUs;
                } else if (expectedStopTimeUs < startTimeUs) {
                    Logger.w(this.mTag, "The expected stop time is less than the start time. Use current time as stop time.");
                    stopTimeUs = stopTriggerTimeUs;
                } else {
                    stopTimeUs = expectedStopTimeUs;
                }
                if (stopTimeUs < startTimeUs) {
                    throw new AssertionError("The start time should be before the stop time.");
                }
                this.mStartStopTimeRangeUs = Range.create(Long.valueOf(startTimeUs), Long.valueOf(stopTimeUs));
                Logger.d(this.mTag, "Stop on " + DebugUtils.readableUs(stopTimeUs));
                if (currentState == InternalState.PAUSED && this.mLastDataStopTimestamp != null) {
                    signalCodecStop();
                    return;
                } else {
                    this.mPendingCodecStop = true;
                    this.mStopTimeoutFuture = CameraXExecutors.mainThreadExecutor().schedule(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda2
                        @Override // java.lang.Runnable
                        public final void run() {
                            EncoderImpl.this.m291lambda$stop$3$androidxcameravideointernalencoderEncoderImpl();
                        }
                    }, 1000L, TimeUnit.MILLISECONDS);
                    return;
                }
            case PENDING_START:
            case PENDING_START_PAUSED:
                setState(InternalState.CONFIGURED);
                return;
            case PENDING_RELEASE:
            case RELEASED:
                throw new IllegalStateException("Encoder is released");
            default:
                throw new IllegalStateException("Unknown state: " + this.mState);
        }
    }

    /* renomeado de: lambda$stop$3$androidx-camera-video-internal-encoder-EncoderImpl, motivo: nome Java inválido */
    /* sintético */ void m291lambda$stop$3$androidxcameravideointernalencoderEncoderImpl() {
        this.mEncoderExecutor.execute(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda13
            @Override // java.lang.Runnable
            public final void run() {
                EncoderImpl.this.m290lambda$stop$2$androidxcameravideointernalencoderEncoderImpl();
            }
        });
    }

    /* renomeado de: lambda$stop$2$androidx-camera-video-internal-encoder-EncoderImpl, motivo: nome Java inválido */
    /* sintético */ void m290lambda$stop$2$androidxcameravideointernalencoderEncoderImpl() {
        if (this.mPendingCodecStop) {
            Logger.w(this.mTag, "The data didn't reach the expected timestamp before timeout, stop the codec.");
            this.mLastDataStopTimestamp = null;
            signalCodecStop();
            this.mPendingCodecStop = false;
        }
    }

    void signalCodecStop() {
        Logger.d(this.mTag, "signalCodecStop");
        if (this.mEncoderInput instanceof ByteBufferInput) {
            ((ByteBufferInput) this.mEncoderInput).setActive(false);
            List<ListenableFuture<Void>> futures = new ArrayList<>();
            for (InputBuffer inputBuffer : this.mInputBufferSet) {
                futures.add(inputBuffer.getTerminationFuture());
            }
            Futures.successfulAsList(futures).addListener(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    EncoderImpl.this.signalEndOfInputStream();
                }
            }, this.mEncoderExecutor);
            return;
        }
        if (this.mEncoderInput instanceof SurfaceInput) {
            try {
                addSignalEosTimeoutIfNeeded();
                Logger.d(this.mTag, "mMediaCodec.signalEndOfInputStream()");
                this.mMediaCodec.signalEndOfInputStream();
                this.mMediaCodecEosSignalled = true;
            } catch (MediaCodec.CodecException e) {
                handleEncodeError(e);
            }
        }
    }

    @Override // androidx.camera.video.internal.encoder.Encoder
    public void pause() {
        final long pauseTriggerTimeUs = generatePresentationTimeUs();
        this.mEncoderExecutor.execute(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda12
            @Override // java.lang.Runnable
            public final void run() {
                EncoderImpl.this.m285x8740478b(pauseTriggerTimeUs);
            }
        });
    }

    /* renomeado de: lambda$pause$5$androidx-camera-video-internal-encoder-EncoderImpl, motivo: nome Java inválido */
    /* sintético */ void m285x8740478b(long pauseTriggerTimeUs) {
        switch (this.mState) {
            case CONFIGURED:
            case PAUSED:
            case STOPPING:
            case PENDING_START_PAUSED:
            case ERROR:
                return;
            case STARTED:
                Logger.d(this.mTag, "Pause on " + DebugUtils.readableUs(pauseTriggerTimeUs));
                this.mActivePauseResumeTimeRanges.addLast(Range.create(Long.valueOf(pauseTriggerTimeUs), Long.MAX_VALUE));
                setState(InternalState.PAUSED);
                return;
            case PENDING_START:
                setState(InternalState.PENDING_START_PAUSED);
                return;
            case PENDING_RELEASE:
            case RELEASED:
                throw new IllegalStateException("Encoder is released");
            default:
                throw new IllegalStateException("Unknown state: " + this.mState);
        }
    }

    @Override // androidx.camera.video.internal.encoder.Encoder
    public void release() {
        this.mEncoderExecutor.execute(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda14
            @Override // java.lang.Runnable
            public final void run() {
                EncoderImpl.this.m286x9ff0bd39();
            }
        });
    }

    /* renomeado de: lambda$release$6$androidx-camera-video-internal-encoder-EncoderImpl, motivo: nome Java inválido */
    /* sintético */ void m286x9ff0bd39() {
        switch (this.mState) {
            case CONFIGURED:
            case STARTED:
            case PAUSED:
            case ERROR:
                releaseInternal();
                return;
            case STOPPING:
            case PENDING_START:
            case PENDING_START_PAUSED:
                setState(InternalState.PENDING_RELEASE);
                return;
            case PENDING_RELEASE:
            case RELEASED:
                return;
            default:
                throw new IllegalStateException("Unknown state: " + this.mState);
        }
    }

    @Override // androidx.camera.video.internal.encoder.Encoder
    public ListenableFuture<Void> getReleasedFuture() {
        return this.mReleasedFuture;
    }

    public void signalSourceStopped() {
        Logger.d(this.mTag, "signalSourceStopped");
        this.mEncoderExecutor.execute(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda16
            @Override // java.lang.Runnable
            public final void run() {
                EncoderImpl.this.m288xeb6ad495();
            }
        });
    }

    /* renomeado de: lambda$signalSourceStopped$7$androidx-camera-video-internal-encoder-EncoderImpl, motivo: nome Java inválido */
    /* sintético */ void m288xeb6ad495() {
        this.mSourceStoppedSignalled = true;
        if (this.mIsFlushedAfterEndOfStream) {
            if (!this.mCodecStopAsFlushWorkaroundEnabled) {
                Logger.d(this.mTag, "mMediaCodec.stop()");
                this.mMediaCodec.stop();
            }
            reset();
        }
    }

    private void releaseInternal() {
        Logger.d(this.mTag, "releaseInternal");
        if (this.mIsFlushedAfterEndOfStream) {
            if (!this.mCodecStopAsFlushWorkaroundEnabled) {
                Logger.d(this.mTag, "mMediaCodec.stop()");
                this.mMediaCodec.stop();
            }
            this.mIsFlushedAfterEndOfStream = false;
        }
        Logger.d(this.mTag, "mMediaCodec.release()");
        this.mMediaCodec.release();
        if (this.mEncoderInput instanceof SurfaceInput) {
            ((SurfaceInput) this.mEncoderInput).releaseSurface();
        }
        setState(InternalState.RELEASED);
        this.mReleasedCompleter.set(null);
    }

    @Override // androidx.camera.video.internal.encoder.Encoder
    public void setEncoderCallback(EncoderCallback encoderCallback, Executor executor) {
        synchronized (this.mLock) {
            this.mEncoderCallback = encoderCallback;
            this.mEncoderCallbackExecutor = executor;
        }
    }

    @Override // androidx.camera.video.internal.encoder.Encoder
    public void requestKeyFrame() {
        this.mEncoderExecutor.execute(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda15
            @Override // java.lang.Runnable
            public final void run() {
                EncoderImpl.this.m287x8e3d44c1();
            }
        });
    }

    /* renomeado de: lambda$requestKeyFrame$8$androidx-camera-video-internal-encoder-EncoderImpl, motivo: nome Java inválido */
    /* sintético */ void m287x8e3d44c1() {
        switch (this.mState) {
            case CONFIGURED:
            case PAUSED:
            case STOPPING:
            case PENDING_START:
            case PENDING_START_PAUSED:
            case ERROR:
            default:
                return;
            case STARTED:
                requestKeyFrameToMediaCodec();
                return;
            case PENDING_RELEASE:
            case RELEASED:
                throw new IllegalStateException("Encoder is released");
        }
    }

    private void setState(InternalState state) {
        if (this.mState == state) {
            return;
        }
        Logger.d(this.mTag, "Transitioning encoder internal state: " + this.mState + " --> " + state);
        this.mState = state;
    }

    void setMediaCodecPaused(boolean z) {
        Bundle bundle = new Bundle();
        bundle.putInt("drop-input-frames", z ? 1 : 0);
        Logger.d(this.mTag, "mMediaCodec.setParameters - setMediaCodecPaused: " + z);
        this.mMediaCodec.setParameters(bundle);
    }

    void requestKeyFrameToMediaCodec() {
        Bundle bundle = new Bundle();
        bundle.putInt("request-sync", 0);
        Logger.d(this.mTag, "mMediaCodec.setParameters - requestKeyFrameToMediaCodec");
        this.mMediaCodec.setParameters(bundle);
    }

    private void addSignalEosTimeoutIfNeeded() {
        if (DeviceQuirks.get(SignalEosOutputBufferNotComeQuirk.class) != null) {
            final MediaCodecCallback codecCallback = this.mMediaCodecCallback;
            final Executor executor = this.mEncoderExecutor;
            if (this.mSignalEosTimeoutFuture != null) {
                this.mSignalEosTimeoutFuture.cancel(false);
            }
            this.mSignalEosTimeoutFuture = CameraXExecutors.mainThreadExecutor().schedule(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda5
                @Override // java.lang.Runnable
                public final void run() {
                    EncoderImpl.lambda$addSignalEosTimeoutIfNeeded$9(executor, codecCallback);
                }
            }, 1000L, TimeUnit.MILLISECONDS);
        }
    }

    static /* sintético */ void lambda$addSignalEosTimeoutIfNeeded$9(Executor executor, final MediaCodecCallback codecCallback) {
        Objects.requireNonNull(codecCallback);
        executor.execute(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda6
            @Override // java.lang.Runnable
            public final void run() {
                EncoderImpl.MediaCodecCallback.this.reachEndData();
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public void signalEndOfInputStream() {
        Logger.d(this.mTag, "signalEndOfInputStream");
        Futures.addCallback(acquireInputBuffer(), new FutureCallback<InputBuffer>() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl.1
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(InputBuffer inputBuffer) {
                inputBuffer.setPresentationTimeUs(EncoderImpl.this.generatePresentationTimeUs());
                inputBuffer.setEndOfStream(true);
                inputBuffer.submit();
                Futures.addCallback(inputBuffer.getTerminationFuture(), new FutureCallback<Void>() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl.1.1
                    @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                    public void onSuccess(Void result) {
                    }

                    @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                    public void onFailure(Throwable t) {
                        if (t instanceof MediaCodec.CodecException) {
                            EncoderImpl.this.handleEncodeError((MediaCodec.CodecException) t);
                        } else {
                            EncoderImpl.this.handleEncodeError(0, t.getMessage(), t);
                        }
                    }
                }, EncoderImpl.this.mEncoderExecutor);
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
                EncoderImpl.this.handleEncodeError(0, "Unable to acquire InputBuffer.", t);
            }
        }, this.mEncoderExecutor);
    }

    void handleEncodeError(MediaCodec.CodecException e) {
        handleEncodeError(1, e.getMessage(), e);
    }

    void handleEncodeError(final int error, final String message, final Throwable throwable) {
        switch (this.mState) {
            case CONFIGURED:
                m283x818f89bf(error, message, throwable);
                reset();
                break;
            case STARTED:
            case PAUSED:
            case STOPPING:
            case PENDING_START:
            case PENDING_START_PAUSED:
            case PENDING_RELEASE:
                setState(InternalState.ERROR);
                stopMediaCodec(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda18
                    @Override // java.lang.Runnable
                    public final void run() {
                        EncoderImpl.this.m283x818f89bf(error, message, throwable);
                    }
                });
                break;
            case ERROR:
                Logger.w(this.mTag, "Get more than one error: " + message + "(" + error + ")", throwable);
                break;
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: package-private */
    /* renomeado de: notifyError, motivo: mesclado com método bridge [métodos inline] */
    public void m283x818f89bf(final int error, final String message, final Throwable throwable) {
        final EncoderCallback callback;
        Executor executor;
        synchronized (this.mLock) {
            callback = this.mEncoderCallback;
            executor = this.mEncoderCallbackExecutor;
        }
        try {
            executor.execute(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    EncoderCallback.this.onEncodeError(new EncodeException(error, message, throwable));
                }
            });
        } catch (RejectedExecutionException e) {
            Logger.e(this.mTag, "Unable to post to the supplied executor.", e);
        }
    }

    void stopMediaCodec(final Runnable afterStop) {
        Logger.d(this.mTag, "stopMediaCodec");
        final List<ListenableFuture<Void>> futures = new ArrayList<>();
        for (EncodedDataImpl dataToClose : this.mEncodedDataSet) {
            futures.add(dataToClose.getClosedFuture());
        }
        for (InputBuffer inputBuffer : this.mInputBufferSet) {
            futures.add(inputBuffer.getTerminationFuture());
        }
        if (!futures.isEmpty()) {
            Logger.d(this.mTag, "Waiting for resources to return. encoded data = " + this.mEncodedDataSet.size() + ", input buffers = " + this.mInputBufferSet.size());
        }
        Futures.successfulAsList(futures).addListener(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda17
            @Override // java.lang.Runnable
            public final void run() {
                EncoderImpl.this.m293xe1c76381(futures, afterStop);
            }
        }, this.mEncoderExecutor);
    }

    /* renomeado de: lambda$stopMediaCodec$12$androidx-camera-video-internal-encoder-EncoderImpl, motivo: nome Java inválido */
    /* sintético */ void m293xe1c76381(List futures, Runnable afterStop) {
        if (this.mState != InternalState.ERROR) {
            if (!futures.isEmpty()) {
                Logger.d(this.mTag, "encoded data and input buffers are returned");
            }
            if ((this.mEncoderInput instanceof SurfaceInput) && !this.mSourceStoppedSignalled && !hasStopCodecAfterSurfaceRemovalCrashMediaServerQuirk()) {
                if (this.mCodecStopAsFlushWorkaroundEnabled) {
                    Logger.d(this.mTag, "mMediaCodec.stop()");
                    this.mMediaCodec.stop();
                } else {
                    Logger.d(this.mTag, "mMediaCodec.flush()");
                    this.mMediaCodec.flush();
                }
                this.mIsFlushedAfterEndOfStream = true;
            } else {
                Logger.d(this.mTag, "mMediaCodec.stop()");
                this.mMediaCodec.stop();
            }
        }
        if (afterStop != null) {
            afterStop.run();
        }
        handleStopped();
    }

    void handleStopped() {
        if (this.mState == InternalState.PENDING_RELEASE) {
            releaseInternal();
            return;
        }
        InternalState oldState = this.mState;
        if (!this.mIsFlushedAfterEndOfStream) {
            reset();
        }
        setState(InternalState.CONFIGURED);
        if (oldState == InternalState.PENDING_START || oldState == InternalState.PENDING_START_PAUSED) {
            start();
            if (oldState == InternalState.PENDING_START_PAUSED) {
                pause();
            }
        }
    }

    void updateTotalPausedDuration(long bufferPresentationTimeUs) {
        while (!this.mActivePauseResumeTimeRanges.isEmpty()) {
            Range<Long> pauseRange = this.mActivePauseResumeTimeRanges.getFirst();
            if (bufferPresentationTimeUs > pauseRange.getUpper().longValue()) {
                this.mActivePauseResumeTimeRanges.removeFirst();
                this.mTotalPausedDurationUs += pauseRange.getUpper().longValue() - pauseRange.getLower().longValue();
                Logger.d(this.mTag, "Total paused duration = " + DebugUtils.readableUs(this.mTotalPausedDurationUs));
            } else {
                return;
            }
        }
    }

    long getAdjustedTimeUs(MediaCodec.BufferInfo bufferInfo) {
        if (this.mTotalPausedDurationUs > 0) {
            long adjustedTimeUs = bufferInfo.presentationTimeUs - this.mTotalPausedDurationUs;
            return adjustedTimeUs;
        }
        long adjustedTimeUs2 = bufferInfo.presentationTimeUs;
        return adjustedTimeUs2;
    }

    boolean isInPauseRange(long timeUs) {
        for (Range<Long> range : this.mActivePauseResumeTimeRanges) {
            if (range.contains((Range<Long>) Long.valueOf(timeUs))) {
                return true;
            }
            if (timeUs < range.getLower().longValue()) {
                return false;
            }
        }
        return false;
    }

    ListenableFuture<InputBuffer> acquireInputBuffer() {
        switch (this.mState) {
            case CONFIGURED:
                return Futures.immediateFailedFuture(new IllegalStateException("Encoder is not started yet."));
            case STARTED:
            case PAUSED:
            case STOPPING:
            case PENDING_START:
            case PENDING_START_PAUSED:
            case PENDING_RELEASE:
                final AtomicReference<CallbackToFutureAdapter.Completer<InputBuffer>> ref = new AtomicReference<>();
                ListenableFuture<InputBuffer> future = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda7
                    @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                    public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                        return EncoderImpl.lambda$acquireInputBuffer$13(ref, completer);
                    }
                });
                final CallbackToFutureAdapter.Completer<InputBuffer> completer = (CallbackToFutureAdapter.Completer) Preconditions.checkNotNull(ref.get());
                this.mAcquisitionQueue.offer(completer);
                completer.addCancellationListener(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda8
                    @Override // java.lang.Runnable
                    public final void run() {
                        EncoderImpl.this.m282x9b64b77f(completer);
                    }
                }, this.mEncoderExecutor);
                matchAcquisitionsAndFreeBufferIndexes();
                return future;
            case ERROR:
                return Futures.immediateFailedFuture(new IllegalStateException("Encoder is in error state."));
            case RELEASED:
                return Futures.immediateFailedFuture(new IllegalStateException("Encoder is released."));
            default:
                throw new IllegalStateException("Unknown state: " + this.mState);
        }
    }

    static /* sintético */ Object lambda$acquireInputBuffer$13(AtomicReference ref, CallbackToFutureAdapter.Completer completer) throws Exception {
        ref.set(completer);
        return "acquireInputBuffer";
    }

    /* renomeado de: lambda$acquireInputBuffer$14$androidx-camera-video-internal-encoder-EncoderImpl, motivo: nome Java inválido */
    /* sintético */ void m282x9b64b77f(CallbackToFutureAdapter.Completer completer) {
        this.mAcquisitionQueue.remove(completer);
    }

    void matchAcquisitionsAndFreeBufferIndexes() {
        while (!this.mAcquisitionQueue.isEmpty() && !this.mFreeInputBufferIndexQueue.isEmpty()) {
            CallbackToFutureAdapter.Completer<InputBuffer> completer = (CallbackToFutureAdapter.Completer) Objects.requireNonNull(this.mAcquisitionQueue.poll());
            int bufferIndex = ((Integer) Objects.requireNonNull(this.mFreeInputBufferIndexQueue.poll())).intValue();
            try {
                final InputBufferImpl inputBuffer = new InputBufferImpl(this.mMediaCodec, bufferIndex) { // da classe: androidx.camera.video.internal.encoder.EncoderImpl.2
                    @Override // androidx.camera.video.internal.encoder.InputBufferImpl, androidx.camera.video.internal.encoder.InputBuffer
                    public void setPresentationTimeUs(long presentationTimeUs) {
                        super.setPresentationTimeUs(EncoderImpl.this.mIsVideoEncoder ? presentationTimeUs : EncoderImpl.this.toPresentationTimeUsByCaptureEncodeRatio(presentationTimeUs));
                    }
                };
                if (completer.set(inputBuffer)) {
                    this.mInputBufferSet.add(inputBuffer);
                    inputBuffer.getTerminationFuture().addListener(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda9
                        @Override // java.lang.Runnable
                        public final void run() {
                            EncoderImpl.this.m284x59a2f58(inputBuffer);
                        }
                    }, this.mEncoderExecutor);
                } else {
                    inputBuffer.cancel();
                }
            } catch (MediaCodec.CodecException e) {
                handleEncodeError(e);
                return;
            }
        }
    }

    /* renomeado de: lambda$matchAcquisitionsAndFreeBufferIndexes$15$androidx-camera-video-internal-encoder-EncoderImpl, motivo: nome Java inválido */
    /* sintético */ void m284x59a2f58(InputBufferImpl inputBuffer) {
        this.mInputBufferSet.remove(inputBuffer);
    }

    long generatePresentationTimeUs() {
        return this.mTimeProvider.uptimeUs();
    }

    static boolean isKeyFrame(MediaCodec.BufferInfo bufferInfo) {
        return (bufferInfo.flags & 1) != 0;
    }

    static boolean hasEndOfStreamFlag(MediaCodec.BufferInfo bufferInfo) {
        return (bufferInfo.flags & 4) != 0;
    }

    private boolean hasStopCodecAfterSurfaceRemovalCrashMediaServerQuirk() {
        return DeviceQuirks.get(StopCodecAfterSurfaceRemovalCrashMediaServerQuirk.class) != null;
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public long toPresentationTimeUsByCaptureEncodeRatio(long systemTimeUs) {
        if (isSlowMotion()) {
            return Math.round(systemTimeUs * this.mCaptureToEncodeFrameRateRatio.doubleValue());
        }
        return systemTimeUs;
    }

    private static TimeProvider transformTimeProvider(final TimeProvider baseTimeProvider, final Function<Long, Long> transform) {
        return new TimeProvider() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl.3
            @Override // androidx.camera.video.internal.encoder.TimeProvider
            public long uptimeUs() {
                return ((Long) Function.this.apply(Long.valueOf(baseTimeProvider.uptimeUs()))).longValue();
            }

            @Override // androidx.camera.video.internal.encoder.TimeProvider
            public long realtimeUs() {
                return ((Long) Function.this.apply(Long.valueOf(baseTimeProvider.realtimeUs()))).longValue();
            }
        };
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public boolean isSlowMotion() {
        return !isRationalOne(this.mCaptureToEncodeFrameRateRatio);
    }

    private static boolean isRationalOne(Rational rational) {
        return rational != null && rational.getDenominator() == rational.getNumerator();
    }

    class MediaCodecCallback extends MediaCodec.Callback {
        private boolean mIsFirstVideoOutput;
        private boolean mReachStopTimeAsEos;
        private final VideoTimebaseConverter mVideoTimestampConverter;
        private boolean mHasSendStartCallback = false;
        private boolean mHasFirstData = false;
        private boolean mHasEndData = false;
        private long mLastPresentationTimeUs = 0;
        private long mLastSentAdjustedTimeUs = 0;
        private boolean mIsOutputBufferInPauseState = false;
        private boolean mIsKeyFrameRequired = false;
        private boolean mStopped = false;

        MediaCodecCallback() {
            this.mReachStopTimeAsEos = true;
            this.mIsFirstVideoOutput = EncoderImpl.this.mIsVideoEncoder;
            if (EncoderImpl.this.mIsVideoEncoder) {
                this.mVideoTimestampConverter = new VideoTimebaseConverter(EncoderImpl.this.mTimeProvider, EncoderImpl.this.mInputTimebase, (CameraUseInconsistentTimebaseQuirk) DeviceQuirks.get(CameraUseInconsistentTimebaseQuirk.class));
            } else {
                this.mVideoTimestampConverter = null;
            }
            CodecStuckOnFlushQuirk codecStuckOnFlushQuirk = (CodecStuckOnFlushQuirk) DeviceQuirks.get(CodecStuckOnFlushQuirk.class);
            if (codecStuckOnFlushQuirk != null && codecStuckOnFlushQuirk.isProblematicMimeType(EncoderImpl.this.mMediaFormat.getString("mime"))) {
                this.mReachStopTimeAsEos = false;
            }
        }

        @Override // android.media.MediaCodec.Callback
        public void onInputBufferAvailable(MediaCodec mediaCodec, final int index) {
            EncoderImpl.this.mEncoderExecutor.execute(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    EncoderImpl.MediaCodecCallback.this.m303xa20c30ed(index);
                }
            });
        }

        /* renomeado de: lambda$onInputBufferAvailable$0$androidx-camera-video-internal-encoder-EncoderImpl$MediaCodecCallback, motivo: nome Java inválido */
        /* sintético */ void m303xa20c30ed(int index) {
            if (this.mStopped) {
                Logger.w(EncoderImpl.this.mTag, "Receives input frame after codec is reset.");
                return;
            }
            switch (EncoderImpl.this.mState) {
                case CONFIGURED:
                case ERROR:
                case RELEASED:
                    return;
                case STARTED:
                case PAUSED:
                case STOPPING:
                case PENDING_START:
                case PENDING_START_PAUSED:
                case PENDING_RELEASE:
                    EncoderImpl.this.mFreeInputBufferIndexQueue.offer(Integer.valueOf(index));
                    EncoderImpl.this.matchAcquisitionsAndFreeBufferIndexes();
                    return;
                default:
                    throw new IllegalStateException("Unknown state: " + EncoderImpl.this.mState);
            }
        }

        @Override // android.media.MediaCodec.Callback
        public void onOutputBufferAvailable(final MediaCodec mediaCodec, final int index, final MediaCodec.BufferInfo bufferInfo) {
            EncoderImpl.this.mEncoderExecutor.execute(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda2
                @Override // java.lang.Runnable
                public final void run() {
                    EncoderImpl.MediaCodecCallback.this.m304xbb0c589f(bufferInfo, mediaCodec, index);
                }
            });
        }

        /* renomeado de: lambda$onOutputBufferAvailable$1$androidx-camera-video-internal-encoder-EncoderImpl$MediaCodecCallback, motivo: nome Java inválido */
        /* sintético */ void m304xbb0c589f(MediaCodec.BufferInfo bufferInfo, MediaCodec mediaCodec, int index) {
            final EncoderCallback encoderCallback;
            Executor executor;
            if (this.mStopped) {
                Logger.w(EncoderImpl.this.mTag, "Receives frame after codec is reset.");
                return;
            }
            switch (EncoderImpl.this.mState) {
                case CONFIGURED:
                case ERROR:
                case RELEASED:
                    return;
                case STARTED:
                case PAUSED:
                case STOPPING:
                case PENDING_START:
                case PENDING_START_PAUSED:
                case PENDING_RELEASE:
                    synchronized (EncoderImpl.this.mLock) {
                        encoderCallback = EncoderImpl.this.mEncoderCallback;
                        executor = EncoderImpl.this.mEncoderCallbackExecutor;
                    }
                    if (EncoderImpl.this.mIsVideoEncoder && EncoderImpl.this.isSlowMotion()) {
                        bufferInfo.presentationTimeUs = EncoderImpl.this.toPresentationTimeUsByCaptureEncodeRatio(bufferInfo.presentationTimeUs);
                    }
                    if (!this.mHasSendStartCallback) {
                        this.mHasSendStartCallback = true;
                        try {
                            Objects.requireNonNull(encoderCallback);
                            executor.execute(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda4
                                @Override // java.lang.Runnable
                                public final void run() {
                                    EncoderCallback.this.onEncodeStart();
                                }
                            });
                        } catch (RejectedExecutionException e) {
                            Logger.e(EncoderImpl.this.mTag, "Unable to post to the supplied executor.", e);
                        }
                    }
                    if (checkBufferInfo(bufferInfo)) {
                        if (!this.mHasFirstData) {
                            this.mHasFirstData = true;
                            Logger.d(EncoderImpl.this.mTag, "data timestampUs = " + bufferInfo.presentationTimeUs + ", data timebase = " + EncoderImpl.this.mInputTimebase + ", current system uptimeMs = " + SystemClock.uptimeMillis() + ", current system realtimeMs = " + SystemClock.elapsedRealtime());
                        }
                        MediaCodec.BufferInfo outBufferInfo = resolveOutputBufferInfo(bufferInfo);
                        this.mLastSentAdjustedTimeUs = outBufferInfo.presentationTimeUs;
                        try {
                            EncodedDataImpl encodedData = new EncodedDataImpl(mediaCodec, index, outBufferInfo);
                            sendEncodedData(encodedData, encoderCallback, executor);
                        } catch (MediaCodec.CodecException e2) {
                            EncoderImpl.this.handleEncodeError(e2);
                            return;
                        }
                    } else {
                        try {
                            EncoderImpl.this.mMediaCodec.releaseOutputBuffer(index, false);
                        } catch (MediaCodec.CodecException e3) {
                            EncoderImpl.this.handleEncodeError(e3);
                            return;
                        }
                    }
                    if (!this.mHasEndData && isEndOfStream(bufferInfo)) {
                        reachEndData();
                    }
                    if (this.mIsFirstVideoOutput) {
                        this.mIsFirstVideoOutput = false;
                        return;
                    }
                    return;
                default:
                    throw new IllegalStateException("Unknown state: " + EncoderImpl.this.mState);
            }
        }

        void reachEndData() {
            final EncoderCallback encoderCallback;
            final Executor executor;
            Logger.d(EncoderImpl.this.mTag, "reachEndData");
            if (this.mHasEndData) {
                return;
            }
            this.mHasEndData = true;
            if (EncoderImpl.this.mSignalEosTimeoutFuture != null) {
                EncoderImpl.this.mSignalEosTimeoutFuture.cancel(false);
                EncoderImpl.this.mSignalEosTimeoutFuture = null;
            }
            synchronized (EncoderImpl.this.mLock) {
                encoderCallback = EncoderImpl.this.mEncoderCallback;
                executor = EncoderImpl.this.mEncoderCallbackExecutor;
            }
            EncoderImpl.this.stopMediaCodec(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda5
                @Override // java.lang.Runnable
                public final void run() {
                    EncoderImpl.MediaCodecCallback.this.m306x24be0c23(executor, encoderCallback);
                }
            });
        }

        /* renomeado de: lambda$reachEndData$2$androidx-camera-video-internal-encoder-EncoderImpl$MediaCodecCallback, motivo: nome Java inválido */
        /* sintético */ void m306x24be0c23(Executor executor, final EncoderCallback encoderCallback) {
            if (EncoderImpl.this.mState == InternalState.ERROR) {
                return;
            }
            try {
                Objects.requireNonNull(encoderCallback);
                executor.execute(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda3
                    @Override // java.lang.Runnable
                    public final void run() {
                        EncoderCallback.this.onEncodeStop();
                    }
                });
            } catch (RejectedExecutionException e) {
                Logger.e(EncoderImpl.this.mTag, "Unable to post to the supplied executor.", e);
            }
        }

        private MediaCodec.BufferInfo resolveOutputBufferInfo(MediaCodec.BufferInfo bufferInfo) {
            long adjustedTimeUs = EncoderImpl.this.getAdjustedTimeUs(bufferInfo);
            if (bufferInfo.presentationTimeUs == adjustedTimeUs) {
                return bufferInfo;
            }
            Preconditions.checkState(adjustedTimeUs > this.mLastSentAdjustedTimeUs);
            MediaCodec.BufferInfo newBufferInfo = new MediaCodec.BufferInfo();
            newBufferInfo.set(bufferInfo.offset, bufferInfo.size, adjustedTimeUs, bufferInfo.flags);
            return newBufferInfo;
        }

        private void sendEncodedData(final EncodedDataImpl encodedData, final EncoderCallback callback, Executor executor) {
            EncoderImpl.this.mEncodedDataSet.add(encodedData);
            Futures.addCallback(encodedData.getClosedFuture(), new FutureCallback<Void>() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl.MediaCodecCallback.1
                @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                public void onSuccess(Void result) {
                    EncoderImpl.this.mEncodedDataSet.remove(encodedData);
                }

                @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                public void onFailure(Throwable t) {
                    EncoderImpl.this.mEncodedDataSet.remove(encodedData);
                    if (t instanceof MediaCodec.CodecException) {
                        EncoderImpl.this.handleEncodeError((MediaCodec.CodecException) t);
                    } else {
                        EncoderImpl.this.handleEncodeError(0, t.getMessage(), t);
                    }
                }
            }, EncoderImpl.this.mEncoderExecutor);
            try {
                executor.execute(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda6
                    @Override // java.lang.Runnable
                    public final void run() {
                        EncoderCallback.this.onEncodedData(encodedData);
                    }
                });
            } catch (RejectedExecutionException e) {
                Logger.e(EncoderImpl.this.mTag, "Unable to post to the supplied executor.", e);
                encodedData.close();
            }
        }

        private boolean checkBufferInfo(MediaCodec.BufferInfo bufferInfo) {
            if (this.mHasEndData) {
                Logger.d(EncoderImpl.this.mTag, "Drop buffer by already reach end of stream.");
                return false;
            }
            if (bufferInfo.size <= 0) {
                Logger.d(EncoderImpl.this.mTag, "Drop buffer by invalid buffer size.");
                return false;
            }
            if ((bufferInfo.flags & 2) != 0) {
                Logger.d(EncoderImpl.this.mTag, "Drop buffer by codec config.");
                return false;
            }
            if (this.mVideoTimestampConverter != null) {
                bufferInfo.presentationTimeUs = this.mVideoTimestampConverter.convertToUptimeUs(bufferInfo.presentationTimeUs);
            }
            if (bufferInfo.presentationTimeUs <= this.mLastPresentationTimeUs) {
                Logger.d(EncoderImpl.this.mTag, "Drop buffer by out of order buffer from MediaCodec.");
                return false;
            }
            this.mLastPresentationTimeUs = bufferInfo.presentationTimeUs;
            if (!EncoderImpl.this.mStartStopTimeRangeUs.contains((Range<Long>) Long.valueOf(bufferInfo.presentationTimeUs))) {
                Logger.d(EncoderImpl.this.mTag, "Drop buffer by not in start-stop range.");
                if (EncoderImpl.this.mPendingCodecStop && bufferInfo.presentationTimeUs >= EncoderImpl.this.mStartStopTimeRangeUs.getUpper().longValue()) {
                    if (EncoderImpl.this.mStopTimeoutFuture != null) {
                        EncoderImpl.this.mStopTimeoutFuture.cancel(true);
                    }
                    EncoderImpl.this.mLastDataStopTimestamp = Long.valueOf(bufferInfo.presentationTimeUs);
                    EncoderImpl.this.signalCodecStop();
                    EncoderImpl.this.mPendingCodecStop = false;
                }
                return false;
            }
            if (updatePauseRangeStateAndCheckIfBufferPaused(bufferInfo)) {
                Logger.d(EncoderImpl.this.mTag, "Drop buffer by pause.");
                return false;
            }
            if (EncoderImpl.this.getAdjustedTimeUs(bufferInfo) <= this.mLastSentAdjustedTimeUs) {
                Logger.d(EncoderImpl.this.mTag, "Drop buffer by adjusted time is less than the last sent time.");
                if (EncoderImpl.this.mIsVideoEncoder && EncoderImpl.isKeyFrame(bufferInfo)) {
                    this.mIsKeyFrameRequired = true;
                }
                return false;
            }
            if (!this.mHasFirstData && !this.mIsKeyFrameRequired && EncoderImpl.this.mIsVideoEncoder) {
                this.mIsKeyFrameRequired = true;
            }
            if (this.mIsKeyFrameRequired) {
                if (!EncoderImpl.isKeyFrame(bufferInfo)) {
                    Logger.d(EncoderImpl.this.mTag, "Drop buffer by not a key frame.");
                    EncoderImpl.this.requestKeyFrameToMediaCodec();
                    return false;
                }
                this.mIsKeyFrameRequired = false;
            }
            return true;
        }

        private boolean isEndOfStream(MediaCodec.BufferInfo bufferInfo) {
            return (EncoderImpl.hasEndOfStreamFlag(bufferInfo) && !shouldSkipPrematureEos()) || (this.mReachStopTimeAsEos && isEosSignalledAndStopTimeReached(bufferInfo));
        }

        private boolean shouldSkipPrematureEos() {
            return this.mIsFirstVideoOutput && DeviceQuirks.get(PrematureEndOfStreamVideoQuirk.class) != null;
        }

        private boolean isEosSignalledAndStopTimeReached(MediaCodec.BufferInfo bufferInfo) {
            return EncoderImpl.this.mMediaCodecEosSignalled && bufferInfo.presentationTimeUs > EncoderImpl.this.mStartStopTimeRangeUs.getUpper().longValue();
        }

        private boolean updatePauseRangeStateAndCheckIfBufferPaused(MediaCodec.BufferInfo bufferInfo) {
            Executor executor;
            final EncoderCallback encoderCallback;
            EncoderImpl.this.updateTotalPausedDuration(bufferInfo.presentationTimeUs);
            boolean isInPauseRange = EncoderImpl.this.isInPauseRange(bufferInfo.presentationTimeUs);
            if (!this.mIsOutputBufferInPauseState && isInPauseRange) {
                Logger.d(EncoderImpl.this.mTag, "Switch to pause state");
                this.mIsOutputBufferInPauseState = true;
                synchronized (EncoderImpl.this.mLock) {
                    executor = EncoderImpl.this.mEncoderCallbackExecutor;
                    encoderCallback = EncoderImpl.this.mEncoderCallback;
                }
                Objects.requireNonNull(encoderCallback);
                executor.execute(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda9
                    @Override // java.lang.Runnable
                    public final void run() {
                        EncoderCallback.this.onEncodePaused();
                    }
                });
                if (EncoderImpl.this.mState == InternalState.PAUSED && ((EncoderImpl.this.mIsVideoEncoder || DeviceQuirks.get(AudioEncoderIgnoresInputTimestampQuirk.class) == null) && (!EncoderImpl.this.mIsVideoEncoder || DeviceQuirks.get(VideoEncoderSuspendDoesNotIncludeSuspendTimeQuirk.class) == null))) {
                    if (EncoderImpl.this.mEncoderInput instanceof ByteBufferInput) {
                        ((ByteBufferInput) EncoderImpl.this.mEncoderInput).setActive(false);
                    }
                    EncoderImpl.this.setMediaCodecPaused(true);
                }
                EncoderImpl.this.mLastDataStopTimestamp = Long.valueOf(bufferInfo.presentationTimeUs);
                if (EncoderImpl.this.mPendingCodecStop) {
                    if (EncoderImpl.this.mStopTimeoutFuture != null) {
                        EncoderImpl.this.mStopTimeoutFuture.cancel(true);
                    }
                    EncoderImpl.this.signalCodecStop();
                    EncoderImpl.this.mPendingCodecStop = false;
                }
            } else if (this.mIsOutputBufferInPauseState && !isInPauseRange) {
                Logger.d(EncoderImpl.this.mTag, "Switch to resume state");
                this.mIsOutputBufferInPauseState = false;
                if (EncoderImpl.this.mIsVideoEncoder && !EncoderImpl.isKeyFrame(bufferInfo)) {
                    this.mIsKeyFrameRequired = true;
                }
            }
            return this.mIsOutputBufferInPauseState;
        }

        @Override // android.media.MediaCodec.Callback
        public void onError(MediaCodec mediaCodec, final MediaCodec.CodecException e) {
            EncoderImpl.this.mEncoderExecutor.execute(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda10
                @Override // java.lang.Runnable
                public final void run() {
                    EncoderImpl.MediaCodecCallback.this.m302x7242b142(e);
                }
            });
        }

        /* renomeado de: lambda$onError$4$androidx-camera-video-internal-encoder-EncoderImpl$MediaCodecCallback, motivo: nome Java inválido */
        /* sintético */ void m302x7242b142(MediaCodec.CodecException e) {
            switch (EncoderImpl.this.mState) {
                case CONFIGURED:
                case ERROR:
                case RELEASED:
                    return;
                case STARTED:
                case PAUSED:
                case STOPPING:
                case PENDING_START:
                case PENDING_START_PAUSED:
                case PENDING_RELEASE:
                    EncoderImpl.this.handleEncodeError(e);
                    return;
                default:
                    throw new IllegalStateException("Unknown state: " + EncoderImpl.this.mState);
            }
        }

        @Override // android.media.MediaCodec.Callback
        public void onOutputFormatChanged(MediaCodec mediaCodec, final MediaFormat mediaFormat) {
            Logger.d(EncoderImpl.this.mTag, "onOutputFormatChanged: mediaFormat = " + mediaFormat + ", CSD data = " + DebugUtils.getCsdHex(mediaFormat));
            EncoderImpl.this.mEncoderExecutor.execute(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    EncoderImpl.MediaCodecCallback.this.m305xd741dd39(mediaFormat);
                }
            });
        }

        /* renomeado de: lambda$onOutputFormatChanged$7$androidx-camera-video-internal-encoder-EncoderImpl$MediaCodecCallback, motivo: nome Java inválido */
        /* sintético */ void m305xd741dd39(final MediaFormat mediaFormat) {
            final EncoderCallback encoderCallback;
            Executor executor;
            if (this.mStopped) {
                Logger.w(EncoderImpl.this.mTag, "Receives onOutputFormatChanged after codec is reset.");
                return;
            }
            switch (EncoderImpl.this.mState) {
                case CONFIGURED:
                case ERROR:
                case RELEASED:
                    return;
                case STARTED:
                case PAUSED:
                case STOPPING:
                case PENDING_START:
                case PENDING_START_PAUSED:
                case PENDING_RELEASE:
                    if (EncoderImpl.this.mIsVideoEncoder && EncoderImpl.this.isSlowMotion()) {
                        mediaFormat.setInteger(EncoderImpl.PARAMETER_KEY_TIMELAPSE_ENABLED, 1);
                        mediaFormat.setInteger(EncoderImpl.PARAMETER_KEY_TIMELAPSE_FPS, ((VideoEncoderConfig) EncoderImpl.this.mEncoderConfig).getCaptureFrameRate());
                    }
                    synchronized (EncoderImpl.this.mLock) {
                        encoderCallback = EncoderImpl.this.mEncoderCallback;
                        executor = EncoderImpl.this.mEncoderCallbackExecutor;
                    }
                    try {
                        executor.execute(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda8
                            @Override // java.lang.Runnable
                            public final void run() {
                                EncoderCallback.this.onOutputConfigUpdate(new OutputConfig() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda7
                                    @Override // androidx.camera.video.internal.encoder.OutputConfig
                                    public final MediaFormat getMediaFormat() {
                                        return EncoderImpl.MediaCodecCallback.lambda$onOutputFormatChanged$5(r1);
                                    }
                                });
                            }
                        });
                        return;
                    } catch (RejectedExecutionException e) {
                        Logger.e(EncoderImpl.this.mTag, "Unable to post to the supplied executor.", e);
                        return;
                    }
                default:
                    throw new IllegalStateException("Unknown state: " + EncoderImpl.this.mState);
            }
        }

        static /* sintético */ MediaFormat lambda$onOutputFormatChanged$5(MediaFormat mediaFormat) {
            return mediaFormat;
        }

        void stop() {
            this.mStopped = true;
        }
    }

    class SurfaceInput implements Encoder.SurfaceInput {
        private final Object mLock = new Object();
        private final Set<Surface> mObsoleteSurfaces = new HashSet();
        private Surface mSurface;
        private Executor mSurfaceUpdateExecutor;
        private Encoder.SurfaceInput.OnSurfaceUpdateListener mSurfaceUpdateListener;

        SurfaceInput() {
        }

        @Override // androidx.camera.video.internal.encoder.Encoder.SurfaceInput
        public void setOnSurfaceUpdateListener(Executor executor, Encoder.SurfaceInput.OnSurfaceUpdateListener listener) {
            Surface surface;
            synchronized (this.mLock) {
                this.mSurfaceUpdateListener = (Encoder.SurfaceInput.OnSurfaceUpdateListener) Preconditions.checkNotNull(listener);
                this.mSurfaceUpdateExecutor = (Executor) Preconditions.checkNotNull(executor);
                surface = this.mSurface;
            }
            if (surface != null) {
                notifySurfaceUpdate(executor, listener, surface);
            }
        }

        void resetSurface() {
            Surface surface;
            Encoder.SurfaceInput.OnSurfaceUpdateListener listener;
            Executor executor;
            EncoderNotUsePersistentInputSurfaceQuirk quirk = (EncoderNotUsePersistentInputSurfaceQuirk) DeviceQuirks.get(EncoderNotUsePersistentInputSurfaceQuirk.class);
            synchronized (this.mLock) {
                if (quirk == null) {
                    if (this.mSurface == null) {
                        this.mSurface = Api23Impl.createPersistentInputSurface();
                        surface = this.mSurface;
                    } else {
                        surface = null;
                    }
                    Api23Impl.setInputSurface(EncoderImpl.this.mMediaCodec, this.mSurface);
                } else {
                    Surface surface2 = this.mSurface;
                    if (surface2 != null) {
                        this.mObsoleteSurfaces.add(this.mSurface);
                    }
                    this.mSurface = EncoderImpl.this.mMediaCodec.createInputSurface();
                    surface = this.mSurface;
                }
                listener = this.mSurfaceUpdateListener;
                executor = this.mSurfaceUpdateExecutor;
            }
            if (surface != null && listener != null && executor != null) {
                notifySurfaceUpdate(executor, listener, surface);
            }
        }

        void releaseSurface() {
            Surface surface;
            Set<Surface> obsoleteSurfaces;
            synchronized (this.mLock) {
                surface = this.mSurface;
                this.mSurface = null;
                obsoleteSurfaces = new HashSet<>(this.mObsoleteSurfaces);
                this.mObsoleteSurfaces.clear();
            }
            if (surface != null) {
                surface.release();
            }
            for (Surface obsoleteSurface : obsoleteSurfaces) {
                obsoleteSurface.release();
            }
        }

        private void notifySurfaceUpdate(Executor executor, final Encoder.SurfaceInput.OnSurfaceUpdateListener listener, final Surface surface) {
            try {
                executor.execute(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$SurfaceInput$$ExternalSyntheticLambda0
                    @Override // java.lang.Runnable
                    public final void run() {
                        Encoder.SurfaceInput.OnSurfaceUpdateListener.this.onSurfaceUpdate(surface);
                    }
                });
            } catch (RejectedExecutionException e) {
                Logger.e(EncoderImpl.this.mTag, "Unable to post to the supplied executor.", e);
            }
        }
    }

    class ByteBufferInput implements Encoder.ByteBufferInput {
        private final Map<Observable.Observer<? super BufferProvider.State>, Executor> mStateObservers = new LinkedHashMap();
        private BufferProvider.State mBufferProviderState = BufferProvider.State.INACTIVE;
        private final List<ListenableFuture<InputBuffer>> mAcquisitionList = new ArrayList();

        ByteBufferInput() {
        }

        @Override // androidx.camera.core.impl.Observable
        public ListenableFuture<BufferProvider.State> fetchData() {
            return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$ByteBufferInput$$ExternalSyntheticLambda1
                @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                    return EncoderImpl.ByteBufferInput.this.m300xdbdcf33f(completer);
                }
            });
        }

        /* renomeado de: lambda$fetchData$0$androidx-camera-video-internal-encoder-EncoderImpl$ByteBufferInput, motivo: nome Java inválido */
        /* sintético */ void m299x3f6ef6e0(CallbackToFutureAdapter.Completer completer) {
            completer.set(this.mBufferProviderState);
        }

        /* renomeado de: lambda$fetchData$1$androidx-camera-video-internal-encoder-EncoderImpl$ByteBufferInput, motivo: nome Java inválido */
        /* sintético */ Object m300xdbdcf33f(final CallbackToFutureAdapter.Completer completer) throws Exception {
            EncoderImpl.this.mEncoderExecutor.execute(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$ByteBufferInput$$ExternalSyntheticLambda4
                @Override // java.lang.Runnable
                public final void run() {
                    EncoderImpl.ByteBufferInput.this.m299x3f6ef6e0(completer);
                }
            });
            return "fetchData";
        }

        @Override // androidx.camera.video.internal.BufferProvider
        public ListenableFuture<InputBuffer> acquireBuffer() {
            return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$ByteBufferInput$$ExternalSyntheticLambda2
                @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                    return EncoderImpl.ByteBufferInput.this.m297xc1b33249(completer);
                }
            });
        }

        /* renomeado de: lambda$acquireBuffer$5$androidx-camera-video-internal-encoder-EncoderImpl$ByteBufferInput, motivo: nome Java inválido */
        /* sintético */ Object m297xc1b33249(final CallbackToFutureAdapter.Completer completer) throws Exception {
            EncoderImpl.this.mEncoderExecutor.execute(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$ByteBufferInput$$ExternalSyntheticLambda3
                @Override // java.lang.Runnable
                public final void run() {
                    EncoderImpl.ByteBufferInput.this.m296x254535ea(completer);
                }
            });
            return "acquireBuffer";
        }

        /* renomeado de: lambda$acquireBuffer$4$androidx-camera-video-internal-encoder-EncoderImpl$ByteBufferInput, motivo: nome Java inválido */
        /* sintético */ void m296x254535ea(CallbackToFutureAdapter.Completer completer) {
            if (this.mBufferProviderState != BufferProvider.State.ACTIVE) {
                if (this.mBufferProviderState == BufferProvider.State.INACTIVE) {
                    completer.setException(new IllegalStateException("BufferProvider is not active."));
                    return;
                } else {
                    completer.setException(new IllegalStateException("Unknown state: " + this.mBufferProviderState));
                    return;
                }
            }
            final ListenableFuture<InputBuffer> future = EncoderImpl.this.acquireInputBuffer();
            Futures.propagate(future, completer);
            completer.addCancellationListener(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$ByteBufferInput$$ExternalSyntheticLambda5
                @Override // java.lang.Runnable
                public final void run() {
                    EncoderImpl.ByteBufferInput.this.m294xec693d2c(future);
                }
            }, CameraXExecutors.directExecutor());
            this.mAcquisitionList.add(future);
            future.addListener(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$ByteBufferInput$$ExternalSyntheticLambda6
                @Override // java.lang.Runnable
                public final void run() {
                    EncoderImpl.ByteBufferInput.this.m295x88d7398b(future);
                }
            }, EncoderImpl.this.mEncoderExecutor);
        }

        /* renomeado de: lambda$acquireBuffer$3$androidx-camera-video-internal-encoder-EncoderImpl$ByteBufferInput, motivo: nome Java inválido */
        /* sintético */ void m295x88d7398b(ListenableFuture future) {
            this.mAcquisitionList.remove(future);
        }

        /* JADX INFO: modificadores de acesso alterados de: private */
        /* renomeado de: cancelInputBuffer, motivo: mesclado com método bridge [métodos inline] */
        public void m294xec693d2c(ListenableFuture<InputBuffer> inputBufferFuture) {
            if (!inputBufferFuture.cancel(true)) {
                Preconditions.checkState(inputBufferFuture.isDone());
                try {
                    inputBufferFuture.get().cancel();
                } catch (InterruptedException | CancellationException | ExecutionException e) {
                    Logger.w(EncoderImpl.this.mTag, "Unable to cancel the input buffer: " + e);
                }
            }
        }

        @Override // androidx.camera.core.impl.Observable
        public void addObserver(final Executor executor, final Observable.Observer<? super BufferProvider.State> observer) {
            EncoderImpl.this.mEncoderExecutor.execute(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$ByteBufferInput$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    EncoderImpl.ByteBufferInput.this.m298x11117d06(observer, executor);
                }
            });
        }

        /* renomeado de: lambda$addObserver$7$androidx-camera-video-internal-encoder-EncoderImpl$ByteBufferInput, motivo: nome Java inválido */
        /* sintético */ void m298x11117d06(final Observable.Observer observer, Executor executor) {
            this.mStateObservers.put((Observable.Observer) Preconditions.checkNotNull(observer), (Executor) Preconditions.checkNotNull(executor));
            final BufferProvider.State state = this.mBufferProviderState;
            executor.execute(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$ByteBufferInput$$ExternalSyntheticLambda8
                @Override // java.lang.Runnable
                public final void run() {
                    Observable.Observer.this.onNewData(state);
                }
            });
        }

        @Override // androidx.camera.core.impl.Observable
        public void removeObserver(final Observable.Observer<? super BufferProvider.State> observer) {
            EncoderImpl.this.mEncoderExecutor.execute(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$ByteBufferInput$$ExternalSyntheticLambda9
                @Override // java.lang.Runnable
                public final void run() {
                    EncoderImpl.ByteBufferInput.this.m301x87db4ec8(observer);
                }
            });
        }

        /* renomeado de: lambda$removeObserver$8$androidx-camera-video-internal-encoder-EncoderImpl$ByteBufferInput, motivo: nome Java inválido */
        /* sintético */ void m301x87db4ec8(Observable.Observer observer) {
            this.mStateObservers.remove(Preconditions.checkNotNull(observer));
        }

        void setActive(boolean isActive) {
            final BufferProvider.State newState = isActive ? BufferProvider.State.ACTIVE : BufferProvider.State.INACTIVE;
            if (this.mBufferProviderState == newState) {
                return;
            }
            this.mBufferProviderState = newState;
            if (newState == BufferProvider.State.INACTIVE) {
                for (ListenableFuture<InputBuffer> future : this.mAcquisitionList) {
                    future.cancel(true);
                }
                this.mAcquisitionList.clear();
            }
            for (final Map.Entry<Observable.Observer<? super BufferProvider.State>, Executor> entry : this.mStateObservers.entrySet()) {
                try {
                    entry.getValue().execute(new Runnable() { // da classe: androidx.camera.video.internal.encoder.EncoderImpl$ByteBufferInput$$ExternalSyntheticLambda7
                        @Override // java.lang.Runnable
                        public final void run() {
                            ((Observable.Observer) entry.getKey()).onNewData(newState);
                        }
                    });
                } catch (RejectedExecutionException e) {
                    Logger.e(EncoderImpl.this.mTag, "Unable to post to the supplied executor.", e);
                }
            }
        }
    }

    private static class Api23Impl {
        private Api23Impl() {
        }

        static Surface createPersistentInputSurface() {
            return MediaCodec.createPersistentInputSurface();
        }

        static void setInputSurface(MediaCodec mediaCodec, Surface surface) {
            mediaCodec.setInputSurface(surface);
        }
    }
}
