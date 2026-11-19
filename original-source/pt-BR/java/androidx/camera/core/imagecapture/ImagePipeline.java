package androidx.camera.core.imagecapture;

import android.hardware.camera2.CameraCharacteristics;
import android.util.Size;
import androidx.camera.core.CameraEffect;
import androidx.camera.core.CaptureBundles;
import androidx.camera.core.ForwardingImageProxy;
import androidx.camera.core.MetadataImageReader;
import androidx.camera.core.imagecapture.CaptureNode;
import androidx.camera.core.imagecapture.ProcessingNode;
import androidx.camera.core.imagecapture.TakePictureManager;
import androidx.camera.core.impl.CaptureBundle;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.CaptureStage;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.ImageCaptureConfig;
import androidx.camera.core.impl.ImageInputConfig;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.internal.compat.workaround.ExifRotationAvailability;
import androidx.camera.core.internal.utils.ImageUtil;
import androidx.camera.core.processing.InternalImageProcessor;
import androidx.core.util.Pair;
import com.google.common.util.concurrent.ListenableFuture;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;

/* carregado de: classes.dex */
public class ImagePipeline {
    static final byte JPEG_QUALITY_MAX_QUALITY = 100;
    static final byte JPEG_QUALITY_MIN_LATENCY = 95;
    private final CaptureConfig mCaptureConfig;
    private final CaptureNode mCaptureNode;
    private final CaptureNode.In mPipelineIn;
    private final ProcessingNode mProcessingNode;
    private final ImageCaptureConfig mUseCaseConfig;
    private static int sNextRequestId = 0;
    static final ExifRotationAvailability EXIF_ROTATION_AVAILABILITY = new ExifRotationAvailability();

    public ImagePipeline(ImageCaptureConfig useCaseConfig, Size cameraSurfaceSize, CameraCharacteristics cameraCharacteristics) {
        this(useCaseConfig, cameraSurfaceSize, cameraCharacteristics, null, false, null);
    }

    public ImagePipeline(ImageCaptureConfig useCaseConfig, Size cameraSurfaceSize, CameraCharacteristics cameraCharacteristics, CameraEffect cameraEffect, boolean isVirtualCamera) {
        this(useCaseConfig, cameraSurfaceSize, cameraCharacteristics, cameraEffect, isVirtualCamera, null);
    }

    public ImagePipeline(ImageCaptureConfig useCaseConfig, Size cameraSurfaceSize, CameraCharacteristics cameraCharacteristics, CameraEffect cameraEffect, boolean isVirtualCamera, PostviewSettings postviewSettings) {
        Threads.checkMainThread();
        this.mUseCaseConfig = useCaseConfig;
        this.mCaptureConfig = CaptureConfig.Builder.createFrom(useCaseConfig).build();
        this.mCaptureNode = new CaptureNode();
        this.mProcessingNode = new ProcessingNode((Executor) Objects.requireNonNull(this.mUseCaseConfig.getIoExecutor(CameraXExecutors.ioExecutor())), cameraCharacteristics, cameraEffect != null ? new InternalImageProcessor(cameraEffect) : null);
        List<Integer> outputFormats = new ArrayList<>();
        if (this.mUseCaseConfig.getSecondaryInputFormat() != 0) {
            outputFormats.add(32);
            outputFormats.add(256);
        } else {
            outputFormats.add(Integer.valueOf(getOutputFormat()));
        }
        this.mPipelineIn = CaptureNode.In.of(cameraSurfaceSize, this.mUseCaseConfig.getInputFormat(), outputFormats, isVirtualCamera, this.mUseCaseConfig.getImageReaderProxyProvider(), postviewSettings);
        ProcessingNode.In processingIn = this.mCaptureNode.transform(this.mPipelineIn);
        this.mProcessingNode.transform(processingIn);
    }

    public SessionConfig.Builder createSessionConfigBuilder(Size resolution) {
        SessionConfig.Builder builder = SessionConfig.Builder.createFrom(this.mUseCaseConfig, resolution);
        builder.addNonRepeatingSurface(this.mPipelineIn.getSurface());
        if (this.mPipelineIn.getOutputFormats().size() > 1 && this.mPipelineIn.getSecondarySurface() != null) {
            builder.addNonRepeatingSurface(this.mPipelineIn.getSecondarySurface());
        }
        if (this.mPipelineIn.getPostviewSurface() != null) {
            builder.setPostviewSurface(this.mPipelineIn.getPostviewSurface());
        }
        return builder;
    }

    public void close() {
        Threads.checkMainThread();
        this.mCaptureNode.release();
        this.mProcessingNode.release();
    }

    public int getCapacity() {
        Threads.checkMainThread();
        return this.mCaptureNode.getCapacity();
    }

    public void setOnImageCloseListener(ForwardingImageProxy.OnImageCloseListener listener) {
        Threads.checkMainThread();
        this.mCaptureNode.setOnImageCloseListener(listener);
    }

    Pair<CameraRequest, ProcessingRequest> createRequests(TakePictureRequest takePictureRequest, TakePictureCallback takePictureCallback, ListenableFuture<Void> captureFuture) {
        Threads.checkMainThread();
        CaptureBundle captureBundle = createCaptureBundle();
        int requestId = sNextRequestId;
        sNextRequestId = requestId + 1;
        return new Pair<>(createCameraRequest(requestId, captureBundle, takePictureRequest, takePictureCallback), createProcessingRequest(requestId, captureBundle, takePictureRequest, takePictureCallback, captureFuture));
    }

