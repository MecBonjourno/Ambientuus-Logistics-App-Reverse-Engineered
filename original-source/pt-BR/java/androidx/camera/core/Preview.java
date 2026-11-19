package androidx.camera.core;

import android.graphics.Rect;
import android.os.Build;
import android.util.Pair;
import android.util.Range;
import android.util.Size;
import androidx.camera.core.Preview;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.ConfigProvider;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.ImageInputConfig;
import androidx.camera.core.impl.ImageOutputConfig;
import androidx.camera.core.impl.MutableConfig;
import androidx.camera.core.impl.MutableOptionsBundle;
import androidx.camera.core.impl.OptionsBundle;
import androidx.camera.core.impl.PreviewConfig;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.impl.StreamUseCase;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.impl.capability.PreviewCapabilitiesImpl;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.internal.TargetConfig;
import androidx.camera.core.internal.ThreadConfig;
import androidx.camera.core.processing.SurfaceEdge;
import androidx.camera.core.processing.SurfaceProcessorNode;
import androidx.camera.core.processing.util.OutConfig;
import androidx.camera.core.resolutionselector.AspectRatioStrategy;
import androidx.camera.core.resolutionselector.ResolutionSelector;
import androidx.camera.core.resolutionselector.ResolutionStrategy;
import androidx.core.util.Preconditions;
import j$.util.Objects;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.Executor;

/* carregado de: classes.dex */
public final class Preview extends UseCase {
    public static final Defaults DEFAULT_CONFIG = new Defaults();
    private static final Executor DEFAULT_SURFACE_PROVIDER_EXECUTOR = CameraXExecutors.mainThreadExecutor();
    private static final String TAG = "Preview";
    private SurfaceEdge mCameraEdge;
    private SessionConfig.CloseableErrorListener mCloseableErrorListener;
    SurfaceRequest mCurrentSurfaceRequest;
    private SurfaceProcessorNode mNode;
    SessionConfig.Builder mSessionConfigBuilder;
    private DeferrableSurface mSessionDeferrableSurface;
    private SurfaceProvider mSurfaceProvider;
    private Executor mSurfaceProviderExecutor;

    public interface SurfaceProvider {
        void onSurfaceRequested(SurfaceRequest surfaceRequest);
    }

    Preview(PreviewConfig config) {
        super(config);
        this.mSurfaceProviderExecutor = DEFAULT_SURFACE_PROVIDER_EXECUTOR;
    }

    private SessionConfig.Builder createPipeline(PreviewConfig config, StreamSpec streamSpec) {
        Threads.checkMainThread();
        final CameraInternal camera = (CameraInternal) Objects.requireNonNull(getCamera());
        clearPipeline();
        Preconditions.checkState(this.mCameraEdge == null);
        this.mCameraEdge = new SurfaceEdge(1, 34, streamSpec, getSensorToBufferTransformMatrix(), camera.getHasTransform(), (Rect) Objects.requireNonNull(getCropRect(streamSpec.getResolution())), getRelativeRotation(camera, isMirroringRequired(camera)), getAppTargetRotation(), shouldMirror(camera));
        CameraEffect effect = getEffect();
        if (effect != null) {
            this.mNode = new SurfaceProcessorNode(camera, effect.createSurfaceProcessorInternal());
            this.mCameraEdge.addOnInvalidatedListener(new Runnable() { // da classe: androidx.camera.core.Preview$$ExternalSyntheticLambda2
                @Override // java.lang.Runnable
                public final void run() {
                    Preview.this.notifyReset();
                }
            });
            OutConfig outConfig = OutConfig.of(this.mCameraEdge);
            SurfaceProcessorNode.In nodeInput = SurfaceProcessorNode.In.of(this.mCameraEdge, Collections.singletonList(outConfig));
            SurfaceProcessorNode.Out nodeOutput = this.mNode.transform(nodeInput);
            SurfaceEdge appEdge = (SurfaceEdge) Objects.requireNonNull(nodeOutput.get(outConfig));
            appEdge.addOnInvalidatedListener(new Runnable() { // da classe: androidx.camera.core.Preview$$ExternalSyntheticLambda3
                @Override // java.lang.Runnable
                public final void run() {
                    Preview.this.m158lambda$createPipeline$0$androidxcameracorePreview(camera);
                }
            });
            this.mCurrentSurfaceRequest = appEdge.createSurfaceRequest(camera);
            this.mSessionDeferrableSurface = this.mCameraEdge.getDeferrableSurface();
        } else {
            this.mCameraEdge.addOnInvalidatedListener(new Runnable() { // da classe: androidx.camera.core.Preview$$ExternalSyntheticLambda2
                @Override // java.lang.Runnable
                public final void run() {
                    Preview.this.notifyReset();
                }
            });
            this.mCurrentSurfaceRequest = this.mCameraEdge.createSurfaceRequest(camera);
            this.mSessionDeferrableSurface = this.mCurrentSurfaceRequest.getDeferrableSurface();
        }
        if (this.mSurfaceProvider != null) {
            sendSurfaceRequest();
        }
        SessionConfig.Builder sessionConfigBuilder = SessionConfig.Builder.createFrom(config, streamSpec.getResolution());
        sessionConfigBuilder.setSessionType(streamSpec.getSessionType());
        applyExpectedFrameRateRange(sessionConfigBuilder, streamSpec);
        sessionConfigBuilder.setPreviewStabilization(config.getPreviewStabilizationMode());
        if (streamSpec.getImplementationOptions() != null) {
            sessionConfigBuilder.addImplementationOptions(streamSpec.getImplementationOptions());
        }
        addCameraSurfaceAndErrorListener(sessionConfigBuilder, streamSpec);
        return sessionConfigBuilder;
    }

