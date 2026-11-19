package androidx.camera.video.impl;

import android.util.Range;
import android.util.Size;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.imagecapture.TakePictureManager;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.ImageInputConfig;
import androidx.camera.core.impl.ImageOutputConfig;
import androidx.camera.core.impl.OptionsBundle;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.StreamUseCase;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.internal.TargetConfig;
import androidx.camera.core.internal.ThreadConfig;
import androidx.camera.core.resolutionselector.ResolutionSelector;
import androidx.camera.video.VideoCapture;
import androidx.camera.video.VideoOutput;
import androidx.camera.video.internal.encoder.VideoEncoderInfo;
import androidx.core.util.Preconditions;
import j$.util.Objects;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Executor;

/* carregado de: classes.dex */
public final class VideoCaptureConfig<T extends VideoOutput> implements UseCaseConfig<VideoCapture<T>>, ImageOutputConfig, ThreadConfig {
    private final OptionsBundle mConfig;
    public static final Config.Option<VideoOutput> OPTION_VIDEO_OUTPUT = Config.Option.create("camerax.video.VideoCapture.videoOutput", VideoOutput.class);
    public static final Config.Option<VideoEncoderInfo.Finder> OPTION_VIDEO_ENCODER_INFO_FINDER = Config.Option.create("camerax.video.VideoCapture.videoEncoderInfoFinder", VideoEncoderInfo.Finder.class);
    public static final Config.Option<Boolean> OPTION_FORCE_ENABLE_SURFACE_PROCESSING = Config.Option.create("camerax.video.VideoCapture.forceEnableSurfaceProcessing", Boolean.class);

    @Override // androidx.camera.core.impl.ReadableConfig, androidx.camera.core.impl.Config
    public /* sintético */ boolean containsOption(Config.Option option) {
        boolean containsOption;
        containsOption = getConfig().containsOption(option);
        return containsOption;
    }

    @Override // androidx.camera.core.impl.ReadableConfig, androidx.camera.core.impl.Config
    public /* sintético */ void findOptions(String str, Config.OptionMatcher optionMatcher) {
        getConfig().findOptions(str, optionMatcher);
    }

    @Override // androidx.camera.core.impl.ImageOutputConfig
    public /* sintético */ int getAppTargetRotation(int i) {
        int intValue;
        intValue = ((Integer) retrieveOption(ImageOutputConfig.OPTION_APP_TARGET_ROTATION, Integer.valueOf(i))).intValue();
        return intValue;
    }

    @Override // androidx.camera.core.internal.ThreadConfig
    public /* sintético */ Executor getBackgroundExecutor() {
        return ThreadConfig.CC.$default$getBackgroundExecutor(this);
    }

    @Override // androidx.camera.core.internal.ThreadConfig
    public /* sintético */ Executor getBackgroundExecutor(Executor executor) {
        return ThreadConfig.CC.$default$getBackgroundExecutor(this, executor);
    }

    @Override // androidx.camera.core.impl.UseCaseConfig
    public /* sintético */ CaptureConfig.OptionUnpacker getCaptureOptionUnpacker() {
        return UseCaseConfig.CC.$default$getCaptureOptionUnpacker(this);
    }

    @Override // androidx.camera.core.impl.UseCaseConfig
    public /* sintético */ CaptureConfig.OptionUnpacker getCaptureOptionUnpacker(CaptureConfig.OptionUnpacker optionUnpacker) {
        return UseCaseConfig.CC.$default$getCaptureOptionUnpacker(this, optionUnpacker);
    }

    @Override // androidx.camera.core.impl.UseCaseConfig
    public /* sintético */ UseCaseConfigFactory.CaptureType getCaptureType() {
        return UseCaseConfig.CC.$default$getCaptureType(this);
    }

    @Override // androidx.camera.core.impl.ImageOutputConfig
    public /* sintético */ List getCustomOrderedResolutions() {
        return ImageOutputConfig.CC.$default$getCustomOrderedResolutions(this);
    }

    @Override // androidx.camera.core.impl.ImageOutputConfig
    public /* sintético */ List getCustomOrderedResolutions(List list) {
        return ImageOutputConfig.CC.$default$getCustomOrderedResolutions(this, list);
    }

    @Override // androidx.camera.core.impl.UseCaseConfig
    public /* sintético */ CaptureConfig getDefaultCaptureConfig() {
        return UseCaseConfig.CC.$default$getDefaultCaptureConfig(this);
    }

