package androidx.camera.core.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* loaded from: classes.dex */
public final class CameraCaptureCallbacks {
    private CameraCaptureCallbacks() {
    }

    public static CameraCaptureCallback createNoOpCallback() {
        return new NoOpCameraCaptureCallback();
    }

    static CameraCaptureCallback createComboCallback(List<CameraCaptureCallback> callbacks) {
        if (callbacks.isEmpty()) {
            return createNoOpCallback();
        }
        if (callbacks.size() == 1) {
            return callbacks.get(0);
        }
        return new ComboCameraCaptureCallback(callbacks);
    }

    public static CameraCaptureCallback createComboCallback(CameraCaptureCallback... callbacks) {
        return createComboCallback((List<CameraCaptureCallback>) Arrays.asList(callbacks));
    }

    static final class NoOpCameraCaptureCallback extends CameraCaptureCallback {
        NoOpCameraCaptureCallback() {
        }

        @Override // androidx.camera.core.impl.CameraCaptureCallback
        public void onCaptureStarted(int captureConfigId) {
        }

        @Override // androidx.camera.core.impl.CameraCaptureCallback
        public void onCaptureCompleted(int captureConfigId, CameraCaptureResult cameraCaptureResult) {
        }

        @Override // androidx.camera.core.impl.CameraCaptureCallback
        public void onCaptureFailed(int captureConfigId, CameraCaptureFailure failure) {
        }
    }

    public static final class ComboCameraCaptureCallback extends CameraCaptureCallback {
        private final List<CameraCaptureCallback> mCallbacks = new ArrayList();

        ComboCameraCaptureCallback(List<CameraCaptureCallback> callbacks) {
            for (CameraCaptureCallback callback : callbacks) {
                if (!(callback instanceof NoOpCameraCaptureCallback)) {
                    this.mCallbacks.add(callback);
                }
            }
        }

        @Override // androidx.camera.core.impl.CameraCaptureCallback
        public void onCaptureStarted(int captureConfigId) {
            for (CameraCaptureCallback callback : this.mCallbacks) {
                callback.onCaptureStarted(captureConfigId);
            }
        }

        @Override // androidx.camera.core.impl.CameraCaptureCallback
        public void onCaptureCompleted(int captureConfigId, CameraCaptureResult cameraCaptureResult) {
            for (CameraCaptureCallback callback : this.mCallbacks) {
                callback.onCaptureCompleted(captureConfigId, cameraCaptureResult);
            }
        }

        @Override // androidx.camera.core.impl.CameraCaptureCallback
        public void onCaptureFailed(int captureConfigId, CameraCaptureFailure failure) {
            for (CameraCaptureCallback callback : this.mCallbacks) {
                callback.onCaptureFailed(captureConfigId, failure);
            }
        }

        @Override // androidx.camera.core.impl.CameraCaptureCallback
        public void onCaptureCancelled(int captureConfigId) {
            for (CameraCaptureCallback callback : this.mCallbacks) {
                callback.onCaptureCancelled(captureConfigId);
            }
        }

        public List<CameraCaptureCallback> getCallbacks() {
            return this.mCallbacks;
        }

        @Override // androidx.camera.core.impl.CameraCaptureCallback
        public void onCaptureProcessProgressed(int captureConfigId, int progress) {
            for (CameraCaptureCallback callback : this.mCallbacks) {
                callback.onCaptureProcessProgressed(captureConfigId, progress);
            }
        }
    }
}
