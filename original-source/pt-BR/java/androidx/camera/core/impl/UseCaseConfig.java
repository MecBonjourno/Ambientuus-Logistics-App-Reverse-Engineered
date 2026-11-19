package androidx.camera.core.impl;

import android.util.Range;
import androidx.camera.core.ExtendableBuilder;
import androidx.camera.core.UseCase;
import androidx.camera.core.imagecapture.ImageCaptureControl;
import androidx.camera.core.imagecapture.TakePictureManager;
import androidx.camera.core.imagecapture.TakePictureManagerImpl;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.internal.TargetConfig;
import j$.util.Objects;

/* carregado de: classes.dex */
public interface UseCaseConfig<T extends UseCase> extends TargetConfig<T>, ImageInputConfig {
    public static final Config.Option<SessionConfig> OPTION_DEFAULT_SESSION_CONFIG = Config.Option.create("camerax.core.useCase.defaultSessionConfig", SessionConfig.class);
    public static final Config.Option<CaptureConfig> OPTION_DEFAULT_CAPTURE_CONFIG = Config.Option.create("camerax.core.useCase.defaultCaptureConfig", CaptureConfig.class);
    public static final Config.Option<SessionConfig.OptionUnpacker> OPTION_SESSION_CONFIG_UNPACKER = Config.Option.create("camerax.core.useCase.sessionConfigUnpacker", SessionConfig.OptionUnpacker.class);
    public static final Config.Option<CaptureConfig.OptionUnpacker> OPTION_CAPTURE_CONFIG_UNPACKER = Config.Option.create("camerax.core.useCase.captureConfigUnpacker", CaptureConfig.OptionUnpacker.class);
    public static final Config.Option<Integer> OPTION_SURFACE_OCCUPANCY_PRIORITY = Config.Option.create("camerax.core.useCase.surfaceOccupancyPriority", Integer.TYPE);
    public static final Config.Option<Integer> OPTION_SESSION_TYPE = Config.Option.create("camerax.core.useCase.sessionType", Integer.TYPE);
    public static final Config.Option<Range<Integer>> OPTION_TARGET_FRAME_RATE = Config.Option.create("camerax.core.useCase.targetFrameRate", Range.class);
    public static final Config.Option<Boolean> OPTION_IS_STRICT_FRAME_RATE_REQUIRED = Config.Option.create("camerax.core.useCase.isStrictFrameRateRequired", Boolean.class);
    public static final Config.Option<Boolean> OPTION_ZSL_DISABLED = Config.Option.create("camerax.core.useCase.zslDisabled", Boolean.TYPE);
    public static final Config.Option<Boolean> OPTION_HIGH_RESOLUTION_DISABLED = Config.Option.create("camerax.core.useCase.highResolutionDisabled", Boolean.TYPE);
    public static final Config.Option<UseCaseConfigFactory.CaptureType> OPTION_CAPTURE_TYPE = Config.Option.create("camerax.core.useCase.captureType", UseCaseConfigFactory.CaptureType.class);
    public static final Config.Option<Integer> OPTION_PREVIEW_STABILIZATION_MODE = Config.Option.create("camerax.core.useCase.previewStabilizationMode", Integer.TYPE);
    public static final Config.Option<Integer> OPTION_VIDEO_STABILIZATION_MODE = Config.Option.create("camerax.core.useCase.videoStabilizationMode", Integer.TYPE);
    public static final Config.Option<TakePictureManager.Provider> OPTION_TAKE_PICTURE_MANAGER_PROVIDER = Config.Option.create("camerax.core.useCase.takePictureManagerProvider", TakePictureManager.Provider.class);
    public static final Config.Option<StreamUseCase> OPTION_STREAM_USE_CASE = Config.Option.create("camerax.core.useCase.streamUseCase", StreamUseCase.class);

    public interface Builder<T extends UseCase, C extends UseCaseConfig<T>, B> extends TargetConfig.Builder<T, B>, ExtendableBuilder<T> {
        C getUseCaseConfig();

        B setCaptureOptionUnpacker(CaptureConfig.OptionUnpacker optionUnpacker);

        B setCaptureType(UseCaseConfigFactory.CaptureType captureType);

        B setDefaultCaptureConfig(CaptureConfig captureConfig);

        B setDefaultSessionConfig(SessionConfig sessionConfig);

        B setHighResolutionDisabled(boolean z);

        B setSessionOptionUnpacker(SessionConfig.OptionUnpacker optionUnpacker);

        B setStreamUseCase(StreamUseCase streamUseCase);

        B setSurfaceOccupancyPriority(int i);

        B setZslDisabled(boolean z);
    }

    CaptureConfig.OptionUnpacker getCaptureOptionUnpacker();

    CaptureConfig.OptionUnpacker getCaptureOptionUnpacker(CaptureConfig.OptionUnpacker optionUnpacker);

    UseCaseConfigFactory.CaptureType getCaptureType();

    CaptureConfig getDefaultCaptureConfig();

    CaptureConfig getDefaultCaptureConfig(CaptureConfig captureConfig);

    SessionConfig getDefaultSessionConfig();