    @Override // androidx.camera.core.impl.UseCaseConfig
    public /* sintético */ CaptureConfig getDefaultCaptureConfig(CaptureConfig captureConfig) {
        return UseCaseConfig.CC.$default$getDefaultCaptureConfig(this, captureConfig);
    }

    @Override // androidx.camera.core.impl.ImageOutputConfig
    public /* sintético */ Size getDefaultResolution() {
        return ImageOutputConfig.CC.$default$getDefaultResolution(this);
    }

    @Override // androidx.camera.core.impl.ImageOutputConfig
    public /* sintético */ Size getDefaultResolution(Size size) {
        return ImageOutputConfig.CC.$default$getDefaultResolution(this, size);
    }

    @Override // androidx.camera.core.impl.UseCaseConfig
    public /* sintético */ SessionConfig getDefaultSessionConfig() {
        return UseCaseConfig.CC.$default$getDefaultSessionConfig(this);
    }

    @Override // androidx.camera.core.impl.UseCaseConfig
    public /* sintético */ SessionConfig getDefaultSessionConfig(SessionConfig sessionConfig) {
        return UseCaseConfig.CC.$default$getDefaultSessionConfig(this, sessionConfig);
    }

    @Override // androidx.camera.core.impl.ImageInputConfig
    public /* sintético */ DynamicRange getDynamicRange() {
        return ImageInputConfig.CC.$default$getDynamicRange(this);
    }

    @Override // androidx.camera.core.impl.ImageOutputConfig
    public /* sintético */ Size getMaxResolution() {
        return ImageOutputConfig.CC.$default$getMaxResolution(this);
    }

    @Override // androidx.camera.core.impl.ImageOutputConfig
    public /* sintético */ Size getMaxResolution(Size size) {
        return ImageOutputConfig.CC.$default$getMaxResolution(this, size);
    }

    @Override // androidx.camera.core.impl.ImageOutputConfig
    public /* sintético */ int getMirrorMode(int i) {
        int intValue;
        intValue = ((Integer) retrieveOption(ImageOutputConfig.OPTION_MIRROR_MODE, Integer.valueOf(i))).intValue();
        return intValue;
    }

    @Override // androidx.camera.core.impl.ReadableConfig, androidx.camera.core.impl.Config
    public /* sintético */ Config.OptionPriority getOptionPriority(Config.Option option) {
        Config.OptionPriority optionPriority;
        optionPriority = getConfig().getOptionPriority(option);
        return optionPriority;
    }

    @Override // androidx.camera.core.impl.UseCaseConfig
    public /* sintético */ int getPreviewStabilizationMode() {
        int intValue;
        intValue = ((Integer) retrieveOption(UseCaseConfig.OPTION_PREVIEW_STABILIZATION_MODE, 0)).intValue();
        return intValue;
    }

    @Override // androidx.camera.core.impl.ReadableConfig, androidx.camera.core.impl.Config
    public /* sintético */ Set getPriorities(Config.Option option) {
        Set priorities;
        priorities = getConfig().getPriorities(option);
        return priorities;
    }

    @Override // androidx.camera.core.impl.ImageOutputConfig
    public /* sintético */ ResolutionSelector getResolutionSelector() {
        return ImageOutputConfig.CC.$default$getResolutionSelector(this);
    }

    @Override // androidx.camera.core.impl.ImageOutputConfig
    public /* sintético */ ResolutionSelector getResolutionSelector(ResolutionSelector resolutionSelector) {
        return ImageOutputConfig.CC.$default$getResolutionSelector(this, resolutionSelector);
    }

    @Override // androidx.camera.core.impl.ImageInputConfig
    public /* sintético */ int getSecondaryInputFormat() {
        int intValue;
        intValue = ((Integer) retrieveOption(ImageInputConfig.OPTION_SECONDARY_INPUT_FORMAT, 0)).intValue();
        return intValue;
    }

    @Override // androidx.camera.core.impl.UseCaseConfig
    public /* sintético */ SessionConfig.OptionUnpacker getSessionOptionUnpacker() {
        return UseCaseConfig.CC.$default$getSessionOptionUnpacker(this);
    }

    @Override // androidx.camera.core.impl.UseCaseConfig
    public /* sintético */ SessionConfig.OptionUnpacker getSessionOptionUnpacker(SessionConfig.OptionUnpacker optionUnpacker) {
        return UseCaseConfig.CC.$default$getSessionOptionUnpacker(this, optionUnpacker);
    }

    @Override // androidx.camera.core.impl.UseCaseConfig
    public /* sintético */ int getSessionType() {
        int intValue;
        intValue = ((Integer) retrieveOption(UseCaseConfig.OPTION_SESSION_TYPE)).intValue();
        return intValue;
    }

