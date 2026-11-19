package androidx.camera.video.internal.audio;

import android.content.Context;
import android.media.AudioFormat;
import android.media.AudioManager;
import android.media.AudioRecord;
import android.media.AudioRecordingConfiguration;
import android.media.AudioTimestamp;
import android.os.Build;
import androidx.camera.core.Logger;
import androidx.camera.video.internal.audio.AudioStream;
import androidx.camera.video.internal.compat.Api23Impl;
import androidx.camera.video.internal.compat.Api24Impl;
import androidx.camera.video.internal.compat.Api29Impl;
import androidx.camera.video.internal.compat.Api31Impl;
import androidx.camera.video.internal.compat.quirk.AudioTimestampFramePositionIncorrectQuirk;
import androidx.camera.video.internal.compat.quirk.DeviceQuirks;
import androidx.core.util.Preconditions;
import j$.util.Objects;
import java.nio.ByteBuffer;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

/* carregado de: classes.dex */
public class AudioStreamImpl implements AudioStream {
    private static final long DIFF_LIMIT_FROM_SYSTEM_TIME_NS = TimeUnit.MILLISECONDS.toNanos(500);
    private static final String TAG = "AudioStreamImpl";
    private AudioRecord mAudioRecord;
    private AudioManager.AudioRecordingCallback mAudioRecordingCallback;
    private AudioStream.AudioStreamCallback mAudioStreamCallback;
    private final int mBufferSize;
    private final int mBytesPerFrame;
    private Executor mCallbackExecutor;
    private final AudioSettings mSettings;
    private long mTotalFramesRead;
    private final AtomicBoolean mIsReleased = new AtomicBoolean(false);
    private final AtomicBoolean mIsStarted = new AtomicBoolean(false);
    private final AtomicReference<Boolean> mNotifiedSilenceState = new AtomicReference<>(null);
    private boolean mShouldFallbackToSystemTime = false;

    public AudioStreamImpl(AudioSettings settings, Context attributionContext) throws IllegalArgumentException, AudioStream.AudioStreamException {
        if (!isSettingsSupported(settings.getCaptureSampleRate(), settings.getChannelCount(), settings.getAudioFormat())) {
            throw new UnsupportedOperationException(String.format("The combination of sample rate %d, channel count %d and audio format %d is not supported.", Integer.valueOf(settings.getCaptureSampleRate()), Integer.valueOf(settings.getChannelCount()), Integer.valueOf(settings.getAudioFormat())));
        }
        this.mSettings = settings;
        this.mBytesPerFrame = settings.getBytesPerFrame();
        int minBufferSize = getMinBufferSize(settings.getCaptureSampleRate(), settings.getChannelCount(), settings.getAudioFormat());
        Preconditions.checkState(minBufferSize > 0);
        this.mBufferSize = minBufferSize * 2;
        this.mAudioRecord = createAudioRecord(this.mBufferSize, this.mSettings, attributionContext);
        checkAudioRecordInitialStateOrReleaseAndThrow(this.mAudioRecord);
    }

    @Override // androidx.camera.video.internal.audio.AudioStream
    public void start() throws AudioStream.AudioStreamException {
        checkNotReleasedOrThrow();
        if (this.mIsStarted.getAndSet(true)) {
            return;
        }
        if (hasAudioTimestampQuirk()) {
            checkAudioRecordInitialStateOrReleaseAndThrow(this.mAudioRecord);
        }
        this.mAudioRecord.startRecording();
        if (this.mAudioRecord.getRecordingState() != 3) {
            this.mIsStarted.set(false);
            throw new AudioStream.AudioStreamException("Unable to start AudioRecord with state: " + this.mAudioRecord.getRecordingState());
        }
        this.mTotalFramesRead = 0L;
        this.mShouldFallbackToSystemTime = false;
        this.mNotifiedSilenceState.set(null);
        boolean isSilenced = false;
        if (Build.VERSION.SDK_INT >= 29) {
            AudioRecordingConfiguration config = Api29Impl.getActiveRecordingConfiguration(this.mAudioRecord);
            isSilenced = config != null && Api29Impl.isClientSilenced(config);
        }
        notifySilenced(isSilenced);
    }

