package androidx.camera.lifecycle;

import androidx.camera.core.CameraIdentifier;
import androidx.camera.lifecycle.LifecycleCameraRepository;

/* loaded from: classes.dex */
final class AutoValue_LifecycleCameraRepository_Key extends LifecycleCameraRepository.Key {
    private final CameraIdentifier cameraIdentifier;
    private final int lifecycleOwnerHash;

    AutoValue_LifecycleCameraRepository_Key(int lifecycleOwnerHash, CameraIdentifier cameraIdentifier) {
        this.lifecycleOwnerHash = lifecycleOwnerHash;
        if (cameraIdentifier == null) {
            throw new NullPointerException("Null cameraIdentifier");
        }
        this.cameraIdentifier = cameraIdentifier;
    }

    @Override // androidx.camera.lifecycle.LifecycleCameraRepository.Key
    public int getLifecycleOwnerHash() {
        return this.lifecycleOwnerHash;
    }

    @Override // androidx.camera.lifecycle.LifecycleCameraRepository.Key
    public CameraIdentifier getCameraIdentifier() {
        return this.cameraIdentifier;
    }

    public String toString() {
        return "Key{lifecycleOwnerHash=" + this.lifecycleOwnerHash + ", cameraIdentifier=" + this.cameraIdentifier + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof LifecycleCameraRepository.Key)) {
            return false;
        }
        LifecycleCameraRepository.Key that = (LifecycleCameraRepository.Key) o;
        return this.lifecycleOwnerHash == that.getLifecycleOwnerHash() && this.cameraIdentifier.equals(that.getCameraIdentifier());
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((h$ ^ this.lifecycleOwnerHash) * 1000003) ^ this.cameraIdentifier.hashCode();
    }
}
