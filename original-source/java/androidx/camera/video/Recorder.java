package androidx.camera.video;

import android.content.ContentValues;
import android.content.Context;
import android.location.Location;
import android.media.MediaMuxer;
import android.media.MediaScannerConnection;
import android.net.Uri;
import android.os.Build;
import android.os.ParcelFileDescriptor;
import android.util.Pair;
import android.util.Range;
import android.util.Rational;
import android.util.Size;
import android.view.Surface;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.Logger;
import androidx.camera.core.SurfaceRequest;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.MutableStateObservable;
import androidx.camera.core.impl.Observable;
import androidx.camera.core.impl.StateObservable;
import androidx.camera.core.impl.Timebase;
import androidx.camera.core.impl.utils.CloseGuardHelper;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.core.internal.utils.ArrayRingBuffer;
import androidx.camera.core.internal.utils.RingBuffer;
import androidx.camera.video.AudioSpec;
import androidx.camera.video.MediaSpec;
import androidx.camera.video.Recorder;
import androidx.camera.video.StreamInfo;
import androidx.camera.video.VideoOutput;
import androidx.camera.video.VideoRecordEvent;
import androidx.camera.video.VideoSpec;
import androidx.camera.video.internal.DebugUtils;
import androidx.camera.video.internal.OutputStorage;
import androidx.camera.video.internal.OutputStorageImpl;
import androidx.camera.video.internal.VideoValidatedEncoderProfilesProxy;
import androidx.camera.video.internal.audio.AudioSettings;
import androidx.camera.video.internal.audio.AudioSource;
import androidx.camera.video.internal.audio.AudioSourceAccessException;
import androidx.camera.video.internal.compat.Api26Impl;
import androidx.camera.video.internal.compat.quirk.DeactivateEncoderSurfaceBeforeStopEncoderQuirk;
import androidx.camera.video.internal.compat.quirk.DeviceQuirks;
import androidx.camera.video.internal.compat.quirk.EncoderNotUsePersistentInputSurfaceQuirk;
import androidx.camera.video.internal.config.AudioConfigUtil;
import androidx.camera.video.internal.config.AudioMimeInfo;
import androidx.camera.video.internal.config.VideoConfigUtil;
import androidx.camera.video.internal.config.VideoMimeInfo;
import androidx.camera.video.internal.encoder.AudioEncoderConfig;
import androidx.camera.video.internal.encoder.BufferCopiedEncodedData;
import androidx.camera.video.internal.encoder.EncodeException;
import androidx.camera.video.internal.encoder.EncodedData;
import androidx.camera.video.internal.encoder.Encoder;
import androidx.camera.video.internal.encoder.EncoderCallback;
import androidx.camera.video.internal.encoder.EncoderConfig;
import androidx.camera.video.internal.encoder.EncoderFactory;
import androidx.camera.video.internal.encoder.EncoderImpl;
import androidx.camera.video.internal.encoder.InvalidConfigException;
import androidx.camera.video.internal.encoder.OutputConfig;
import androidx.camera.video.internal.encoder.VideoEncoderConfig;
import androidx.camera.video.internal.encoder.VideoEncoderInfo;
import androidx.camera.video.internal.encoder.VideoEncoderInfoImpl;
import androidx.camera.video.internal.utils.OutputUtil;
import androidx.camera.video.internal.utils.StorageUtil;
import androidx.camera.video.internal.workaround.CorrectNegativeLatLongForMediaMuxer;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Consumer;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import j$.util.DesugarCollections;
import j$.util.Objects;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes.dex */
public final class Recorder implements VideoOutput {
    private static final int AUDIO_CACHE_SIZE = 60;
    private static final String INSUFFICIENT_STORAGE_ERROR_MSG = "Insufficient storage space. The available storage (%d bytes) is below the required threshold of %d bytes.";
    private static final String MEDIA_COLUMN = "_data";
    private static final int NOT_PENDING = 0;
    private static final int PENDING = 1;
    private static final long REQUIRED_FREE_STORAGE_DEFAULT_BYTES = 52428800;
    private static final long REQUIRED_FREE_STORAGE_UNSET = -1;
    private static final long RETRY_SETUP_VIDEO_DELAY_MS = 1000;
    private static final int RETRY_SETUP_VIDEO_MAX_COUNT = 3;
    private static final long SOURCE_NON_STREAMING_TIMEOUT_MS = 1000;
    private static final String TAG = "Recorder";
    public static final int VIDEO_CAPABILITIES_SOURCE_CAMCORDER_PROFILE = 0;
    public static final int VIDEO_CAPABILITIES_SOURCE_CODEC_CAPABILITIES = 1;
    static final int VIDEO_RECORDING_TYPE_HIGH_SPEED = 2;
    static final int VIDEO_RECORDING_TYPE_REGULAR = 1;
    RecordingRecord mActiveRecordingRecord;
    Surface mActiveSurface;
    double mAudioAmplitude;
    Encoder mAudioEncoder;
    private final EncoderFactory mAudioEncoderFactory;
    Throwable mAudioErrorCause;
    OutputConfig mAudioOutputConfig;
    AudioSource mAudioSource;
    AudioState mAudioState;
    Integer mAudioTrackIndex;
    private long mAvailableBytesAboveRequired;
    long mDurationLimitNs;
    private final boolean mEncoderNotUsePersistentInputSurface;
    final List<ListenableFuture<Void>> mEncodingFutures;
    private final Executor mExecutor;
    long mFileSizeLimitInBytes;
    long mFirstRecordingAudioDataTimeUs;
    int mFirstRecordingVideoBitrate;
    long mFirstRecordingVideoDataTimeUs;
    private boolean mHasGlProcessing;
    RecordingRecord mInProgressRecording;
    boolean mInProgressRecordingStopping;
    private SurfaceRequest.TransformationInfo mInProgressTransformationInfo;
    boolean mIsAudioSourceSilenced;
    private final MutableStateObservable<Boolean> mIsRecording;
    private long mLastGeneratedRecordingId;
    Surface mLatestSurface;
    SurfaceRequest mLatestSurfaceRequest;
    private final Object mLock = new Object();
    MediaMuxer mMediaMuxer;
    final MutableStateObservable<MediaSpec> mMediaSpec;
    private boolean mNeedsResetBeforeNextStart;
    private State mNonPendingState;
    private OutputStorage mOutputStorage;
    private final OutputStorage.Factory mOutputStorageFactory;
    Uri mOutputUri;
    final RingBuffer<EncodedData> mPendingAudioRingBuffer;
    EncodedData mPendingFirstVideoData;
    RecordingRecord mPendingRecordingRecord;
    long mPreviousRecordingAudioDataTimeUs;
    long mPreviousRecordingVideoDataTimeUs;
    long mRecordingAudioBytes;
    long mRecordingBytes;
    long mRecordingDurationNs;
    int mRecordingStopError;
    Throwable mRecordingStopErrorCause;
    private final long mRequiredFreeStorageBytes;
    private VideoValidatedEncoderProfilesProxy mResolvedEncoderProfiles;
    final Executor mSequentialExecutor;
    private SetupVideoTask mSetupVideoTask;
    private boolean mShouldSendResumeEvent;
    ScheduledFuture<?> mSourceNonStreamingTimeout;
    VideoOutput.SourceState mSourceState;
    private SurfaceRequest.TransformationInfo mSourceTransformationInfo;
    private State mState;
    int mStreamId;
    private final MutableStateObservable<StreamInfo> mStreamInfo;
    private final Executor mUserProvidedExecutor;
    private final int mVideoCapabilitiesSource;
    Encoder mVideoEncoder;
    private final MutableStateObservable<Range<Integer>> mVideoEncoderBitrateRange;
    private VideoEncoderConfig mVideoEncoderConfig;
    private final EncoderFactory mVideoEncoderFactory;
    VideoEncoderSession mVideoEncoderSession;
    VideoEncoderSession mVideoEncoderSessionToRelease;
    OutputConfig mVideoOutputConfig;
    Timebase mVideoSourceTimebase;
    Integer mVideoTrackIndex;
    private static final Set<State> PENDING_STATES = DesugarCollections.unmodifiableSet(EnumSet.of(State.PENDING_RECORDING, State.PENDING_PAUSED));
    private static final Set<State> VALID_NON_PENDING_STATES_WHILE_PENDING = DesugarCollections.unmodifiableSet(EnumSet.of(State.CONFIGURING, State.IDLING, State.RESETTING, State.STOPPING, State.ERROR));
    public static final QualitySelector DEFAULT_QUALITY_SELECTOR = VideoSpec.QUALITY_SELECTOR_AUTO;
    private static final VideoSpec VIDEO_SPEC_DEFAULT = VideoSpec.builder().setQualitySelector(DEFAULT_QUALITY_SELECTOR).setAspectRatio(-1).build();
    private static final MediaSpec MEDIA_SPEC_DEFAULT = MediaSpec.builder().setOutputFormat(-1).setVideoSpec(VIDEO_SPEC_DEFAULT).build();
    private static final Exception PENDING_RECORDING_ERROR_CAUSE_SOURCE_INACTIVE = new RuntimeException("The video frame producer became inactive before any data was received.");
    static final EncoderFactory DEFAULT_ENCODER_FACTORY = new EncoderFactory() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda9
        @Override // androidx.camera.video.internal.encoder.EncoderFactory
        public final Encoder createEncoder(Executor executor, EncoderConfig encoderConfig, int i) {
            return new EncoderImpl(executor, encoderConfig, i);
        }
    };
    private static final OutputStorage.Factory OUTPUT_STORAGE_FACTORY_DEFAULT = new OutputStorage.Factory() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda10
        @Override // androidx.camera.video.internal.OutputStorage.Factory
        public final OutputStorage create(OutputOptions outputOptions) {
            return new OutputStorageImpl(outputOptions);
        }
    };
    private static final Executor AUDIO_EXECUTOR = CameraXExecutors.newSequentialExecutor(CameraXExecutors.ioExecutor());
    static int sRetrySetupVideoMaxCount = 3;
    static long sRetrySetupVideoDelayMs = 1000;

    enum AudioState {
        INITIALIZING,
        IDLING,
        DISABLED,
        ENABLED,
        ERROR_ENCODER,
        ERROR_SOURCE
    }

    enum State {
        CONFIGURING,
        PENDING_RECORDING,
        PENDING_PAUSED,
        IDLING,
        RECORDING,
        PAUSED,
        STOPPING,
        RESETTING,
        ERROR
    }

    Recorder(Executor executor, MediaSpec mediaSpec, int videoCapabilitiesSource, EncoderFactory videoEncoderFactory, EncoderFactory audioEncoderFactory, OutputStorage.Factory outputStorageFactory, long requiredFreeStorageBytes) {
        this.mEncoderNotUsePersistentInputSurface = DeviceQuirks.get(EncoderNotUsePersistentInputSurfaceQuirk.class) != null;
        this.mVideoEncoderBitrateRange = MutableStateObservable.withInitialState(null);
        this.mState = State.CONFIGURING;
        this.mNonPendingState = null;
        this.mStreamId = 0;
        this.mActiveRecordingRecord = null;
        this.mPendingRecordingRecord = null;
        this.mLastGeneratedRecordingId = 0L;
        this.mInProgressRecording = null;
        this.mInProgressRecordingStopping = false;
        this.mInProgressTransformationInfo = null;
        this.mSourceTransformationInfo = null;
        this.mResolvedEncoderProfiles = null;
        this.mEncodingFutures = new ArrayList();
        this.mAudioTrackIndex = null;
        this.mVideoTrackIndex = null;
        this.mLatestSurface = null;
        this.mActiveSurface = null;
        this.mMediaMuxer = null;
        this.mAudioSource = null;
        this.mVideoEncoder = null;
        this.mVideoOutputConfig = null;
        this.mAudioEncoder = null;
        this.mAudioOutputConfig = null;
        this.mAudioState = AudioState.INITIALIZING;
        this.mOutputUri = Uri.EMPTY;
        this.mRecordingBytes = 0L;
        this.mRecordingAudioBytes = 0L;
        this.mRecordingDurationNs = 0L;
        this.mFirstRecordingVideoDataTimeUs = Long.MAX_VALUE;
        this.mFirstRecordingVideoBitrate = 0;
        this.mFirstRecordingAudioDataTimeUs = Long.MAX_VALUE;
        this.mPreviousRecordingVideoDataTimeUs = Long.MAX_VALUE;
        this.mPreviousRecordingAudioDataTimeUs = Long.MAX_VALUE;
        this.mFileSizeLimitInBytes = 0L;
        this.mDurationLimitNs = 0L;
        this.mRecordingStopError = 1;
        this.mRecordingStopErrorCause = null;
        this.mPendingFirstVideoData = null;
        this.mPendingAudioRingBuffer = new ArrayRingBuffer(60);
        this.mAudioErrorCause = null;
        this.mIsAudioSourceSilenced = false;
        this.mSourceState = VideoOutput.SourceState.INACTIVE;
        this.mSourceNonStreamingTimeout = null;
        this.mNeedsResetBeforeNextStart = false;
        this.mVideoEncoderConfig = null;
        this.mVideoEncoderSessionToRelease = null;
        this.mAudioAmplitude = AudioStats.AUDIO_AMPLITUDE_NONE;
        this.mShouldSendResumeEvent = false;
        this.mSetupVideoTask = null;
        this.mOutputStorage = null;
        this.mAvailableBytesAboveRequired = Long.MAX_VALUE;
        this.mHasGlProcessing = false;
        this.mUserProvidedExecutor = executor;
        this.mExecutor = executor != null ? executor : CameraXExecutors.ioExecutor();
        this.mSequentialExecutor = CameraXExecutors.newSequentialExecutor(this.mExecutor);
        this.mMediaSpec = MutableStateObservable.withInitialState(composeRecorderMediaSpec(mediaSpec));
        this.mVideoCapabilitiesSource = videoCapabilitiesSource;
        this.mStreamInfo = MutableStateObservable.withInitialState(StreamInfo.of(this.mStreamId, internalStateToStreamState(this.mState)));
        this.mIsRecording = MutableStateObservable.withInitialState(false);
        this.mVideoEncoderFactory = videoEncoderFactory;
        this.mAudioEncoderFactory = audioEncoderFactory;
        this.mOutputStorageFactory = outputStorageFactory;
        this.mVideoEncoderSession = new VideoEncoderSession(this.mVideoEncoderFactory, this.mSequentialExecutor, this.mExecutor);
        this.mRequiredFreeStorageBytes = requiredFreeStorageBytes != -1 ? requiredFreeStorageBytes : REQUIRED_FREE_STORAGE_DEFAULT_BYTES;
        Logger.d(TAG, "mRequiredFreeStorageBytes = " + StorageUtil.formatSize(this.mRequiredFreeStorageBytes));
    }

    @Override // androidx.camera.video.VideoOutput
    public void onSurfaceRequested(SurfaceRequest request) {
        onSurfaceRequested(request, Timebase.UPTIME, false);
    }

    @Override // androidx.camera.video.VideoOutput
    public void onSurfaceRequested(final SurfaceRequest request, final Timebase timebase, final boolean hasGlProcessing) {
        synchronized (this.mLock) {
            Logger.d(TAG, "Surface is requested in state: " + this.mState + ", Current surface: " + this.mStreamId);
            if (this.mState == State.ERROR) {
                setState(State.CONFIGURING);
            }
        }
        this.mSequentialExecutor.execute(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda15
            @Override // java.lang.Runnable
            public final void run() {
                Recorder.this.m245lambda$onSurfaceRequested$0$androidxcameravideoRecorder(request, timebase, hasGlProcessing);
            }
        });
    }

    @Override // androidx.camera.video.VideoOutput
    public Observable<MediaSpec> getMediaSpec() {
        return this.mMediaSpec;
    }

    @Override // androidx.camera.video.VideoOutput
    public Observable<StreamInfo> getStreamInfo() {
        return this.mStreamInfo;
    }

    @Override // androidx.camera.video.VideoOutput
    public Observable<Boolean> isSourceStreamRequired() {
        return this.mIsRecording;
    }

    @Override // androidx.camera.video.VideoOutput
    public void onSourceStateChanged(final VideoOutput.SourceState newState) {
        this.mSequentialExecutor.execute(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda6
            @Override // java.lang.Runnable
            public final void run() {
                Recorder.this.m244lambda$onSourceStateChanged$1$androidxcameravideoRecorder(newState);
            }
        });
    }

    @Override // androidx.camera.video.VideoOutput
    public VideoCapabilities getMediaCapabilities(CameraInfo cameraInfo, int sessionType) {
        int videoCaptureType = 1;
        if (sessionType == 1) {
            videoCaptureType = 2;
        }
        return getVideoCapabilitiesInternal(videoCaptureType, cameraInfo, this.mVideoCapabilitiesSource);
    }

    public PendingRecording prepareRecording(Context context, FileOutputOptions fileOutputOptions) {
        return prepareRecordingInternal(context, fileOutputOptions);
    }

    public PendingRecording prepareRecording(Context context, FileDescriptorOutputOptions fileDescriptorOutputOptions) {
        if (Build.VERSION.SDK_INT < 26) {
            throw new UnsupportedOperationException("File descriptors as output destinations are not supported on pre-Android O (API 26) devices.");
        }
        return prepareRecordingInternal(context, fileDescriptorOutputOptions);
    }

    public PendingRecording prepareRecording(Context context, MediaStoreOutputOptions mediaStoreOutputOptions) {
        return prepareRecordingInternal(context, mediaStoreOutputOptions);
    }

    private PendingRecording prepareRecordingInternal(Context context, OutputOptions options) {
        Preconditions.checkNotNull(options, "The OutputOptions cannot be null.");
        return new PendingRecording(context, this, options);
    }

    public QualitySelector getQualitySelector() {
        return ((MediaSpec) getObservableData(this.mMediaSpec)).getVideoSpec().getQualitySelector();
    }

    public int getVideoCapabilitiesSource() {
        return this.mVideoCapabilitiesSource;
    }

    public int getAudioSource() {
        return ((MediaSpec) getObservableData(this.mMediaSpec)).getAudioSpec().getSource();
    }

    public Executor getExecutor() {
        return this.mUserProvidedExecutor;
    }

    public int getTargetVideoEncodingBitRate() {
        return ((MediaSpec) getObservableData(this.mMediaSpec)).getVideoSpec().getBitrate().getLower().intValue();
    }

    public Observable<Range<Integer>> getVideoEncoderBitrateRange() {
        return this.mVideoEncoderBitrateRange;
    }

    public int getVideoEncodingFrameRate() {
        return ((MediaSpec) getObservableData(this.mMediaSpec)).getVideoSpec().getEncodeFrameRate();
    }

    public void setVideoEncodingFrameRate(final int frameRate) {
        Preconditions.checkArgument(frameRate >= 1, "frameRate must be greater than 0.");
        this.mMediaSpec.setState(((MediaSpec) getObservableData(this.mMediaSpec)).toBuilder().configureVideo(new Consumer() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda5
            @Override // androidx.core.util.Consumer
            public final void accept(Object obj) {
                ((VideoSpec.Builder) obj).setEncodeFrameRate(frameRate);
            }
        }).build());
    }

    public int getAspectRatio() {
        return ((MediaSpec) getObservableData(this.mMediaSpec)).getVideoSpec().getAspectRatio();
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:40:0x0082 -> B:33:0x0084). Please report as a decompilation issue!!! */
    Recording start(PendingRecording pendingRecording) {
        long recordingId;
        Preconditions.checkNotNull(pendingRecording, "The given PendingRecording cannot be null.");
        RecordingRecord alreadyInProgressRecording = null;
        int error = 0;
        Throwable errorCause = null;
        synchronized (this.mLock) {
            recordingId = this.mLastGeneratedRecordingId + 1;
            this.mLastGeneratedRecordingId = recordingId;
            switch (this.mState) {
                case CONFIGURING:
                case IDLING:
                case STOPPING:
                case RESETTING:
                case ERROR:
                    if (this.mState == State.IDLING) {
                        Preconditions.checkState(this.mActiveRecordingRecord == null && this.mPendingRecordingRecord == null, "Expected recorder to be idle but a recording is either pending or in progress.");
                    }
                    try {
                        RecordingRecord recordingRecord = RecordingRecord.from(pendingRecording, recordingId);
                        recordingRecord.initializeRecording(pendingRecording.getApplicationContext());
                        this.mPendingRecordingRecord = recordingRecord;
                        if (this.mState == State.IDLING) {
                            setState(State.PENDING_RECORDING);
                            this.mSequentialExecutor.execute(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda12
                                @Override // java.lang.Runnable
                                public final void run() {
                                    Recorder.this.tryServicePendingRecording();
                                }
                            });
                        } else if (this.mState == State.ERROR) {
                            setState(State.PENDING_RECORDING);
                            this.mSequentialExecutor.execute(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda13
                                @Override // java.lang.Runnable
                                public final void run() {
                                    Recorder.this.m249lambda$start$3$androidxcameravideoRecorder();
                                }
                            });
                        } else {
                            setState(State.PENDING_RECORDING);
                        }
                    } catch (IOException e) {
                        error = 5;
                        errorCause = e;
                    }
                    break;
                case PENDING_RECORDING:
                case PENDING_PAUSED:
                    alreadyInProgressRecording = (RecordingRecord) Preconditions.checkNotNull(this.mPendingRecordingRecord);
                    break;
                case RECORDING:
                case PAUSED:
                    alreadyInProgressRecording = this.mActiveRecordingRecord;
                    break;
            }
        }
        if (alreadyInProgressRecording != null) {
            throw new IllegalStateException("A recording is already in progress. Previous recordings must be stopped before a new recording can be started.");
        }
        if (error != 0) {
            Logger.e(TAG, "Recording was started when the Recorder had encountered error " + errorCause);
            finalizePendingRecording(RecordingRecord.from(pendingRecording, recordingId), error, errorCause);
            return Recording.createFinalizedFrom(pendingRecording, recordingId);
        }
        return Recording.from(pendingRecording, recordingId);
    }

    /* renamed from: lambda$start$3$androidx-camera-video-Recorder, reason: not valid java name */
    /* synthetic */ void m249lambda$start$3$androidxcameravideoRecorder() {
        if (this.mLatestSurfaceRequest == null) {
            throw new AssertionError("surface request is required to retry initialization.");
        }
        configureInternal(this.mLatestSurfaceRequest, this.mVideoSourceTimebase, false);
    }

    void pause(Recording activeRecording) {
        synchronized (this.mLock) {
            if (!isSameRecording(activeRecording, this.mPendingRecordingRecord) && !isSameRecording(activeRecording, this.mActiveRecordingRecord)) {
                Logger.d(TAG, "pause() called on a recording that is no longer active: " + activeRecording.getOutputOptions());
                return;
            }
            switch (this.mState) {
                case CONFIGURING:
                case IDLING:
                    throw new IllegalStateException("Called pause() from invalid state: " + this.mState);
                case PENDING_RECORDING:
                    setState(State.PENDING_PAUSED);
                    break;
                case RECORDING:
                    setState(State.PAUSED);
                    final RecordingRecord finalActiveRecordingRecord = this.mActiveRecordingRecord;
                    this.mSequentialExecutor.execute(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda16
                        @Override // java.lang.Runnable
                        public final void run() {
                            Recorder.this.m246lambda$pause$4$androidxcameravideoRecorder(finalActiveRecordingRecord);
                        }
                    });
                    break;
            }
        }
    }

    void resume(Recording activeRecording) {
        synchronized (this.mLock) {
            if (!isSameRecording(activeRecording, this.mPendingRecordingRecord) && !isSameRecording(activeRecording, this.mActiveRecordingRecord)) {
                Logger.d(TAG, "resume() called on a recording that is no longer active: " + activeRecording.getOutputOptions());
                return;
            }
            switch (this.mState) {
                case CONFIGURING:
                case IDLING:
                    throw new IllegalStateException("Called resume() from invalid state: " + this.mState);
                case PENDING_PAUSED:
                    setState(State.PENDING_RECORDING);
                    break;
                case PAUSED:
                    setState(State.RECORDING);
                    final RecordingRecord finalActiveRecordingRecord = this.mActiveRecordingRecord;
                    this.mSequentialExecutor.execute(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda7
                        @Override // java.lang.Runnable
                        public final void run() {
                            Recorder.this.m247lambda$resume$5$androidxcameravideoRecorder(finalActiveRecordingRecord);
                        }
                    });
                    break;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0097  */
    /* JADX WARN: Removed duplicated region for block: B:17:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    void stop(androidx.camera.video.Recording r13, int r14, java.lang.Throwable r15) {
        /*
            r12 = this;
            r1 = 0
            java.lang.Object r2 = r12.mLock
            monitor-enter(r2)
            androidx.camera.video.Recorder$RecordingRecord r0 = r12.mPendingRecordingRecord     // Catch: java.lang.Throwable -> Laf
            boolean r0 = isSameRecording(r13, r0)     // Catch: java.lang.Throwable -> Laf
            if (r0 != 0) goto L39
            androidx.camera.video.Recorder$RecordingRecord r0 = r12.mActiveRecordingRecord     // Catch: java.lang.Throwable -> L33
            boolean r0 = isSameRecording(r13, r0)     // Catch: java.lang.Throwable -> L33
            if (r0 != 0) goto L39
            java.lang.String r0 = "Recorder"
            java.lang.StringBuilder r3 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L33
            r3.<init>()     // Catch: java.lang.Throwable -> L33
            java.lang.String r4 = "stop() called on a recording that is no longer active: "
            java.lang.StringBuilder r3 = r3.append(r4)     // Catch: java.lang.Throwable -> L33
            androidx.camera.video.OutputOptions r4 = r13.getOutputOptions()     // Catch: java.lang.Throwable -> L33
            java.lang.StringBuilder r3 = r3.append(r4)     // Catch: java.lang.Throwable -> L33
            java.lang.String r3 = r3.toString()     // Catch: java.lang.Throwable -> L33
            androidx.camera.core.Logger.d(r0, r3)     // Catch: java.lang.Throwable -> L33
            monitor-exit(r2)     // Catch: java.lang.Throwable -> L33
            return
        L33:
            r0 = move-exception
            r6 = r12
            r10 = r14
            r11 = r15
            goto Lb3
        L39:
            androidx.camera.video.Recorder$State r0 = r12.mState     // Catch: java.lang.Throwable -> Laf
            int r0 = r0.ordinal()     // Catch: java.lang.Throwable -> Laf
            switch(r0) {
                case 0: goto L89;
                case 1: goto L73;
                case 2: goto L73;
                case 3: goto L89;
                case 4: goto L53;
                case 5: goto L53;
                case 6: goto L46;
                case 7: goto L46;
                default: goto L42;
            }
        L42:
            r6 = r12
            r10 = r14
            r11 = r15
            goto L94
        L46:
            androidx.camera.video.Recorder$RecordingRecord r0 = r12.mActiveRecordingRecord     // Catch: java.lang.Throwable -> L33
            boolean r0 = isSameRecording(r13, r0)     // Catch: java.lang.Throwable -> L33
            androidx.core.util.Preconditions.checkState(r0)     // Catch: java.lang.Throwable -> L33
            r6 = r12
            r10 = r14
            r11 = r15
            goto L94
        L53:
            androidx.camera.video.Recorder$State r0 = androidx.camera.video.Recorder.State.STOPPING     // Catch: java.lang.Throwable -> Laf
            r12.setState(r0)     // Catch: java.lang.Throwable -> Laf
            java.util.concurrent.TimeUnit r0 = java.util.concurrent.TimeUnit.NANOSECONDS     // Catch: java.lang.Throwable -> Laf
            long r3 = java.lang.System.nanoTime()     // Catch: java.lang.Throwable -> Laf
            long r3 = r0.toMicros(r3)     // Catch: java.lang.Throwable -> Laf
            r8 = r3
            androidx.camera.video.Recorder$RecordingRecord r7 = r12.mActiveRecordingRecord     // Catch: java.lang.Throwable -> Laf
            java.util.concurrent.Executor r0 = r12.mSequentialExecutor     // Catch: java.lang.Throwable -> Laf
            androidx.camera.video.Recorder$$ExternalSyntheticLambda1 r5 = new androidx.camera.video.Recorder$$ExternalSyntheticLambda1     // Catch: java.lang.Throwable -> Laf
            r6 = r12
            r10 = r14
            r11 = r15
            r5.<init>()     // Catch: java.lang.Throwable -> Lb5
            r0.execute(r5)     // Catch: java.lang.Throwable -> Lb5
            goto L94
        L73:
            r6 = r12
            r10 = r14
            r11 = r15
            androidx.camera.video.Recorder$RecordingRecord r14 = r6.mPendingRecordingRecord     // Catch: java.lang.Throwable -> Lb5
            boolean r14 = isSameRecording(r13, r14)     // Catch: java.lang.Throwable -> Lb5
            androidx.core.util.Preconditions.checkState(r14)     // Catch: java.lang.Throwable -> Lb5
            androidx.camera.video.Recorder$RecordingRecord r14 = r6.mPendingRecordingRecord     // Catch: java.lang.Throwable -> Lb5
            r1 = r14
            r14 = 0
            r6.mPendingRecordingRecord = r14     // Catch: java.lang.Throwable -> Lb5
            r12.restoreNonPendingState()     // Catch: java.lang.Throwable -> Lb5
            goto L94
        L89:
            r6 = r12
            r10 = r14
            r11 = r15
            java.lang.IllegalStateException r14 = new java.lang.IllegalStateException     // Catch: java.lang.Throwable -> Lb5
            java.lang.String r15 = "Calling stop() while idling or initializing is invalid."
            r14.<init>(r15)     // Catch: java.lang.Throwable -> Lb5
            throw r14     // Catch: java.lang.Throwable -> Lb5
        L94:
            monitor-exit(r2)     // Catch: java.lang.Throwable -> Lb5
            if (r1 == 0) goto Lae
            r14 = 10
            if (r10 != r14) goto La2
            java.lang.String r14 = "Recorder"
            java.lang.String r15 = "Recording was stopped due to recording being garbage collected before any valid data has been produced."
            androidx.camera.core.Logger.e(r14, r15)
        La2:
            java.lang.RuntimeException r14 = new java.lang.RuntimeException
            java.lang.String r15 = "Recording was stopped before any data could be produced."
            r14.<init>(r15, r11)
            r15 = 8
            r12.finalizePendingRecording(r1, r15, r14)
        Lae:
            return
        Laf:
            r0 = move-exception
            r6 = r12
            r10 = r14
            r11 = r15
        Lb3:
            monitor-exit(r2)     // Catch: java.lang.Throwable -> Lb5
            throw r0
        Lb5:
            r0 = move-exception
            goto Lb3
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.video.Recorder.stop(androidx.camera.video.Recording, int, java.lang.Throwable):void");
    }

    void mute(Recording activeRecording, final boolean muted) {
        synchronized (this.mLock) {
            if (!isSameRecording(activeRecording, this.mPendingRecordingRecord) && !isSameRecording(activeRecording, this.mActiveRecordingRecord)) {
                Logger.d(TAG, "mute() called on a recording that is no longer active: " + activeRecording.getOutputOptions());
            } else {
                final RecordingRecord finalRecordingRecord = isSameRecording(activeRecording, this.mPendingRecordingRecord) ? this.mPendingRecordingRecord : this.mActiveRecordingRecord;
                this.mSequentialExecutor.execute(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda8
                    @Override // java.lang.Runnable
                    public final void run() {
                        Recorder.this.m243lambda$mute$7$androidxcameravideoRecorder(finalRecordingRecord, muted);
                    }
                });
            }
        }
    }

    private void finalizePendingRecording(RecordingRecord recordingToFinalize, int error, Throwable cause) {
        recordingToFinalize.finalizeRecording(Uri.EMPTY);
        recordingToFinalize.updateVideoRecordEvent(VideoRecordEvent.finalizeWithError(recordingToFinalize.getOutputOptions(), RecordingStats.of(0L, 0L, AudioStats.of(1, this.mAudioErrorCause, AudioStats.AUDIO_AMPLITUDE_NONE, 0L)), OutputResults.of(Uri.EMPTY), error, cause));
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: onSurfaceRequestedInternal, reason: merged with bridge method [inline-methods] */
    public void m245lambda$onSurfaceRequested$0$androidxcameravideoRecorder(SurfaceRequest request, Timebase timebase, boolean hasGlProcessing) {
        if (this.mLatestSurfaceRequest != null && !this.mLatestSurfaceRequest.isServiced()) {
            this.mLatestSurfaceRequest.willNotProvideSurface();
        }
        this.mHasGlProcessing = hasGlProcessing;
        this.mLatestSurfaceRequest = request;
        this.mVideoSourceTimebase = timebase;
        configureInternal(request, timebase, true);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: onSourceStateChangedInternal, reason: merged with bridge method [inline-methods] */
    public void m244lambda$onSourceStateChanged$1$androidxcameravideoRecorder(VideoOutput.SourceState newState) {
        VideoOutput.SourceState oldState = this.mSourceState;
        this.mSourceState = newState;
        if (oldState != newState) {
            Logger.d(TAG, "Video source has transitioned to state: " + newState);
            if (newState == VideoOutput.SourceState.INACTIVE) {
                if (this.mActiveSurface == null) {
                    if (this.mSetupVideoTask != null) {
                        this.mSetupVideoTask.cancelFailedRetry();
                        this.mSetupVideoTask = null;
                    }
                    requestReset(4, null, false);
                    return;
                }
                this.mNeedsResetBeforeNextStart = true;
                if (this.mInProgressRecording != null && !this.mInProgressRecording.isPersistent()) {
                    onInProgressRecordingInternalError(this.mInProgressRecording, 4, null);
                    return;
                }
                return;
            }
            if (newState == VideoOutput.SourceState.ACTIVE_NON_STREAMING && this.mSourceNonStreamingTimeout != null && this.mSourceNonStreamingTimeout.cancel(false) && this.mVideoEncoder != null) {
                notifyEncoderSourceStopped(this.mVideoEncoder);
                return;
            }
            return;
        }
        Logger.d(TAG, "Video source transitions to the same state: " + newState);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x006f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    void requestReset(int r11, java.lang.Throwable r12, boolean r13) {
        /*
            r10 = this;
            r1 = 0
            r2 = 0
            java.lang.Object r3 = r10.mLock
            monitor-enter(r3)
            androidx.camera.video.Recorder$State r0 = r10.mState     // Catch: java.lang.Throwable -> L7f
            int r0 = r0.ordinal()     // Catch: java.lang.Throwable -> L7f
            switch(r0) {
                case 0: goto L5c;
                case 1: goto L51;
                case 2: goto L51;
                case 3: goto L5c;
                case 4: goto L15;
                case 5: goto L15;
                case 6: goto Lf;
                case 7: goto Le;
                case 8: goto L5c;
                default: goto Le;
            }
        Le:
            goto L5e
        Lf:
            androidx.camera.video.Recorder$State r0 = androidx.camera.video.Recorder.State.RESETTING     // Catch: java.lang.Throwable -> L58
            r10.setState(r0)     // Catch: java.lang.Throwable -> L58
            goto L5e
        L15:
            androidx.camera.video.Recorder$RecordingRecord r0 = r10.mInProgressRecording     // Catch: java.lang.Throwable -> L58
            if (r0 == 0) goto L1b
            r0 = 1
            goto L1c
        L1b:
            r0 = 0
        L1c:
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L58
            r4.<init>()     // Catch: java.lang.Throwable -> L58
            java.lang.String r5 = "In-progress recording shouldn't be null when in state "
            java.lang.StringBuilder r4 = r4.append(r5)     // Catch: java.lang.Throwable -> L58
            androidx.camera.video.Recorder$State r5 = r10.mState     // Catch: java.lang.Throwable -> L58
            java.lang.StringBuilder r4 = r4.append(r5)     // Catch: java.lang.Throwable -> L58
            java.lang.String r4 = r4.toString()     // Catch: java.lang.Throwable -> L58
            androidx.core.util.Preconditions.checkState(r0, r4)     // Catch: java.lang.Throwable -> L58
            androidx.camera.video.Recorder$RecordingRecord r0 = r10.mActiveRecordingRecord     // Catch: java.lang.Throwable -> L58
            androidx.camera.video.Recorder$RecordingRecord r4 = r10.mInProgressRecording     // Catch: java.lang.Throwable -> L58
            if (r0 != r4) goto L49
            boolean r0 = r10.isPersistentRecordingInProgress()     // Catch: java.lang.Throwable -> L58
            if (r0 == 0) goto L42
            r1 = 1
            goto L5e
        L42:
            r2 = 1
            androidx.camera.video.Recorder$State r0 = androidx.camera.video.Recorder.State.RESETTING     // Catch: java.lang.Throwable -> L58
            r10.setState(r0)     // Catch: java.lang.Throwable -> L58
            goto L5e
        L49:
            java.lang.AssertionError r0 = new java.lang.AssertionError     // Catch: java.lang.Throwable -> L58
            java.lang.String r4 = "In-progress recording does not match the active recording. Unable to reset encoder."
            r0.<init>(r4)     // Catch: java.lang.Throwable -> L58
            throw r0     // Catch: java.lang.Throwable -> L58
        L51:
            r1 = 1
            androidx.camera.video.Recorder$State r0 = androidx.camera.video.Recorder.State.RESETTING     // Catch: java.lang.Throwable -> L58
            r10.updateNonPendingState(r0)     // Catch: java.lang.Throwable -> L58
            goto L5e
        L58:
            r0 = move-exception
            r8 = r11
            r9 = r12
            goto L82
        L5c:
            r1 = 1
        L5e:
            monitor-exit(r3)     // Catch: java.lang.Throwable -> L7f
            if (r1 == 0) goto L6f
            if (r13 == 0) goto L69
            r10.resetVideo()
            r8 = r11
            r9 = r12
            goto L7e
        L69:
            r10.reset()
            r8 = r11
            r9 = r12
            goto L7e
        L6f:
            if (r2 == 0) goto L7c
            androidx.camera.video.Recorder$RecordingRecord r5 = r10.mInProgressRecording
            r6 = -1
            r4 = r10
            r8 = r11
            r9 = r12
            r4.m250lambda$stop$6$androidxcameravideoRecorder(r5, r6, r8, r9)
            goto L7e
        L7c:
            r8 = r11
            r9 = r12
        L7e:
            return
        L7f:
            r0 = move-exception
            r8 = r11
            r9 = r12
        L82:
            monitor-exit(r3)     // Catch: java.lang.Throwable -> L84
            throw r0
        L84:
            r0 = move-exception
            goto L82
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.video.Recorder.requestReset(int, java.lang.Throwable, boolean):void");
    }

    private void configureInternal(SurfaceRequest surfaceRequest, Timebase videoSourceTimebase, boolean enableRetrySetupVideo) {
        if (surfaceRequest.isServiced()) {
            Logger.w(TAG, "Ignore the SurfaceRequest since it is already served.");
            return;
        }
        surfaceRequest.setTransformationInfoListener(this.mSequentialExecutor, new SurfaceRequest.TransformationInfoListener() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda14
            @Override // androidx.camera.core.SurfaceRequest.TransformationInfoListener
            public final void onTransformationInfoUpdate(SurfaceRequest.TransformationInfo transformationInfo) {
                Recorder.this.m242lambda$configureInternal$8$androidxcameravideoRecorder(transformationInfo);
            }
        });
        Size surfaceSize = surfaceRequest.getResolution();
        DynamicRange dynamicRange = surfaceRequest.getDynamicRange();
        VideoCapabilities capabilities = getMediaCapabilities(surfaceRequest.getCamera().getCameraInfo(), surfaceRequest.getSessionType());
        Quality highestSupportedQuality = capabilities.findNearestHigherSupportedQualityFor(surfaceSize, dynamicRange);
        Logger.d(TAG, "Using supported quality of " + highestSupportedQuality + " for surface size " + surfaceSize);
        if (highestSupportedQuality != Quality.NONE) {
            this.mResolvedEncoderProfiles = capabilities.getProfiles(highestSupportedQuality, dynamicRange);
            if (this.mResolvedEncoderProfiles == null) {
                throw new AssertionError("Camera advertised available quality but did not produce EncoderProfiles  for advertised quality.");
            }
        }
        Logger.d(TAG, "mResolvedEncoderProfiles = " + this.mResolvedEncoderProfiles);
        if (this.mSetupVideoTask != null) {
            this.mSetupVideoTask.cancelFailedRetry();
        }
        this.mSetupVideoTask = new SetupVideoTask(surfaceRequest, videoSourceTimebase, this.mHasGlProcessing, enableRetrySetupVideo ? sRetrySetupVideoMaxCount : 0);
        this.mSetupVideoTask.start();
    }

    /* renamed from: lambda$configureInternal$8$androidx-camera-video-Recorder, reason: not valid java name */
    /* synthetic */ void m242lambda$configureInternal$8$androidxcameravideoRecorder(SurfaceRequest.TransformationInfo transformationInfo) {
        this.mSourceTransformationInfo = transformationInfo;
    }

    /* JADX INFO: Access modifiers changed from: private */
    class SetupVideoTask {
        private final int mMaxRetryCount;
        private final SurfaceRequest mSurfaceRequest;
        private final Timebase mTimebase;
        private boolean mIsFailedRetryCanceled = false;
        private int mRetryCount = 0;
        private ScheduledFuture<?> mRetryFuture = null;

        static /* synthetic */ int access$608(SetupVideoTask x0) {
            int i = x0.mRetryCount;
            x0.mRetryCount = i + 1;
            return i;
        }

        SetupVideoTask(SurfaceRequest surfaceRequest, Timebase timebase, boolean hasGlProcessing, int maxRetryCount) {
            this.mSurfaceRequest = surfaceRequest;
            this.mTimebase = timebase;
            Recorder.this.mHasGlProcessing = hasGlProcessing;
            this.mMaxRetryCount = maxRetryCount;
        }

        void start() {
            setupVideo(this.mSurfaceRequest, this.mTimebase);
        }

        void cancelFailedRetry() {
            if (this.mIsFailedRetryCanceled) {
                return;
            }
            this.mIsFailedRetryCanceled = true;
            if (this.mRetryFuture != null) {
                this.mRetryFuture.cancel(false);
                this.mRetryFuture = null;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setupVideo(final SurfaceRequest request, final Timebase timebase) {
            Recorder.this.safeToCloseVideoEncoder().addListener(new Runnable() { // from class: androidx.camera.video.Recorder$SetupVideoTask$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    Recorder.SetupVideoTask.this.m255xdf7f9b96(request, timebase);
                }
            }, Recorder.this.mSequentialExecutor);
        }

        /* renamed from: lambda$setupVideo$0$androidx-camera-video-Recorder$SetupVideoTask, reason: not valid java name */
        /* synthetic */ void m255xdf7f9b96(SurfaceRequest request, Timebase timebase) {
            if (!request.isServiced() && (!Recorder.this.mVideoEncoderSession.isConfiguredSurfaceRequest(request) || Recorder.this.isPersistentRecordingInProgress())) {
                VideoEncoderSession videoEncoderSession = new VideoEncoderSession(Recorder.this.mVideoEncoderFactory, Recorder.this.mSequentialExecutor, Recorder.this.mExecutor);
                MediaSpec mediaSpec = (MediaSpec) Recorder.this.getObservableData(Recorder.this.mMediaSpec);
                DynamicRange dynamicRange = request.getDynamicRange();
                VideoMimeInfo videoMimeInfo = VideoConfigUtil.resolveVideoMimeInfo(mediaSpec, dynamicRange, Recorder.this.mResolvedEncoderProfiles);
                VideoEncoderConfig config = VideoConfigUtil.workaroundDataSpaceIfRequired(VideoConfigUtil.resolveVideoEncoderConfig(videoMimeInfo, timebase, mediaSpec.getVideoSpec(), request.getResolution(), dynamicRange, request.getExpectedFrameRate()), Recorder.this.mHasGlProcessing);
                Recorder.this.mVideoEncoderConfig = config;
                ListenableFuture<Encoder> configureFuture = videoEncoderSession.configure(request, config);
                Recorder.this.mVideoEncoderSession = videoEncoderSession;
                Futures.addCallback(configureFuture, new AnonymousClass1(videoEncoderSession), Recorder.this.mSequentialExecutor);
                return;
            }
            Logger.w(Recorder.TAG, "Ignore the SurfaceRequest " + request + " isServiced: " + request.isServiced() + " VideoEncoderSession: " + Recorder.this.mVideoEncoderSession + " has been configured with a persistent in-progress recording.");
        }

        /* renamed from: androidx.camera.video.Recorder$SetupVideoTask$1, reason: invalid class name */
        class AnonymousClass1 implements FutureCallback<Encoder> {
            final /* synthetic */ VideoEncoderSession val$videoEncoderSession;

            AnonymousClass1(VideoEncoderSession videoEncoderSession) {
                this.val$videoEncoderSession = videoEncoderSession;
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(Encoder result) {
                Logger.d(Recorder.TAG, "VideoEncoder is created. " + result);
                if (result == null) {
                    return;
                }
                Preconditions.checkState(Recorder.this.mVideoEncoderSession == this.val$videoEncoderSession);
                Preconditions.checkState(Recorder.this.mVideoEncoder == null);
                Recorder.this.onVideoEncoderReady(this.val$videoEncoderSession);
                Recorder.this.onConfigured();
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
                Logger.w(Recorder.TAG, "VideoEncoder Setup error: " + t, t);
                if (SetupVideoTask.this.mRetryCount < SetupVideoTask.this.mMaxRetryCount) {
                    SetupVideoTask.access$608(SetupVideoTask.this);
                    SetupVideoTask.this.mRetryFuture = Recorder.scheduleTask(new Runnable() { // from class: androidx.camera.video.Recorder$SetupVideoTask$1$$ExternalSyntheticLambda0
                        @Override // java.lang.Runnable
                        public final void run() {
                            Recorder.SetupVideoTask.AnonymousClass1.this.m256xdc553cf6();
                        }
                    }, Recorder.this.mSequentialExecutor, Recorder.sRetrySetupVideoDelayMs, TimeUnit.MILLISECONDS);
                    return;
                }
                Recorder.this.onEncoderSetupError(t);
            }

            /* renamed from: lambda$onFailure$0$androidx-camera-video-Recorder$SetupVideoTask$1, reason: not valid java name */
            /* synthetic */ void m256xdc553cf6() {
                if (!SetupVideoTask.this.mIsFailedRetryCanceled) {
                    Logger.d(Recorder.TAG, "Retry setupVideo #" + SetupVideoTask.this.mRetryCount);
                    SetupVideoTask.this.setupVideo(SetupVideoTask.this.mSurfaceRequest, SetupVideoTask.this.mTimebase);
                }
            }
        }
    }

    boolean isPersistentRecordingInProgress() {
        return this.mInProgressRecording != null && this.mInProgressRecording.isPersistent();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public ListenableFuture<Void> safeToCloseVideoEncoder() {
        Logger.d(TAG, "Try to safely release video encoder: " + this.mVideoEncoder);
        return this.mVideoEncoderSession.signalTermination();
    }

    void onVideoEncoderReady(final VideoEncoderSession videoEncoderSession) {
        this.mVideoEncoder = (Encoder) Preconditions.checkNotNull(videoEncoderSession.getVideoEncoder());
        this.mVideoEncoderBitrateRange.setState(((VideoEncoderInfo) this.mVideoEncoder.getEncoderInfo()).getSupportedBitrateRange());
        this.mFirstRecordingVideoBitrate = this.mVideoEncoder.getConfiguredBitrate();
        this.mActiveSurface = videoEncoderSession.getActiveSurface();
        setLatestSurface(this.mActiveSurface);
        videoEncoderSession.setOnSurfaceUpdateListener(this.mSequentialExecutor, new Encoder.SurfaceInput.OnSurfaceUpdateListener() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda17
            @Override // androidx.camera.video.internal.encoder.Encoder.SurfaceInput.OnSurfaceUpdateListener
            public final void onSurfaceUpdate(Surface surface) {
                Recorder.this.setLatestSurface(surface);
            }
        });
        Futures.addCallback(videoEncoderSession.getReadyToReleaseFuture(), new FutureCallback<Encoder>() { // from class: androidx.camera.video.Recorder.1
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(Encoder result) {
                Logger.d(Recorder.TAG, "VideoEncoder can be released: " + result);
                if (result == null) {
                    return;
                }
                if (Recorder.this.mSourceNonStreamingTimeout != null && Recorder.this.mSourceNonStreamingTimeout.cancel(false) && Recorder.this.mVideoEncoder != null && Recorder.this.mVideoEncoder == result) {
                    Recorder.notifyEncoderSourceStopped(Recorder.this.mVideoEncoder);
                }
                Recorder.this.mVideoEncoderSessionToRelease = videoEncoderSession;
                Recorder.this.setLatestSurface(null);
                Recorder.this.requestReset(4, null, Recorder.this.isPersistentRecordingInProgress());
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
                Logger.d(Recorder.TAG, "Error in ReadyToReleaseFuture: " + t);
            }
        }, this.mSequentialExecutor);
    }

    void onConfigured() {
        RecordingRecord recordingToStart = null;
        RecordingRecord pendingRecordingToFinalize = null;
        boolean continuePersistentRecording = false;
        int error = 0;
        Throwable errorCause = null;
        boolean recordingPaused = false;
        synchronized (this.mLock) {
            switch (this.mState) {
                case CONFIGURING:
                    setState(State.IDLING);
                    break;
                case PENDING_PAUSED:
                    recordingPaused = true;
                case PENDING_RECORDING:
                    if (this.mActiveRecordingRecord == null) {
                        if (this.mSourceState == VideoOutput.SourceState.INACTIVE) {
                            pendingRecordingToFinalize = this.mPendingRecordingRecord;
                            this.mPendingRecordingRecord = null;
                            restoreNonPendingState();
                            error = 4;
                            errorCause = PENDING_RECORDING_ERROR_CAUSE_SOURCE_INACTIVE;
                        } else {
                            recordingToStart = makePendingRecordingActiveLocked(this.mState);
                        }
                    }
                    break;
                case IDLING:
                case RESETTING:
                    throw new AssertionError("Incorrectly invoke onConfigured() in state " + this.mState);
                case PAUSED:
                    recordingPaused = true;
                case RECORDING:
                    Preconditions.checkState(isPersistentRecordingInProgress(), "Unexpectedly invoke onConfigured() when there's a non-persistent in-progress recording");
                    continuePersistentRecording = true;
                    break;
                case STOPPING:
                    if (!this.mEncoderNotUsePersistentInputSurface) {
                        throw new AssertionError("Unexpectedly invoke onConfigured() in a STOPPING state when it's not waiting for a new surface.");
                    }
                    break;
                case ERROR:
                    Logger.e(TAG, "onConfigured() was invoked when the Recorder had encountered error");
                    break;
            }
        }
        if (continuePersistentRecording) {
            updateEncoderCallbacks(this.mInProgressRecording, true);
            this.mVideoEncoder.start();
            if (this.mShouldSendResumeEvent) {
                this.mInProgressRecording.updateVideoRecordEvent(VideoRecordEvent.resume(this.mInProgressRecording.getOutputOptions(), getInProgressRecordingStats()));
                this.mShouldSendResumeEvent = false;
            }
            if (recordingPaused) {
                this.mVideoEncoder.pause();
                return;
            }
            return;
        }
        if (recordingToStart != null) {
            startRecording(recordingToStart, recordingPaused);
        } else if (pendingRecordingToFinalize != null) {
            finalizePendingRecording(pendingRecordingToFinalize, error, errorCause);
        }
    }

    private MediaSpec composeRecorderMediaSpec(MediaSpec mediaSpec) {
        MediaSpec.Builder mediaSpecBuilder = mediaSpec.toBuilder();
        VideoSpec videoSpec = mediaSpec.getVideoSpec();
        if (videoSpec.getAspectRatio() == -1) {
            mediaSpecBuilder.configureVideo(new Consumer() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda11
                @Override // androidx.core.util.Consumer
                public final void accept(Object obj) {
                    ((VideoSpec.Builder) obj).setAspectRatio(Recorder.VIDEO_SPEC_DEFAULT.getAspectRatio());
                }
            });
        }
        return mediaSpecBuilder.build();
    }

    private static boolean isSameRecording(Recording activeRecording, RecordingRecord recordingRecord) {
        return recordingRecord != null && activeRecording.getRecordingId() == recordingRecord.getRecordingId();
    }

    private void setupAudio(RecordingRecord recordingToStart) throws AudioSourceAccessException, InvalidConfigException {
        Rational expectedSampleRateRatio;
        MediaSpec mediaSpec = (MediaSpec) getObservableData(this.mMediaSpec);
        AudioMimeInfo audioMimeInfo = AudioConfigUtil.resolveAudioMimeInfo(mediaSpec, this.mResolvedEncoderProfiles);
        Timebase audioSourceTimebase = Timebase.UPTIME;
        VideoEncoderConfig videoEncoderConfig = (VideoEncoderConfig) Preconditions.checkNotNull(this.mVideoEncoderConfig);
        if (videoEncoderConfig.getCaptureFrameRate() != videoEncoderConfig.getEncodeFrameRate()) {
            expectedSampleRateRatio = new Rational(videoEncoderConfig.getCaptureFrameRate(), videoEncoderConfig.getEncodeFrameRate());
        } else {
            expectedSampleRateRatio = null;
        }
        AudioSettings audioSettings = AudioConfigUtil.resolveAudioSettings(audioMimeInfo, mediaSpec.getAudioSpec(), expectedSampleRateRatio);
        if (this.mAudioSource != null) {
            releaseCurrentAudioSource();
        }
        this.mAudioSource = setupAudioSource(recordingToStart, audioSettings);
        Logger.d(TAG, String.format("Set up new audio source: 0x%x", Integer.valueOf(this.mAudioSource.hashCode())));
        AudioEncoderConfig audioEncoderConfig = AudioConfigUtil.resolveAudioEncoderConfig(audioMimeInfo, audioSourceTimebase, audioSettings, mediaSpec.getAudioSpec());
        this.mAudioEncoder = this.mAudioEncoderFactory.createEncoder(this.mExecutor, audioEncoderConfig, ((SurfaceRequest) Preconditions.checkNotNull(this.mLatestSurfaceRequest)).getSessionType());
        Encoder.EncoderInput bufferProvider = this.mAudioEncoder.getInput();
        if (!(bufferProvider instanceof Encoder.ByteBufferInput)) {
            throw new AssertionError("The EncoderInput of audio isn't a ByteBufferInput.");
        }
        this.mAudioSource.setBufferProvider((Encoder.ByteBufferInput) bufferProvider);
    }

    private AudioSource setupAudioSource(RecordingRecord recordingToStart, AudioSettings audioSettings) throws AudioSourceAccessException {
        return recordingToStart.performOneTimeAudioSourceCreation(audioSettings, AUDIO_EXECUTOR);
    }

    private void releaseCurrentAudioSource() {
        if (this.mAudioSource == null) {
            throw new AssertionError("Cannot release null audio source.");
        }
        final AudioSource audioSource = this.mAudioSource;
        this.mAudioSource = null;
        Logger.d(TAG, String.format("Releasing audio source: 0x%x", Integer.valueOf(audioSource.hashCode())));
        Futures.addCallback(audioSource.release(), new FutureCallback<Void>() { // from class: androidx.camera.video.Recorder.2
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(Void result) {
                Logger.d(Recorder.TAG, String.format("Released audio source successfully: 0x%x", Integer.valueOf(audioSource.hashCode())));
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
                Logger.d(Recorder.TAG, String.format("An error occurred while attempting to release audio source: 0x%x", Integer.valueOf(audioSource.hashCode())));
            }
        }, CameraXExecutors.directExecutor());
    }

    void onEncoderSetupError(Throwable cause) {
        RecordingRecord pendingRecordingToFinalize = null;
        synchronized (this.mLock) {
            switch (this.mState) {
                case PENDING_RECORDING:
                case PENDING_PAUSED:
                    pendingRecordingToFinalize = this.mPendingRecordingRecord;
                    this.mPendingRecordingRecord = null;
                case CONFIGURING:
                    setStreamId(-1);
                    setState(State.ERROR);
                    break;
                case IDLING:
                case RECORDING:
                case PAUSED:
                case STOPPING:
                case RESETTING:
                    throw new AssertionError("Encountered encoder setup error while in unexpected state " + this.mState + ": " + cause);
            }
        }
        if (pendingRecordingToFinalize != null) {
            finalizePendingRecording(pendingRecordingToFinalize, 7, cause);
        }
    }

    void setupAndStartMediaMuxer(RecordingRecord recordingToStart) {
        if (this.mMediaMuxer != null) {
            throw new AssertionError("Unable to set up media muxer when one already exists.");
        }
        if (isAudioEnabled() && this.mPendingAudioRingBuffer.isEmpty()) {
            throw new AssertionError("Audio is enabled but no audio sample is ready. Cannot start media muxer.");
        }
        if (this.mPendingFirstVideoData == null) {
            throw new AssertionError("Media muxer cannot be started without an encoded video frame.");
        }
        EncodedData videoDataToWrite = this.mPendingFirstVideoData;
        try {
            this.mPendingFirstVideoData = null;
            List<EncodedData> audioDataToWrite = getAudioDataToWriteAndClearCache(videoDataToWrite.getPresentationTimeUs());
            long firstDataSize = videoDataToWrite.size();
            for (EncodedData data : audioDataToWrite) {
                firstDataSize += data.size();
            }
            if (this.mFileSizeLimitInBytes != 0 && firstDataSize > this.mFileSizeLimitInBytes) {
                Logger.d(TAG, String.format("Initial data exceeds file size limit %d > %d", Long.valueOf(firstDataSize), Long.valueOf(this.mFileSizeLimitInBytes)));
                onInProgressRecordingInternalError(recordingToStart, 2, null);
                if (videoDataToWrite != null) {
                    videoDataToWrite.close();
                    return;
                }
                return;
            }
            int error = 3;
            try {
                MediaSpec mediaSpec = (MediaSpec) getObservableData(this.mMediaSpec);
                int muxerOutputFormat = mediaSpec.getOutputFormat() == -1 ? supportedMuxerFormatOrDefaultFrom(this.mResolvedEncoderProfiles, MediaSpec.outputFormatToMuxerFormat(MEDIA_SPEC_DEFAULT.getOutputFormat())) : MediaSpec.outputFormatToMuxerFormat(mediaSpec.getOutputFormat());
                MediaMuxer mediaMuxer = recordingToStart.performOneTimeMediaMuxerCreation(muxerOutputFormat, new Consumer() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda18
                    @Override // androidx.core.util.Consumer
                    public final void accept(Object obj) {
                        Recorder.this.m248lambda$setupAndStartMediaMuxer$10$androidxcameravideoRecorder((Uri) obj);
                    }
                });
                SurfaceRequest.TransformationInfo transformationInfo = this.mSourceTransformationInfo;
                if (transformationInfo != null) {
                    setInProgressTransformationInfo(transformationInfo);
                    mediaMuxer.setOrientationHint(transformationInfo.getRotationDegrees());
                }
                Location location = recordingToStart.getOutputOptions().getLocation();
                if (location != null) {
                    try {
                        Pair<Double, Double> geoLocation = CorrectNegativeLatLongForMediaMuxer.adjustGeoLocation(location.getLatitude(), location.getLongitude());
                        mediaMuxer.setLocation((float) ((Double) geoLocation.first).doubleValue(), (float) ((Double) geoLocation.second).doubleValue());
                    } catch (IllegalArgumentException e) {
                        mediaMuxer.release();
                        onInProgressRecordingInternalError(recordingToStart, 5, e);
                        if (videoDataToWrite != null) {
                            videoDataToWrite.close();
                            return;
                        }
                        return;
                    }
                }
                this.mVideoTrackIndex = Integer.valueOf(mediaMuxer.addTrack(this.mVideoOutputConfig.getMediaFormat()));
                if (isAudioEnabled()) {
                    this.mAudioTrackIndex = Integer.valueOf(mediaMuxer.addTrack(this.mAudioOutputConfig.getMediaFormat()));
                }
                try {
                    mediaMuxer.start();
                    this.mMediaMuxer = mediaMuxer;
                    writeVideoData(videoDataToWrite, recordingToStart);
                    for (EncodedData data2 : audioDataToWrite) {
                        writeAudioData(data2, recordingToStart);
                    }
                    if (videoDataToWrite != null) {
                        videoDataToWrite.close();
                    }
                } catch (IllegalStateException e2) {
                    long availableBytes = ((OutputStorage) Preconditions.checkNotNull(this.mOutputStorage)).getAvailableBytes();
                    int error2 = availableBytes < this.mRequiredFreeStorageBytes ? 3 : 1;
                    onInProgressRecordingInternalError(recordingToStart, error2, e2);
                    if (videoDataToWrite != null) {
                        videoDataToWrite.close();
                    }
                }
            } catch (IOException e3) {
                if (!StorageUtil.isStorageFullException(e3)) {
                    error = 5;
                }
                onInProgressRecordingInternalError(recordingToStart, error, e3);
                if (videoDataToWrite != null) {
                    videoDataToWrite.close();
                }
            }
        } catch (Throwable th) {
            if (videoDataToWrite != null) {
                try {
                    videoDataToWrite.close();
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                }
            }
            throw th;
        }
    }

    /* renamed from: lambda$setupAndStartMediaMuxer$10$androidx-camera-video-Recorder, reason: not valid java name */
    /* synthetic */ void m248lambda$setupAndStartMediaMuxer$10$androidxcameravideoRecorder(Uri uri) {
        this.mOutputUri = uri;
    }

    private List<EncodedData> getAudioDataToWriteAndClearCache(long firstVideoDataTimeUs) {
        List<EncodedData> res = new ArrayList<>();
        while (!this.mPendingAudioRingBuffer.isEmpty()) {
            EncodedData data = this.mPendingAudioRingBuffer.dequeue();
            if (data.getPresentationTimeUs() >= firstVideoDataTimeUs) {
                res.add(data);
            }
        }
        return res;
    }

    private void startInternal(RecordingRecord recordingToStart) {
        AudioState audioState;
        if (this.mInProgressRecording != null) {
            throw new AssertionError("Attempted to start a new recording while another was in progress.");
        }
        this.mInProgressRecording = recordingToStart;
        this.mOutputStorage = this.mOutputStorageFactory.create(recordingToStart.getOutputOptions());
        long availableBytes = this.mOutputStorage.getAvailableBytes();
        Logger.d(TAG, "availableBytes = " + StorageUtil.formatSize(availableBytes));
        if (availableBytes < this.mRequiredFreeStorageBytes) {
            finalizeInProgressRecording(3, new IOException(String.format(INSUFFICIENT_STORAGE_ERROR_MSG, Long.valueOf(availableBytes), Long.valueOf(this.mRequiredFreeStorageBytes))));
            return;
        }
        this.mAvailableBytesAboveRequired = availableBytes - this.mRequiredFreeStorageBytes;
        if (recordingToStart.getOutputOptions().getFileSizeLimit() > 0) {
            this.mFileSizeLimitInBytes = Math.round(recordingToStart.getOutputOptions().getFileSizeLimit() * 0.95d);
            Logger.d(TAG, "File size limit in bytes: " + this.mFileSizeLimitInBytes);
        } else {
            this.mFileSizeLimitInBytes = 0L;
        }
        if (recordingToStart.getOutputOptions().getDurationLimitMillis() > 0) {
            this.mDurationLimitNs = TimeUnit.MILLISECONDS.toNanos(recordingToStart.getOutputOptions().getDurationLimitMillis());
            Logger.d(TAG, "Duration limit in nanoseconds: " + this.mDurationLimitNs);
        } else {
            this.mDurationLimitNs = 0L;
        }
        switch (this.mAudioState) {
            case INITIALIZING:
                if (recordingToStart.hasAudioEnabled()) {
                    if (!isAudioSupported()) {
                        throw new AssertionError("The Recorder doesn't support recording with audio");
                    }
                    try {
                        if (!this.mInProgressRecording.isPersistent() || this.mAudioEncoder == null) {
                            setupAudio(recordingToStart);
                        }
                        setAudioState(AudioState.ENABLED);
                        break;
                    } catch (AudioSourceAccessException | InvalidConfigException e) {
                        Logger.e(TAG, "Unable to create audio resource with error: ", e);
                        if (e instanceof InvalidConfigException) {
                            audioState = AudioState.ERROR_ENCODER;
                        } else {
                            audioState = AudioState.ERROR_SOURCE;
                        }
                        setAudioState(audioState);
                        this.mAudioErrorCause = e;
                        break;
                    }
                }
                break;
            case IDLING:
                setAudioState(recordingToStart.hasAudioEnabled() ? AudioState.ENABLED : AudioState.DISABLED);
                break;
            case DISABLED:
            case ENABLED:
            case ERROR_ENCODER:
            case ERROR_SOURCE:
                throw new AssertionError("Incorrectly invoke startInternal in audio state " + this.mAudioState);
        }
        updateEncoderCallbacks(recordingToStart, false);
        if (isAudioEnabled()) {
            this.mAudioSource.start(recordingToStart.isMuted());
            this.mAudioEncoder.start();
        }
        this.mVideoEncoder.start();
        this.mInProgressRecording.updateVideoRecordEvent(VideoRecordEvent.start(this.mInProgressRecording.getOutputOptions(), getInProgressRecordingStats()));
    }

    private void updateEncoderCallbacks(final RecordingRecord recordingToStart, boolean videoOnly) {
        if (!this.mEncodingFutures.isEmpty()) {
            ListenableFuture<List<Void>> listFuture = Futures.allAsList(this.mEncodingFutures);
            if (!listFuture.isDone()) {
                listFuture.cancel(true);
            }
            this.mEncodingFutures.clear();
        }
        this.mEncodingFutures.add(CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda3
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return Recorder.this.m251lambda$updateEncoderCallbacks$11$androidxcameravideoRecorder(recordingToStart, completer);
            }
        }));
        if (isAudioEnabled() && !videoOnly) {
            this.mEncodingFutures.add(CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda4
                @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                    return Recorder.this.m253lambda$updateEncoderCallbacks$13$androidxcameravideoRecorder(recordingToStart, completer);
                }
            }));
        }
        Futures.addCallback(Futures.allAsList(this.mEncodingFutures), new FutureCallback<List<Void>>() { // from class: androidx.camera.video.Recorder.6
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(List<Void> result) {
                Logger.d(Recorder.TAG, "Encodings end successfully.");
                Recorder.this.finalizeInProgressRecording(Recorder.this.mRecordingStopError, Recorder.this.mRecordingStopErrorCause);
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
                Preconditions.checkState(Recorder.this.mInProgressRecording != null, "In-progress recording shouldn't be null");
                if (!Recorder.this.mInProgressRecording.isPersistent()) {
                    Logger.d(Recorder.TAG, "Encodings end with error: " + t);
                    Recorder.this.finalizeInProgressRecording(Recorder.this.mMediaMuxer == null ? 8 : 6, t);
                }
            }
        }, CameraXExecutors.directExecutor());
    }

    /* renamed from: lambda$updateEncoderCallbacks$11$androidx-camera-video-Recorder, reason: not valid java name */
    /* synthetic */ Object m251lambda$updateEncoderCallbacks$11$androidxcameravideoRecorder(final RecordingRecord recordingToStart, final CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mVideoEncoder.setEncoderCallback(new EncoderCallback() { // from class: androidx.camera.video.Recorder.3
            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public /* synthetic */ void onEncodePaused() {
                EncoderCallback.CC.$default$onEncodePaused(this);
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onEncodeStart() {
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onEncodeStop() {
                completer.set(null);
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onEncodeError(EncodeException e) {
                completer.setException(e);
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onEncodedData(EncodedData encodedData) {
                if (Recorder.this.mMediaMuxer == null) {
                    if (!Recorder.this.mInProgressRecordingStopping) {
                        boolean cachedDataDropped = false;
                        if (Recorder.this.mPendingFirstVideoData != null) {
                            cachedDataDropped = true;
                            Recorder.this.mPendingFirstVideoData.close();
                            Recorder.this.mPendingFirstVideoData = null;
                        }
                        if (encodedData.isKeyFrame()) {
                            Recorder.this.mPendingFirstVideoData = encodedData;
                            if (!Recorder.this.isAudioEnabled() || !Recorder.this.mPendingAudioRingBuffer.isEmpty()) {
                                Logger.d(Recorder.TAG, "Received video keyframe. Starting muxer...");
                                Recorder.this.setupAndStartMediaMuxer(recordingToStart);
                                return;
                            } else if (cachedDataDropped) {
                                Logger.d(Recorder.TAG, "Replaced cached video keyframe with newer keyframe.");
                                return;
                            } else {
                                Logger.d(Recorder.TAG, "Cached video keyframe while we wait for first audio sample before starting muxer.");
                                return;
                            }
                        }
                        if (cachedDataDropped) {
                            Logger.d(Recorder.TAG, "Dropped cached keyframe since we have new video data and have not yet received audio data.");
                        }
                        Logger.d(Recorder.TAG, "Dropped video data since muxer has not yet started and data is not a keyframe.");
                        Recorder.this.mVideoEncoder.requestKeyFrame();
                        encodedData.close();
                        return;
                    }
                    Logger.d(Recorder.TAG, "Drop video data since recording is stopping.");
                    encodedData.close();
                    return;
                }
                try {
                    Recorder.this.writeVideoData(encodedData, recordingToStart);
                    if (encodedData != null) {
                        encodedData.close();
                    }
                } catch (Throwable th) {
                    if (encodedData != null) {
                        try {
                            encodedData.close();
                        } catch (Throwable th2) {
                            th.addSuppressed(th2);
                        }
                    }
                    throw th;
                }
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onOutputConfigUpdate(OutputConfig outputConfig) {
                Recorder.this.mVideoOutputConfig = outputConfig;
            }
        }, this.mSequentialExecutor);
        return "videoEncodingFuture";
    }

    /* renamed from: lambda$updateEncoderCallbacks$13$androidx-camera-video-Recorder, reason: not valid java name */
    /* synthetic */ Object m253lambda$updateEncoderCallbacks$13$androidxcameravideoRecorder(final RecordingRecord recordingToStart, final CallbackToFutureAdapter.Completer completer) throws Exception {
        final Consumer<Throwable> audioErrorConsumer = new Consumer() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda2
            @Override // androidx.core.util.Consumer
            public final void accept(Object obj) {
                Recorder.this.m252lambda$updateEncoderCallbacks$12$androidxcameravideoRecorder(completer, (Throwable) obj);
            }
        };
        this.mAudioSource.setAudioSourceCallback(this.mSequentialExecutor, new AudioSource.AudioSourceCallback() { // from class: androidx.camera.video.Recorder.4
            @Override // androidx.camera.video.internal.audio.AudioSource.AudioSourceCallback
            public /* synthetic */ void onSuspendStateChanged(boolean z) {
                AudioSource.AudioSourceCallback.CC.$default$onSuspendStateChanged(this, z);
            }

            @Override // androidx.camera.video.internal.audio.AudioSource.AudioSourceCallback
            public void onSilenceStateChanged(boolean silenced) {
                if (Recorder.this.mIsAudioSourceSilenced != silenced) {
                    Recorder.this.mIsAudioSourceSilenced = silenced;
                    Recorder.this.updateInProgressStatusEvent(true);
                } else {
                    Logger.w(Recorder.TAG, "Audio source silenced transitions to the same state " + silenced);
                }
            }

            @Override // androidx.camera.video.internal.audio.AudioSource.AudioSourceCallback
            public void onError(Throwable throwable) {
                Logger.e(Recorder.TAG, "Error occurred after audio source started.", throwable);
                if (throwable instanceof AudioSourceAccessException) {
                    audioErrorConsumer.accept(throwable);
                }
            }

            @Override // androidx.camera.video.internal.audio.AudioSource.AudioSourceCallback
            public void onAmplitudeValue(double maxAmplitude) {
                Recorder.this.mAudioAmplitude = maxAmplitude;
            }
        });
        this.mAudioEncoder.setEncoderCallback(new EncoderCallback() { // from class: androidx.camera.video.Recorder.5
            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public /* synthetic */ void onEncodePaused() {
                EncoderCallback.CC.$default$onEncodePaused(this);
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onEncodeStart() {
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onEncodeStop() {
                completer.set(null);
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onEncodeError(EncodeException e) {
                if (Recorder.this.mAudioErrorCause == null) {
                    audioErrorConsumer.accept(e);
                }
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onEncodedData(EncodedData encodedData) {
                if (Recorder.this.mAudioState == AudioState.DISABLED) {
                    encodedData.close();
                    throw new AssertionError("Audio is not enabled but audio encoded data is being produced.");
                }
                if (Recorder.this.mMediaMuxer == null) {
                    if (!Recorder.this.mInProgressRecordingStopping) {
                        Recorder.this.mPendingAudioRingBuffer.enqueue(new BufferCopiedEncodedData(encodedData));
                        if (Recorder.this.mPendingFirstVideoData != null) {
                            Logger.d(Recorder.TAG, "Received audio data. Starting muxer...");
                            Recorder.this.setupAndStartMediaMuxer(recordingToStart);
                        } else {
                            Logger.d(Recorder.TAG, "Cached audio data while we wait for video keyframe before starting muxer.");
                        }
                    } else {
                        Logger.d(Recorder.TAG, "Drop audio data since recording is stopping.");
                    }
                    encodedData.close();
                    return;
                }
                try {
                    Recorder.this.writeAudioData(encodedData, recordingToStart);
                    if (encodedData != null) {
                        encodedData.close();
                    }
                } catch (Throwable th) {
                    if (encodedData != null) {
                        try {
                            encodedData.close();
                        } catch (Throwable th2) {
                            th.addSuppressed(th2);
                        }
                    }
                    throw th;
                }
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onOutputConfigUpdate(OutputConfig outputConfig) {
                Recorder.this.mAudioOutputConfig = outputConfig;
            }
        }, this.mSequentialExecutor);
        return "audioEncodingFuture";
    }

    /* renamed from: lambda$updateEncoderCallbacks$12$androidx-camera-video-Recorder, reason: not valid java name */
    /* synthetic */ void m252lambda$updateEncoderCallbacks$12$androidxcameravideoRecorder(CallbackToFutureAdapter.Completer completer, Throwable throwable) {
        if (this.mAudioErrorCause == null) {
            if (throwable instanceof EncodeException) {
                setAudioState(AudioState.ERROR_ENCODER);
            } else {
                setAudioState(AudioState.ERROR_SOURCE);
            }
            this.mAudioErrorCause = throwable;
            updateInProgressStatusEvent(true);
            completer.set(null);
        }
    }

    void writeVideoData(EncodedData encodedData, RecordingRecord recording) {
        int i;
        String str;
        if (this.mVideoTrackIndex == null) {
            throw new AssertionError("Video data comes before the track is added to MediaMuxer.");
        }
        long newRecordingBytes = this.mRecordingBytes + encodedData.size();
        if (this.mFileSizeLimitInBytes != 0 && newRecordingBytes > this.mFileSizeLimitInBytes) {
            Logger.d(TAG, String.format("Reach file size limit %d > %d", Long.valueOf(newRecordingBytes), Long.valueOf(this.mFileSizeLimitInBytes)));
            onInProgressRecordingInternalError(recording, 2, null);
            return;
        }
        long newRecordingDurationNs = 0;
        long currentPresentationTimeUs = encodedData.getPresentationTimeUs();
        if (this.mFirstRecordingVideoDataTimeUs == Long.MAX_VALUE) {
            this.mFirstRecordingVideoDataTimeUs = currentPresentationTimeUs;
            Logger.d(TAG, String.format("First video time: %d (%s)", Long.valueOf(this.mFirstRecordingVideoDataTimeUs), DebugUtils.readableUs(this.mFirstRecordingVideoDataTimeUs)));
            str = TAG;
            i = 1;
        } else {
            i = 1;
            long newRecordingDurationNs2 = TimeUnit.MICROSECONDS.toNanos(currentPresentationTimeUs - Math.min(this.mFirstRecordingVideoDataTimeUs, this.mFirstRecordingAudioDataTimeUs));
            Preconditions.checkState(this.mPreviousRecordingVideoDataTimeUs != Long.MAX_VALUE, "There should be a previous data for adjusting the duration.");
            long adjustedDurationNs = TimeUnit.MICROSECONDS.toNanos(currentPresentationTimeUs - this.mPreviousRecordingVideoDataTimeUs) + newRecordingDurationNs2;
            str = TAG;
            if (this.mDurationLimitNs != 0 && adjustedDurationNs > this.mDurationLimitNs) {
                Logger.d(str, String.format("Video data reaches duration limit %d > %d", Long.valueOf(adjustedDurationNs), Long.valueOf(this.mDurationLimitNs)));
                onInProgressRecordingInternalError(recording, 9, null);
                return;
            }
            newRecordingDurationNs = newRecordingDurationNs2;
        }
        try {
            this.mMediaMuxer.writeSampleData(this.mVideoTrackIndex.intValue(), encodedData.getByteBuffer(), encodedData.getBufferInfo());
            this.mRecordingBytes = newRecordingBytes;
            this.mRecordingDurationNs = newRecordingDurationNs;
            this.mPreviousRecordingVideoDataTimeUs = currentPresentationTimeUs;
            updateInProgressStatusEvent(encodedData.isKeyFrame());
            if (newRecordingBytes > this.mAvailableBytesAboveRequired) {
                long availableBytes = ((OutputStorage) Preconditions.checkNotNull(this.mOutputStorage)).getAvailableBytes();
                Logger.d(str, "availableBytes = " + StorageUtil.formatSize(availableBytes));
                if (availableBytes >= this.mRequiredFreeStorageBytes) {
                    this.mAvailableBytesAboveRequired = availableBytes - this.mRequiredFreeStorageBytes;
                    return;
                }
                Long valueOf = Long.valueOf(availableBytes);
                Long valueOf2 = Long.valueOf(this.mRequiredFreeStorageBytes);
                Object[] objArr = new Object[2];
                objArr[0] = valueOf;
                objArr[i] = valueOf2;
                onInProgressRecordingInternalError(recording, 3, new IOException(String.format(INSUFFICIENT_STORAGE_ERROR_MSG, objArr)));
            }
        } catch (IllegalStateException e) {
            int error = ((OutputStorage) Preconditions.checkNotNull(this.mOutputStorage)).getAvailableBytes() < this.mRequiredFreeStorageBytes ? 3 : i;
            onInProgressRecordingInternalError(recording, error, e);
        }
    }

    void writeAudioData(EncodedData encodedData, RecordingRecord recording) {
        int i;
        long newRecordingBytes = this.mRecordingBytes + encodedData.size();
        if (this.mFileSizeLimitInBytes != 0 && newRecordingBytes > this.mFileSizeLimitInBytes) {
            Logger.d(TAG, String.format("Reach file size limit %d > %d", Long.valueOf(newRecordingBytes), Long.valueOf(this.mFileSizeLimitInBytes)));
            onInProgressRecordingInternalError(recording, 2, null);
            return;
        }
        long currentPresentationTimeUs = encodedData.getPresentationTimeUs();
        if (this.mFirstRecordingAudioDataTimeUs == Long.MAX_VALUE) {
            this.mFirstRecordingAudioDataTimeUs = currentPresentationTimeUs;
            Logger.d(TAG, String.format("First audio time: %d (%s)", Long.valueOf(this.mFirstRecordingAudioDataTimeUs), DebugUtils.readableUs(this.mFirstRecordingAudioDataTimeUs)));
            i = 1;
        } else {
            i = 1;
            long newRecordingDurationNs = TimeUnit.MICROSECONDS.toNanos(currentPresentationTimeUs - Math.min(this.mFirstRecordingVideoDataTimeUs, this.mFirstRecordingAudioDataTimeUs));
            Preconditions.checkState(this.mPreviousRecordingAudioDataTimeUs != Long.MAX_VALUE, "There should be a previous data for adjusting the duration.");
            long adjustedDurationNs = TimeUnit.MICROSECONDS.toNanos(currentPresentationTimeUs - this.mPreviousRecordingAudioDataTimeUs) + newRecordingDurationNs;
            if (this.mDurationLimitNs != 0 && adjustedDurationNs > this.mDurationLimitNs) {
                Logger.d(TAG, String.format("Audio data reaches duration limit %d > %d", Long.valueOf(adjustedDurationNs), Long.valueOf(this.mDurationLimitNs)));
                onInProgressRecordingInternalError(recording, 9, null);
                return;
            }
        }
        try {
            this.mMediaMuxer.writeSampleData(this.mAudioTrackIndex.intValue(), encodedData.getByteBuffer(), encodedData.getBufferInfo());
            this.mRecordingBytes = newRecordingBytes;
            this.mRecordingAudioBytes += encodedData.size();
            this.mPreviousRecordingAudioDataTimeUs = currentPresentationTimeUs;
        } catch (IllegalStateException e) {
            long availableBytes = ((OutputStorage) Preconditions.checkNotNull(this.mOutputStorage)).getAvailableBytes();
            int error = availableBytes < this.mRequiredFreeStorageBytes ? 3 : i;
            onInProgressRecordingInternalError(recording, error, e);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: pauseInternal, reason: merged with bridge method [inline-methods] */
    public void m246lambda$pause$4$androidxcameravideoRecorder(RecordingRecord recordingToPause) {
        if (this.mInProgressRecording == recordingToPause && !this.mInProgressRecordingStopping) {
            if (isAudioEnabled()) {
                this.mAudioEncoder.pause();
            }
            this.mVideoEncoder.pause();
            this.mInProgressRecording.updateVideoRecordEvent(VideoRecordEvent.pause(this.mInProgressRecording.getOutputOptions(), getInProgressRecordingStats()));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: resumeInternal, reason: merged with bridge method [inline-methods] */
    public void m247lambda$resume$5$androidxcameravideoRecorder(RecordingRecord recordingToResume) {
        if (this.mInProgressRecording == recordingToResume && !this.mInProgressRecordingStopping) {
            if (isAudioEnabled()) {
                this.mAudioEncoder.start();
            }
            if (this.mVideoEncoder != null) {
                this.mVideoEncoder.start();
                this.mInProgressRecording.updateVideoRecordEvent(VideoRecordEvent.resume(this.mInProgressRecording.getOutputOptions(), getInProgressRecordingStats()));
            } else {
                this.mShouldSendResumeEvent = true;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: stopInternal, reason: merged with bridge method [inline-methods] */
    public void m250lambda$stop$6$androidxcameravideoRecorder(RecordingRecord recordingToStop, long explicitlyStopTime, int stopError, Throwable errorCause) {
        if (this.mInProgressRecording == recordingToStop && !this.mInProgressRecordingStopping) {
            this.mInProgressRecordingStopping = true;
            this.mRecordingStopError = stopError;
            this.mRecordingStopErrorCause = errorCause;
            if (isAudioEnabled()) {
                clearPendingAudioRingBuffer();
                this.mAudioEncoder.stop(explicitlyStopTime);
            }
            if (this.mPendingFirstVideoData != null) {
                this.mPendingFirstVideoData.close();
                this.mPendingFirstVideoData = null;
            }
            if (this.mSourceState != VideoOutput.SourceState.ACTIVE_NON_STREAMING) {
                final Encoder finalVideoEncoder = this.mVideoEncoder;
                this.mSourceNonStreamingTimeout = scheduleTask(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda19
                    @Override // java.lang.Runnable
                    public final void run() {
                        Recorder.lambda$stopInternal$14(Encoder.this);
                    }
                }, this.mSequentialExecutor, 1000L, TimeUnit.MILLISECONDS);
            } else {
                notifyEncoderSourceStopped(this.mVideoEncoder);
            }
            this.mVideoEncoder.stop(explicitlyStopTime);
        }
    }

    static /* synthetic */ void lambda$stopInternal$14(Encoder finalVideoEncoder) {
        Logger.d(TAG, "The source didn't become non-streaming before timeout. Waited 1000ms");
        if (DeviceQuirks.get(DeactivateEncoderSurfaceBeforeStopEncoderQuirk.class) != null) {
            notifyEncoderSourceStopped(finalVideoEncoder);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: muteInternal, reason: merged with bridge method [inline-methods] */
    public void m243lambda$mute$7$androidxcameravideoRecorder(RecordingRecord recordingToMute, boolean muted) {
        if (recordingToMute.isMuted() == muted) {
            return;
        }
        recordingToMute.mute(muted);
        if (this.mInProgressRecording == recordingToMute && !this.mInProgressRecordingStopping && this.mAudioSource != null) {
            this.mAudioSource.mute(muted);
        }
    }

    static void notifyEncoderSourceStopped(Encoder encoder) {
        if (encoder instanceof EncoderImpl) {
            ((EncoderImpl) encoder).signalSourceStopped();
        }
    }

    private void clearPendingAudioRingBuffer() {
        while (!this.mPendingAudioRingBuffer.isEmpty()) {
            this.mPendingAudioRingBuffer.dequeue();
        }
    }

    private void reset() {
        if (this.mAudioEncoder != null) {
            Logger.d(TAG, "Releasing audio encoder.");
            this.mAudioEncoder.release();
            this.mAudioEncoder = null;
            this.mAudioOutputConfig = null;
        }
        if (this.mAudioSource != null) {
            releaseCurrentAudioSource();
        }
        setAudioState(AudioState.INITIALIZING);
        resetVideo();
    }

    private void tryReleaseVideoEncoder() {
        if (this.mVideoEncoderSessionToRelease != null) {
            Preconditions.checkState(this.mVideoEncoderSessionToRelease.getVideoEncoder() == this.mVideoEncoder);
            Logger.d(TAG, "Releasing video encoder: " + this.mVideoEncoder);
            this.mVideoEncoderSessionToRelease.terminateNow();
            this.mVideoEncoderSessionToRelease = null;
            this.mVideoEncoder = null;
            this.mVideoOutputConfig = null;
            setLatestSurface(null);
            return;
        }
        safeToCloseVideoEncoder();
    }

    private void onResetVideo() {
        boolean shouldConfigure = true;
        synchronized (this.mLock) {
            switch (this.mState.ordinal()) {
                case 1:
                case 2:
                    updateNonPendingState(State.CONFIGURING);
                    break;
                case 4:
                case 5:
                case 8:
                    if (isPersistentRecordingInProgress()) {
                        shouldConfigure = false;
                        break;
                    }
                case 3:
                case 6:
                case 7:
                    setState(State.CONFIGURING);
                    break;
            }
        }
        this.mNeedsResetBeforeNextStart = false;
        if (shouldConfigure && this.mLatestSurfaceRequest != null && !this.mLatestSurfaceRequest.isServiced()) {
            configureInternal(this.mLatestSurfaceRequest, this.mVideoSourceTimebase, false);
        }
    }

    private void resetVideo() {
        if (this.mVideoEncoder != null) {
            Logger.d(TAG, "Releasing video encoder.");
            tryReleaseVideoEncoder();
        }
        onResetVideo();
    }

    private int internalAudioStateToAudioStatsState(AudioState audioState) {
        switch (audioState) {
            case INITIALIZING:
            case IDLING:
            case DISABLED:
                return 1;
            case ENABLED:
                if (this.mInProgressRecording != null && this.mInProgressRecording.isMuted()) {
                    return 5;
                }
                if (this.mIsAudioSourceSilenced) {
                    return 2;
                }
                return 0;
            case ERROR_ENCODER:
                return 3;
            case ERROR_SOURCE:
                return 4;
            default:
                throw new AssertionError("Invalid internal audio state: " + audioState);
        }
    }

    private StreamInfo.StreamState internalStateToStreamState(State state) {
        DeactivateEncoderSurfaceBeforeStopEncoderQuirk quirk = (DeactivateEncoderSurfaceBeforeStopEncoderQuirk) DeviceQuirks.get(DeactivateEncoderSurfaceBeforeStopEncoderQuirk.class);
        return (state == State.RECORDING || (state == State.STOPPING && quirk == null)) ? StreamInfo.StreamState.ACTIVE : StreamInfo.StreamState.INACTIVE;
    }

    boolean isAudioEnabled() {
        return this.mAudioState == AudioState.ENABLED;
    }

    void finalizeInProgressRecording(int error, Throwable throwable) {
        VideoRecordEvent.Finalize finalizeWithError;
        if (this.mInProgressRecording == null) {
            throw new AssertionError("Attempted to finalize in-progress recording, but no recording is in progress.");
        }
        int errorToSend = error;
        if (this.mMediaMuxer != null) {
            try {
                this.mMediaMuxer.stop();
                this.mMediaMuxer.release();
            } catch (IllegalStateException e) {
                Logger.e(TAG, "MediaMuxer failed to stop or release with error: " + e.getMessage(), e);
                if (errorToSend == 0) {
                    long availableBytes = ((OutputStorage) Preconditions.checkNotNull(this.mOutputStorage)).getAvailableBytes();
                    errorToSend = availableBytes < this.mRequiredFreeStorageBytes ? 3 : this.mRecordingAudioBytes == 0 ? 8 : 1;
                }
            }
            this.mMediaMuxer = null;
        } else if (errorToSend == 0) {
            errorToSend = 8;
        }
        this.mInProgressRecording.finalizeRecording(this.mOutputUri);
        OutputOptions outputOptions = this.mInProgressRecording.getOutputOptions();
        RecordingStats stats = getInProgressRecordingStats();
        OutputResults outputResults = OutputResults.of(this.mOutputUri);
        RecordingRecord recordingRecord = this.mInProgressRecording;
        if (errorToSend == 0) {
            finalizeWithError = VideoRecordEvent.finalize(outputOptions, stats, outputResults);
        } else {
            finalizeWithError = VideoRecordEvent.finalizeWithError(outputOptions, stats, outputResults, errorToSend, throwable);
        }
        recordingRecord.updateVideoRecordEvent(finalizeWithError);
        RecordingRecord finalizedRecording = this.mInProgressRecording;
        this.mInProgressRecording = null;
        this.mInProgressRecordingStopping = false;
        this.mAudioTrackIndex = null;
        this.mVideoTrackIndex = null;
        this.mEncodingFutures.clear();
        this.mOutputUri = Uri.EMPTY;
        this.mRecordingBytes = 0L;
        this.mRecordingAudioBytes = 0L;
        this.mRecordingDurationNs = 0L;
        this.mFirstRecordingVideoDataTimeUs = Long.MAX_VALUE;
        this.mFirstRecordingAudioDataTimeUs = Long.MAX_VALUE;
        this.mPreviousRecordingVideoDataTimeUs = Long.MAX_VALUE;
        this.mPreviousRecordingAudioDataTimeUs = Long.MAX_VALUE;
        this.mRecordingStopError = 1;
        this.mRecordingStopErrorCause = null;
        this.mAudioErrorCause = null;
        this.mAudioAmplitude = AudioStats.AUDIO_AMPLITUDE_NONE;
        this.mOutputStorage = null;
        this.mAvailableBytesAboveRequired = Long.MAX_VALUE;
        clearPendingAudioRingBuffer();
        setInProgressTransformationInfo(null);
        switch (this.mAudioState) {
            case DISABLED:
            case ENABLED:
                setAudioState(AudioState.IDLING);
                this.mAudioSource.stop();
                break;
            case ERROR_ENCODER:
            case ERROR_SOURCE:
                setAudioState(AudioState.INITIALIZING);
                break;
        }
        onRecordingFinalized(finalizedRecording);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:26:0x006b A[Catch: all -> 0x00d2, TryCatch #0 {, blocks: (B:4:0x000a, B:6:0x000e, B:7:0x0020, B:11:0x002a, B:13:0x002e, B:15:0x0034, B:18:0x003d, B:19:0x0043, B:20:0x0049, B:21:0x0063, B:24:0x0065, B:26:0x006b, B:27:0x007a, B:29:0x007e, B:31:0x0084, B:34:0x008d, B:35:0x0093, B:37:0x0097, B:38:0x00a0, B:56:0x00ca, B:57:0x00d1), top: B:3:0x000a }] */
    /* JADX WARN: Removed duplicated region for block: B:27:0x007a A[Catch: all -> 0x00d2, TryCatch #0 {, blocks: (B:4:0x000a, B:6:0x000e, B:7:0x0020, B:11:0x002a, B:13:0x002e, B:15:0x0034, B:18:0x003d, B:19:0x0043, B:20:0x0049, B:21:0x0063, B:24:0x0065, B:26:0x006b, B:27:0x007a, B:29:0x007e, B:31:0x0084, B:34:0x008d, B:35:0x0093, B:37:0x0097, B:38:0x00a0, B:56:0x00ca, B:57:0x00d1), top: B:3:0x000a }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void onRecordingFinalized(androidx.camera.video.Recorder.RecordingRecord r12) {
        /*
            Method dump skipped, instructions count: 236
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.video.Recorder.onRecordingFinalized(androidx.camera.video.Recorder$RecordingRecord):void");
    }

    void onInProgressRecordingInternalError(RecordingRecord recording, int error, Throwable cause) {
        if (recording != this.mInProgressRecording) {
            throw new AssertionError("Internal error occurred on recording that is not the current in-progress recording.");
        }
        boolean needsStop = false;
        synchronized (this.mLock) {
            try {
                try {
                    switch (this.mState) {
                        case CONFIGURING:
                        case IDLING:
                        case ERROR:
                            throw new AssertionError("In-progress recording error occurred while in unexpected state: " + this.mState);
                        case RECORDING:
                        case PAUSED:
                            setState(State.STOPPING);
                            needsStop = true;
                        case PENDING_RECORDING:
                        case PENDING_PAUSED:
                        case STOPPING:
                        case RESETTING:
                            if (recording != this.mActiveRecordingRecord) {
                                throw new AssertionError("Internal error occurred for recording but it is not the active recording.");
                            }
                        default:
                            if (needsStop) {
                                m250lambda$stop$6$androidxcameravideoRecorder(recording, -1L, error, cause);
                                return;
                            }
                            return;
                    }
                } catch (Throwable th) {
                    th = th;
                    while (true) {
                        try {
                            throw th;
                        } catch (Throwable th2) {
                            th = th2;
                        }
                    }
                }
            } catch (Throwable th3) {
                th = th3;
            }
        }
    }

    void tryServicePendingRecording() {
        boolean startRecordingPaused = false;
        RecordingRecord recordingToStart = null;
        RecordingRecord pendingRecordingToFinalize = null;
        int error = 0;
        Throwable errorCause = null;
        synchronized (this.mLock) {
            Logger.d(TAG, "tryServicePendingRecording on state: " + this.mState);
            switch (this.mState.ordinal()) {
                case 2:
                    startRecordingPaused = true;
                case 1:
                    if (this.mSourceState == VideoOutput.SourceState.INACTIVE) {
                        pendingRecordingToFinalize = this.mPendingRecordingRecord;
                        this.mPendingRecordingRecord = null;
                        restoreNonPendingState();
                        error = 4;
                        errorCause = PENDING_RECORDING_ERROR_CAUSE_SOURCE_INACTIVE;
                        break;
                    } else {
                        if (this.mActiveRecordingRecord == null && !this.mNeedsResetBeforeNextStart) {
                            if (this.mVideoEncoder != null) {
                                recordingToStart = makePendingRecordingActiveLocked(this.mState);
                                break;
                            }
                        }
                        Logger.w(TAG, "PendingRecording is not handled, active recording = " + this.mActiveRecordingRecord + ", need reset flag = " + this.mNeedsResetBeforeNextStart);
                    }
                    break;
            }
        }
        if (recordingToStart != null) {
            startRecording(recordingToStart, startRecordingPaused);
        } else if (pendingRecordingToFinalize != null) {
            finalizePendingRecording(pendingRecordingToFinalize, error, errorCause);
        }
    }

    private RecordingRecord makePendingRecordingActiveLocked(State state) {
        boolean startRecordingPaused = false;
        if (state == State.PENDING_PAUSED) {
            startRecordingPaused = true;
        } else if (state != State.PENDING_RECORDING) {
            throw new AssertionError("makePendingRecordingActiveLocked() can only be called from a pending state.");
        }
        if (this.mActiveRecordingRecord != null) {
            throw new AssertionError("Cannot make pending recording active because another recording is already active.");
        }
        if (this.mPendingRecordingRecord == null) {
            throw new AssertionError("Pending recording should exist when in a PENDING state.");
        }
        RecordingRecord recordingToStart = this.mPendingRecordingRecord;
        this.mActiveRecordingRecord = recordingToStart;
        this.mActiveRecordingRecord.getRecordingState().addObserver(CameraXExecutors.directExecutor(), new Observable.Observer<Boolean>() { // from class: androidx.camera.video.Recorder.7
            @Override // androidx.camera.core.impl.Observable.Observer
            public void onNewData(Boolean value) {
                Recorder.this.mIsRecording.setState(value);
            }

            @Override // androidx.camera.core.impl.Observable.Observer
            public void onError(Throwable t) {
                Recorder.this.mIsRecording.setError(t);
            }
        });
        this.mPendingRecordingRecord = null;
        if (startRecordingPaused) {
            setState(State.PAUSED);
        } else {
            setState(State.RECORDING);
        }
        return recordingToStart;
    }

    private void startRecording(RecordingRecord recordingToStart, boolean startRecordingPaused) {
        startInternal(recordingToStart);
        if (startRecordingPaused) {
            m246lambda$pause$4$androidxcameravideoRecorder(recordingToStart);
        }
    }

    void updateInProgressStatusEvent(boolean printLog) {
        if (this.mInProgressRecording != null) {
            this.mInProgressRecording.updateVideoRecordEvent(VideoRecordEvent.status(this.mInProgressRecording.getOutputOptions(), getInProgressRecordingStats()), printLog);
        }
    }

    RecordingStats getInProgressRecordingStats() {
        return RecordingStats.of(this.mRecordingDurationNs, this.mRecordingBytes, AudioStats.of(internalAudioStateToAudioStatsState(this.mAudioState), this.mAudioErrorCause, this.mAudioAmplitude, this.mRecordingAudioBytes));
    }

    <T> T getObservableData(StateObservable<T> observable) {
        ListenableFuture<T> future = observable.fetchData();
        try {
            return future.get();
        } catch (InterruptedException | ExecutionException e) {
            throw new IllegalStateException(e);
        }
    }

    boolean isAudioSupported() {
        return ((MediaSpec) getObservableData(this.mMediaSpec)).getAudioSpec().getChannelCount() != 0;
    }

    void setState(State state) {
        if (this.mState == state) {
            throw new AssertionError("Attempted to transition to state " + state + ", but Recorder is already in state " + state);
        }
        Logger.d(TAG, "Transitioning Recorder internal state: " + this.mState + " --> " + state);
        StreamInfo.StreamState streamState = null;
        if (PENDING_STATES.contains(state)) {
            if (!PENDING_STATES.contains(this.mState)) {
                if (!VALID_NON_PENDING_STATES_WHILE_PENDING.contains(this.mState)) {
                    throw new AssertionError("Invalid state transition. Should not be transitioning to a PENDING state from state " + this.mState);
                }
                this.mNonPendingState = this.mState;
                streamState = internalStateToStreamState(this.mNonPendingState);
            }
        } else if (this.mNonPendingState != null) {
            this.mNonPendingState = null;
        }
        this.mState = state;
        if (streamState == null) {
            streamState = internalStateToStreamState(this.mState);
        }
        this.mStreamInfo.setState(StreamInfo.of(this.mStreamId, streamState, this.mInProgressTransformationInfo));
    }

    void setLatestSurface(Surface surface) {
        int hashCode;
        if (this.mLatestSurface == surface) {
            return;
        }
        this.mLatestSurface = surface;
        synchronized (this.mLock) {
            if (surface == null) {
                hashCode = 0;
            } else {
                try {
                    hashCode = surface.hashCode();
                } catch (Throwable th) {
                    throw th;
                }
            }
            setStreamId(hashCode);
        }
    }

    private void setStreamId(int streamId) {
        if (this.mStreamId == streamId) {
            return;
        }
        Logger.d(TAG, "Transitioning streamId: " + this.mStreamId + " --> " + streamId);
        this.mStreamId = streamId;
        this.mStreamInfo.setState(StreamInfo.of(streamId, internalStateToStreamState(this.mState), this.mInProgressTransformationInfo));
    }

    void setInProgressTransformationInfo(SurfaceRequest.TransformationInfo transformationInfo) {
        Logger.d(TAG, "Update stream transformation info: " + transformationInfo);
        this.mInProgressTransformationInfo = transformationInfo;
        synchronized (this.mLock) {
            this.mStreamInfo.setState(StreamInfo.of(this.mStreamId, internalStateToStreamState(this.mState), transformationInfo));
        }
    }

    private void updateNonPendingState(State state) {
        if (!PENDING_STATES.contains(this.mState)) {
            throw new AssertionError("Can only updated non-pending state from a pending state, but state is " + this.mState);
        }
        if (!VALID_NON_PENDING_STATES_WHILE_PENDING.contains(state)) {
            throw new AssertionError("Invalid state transition. State is not a valid non-pending state while in a pending state: " + state);
        }
        if (this.mNonPendingState != state) {
            this.mNonPendingState = state;
            this.mStreamInfo.setState(StreamInfo.of(this.mStreamId, internalStateToStreamState(state), this.mInProgressTransformationInfo));
        }
    }

    private void restoreNonPendingState() {
        if (!PENDING_STATES.contains(this.mState)) {
            throw new AssertionError("Cannot restore non-pending state when in state " + this.mState);
        }
        setState(this.mNonPendingState);
    }

    void setAudioState(AudioState audioState) {
        Logger.d(TAG, "Transitioning audio state: " + this.mAudioState + " --> " + audioState);
        this.mAudioState = audioState;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static ScheduledFuture<?> scheduleTask(final Runnable task, final Executor executor, long delay, TimeUnit timeUnit) {
        return CameraXExecutors.mainThreadExecutor().schedule(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                executor.execute(task);
            }
        }, delay, timeUnit);
    }

    private static int supportedMuxerFormatOrDefaultFrom(VideoValidatedEncoderProfilesProxy profilesProxy, int defaultMuxerFormat) {
        if (profilesProxy != null) {
            switch (profilesProxy.getRecommendedFileFormat()) {
                case 1:
                    if (Build.VERSION.SDK_INT < 26) {
                    }
                    break;
                case 2:
                    break;
                case 9:
                    break;
            }
            return 0;
        }
        return defaultMuxerFormat;
    }

    public static VideoCapabilities getVideoCapabilities(CameraInfo cameraInfo) {
        return getVideoCapabilitiesInternal(1, cameraInfo, 0);
    }

    public static VideoCapabilities getVideoCapabilities(CameraInfo cameraInfo, int videoCapabilitiesSource) {
        return getVideoCapabilitiesInternal(1, cameraInfo, videoCapabilitiesSource);
    }

    public static VideoCapabilities getHighSpeedVideoCapabilities(CameraInfo cameraInfo) {
        return getHighSpeedVideoCapabilities(cameraInfo, 0);
    }

    public static VideoCapabilities getHighSpeedVideoCapabilities(CameraInfo cameraInfo, int videoCapabilitiesSource) {
        VideoCapabilities videoCapabilities = getVideoCapabilitiesInternal(2, cameraInfo, videoCapabilitiesSource);
        if (videoCapabilities.getSupportedDynamicRanges().isEmpty()) {
            return null;
        }
        return videoCapabilities;
    }

    private static VideoCapabilities getVideoCapabilitiesInternal(int videoRecordingType, CameraInfo cameraInfo, int videoCapabilitiesSource) {
        return new RecorderVideoCapabilities(videoCapabilitiesSource, (CameraInfoInternal) cameraInfo, videoRecordingType, VideoEncoderInfoImpl.FINDER);
    }

    static abstract class RecordingRecord implements AutoCloseable {
        private final CloseGuardHelper mCloseGuard = CloseGuardHelper.create();
        private final AtomicBoolean mInitialized = new AtomicBoolean(false);
        private final AtomicReference<MediaMuxerSupplier> mMediaMuxerSupplier = new AtomicReference<>(null);
        private final AtomicReference<AudioSourceSupplier> mAudioSourceSupplier = new AtomicReference<>(null);
        private final AtomicReference<Consumer<Uri>> mRecordingFinalizer = new AtomicReference<>(new Consumer() { // from class: androidx.camera.video.Recorder$RecordingRecord$$ExternalSyntheticLambda6
            @Override // androidx.core.util.Consumer
            public final void accept(Object obj) {
                Recorder.RecordingRecord.lambda$new$0((Uri) obj);
            }
        });
        private final AtomicBoolean mMuted = new AtomicBoolean(false);
        private final MutableStateObservable<Boolean> mRecordingState = MutableStateObservable.withInitialState(false);

        private interface AudioSourceSupplier {
            AudioSource get(AudioSettings audioSettings, Executor executor) throws AudioSourceAccessException;
        }

        /* JADX INFO: Access modifiers changed from: private */
        interface MediaMuxerSupplier {
            MediaMuxer get(int i, Consumer<Uri> consumer) throws IOException;
        }

        abstract Executor getCallbackExecutor();

        abstract Consumer<VideoRecordEvent> getEventListener();

        abstract OutputOptions getOutputOptions();

        abstract long getRecordingId();

        abstract boolean hasAudioEnabled();

        abstract boolean isPersistent();

        RecordingRecord() {
        }

        static /* synthetic */ void lambda$new$0(Uri ignored) {
        }

        static RecordingRecord from(PendingRecording pendingRecording, long recordingId) {
            RecordingRecord recordingRecord = new AutoValue_Recorder_RecordingRecord(pendingRecording.getOutputOptions(), pendingRecording.getListenerExecutor(), pendingRecording.getEventListener(), pendingRecording.getIsAudioEnabled(), pendingRecording.getIsPersistent(), recordingId);
            recordingRecord.mute(pendingRecording.getIsAudioInitialMuted());
            return recordingRecord;
        }

        void initializeRecording(final Context context) throws IOException {
            final ParcelFileDescriptor dupedParcelFileDescriptor;
            if (this.mInitialized.getAndSet(true)) {
                throw new AssertionError("Recording " + this + " has already been initialized");
            }
            final OutputOptions outputOptions = getOutputOptions();
            if (outputOptions instanceof FileDescriptorOutputOptions) {
                dupedParcelFileDescriptor = ((FileDescriptorOutputOptions) outputOptions).getParcelFileDescriptor().dup();
            } else {
                dupedParcelFileDescriptor = null;
            }
            this.mCloseGuard.open("finalizeRecording");
            MediaMuxerSupplier mediaMuxerSupplier = new MediaMuxerSupplier() { // from class: androidx.camera.video.Recorder$RecordingRecord$$ExternalSyntheticLambda0
                @Override // androidx.camera.video.Recorder.RecordingRecord.MediaMuxerSupplier
                public final MediaMuxer get(int i, Consumer consumer) {
                    return Recorder.RecordingRecord.lambda$initializeRecording$1(OutputOptions.this, dupedParcelFileDescriptor, i, consumer);
                }
            };
            this.mMediaMuxerSupplier.set(mediaMuxerSupplier);
            Consumer<Uri> recordingFinalizer = null;
            if (hasAudioEnabled()) {
                if (Build.VERSION.SDK_INT >= 31) {
                    AudioSourceSupplier audioSourceSupplier = new AudioSourceSupplier() { // from class: androidx.camera.video.Recorder.RecordingRecord.1
                        @Override // androidx.camera.video.Recorder.RecordingRecord.AudioSourceSupplier
                        public AudioSource get(AudioSettings settings, Executor executor) throws AudioSourceAccessException {
                            return new AudioSource(settings, executor, context);
                        }
                    };
                    this.mAudioSourceSupplier.set(audioSourceSupplier);
                } else {
                    AudioSourceSupplier audioSourceSupplier2 = new AudioSourceSupplier() { // from class: androidx.camera.video.Recorder.RecordingRecord.2
                        @Override // androidx.camera.video.Recorder.RecordingRecord.AudioSourceSupplier
                        public AudioSource get(AudioSettings settings, Executor executor) throws AudioSourceAccessException {
                            return new AudioSource(settings, executor, null);
                        }
                    };
                    this.mAudioSourceSupplier.set(audioSourceSupplier2);
                }
            }
            if (outputOptions instanceof MediaStoreOutputOptions) {
                final MediaStoreOutputOptions mediaStoreOutputOptions = (MediaStoreOutputOptions) outputOptions;
                if (Build.VERSION.SDK_INT >= 29) {
                    recordingFinalizer = new Consumer() { // from class: androidx.camera.video.Recorder$RecordingRecord$$ExternalSyntheticLambda1
                        @Override // androidx.core.util.Consumer
                        public final void accept(Object obj) {
                            Recorder.RecordingRecord.lambda$initializeRecording$2(MediaStoreOutputOptions.this, (Uri) obj);
                        }
                    };
                } else {
                    recordingFinalizer = new Consumer() { // from class: androidx.camera.video.Recorder$RecordingRecord$$ExternalSyntheticLambda2
                        @Override // androidx.core.util.Consumer
                        public final void accept(Object obj) {
                            Recorder.RecordingRecord.lambda$initializeRecording$4(MediaStoreOutputOptions.this, context, (Uri) obj);
                        }
                    };
                }
            } else if (outputOptions instanceof FileDescriptorOutputOptions) {
                recordingFinalizer = new Consumer() { // from class: androidx.camera.video.Recorder$RecordingRecord$$ExternalSyntheticLambda3
                    @Override // androidx.core.util.Consumer
                    public final void accept(Object obj) {
                        Recorder.RecordingRecord.lambda$initializeRecording$5(dupedParcelFileDescriptor, (Uri) obj);
                    }
                };
            }
            if (recordingFinalizer != null) {
                this.mRecordingFinalizer.set(recordingFinalizer);
            }
        }

        static /* synthetic */ MediaMuxer lambda$initializeRecording$1(OutputOptions outputOptions, ParcelFileDescriptor dupedParcelFileDescriptor, int muxerOutputFormat, Consumer outputUriCreatedCallback) throws IOException {
            MediaMuxer mediaMuxer;
            Uri outputUri = Uri.EMPTY;
            if (outputOptions instanceof FileOutputOptions) {
                FileOutputOptions fileOutputOptions = (FileOutputOptions) outputOptions;
                File file = fileOutputOptions.getFile();
                if (!OutputUtil.createParentFolder(file)) {
                    Logger.w(Recorder.TAG, "Failed to create folder for " + file.getAbsolutePath());
                }
                mediaMuxer = new MediaMuxer(file.getAbsolutePath(), muxerOutputFormat);
                outputUri = Uri.fromFile(file);
            } else if (outputOptions instanceof FileDescriptorOutputOptions) {
                if (Build.VERSION.SDK_INT >= 26) {
                    mediaMuxer = Api26Impl.createMediaMuxer(dupedParcelFileDescriptor.getFileDescriptor(), muxerOutputFormat);
                } else {
                    throw new IOException("MediaMuxer doesn't accept FileDescriptor as output destination.");
                }
            } else if (outputOptions instanceof MediaStoreOutputOptions) {
                MediaStoreOutputOptions mediaStoreOutputOptions = (MediaStoreOutputOptions) outputOptions;
                ContentValues contentValues = new ContentValues(mediaStoreOutputOptions.getContentValues());
                if (Build.VERSION.SDK_INT >= 29) {
                    contentValues.put("is_pending", (Integer) 1);
                }
                try {
                    outputUri = mediaStoreOutputOptions.getContentResolver().insert(mediaStoreOutputOptions.getCollectionUri(), contentValues);
                    if (outputUri == null) {
                        throw new IOException("Unable to create MediaStore entry.");
                    }
                    if (Build.VERSION.SDK_INT < 26) {
                        String path = OutputUtil.getAbsolutePathFromUri(mediaStoreOutputOptions.getContentResolver(), outputUri, Recorder.MEDIA_COLUMN);
                        if (path == null) {
                            throw new IOException("Unable to get path from uri " + outputUri);
                        }
                        if (!OutputUtil.createParentFolder(new File(path))) {
                            Logger.w(Recorder.TAG, "Failed to create folder for " + path);
                        }
                        mediaMuxer = new MediaMuxer(path, muxerOutputFormat);
                    } else {
                        ParcelFileDescriptor fileDescriptor = mediaStoreOutputOptions.getContentResolver().openFileDescriptor(outputUri, "rw");
                        MediaMuxer mediaMuxer2 = Api26Impl.createMediaMuxer(fileDescriptor.getFileDescriptor(), muxerOutputFormat);
                        fileDescriptor.close();
                        mediaMuxer = mediaMuxer2;
                    }
                } catch (RuntimeException e) {
                    throw new IOException("Unable to create MediaStore entry by " + e, e);
                }
            } else {
                throw new AssertionError("Invalid output options type: " + outputOptions.getClass().getSimpleName());
            }
            outputUriCreatedCallback.accept(outputUri);
            return mediaMuxer;
        }

        static /* synthetic */ void lambda$initializeRecording$2(MediaStoreOutputOptions mediaStoreOutputOptions, Uri outputUri) {
            if (outputUri.equals(Uri.EMPTY)) {
                return;
            }
            ContentValues contentValues = new ContentValues();
            contentValues.put("is_pending", (Integer) 0);
            mediaStoreOutputOptions.getContentResolver().update(outputUri, contentValues, null, null);
        }

        static /* synthetic */ void lambda$initializeRecording$4(MediaStoreOutputOptions mediaStoreOutputOptions, Context context, Uri outputUri) {
            if (outputUri.equals(Uri.EMPTY)) {
                return;
            }
            String filePath = OutputUtil.getAbsolutePathFromUri(mediaStoreOutputOptions.getContentResolver(), outputUri, Recorder.MEDIA_COLUMN);
            if (filePath != null) {
                MediaScannerConnection.scanFile(context, new String[]{filePath}, null, new MediaScannerConnection.OnScanCompletedListener() { // from class: androidx.camera.video.Recorder$RecordingRecord$$ExternalSyntheticLambda4
                    @Override // android.media.MediaScannerConnection.OnScanCompletedListener
                    public final void onScanCompleted(String str, Uri uri) {
                        Recorder.RecordingRecord.lambda$initializeRecording$3(str, uri);
                    }
                });
            } else {
                Logger.d(Recorder.TAG, "Skipping media scanner scan. Unable to retrieve file path from URI: " + outputUri);
            }
        }

        static /* synthetic */ void lambda$initializeRecording$3(String path, Uri uri) {
            if (uri == null) {
                Logger.e(Recorder.TAG, String.format("File scanning operation failed [path: %s]", path));
            } else {
                Logger.d(Recorder.TAG, String.format("File scan completed successfully [path: %s, URI: %s]", path, uri));
            }
        }

        static /* synthetic */ void lambda$initializeRecording$5(ParcelFileDescriptor dupedParcelFileDescriptor, Uri ignored) {
            try {
                dupedParcelFileDescriptor.close();
            } catch (IOException e) {
                Logger.e(Recorder.TAG, "Failed to close dup'd ParcelFileDescriptor", e);
            }
        }

        void updateVideoRecordEvent(VideoRecordEvent event) {
            updateVideoRecordEvent(event, true);
        }

        void updateVideoRecordEvent(final VideoRecordEvent event, boolean printLog) {
            if (!Objects.equals(event.getOutputOptions(), getOutputOptions())) {
                throw new AssertionError("Attempted to update event listener with event from incorrect recording [Recording: " + event.getOutputOptions() + ", Expected: " + getOutputOptions() + "]");
            }
            if (printLog) {
                String message = "Sending VideoRecordEvent " + event.getClass().getSimpleName();
                if (event instanceof VideoRecordEvent.Finalize) {
                    VideoRecordEvent.Finalize finalizeEvent = (VideoRecordEvent.Finalize) event;
                    if (finalizeEvent.hasError()) {
                        message = message + String.format(" [error: %s]", VideoRecordEvent.Finalize.errorToString(finalizeEvent.getError()));
                    }
                }
                Logger.d(Recorder.TAG, message);
            }
            updateRecordingState(event);
            if (getCallbackExecutor() != null && getEventListener() != null) {
                try {
                    getCallbackExecutor().execute(new Runnable() { // from class: androidx.camera.video.Recorder$RecordingRecord$$ExternalSyntheticLambda5
                        @Override // java.lang.Runnable
                        public final void run() {
                            Recorder.RecordingRecord.this.m254x1386b2b0(event);
                        }
                    });
                } catch (RejectedExecutionException e) {
                    Logger.e(Recorder.TAG, "The callback executor is invalid.", e);
                }
            }
        }

        /* renamed from: lambda$updateVideoRecordEvent$6$androidx-camera-video-Recorder$RecordingRecord, reason: not valid java name */
        /* synthetic */ void m254x1386b2b0(VideoRecordEvent event) {
            getEventListener().accept(event);
        }

        private void updateRecordingState(VideoRecordEvent event) {
            if ((event instanceof VideoRecordEvent.Start) || (event instanceof VideoRecordEvent.Resume)) {
                this.mRecordingState.setState(true);
            } else if ((event instanceof VideoRecordEvent.Pause) || (event instanceof VideoRecordEvent.Finalize)) {
                this.mRecordingState.setState(false);
            }
        }

        StateObservable<Boolean> getRecordingState() {
            return this.mRecordingState;
        }

        AudioSource performOneTimeAudioSourceCreation(AudioSettings settings, Executor audioSourceExecutor) throws AudioSourceAccessException {
            if (!hasAudioEnabled()) {
                throw new AssertionError("Recording does not have audio enabled. Unable to create audio source for recording " + this);
            }
            AudioSourceSupplier audioSourceSupplier = this.mAudioSourceSupplier.getAndSet(null);
            if (audioSourceSupplier == null) {
                throw new AssertionError("One-time audio source creation has already occurred for recording " + this);
            }
            return audioSourceSupplier.get(settings, audioSourceExecutor);
        }

        MediaMuxer performOneTimeMediaMuxerCreation(int muxerOutputFormat, Consumer<Uri> outputUriCreatedCallback) throws IOException {
            if (!this.mInitialized.get()) {
                throw new AssertionError("Recording " + this + " has not been initialized");
            }
            MediaMuxerSupplier mediaMuxerSupplier = this.mMediaMuxerSupplier.getAndSet(null);
            if (mediaMuxerSupplier == null) {
                throw new AssertionError("One-time media muxer creation has already occurred for recording " + this);
            }
            try {
                return mediaMuxerSupplier.get(muxerOutputFormat, outputUriCreatedCallback);
            } catch (RuntimeException e) {
                throw new IOException("Failed to create MediaMuxer by " + e, e);
            }
        }

        void finalizeRecording(Uri uri) {
            if (!this.mInitialized.get()) {
                return;
            }
            finalizeRecordingInternal(this.mRecordingFinalizer.getAndSet(null), uri);
        }

        void mute(boolean muted) {
            this.mMuted.set(muted);
        }

        boolean isMuted() {
            return this.mMuted.get();
        }

        @Override // java.lang.AutoCloseable
        public void close() {
            finalizeRecording(Uri.EMPTY);
        }

        protected void finalize() throws Throwable {
            try {
                this.mCloseGuard.warnIfOpen();
                Consumer<Uri> finalizer = this.mRecordingFinalizer.getAndSet(null);
                if (finalizer != null) {
                    finalizeRecordingInternal(finalizer, Uri.EMPTY);
                }
            } finally {
                super.finalize();
            }
        }

        private void finalizeRecordingInternal(Consumer<Uri> finalizer, Uri uri) {
            if (finalizer == null) {
                throw new AssertionError("Recording " + this + " has already been finalized");
            }
            this.mCloseGuard.close();
            finalizer.accept(uri);
        }
    }

    public static final class Builder {
        private int mVideoCapabilitiesSource = 0;
        private Executor mExecutor = null;
        private EncoderFactory mVideoEncoderFactory = Recorder.DEFAULT_ENCODER_FACTORY;
        private EncoderFactory mAudioEncoderFactory = Recorder.DEFAULT_ENCODER_FACTORY;
        private OutputStorage.Factory mOutputStorageFactory = Recorder.OUTPUT_STORAGE_FACTORY_DEFAULT;
        private long mRequiredFreeStorageBytes = -1;
        private final MediaSpec.Builder mMediaSpecBuilder = MediaSpec.builder();

        public Builder setExecutor(Executor executor) {
            Preconditions.checkNotNull(executor, "The specified executor can't be null.");
            this.mExecutor = executor;
            return this;
        }

        public Builder setQualitySelector(final QualitySelector qualitySelector) {
            Preconditions.checkNotNull(qualitySelector, "The specified quality selector can't be null.");
            this.mMediaSpecBuilder.configureVideo(new Consumer() { // from class: androidx.camera.video.Recorder$Builder$$ExternalSyntheticLambda3
                @Override // androidx.core.util.Consumer
                public final void accept(Object obj) {
                    ((VideoSpec.Builder) obj).setQualitySelector(QualitySelector.this);
                }
            });
            return this;
        }

        public Builder setVideoCapabilitiesSource(int videoCapabilitiesSource) {
            boolean z = true;
            if (videoCapabilitiesSource != 0 && videoCapabilitiesSource != 1) {
                z = false;
            }
            Preconditions.checkArgument(z, "Not a supported video capabilities source: " + videoCapabilitiesSource);
            this.mVideoCapabilitiesSource = videoCapabilitiesSource;
            return this;
        }

        public Builder setTargetVideoEncodingBitRate(final int bitrate) {
            if (bitrate <= 0) {
                throw new IllegalArgumentException("The requested target bitrate " + bitrate + " is not supported. Target bitrate must be greater than 0.");
            }
            this.mMediaSpecBuilder.configureVideo(new Consumer() { // from class: androidx.camera.video.Recorder$Builder$$ExternalSyntheticLambda0
                @Override // androidx.core.util.Consumer
                public final void accept(Object obj) {
                    ((VideoSpec.Builder) obj).setBitrate(new Range<>(Integer.valueOf(r0), Integer.valueOf(bitrate)));
                }
            });
            return this;
        }

        public Builder setAspectRatio(final int aspectRatio) {
            this.mMediaSpecBuilder.configureVideo(new Consumer() { // from class: androidx.camera.video.Recorder$Builder$$ExternalSyntheticLambda2
                @Override // androidx.core.util.Consumer
                public final void accept(Object obj) {
                    ((VideoSpec.Builder) obj).setAspectRatio(aspectRatio);
                }
            });
            return this;
        }

        public Builder setRequiredFreeStorageBytes(long bytes) {
            Preconditions.checkArgument(bytes > 0);
            this.mRequiredFreeStorageBytes = bytes;
            return this;
        }

        public Builder setAudioSource(final int source) {
            this.mMediaSpecBuilder.configureAudio(new Consumer() { // from class: androidx.camera.video.Recorder$Builder$$ExternalSyntheticLambda1
                @Override // androidx.core.util.Consumer
                public final void accept(Object obj) {
                    ((AudioSpec.Builder) obj).setSource(source);
                }
            });
            return this;
        }

        Builder setVideoEncoderFactory(EncoderFactory videoEncoderFactory) {
            this.mVideoEncoderFactory = videoEncoderFactory;
            return this;
        }

        Builder setAudioEncoderFactory(EncoderFactory audioEncoderFactory) {
            this.mAudioEncoderFactory = audioEncoderFactory;
            return this;
        }

        Builder setOutputStorageFactory(OutputStorage.Factory outputStorageFactory) {
            this.mOutputStorageFactory = outputStorageFactory;
            return this;
        }

        public Recorder build() {
            return new Recorder(this.mExecutor, this.mMediaSpecBuilder.build(), this.mVideoCapabilitiesSource, this.mVideoEncoderFactory, this.mAudioEncoderFactory, this.mOutputStorageFactory, this.mRequiredFreeStorageBytes);
        }
    }
}
