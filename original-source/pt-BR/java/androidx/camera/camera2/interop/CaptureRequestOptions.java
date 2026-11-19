package androidx.camera.camera2.interop;

import android.hardware.camera2.CaptureRequest;
import androidx.camera.camera2.impl.Camera2ImplConfig;
import androidx.camera.camera2.interop.CaptureRequestOptions;
import androidx.camera.core.ExtendableBuilder;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.MutableConfig;
import androidx.camera.core.impl.MutableOptionsBundle;
import androidx.camera.core.impl.OptionsBundle;
import androidx.camera.core.impl.ReadableConfig;
import java.util.Set;

/* carregado de: classes.dex */
public class CaptureRequestOptions implements ReadableConfig {
    private final Config mConfig;

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

    @Override // androidx.camera.core.impl.ReadableConfig, androidx.camera.core.impl.Config
    public /* sintético */ Config.OptionPriority getOptionPriority(Config.Option option) {
        Config.OptionPriority optionPriority;
        optionPriority = getConfig().getOptionPriority(option);
        return optionPriority;
    }

    @Override // androidx.camera.core.impl.ReadableConfig, androidx.camera.core.impl.Config
    public /* sintético */ Set getPriorities(Config.Option option) {
        Set priorities;
        priorities = getConfig().getPriorities(option);
        return priorities;
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

    public CaptureRequestOptions(Config config) {
        this.mConfig = config;
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    public <ValueT> ValueT getCaptureRequestOption(CaptureRequest.Key<ValueT> key) {
        return (ValueT) this.mConfig.retrieveOption(Camera2ImplConfig.createCaptureRequestOption(key), null);
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    public <ValueT> ValueT getCaptureRequestOption(CaptureRequest.Key<ValueT> key, ValueT valuet) {
        return (ValueT) this.mConfig.retrieveOption(Camera2ImplConfig.createCaptureRequestOption(key), valuet);
    }

    @Override // androidx.camera.core.impl.ReadableConfig
    public Config getConfig() {
        return this.mConfig;
    }

    public static final class Builder implements ExtendableBuilder<CaptureRequestOptions> {
        private final MutableOptionsBundle mMutableOptionsBundle = MutableOptionsBundle.create();

        public static Builder from(final Config config) {
            final Builder bundleBuilder = new Builder();
            config.findOptions(Camera2ImplConfig.CAPTURE_REQUEST_ID_STEM, new Config.OptionMatcher() { // da classe: androidx.camera.camera2.interop.CaptureRequestOptions$Builder$$ExternalSyntheticLambda0
                @Override // androidx.camera.core.impl.Config.OptionMatcher
                public final boolean onOptionMatched(Config.Option option) {
                    return CaptureRequestOptions.Builder.lambda$from$0(CaptureRequestOptions.Builder.this, config, option);
                }
            });
            return bundleBuilder;
        }

        static /* sintético */ boolean lambda$from$0(Builder bundleBuilder, Config config, Config.Option option) {
            bundleBuilder.getMutableConfig().insertOption(option, config.getOptionPriority(option), config.retrieveOption(option));
            return true;
        }

        @Override // androidx.camera.core.ExtendableBuilder
        public MutableConfig getMutableConfig() {
            return this.mMutableOptionsBundle;
        }

        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        public <ValueT> Builder setCaptureRequestOption(CaptureRequest.Key<ValueT> key, ValueT value) {
            Config.Option<Object> opt = Camera2ImplConfig.createCaptureRequestOption(key);
            this.mMutableOptionsBundle.insertOption(opt, value);
            return this;
        }

        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        public <ValueT> Builder clearCaptureRequestOption(CaptureRequest.Key<ValueT> key) {
            Config.Option<Object> opt = Camera2ImplConfig.createCaptureRequestOption(key);
            this.mMutableOptionsBundle.removeOption(opt);
            return this;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // androidx.camera.core.ExtendableBuilder
        public CaptureRequestOptions build() {
            return new CaptureRequestOptions(OptionsBundle.from(this.mMutableOptionsBundle));
        }
    }
}