    @Override // androidx.camera.core.impl.UseCaseConfig
    public /* sintético */ int getSessionType(int i) {
        int intValue;
        intValue = ((Integer) retrieveOption(UseCaseConfig.OPTION_SESSION_TYPE, Integer.valueOf(i))).intValue();
        return intValue;
    }

    @Override // androidx.camera.core.impl.UseCaseConfig
    public /* sintético */ StreamUseCase getStreamUseCase() {
        return UseCaseConfig.CC.$default$getStreamUseCase(this);
    }

    @Override // androidx.camera.core.impl.ImageOutputConfig
    public /* sintético */ List getSupportedResolutions() {
        return ImageOutputConfig.CC.$default$getSupportedResolutions(this);
    }

    @Override // androidx.camera.core.impl.ImageOutputConfig
    public /* sintético */ List getSupportedResolutions(List list) {
        return ImageOutputConfig.CC.$default$getSupportedResolutions(this, list);
    }

    @Override // androidx.camera.core.impl.UseCaseConfig
    public /* sintético */ int getSurfaceOccupancyPriority() {
        int intValue;
        intValue = ((Integer) retrieveOption(UseCaseConfig.OPTION_SURFACE_OCCUPANCY_PRIORITY)).intValue();
        return intValue;
    }

    @Override // androidx.camera.core.impl.UseCaseConfig
    public /* sintético */ int getSurfaceOccupancyPriority(int i) {
        int intValue;
        intValue = ((Integer) retrieveOption(UseCaseConfig.OPTION_SURFACE_OCCUPANCY_PRIORITY, Integer.valueOf(i))).intValue();
        return intValue;
    }

    @Override // androidx.camera.core.impl.UseCaseConfig
    public /* sintético */ TakePictureManager.Provider getTakePictureManagerProvider() {
        return UseCaseConfig.CC.$default$getTakePictureManagerProvider(this);
    }

    @Override // androidx.camera.core.impl.ImageOutputConfig
    public /* sintético */ int getTargetAspectRatio() {
        int intValue;
        intValue = ((Integer) retrieveOption(ImageOutputConfig.OPTION_TARGET_ASPECT_RATIO)).intValue();
        return intValue;
    }

    @Override // androidx.camera.core.internal.TargetConfig
    public /* sintético */ Class getTargetClass() {
        return TargetConfig.CC.$default$getTargetClass(this);
    }

    @Override // androidx.camera.core.internal.TargetConfig
    public /* sintético */ Class getTargetClass(Class cls) {
        return TargetConfig.CC.$default$getTargetClass(this, cls);
    }

    @Override // androidx.camera.core.impl.UseCaseConfig
    public /* sintético */ Range getTargetFrameRate() {
        return UseCaseConfig.CC.$default$getTargetFrameRate(this);
    }

    @Override // androidx.camera.core.impl.UseCaseConfig
    public /* sintético */ Range getTargetFrameRate(Range range) {
        return UseCaseConfig.CC.$default$getTargetFrameRate(this, range);
    }

    @Override // androidx.camera.core.internal.TargetConfig
    public /* sintético */ String getTargetName() {
        return TargetConfig.CC.$default$getTargetName(this);
    }

    @Override // androidx.camera.core.internal.TargetConfig
    public /* sintético */ String getTargetName(String str) {
        return TargetConfig.CC.$default$getTargetName(this, str);
    }

    @Override // androidx.camera.core.impl.ImageOutputConfig
    public /* sintético */ Size getTargetResolution() {
        return ImageOutputConfig.CC.$default$getTargetResolution(this);
    }

    @Override // androidx.camera.core.impl.ImageOutputConfig
    public /* sintético */ Size getTargetResolution(Size size) {
        return ImageOutputConfig.CC.$default$getTargetResolution(this, size);
    }

    @Override // androidx.camera.core.impl.ImageOutputConfig
    public /* sintético */ int getTargetRotation() {
        int intValue;
        intValue = ((Integer) retrieveOption(ImageOutputConfig.OPTION_TARGET_ROTATION)).intValue();
        return intValue;
    }

    @Override // androidx.camera.core.impl.ImageOutputConfig
    public /* sintético */ int getTargetRotation(int i) {
        int intValue;
        intValue = ((Integer) retrieveOption(ImageOutputConfig.OPTION_TARGET_ROTATION, Integer.valueOf(i))).intValue();
        return intValue;
    }