    @Override // androidx.camera.video.internal.audio.AudioStream
    public void stop() {
        checkNotReleasedOrThrow();
        if (!this.mIsStarted.getAndSet(false)) {
            return;
        }
        this.mAudioRecord.stop();
        if (this.mAudioRecord.getRecordingState() != 1) {
            Logger.w(TAG, "Failed to stop AudioRecord with state: " + this.mAudioRecord.getRecordingState());
        }
        if (hasAudioTimestampQuirk()) {
            this.mAudioRecord.release();
            this.mAudioRecord = createAudioRecord(this.mBufferSize, this.mSettings, null);
        }
    }

    @Override // androidx.camera.video.internal.audio.AudioStream
    public void release() {
        if (this.mIsReleased.getAndSet(true)) {
            return;
        }
        if (Build.VERSION.SDK_INT >= 29 && this.mAudioRecordingCallback != null) {
            Api29Impl.unregisterAudioRecordingCallback(this.mAudioRecord, this.mAudioRecordingCallback);
        }
        this.mAudioRecord.release();
    }

    @Override // androidx.camera.video.internal.audio.AudioStream
    public AudioStream.PacketInfo read(ByteBuffer byteBuffer) {
        checkNotReleasedOrThrow();
        checkStartedOrThrow();
        int sizeInBytes = this.mAudioRecord.read(byteBuffer, this.mBufferSize);
        long timestampNs = 0;
        if (sizeInBytes > 0) {
            byteBuffer.limit(sizeInBytes);
            timestampNs = generatePresentationTimeNs();
            this.mTotalFramesRead += AudioUtils.sizeToFrameCount(sizeInBytes, this.mBytesPerFrame);
        }
        return AudioStream.PacketInfo.of(sizeInBytes, timestampNs);
    }

    @Override // androidx.camera.video.internal.audio.AudioStream
    public void setCallback(AudioStream.AudioStreamCallback callback, Executor executor) {
        boolean z = true;
        Preconditions.checkState(!this.mIsStarted.get(), "AudioStream can not be started when setCallback.");
        checkNotReleasedOrThrow();
        if (callback != null && executor == null) {
            z = false;
        }
        Preconditions.checkArgument(z, "executor can't be null with non-null callback.");
        this.mAudioStreamCallback = callback;
        this.mCallbackExecutor = executor;
        if (Build.VERSION.SDK_INT >= 29) {
            if (this.mAudioRecordingCallback != null) {
                Api29Impl.unregisterAudioRecordingCallback(this.mAudioRecord, this.mAudioRecordingCallback);
            }
            if (callback == null) {
                return;
            }
            if (this.mAudioRecordingCallback == null) {
                this.mAudioRecordingCallback = new AudioRecordingApi29Callback();
            }
            Api29Impl.registerAudioRecordingCallback(this.mAudioRecord, executor, this.mAudioRecordingCallback);
        }
    }

