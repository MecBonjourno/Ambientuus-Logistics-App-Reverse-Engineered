package androidx.camera.core.impl;

import androidx.camera.core.Camera;
import androidx.camera.core.CameraControl;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.UseCase;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.Collection;

/* carregado de: classes.dex */
public interface CameraInternal extends Camera, UseCase.StateChangeCallback {
    void attachUseCases(Collection<UseCase> collection);

    void close();

    void detachUseCases(Collection<UseCase> collection);

    @Override // androidx.camera.core.Camera
    CameraControl getCameraControl();

    CameraControlInternal getCameraControlInternal();

    @Override // androidx.camera.core.Camera
    CameraInfo getCameraInfo();

    CameraInfoInternal getCameraInfoInternal();

    Observable<State> getCameraState();

    @Override // androidx.camera.core.Camera
    CameraConfig getExtendedConfig();

    boolean getHasTransform();

    boolean isFrontFacing();

    void onRemoved();

    void open();

    ListenableFuture<Void> release();

    void setActiveResumingMode(boolean z);

    void setExtendedConfig(CameraConfig cameraConfig);

    void setPrimary(boolean z);

    public enum State {
        RELEASED(false),
        RELEASING(true),
        CLOSED(false),
        PENDING_OPEN(false),
        CLOSING(true),
        OPENING(true),
        OPEN(true),
        CONFIGURED(true);

        private final boolean mHoldsCameraSlot;

        State(boolean holdsCameraSlot) {
            this.mHoldsCameraSlot = holdsCameraSlot;
        }

        boolean holdsCameraSlot() {
            return this.mHoldsCameraSlot;
        }
    }

    /* renomeado de: androidx.camera.core.impl.CameraInternal$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        public static void $default$setActiveResumingMode(CameraInternal _this, boolean enabled) {
        }

        public static boolean $default$isFrontFacing(CameraInternal _this) {
            return _this.getCameraInfo().getLensFacing() == 0;
        }

        public static void $default$onRemoved(CameraInternal _this) {
        }

        public static boolean $default$getHasTransform(CameraInternal _this) {
            return true;
        }

        public static void $default$setPrimary(CameraInternal _this, boolean isPrimary) {
        }

        public static void $default$setExtendedConfig(CameraInternal _this, CameraConfig cameraConfig) {
        }
    }
}