    /* renomeado de: lambda$createPipeline$0$androidx-camera-core-Preview, motivo: nome Java inválido */
    /* sintético */ void m158lambda$createPipeline$0$androidxcameracorePreview(CameraInternal camera) {
        onAppEdgeInvalidated(this.mCameraEdge, camera);
    }

    private void onAppEdgeInvalidated(SurfaceEdge cameraEdge, CameraInternal camera) {
        Threads.checkMainThread();
        if (camera == getCamera()) {
            cameraEdge.invalidate();
        }
    }

    private boolean shouldMirror(CameraInternal camera) {
        return camera.getHasTransform() && isMirroringRequired(camera);
    }

    private void clearPipeline() {
        if (this.mCloseableErrorListener != null) {
            this.mCloseableErrorListener.close();
            this.mCloseableErrorListener = null;
        }
        DeferrableSurface cameraSurface = this.mSessionDeferrableSurface;
        if (cameraSurface != null) {
            cameraSurface.close();
            this.mSessionDeferrableSurface = null;
        }
        SurfaceProcessorNode node = this.mNode;
        if (node != null) {
            node.release();
            this.mNode = null;
        }
        SurfaceEdge cameraEdge = this.mCameraEdge;
        if (cameraEdge != null) {
            cameraEdge.close();
            this.mCameraEdge = null;
        }
        if (this.mCurrentSurfaceRequest != null) {
            this.mCurrentSurfaceRequest.clearTransformationInfoListener();
        }
        this.mCurrentSurfaceRequest = null;
    }

    private void addCameraSurfaceAndErrorListener(SessionConfig.Builder sessionConfigBuilder, StreamSpec streamSpec) {
        if (this.mSurfaceProvider != null) {
            sessionConfigBuilder.addSurface(this.mSessionDeferrableSurface, streamSpec.getDynamicRange(), getPhysicalCameraId(), getMirrorModeInternal());
        }
        if (this.mCloseableErrorListener != null) {
            this.mCloseableErrorListener.close();
        }
        this.mCloseableErrorListener = new SessionConfig.CloseableErrorListener(new SessionConfig.ErrorListener() { // da classe: androidx.camera.core.Preview$$ExternalSyntheticLambda4
            @Override // androidx.camera.core.impl.SessionConfig.ErrorListener
            public final void onError(androidx.camera.core.impl.SessionConfig sessionConfig, SessionConfig.SessionError sessionError) {
                Preview.this.m157xaf51708c(sessionConfig, sessionError);
            }
        });
        sessionConfigBuilder.setErrorListener(this.mCloseableErrorListener);
    }

    /* renomeado de: lambda$addCameraSurfaceAndErrorListener$1$androidx-camera-core-Preview, motivo: nome Java inválido */
    /* sintético */ void m157xaf51708c(androidx.camera.core.impl.SessionConfig sessionConfig, SessionConfig.SessionError error) {
        if (getCamera() == null) {
            return;
        }
        updateConfigAndOutput((PreviewConfig) getCurrentConfig(), getAttachedStreamSpec());
        notifyReset();
    }

    public void setTargetRotation(int targetRotation) {
        if (setTargetRotationInternal(targetRotation)) {
            sendTransformationInfoIfReady();
        }
    }