    void notifySilenced(final boolean isSilenced) {
        Executor executor = this.mCallbackExecutor;
        final AudioStream.AudioStreamCallback callback = this.mAudioStreamCallback;
        if (executor != null && callback != null && !Objects.equals(this.mNotifiedSilenceState.getAndSet(Boolean.valueOf(isSilenced)), Boolean.valueOf(isSilenced))) {
            executor.execute(new Runnable() { // da classe: androidx.camera.video.internal.audio.AudioStreamImpl$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    AudioStream.AudioStreamCallback.this.onSilenceStateChanged(isSilenced);
                }
            });
        }
    }

    private long generatePresentationTimeNs() {
        long presentationTimeNs = -1;
        if (Build.VERSION.SDK_INT >= 24 && !this.mShouldFallbackToSystemTime) {
            AudioTimestamp audioTimestamp = new AudioTimestamp();
            if (Api24Impl.getTimestamp(this.mAudioRecord, audioTimestamp, 0) == 0) {
                presentationTimeNs = AudioUtils.computeInterpolatedTimeNs(this.mSettings.getCaptureSampleRate(), this.mTotalFramesRead, audioTimestamp);
                long timestampDiff = Math.abs(presentationTimeNs - System.nanoTime());
                if (timestampDiff > DIFF_LIMIT_FROM_SYSTEM_TIME_NS) {
                    this.mShouldFallbackToSystemTime = true;
                    presentationTimeNs = -1;
                }
            } else {
                Logger.w(TAG, "Unable to get audio timestamp");
            }
        }
        if (presentationTimeNs == -1) {
            return System.nanoTime();
        }
        return presentationTimeNs;
    }

    private void checkNotReleasedOrThrow() {
        Preconditions.checkState(!this.mIsReleased.get(), "AudioStream has been released.");
    }

    private void checkStartedOrThrow() {
        Preconditions.checkState(this.mIsStarted.get(), "AudioStream has not been started.");
    }

    private static AudioRecord createAudioRecord(int bufferSizeInByte, AudioSettings settings, Context context) throws IllegalArgumentException {
        AudioFormat audioFormatObj = createAudioFormat(settings);
        AudioRecord.Builder audioRecordBuilder = Api23Impl.createAudioRecordBuilder();
        if (Build.VERSION.SDK_INT >= 31 && context != null) {
            Api31Impl.setContext(audioRecordBuilder, context);
        }
        Api23Impl.setAudioSource(audioRecordBuilder, settings.getAudioSource());
        Api23Impl.setAudioFormat(audioRecordBuilder, audioFormatObj);
        Api23Impl.setBufferSizeInBytes(audioRecordBuilder, bufferSizeInByte);
        try {
            return Api23Impl.build(audioRecordBuilder);
        } catch (UnsupportedOperationException e) {
            throw new IllegalArgumentException(e);
        }
    }

    private static AudioFormat createAudioFormat(AudioSettings settings) throws IllegalArgumentException {
        return createAudioFormat(settings.getCaptureSampleRate(), settings.getChannelCount(), settings.getAudioFormat());
    }

    private static AudioFormat createAudioFormat(int sampleRate, int channelCount, int audioFormat) throws IllegalArgumentException {
        return new AudioFormat.Builder().setSampleRate(sampleRate).setChannelMask(AudioUtils.channelCountToChannelMask(channelCount)).setEncoding(audioFormat).build();
    }

    private static void checkAudioRecordInitialStateOrReleaseAndThrow(AudioRecord audioRecord) throws AudioStream.AudioStreamException {
        if (audioRecord.getState() != 1) {
            audioRecord.release();
            throw new AudioStream.AudioStreamException("Unable to initialize AudioRecord");
        }
    }

    public static boolean isSettingsSupported(int sampleRate, int channelCount, int audioFormat) {
        if (sampleRate <= 0 || channelCount <= 0 || getMinBufferSize(sampleRate, channelCount, audioFormat) <= 0) {
            return false;
        }
        try {
            createAudioFormat(sampleRate, channelCount, audioFormat);
            return true;
        } catch (IllegalArgumentException e) {
            return false;
        }
    }

    private static boolean hasAudioTimestampQuirk() {
        return DeviceQuirks.get(AudioTimestampFramePositionIncorrectQuirk.class) != null;
    }

    private static int getMinBufferSize(int sampleRate, int channelCount, int audioFormat) {
        return AudioRecord.getMinBufferSize(sampleRate, AudioUtils.channelCountToChannelConfig(channelCount), audioFormat);
    }

    class AudioRecordingApi29Callback extends AudioManager.AudioRecordingCallback {
        AudioRecordingApi29Callback() {
        }

        @Override // android.media.AudioManager.AudioRecordingCallback
        public void onRecordingConfigChanged(List<AudioRecordingConfiguration> configs) {
            for (AudioRecordingConfiguration config : configs) {
                if (Api24Impl.getClientAudioSessionId(config) == AudioStreamImpl.this.mAudioRecord.getAudioSessionId()) {
                    boolean isSilenced = Api29Impl.isClientSilenced(config);
                    AudioStreamImpl.this.notifySilenced(isSilenced);
                    return;
                }
            }
        }
    }
}
