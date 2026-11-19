package androidx.camera.core.impl;

/* carregado de: classes.dex */
public class CameraCaptureFailure {
    private final Reason mReason;

    public enum Reason {
        ERROR
    }

    public CameraCaptureFailure(Reason reason) {
        this.mReason = reason;
    }

    public Reason getReason() {
        return this.mReason;
    }

    public Object getCaptureFailure() {
        return null;
    }
}
