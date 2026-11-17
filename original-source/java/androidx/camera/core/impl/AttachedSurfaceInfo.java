package androidx.camera.core.impl;

import android.util.Range;
import android.util.Size;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.impl.UseCaseConfigFactory;
import java.util.List;

/* loaded from: classes.dex */
public abstract class AttachedSurfaceInfo {
    public abstract List<UseCaseConfigFactory.CaptureType> getCaptureTypes();

    public abstract DynamicRange getDynamicRange();

    public abstract int getImageFormat();

    public abstract Config getImplementationOptions();

    public abstract int getSessionType();

    public abstract Size getSize();

    public abstract SurfaceConfig getSurfaceConfig();

    public abstract Range<Integer> getTargetFrameRate();

    public abstract boolean isStrictFrameRateRequired();

    AttachedSurfaceInfo() {
    }

    public static AttachedSurfaceInfo create(SurfaceConfig surfaceConfig, int imageFormat, Size size, DynamicRange dynamicRange, List<UseCaseConfigFactory.CaptureType> captureTypes, Config implementationOptions, int sessionType, Range<Integer> targetFrameRate, boolean isStrictFrameRateRequired) {
        return new AutoValue_AttachedSurfaceInfo(surfaceConfig, imageFormat, size, dynamicRange, captureTypes, implementationOptions, sessionType, targetFrameRate, isStrictFrameRateRequired);
    }

    public StreamSpec toStreamSpec(Config implementationOptions) {
        StreamSpec.Builder streamSpecBuilder = StreamSpec.builder(getSize()).setSessionType(getSessionType()).setExpectedFrameRateRange(getTargetFrameRate()).setDynamicRange(getDynamicRange()).setImplementationOptions(implementationOptions);
        return streamSpecBuilder.build();
    }
}