    void submitProcessingRequest(ProcessingRequest request) {
        Threads.checkMainThread();
        this.mPipelineIn.getRequestEdge().accept(request);
    }

    void notifyCaptureError(TakePictureManager.CaptureError error) {
        Threads.checkMainThread();
        this.mPipelineIn.getErrorEdge().accept(error);
    }

    private int getOutputFormat() {
        Integer bufferFormat = (Integer) this.mUseCaseConfig.retrieveOption(ImageCaptureConfig.OPTION_BUFFER_FORMAT, null);
        if (bufferFormat != null) {
            return bufferFormat.intValue();
        }
        Integer inputFormat = (Integer) this.mUseCaseConfig.retrieveOption(ImageInputConfig.OPTION_INPUT_FORMAT, null);
        if (inputFormat == null || inputFormat.intValue() != 4101) {
            return (inputFormat == null || inputFormat.intValue() != 32) ? 256 : 32;
        }
        return 4101;
    }

    private CaptureBundle createCaptureBundle() {
        return (CaptureBundle) Objects.requireNonNull(this.mUseCaseConfig.getCaptureBundle(CaptureBundles.singleDefaultCaptureBundle()));
    }

    private ProcessingRequest createProcessingRequest(int requestId, CaptureBundle captureBundle, TakePictureRequest takePictureRequest, TakePictureCallback takePictureCallback, ListenableFuture<Void> captureFuture) {
        return new ProcessingRequest(captureBundle, takePictureRequest, takePictureCallback, captureFuture, requestId);
    }

    private boolean shouldEnablePostview() {
        return this.mPipelineIn.getPostviewSurface() != null;
    }

    public PostviewSettings getPostviewSettings() {
        return this.mPipelineIn.getPostviewSettings();
    }

    private CameraRequest createCameraRequest(int requestId, CaptureBundle captureBundle, TakePictureRequest takePictureRequest, TakePictureCallback takePictureCallback) {
        List<CaptureConfig> captureConfigs = new ArrayList<>();
        String tagBundleKey = String.valueOf(captureBundle.hashCode());
        for (CaptureStage captureStage : (List) Objects.requireNonNull(captureBundle.getCaptureStages())) {
            CaptureConfig.Builder builder = new CaptureConfig.Builder();
            builder.setTemplateType(this.mCaptureConfig.getTemplateType());
            builder.addImplementationOptions(this.mCaptureConfig.getImplementationOptions());
            builder.addAllCameraCaptureCallbacks(takePictureRequest.getSessionConfigCameraCaptureCallbacks());
            builder.addSurface(this.mPipelineIn.getSurface());
            if (this.mPipelineIn.getOutputFormats().size() > 1 && this.mPipelineIn.getSecondarySurface() != null) {
                builder.addSurface(this.mPipelineIn.getSecondarySurface());
            }
            boolean shouldEnablePostview = shouldEnablePostview();
            if (shouldEnablePostview) {
                builder.addSurface((DeferrableSurface) Objects.requireNonNull(this.mPipelineIn.getPostviewSurface()));
            }
            builder.setPostviewEnabled(shouldEnablePostview);
            if (ImageUtil.isJpegFormats(this.mPipelineIn.getInputFormat()) || ImageUtil.isRawFormats(this.mPipelineIn.getInputFormat())) {
                if (EXIF_ROTATION_AVAILABILITY.isRotationOptionSupported()) {
                    builder.addImplementationOption(CaptureConfig.OPTION_ROTATION, Integer.valueOf(takePictureRequest.getRotationDegrees()));
                }
                builder.addImplementationOption(CaptureConfig.OPTION_JPEG_QUALITY, Integer.valueOf(getCameraRequestJpegQuality(takePictureRequest)));
            }
            builder.addImplementationOptions(captureStage.getCaptureConfig().getImplementationOptions());
            builder.addTag(tagBundleKey, Integer.valueOf(captureStage.getId()));
            builder.setId(requestId);
            builder.addCameraCaptureCallback(this.mPipelineIn.getCameraCaptureCallback());
            if (this.mPipelineIn.getOutputFormats().size() > 1 && this.mPipelineIn.getSecondaryCameraCaptureCallback() != null) {
                builder.addCameraCaptureCallback(this.mPipelineIn.getSecondaryCameraCaptureCallback());
            }
            captureConfigs.add(builder.build());
        }
        return new CameraRequest(captureConfigs, takePictureCallback);
    }

    int getCameraRequestJpegQuality(TakePictureRequest request) {
        boolean isOnDisk = request.getOnDiskCallback() != null;
        boolean hasCropping = TransformUtils.hasCropping(request.getCropRect(), this.mPipelineIn.getSize());
        if (isOnDisk && hasCropping) {
            if (request.getCaptureMode() == 0) {
                return 100;
            }
            return 95;
        }
        return request.getJpegQuality();
    }

    CaptureNode getCaptureNode() {
        return this.mCaptureNode;
    }

    ProcessingNode getProcessingNode() {
        return this.mProcessingNode;
    }

    public boolean expectsMetadata() {
        return this.mCaptureNode.getSafeCloseImageReaderProxy().getImageReaderProxy() instanceof MetadataImageReader;
    }
}
