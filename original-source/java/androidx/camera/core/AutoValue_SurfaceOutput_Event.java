package androidx.camera.core;

import androidx.camera.core.SurfaceOutput;

/* loaded from: classes.dex */
final class AutoValue_SurfaceOutput_Event extends SurfaceOutput.Event {
    private final int eventCode;
    private final SurfaceOutput surfaceOutput;

    AutoValue_SurfaceOutput_Event(int eventCode, SurfaceOutput surfaceOutput) {
        this.eventCode = eventCode;
        if (surfaceOutput == null) {
            throw new NullPointerException("Null surfaceOutput");
        }
        this.surfaceOutput = surfaceOutput;
    }

    @Override // androidx.camera.core.SurfaceOutput.Event
    public int getEventCode() {
        return this.eventCode;
    }

    @Override // androidx.camera.core.SurfaceOutput.Event
    public SurfaceOutput getSurfaceOutput() {
        return this.surfaceOutput;
    }

    public String toString() {
        return "Event{eventCode=" + this.eventCode + ", surfaceOutput=" + this.surfaceOutput + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof SurfaceOutput.Event)) {
            return false;
        }
        SurfaceOutput.Event that = (SurfaceOutput.Event) o;
        return this.eventCode == that.getEventCode() && this.surfaceOutput.equals(that.getSurfaceOutput());
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((h$ ^ this.eventCode) * 1000003) ^ this.surfaceOutput.hashCode();
    }
}
