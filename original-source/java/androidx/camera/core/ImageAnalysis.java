package androidx.camera.core;

import android.graphics.Matrix;
import android.graphics.Rect;
import android.util.Pair;
import android.util.Size;
import androidx.camera.core.ImageAnalysis;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.ConfigProvider;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.ImageAnalysisConfig;
import androidx.camera.core.impl.ImageInputConfig;
import androidx.camera.core.impl.ImageOutputConfig;
import androidx.camera.core.impl.ImmediateSurface;
import androidx.camera.core.impl.MutableConfig;
import androidx.camera.core.impl.MutableOptionsBundle;
import androidx.camera.core.impl.OptionsBundle;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.impl.StreamUseCase;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.internal.TargetConfig;
import androidx.camera.core.internal.ThreadConfig;
import androidx.camera.core.internal.compat.quirk.OnePixelShiftQuirk;
import androidx.camera.core.internal.utils.SizeUtil;
import androidx.camera.core.resolutionselector.AspectRatioStrategy;
import androidx.camera.core.resolutionselector.ResolutionFilter;
import androidx.camera.core.resolutionselector.ResolutionSelector;
import androidx.camera.core.resolutionselector.ResolutionStrategy;
import androidx.core.util.Preconditions;
import j$.util.Objects;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public final class ImageAnalysis extends UseCase {
    public static final int COORDINATE_SYSTEM_ORIGINAL = 0;
    public static final int COORDINATE_SYSTEM_SENSOR = 2;
    public static final int COORDINATE_SYSTEM_VIEW_REFERENCED = 1;
    private static final int DEFAULT_BACKPRESSURE_STRATEGY = 0;
    private static final int DEFAULT_IMAGE_QUEUE_DEPTH = 6;
    private static final int DEFAULT_OUTPUT_IMAGE_FORMAT = 1;
    private static final boolean DEFAULT_OUTPUT_IMAGE_ROTATION_ENABLED = false;
    private static final int NON_BLOCKING_IMAGE_DEPTH = 4;
    public static final int OUTPUT_IMAGE_FORMAT_NV21 = 3;
    public static final int OUTPUT_IMAGE_FORMAT_RGBA_8888 = 2;
    public static final int OUTPUT_IMAGE_FORMAT_YUV_420_888 = 1;
    public static final int STRATEGY_BLOCK_PRODUCER = 1;
    public static final int STRATEGY_KEEP_ONLY_LATEST = 0;
    private static final String TAG = "ImageAnalysis";
    private final Object mAnalysisLock;
    private SessionConfig.CloseableErrorListener mCloseableErrorListener;
    private DeferrableSurface mDeferrableSurface;
    ImageAnalysisAbstractAnalyzer mImageAnalysisAbstractAnalyzer;
    private Matrix mSensorToBufferTransformMatrix;
    SessionConfig.Builder mSessionConfigBuilder;
    private Analyzer mSubscribedAnalyzer;
    private Executor mSubscribedAnalyzerExecutor;
    private Rect mViewPortCropRect;
    public static final Defaults DEFAULT_CONFIG = new Defaults();
    private static final Boolean DEFAULT_ONE_PIXEL_SHIFT_ENABLED = null;

    @Retention(RetentionPolicy.SOURCE)
    public @interface BackpressureStrategy {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface OutputImageFormat {
    }

    ImageAnalysis(ImageAnalysisConfig config) {
        super(config);
        this.mAnalysisLock = new Object();
    }

    /* JADX WARN: Type inference failed for: r0v5, types: [androidx.camera.core.impl.UseCaseConfig, androidx.camera.core.impl.UseCaseConfig<?>] */
    /* JADX WARN: Type inference failed for: r2v1, types: [androidx.camera.core.impl.UseCaseConfig, androidx.camera.core.impl.UseCaseConfig<?>] */
    /* JADX WARN: Type inference failed for: r3v3, types: [androidx.camera.core.impl.UseCaseConfig] */
    /* JADX WARN: Type inference failed for: r3v5, types: [androidx.camera.core.impl.UseCaseConfig] */
    @Override // androidx.camera.core.UseCase
    protected UseCaseConfig<?> onMergeConfig(CameraInfoInternal cameraInfo, UseCaseConfig.Builder<?, ?, ?> builder) {
        Size analyzerResolution;
        synchronized (this.mAnalysisLock) {
            analyzerResolution = this.mSubscribedAnalyzer != null ? this.mSubscribedAnalyzer.getDefaultTargetResolution() : null;
        }
        if (analyzerResolution == null) {
            return builder.getUseCaseConfig();
        }
        int targetRotation = ((Integer) builder.getMutableConfig().retrieveOption(ImageOutputConfig.OPTION_TARGET_ROTATION, 0)).intValue();
        if (cameraInfo.getSensorRotationDegrees(targetRotation) % 180 == 90) {
            analyzerResolution = new Size(analyzerResolution.getHeight(), analyzerResolution.getWidth());
        }
        if (!builder.getUseCaseConfig().containsOption(ImageOutputConfig.OPTION_TARGET_RESOLUTION)) {
            builder.getMutableConfig().insertOption(ImageOutputConfig.OPTION_TARGET_RESOLUTION, analyzerResolution);
        }
        if (builder.getUseCaseConfig().containsOption(ImageOutputConfig.OPTION_RESOLUTION_SELECTOR)) {
            ResolutionSelector appResolutionSelector = (ResolutionSelector) getAppConfig().retrieveOption(ImageOutputConfig.OPTION_RESOLUTION_SELECTOR, null);
            ResolutionSelector.Builder resolutionSelectorBuilder = appResolutionSelector == null ? new ResolutionSelector.Builder() : ResolutionSelector.Builder.fromResolutionSelector(appResolutionSelector);
            if (appResolutionSelector == null || appResolutionSelector.getResolutionStrategy() == null) {
                resolutionSelectorBuilder.setResolutionStrategy(new ResolutionStrategy(analyzerResolution, 1));
            }
            if (appResolutionSelector == null) {
                final Size analyzerResolutionFinal = analyzerResolution;
                resolutionSelectorBuilder.setResolutionFilter(new ResolutionFilter() { // from class: androidx.camera.core.ImageAnalysis$$ExternalSyntheticLambda5
                    @Override // androidx.camera.core.resolutionselector.ResolutionFilter
                    public final List filter(List list, int i) {
                        return ImageAnalysis.lambda$onMergeConfig$0(analyzerResolutionFinal, list, i);
                    }
                });
            }
            builder.getMutableConfig().insertOption(ImageOutputConfig.OPTION_RESOLUTION_SELECTOR, resolutionSelectorBuilder.build());
        }
        return builder.getUseCaseConfig();
    }

    static /* synthetic */ List lambda$onMergeConfig$0(Size analyzerResolutionFinal, List supportedSizes, int rotationDegrees) {
        List<Size> resultList = new ArrayList<>(supportedSizes);
        if (resultList.contains(analyzerResolutionFinal)) {
            resultList.remove(analyzerResolutionFinal);
            resultList.add(0, analyzerResolutionFinal);
        }
        return resultList;
    }

    SessionConfig.Builder createPipeline(String cameraId, ImageAnalysisConfig config, StreamSpec streamSpec) {
        int i;
        final SafeCloseImageReaderProxy imageReaderProxy;
        final ImageAnalysisAbstractAnalyzer imageAnalysisAbstractAnalyzer;
        final SafeCloseImageReaderProxy processedImageReaderProxy;
        Threads.checkMainThread();
        Size resolution = streamSpec.getResolution();
        Executor backgroundExecutor = (Executor) Preconditions.checkNotNull(config.getBackgroundExecutor(CameraXExecutors.highPriorityExecutor()));
        if (getBackpressureStrategy() == 1) {
            i = getImageQueueDepth();
        } else {
            i = 4;
        }
        int imageQueueDepth = i;
        if (config.getImageReaderProxyProvider() != null) {
            imageReaderProxy = new SafeCloseImageReaderProxy(config.getImageReaderProxyProvider().newInstance(resolution.getWidth(), resolution.getHeight(), getImageFormat(), imageQueueDepth, 0L));
        } else {
            imageReaderProxy = new SafeCloseImageReaderProxy(ImageReaderProxys.createIsolatedReader(resolution.getWidth(), resolution.getHeight(), getImageFormat(), imageQueueDepth));
        }
        synchronized (this.mAnalysisLock) {
            try {
                recreateImageAnalysisAbstractAnalyzer();
                imageAnalysisAbstractAnalyzer = this.mImageAnalysisAbstractAnalyzer;
            } catch (Throwable th) {
                th = th;
                while (true) {
                    try {
                        throw th;
                    } catch (Throwable th2) {
                        th = th2;
                    }
                }
            }
        }
        boolean flipWH = getCamera() != null ? isFlipWH(getCamera()) : false;
        int width = flipWH ? resolution.getHeight() : resolution.getWidth();
        int height = flipWH ? resolution.getWidth() : resolution.getHeight();
        int format = getOutputImageFormat() == 2 ? 1 : 35;
        boolean isYuv2Rgb = getImageFormat() == 35 && getOutputImageFormat() == 2;
        boolean isYuv2Nv21 = getImageFormat() == 35 && getOutputImageFormat() == 3;
        boolean isYuvRotationOrPixelShift = getImageFormat() == 35 && (!(getCamera() == null || getRelativeRotation(getCamera()) == 0) || Boolean.TRUE.equals(getOnePixelShiftEnabled()));
        if (isYuv2Rgb || (isYuvRotationOrPixelShift && !isYuv2Nv21)) {
            processedImageReaderProxy = new SafeCloseImageReaderProxy(ImageReaderProxys.createIsolatedReader(width, height, format, imageReaderProxy.getMaxImages()));
        } else {
            processedImageReaderProxy = null;
        }
        if (processedImageReaderProxy != null) {
            imageAnalysisAbstractAnalyzer.setProcessedImageReaderProxy(processedImageReaderProxy);
        }
        tryUpdateRelativeRotation();
        imageReaderProxy.setOnImageAvailableListener(imageAnalysisAbstractAnalyzer, backgroundExecutor);
        SessionConfig.Builder sessionConfigBuilder = SessionConfig.Builder.createFrom(config, streamSpec.getResolution());
        if (streamSpec.getImplementationOptions() != null) {
            sessionConfigBuilder.addImplementationOptions(streamSpec.getImplementationOptions());
        }
        if (this.mDeferrableSurface != null) {
            this.mDeferrableSurface.close();
        }
        this.mDeferrableSurface = new ImmediateSurface(imageReaderProxy.getSurface(), resolution, getImageFormat());
        this.mDeferrableSurface.getTerminationFuture().addListener(new Runnable() { // from class: androidx.camera.core.ImageAnalysis$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                ImageAnalysis.lambda$createPipeline$1(SafeCloseImageReaderProxy.this, processedImageReaderProxy);
            }
        }, CameraXExecutors.mainThreadExecutor());
        sessionConfigBuilder.setSessionType(streamSpec.getSessionType());
        applyExpectedFrameRateRange(sessionConfigBuilder, streamSpec);
        sessionConfigBuilder.addSurface(this.mDeferrableSurface, streamSpec.getDynamicRange(), null, -1);
        if (this.mCloseableErrorListener != null) {
            this.mCloseableErrorListener.close();
        }
        this.mCloseableErrorListener = new SessionConfig.CloseableErrorListener(new SessionConfig.ErrorListener() { // from class: androidx.camera.core.ImageAnalysis$$ExternalSyntheticLambda3
            @Override // androidx.camera.core.impl.SessionConfig.ErrorListener
            public final void onError(androidx.camera.core.impl.SessionConfig sessionConfig, SessionConfig.SessionError sessionError) {
                ImageAnalysis.this.m147lambda$createPipeline$2$androidxcameracoreImageAnalysis(imageAnalysisAbstractAnalyzer, sessionConfig, sessionError);
            }
        });
        sessionConfigBuilder.setErrorListener(this.mCloseableErrorListener);
        return sessionConfigBuilder;
    }

    static /* synthetic */ void lambda$createPipeline$1(SafeCloseImageReaderProxy imageReaderProxy, SafeCloseImageReaderProxy processedImageReaderProxy) {
        imageReaderProxy.safeClose();
        if (processedImageReaderProxy != null) {
            processedImageReaderProxy.safeClose();
        }
    }

    /* renamed from: lambda$createPipeline$2$androidx-camera-core-ImageAnalysis, reason: not valid java name */
    /* synthetic */ void m147lambda$createPipeline$2$androidxcameracoreImageAnalysis(ImageAnalysisAbstractAnalyzer imageAnalysisAbstractAnalyzer, androidx.camera.core.impl.SessionConfig sessionConfig, SessionConfig.SessionError error) {
        List<androidx.camera.core.impl.SessionConfig> m;
        if (getCamera() == null) {
            return;
        }
        clearPipeline();
        imageAnalysisAbstractAnalyzer.clearCache();
        this.mSessionConfigBuilder = createPipeline(getCameraId(), (ImageAnalysisConfig) getCurrentConfig(), (StreamSpec) Preconditions.checkNotNull(getAttachedStreamSpec()));
        m = ImageAnalysis$$ExternalSyntheticBackport1.m(new Object[]{this.mSessionConfigBuilder.build()});
        updateSessionConfig(m);
        notifyReset();
    }

    private void recreateImageAnalysisAbstractAnalyzer() {
        synchronized (this.mAnalysisLock) {
            ImageAnalysisConfig config = (ImageAnalysisConfig) getCurrentConfig();
            if (config.getBackpressureStrategy(0) == 1) {
                this.mImageAnalysisAbstractAnalyzer = new ImageAnalysisBlockingAnalyzer();
            } else {
                this.mImageAnalysisAbstractAnalyzer = new ImageAnalysisNonBlockingAnalyzer(config.getBackgroundExecutor(CameraXExecutors.highPriorityExecutor()));
            }
            this.mImageAnalysisAbstractAnalyzer.setOutputImageFormat(getOutputImageFormat());
            this.mImageAnalysisAbstractAnalyzer.setOutputImageRotationEnabled(isOutputImageRotationEnabled());
            CameraInternal cameraInternal = getCamera();
            Boolean isOnePixelShiftEnabled = getOnePixelShiftEnabled();
            boolean isOnePixelShiftIssueDevice = false;
            if (cameraInternal != null) {
                isOnePixelShiftIssueDevice = cameraInternal.getCameraInfoInternal().getCameraQuirks().contains(OnePixelShiftQuirk.class);
            }
            this.mImageAnalysisAbstractAnalyzer.setOnePixelShiftEnabled(isOnePixelShiftEnabled == null ? isOnePixelShiftIssueDevice : isOnePixelShiftEnabled.booleanValue());
            if (cameraInternal != null) {
                this.mImageAnalysisAbstractAnalyzer.setRelativeRotation(getRelativeRotation(cameraInternal));
            }
            if (this.mViewPortCropRect != null) {
                this.mImageAnalysisAbstractAnalyzer.setViewPortCropRect(this.mViewPortCropRect);
            }
            if (this.mSensorToBufferTransformMatrix != null) {
                this.mImageAnalysisAbstractAnalyzer.setSensorToBufferTransformMatrix(this.mSensorToBufferTransformMatrix);
            }
            if (this.mSubscribedAnalyzerExecutor != null && this.mSubscribedAnalyzer != null) {
                this.mImageAnalysisAbstractAnalyzer.setAnalyzer(this.mSubscribedAnalyzerExecutor, this.mSubscribedAnalyzer);
            }
        }
    }

    void clearPipeline() {
        Threads.checkMainThread();
        if (this.mCloseableErrorListener != null) {
            this.mCloseableErrorListener.close();
            this.mCloseableErrorListener = null;
        }
        if (this.mDeferrableSurface != null) {
            this.mDeferrableSurface.close();
            this.mDeferrableSurface = null;
        }
    }

    public void clearAnalyzer() {
        synchronized (this.mAnalysisLock) {
            if (this.mImageAnalysisAbstractAnalyzer != null) {
                this.mImageAnalysisAbstractAnalyzer.setAnalyzer(null, null);
            }
            if (this.mSubscribedAnalyzer != null) {
                notifyInactive();
            }
            this.mSubscribedAnalyzerExecutor = null;
            this.mSubscribedAnalyzer = null;
        }
    }

    public int getTargetRotation() {
        return getTargetRotationInternal();
    }

    public void setTargetRotation(int rotation) {
        if (setTargetRotationInternal(rotation)) {
            tryUpdateRelativeRotation();
        }
    }

    public void setAnalyzer(Executor executor, final Analyzer analyzer) {
        synchronized (this.mAnalysisLock) {
            if (this.mImageAnalysisAbstractAnalyzer != null) {
                this.mImageAnalysisAbstractAnalyzer.setAnalyzer(executor, new Analyzer() { // from class: androidx.camera.core.ImageAnalysis$$ExternalSyntheticLambda4
                    @Override // androidx.camera.core.ImageAnalysis.Analyzer
                    public final void analyze(ImageProxy imageProxy) {
                        ImageAnalysis.Analyzer.this.analyze(imageProxy);
                    }

                    @Override // androidx.camera.core.ImageAnalysis.Analyzer
                    public /* synthetic */ Size getDefaultTargetResolution() {
                        return ImageAnalysis.Analyzer.CC.$default$getDefaultTargetResolution(this);
                    }

                    @Override // androidx.camera.core.ImageAnalysis.Analyzer
                    public /* synthetic */ int getTargetCoordinateSystem() {
                        return ImageAnalysis.Analyzer.CC.$default$getTargetCoordinateSystem(this);
                    }

                    @Override // androidx.camera.core.ImageAnalysis.Analyzer
                    public /* synthetic */ void updateTransform(Matrix matrix) {
                        ImageAnalysis.Analyzer.CC.$default$updateTransform(this, matrix);
                    }
                });
            }
            if (this.mSubscribedAnalyzer == null) {
                notifyActive();
            }
            this.mSubscribedAnalyzerExecutor = executor;
            this.mSubscribedAnalyzer = analyzer;
        }
    }

    @Override // androidx.camera.core.UseCase
    public void setViewPortCropRect(Rect viewPortCropRect) {
        super.setViewPortCropRect(viewPortCropRect);
        synchronized (this.mAnalysisLock) {
            if (this.mImageAnalysisAbstractAnalyzer != null) {
                this.mImageAnalysisAbstractAnalyzer.setViewPortCropRect(viewPortCropRect);
            }
            this.mViewPortCropRect = viewPortCropRect;
        }
    }

    @Override // androidx.camera.core.UseCase
    public void setSensorToBufferTransformMatrix(Matrix matrix) {
        super.setSensorToBufferTransformMatrix(matrix);
        synchronized (this.mAnalysisLock) {
            if (this.mImageAnalysisAbstractAnalyzer != null) {
                this.mImageAnalysisAbstractAnalyzer.setSensorToBufferTransformMatrix(matrix);
            }
            this.mSensorToBufferTransformMatrix = matrix;
        }
    }

    private boolean isFlipWH(CameraInternal cameraInternal) {
        return isOutputImageRotationEnabled() && getRelativeRotation(cameraInternal) % 180 != 0;
    }

    public int getBackpressureStrategy() {
        return ((ImageAnalysisConfig) getCurrentConfig()).getBackpressureStrategy(0);
    }

    public Executor getBackgroundExecutor() {
        return ((ImageAnalysisConfig) getCurrentConfig()).getBackgroundExecutor(null);
    }

    public int getImageQueueDepth() {
        return ((ImageAnalysisConfig) getCurrentConfig()).getImageQueueDepth(6);
    }

    public int getOutputImageFormat() {
        return ((ImageAnalysisConfig) getCurrentConfig()).getOutputImageFormat(1);
    }

    public boolean isOutputImageRotationEnabled() {
        return ((ImageAnalysisConfig) getCurrentConfig()).isOutputImageRotationEnabled(false).booleanValue();
    }

    public Boolean getOnePixelShiftEnabled() {
        return ((ImageAnalysisConfig) getCurrentConfig()).getOnePixelShiftEnabled(DEFAULT_ONE_PIXEL_SHIFT_ENABLED);
    }

    public ResolutionInfo getResolutionInfo() {
        return getResolutionInfoInternal();
    }

    public ResolutionSelector getResolutionSelector() {
        return ((ImageOutputConfig) getCurrentConfig()).getResolutionSelector(null);
    }

    public String toString() {
        return "ImageAnalysis:" + getName();
    }

    @Override // androidx.camera.core.UseCase
    public void onUnbind() {
        clearPipeline();
        synchronized (this.mAnalysisLock) {
            this.mImageAnalysisAbstractAnalyzer.detach();
            this.mImageAnalysisAbstractAnalyzer = null;
        }
    }

    /* JADX WARN: Type inference failed for: r1v2, types: [androidx.camera.core.impl.UseCaseConfig, androidx.camera.core.impl.UseCaseConfig<?>] */
    @Override // androidx.camera.core.UseCase
    public UseCaseConfig<?> getDefaultConfig(boolean applyDefaultConfig, UseCaseConfigFactory factory) {
        Config captureConfig = factory.getConfig(DEFAULT_CONFIG.getConfig().getCaptureType(), 1);
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

    @Override // androidx.camera.core.UseCase
    protected StreamSpec onSuggestedStreamSpecUpdated(StreamSpec primaryStreamSpec, StreamSpec secondaryStreamSpec) {
        List<androidx.camera.core.impl.SessionConfig> m;
        Logger.d(TAG, "onSuggestedStreamSpecUpdated: primaryStreamSpec = " + primaryStreamSpec + ", secondaryStreamSpec " + secondaryStreamSpec);
        ImageAnalysisConfig config = (ImageAnalysisConfig) getCurrentConfig();
        this.mSessionConfigBuilder = createPipeline(getCameraId(), config, primaryStreamSpec);
        m = ImageAnalysis$$ExternalSyntheticBackport1.m(new Object[]{this.mSessionConfigBuilder.build()});
        updateSessionConfig(m);
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

    private void tryUpdateRelativeRotation() {
        synchronized (this.mAnalysisLock) {
            CameraInternal cameraInternal = getCamera();
            if (cameraInternal != null) {
                this.mImageAnalysisAbstractAnalyzer.setRelativeRotation(getRelativeRotation(cameraInternal));
            }
        }
    }

    public interface Analyzer {
        void analyze(ImageProxy imageProxy);

        Size getDefaultTargetResolution();

        int getTargetCoordinateSystem();

        void updateTransform(Matrix matrix);

        /* renamed from: androidx.camera.core.ImageAnalysis$Analyzer$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            public static Size $default$getDefaultTargetResolution(Analyzer _this) {
                return null;
            }

            public static int $default$getTargetCoordinateSystem(Analyzer _this) {
                return 0;
            }

            public static void $default$updateTransform(Analyzer _this, Matrix matrix) {
            }
        }
    }

    public static final class Defaults implements ConfigProvider<ImageAnalysisConfig> {
        private static final int DEFAULT_ASPECT_RATIO = 0;
        private static final ImageAnalysisConfig DEFAULT_CONFIG;
        private static final int DEFAULT_SURFACE_OCCUPANCY_PRIORITY = 1;
        private static final Size DEFAULT_TARGET_RESOLUTION = new Size(640, 480);
        private static final DynamicRange DEFAULT_DYNAMIC_RANGE = DynamicRange.SDR;
        private static final ResolutionSelector DEFAULT_RESOLUTION_SELECTOR = new ResolutionSelector.Builder().setAspectRatioStrategy(AspectRatioStrategy.RATIO_4_3_FALLBACK_AUTO_STRATEGY).setResolutionStrategy(new ResolutionStrategy(SizeUtil.RESOLUTION_VGA, 1)).build();

        static {
            Builder builder = new Builder().setDefaultResolution(DEFAULT_TARGET_RESOLUTION).setSurfaceOccupancyPriority(1).setTargetAspectRatio(0).setResolutionSelector(DEFAULT_RESOLUTION_SELECTOR).setDynamicRange(DEFAULT_DYNAMIC_RANGE);
            DEFAULT_CONFIG = builder.getUseCaseConfig();
        }

        @Override // androidx.camera.core.impl.ConfigProvider
        public ImageAnalysisConfig getConfig() {
            return DEFAULT_CONFIG;
        }
    }

    public static final class Builder implements ImageOutputConfig.Builder<Builder>, ThreadConfig.Builder<Builder>, UseCaseConfig.Builder<ImageAnalysis, ImageAnalysisConfig, Builder>, ImageInputConfig.Builder<Builder> {
        private final MutableOptionsBundle mMutableConfig;

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public /* bridge */ /* synthetic */ Builder setCustomOrderedResolutions(List list) {
            return setCustomOrderedResolutions((List<Size>) list);
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public /* bridge */ /* synthetic */ Builder setSupportedResolutions(List list) {
            return setSupportedResolutions((List<Pair<Integer, Size[]>>) list);
        }

        @Override // androidx.camera.core.internal.TargetConfig.Builder
        public /* bridge */ /* synthetic */ Object setTargetClass(Class cls) {
            return setTargetClass((Class<ImageAnalysis>) cls);
        }

        public Builder() {
            this(MutableOptionsBundle.create());
        }

        private Builder(MutableOptionsBundle mutableConfig) {
            this.mMutableConfig = mutableConfig;
            Class<?> oldConfigClass = (Class) mutableConfig.retrieveOption(TargetConfig.OPTION_TARGET_CLASS, null);
            if (oldConfigClass != null && !oldConfigClass.equals(ImageAnalysis.class)) {
                throw new IllegalArgumentException("Invalid target class configuration for " + this + ": " + oldConfigClass);
            }
            setCaptureType(UseCaseConfigFactory.CaptureType.IMAGE_ANALYSIS);
            setTargetClass(ImageAnalysis.class);
        }

        static Builder fromConfig(Config configuration) {
            return new Builder(MutableOptionsBundle.from(configuration));
        }

        public static Builder fromConfig(ImageAnalysisConfig configuration) {
            return new Builder(MutableOptionsBundle.from((Config) configuration));
        }

        public Builder setBackpressureStrategy(int strategy) {
            getMutableConfig().insertOption(ImageAnalysisConfig.OPTION_BACKPRESSURE_STRATEGY, Integer.valueOf(strategy));
            return this;
        }

        public Builder setImageQueueDepth(int depth) {
            getMutableConfig().insertOption(ImageAnalysisConfig.OPTION_IMAGE_QUEUE_DEPTH, Integer.valueOf(depth));
            return this;
        }

        public Builder setOutputImageFormat(int outputImageFormat) {
            getMutableConfig().insertOption(ImageAnalysisConfig.OPTION_OUTPUT_IMAGE_FORMAT, Integer.valueOf(outputImageFormat));
            return this;
        }

        public Builder setOutputImageRotationEnabled(boolean outputImageRotationEnabled) {
            getMutableConfig().insertOption(ImageAnalysisConfig.OPTION_OUTPUT_IMAGE_ROTATION_ENABLED, Boolean.valueOf(outputImageRotationEnabled));
            return this;
        }

        public Builder setOnePixelShiftEnabled(boolean onePixelShiftEnabled) {
            getMutableConfig().insertOption(ImageAnalysisConfig.OPTION_ONE_PIXEL_SHIFT_ENABLED, Boolean.valueOf(onePixelShiftEnabled));
            return this;
        }

        @Override // androidx.camera.core.ExtendableBuilder
        public MutableConfig getMutableConfig() {
            return this.mMutableConfig;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public ImageAnalysisConfig getUseCaseConfig() {
            return new ImageAnalysisConfig(OptionsBundle.from(this.mMutableConfig));
        }

        @Override // androidx.camera.core.ExtendableBuilder
        public ImageAnalysis build() {
            ImageAnalysisConfig imageAnalysisConfig = getUseCaseConfig();
            ImageOutputConfig.CC.validateConfig(imageAnalysisConfig);
            return new ImageAnalysis(imageAnalysisConfig);
        }

        @Override // androidx.camera.core.internal.TargetConfig.Builder
        public Builder setTargetClass(Class<ImageAnalysis> targetClass) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_TARGET_CLASS, targetClass);
            if (getMutableConfig().retrieveOption(UseCaseConfig.OPTION_TARGET_NAME, null) == null) {
                String targetName = targetClass.getCanonicalName() + "-" + UUID.randomUUID();
                setTargetName(targetName);
            }
            return this;
        }

        @Override // androidx.camera.core.internal.TargetConfig.Builder
        public Builder setTargetName(String targetName) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_TARGET_NAME, targetName);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        @Deprecated
        public Builder setTargetAspectRatio(int aspectRatio) {
            if (aspectRatio == -1) {
                aspectRatio = 0;
            }
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_TARGET_ASPECT_RATIO, Integer.valueOf(aspectRatio));
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setTargetRotation(int rotation) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_TARGET_ROTATION, Integer.valueOf(rotation));
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setMirrorMode(int mirrorMode) {
            throw new UnsupportedOperationException("setMirrorMode is not supported.");
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        @Deprecated
        public Builder setTargetResolution(Size resolution) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_TARGET_RESOLUTION, resolution);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setDefaultResolution(Size resolution) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_DEFAULT_RESOLUTION, resolution);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setMaxResolution(Size resolution) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_MAX_RESOLUTION, resolution);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setSupportedResolutions(List<Pair<Integer, Size[]>> resolutions) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_SUPPORTED_RESOLUTIONS, resolutions);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setCustomOrderedResolutions(List<Size> resolutions) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_CUSTOM_ORDERED_RESOLUTIONS, resolutions);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setResolutionSelector(ResolutionSelector resolutionSelector) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_RESOLUTION_SELECTOR, resolutionSelector);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.internal.ThreadConfig.Builder
        public Builder setBackgroundExecutor(Executor executor) {
            getMutableConfig().insertOption(ThreadConfig.OPTION_BACKGROUND_EXECUTOR, executor);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setDefaultSessionConfig(androidx.camera.core.impl.SessionConfig sessionConfig) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_DEFAULT_SESSION_CONFIG, sessionConfig);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setDefaultCaptureConfig(CaptureConfig captureConfig) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_DEFAULT_CAPTURE_CONFIG, captureConfig);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setSessionOptionUnpacker(SessionConfig.OptionUnpacker optionUnpacker) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_SESSION_CONFIG_UNPACKER, optionUnpacker);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setCaptureOptionUnpacker(CaptureConfig.OptionUnpacker optionUnpacker) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_CAPTURE_CONFIG_UNPACKER, optionUnpacker);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setSurfaceOccupancyPriority(int priority) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_SURFACE_OCCUPANCY_PRIORITY, Integer.valueOf(priority));
            return this;
        }

        public Builder setImageReaderProxyProvider(ImageReaderProxyProvider imageReaderProxyProvider) {
            getMutableConfig().insertOption(ImageAnalysisConfig.OPTION_IMAGE_READER_PROXY_PROVIDER, imageReaderProxyProvider);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setZslDisabled(boolean disabled) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_ZSL_DISABLED, Boolean.valueOf(disabled));
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setHighResolutionDisabled(boolean disabled) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_HIGH_RESOLUTION_DISABLED, Boolean.valueOf(disabled));
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setCaptureType(UseCaseConfigFactory.CaptureType captureType) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_CAPTURE_TYPE, captureType);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setStreamUseCase(StreamUseCase streamUseCase) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_STREAM_USE_CASE, streamUseCase);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.ImageInputConfig.Builder
        public Builder setDynamicRange(DynamicRange dynamicRange) {
            if (!Objects.equals(DynamicRange.SDR, dynamicRange)) {
                throw new UnsupportedOperationException("ImageAnalysis currently only supports SDR");
            }
            getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_DYNAMIC_RANGE, dynamicRange);
            return this;
        }
    }
}
