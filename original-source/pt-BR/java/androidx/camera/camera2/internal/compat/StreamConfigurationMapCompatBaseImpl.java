package androidx.camera.camera2.internal.compat;

import android.graphics.SurfaceTexture;
import android.hardware.camera2.params.StreamConfigurationMap;
import android.util.Range;
import android.util.Size;
import androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat;
import androidx.camera.core.Logger;

/* carregado de: classes.dex */
class StreamConfigurationMapCompatBaseImpl implements StreamConfigurationMapCompat.StreamConfigurationMapCompatImpl {
    private static final String TAG = "StreamConfigurationMapCompatBaseImpl";
    final StreamConfigurationMap mStreamConfigurationMap;

    StreamConfigurationMapCompatBaseImpl(StreamConfigurationMap map) {
        this.mStreamConfigurationMap = map;
    }

    @Override // androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat.StreamConfigurationMapCompatImpl
    public int[] getOutputFormats() {
        try {
            return this.mStreamConfigurationMap.getOutputFormats();
        } catch (IllegalArgumentException | NullPointerException e) {
            Logger.w(TAG, "Failed to get output formats from StreamConfigurationMap", e);
            return null;
        }
    }

    @Override // androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat.StreamConfigurationMapCompatImpl
    public Size[] getOutputSizes(int format) {
        if (format == 34) {
            Size[] sizes = this.mStreamConfigurationMap.getOutputSizes(SurfaceTexture.class);
            return sizes;
        }
        Size[] sizes2 = this.mStreamConfigurationMap.getOutputSizes(format);
        return sizes2;
    }

    @Override // androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat.StreamConfigurationMapCompatImpl
    public <T> Size[] getOutputSizes(Class<T> klass) {
        return this.mStreamConfigurationMap.getOutputSizes(klass);
    }

    @Override // androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat.StreamConfigurationMapCompatImpl
    public long getOutputMinFrameDuration(int format, Size size) {
        if (format == 34) {
            return this.mStreamConfigurationMap.getOutputMinFrameDuration(SurfaceTexture.class, size);
        }
        return this.mStreamConfigurationMap.getOutputMinFrameDuration(format, size);
    }

    @Override // androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat.StreamConfigurationMapCompatImpl
    public Size[] getHighResolutionOutputSizes(int format) {
        return Api23Impl.getHighResolutionOutputSizes(this.mStreamConfigurationMap, format);
    }

    @Override // androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat.StreamConfigurationMapCompatImpl
    public Range<Integer>[] getHighSpeedVideoFpsRanges() {
        return this.mStreamConfigurationMap.getHighSpeedVideoFpsRanges();
    }

    @Override // androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat.StreamConfigurationMapCompatImpl
    public Range<Integer>[] getHighSpeedVideoFpsRangesFor(Size size) throws IllegalArgumentException {
        return this.mStreamConfigurationMap.getHighSpeedVideoFpsRangesFor(size);
    }

    @Override // androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat.StreamConfigurationMapCompatImpl
    public Size[] getHighSpeedVideoSizes() {
        return this.mStreamConfigurationMap.getHighSpeedVideoSizes();
    }

    @Override // androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat.StreamConfigurationMapCompatImpl
    public Size[] getHighSpeedVideoSizesFor(Range<Integer> fpsRange) throws IllegalArgumentException {
        return this.mStreamConfigurationMap.getHighSpeedVideoSizesFor(fpsRange);
    }

    @Override // androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat.StreamConfigurationMapCompatImpl
    public StreamConfigurationMap unwrap() {
        return this.mStreamConfigurationMap;
    }

    static class Api23Impl {
        private Api23Impl() {
        }

        static Size[] getHighResolutionOutputSizes(StreamConfigurationMap streamConfigurationMap, int format) {
            return streamConfigurationMap.getHighResolutionOutputSizes(format);
        }
    }
}