    private void sendTransformationInfoIfReady() {
        CameraInternal cameraInternal = getCamera();
        SurfaceEdge cameraEdge = this.mCameraEdge;
        if (cameraInternal != null && cameraEdge != null) {
            cameraEdge.updateTransformation(getRelativeRotation(cameraInternal, isMirroringRequired(cameraInternal)), getAppTargetRotation());
        }
    }

    private Rect getCropRect(Size surfaceResolution) {
        if (getViewPortCropRect() != null) {
            return getViewPortCropRect();
        }
        if (surfaceResolution != null) {
            return new Rect(0, 0, surfaceResolution.getWidth(), surfaceResolution.getHeight());
        }
        return null;
    }

    public void setSurfaceProvider(Executor executor, SurfaceProvider surfaceProvider) {
        Threads.checkMainThread();
        if (surfaceProvider == null) {
            this.mSurfaceProvider = null;
            notifyInactive();
            return;
        }
        this.mSurfaceProvider = surfaceProvider;
        this.mSurfaceProviderExecutor = executor;
        if (getAttachedSurfaceResolution() != null) {
            updateConfigAndOutput((PreviewConfig) getCurrentConfig(), getAttachedStreamSpec());
            notifyReset();
        }
        notifyActive();
    }

    public SurfaceProvider getSurfaceProvider() {
        Threads.checkMainThread();
        return this.mSurfaceProvider;
    }

