package androidx.camera.camera2.internal.compat;

import android.hardware.camera2.params.StreamConfigurationMap;
import android.util.Range;
import android.util.Size;
import androidx.camera.camera2.internal.compat.workaround.OutputSizesCorrector;
import androidx.camera.core.Logger;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes.dex */
public class StreamConfigurationMapCompat {
    private static final String TAG = "StreamConfigurationMapCompat";
    private final StreamConfigurationMapCompatImpl mImpl;
    private final OutputSizesCorrector mOutputSizesCorrector;
    private final Map<Integer, Size[]> mCachedFormatOutputSizes = new HashMap();
    private final Map<Integer, Size[]> mCachedFormatHighResolutionOutputSizes = new HashMap();
    private final Map<Class<?>, Size[]> mCachedClassOutputSizes = new HashMap();

    interface StreamConfigurationMapCompatImpl {
        Size[] getHighResolutionOutputSizes(int i);

        Range<Integer>[] getHighSpeedVideoFpsRanges();

        Range<Integer>[] getHighSpeedVideoFpsRangesFor(Size size) throws IllegalArgumentException;

        Size[] getHighSpeedVideoSizes();

        Size[] getHighSpeedVideoSizesFor(Range<Integer> range) throws IllegalArgumentException;

        int[] getOutputFormats();

        long getOutputMinFrameDuration(int i, Size size);

        Size[] getOutputSizes(int i);

        <T> Size[] getOutputSizes(Class<T> cls);

        StreamConfigurationMap unwrap();
    }

    private StreamConfigurationMapCompat(StreamConfigurationMap map, OutputSizesCorrector outputSizesCorrector) {
        this.mImpl = new StreamConfigurationMapCompatApi23Impl(map);
        this.mOutputSizesCorrector = outputSizesCorrector;
    }

    static StreamConfigurationMapCompat toStreamConfigurationMapCompat(StreamConfigurationMap map, OutputSizesCorrector outputSizesCorrector) {
        return new StreamConfigurationMapCompat(map, outputSizesCorrector);
    }

    public int[] getOutputFormats() {
        int[] result = this.mImpl.getOutputFormats();
        if (result == null) {
            return null;
        }
        return (int[]) result.clone();
    }

    public Size[] getOutputSizes(int format) {
        if (this.mCachedFormatOutputSizes.containsKey(Integer.valueOf(format))) {
            Size[] cachedOutputSizes = this.mCachedFormatOutputSizes.get(Integer.valueOf(format));
            if (cachedOutputSizes == null) {
                return null;
            }
            return (Size[]) this.mCachedFormatOutputSizes.get(Integer.valueOf(format)).clone();
        }
        Size[] outputSizes = null;
        try {
            outputSizes = this.mImpl.getOutputSizes(format);
        } catch (Throwable t) {
            Logger.w(TAG, "Failed to get output sizes for " + format, t);
        }
        if (outputSizes == null || outputSizes.length == 0) {
            Logger.w(TAG, "Retrieved output sizes array is null or empty for format " + format);
            return outputSizes;
        }
        Size[] outputSizes2 = this.mOutputSizesCorrector.applyQuirks(outputSizes, format);
        this.mCachedFormatOutputSizes.put(Integer.valueOf(format), outputSizes2);
        return (Size[]) outputSizes2.clone();
    }

    public long getOutputMinFrameDuration(int format, Size size) {
        try {
            return this.mImpl.getOutputMinFrameDuration(format, size);
        } catch (RuntimeException e) {
            Logger.w(TAG, "Failed to get min frame duration for format = " + format + " and size = " + size, e);
            return 0L;
        }
    }

    public <T> Size[] getOutputSizes(Class<T> klass) {
        if (this.mCachedClassOutputSizes.containsKey(klass)) {
            Size[] cachedOutputSizes = this.mCachedClassOutputSizes.get(klass);
            if (cachedOutputSizes == null) {
                return null;
            }
            return (Size[]) this.mCachedClassOutputSizes.get(klass).clone();
        }
        Size[] outputSizes = null;
        try {
            outputSizes = this.mImpl.getOutputSizes(klass);
        } catch (Throwable t) {
            Logger.w(TAG, "Fail to get output sizes for " + klass, t);
        }
        if (outputSizes == null || outputSizes.length == 0) {
            Logger.w(TAG, "Retrieved output sizes array is null or empty for class " + klass);
            return outputSizes;
        }
        Size[] outputSizes2 = this.mOutputSizesCorrector.applyQuirks(outputSizes, klass);
        this.mCachedClassOutputSizes.put(klass, outputSizes2);
        return (Size[]) outputSizes2.clone();
    }

    public Size[] getHighResolutionOutputSizes(int format) {
        if (this.mCachedFormatHighResolutionOutputSizes.containsKey(Integer.valueOf(format))) {
            Size[] cachedOutputSizes = this.mCachedFormatHighResolutionOutputSizes.get(Integer.valueOf(format));
            if (cachedOutputSizes == null) {
                return null;
            }
            return (Size[]) this.mCachedFormatHighResolutionOutputSizes.get(Integer.valueOf(format)).clone();
        }
        Size[] outputSizes = this.mImpl.getHighResolutionOutputSizes(format);
        if (outputSizes != null && outputSizes.length > 0) {
            outputSizes = this.mOutputSizesCorrector.applyQuirks(outputSizes, format);
        }
        this.mCachedFormatHighResolutionOutputSizes.put(Integer.valueOf(format), outputSizes);
        if (outputSizes != null) {
            return (Size[]) outputSizes.clone();
        }
        return null;
    }

    public Range<Integer>[] getHighSpeedVideoFpsRanges() {
        return this.mImpl.getHighSpeedVideoFpsRanges();
    }

    public Range<Integer>[] getHighSpeedVideoFpsRangesFor(Size size) throws IllegalArgumentException {
        return this.mImpl.getHighSpeedVideoFpsRangesFor(size);
    }

    public Size[] getHighSpeedVideoSizes() {
        return this.mImpl.getHighSpeedVideoSizes();
    }

    public Size[] getHighSpeedVideoSizesFor(Range<Integer> fpsRange) throws IllegalArgumentException {
        return this.mImpl.getHighSpeedVideoSizesFor(fpsRange);
    }

    public StreamConfigurationMap toStreamConfigurationMap() {
        return this.mImpl.unwrap();
    }
}
