package androidx.camera.core.impl;

import android.util.Range;
import android.util.Size;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.ImageReaderProxyProvider;
import androidx.camera.core.imagecapture.TakePictureManager;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.ImageInputConfig;
import androidx.camera.core.impl.ImageOutputConfig;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.internal.IoConfig;
import androidx.camera.core.internal.TargetConfig;
import androidx.camera.core.resolutionselector.ResolutionSelector;
import j$.util.Objects;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Executor;

/* carregado de: classes.dex */
public final class ImageCaptureConfig implements UseCaseConfig<ImageCapture>, ImageOutputConfig, IoConfig {
    private final OptionsBundle mConfig;
    public static final Config.Option<Integer> OPTION_IMAGE_CAPTURE_MODE = Config.Option.create("camerax.core.imageCapture.captureMode", Integer.TYPE);
    public static final Config.Option<Integer> OPTION_FLASH_MODE = Config.Option.create("camerax.core.imageCapture.flashMode", Integer.TYPE);
    public static final Config.Option<CaptureBundle> OPTION_CAPTURE_BUNDLE = Config.Option.create("camerax.core.imageCapture.captureBundle", CaptureBundle.class);
    public static final Config.Option<Integer> OPTION_BUFFER_FORMAT = Config.Option.create("camerax.core.imageCapture.bufferFormat", Integer.class);
    public static final Config.Option<Integer> OPTION_OUTPUT_FORMAT = Config.Option.create("camerax.core.imageCapture.outputFormat", Integer.class);
    public static final Config.Option<Integer> OPTION_MAX_CAPTURE_STAGES = Config.Option.create("camerax.core.imageCapture.maxCaptureStages", Integer.class);
    public static final Config.Option<ImageReaderProxyProvider> OPTION_IMAGE_READER_PROXY_PROVIDER = Config.Option.create("camerax.core.imageCapture.imageReaderProxyProvider", ImageReaderProxyProvider.class);
    public static final Config.Option<Boolean> OPTION_USE_SOFTWARE_JPEG_ENCODER = Config.Option.create("camerax.core.imageCapture.useSoftwareJpegEncoder", Boolean.TYPE);
    public static final Config.Option<Integer> OPTION_FLASH_TYPE = Config.Option.create("camerax.core.imageCapture.flashType", Integer.TYPE);
    public static final Config.Option<Integer> OPTION_JPEG_COMPRESSION_QUALITY = Config.Option.create("camerax.core.imageCapture.jpegCompressionQuality", Integer.TYPE);
    public static final Config.Option<ImageCapture.ScreenFlash> OPTION_SCREEN_FLASH = Config.Option.create("camerax.core.imageCapture.screenFlash", ImageCapture.ScreenFlash.class);
    public static final Config.Option<ResolutionSelector> OPTION_POSTVIEW_RESOLUTION_SELECTOR = Config.Option.create("camerax.core.useCase.postviewResolutionSelector", ResolutionSelector.class);
    public static final Config.Option<Boolean> OPTION_POSTVIEW_ENABLED = Config.Option.create("camerax.core.useCase.isPostviewEnabled", Boolean.class);

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

    public ImageCaptureConfig(OptionsBundle config) {
        this.mConfig = config;
    }

    @Override // androidx.camera.core.impl.ReadableConfig
    public Config getConfig() {
        return this.mConfig;
    }

    public boolean hasCaptureMode() {
        return containsOption(OPTION_IMAGE_CAPTURE_MODE);
    }

    public int getCaptureMode() {
        return ((Integer) retrieveOption(OPTION_IMAGE_CAPTURE_MODE)).intValue();
    }

    public int getFlashMode(int valueIfMissing) {
        return ((Integer) retrieveOption(OPTION_FLASH_MODE, Integer.valueOf(valueIfMissing))).intValue();
    }

    public int getFlashMode() {
        return ((Integer) retrieveOption(OPTION_FLASH_MODE)).intValue();
    }

    public CaptureBundle getCaptureBundle(CaptureBundle valueIfMissing) {
        return (CaptureBundle) retrieveOption(OPTION_CAPTURE_BUNDLE, valueIfMissing);
    }

    public CaptureBundle getCaptureBundle() {
        return (CaptureBundle) retrieveOption(OPTION_CAPTURE_BUNDLE);
    }

    public Integer getBufferFormat(Integer valueIfMissing) {
        return (Integer) retrieveOption(OPTION_BUFFER_FORMAT, valueIfMissing);
    }

    public Integer getBufferFormat() {
        return (Integer) retrieveOption(OPTION_BUFFER_FORMAT);
    }

    @Override // androidx.camera.core.impl.ImageInputConfig
    public int getInputFormat() {
        return ((Integer) retrieveOption(OPTION_INPUT_FORMAT)).intValue();
    }

    public int getMaxCaptureStages(int valueIfMissing) {
        return ((Integer) retrieveOption(OPTION_MAX_CAPTURE_STAGES, Integer.valueOf(valueIfMissing))).intValue();
    }

    public int getMaxCaptureStages() {
        return ((Integer) retrieveOption(OPTION_MAX_CAPTURE_STAGES)).intValue();
    }

    public ImageReaderProxyProvider getImageReaderProxyProvider() {
        return (ImageReaderProxyProvider) retrieveOption(OPTION_IMAGE_READER_PROXY_PROVIDER, null);
    }

    public boolean isSoftwareJpegEncoderRequested() {
        return ((Boolean) retrieveOption(OPTION_USE_SOFTWARE_JPEG_ENCODER, false)).booleanValue();
    }

    public int getFlashType(int valueIfMissing) {
        return ((Integer) retrieveOption(OPTION_FLASH_TYPE, Integer.valueOf(valueIfMissing))).intValue();
    }

    public int getFlashType() {
        return ((Integer) retrieveOption(OPTION_FLASH_TYPE)).intValue();
    }

    public int getJpegQuality(int valueIfMissing) {
        return ((Integer) retrieveOption(OPTION_JPEG_COMPRESSION_QUALITY, Integer.valueOf(valueIfMissing))).intValue();
    }

    public int getJpegQuality() {
        return ((Integer) retrieveOption(OPTION_JPEG_COMPRESSION_QUALITY)).intValue();
    }

    public ImageCapture.ScreenFlash getScreenFlash() {
        return (ImageCapture.ScreenFlash) retrieveOption(OPTION_SCREEN_FLASH, null);
    }

    public ResolutionSelector getPostviewResolutionSelector() {
        return (ResolutionSelector) retrieveOption(OPTION_POSTVIEW_RESOLUTION_SELECTOR, null);
    }

    public boolean isPostviewEnabled() {
        return ((Boolean) retrieveOption(OPTION_POSTVIEW_ENABLED, false)).booleanValue();
    }

    @Override // androidx.camera.core.internal.IoConfig
    public Executor getIoExecutor(Executor valueIfMissing) {
        return (Executor) retrieveOption(OPTION_IO_EXECUTOR, valueIfMissing);
    }

    @Override // androidx.camera.core.internal.IoConfig
    public Executor getIoExecutor() {
        return (Executor) retrieveOption(OPTION_IO_EXECUTOR);
    }
}