    private void sendSurfaceRequest() {
        sendTransformationInfoIfReady();
        final SurfaceProvider surfaceProvider = (SurfaceProvider) Preconditions.checkNotNull(this.mSurfaceProvider);
        final SurfaceRequest surfaceRequest = (SurfaceRequest) Preconditions.checkNotNull(this.mCurrentSurfaceRequest);
        this.mSurfaceProviderExecutor.execute(new Runnable() { // da classe: androidx.camera.core.Preview$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                Preview.SurfaceProvider.this.onSurfaceRequested(surfaceRequest);
            }
        });
    }

    public void setSurfaceProvider(SurfaceProvider surfaceProvider) {
        setSurfaceProvider(DEFAULT_SURFACE_PROVIDER_EXECUTOR, surfaceProvider);
    }

    private void updateConfigAndOutput(PreviewConfig config, StreamSpec streamSpec) {
        List<androidx.camera.core.impl.SessionConfig> m;
        this.mSessionConfigBuilder = createPipeline(config, streamSpec);
        m = ImageAnalysis$$ExternalSyntheticBackport1.m(new Object[]{this.mSessionConfigBuilder.build()});
        updateSessionConfig(m);
    }

    public int getTargetRotation() {
        return getTargetRotationInternal();
    }

    public ResolutionInfo getResolutionInfo() {
        return getResolutionInfoInternal();
    }

    public ResolutionSelector getResolutionSelector() {
        return ((ImageOutputConfig) getCurrentConfig()).getResolutionSelector(null);
    }

    public String toString() {
        return "Preview:" + getName();
    }

    /* JADX WARN: falha na inferência de tipo para: r1v2, types: [androidx.camera.core.impl.UseCaseConfig, androidx.camera.core.impl.UseCaseConfig<?>] */
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

    /* JADX WARN: falha na inferência de tipo para: r0v1, types: [androidx.camera.core.impl.UseCaseConfig, androidx.camera.core.impl.UseCaseConfig<?>] */
    @Override // androidx.camera.core.UseCase
    protected UseCaseConfig<?> onMergeConfig(CameraInfoInternal cameraInfo, UseCaseConfig.Builder<?, ?, ?> builder) {
        builder.getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_FORMAT, 34);
        return builder.getUseCaseConfig();
    }

    @Override // androidx.camera.core.UseCase
    public UseCaseConfig.Builder<?, ?, ?> getUseCaseConfigBuilder(Config config) {
        return Builder.fromConfig(config);
    }

    @Override // androidx.camera.core.UseCase
    public void onUnbind() {
        clearPipeline();
    }

    @Override // androidx.camera.core.UseCase
    protected StreamSpec onSuggestedStreamSpecUpdated(StreamSpec primaryStreamSpec, StreamSpec secondaryStreamSpec) {
        Logger.d(TAG, "onSuggestedStreamSpecUpdated: primaryStreamSpec = " + primaryStreamSpec + ", secondaryStreamSpec " + secondaryStreamSpec);
        updateConfigAndOutput((PreviewConfig) getCurrentConfig(), primaryStreamSpec);
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

    @Override // androidx.camera.core.UseCase
    public void setViewPortCropRect(Rect viewPortCropRect) {
        super.setViewPortCropRect(viewPortCropRect);
        sendTransformationInfoIfReady();
    }

    public SurfaceEdge getCameraEdge() {
        return (SurfaceEdge) Objects.requireNonNull(this.mCameraEdge);
    }

    @Override // androidx.camera.core.UseCase
    public Set<Integer> getSupportedEffectTargets() {
        Set<Integer> targets = new HashSet<>();
        targets.add(1);
        return targets;
    }

    public Range<Integer> getTargetFrameRate() {
        return getTargetFrameRateInternal();
    }

    public DynamicRange getDynamicRange() {
        return getCurrentConfig().hasDynamicRange() ? getCurrentConfig().getDynamicRange() : Defaults.DEFAULT_DYNAMIC_RANGE;
    }

    public static PreviewCapabilities getPreviewCapabilities(CameraInfo cameraInfo) {
        return PreviewCapabilitiesImpl.from(cameraInfo);
    }

    public boolean isPreviewStabilizationEnabled() {
        return getCurrentConfig().getPreviewStabilizationMode() == 2;
    }

    public static final class Defaults implements ConfigProvider<PreviewConfig> {
        private static final int DEFAULT_ASPECT_RATIO = 0;
        private static final PreviewConfig DEFAULT_CONFIG;
        private static final int DEFAULT_MIRROR_MODE = 2;
        private static final int DEFAULT_SURFACE_OCCUPANCY_PRIORITY = 2;
        private static final ResolutionSelector DEFAULT_RESOLUTION_SELECTOR = new ResolutionSelector.Builder().setAspectRatioStrategy(AspectRatioStrategy.RATIO_4_3_FALLBACK_AUTO_STRATEGY).setResolutionStrategy(ResolutionStrategy.HIGHEST_AVAILABLE_STRATEGY).build();
        private static final DynamicRange DEFAULT_DYNAMIC_RANGE = DynamicRange.UNSPECIFIED;

        static {
            Builder builder = new Builder().setSurfaceOccupancyPriority(2).setTargetAspectRatio(0).setResolutionSelector(DEFAULT_RESOLUTION_SELECTOR).setHighResolutionDisabled(true).setDynamicRange(DEFAULT_DYNAMIC_RANGE);
            DEFAULT_CONFIG = builder.getUseCaseConfig();
        }

        @Override // androidx.camera.core.impl.ConfigProvider
        public PreviewConfig getConfig() {
            return DEFAULT_CONFIG;
        }
    }

    public static final class Builder implements UseCaseConfig.Builder<Preview, PreviewConfig, Builder>, ImageOutputConfig.Builder<Builder>, ImageInputConfig.Builder<Builder>, ThreadConfig.Builder<Builder> {
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
            return setTargetClass((Class<Preview>) cls);
        }

        public Builder() {
            this(MutableOptionsBundle.create());
        }

        private Builder(MutableOptionsBundle mutableConfig) {
            this.mMutableConfig = mutableConfig;
            Class<?> oldConfigClass = (Class) mutableConfig.retrieveOption(TargetConfig.OPTION_TARGET_CLASS, null);
            if (oldConfigClass != null && !oldConfigClass.equals(Preview.class)) {
                throw new IllegalArgumentException("Invalid target class configuration for " + this + ": " + oldConfigClass);
            }
            setCaptureType(UseCaseConfigFactory.CaptureType.PREVIEW);
            setTargetClass(Preview.class);
            if (((Integer) mutableConfig.retrieveOption(ImageOutputConfig.OPTION_MIRROR_MODE, -1)).intValue() == -1) {
                mutableConfig.insertOption(ImageOutputConfig.OPTION_MIRROR_MODE, 2);
            }
        }

        static Builder fromConfig(Config configuration) {
            return new Builder(MutableOptionsBundle.from(configuration));
        }

        public static Builder fromConfig(PreviewConfig configuration) {
            return new Builder(MutableOptionsBundle.from((Config) configuration));
        }

        @Override // androidx.camera.core.ExtendableBuilder
        public MutableConfig getMutableConfig() {
            return this.mMutableConfig;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public PreviewConfig getUseCaseConfig() {
            return new PreviewConfig(OptionsBundle.from(this.mMutableConfig));
        }

        @Override // androidx.camera.core.ExtendableBuilder
        public Preview build() {
            PreviewConfig previewConfig = getUseCaseConfig();
            ImageOutputConfig.CC.validateConfig(previewConfig);
            return new Preview(previewConfig);
        }

        @Override // androidx.camera.core.internal.TargetConfig.Builder
        public Builder setTargetClass(Class<Preview> targetClass) {
            getMutableConfig().insertOption(PreviewConfig.OPTION_TARGET_CLASS, targetClass);
            if (getMutableConfig().retrieveOption(PreviewConfig.OPTION_TARGET_NAME, null) == null) {
                String targetName = targetClass.getCanonicalName() + "-" + UUID.randomUUID();
                setTargetName(targetName);
            }
            return this;
        }

        @Override // androidx.camera.core.internal.TargetConfig.Builder
        public Builder setTargetName(String targetName) {
            getMutableConfig().insertOption(PreviewConfig.OPTION_TARGET_NAME, targetName);
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        @Deprecated
        public Builder setTargetAspectRatio(int aspectRatio) {
            if (aspectRatio == -1) {
                aspectRatio = 0;
            }
            getMutableConfig().insertOption(PreviewConfig.OPTION_TARGET_ASPECT_RATIO, Integer.valueOf(aspectRatio));
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setTargetRotation(int rotation) {
            getMutableConfig().insertOption(PreviewConfig.OPTION_TARGET_ROTATION, Integer.valueOf(rotation));
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_APP_TARGET_ROTATION, Integer.valueOf(rotation));
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setMirrorMode(int mirrorMode) {
            if (Build.VERSION.SDK_INT >= 33) {
                getMutableConfig().insertOption(ImageOutputConfig.OPTION_MIRROR_MODE, Integer.valueOf(mirrorMode));
            }
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        @Deprecated
        public Builder setTargetResolution(Size resolution) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_TARGET_RESOLUTION, resolution);
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setDefaultResolution(Size resolution) {
            getMutableConfig().insertOption(PreviewConfig.OPTION_DEFAULT_RESOLUTION, resolution);
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setMaxResolution(Size resolution) {
            getMutableConfig().insertOption(PreviewConfig.OPTION_MAX_RESOLUTION, resolution);
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setSupportedResolutions(List<Pair<Integer, Size[]>> resolutions) {
            getMutableConfig().insertOption(PreviewConfig.OPTION_SUPPORTED_RESOLUTIONS, resolutions);
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setCustomOrderedResolutions(List<Size> resolutions) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_CUSTOM_ORDERED_RESOLUTIONS, resolutions);
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setResolutionSelector(ResolutionSelector resolutionSelector) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_RESOLUTION_SELECTOR, resolutionSelector);
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.ImageInputConfig.Builder
        public Builder setDynamicRange(DynamicRange dynamicRange) {
            getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_DYNAMIC_RANGE, dynamicRange);
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.internal.ThreadConfig.Builder
        public Builder setBackgroundExecutor(Executor executor) {
            getMutableConfig().insertOption(PreviewConfig.OPTION_BACKGROUND_EXECUTOR, executor);
            return this;
        }

        public Builder setTargetFrameRate(Range<Integer> targetFrameRate) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_TARGET_FRAME_RATE, targetFrameRate);
            return this;
        }

        public Builder setPreviewStabilizationEnabled(boolean enabled) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_PREVIEW_STABILIZATION_MODE, Integer.valueOf(enabled ? 2 : 1));
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setDefaultSessionConfig(androidx.camera.core.impl.SessionConfig sessionConfig) {
            getMutableConfig().insertOption(PreviewConfig.OPTION_DEFAULT_SESSION_CONFIG, sessionConfig);
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setDefaultCaptureConfig(CaptureConfig captureConfig) {
            getMutableConfig().insertOption(PreviewConfig.OPTION_DEFAULT_CAPTURE_CONFIG, captureConfig);
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setSessionOptionUnpacker(SessionConfig.OptionUnpacker optionUnpacker) {
            getMutableConfig().insertOption(PreviewConfig.OPTION_SESSION_CONFIG_UNPACKER, optionUnpacker);
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setCaptureOptionUnpacker(CaptureConfig.OptionUnpacker optionUnpacker) {
            getMutableConfig().insertOption(PreviewConfig.OPTION_CAPTURE_CONFIG_UNPACKER, optionUnpacker);
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setSurfaceOccupancyPriority(int priority) {
            getMutableConfig().insertOption(PreviewConfig.OPTION_SURFACE_OCCUPANCY_PRIORITY, Integer.valueOf(priority));
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
    }
}
