package androidx.camera.video;

import androidx.camera.video.Recorder;
import androidx.core.util.Consumer;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
final class AutoValue_Recorder_RecordingRecord extends Recorder.RecordingRecord {
    private final Executor getCallbackExecutor;
    private final Consumer<VideoRecordEvent> getEventListener;
    private final OutputOptions getOutputOptions;
    private final long getRecordingId;
    private final boolean hasAudioEnabled;
    private final boolean isPersistent;

    AutoValue_Recorder_RecordingRecord(OutputOptions getOutputOptions, Executor getCallbackExecutor, Consumer<VideoRecordEvent> getEventListener, boolean hasAudioEnabled, boolean isPersistent, long getRecordingId) {
        if (getOutputOptions == null) {
            throw new NullPointerException("Null getOutputOptions");
        }
        this.getOutputOptions = getOutputOptions;
        this.getCallbackExecutor = getCallbackExecutor;
        this.getEventListener = getEventListener;
        this.hasAudioEnabled = hasAudioEnabled;
        this.isPersistent = isPersistent;
        this.getRecordingId = getRecordingId;
    }

    @Override // androidx.camera.video.Recorder.RecordingRecord
    OutputOptions getOutputOptions() {
        return this.getOutputOptions;
    }

    @Override // androidx.camera.video.Recorder.RecordingRecord
    Executor getCallbackExecutor() {
        return this.getCallbackExecutor;
    }

    @Override // androidx.camera.video.Recorder.RecordingRecord
    Consumer<VideoRecordEvent> getEventListener() {
        return this.getEventListener;
    }

    @Override // androidx.camera.video.Recorder.RecordingRecord
    boolean hasAudioEnabled() {
        return this.hasAudioEnabled;
    }

    @Override // androidx.camera.video.Recorder.RecordingRecord
    boolean isPersistent() {
        return this.isPersistent;
    }

    @Override // androidx.camera.video.Recorder.RecordingRecord
    long getRecordingId() {
        return this.getRecordingId;
    }

    public String toString() {
        return "RecordingRecord{getOutputOptions=" + this.getOutputOptions + ", getCallbackExecutor=" + this.getCallbackExecutor + ", getEventListener=" + this.getEventListener + ", hasAudioEnabled=" + this.hasAudioEnabled + ", isPersistent=" + this.isPersistent + ", getRecordingId=" + this.getRecordingId + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof Recorder.RecordingRecord)) {
            return false;
        }
        Recorder.RecordingRecord that = (Recorder.RecordingRecord) o;
        return this.getOutputOptions.equals(that.getOutputOptions()) && (this.getCallbackExecutor != null ? this.getCallbackExecutor.equals(that.getCallbackExecutor()) : that.getCallbackExecutor() == null) && (this.getEventListener != null ? this.getEventListener.equals(that.getEventListener()) : that.getEventListener() == null) && this.hasAudioEnabled == that.hasAudioEnabled() && this.isPersistent == that.isPersistent() && this.getRecordingId == that.getRecordingId();
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((((h$ ^ this.getOutputOptions.hashCode()) * 1000003) ^ (this.getCallbackExecutor == null ? 0 : this.getCallbackExecutor.hashCode())) * 1000003) ^ (this.getEventListener != null ? this.getEventListener.hashCode() : 0)) * 1000003) ^ (this.hasAudioEnabled ? 1231 : 1237)) * 1000003) ^ (this.isPersistent ? 1231 : 1237)) * 1000003) ^ ((int) ((this.getRecordingId >>> 32) ^ this.getRecordingId));
    }
}
