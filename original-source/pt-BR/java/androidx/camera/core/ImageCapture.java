package androidx.camera.core;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.location.Location;
import android.net.Uri;
import android.os.Looper;
import android.util.Log;
import android.util.Pair;
import android.util.Rational;
import android.util.Size;
import androidx.arch.core.util.Function;
import androidx.camera.core.featuregroup.GroupableFeature;
import androidx.camera.core.featuregroup.impl.feature.ImageFormatFeature;
import androidx.camera.core.imagecapture.ImageCaptureControl;
import androidx.camera.core.imagecapture.ImagePipeline;
import androidx.camera.core.imagecapture.PostviewSettings;
import androidx.camera.core.imagecapture.TakePictureManager;
import androidx.camera.core.imagecapture.TakePictureRequest;
import androidx.camera.core.impl.AdapterCameraInfo;
import androidx.camera.core.impl.CameraConfig;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.ConfigProvider;
import androidx.camera.core.impl.ImageCaptureConfig;
import androidx.camera.core.impl.ImageInputConfig;
import androidx.camera.core.impl.ImageOutputConfig;
import androidx.camera.core.impl.ImageReaderProxy;
import androidx.camera.core.impl.MutableConfig;
import androidx.camera.core.impl.MutableOptionsBundle;
import androidx.camera.core.impl.OptionsBundle;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.SessionProcessor;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.impl.StreamUseCase;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.impl.utils.CameraOrientationUtil;
import androidx.camera.core.impl.utils.CompareSizesByArea;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.core.internal.IoConfig;
import androidx.camera.core.internal.ScreenFlashWrapper;
import androidx.camera.core.internal.SupportedOutputSizesSorter;
import androidx.camera.core.internal.TargetConfig;
import androidx.camera.core.internal.compat.quirk.SoftwareJpegEncodingPreferredQuirk;
import androidx.camera.core.internal.compat.workaround.ExifRotationAvailability;
import androidx.camera.core.internal.utils.ImageUtil;
import androidx.camera.core.resolutionselector.AspectRatioStrategy;
import androidx.camera.core.resolutionselector.ResolutionSelector;
import androidx.camera.core.resolutionselector.ResolutionStrategy;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import j$.util.Objects;
import java.io.File;
import java.io.OutputStream;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicReference;

/* carregado de: classes.dex */
public final class ImageCapture extends UseCase {
    public static final int CAPTURE_MODE_MAXIMIZE_QUALITY = 0;
    public static final int CAPTURE_MODE_MINIMIZE_LATENCY = 1;
    public static final int CAPTURE_MODE_ZERO_SHUTTER_LAG = 2;
    private static final int DEFAULT_CAPTURE_MODE = 1;
    private static final int DEFAULT_FLASH_MODE = 2;
    public static final int ERROR_CAMERA_CLOSED = 3;
    public static final int ERROR_CAPTURE_FAILED = 2;
    public static final int ERROR_FILE_IO = 1;
    public static final int ERROR_INVALID_CAMERA = 4;
    private static final String ERROR_MSG_SCREEN_FLASH_NOT_SET = "A ScreenFlash instance is required for FLASH_MODE_SCREEN but was not found. If value from PreviewView.getScreenFlash() is set to ImageCapture.setScreenFlash(), ensure PreviewView.setScreenFlashWindow() is invoked first.";
    public static final int ERROR_UNKNOWN = 0;
    public static final int FLASH_MODE_AUTO = 0;
    public static final int FLASH_MODE_OFF = 2;
    public static final int FLASH_MODE_ON = 1;
    public static final int FLASH_MODE_SCREEN = 3;
    private static final int FLASH_MODE_UNKNOWN = -1;
    public static final int FLASH_TYPE_ONE_SHOT_FLASH = 0;
    public static final int FLASH_TYPE_USE_TORCH_AS_FLASH = 1;
    private static final byte JPEG_QUALITY_MAXIMIZE_QUALITY_MODE = 100;
    private static final byte JPEG_QUALITY_MINIMIZE_LATENCY_MODE = 95;
    private static final int MAX_IMAGES = 2;
    public static final int OUTPUT_FORMAT_JPEG = 0;
    public static final int OUTPUT_FORMAT_JPEG_ULTRA_HDR = 1;
    public static final int OUTPUT_FORMAT_RAW = 2;
    public static final int OUTPUT_FORMAT_RAW_JPEG = 3;
    public static final long SCREEN_FLASH_UI_APPLY_TIMEOUT_SECONDS = 3;
    private static final String TAG = "ImageCapture";
    private final int mCaptureMode;
    private SessionConfig.CloseableErrorListener mCloseableErrorListener;
    private final ImageReaderProxy.OnImageAvailableListener mClosingListener;
    private Rational mCropAspectRatio;
    private int mFlashMode;
    private final int mFlashType;
    private final ImageCaptureControl mImageCaptureControl;
    private ImagePipeline mImagePipeline;
    private final AtomicReference<Integer> mLockedFlashMode;
    private ScreenFlashWrapper mScreenFlashWrapper;
    SessionConfig.Builder mSessionConfigBuilder;
    private TakePictureManager mTakePictureManager;
    public static final Defaults DEFAULT_CONFIG = new Defaults();
    static final ExifRotationAvailability EXIF_ROTATION_AVAILABILITY = new ExifRotationAvailability();

    @Retention(RetentionPolicy.SOURCE)
    public @interface CaptureMode {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface FlashMode {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface FlashType {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface ImageCaptureError {
    }

    @Target({ElementType.TYPE_USE})
    @Retention(RetentionPolicy.SOURCE)
    public @interface OutputFormat {
    }

    public interface ScreenFlash {
        void apply(long j, ScreenFlashListener screenFlashListener);

        void clear();
    }

    public interface ScreenFlashListener {
        void onCompleted();
    }

    static /* sintético */ void lambda$new$0(ImageReaderProxy imageReader) {
        try {
            ImageProxy image = imageReader.acquireLatestImage();
            try {
                Log.d(TAG, "Discarding ImageProxy which was inadvertently acquired: " + image);
                if (image != null) {
                    image.close();
                }
            } finally {
            }
        } catch (IllegalStateException e) {
            Log.e(TAG, "Failed to acquire latest image.", e);
        }
    }

    ImageCapture(ImageCaptureConfig userConfig) {
        super(userConfig);
        this.mClosingListener = new ImageReaderProxy.OnImageAvailableListener() { // da classe: androidx.camera.core.ImageCapture$$ExternalSyntheticLambda4
            @Override // androidx.camera.core.impl.ImageReaderProxy.OnImageAvailableListener
            public final void onImageAvailable(ImageReaderProxy imageReaderProxy) {
                ImageCapture.lambda$new$0(imageReaderProxy);
            }
        };
        this.mLockedFlashMode = new AtomicReference<>(null);
        this.mFlashMode = -1;
        this.mCropAspectRatio = null;
        this.mImageCaptureControl = new ImageCaptureControl() { // da classe: androidx.camera.core.ImageCapture.1
            @Override // androidx.camera.core.imagecapture.ImageCaptureControl
            public void lockFlashMode() {
                ImageCapture.this.lockFlashMode();
            }

            @Override // androidx.camera.core.imagecapture.ImageCaptureControl
            public void unlockFlashMode() {
                ImageCapture.this.unlockFlashMode();
            }

            @Override // androidx.camera.core.imagecapture.ImageCaptureControl
            public ListenableFuture<Void> submitStillCaptureRequests(List<CaptureConfig> captureConfigs) {
                return ImageCapture.this.submitStillCaptureRequest(captureConfigs);
            }
        };
        ImageCaptureConfig useCaseConfig = (ImageCaptureConfig) getCurrentConfig();
        if (useCaseConfig.containsOption(ImageCaptureConfig.OPTION_IMAGE_CAPTURE_MODE)) {
            this.mCaptureMode = useCaseConfig.getCaptureMode();
        } else {
            this.mCaptureMode = 1;
        }
        this.mFlashType = useCaseConfig.getFlashType(0);
        this.mScreenFlashWrapper = ScreenFlashWrapper.from(useCaseConfig.getScreenFlash());
    }