    SessionConfig getDefaultSessionConfig(SessionConfig sessionConfig);

    int getPreviewStabilizationMode();

    SessionConfig.OptionUnpacker getSessionOptionUnpacker();

    SessionConfig.OptionUnpacker getSessionOptionUnpacker(SessionConfig.OptionUnpacker optionUnpacker);

    int getSessionType();

    int getSessionType(int i);

    StreamUseCase getStreamUseCase();

    int getSurfaceOccupancyPriority();

    int getSurfaceOccupancyPriority(int i);

    TakePictureManager.Provider getTakePictureManagerProvider();

    Range<Integer> getTargetFrameRate();

    Range<Integer> getTargetFrameRate(Range<Integer> range);

    int getVideoStabilizationMode();

    boolean hasTargetFrameRate();

    boolean isHighResolutionDisabled(boolean z);

    boolean isStrictFrameRateRequired();

    boolean isZslDisabled(boolean z);

    /* renomeado de: androidx.camera.core.impl.UseCaseConfig$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        public static SessionConfig $default$getDefaultSessionConfig(UseCaseConfig _this, SessionConfig valueIfMissing) {
            return (SessionConfig) _this.retrieveOption(UseCaseConfig.OPTION_DEFAULT_SESSION_CONFIG, valueIfMissing);
        }

        public static SessionConfig $default$getDefaultSessionConfig(UseCaseConfig _this) {
            return (SessionConfig) _this.retrieveOption(UseCaseConfig.OPTION_DEFAULT_SESSION_CONFIG);
        }

        public static CaptureConfig $default$getDefaultCaptureConfig(UseCaseConfig _this, CaptureConfig valueIfMissing) {
            return (CaptureConfig) _this.retrieveOption(UseCaseConfig.OPTION_DEFAULT_CAPTURE_CONFIG, valueIfMissing);
        }

        public static CaptureConfig $default$getDefaultCaptureConfig(UseCaseConfig _this) {
            return (CaptureConfig) _this.retrieveOption(UseCaseConfig.OPTION_DEFAULT_CAPTURE_CONFIG);
        }

        public static SessionConfig.OptionUnpacker $default$getSessionOptionUnpacker(UseCaseConfig _this, SessionConfig.OptionUnpacker valueIfMissing) {
            return (SessionConfig.OptionUnpacker) _this.retrieveOption(UseCaseConfig.OPTION_SESSION_CONFIG_UNPACKER, valueIfMissing);
        }

        public static SessionConfig.OptionUnpacker $default$getSessionOptionUnpacker(UseCaseConfig _this) {
            return (SessionConfig.OptionUnpacker) _this.retrieveOption(UseCaseConfig.OPTION_SESSION_CONFIG_UNPACKER);
        }

        public static CaptureConfig.OptionUnpacker $default$getCaptureOptionUnpacker(UseCaseConfig _this, CaptureConfig.OptionUnpacker valueIfMissing) {
            return (CaptureConfig.OptionUnpacker) _this.retrieveOption(UseCaseConfig.OPTION_CAPTURE_CONFIG_UNPACKER, valueIfMissing);
        }

        public static CaptureConfig.OptionUnpacker $default$getCaptureOptionUnpacker(UseCaseConfig _this) {
            return (CaptureConfig.OptionUnpacker) _this.retrieveOption(UseCaseConfig.OPTION_CAPTURE_CONFIG_UNPACKER);
        }

        public static Range $default$getTargetFrameRate(UseCaseConfig _this, Range range) {
            return (Range) _this.retrieveOption(UseCaseConfig.OPTION_TARGET_FRAME_RATE, range);
        }

        public static Range $default$getTargetFrameRate(UseCaseConfig _this) {
            return (Range) _this.retrieveOption(UseCaseConfig.OPTION_TARGET_FRAME_RATE);
        }

        public static UseCaseConfigFactory.CaptureType $default$getCaptureType(UseCaseConfig _this) {
            return (UseCaseConfigFactory.CaptureType) _this.retrieveOption(UseCaseConfig.OPTION_CAPTURE_TYPE);
        }

        public static TakePictureManager.Provider $default$getTakePictureManagerProvider(final UseCaseConfig _this) {
            return (TakePictureManager.Provider) Objects.requireNonNull((TakePictureManager.Provider) _this.retrieveOption(UseCaseConfig.OPTION_TAKE_PICTURE_MANAGER_PROVIDER, new TakePictureManager.Provider() { // da classe: androidx.camera.core.impl.UseCaseConfig.1
                @Override // androidx.camera.core.imagecapture.TakePictureManager.Provider
                public TakePictureManager newInstance(ImageCaptureControl imageCaptureControl) {
                    return new TakePictureManagerImpl(imageCaptureControl);
                }
            }));
        }

        public static StreamUseCase $default$getStreamUseCase(UseCaseConfig _this) {
            return (StreamUseCase) Objects.requireNonNull((StreamUseCase) _this.retrieveOption(UseCaseConfig.OPTION_STREAM_USE_CASE, StreamUseCase.DEFAULT));
        }
    }
}
