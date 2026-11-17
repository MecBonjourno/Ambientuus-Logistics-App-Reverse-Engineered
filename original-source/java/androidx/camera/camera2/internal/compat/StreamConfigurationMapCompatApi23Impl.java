package androidx.camera.camera2.internal.compat;

import android.hardware.camera2.params.StreamConfigurationMap;
import android.util.Size;

/* loaded from: classes.dex */
class StreamConfigurationMapCompatApi23Impl extends StreamConfigurationMapCompatBaseImpl {
    StreamConfigurationMapCompatApi23Impl(StreamConfigurationMap map) {
        super(map);
    }

    @Override // androidx.camera.camera2.internal.compat.StreamConfigurationMapCompatBaseImpl, androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat.StreamConfigurationMapCompatImpl
    public Size[] getOutputSizes(int format) {
        return this.mStreamConfigurationMap.getOutputSizes(format);
    }

    @Override // androidx.camera.camera2.internal.compat.StreamConfigurationMapCompatBaseImpl, androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat.StreamConfigurationMapCompatImpl
    public long getOutputMinFrameDuration(int format, Size size) {
        return this.mStreamConfigurationMap.getOutputMinFrameDuration(format, size);
    }
}