    private boolean isSessionProcessorEnabledInCurrentCamera() {
        if (getCamera() == null) {
            return false;
        }
        CameraConfig cameraConfig = getCamera().getExtendedConfig();
        return cameraConfig.getSessionProcessor(null) != null;
    }

    /* JADX WARN: falha na inferência de tipo para: r1v2, types: [androidx.camera.core.impl.UseCaseConfig, androidx.camera.core.impl.UseCaseConfig<?>] */
    @Override // androidx.camera.core.UseCase
    public UseCaseConfig<?> getDefaultConfig(boolean applyDefaultConfig, UseCaseConfigFactory factory) {
        Config captureConfig = factory.getConfig(DEFAULT_CONFIG.getConfig().getCaptureType(), getCaptureMode());
        if (applyDefaultConfig) {
            captureConfig = Config.CC.mergeConfigs(captureConfig, DEFAULT_CONFIG.getConfig());
        }
        if (captureConfig == null) {
            return null;
        }
        return getUseCaseConfigBuilder(captureConfig).getUseCaseConfig();
    }

    @Override // androidx.camera.core.UseCase
    public UseCaseConfig.Builder<?, ?, ?> getUseCaseConfigBuilder(Config config) {
        return Builder.fromConfig(config);
    }

    /* JADX WARN: falha na inferência de tipo para: r1v17, types: [androidx.camera.core.impl.UseCaseConfig, androidx.camera.core.impl.UseCaseConfig<?>] */
    @Override // androidx.camera.core.UseCase
    protected UseCaseConfig<?> onMergeConfig(CameraInfoInternal cameraInfo, UseCaseConfig.Builder<?, ?, ?> builder) {
        applyFeatureGroupToConfig(builder);
        boolean z = true;
        if (cameraInfo.getCameraQuirks().contains(SoftwareJpegEncodingPreferredQuirk.class)) {
            if (Boolean.FALSE.equals(builder.getMutableConfig().retrieveOption(ImageCaptureConfig.OPTION_USE_SOFTWARE_JPEG_ENCODER, true))) {
                Logger.w(TAG, "Device quirk suggests software JPEG encoder, but it has been explicitly disabled.");
            } else {
                Logger.i(TAG, "Requesting software JPEG due to device quirk.");
                builder.getMutableConfig().insertOption(ImageCaptureConfig.OPTION_USE_SOFTWARE_JPEG_ENCODER, true);
            }
        }
        boolean useSoftwareJpeg = enforceSoftwareJpegConstraints(builder.getMutableConfig());
        Integer bufferFormat = (Integer) builder.getMutableConfig().retrieveOption(ImageCaptureConfig.OPTION_BUFFER_FORMAT, null);
        if (bufferFormat != null) {
            if (isSessionProcessorEnabledInCurrentCamera() && bufferFormat.intValue() != 256) {
                z = false;
            }
            Preconditions.checkArgument(z, "Cannot set non-JPEG buffer format with Extensions enabled.");
            builder.getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_FORMAT, Integer.valueOf(useSoftwareJpeg ? 35 : bufferFormat.intValue()));
        } else if (isOutputFormatRaw(builder.getMutableConfig())) {
            builder.getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_FORMAT, 32);
        } else if (isOutputFormatRawJpeg(builder.getMutableConfig())) {
            builder.getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_FORMAT, 32);
            builder.getMutableConfig().insertOption(ImageInputConfig.OPTION_SECONDARY_INPUT_FORMAT, 256);
        } else if (isOutputFormatUltraHdr(builder.getMutableConfig())) {
            builder.getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_FORMAT, 4101);
            builder.getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_DYNAMIC_RANGE, DynamicRange.UNSPECIFIED);
        } else if (useSoftwareJpeg) {
            builder.getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_FORMAT, 35);
        } else {
            List<Pair<Integer, Size[]>> supportedSizes = (List) builder.getMutableConfig().retrieveOption(ImageCaptureConfig.OPTION_SUPPORTED_RESOLUTIONS, null);
            if (supportedSizes == null) {
                builder.getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_FORMAT, 256);
            } else if (isImageFormatSupported(supportedSizes, 256)) {
                builder.getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_FORMAT, 256);
            } else if (isImageFormatSupported(supportedSizes, 35)) {
                builder.getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_FORMAT, 35);
            }
        }
        return builder.getUseCaseConfig();
    }

    private void applyFeatureGroupToConfig(UseCaseConfig.Builder<?, ?, ?> builder) {
        Set<GroupableFeature> featureGroup = getFeatureGroup();
        if (featureGroup != null) {
            int imageCaptureOutputFormat = 0;
            for (GroupableFeature feature : featureGroup) {
                if (feature instanceof ImageFormatFeature) {
                    imageCaptureOutputFormat = ((ImageFormatFeature) feature).getImageCaptureOutputFormat();
                }
            }
            builder.getMutableConfig().insertOption(ImageCaptureConfig.OPTION_OUTPUT_FORMAT, Integer.valueOf(imageCaptureOutputFormat));
        }
    }

    private static boolean isImageFormatSupported(List<Pair<Integer, Size[]>> supportedSizes, int imageFormat) {
        if (supportedSizes == null) {
            return false;
        }
        for (Pair<Integer, Size[]> supportedSize : supportedSizes) {
            if (((Integer) supportedSize.first).equals(Integer.valueOf(imageFormat))) {
                return true;
            }
        }
        return false;
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static boolean isOutputFormatUltraHdr(MutableConfig config) {
        return Objects.equals(config.retrieveOption(ImageCaptureConfig.OPTION_OUTPUT_FORMAT, null), 1);
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static boolean isOutputFormatRaw(MutableConfig config) {
        return Objects.equals(config.retrieveOption(ImageCaptureConfig.OPTION_OUTPUT_FORMAT, null), 2);
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static boolean isOutputFormatRawJpeg(MutableConfig config) {
        return Objects.equals(config.retrieveOption(ImageCaptureConfig.OPTION_OUTPUT_FORMAT, null), 3);
    }

    @Override // androidx.camera.core.UseCase
    public void onCameraControlReady() {
        Logger.d(TAG, "onCameraControlReady");
        trySetFlashModeToCameraControl();
        setScreenFlashToCameraControl();
    }

    private int getCameraLens() {
        Camera camera = getCamera();
        if (camera != null) {
            return camera.getCameraInfo().getLensFacing();
        }
        return -1;
    }

    public int getFlashMode() {
        int flashMode;
        synchronized (this.mLockedFlashMode) {
            flashMode = this.mFlashMode != -1 ? this.mFlashMode : ((ImageCaptureConfig) getCurrentConfig()).getFlashMode(2);
        }
        return flashMode;
    }

    public void setFlashMode(int flashMode) {
        Logger.d(TAG, "setFlashMode: flashMode = " + flashMode);
        if (flashMode != 0 && flashMode != 1 && flashMode != 2) {
            if (flashMode == 3) {
                if (this.mScreenFlashWrapper.getScreenFlash() == null) {
                    throw new IllegalArgumentException(ERROR_MSG_SCREEN_FLASH_NOT_SET);
                }
                if (getCamera() != null && getCameraLens() != 0) {
                    throw new IllegalArgumentException("Not a front camera despite setting FLASH_MODE_SCREEN");
                }
            } else {
                throw new IllegalArgumentException("Invalid flash mode: " + flashMode);
            }
        }
        synchronized (this.mLockedFlashMode) {
            this.mFlashMode = flashMode;
            trySetFlashModeToCameraControl();
        }
    }

    public void setScreenFlash(ScreenFlash screenFlash) {
        this.mScreenFlashWrapper = ScreenFlashWrapper.from(screenFlash);
        setScreenFlashToCameraControl();
    }

    public ScreenFlash getScreenFlash() {
        return this.mScreenFlashWrapper.getScreenFlash();
    }

    private void setScreenFlashToCameraControl() {
        setScreenFlashToCameraControl(this.mScreenFlashWrapper);
    }

    private void setScreenFlashToCameraControl(ScreenFlash screenFlash) {
        getCameraControl().setScreenFlash(screenFlash);
    }

    public void setCropAspectRatio(Rational aspectRatio) {
        this.mCropAspectRatio = aspectRatio;
    }

    public int getTargetRotation() {
        return getTargetRotationInternal();
    }

    public void setTargetRotation(int rotation) {
        int oldRotation = getTargetRotation();
        if (setTargetRotationInternal(rotation) && this.mCropAspectRatio != null) {
            int oldRotationDegrees = CameraOrientationUtil.surfaceRotationToDegrees(oldRotation);
            int newRotationDegrees = CameraOrientationUtil.surfaceRotationToDegrees(rotation);
            this.mCropAspectRatio = ImageUtil.getRotatedAspectRatio(Math.abs(newRotationDegrees - oldRotationDegrees), this.mCropAspectRatio);
        }
    }

    public int getCaptureMode() {
        return this.mCaptureMode;
    }

    public int getJpegQuality() {
        return getJpegQualityInternal();
    }

    public ResolutionInfo getResolutionInfo() {
        return getResolutionInfoInternal();
    }

    @Override // androidx.camera.core.UseCase
    protected ResolutionInfo getResolutionInfoInternal() {
        CameraInternal camera = getCamera();
        Size resolution = getAttachedSurfaceResolution();
        if (camera == null || resolution == null) {
            return null;
        }
        Rect cropRect = getViewPortCropRect();
        Rational cropAspectRatio = this.mCropAspectRatio;
        if (cropRect == null) {
            if (cropAspectRatio != null) {
                cropRect = ImageUtil.computeCropRectFromAspectRatio(resolution, cropAspectRatio);
            } else {
                cropRect = new Rect(0, 0, resolution.getWidth(), resolution.getHeight());
            }
        }
        int rotationDegrees = getRelativeRotation(camera);
        return new ResolutionInfo(resolution, (Rect) Objects.requireNonNull(cropRect), rotationDegrees);
    }

    public ResolutionSelector getResolutionSelector() {
        return ((ImageOutputConfig) getCurrentConfig()).getResolutionSelector(null);
    }

    public int getOutputFormat() {
        return ((Integer) Preconditions.checkNotNull((Integer) getCurrentConfig().retrieveOption(ImageCaptureConfig.OPTION_OUTPUT_FORMAT, 0))).intValue();
    }

    /* renomeado de: takePicture, motivo: mesclado com método bridge [métodos inline] */
    public void m152lambda$takePicture$1$androidxcameracoreImageCapture(final Executor executor, final OnImageCapturedCallback callback) {
        if (Looper.getMainLooper() != Looper.myLooper()) {
            CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // da classe: androidx.camera.core.ImageCapture$$ExternalSyntheticLambda2
                @Override // java.lang.Runnable
                public final void run() {
                    ImageCapture.this.m152lambda$takePicture$1$androidxcameracoreImageCapture(executor, callback);
                }
            });
        } else {
            takePictureInternal(executor, callback, null, null, null);
        }
    }

    /* renomeado de: takePicture, motivo: mesclado com método bridge [métodos inline] */
    public void m153lambda$takePicture$2$androidxcameracoreImageCapture(final OutputFileOptions outputFileOptions, final Executor executor, final OnImageSavedCallback imageSavedCallback) {
        if (Looper.getMainLooper() != Looper.myLooper()) {
            CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // da classe: androidx.camera.core.ImageCapture$$ExternalSyntheticLambda3
                @Override // java.lang.Runnable
                public final void run() {
                    ImageCapture.this.m153lambda$takePicture$2$androidxcameracoreImageCapture(outputFileOptions, executor, imageSavedCallback);
                }
            });
        } else {
            takePictureInternal(executor, null, imageSavedCallback, outputFileOptions, null);
        }
    }

    /* renomeado de: takePicture, motivo: mesclado com método bridge [métodos inline] */
    public void m154lambda$takePicture$3$androidxcameracoreImageCapture(final OutputFileOptions rawOutputFileOptions, final OutputFileOptions jpegOutputFileOptions, final Executor executor, final OnImageSavedCallback imageSavedCallback) {
        if (Looper.getMainLooper() != Looper.myLooper()) {
            CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // da classe: androidx.camera.core.ImageCapture$$ExternalSyntheticLambda6
                @Override // java.lang.Runnable
                public final void run() {
                    ImageCapture.this.m154lambda$takePicture$3$androidxcameracoreImageCapture(rawOutputFileOptions, jpegOutputFileOptions, executor, imageSavedCallback);
                }
            });
        } else {
            takePictureInternal(executor, null, imageSavedCallback, rawOutputFileOptions, jpegOutputFileOptions);
        }
    }

    public static ImageCaptureCapabilities getImageCaptureCapabilities(CameraInfo cameraInfo) {
        return new ImageCaptureCapabilitiesImpl(cameraInfo);
    }

    private static class ImageCaptureCapabilitiesImpl implements ImageCaptureCapabilities {
        private final CameraInfo mCameraInfo;

        ImageCaptureCapabilitiesImpl(CameraInfo cameraInfo) {
            this.mCameraInfo = cameraInfo;
        }

        @Override // androidx.camera.core.ImageCaptureCapabilities
        public boolean isPostviewSupported() {
            if (this.mCameraInfo instanceof CameraInfoInternal) {
                return ((CameraInfoInternal) this.mCameraInfo).isPostviewSupported();
            }
            return false;
        }

        @Override // androidx.camera.core.ImageCaptureCapabilities
        public boolean isCaptureProcessProgressSupported() {
            if (this.mCameraInfo instanceof CameraInfoInternal) {
                return ((CameraInfoInternal) this.mCameraInfo).isCaptureProcessProgressSupported();
            }
            return false;
        }

        @Override // androidx.camera.core.ImageCaptureCapabilities
        public Set<Integer> getSupportedOutputFormats() {
            Set<Integer> outputFormatsFromAdapterCameraInfo = getSupportedOutputFormatsFromAdapterCameraInfo();
            if (outputFormatsFromAdapterCameraInfo != null) {
                return outputFormatsFromAdapterCameraInfo;
            }
            Set<Integer> formats = new HashSet<>();
            formats.add(0);
            if (isUltraHdrSupported()) {
                formats.add(1);
            }
            if (isRawSupported()) {
                formats.add(2);
                formats.add(3);
            }
            return formats;
        }

        private boolean isUltraHdrSupported() {
            if (this.mCameraInfo instanceof CameraInfoInternal) {
                CameraInfoInternal cameraInfoInternal = (CameraInfoInternal) this.mCameraInfo;
                return cameraInfoInternal.getSupportedOutputFormats().contains(4101);
            }
            return false;
        }

        private boolean isRawSupported() {
            if (!(this.mCameraInfo instanceof CameraInfoInternal)) {
                return false;
            }
            CameraInfoInternal cameraInfoInternal = (CameraInfoInternal) this.mCameraInfo;
            if (cameraInfoInternal.getAvailableCapabilities().contains(3)) {
                return cameraInfoInternal.getSupportedOutputFormats().contains(32);
            }
            return false;
        }

        private Set<Integer> getSupportedOutputFormatsFromAdapterCameraInfo() {
            if (!(this.mCameraInfo instanceof AdapterCameraInfo)) {
                return null;
            }
            CameraConfig cameraConfig = ((AdapterCameraInfo) this.mCameraInfo).getCameraConfig();
            UseCaseConfigFactory useCaseConfigFactory = cameraConfig.getUseCaseConfigFactory();
            Config useCaseConfig = useCaseConfigFactory.getConfig(UseCaseConfigFactory.CaptureType.IMAGE_CAPTURE, 1);
            if (useCaseConfig == null || !useCaseConfig.containsOption(ImageCaptureConfig.OPTION_SUPPORTED_RESOLUTIONS)) {
                return null;
            }
            Set<Integer> formats = new HashSet<>();
            formats.add(0);
            Iterator it = ((List) useCaseConfig.retrieveOption(ImageCaptureConfig.OPTION_SUPPORTED_RESOLUTIONS)).iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                Pair<Integer, Size[]> formatSizesPair = (Pair) it.next();
                if (((Integer) formatSizesPair.first).intValue() == 4101) {
                    formats.add(1);
                    break;
                }
            }
            return formats;
        }
    }

    static Rect computeDispatchCropRect(Rect viewPortCropRect, Rational cropAspectRatio, int rotationDegrees, Size dispatchResolution, int dispatchRotationDegrees) {
        if (viewPortCropRect != null) {
            return ImageUtil.computeCropRectFromDispatchInfo(viewPortCropRect, rotationDegrees, dispatchResolution, dispatchRotationDegrees);
        }
        if (cropAspectRatio != null) {
            Rational aspectRatio = cropAspectRatio;
            if (dispatchRotationDegrees % 180 != 0) {
                aspectRatio = new Rational(cropAspectRatio.getDenominator(), cropAspectRatio.getNumerator());
            }
            if (ImageUtil.isAspectRatioValid(dispatchResolution, aspectRatio)) {
                return (Rect) Objects.requireNonNull(ImageUtil.computeCropRectFromAspectRatio(dispatchResolution, aspectRatio));
            }
        }
        return new Rect(0, 0, dispatchResolution.getWidth(), dispatchResolution.getHeight());
    }

    @Override // androidx.camera.core.UseCase
    public void onSessionStop() {
        abortImageCaptureRequests();
    }

    private void abortImageCaptureRequests() {
        this.mScreenFlashWrapper.completePendingTasks();
        if (this.mTakePictureManager != null) {
            this.mTakePictureManager.abortRequests();
        }
    }

    void lockFlashMode() {
        synchronized (this.mLockedFlashMode) {
            if (this.mLockedFlashMode.get() != null) {
                return;
            }
            this.mLockedFlashMode.set(Integer.valueOf(getFlashMode()));
        }
    }

    void unlockFlashMode() {
        synchronized (this.mLockedFlashMode) {
            Integer lockedFlashMode = this.mLockedFlashMode.getAndSet(null);
            if (lockedFlashMode == null) {
                return;
            }
            if (lockedFlashMode.intValue() != getFlashMode()) {
                trySetFlashModeToCameraControl();
            }
        }
    }

    private void trySetFlashModeToCameraControl() {
        synchronized (this.mLockedFlashMode) {
            if (this.mLockedFlashMode.get() != null) {
                return;
            }
            getCameraControl().setFlashMode(getFlashMode());
        }
    }

    private int getJpegQualityInternal() {
        ImageCaptureConfig imageCaptureConfig = (ImageCaptureConfig) getCurrentConfig();
        if (imageCaptureConfig.containsOption(ImageCaptureConfig.OPTION_JPEG_COMPRESSION_QUALITY)) {
            return imageCaptureConfig.getJpegQuality();
        }
        switch (this.mCaptureMode) {
            case 0:
                return 100;
            case 1:
            case 2:
                return 95;
            default:
                throw new IllegalStateException("CaptureMode " + this.mCaptureMode + " is invalid");
        }
    }

    public String toString() {
        return "ImageCapture:" + getName();
    }

    static int getError(Throwable throwable) {
        if (throwable instanceof CameraClosedException) {
            return 3;
        }
        if (throwable instanceof ImageCaptureException) {
            return ((ImageCaptureException) throwable).getImageCaptureError();
        }
        return 0;
    }

    boolean enforceSoftwareJpegConstraints(MutableConfig mutableConfig) {
        if (!Boolean.TRUE.equals(mutableConfig.retrieveOption(ImageCaptureConfig.OPTION_USE_SOFTWARE_JPEG_ENCODER, false))) {
            return false;
        }
        boolean supported = true;
        if (isSessionProcessorEnabledInCurrentCamera()) {
            Logger.w(TAG, "Software JPEG cannot be used with Extensions.");
            supported = false;
        }
        Integer bufferFormat = (Integer) mutableConfig.retrieveOption(ImageCaptureConfig.OPTION_BUFFER_FORMAT, null);
        if (bufferFormat != null && bufferFormat.intValue() != 256) {
            Logger.w(TAG, "Software JPEG cannot be used with non-JPEG output buffer format.");
            supported = false;
        }
        if (!supported) {
            Logger.w(TAG, "Unable to support software JPEG. Disabling.");
            mutableConfig.insertOption(ImageCaptureConfig.OPTION_USE_SOFTWARE_JPEG_ENCODER, false);
        }
        return supported;
    }

    @Override // androidx.camera.core.UseCase
    public void onUnbind() {
        abortImageCaptureRequests();
        clearPipeline();
        setScreenFlashToCameraControl(null);
    }

    @Override // androidx.camera.core.UseCase
    public void onBind() {
        CameraInternal camera = getCamera();
        Preconditions.checkNotNull(camera, "Attached camera cannot be null");
        if (getFlashMode() == 3 && getCameraLens() != 0) {
            throw new IllegalArgumentException("Not a front camera despite setting FLASH_MODE_SCREEN in ImageCapture");
        }
    }

    private SessionProcessor getSessionProcessor() {
        CameraConfig cameraConfig = getCamera().getExtendedConfig();
        return cameraConfig.getSessionProcessor(null);
    }

    @Override // androidx.camera.core.UseCase
    protected StreamSpec onSuggestedStreamSpecUpdated(StreamSpec primaryStreamSpec, StreamSpec secondaryStreamSpec) {
        List<androidx.camera.core.impl.SessionConfig> m;
        Logger.d(TAG, "onSuggestedStreamSpecUpdated: primaryStreamSpec = " + primaryStreamSpec + ", secondaryStreamSpec " + secondaryStreamSpec);
        this.mSessionConfigBuilder = createPipeline(getCameraId(), (ImageCaptureConfig) getCurrentConfig(), primaryStreamSpec);
        m = ImageAnalysis$$ExternalSyntheticBackport1.m(new Object[]{this.mSessionConfigBuilder.build()});
        updateSessionConfig(m);
        notifyActive();
        return primaryStreamSpec;
    }

    @Override // androidx.camera.core.UseCase
    protected StreamSpec onSuggestedStreamSpecImplementationOptionsUpdated(Config config) {
        List<androidx.camera.core.impl.SessionConfig> m;
        this.mSessionConfigBuilder.addImplementationOptions(config);
        m = ImageAnalysis$$ExternalSyntheticBackport1.m(new Object[]{this.mSessionConfigBuilder.build()});
        updateSessionConfig(m);
        return getAttachedStreamSpec().toBuilder().setImplementationOptions(config).build();
    }

    /* JADX WARN: região duplicada removida para o bloco: B:12:0x00bf  */
    /* JADX WARN: região duplicada removida para o bloco: B:20:0x0101  */
    /* JADX WARN: região duplicada removida para o bloco: B:23:0x010c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private androidx.camera.core.impl.SessionConfig.Builder createPipeline(java.lang.String r12, androidx.camera.core.impl.ImageCaptureConfig r13, androidx.camera.core.impl.StreamSpec r14) {
        /*
            Method dump skipped, instructions count: 291
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.core.ImageCapture.createPipeline(java.lang.String, androidx.camera.core.impl.ImageCaptureConfig, androidx.camera.core.impl.StreamSpec):androidx.camera.core.impl.SessionConfig$Builder");
    }

    /* renomeado de: lambda$createPipeline$4$androidx-camera-core-ImageCapture, motivo: nome Java inválido */
    /* sintético */ void m151lambda$createPipeline$4$androidxcameracoreImageCapture(androidx.camera.core.impl.SessionConfig sessionConfig, SessionConfig.SessionError error) {
        List<androidx.camera.core.impl.SessionConfig> m;
        if (getCamera() == null) {
            return;
        }
        this.mTakePictureManager.pause();
        clearPipeline(true);
        this.mSessionConfigBuilder = createPipeline(getCameraId(), (ImageCaptureConfig) getCurrentConfig(), (StreamSpec) Preconditions.checkNotNull(getAttachedStreamSpec()));
        m = ImageAnalysis$$ExternalSyntheticBackport1.m(new Object[]{this.mSessionConfigBuilder.build()});
        updateSessionConfig(m);
        notifyReset();
        this.mTakePictureManager.resume();
    }

    private PostviewSettings calculatePostviewSettings(int stillImageFormat, Size targetResolution) {
        SessionProcessor sessionProcessor = getSessionProcessor();
        if (sessionProcessor == null) {
            return null;
        }
        Map<Integer, List<Size>> formatSizesMap = sessionProcessor.getSupportedPostviewSize(targetResolution);
        int format = 0;
        List<Integer> supportedPostviewFormats = new ArrayList<>();
        if (isPostviewImageFormatSupported(formatSizesMap, 35)) {
            supportedPostviewFormats.add(35);
        }
        if (isPostviewImageFormatSupported(formatSizesMap, 256)) {
            supportedPostviewFormats.add(256);
        }
        if (isPostviewImageFormatSupported(formatSizesMap, 4101)) {
            supportedPostviewFormats.add(4101);
        }
        if (!supportedPostviewFormats.isEmpty()) {
            format = getCamera().getExtendedConfig().getPostviewFormatSelector().select(stillImageFormat, supportedPostviewFormats);
        }
        if (format == 0) {
            return null;
        }
        List<Size> sizes = formatSizesMap.get(Integer.valueOf(format));
        ResolutionSelector postviewSizeSelector = (ResolutionSelector) getCurrentConfig().retrieveOption(ImageCaptureConfig.OPTION_POSTVIEW_RESOLUTION_SELECTOR, null);
        if (postviewSizeSelector != null) {
            Collections.sort(sizes, new CompareSizesByArea(true));
            CameraInternal camera = getCamera();
            Rect sensorRect = camera.getCameraInfoInternal().getSensorRect();
            CameraInfoInternal cameraInfo = camera.getCameraInfoInternal();
            Rational fullFov = new Rational(sensorRect.width(), sensorRect.height());
            List<Size> result = SupportedOutputSizesSorter.sortSupportedOutputSizesByResolutionSelector(postviewSizeSelector, sizes, null, getTargetRotation(), fullFov, cameraInfo.getSensorRotationDegrees(), cameraInfo.getLensFacing());
            if (result.isEmpty()) {
                throw new IllegalArgumentException("The postview ResolutionSelector cannot select a valid size for the postview.");
            }
            return PostviewSettings.create(result.get(0), format);
        }
        return PostviewSettings.create((Size) Collections.max(sizes, new CompareSizesByArea()), format);
    }

    private boolean isPostviewImageFormatSupported(Map<Integer, List<Size>> formatSizesMap, int format) {
        return formatSizesMap.containsKey(Integer.valueOf(format)) && !formatSizesMap.get(Integer.valueOf(format)).isEmpty();
    }

    private void takePictureInternal(Executor executor, OnImageCapturedCallback inMemoryCallback, OnImageSavedCallback onDiskCallback, OutputFileOptions outputFileOptions, OutputFileOptions secondaryOutputFileOptions) {
        Threads.checkMainThread();
        if (getFlashMode() == 3 && this.mScreenFlashWrapper.getScreenFlash() == null) {
            throw new IllegalArgumentException(ERROR_MSG_SCREEN_FLASH_NOT_SET);
        }
        Log.d(TAG, "takePictureInternal");
        CameraInternal camera = getCamera();
        if (camera == null || !isInSession()) {
            sendInvalidCameraError(executor, inMemoryCallback, onDiskCallback);
            return;
        }
        boolean isSimultaneousCapture = getCurrentConfig().getSecondaryInputFormat() != 0;
        if (isSimultaneousCapture && secondaryOutputFileOptions == null) {
            throw new IllegalArgumentException("Simultaneous capture RAW and JPEG needs two output file options");
        }
        if (!isSimultaneousCapture && secondaryOutputFileOptions != null) {
            throw new IllegalArgumentException("Non simultaneous capture cannot have two output file options");
        }
        ((TakePictureManager) Objects.requireNonNull(this.mTakePictureManager)).offerRequest(TakePictureRequest.of(executor, inMemoryCallback, onDiskCallback, outputFileOptions, secondaryOutputFileOptions, getTakePictureCropRect(), getSensorToBufferTransformMatrix(), getRelativeRotation(camera), getJpegQualityInternal(), getCaptureMode(), isSimultaneousCapture, this.mSessionConfigBuilder.getSingleCameraCaptureCallbacks()));
    }

    private void sendInvalidCameraError(Executor executor, OnImageCapturedCallback inMemoryCallback, OnImageSavedCallback onDiskCallback) {
        ImageCaptureException exception = new ImageCaptureException(4, "Not bound to a valid Camera [" + this + "]", null);
        if (inMemoryCallback != null) {
            inMemoryCallback.onError(exception);
        } else {
            if (onDiskCallback != null) {
                onDiskCallback.onError(exception);
                return;
            }
            throw new IllegalArgumentException("Must have either in-memory or on-disk callback.");
        }
    }

    private Rect getTakePictureCropRect() {
        Rect rect = getViewPortCropRect();
        Size resolution = (Size) Objects.requireNonNull(getAttachedSurfaceResolution());
        if (rect != null) {
            return rect;
        }
        if (ImageUtil.isAspectRatioValid(this.mCropAspectRatio)) {
            int rotationDegrees = getRelativeRotation((CameraInternal) Objects.requireNonNull(getCamera()));
            Rational rotatedAspectRatio = new Rational(this.mCropAspectRatio.getDenominator(), this.mCropAspectRatio.getNumerator());
            Rational sensorCropRatio = TransformUtils.is90or270(rotationDegrees) ? rotatedAspectRatio : this.mCropAspectRatio;
            return (Rect) Objects.requireNonNull(ImageUtil.computeCropRectFromAspectRatio(resolution, sensorCropRatio));
        }
        return new Rect(0, 0, resolution.getWidth(), resolution.getHeight());
    }

    private void clearPipeline() {
        clearPipeline(false);
    }

    private void clearPipeline(boolean keepTakePictureManager) {
        Log.d(TAG, "clearPipeline");
        Threads.checkMainThread();
        if (this.mCloseableErrorListener != null) {
            this.mCloseableErrorListener.close();
            this.mCloseableErrorListener = null;
        }
        if (this.mImagePipeline != null) {
            this.mImagePipeline.close();
            this.mImagePipeline = null;
        }
        if (!keepTakePictureManager && this.mTakePictureManager != null) {
            this.mTakePictureManager.abortRequests();
            this.mTakePictureManager = null;
        }
        getCameraControl().clearZslConfig();
    }

    ListenableFuture<Void> submitStillCaptureRequest(List<CaptureConfig> captureConfigs) {
        Threads.checkMainThread();
        return Futures.transform(getCameraControl().submitStillCaptureRequests(captureConfigs, this.mCaptureMode, this.mFlashType), new Function() { // da classe: androidx.camera.core.ImageCapture$$ExternalSyntheticLambda5
            @Override // androidx.arch.core.util.Function
            public final Object apply(Object obj) {
                return ImageCapture.lambda$submitStillCaptureRequest$5((List) obj);
            }
        }, CameraXExecutors.directExecutor());
    }

    static /* sintético */ Void lambda$submitStillCaptureRequest$5(List input) {
        return null;
    }

    boolean isProcessingPipelineEnabled() {
        return (this.mImagePipeline == null || this.mTakePictureManager == null) ? false : true;
    }

    ImagePipeline getImagePipeline() {
        return this.mImagePipeline;
    }

    TakePictureManager getTakePictureManager() {
        return (TakePictureManager) Objects.requireNonNull(this.mTakePictureManager);
    }

    @Override // androidx.camera.core.UseCase
    public Set<Integer> getSupportedEffectTargets() {
        Set<Integer> targets = new HashSet<>();
        targets.add(4);
        return targets;
    }

    public ImageCaptureLatencyEstimate getRealtimeCaptureLatencyEstimate() {
        CameraInternal camera = getCamera();
        if (camera == null) {
            return ImageCaptureLatencyEstimate.UNDEFINED_IMAGE_CAPTURE_LATENCY;
        }
        CameraConfig config = camera.getExtendedConfig();
        SessionProcessor sessionProcessor = config.getSessionProcessor(null);
        Pair<Long, Long> latencyEstimate = sessionProcessor != null ? sessionProcessor.getRealtimeCaptureLatency() : null;
        if (latencyEstimate == null) {
            return ImageCaptureLatencyEstimate.UNDEFINED_IMAGE_CAPTURE_LATENCY;
        }
        return new ImageCaptureLatencyEstimate(((Long) latencyEstimate.first).longValue(), ((Long) latencyEstimate.second).longValue());
    }

    public boolean isPostviewEnabled() {
        return ((Boolean) getCurrentConfig().retrieveOption(ImageCaptureConfig.OPTION_POSTVIEW_ENABLED, false)).booleanValue();
    }

    public ResolutionSelector getPostviewResolutionSelector() {
        return (ResolutionSelector) getCurrentConfig().retrieveOption(ImageCaptureConfig.OPTION_POSTVIEW_RESOLUTION_SELECTOR, null);
    }

    public interface OnImageSavedCallback {
        void onCaptureProcessProgressed(int i);

        void onCaptureStarted();

        void onError(ImageCaptureException imageCaptureException);

        void onImageSaved(OutputFileResults outputFileResults);

        void onPostviewBitmapAvailable(Bitmap bitmap);

        /* renomeado de: androidx.camera.core.ImageCapture$OnImageSavedCallback$-CC, motivo: nome de classe inválido */
        public final /* sintético */ class CC {
            public static void $default$onCaptureStarted(OnImageSavedCallback _this) {
            }

            public static void $default$onCaptureProcessProgressed(OnImageSavedCallback _this, int progress) {
            }

            public static void $default$onPostviewBitmapAvailable(OnImageSavedCallback _this, Bitmap bitmap) {
            }
        }
    }

    public static abstract class OnImageCapturedCallback {
        public void onCaptureStarted() {
        }

        public void onCaptureSuccess(ImageProxy image) {
        }

        public void onError(ImageCaptureException exception) {
        }

        public void onCaptureProcessProgressed(int progress) {
        }

        public void onPostviewBitmapAvailable(Bitmap bitmap) {
        }
    }

    public static final class Defaults implements ConfigProvider<ImageCaptureConfig> {
        private static final int DEFAULT_ASPECT_RATIO = 0;
        private static final ImageCaptureConfig DEFAULT_CONFIG;
        private static final int DEFAULT_OUTPUT_FORMAT = 0;
        private static final int DEFAULT_SURFACE_OCCUPANCY_PRIORITY = 4;
        private static final StreamUseCase DEFAULT_STREAM_USE_CASE = StreamUseCase.STILL_CAPTURE;
        private static final ResolutionSelector DEFAULT_RESOLUTION_SELECTOR = new ResolutionSelector.Builder().setAspectRatioStrategy(AspectRatioStrategy.RATIO_4_3_FALLBACK_AUTO_STRATEGY).setResolutionStrategy(ResolutionStrategy.HIGHEST_AVAILABLE_STRATEGY).build();
        private static final DynamicRange DEFAULT_DYNAMIC_RANGE = DynamicRange.SDR;

        static {
            Builder builder = new Builder().setSurfaceOccupancyPriority(4).setStreamUseCase(DEFAULT_STREAM_USE_CASE).setTargetAspectRatio(0).setResolutionSelector(DEFAULT_RESOLUTION_SELECTOR).setOutputFormat(0).setDynamicRange(DEFAULT_DYNAMIC_RANGE);
            DEFAULT_CONFIG = builder.getUseCaseConfig();
        }

        @Override // androidx.camera.core.impl.ConfigProvider
        public ImageCaptureConfig getConfig() {
            return DEFAULT_CONFIG;
        }
    }

    public static final class OutputFileOptions {
        private final ContentResolver mContentResolver;
        private final ContentValues mContentValues;
        private final File mFile;
        private final Metadata mMetadata;
        private final OutputStream mOutputStream;
        private final Uri mSaveCollection;

        OutputFileOptions(File file, ContentResolver contentResolver, Uri saveCollection, ContentValues contentValues, OutputStream outputStream, Metadata metadata) {
            this.mFile = file;
            this.mContentResolver = contentResolver;
            this.mSaveCollection = saveCollection;
            this.mContentValues = contentValues;
            this.mOutputStream = outputStream;
            this.mMetadata = metadata == null ? new Metadata() : metadata;
        }

        public File getFile() {
            return this.mFile;
        }

        public ContentResolver getContentResolver() {
            return this.mContentResolver;
        }

        public Uri getSaveCollection() {
            return this.mSaveCollection;
        }

        public ContentValues getContentValues() {
            return this.mContentValues;
        }

        public OutputStream getOutputStream() {
            return this.mOutputStream;
        }

        public Metadata getMetadata() {
            return this.mMetadata;
        }

        public String toString() {
            return "OutputFileOptions{mFile=" + this.mFile + ", mContentResolver=" + this.mContentResolver + ", mSaveCollection=" + this.mSaveCollection + ", mContentValues=" + this.mContentValues + ", mOutputStream=" + this.mOutputStream + ", mMetadata=" + this.mMetadata + "}";
        }

        public static final class Builder {
            private ContentResolver mContentResolver;
            private ContentValues mContentValues;
            private File mFile;
            private Metadata mMetadata;
            private OutputStream mOutputStream;
            private Uri mSaveCollection;

            public Builder(File file) {
                this.mFile = file;
            }

            public Builder(ContentResolver contentResolver, Uri saveCollection, ContentValues contentValues) {
                this.mContentResolver = contentResolver;
                this.mSaveCollection = saveCollection;
                this.mContentValues = contentValues;
            }

            public Builder(OutputStream outputStream) {
                this.mOutputStream = outputStream;
            }

            public Builder setMetadata(Metadata metadata) {
                this.mMetadata = metadata;
                return this;
            }

            public OutputFileOptions build() {
                return new OutputFileOptions(this.mFile, this.mContentResolver, this.mSaveCollection, this.mContentValues, this.mOutputStream, this.mMetadata);
            }
        }
    }

    public static class OutputFileResults {
        private final int mImageFormat;
        private final Uri mSavedUri;

        public OutputFileResults(Uri savedUri) {
            this(savedUri, 256);
        }

        public OutputFileResults(Uri savedUri, int imageFormat) {
            this.mSavedUri = savedUri;
            this.mImageFormat = imageFormat;
        }

        public Uri getSavedUri() {
            return this.mSavedUri;
        }

        public int getImageFormat() {
            return this.mImageFormat;
        }
    }

    public static final class Metadata {
        private boolean mIsReversedHorizontal;
        private boolean mIsReversedHorizontalSet = false;
        private boolean mIsReversedVertical;
        private Location mLocation;

        public boolean isReversedHorizontal() {
            return this.mIsReversedHorizontal;
        }

        public boolean isReversedHorizontalSet() {
            return this.mIsReversedHorizontalSet;
        }

        public void setReversedHorizontal(boolean isReversedHorizontal) {
            this.mIsReversedHorizontal = isReversedHorizontal;
            this.mIsReversedHorizontalSet = true;
        }

        public boolean isReversedVertical() {
            return this.mIsReversedVertical;
        }

        public void setReversedVertical(boolean isReversedVertical) {
            this.mIsReversedVertical = isReversedVertical;
        }

        public Location getLocation() {
            return this.mLocation;
        }

        public void setLocation(Location location) {
            this.mLocation = location;
        }

        public String toString() {
            return "Metadata{mIsReversedHorizontal=" + this.mIsReversedHorizontal + ", mIsReversedVertical=" + this.mIsReversedVertical + ", mLocation=" + this.mLocation + "}";
        }
    }

    public static final class Builder implements UseCaseConfig.Builder<ImageCapture, ImageCaptureConfig, Builder>, ImageOutputConfig.Builder<Builder>, IoConfig.Builder<Builder>, ImageInputConfig.Builder<Builder> {
        private final MutableOptionsBundle mMutableConfig;

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public /* bridge */ /* sintético */ Builder setCustomOrderedResolutions(List list) {
            return setCustomOrderedResolutions((List<Size>) list);
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public /* bridge */ /* sintético */ Builder setSupportedResolutions(List list) {
            return setSupportedResolutions((List<Pair<Integer, Size[]>>) list);
        }

        @Override // androidx.camera.core.internal.TargetConfig.Builder
        public /* bridge */ /* sintético */ Object setTargetClass(Class cls) {
            return setTargetClass((Class<ImageCapture>) cls);
        }

        public Builder() {
            this(MutableOptionsBundle.create());
        }

        private Builder(MutableOptionsBundle mutableConfig) {
            this.mMutableConfig = mutableConfig;
            Class<?> oldConfigClass = (Class) mutableConfig.retrieveOption(TargetConfig.OPTION_TARGET_CLASS, null);
            if (oldConfigClass != null && !oldConfigClass.equals(ImageCapture.class)) {
                throw new IllegalArgumentException("Invalid target class configuration for " + this + ": " + oldConfigClass);
            }
            setCaptureType(UseCaseConfigFactory.CaptureType.IMAGE_CAPTURE);
            setTargetClass(ImageCapture.class);
        }

        public static Builder fromConfig(Config configuration) {
            return new Builder(MutableOptionsBundle.from(configuration));
        }

        static Builder fromConfig(ImageCaptureConfig configuration) {
            return new Builder(MutableOptionsBundle.from((Config) configuration));
        }

        @Override // androidx.camera.core.ExtendableBuilder
        public MutableConfig getMutableConfig() {
            return this.mMutableConfig;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public ImageCaptureConfig getUseCaseConfig() {
            return new ImageCaptureConfig(OptionsBundle.from(this.mMutableConfig));
        }

        @Override // androidx.camera.core.ExtendableBuilder
        public ImageCapture build() {
            Integer bufferFormat = (Integer) getMutableConfig().retrieveOption(ImageCaptureConfig.OPTION_BUFFER_FORMAT, null);
            if (bufferFormat == null) {
                if (!ImageCapture.isOutputFormatRaw(getMutableConfig())) {
                    if (!ImageCapture.isOutputFormatRawJpeg(getMutableConfig())) {
                        if (ImageCapture.isOutputFormatUltraHdr(getMutableConfig())) {
                            getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_FORMAT, 4101);
                            getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_DYNAMIC_RANGE, DynamicRange.UNSPECIFIED);
                        } else {
                            getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_FORMAT, 256);
                        }
                    } else {
                        getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_FORMAT, 32);
                        getMutableConfig().insertOption(ImageInputConfig.OPTION_SECONDARY_INPUT_FORMAT, 256);
                    }
                } else {
                    getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_FORMAT, 32);
                }
            } else {
                getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_FORMAT, bufferFormat);
            }
            ImageCaptureConfig imageCaptureConfig = getUseCaseConfig();
            ImageOutputConfig.CC.validateConfig(imageCaptureConfig);
            ImageCapture imageCapture = new ImageCapture(imageCaptureConfig);
            Size targetResolution = (Size) getMutableConfig().retrieveOption(ImageCaptureConfig.OPTION_TARGET_RESOLUTION, null);
            if (targetResolution != null) {
                imageCapture.setCropAspectRatio(new Rational(targetResolution.getWidth(), targetResolution.getHeight()));
            }
            Preconditions.checkNotNull((Executor) getMutableConfig().retrieveOption(ImageCaptureConfig.OPTION_IO_EXECUTOR, CameraXExecutors.ioExecutor()), "The IO executor can't be null");
            if (getMutableConfig().containsOption(ImageCaptureConfig.OPTION_FLASH_MODE)) {
                Integer flashMode = (Integer) getMutableConfig().retrieveOption(ImageCaptureConfig.OPTION_FLASH_MODE);
                if (flashMode == null || (flashMode.intValue() != 0 && flashMode.intValue() != 1 && flashMode.intValue() != 3 && flashMode.intValue() != 2)) {
                    throw new IllegalArgumentException("The flash mode is not allowed to set: " + flashMode);
                }
                if (flashMode.intValue() == 3 && getMutableConfig().retrieveOption(ImageCaptureConfig.OPTION_SCREEN_FLASH, null) == null) {
                    throw new IllegalArgumentException(ImageCapture.ERROR_MSG_SCREEN_FLASH_NOT_SET);
                }
            }
            return imageCapture;
        }

        public Builder setCaptureMode(int captureMode) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_IMAGE_CAPTURE_MODE, Integer.valueOf(captureMode));
            return this;
        }

        public Builder setFlashMode(int flashMode) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_FLASH_MODE, Integer.valueOf(flashMode));
            return this;
        }

        public Builder setScreenFlash(ScreenFlash screenFlash) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_SCREEN_FLASH, screenFlash);
            return this;
        }

        public Builder setBufferFormat(int bufferImageFormat) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_BUFFER_FORMAT, Integer.valueOf(bufferImageFormat));
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setSupportedResolutions(List<Pair<Integer, Size[]>> resolutions) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_SUPPORTED_RESOLUTIONS, resolutions);
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setCustomOrderedResolutions(List<Size> resolutions) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_CUSTOM_ORDERED_RESOLUTIONS, resolutions);
            return this;
        }

        @Override // androidx.camera.core.internal.TargetConfig.Builder
        public Builder setTargetClass(Class<ImageCapture> targetClass) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_TARGET_CLASS, targetClass);
            if (getMutableConfig().retrieveOption(ImageCaptureConfig.OPTION_TARGET_NAME, null) == null) {
                String targetName = targetClass.getCanonicalName() + "-" + UUID.randomUUID();
                setTargetName(targetName);
            }
            return this;
        }

        @Override // androidx.camera.core.internal.TargetConfig.Builder
        public Builder setTargetName(String targetName) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_TARGET_NAME, targetName);
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        @Deprecated
        public Builder setTargetAspectRatio(int aspectRatio) {
            if (aspectRatio == -1) {
                aspectRatio = 0;
            }
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_TARGET_ASPECT_RATIO, Integer.valueOf(aspectRatio));
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setTargetRotation(int rotation) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_TARGET_ROTATION, Integer.valueOf(rotation));
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setMirrorMode(int mirrorMode) {
            throw new UnsupportedOperationException("setMirrorMode is not supported.");
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        @Deprecated
        public Builder setTargetResolution(Size resolution) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_TARGET_RESOLUTION, resolution);
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setDefaultResolution(Size resolution) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_DEFAULT_RESOLUTION, resolution);
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setMaxResolution(Size resolution) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_MAX_RESOLUTION, resolution);
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setResolutionSelector(ResolutionSelector resolutionSelector) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_RESOLUTION_SELECTOR, resolutionSelector);
            return this;
        }

        public Builder setPostviewEnabled(boolean postviewEnabled) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_POSTVIEW_ENABLED, Boolean.valueOf(postviewEnabled));
            return this;
        }

        public Builder setPostviewResolutionSelector(ResolutionSelector resolutionSelector) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_POSTVIEW_RESOLUTION_SELECTOR, resolutionSelector);
            return this;
        }

        public Builder setImageReaderProxyProvider(ImageReaderProxyProvider imageReaderProxyProvider) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_IMAGE_READER_PROXY_PROVIDER, imageReaderProxyProvider);
            return this;
        }

        public Builder setSoftwareJpegEncoderRequested(boolean requestSoftwareJpeg) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_USE_SOFTWARE_JPEG_ENCODER, Boolean.valueOf(requestSoftwareJpeg));
            return this;
        }

        public Builder setFlashType(int flashType) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_FLASH_TYPE, Integer.valueOf(flashType));
            return this;
        }

        public Builder setJpegQuality(int jpegQuality) {
            Preconditions.checkArgumentInRange(jpegQuality, 1, 100, "jpegQuality");
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_JPEG_COMPRESSION_QUALITY, Integer.valueOf(jpegQuality));
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.internal.IoConfig.Builder
        public Builder setIoExecutor(Executor executor) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_IO_EXECUTOR, executor);
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setDefaultSessionConfig(androidx.camera.core.impl.SessionConfig sessionConfig) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_DEFAULT_SESSION_CONFIG, sessionConfig);
            return this;
        }

        public Builder setOutputFormat(int outputFormat) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_OUTPUT_FORMAT, Integer.valueOf(outputFormat));
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setDefaultCaptureConfig(CaptureConfig captureConfig) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_DEFAULT_CAPTURE_CONFIG, captureConfig);
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setSessionOptionUnpacker(SessionConfig.OptionUnpacker optionUnpacker) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_SESSION_CONFIG_UNPACKER, optionUnpacker);
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setCaptureOptionUnpacker(CaptureConfig.OptionUnpacker optionUnpacker) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_CAPTURE_CONFIG_UNPACKER, optionUnpacker);
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setSurfaceOccupancyPriority(int priority) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_SURFACE_OCCUPANCY_PRIORITY, Integer.valueOf(priority));
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setZslDisabled(boolean disabled) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_ZSL_DISABLED, Boolean.valueOf(disabled));
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setHighResolutionDisabled(boolean disabled) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_HIGH_RESOLUTION_DISABLED, Boolean.valueOf(disabled));
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setCaptureType(UseCaseConfigFactory.CaptureType captureType) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_CAPTURE_TYPE, captureType);
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setStreamUseCase(StreamUseCase streamUseCase) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_STREAM_USE_CASE, streamUseCase);
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.ImageInputConfig.Builder
        public Builder setDynamicRange(DynamicRange dynamicRange) {
            getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_DYNAMIC_RANGE, dynamicRange);
            return this;
        }
    }
}
