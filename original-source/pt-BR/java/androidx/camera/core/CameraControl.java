package androidx.camera.core;

import com.google.common.util.concurrent.ListenableFuture;

/* carregado de: classes.dex */
public interface CameraControl {
    ListenableFuture<Void> cancelFocusAndMetering();

    ListenableFuture<Void> enableLowLightBoostAsync(boolean z);

    ListenableFuture<Void> enableTorch(boolean z);

    ListenableFuture<Integer> setExposureCompensationIndex(int i);

    ListenableFuture<Void> setLinearZoom(float f);

    ListenableFuture<Void> setTorchStrengthLevel(int i);

    ListenableFuture<Void> setZoomRatio(float f);

    ListenableFuture<FocusMeteringResult> startFocusAndMetering(FocusMeteringAction focusMeteringAction);

    /* renomeado de: androidx.camera.core.CameraControl$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
    }

    public static final class OperationCanceledException extends Exception {
        public OperationCanceledException(String message) {
            super(message);
        }

        public OperationCanceledException(String message, Throwable cause) {
            super(message, cause);
        }
    }
}