    @Override // androidx.camera.core.impl.UseCaseConfig
    public /* sintético */ int getVideoStabilizationMode() {
        int intValue;
        intValue = ((Integer) retrieveOption(UseCaseConfig.OPTION_VIDEO_STABILIZATION_MODE, 0)).intValue();
        return intValue;
    }

    @Override // androidx.camera.core.impl.ImageInputConfig
    public /* sintético */ boolean hasDynamicRange() {
        boolean containsOption;
        containsOption = containsOption(ImageInputConfig.OPTION_INPUT_DYNAMIC_RANGE);
        return containsOption;
    }

    @Override // androidx.camera.core.impl.ImageOutputConfig
    public /* sintético */ boolean hasTargetAspectRatio() {
        boolean containsOption;
        containsOption = containsOption(ImageOutputConfig.OPTION_TARGET_ASPECT_RATIO);
        return containsOption;
    }

    @Override // androidx.camera.core.impl.UseCaseConfig
    public /* sintético */ boolean hasTargetFrameRate() {
        boolean containsOption;
        containsOption = containsOption(UseCaseConfig.OPTION_TARGET_FRAME_RATE);
        return containsOption;
    }

    @Override // androidx.camera.core.impl.UseCaseConfig
    public /* sintético */ boolean isHighResolutionDisabled(boolean z) {
        boolean booleanValue;
        booleanValue = ((Boolean) retrieveOption(UseCaseConfig.OPTION_HIGH_RESOLUTION_DISABLED, Boolean.valueOf(z))).booleanValue();
        return booleanValue;
    }

    @Override // androidx.camera.core.impl.UseCaseConfig
    public /* sintético */ boolean isStrictFrameRateRequired() {
        boolean booleanValue;
        booleanValue = ((Boolean) Objects.requireNonNull((Boolean) retrieveOption(UseCaseConfig.OPTION_IS_STRICT_FRAME_RATE_REQUIRED, false))).booleanValue();
        return booleanValue;
    }

    @Override // androidx.camera.core.impl.UseCaseConfig
    public /* sintético */ boolean isZslDisabled(boolean z) {
        boolean booleanValue;
        booleanValue = ((Boolean) retrieveOption(UseCaseConfig.OPTION_ZSL_DISABLED, Boolean.valueOf(z))).booleanValue();
        return booleanValue;
    }

    @Override // androidx.camera.core.impl.ReadableConfig, androidx.camera.core.impl.Config
    public /* sintético */ Set listOptions() {
        Set listOptions;
        listOptions = getConfig().listOptions();
        return listOptions;
    }

    @Override // androidx.camera.core.impl.ReadableConfig, androidx.camera.core.impl.Config
    public /* sintético */ Object retrieveOption(Config.Option option) {
        Object retrieveOption;
        retrieveOption = getConfig().retrieveOption(option);
        return retrieveOption;
    }

    @Override // androidx.camera.core.impl.ReadableConfig, androidx.camera.core.impl.Config
    public /* sintético */ Object retrieveOption(Config.Option option, Object obj) {
        Object retrieveOption;
        retrieveOption = getConfig().retrieveOption(option, obj);
        return retrieveOption;
    }

    @Override // androidx.camera.core.impl.ReadableConfig, androidx.camera.core.impl.Config
    public /* sintético */ Object retrieveOptionWithPriority(Config.Option option, Config.OptionPriority optionPriority) {
        Object retrieveOptionWithPriority;
        retrieveOptionWithPriority = getConfig().retrieveOptionWithPriority(option, optionPriority);
        return retrieveOptionWithPriority;
    }

    public VideoCaptureConfig(OptionsBundle config) {
        Preconditions.checkArgument(config.containsOption(OPTION_VIDEO_OUTPUT));
        this.mConfig = config;
    }

    public T getVideoOutput() {
        return (T) Objects.requireNonNull((VideoOutput) retrieveOption(OPTION_VIDEO_OUTPUT));
    }

    public VideoEncoderInfo.Finder getVideoEncoderInfoFinder() {
        return (VideoEncoderInfo.Finder) Objects.requireNonNull((VideoEncoderInfo.Finder) retrieveOption(OPTION_VIDEO_ENCODER_INFO_FINDER));
    }

    public boolean isSurfaceProcessingForceEnabled() {
        return ((Boolean) Objects.requireNonNull((Boolean) retrieveOption(OPTION_FORCE_ENABLE_SURFACE_PROCESSING, false))).booleanValue();
    }

    @Override // androidx.camera.core.impl.ImageInputConfig
    public int getInputFormat() {
        return 34;
    }

    @Override // androidx.camera.core.impl.ReadableConfig
    public Config getConfig() {
        return this.mConfig;
    }
}
