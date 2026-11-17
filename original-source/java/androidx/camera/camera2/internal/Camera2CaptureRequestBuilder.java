package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.TotalCaptureResult;
import android.util.Range;
import android.view.Surface;
import androidx.camera.camera2.internal.compat.workaround.TemplateParamsOverride;
import androidx.camera.camera2.interop.CaptureRequestOptions;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.CameraCaptureResult;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.StreamSpec;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
class Camera2CaptureRequestBuilder {
    private static final String TAG = "Camera2CaptureRequestBuilder";

    private Camera2CaptureRequestBuilder() {
    }

    private static List<Surface> getConfiguredSurfaces(List<DeferrableSurface> deferrableSurfaces, Map<DeferrableSurface, Surface> configuredSurfaceMap) {
        List<Surface> surfaceList = new ArrayList<>();
        for (DeferrableSurface deferrableSurface : deferrableSurfaces) {
            Surface surface = configuredSurfaceMap.get(deferrableSurface);
            if (surface == null) {
                throw new IllegalArgumentException("DeferrableSurface not in configuredSurfaceMap");
            }
            surfaceList.add(surface);
        }
        return surfaceList;
    }

    private static void applyTemplateParamsOverrideWorkaround(CaptureRequest.Builder builder, int template, TemplateParamsOverride templateParamsOverride) {
        for (Map.Entry<CaptureRequest.Key<?>, Object> entry : templateParamsOverride.getOverrideParams(template).entrySet()) {
            CaptureRequest.Key<Object> key = entry.getKey();
            builder.set(key, entry.getValue());
        }
    }

    private static void applyImplementationOptionToCaptureBuilder(CaptureRequest.Builder builder, Config config) {
        CaptureRequestOptions bundle = CaptureRequestOptions.Builder.from(config).build();
        for (Config.Option<?> option : bundle.listOptions()) {
            CaptureRequest.Key<Object> key = (CaptureRequest.Key) option.getToken();
            try {
                builder.set(key, bundle.retrieveOption(option));
            } catch (IllegalArgumentException e) {
                Logger.e(TAG, "CaptureRequest.Key is not supported: " + key);
            }
        }
    }

    private static void applyAeFpsRange(CaptureConfig captureConfig, CaptureRequest.Builder builder) {
        Range<Integer> expectedFrameRateRange = captureConfig.getExpectedFrameRateRange();
        if (!expectedFrameRateRange.equals(StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED)) {
            builder.set(CaptureRequest.CONTROL_AE_TARGET_FPS_RANGE, expectedFrameRateRange);
        }
        Logger.d(TAG, "applyAeFpsRange: expectedFrameRateRange = " + expectedFrameRateRange);
    }

    static void applyVideoStabilization(CaptureConfig captureConfig, CaptureRequest.Builder builder) {
        Integer mode = getVideoStabilizationModeFromCaptureConfig(captureConfig);
        if (mode != null) {
            builder.set(CaptureRequest.CONTROL_VIDEO_STABILIZATION_MODE, mode);
        }
        Logger.d(TAG, "applyVideoStabilization: mode = " + mode);
    }

    static Integer getVideoStabilizationModeFromCaptureConfig(CaptureConfig captureConfig) {
        if (captureConfig.getPreviewStabilizationMode() == 1 || captureConfig.getVideoStabilizationMode() == 1) {
            return 0;
        }
        if (captureConfig.getPreviewStabilizationMode() == 2) {
            return 2;
        }
        if (captureConfig.getVideoStabilizationMode() == 2) {
            return 1;
        }
        return null;
    }

    public static CaptureRequest build(CaptureConfig captureConfig, CameraDevice device, Map<DeferrableSurface, Surface> configuredSurfaceMap, boolean isRepeatingRequest, TemplateParamsOverride mTemplateParamsOverride) throws CameraAccessException {
        CaptureRequest.Builder builder;
        if (device == null) {
            return null;
        }
        List<Surface> surfaceList = getConfiguredSurfaces(captureConfig.getSurfaces(), configuredSurfaceMap);
        if (surfaceList.isEmpty()) {
            return null;
        }
        CameraCaptureResult cameraCaptureResult = captureConfig.getCameraCaptureResult();
        if (captureConfig.getTemplateType() == 5 && cameraCaptureResult != null && (cameraCaptureResult.getCaptureResult() instanceof TotalCaptureResult)) {
            Logger.d(TAG, "createReprocessCaptureRequest");
            builder = Api23Impl.createReprocessCaptureRequest(device, (TotalCaptureResult) cameraCaptureResult.getCaptureResult());
        } else {
            Logger.d(TAG, "createCaptureRequest");
            if (captureConfig.getTemplateType() == 5) {
                int templateType = isRepeatingRequest ? 1 : 2;
                builder = device.createCaptureRequest(templateType);
            } else {
                builder = device.createCaptureRequest(captureConfig.getTemplateType());
            }
        }
        applyTemplateParamsOverrideWorkaround(builder, captureConfig.getTemplateType(), mTemplateParamsOverride);
        applyAeFpsRange(captureConfig, builder);
        applyVideoStabilization(captureConfig, builder);
        if (captureConfig.getImplementationOptions().containsOption(CaptureConfig.OPTION_ROTATION)) {
            builder.set(CaptureRequest.JPEG_ORIENTATION, (Integer) captureConfig.getImplementationOptions().retrieveOption(CaptureConfig.OPTION_ROTATION));
        }
        if (captureConfig.getImplementationOptions().containsOption(CaptureConfig.OPTION_JPEG_QUALITY)) {
            builder.set(CaptureRequest.JPEG_QUALITY, Byte.valueOf(((Integer) captureConfig.getImplementationOptions().retrieveOption(CaptureConfig.OPTION_JPEG_QUALITY)).byteValue()));
        }
        applyImplementationOptionToCaptureBuilder(builder, captureConfig.getImplementationOptions());
        for (Surface surface : surfaceList) {
            builder.addTarget(surface);
        }
        builder.setTag(captureConfig.getTagBundle());
        return builder.build();
    }

    public static CaptureRequest buildWithoutTarget(CaptureConfig captureConfig, CameraDevice device, TemplateParamsOverride templateParamsOverride) throws CameraAccessException {
        if (device == null) {
            return null;
        }
        Logger.d(TAG, "template type = " + captureConfig.getTemplateType());
        CaptureRequest.Builder builder = device.createCaptureRequest(captureConfig.getTemplateType());
        applyTemplateParamsOverrideWorkaround(builder, captureConfig.getTemplateType(), templateParamsOverride);
        applyAeFpsRange(captureConfig, builder);
        applyImplementationOptionToCaptureBuilder(builder, captureConfig.getImplementationOptions());
        return builder.build();
    }

    static class Api23Impl {
        private Api23Impl() {
        }

        static CaptureRequest.Builder createReprocessCaptureRequest(CameraDevice cameraDevice, TotalCaptureResult totalCaptureResult) throws CameraAccessException {
            return cameraDevice.createReprocessCaptureRequest(totalCaptureResult);
        }
    }
}
