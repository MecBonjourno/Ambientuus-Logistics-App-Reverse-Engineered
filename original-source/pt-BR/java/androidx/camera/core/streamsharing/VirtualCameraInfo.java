package androidx.camera.core.streamsharing;

import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.ForwardingCameraInfo;
import androidx.camera.core.impl.utils.TransformUtils;
import java.util.UUID;

/* carregado de: classes.dex */
public class VirtualCameraInfo extends ForwardingCameraInfo {
    private final String mVirtualCameraId;
    private int mVirtualCameraRotationDegrees;

    VirtualCameraInfo(CameraInfoInternal cameraInfoInternal) {
        super(cameraInfoInternal);
        this.mVirtualCameraId = "virtual-" + cameraInfoInternal.getCameraId() + "-" + UUID.randomUUID().toString();
    }

    @Override // androidx.camera.core.impl.ForwardingCameraInfo, androidx.camera.core.impl.CameraInfoInternal
    public String getCameraId() {
        return this.mVirtualCameraId;
    }

    void setVirtualCameraRotationDegrees(int virtualCameraRotationDegrees) {
        this.mVirtualCameraRotationDegrees = virtualCameraRotationDegrees;
    }

    @Override // androidx.camera.core.impl.ForwardingCameraInfo, androidx.camera.core.CameraInfo
    public int getSensorRotationDegrees() {
        return getSensorRotationDegrees(0);
    }

    @Override // androidx.camera.core.impl.ForwardingCameraInfo, androidx.camera.core.CameraInfo
    public int getSensorRotationDegrees(int relativeRotation) {
        return TransformUtils.within360(super.getSensorRotationDegrees(relativeRotation) - this.mVirtualCameraRotationDegrees);
    }
}
