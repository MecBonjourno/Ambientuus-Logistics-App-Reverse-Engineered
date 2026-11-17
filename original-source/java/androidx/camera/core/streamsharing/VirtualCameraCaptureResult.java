package androidx.camera.core.streamsharing;

import android.hardware.camera2.CaptureResult;
import androidx.camera.core.impl.CameraCaptureMetaData;
import androidx.camera.core.impl.CameraCaptureResult;
import androidx.camera.core.impl.TagBundle;
import androidx.camera.core.impl.utils.ExifData;

/* loaded from: classes.dex */
public class VirtualCameraCaptureResult implements CameraCaptureResult {
    private static final long INVALID_TIMESTAMP = -1;
    private final CameraCaptureResult mBaseCameraCaptureResult;
    private final TagBundle mTagBundle;
    private final long mTimestamp;

    @Override // androidx.camera.core.impl.CameraCaptureResult
    public /* synthetic */ CaptureResult getCaptureResult() {
        return CameraCaptureResult.CC.$default$getCaptureResult(this);
    }

    @Override // androidx.camera.core.impl.CameraCaptureResult
    public /* synthetic */ void populateExifData(ExifData.Builder builder) {
        CameraCaptureResult.CC.$default$populateExifData(this, builder);
    }

    public VirtualCameraCaptureResult(TagBundle tagBundle, CameraCaptureResult baseCameraCaptureResult) {
        this(baseCameraCaptureResult, tagBundle, -1L);
    }

    public VirtualCameraCaptureResult(TagBundle tagBundle, long timestamp) {
        this(null, tagBundle, timestamp);
    }

    private VirtualCameraCaptureResult(CameraCaptureResult baseCameraCaptureResult, TagBundle tagBundle, long timestamp) {
        this.mBaseCameraCaptureResult = baseCameraCaptureResult;
        this.mTagBundle = tagBundle;
        this.mTimestamp = timestamp;
    }

    @Override // androidx.camera.core.impl.CameraCaptureResult
    public TagBundle getTagBundle() {
        return this.mTagBundle;
    }

    @Override // androidx.camera.core.impl.CameraCaptureResult
    public CameraCaptureMetaData.AfMode getAfMode() {
        return this.mBaseCameraCaptureResult != null ? this.mBaseCameraCaptureResult.getAfMode() : CameraCaptureMetaData.AfMode.UNKNOWN;
    }

    @Override // androidx.camera.core.impl.CameraCaptureResult
    public CameraCaptureMetaData.AfState getAfState() {
        return this.mBaseCameraCaptureResult != null ? this.mBaseCameraCaptureResult.getAfState() : CameraCaptureMetaData.AfState.UNKNOWN;
    }

    @Override // androidx.camera.core.impl.CameraCaptureResult
    public CameraCaptureMetaData.AeState getAeState() {
        return this.mBaseCameraCaptureResult != null ? this.mBaseCameraCaptureResult.getAeState() : CameraCaptureMetaData.AeState.UNKNOWN;
    }

    @Override // androidx.camera.core.impl.CameraCaptureResult
    public CameraCaptureMetaData.AwbState getAwbState() {
        return this.mBaseCameraCaptureResult != null ? this.mBaseCameraCaptureResult.getAwbState() : CameraCaptureMetaData.AwbState.UNKNOWN;
    }

    @Override // androidx.camera.core.impl.CameraCaptureResult
    public CameraCaptureMetaData.FlashState getFlashState() {
        return this.mBaseCameraCaptureResult != null ? this.mBaseCameraCaptureResult.getFlashState() : CameraCaptureMetaData.FlashState.UNKNOWN;
    }

    @Override // androidx.camera.core.impl.CameraCaptureResult
    public CameraCaptureMetaData.AeMode getAeMode() {
        return this.mBaseCameraCaptureResult != null ? this.mBaseCameraCaptureResult.getAeMode() : CameraCaptureMetaData.AeMode.UNKNOWN;
    }

    @Override // androidx.camera.core.impl.CameraCaptureResult
    public CameraCaptureMetaData.AwbMode getAwbMode() {
        return this.mBaseCameraCaptureResult != null ? this.mBaseCameraCaptureResult.getAwbMode() : CameraCaptureMetaData.AwbMode.UNKNOWN;
    }

    @Override // androidx.camera.core.impl.CameraCaptureResult
    public long getTimestamp() {
        if (this.mBaseCameraCaptureResult != null) {
            return this.mBaseCameraCaptureResult.getTimestamp();
        }
        if (this.mTimestamp != -1) {
            return this.mTimestamp;
        }
        throw new IllegalStateException("No timestamp is available.");
    }
}
