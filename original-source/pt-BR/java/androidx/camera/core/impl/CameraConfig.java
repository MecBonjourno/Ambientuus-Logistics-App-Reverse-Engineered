package androidx.camera.core.impl;

import androidx.camera.core.impl.CameraConfig;
import androidx.camera.core.impl.Config;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.List;

/* carregado de: classes.dex */
public interface CameraConfig extends ReadableConfig {
    public static final int REQUIRED_RULE_COEXISTING_PREVIEW_AND_IMAGE_CAPTURE = 1;
    public static final int REQUIRED_RULE_NONE = 0;
    public static final Config.Option<UseCaseConfigFactory> OPTION_USECASE_CONFIG_FACTORY = Config.Option.create("camerax.core.camera.useCaseConfigFactory", UseCaseConfigFactory.class);
    public static final Config.Option<Identifier> OPTION_COMPATIBILITY_ID = Config.Option.create("camerax.core.camera.compatibilityId", Identifier.class);
    public static final Config.Option<Integer> OPTION_USE_CASE_COMBINATION_REQUIRED_RULE = Config.Option.create("camerax.core.camera.useCaseCombinationRequiredRule", Integer.class);
    public static final Config.Option<SessionProcessor> OPTION_SESSION_PROCESSOR = Config.Option.create("camerax.core.camera.SessionProcessor", SessionProcessor.class);
    public static final Config.Option<Boolean> OPTION_ZSL_DISABLED = Config.Option.create("camerax.core.camera.isZslDisabled", Boolean.class);
    public static final Config.Option<Boolean> OPTION_POSTVIEW_SUPPORTED = Config.Option.create("camerax.core.camera.isPostviewSupported", Boolean.class);
    public static final Config.Option<PostviewFormatSelector> OPTION_POSTVIEW_FORMAT_SELECTOR = Config.Option.create("camerax.core.camera.PostviewFormatSelector", PostviewFormatSelector.class);
    public static final Config.Option<Boolean> OPTION_CAPTURE_PROCESS_PROGRESS_SUPPORTED = Config.Option.create("camerax.core.camera.isCaptureProcessProgressSupported", Boolean.class);
    public static final PostviewFormatSelector DEFAULT_POSTVIEW_FORMAT_SELECTOR = new PostviewFormatSelector() { // da classe: androidx.camera.core.impl.CameraConfig$$ExternalSyntheticLambda0
        @Override // androidx.camera.core.impl.CameraConfig.PostviewFormatSelector
        public final int select(int i, List list) {
            return CameraConfig.CC.lambda$static$0(i, list);
        }
    };

    public interface Builder<B> {
        B setCaptureProcessProgressSupported(boolean z);

        B setCompatibilityId(Identifier identifier);

        B setPostviewFormatSelector(PostviewFormatSelector postviewFormatSelector);

        B setPostviewSupported(boolean z);

        B setSessionProcessor(SessionProcessor sessionProcessor);

        B setUseCaseCombinationRequiredRule(int i);

        B setUseCaseConfigFactory(UseCaseConfigFactory useCaseConfigFactory);

        B setZslDisabled(boolean z);
    }

    public interface PostviewFormatSelector {
        int select(int i, List<Integer> list);
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface RequiredRule {
    }

    Identifier getCompatibilityId();

    PostviewFormatSelector getPostviewFormatSelector();

    SessionProcessor getSessionProcessor();

    SessionProcessor getSessionProcessor(SessionProcessor sessionProcessor);

    int getUseCaseCombinationRequiredRule();

    UseCaseConfigFactory getUseCaseConfigFactory();

    boolean isCaptureProcessProgressSupported();

    boolean isPostviewSupported();

    /* renomeado de: androidx.camera.core.impl.CameraConfig$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        static {
            Config.Option<UseCaseConfigFactory> option = CameraConfig.OPTION_USECASE_CONFIG_FACTORY;
        }

        public static /* sintético */ int lambda$static$0(int stillImageFormat, List supportedPostviewFormats) {
            if (supportedPostviewFormats.contains(35)) {
                return 35;
            }
            if (supportedPostviewFormats.contains(256)) {
                return 256;
            }
            if (supportedPostviewFormats.contains(4101)) {
                return 4101;
            }
            return 0;
        }

        public static UseCaseConfigFactory $default$getUseCaseConfigFactory(CameraConfig _this) {
            return (UseCaseConfigFactory) _this.retrieveOption(CameraConfig.OPTION_USECASE_CONFIG_FACTORY, UseCaseConfigFactory.EMPTY_INSTANCE);
        }

        public static SessionProcessor $default$getSessionProcessor(CameraConfig _this, SessionProcessor valueIfMissing) {
            return (SessionProcessor) _this.retrieveOption(CameraConfig.OPTION_SESSION_PROCESSOR, valueIfMissing);
        }

        public static PostviewFormatSelector $default$getPostviewFormatSelector(CameraConfig _this) {
            return (PostviewFormatSelector) _this.retrieveOption(CameraConfig.OPTION_POSTVIEW_FORMAT_SELECTOR, CameraConfig.DEFAULT_POSTVIEW_FORMAT_SELECTOR);
        }

        public static SessionProcessor $default$getSessionProcessor(CameraConfig _this) {
            return (SessionProcessor) _this.retrieveOption(CameraConfig.OPTION_SESSION_PROCESSOR);
        }
    }
}
