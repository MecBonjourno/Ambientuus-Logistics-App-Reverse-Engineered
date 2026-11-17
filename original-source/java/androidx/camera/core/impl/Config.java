package androidx.camera.core.impl;

import androidx.camera.core.impl.utils.ResolutionSelectorUtil;
import androidx.camera.core.resolutionselector.ResolutionSelector;
import j$.util.Objects;
import java.util.Set;

/* loaded from: classes.dex */
public interface Config {

    public interface OptionMatcher {
        boolean onOptionMatched(Option<?> option);
    }

    public enum OptionPriority {
        ALWAYS_OVERRIDE,
        HIGH_PRIORITY_REQUIRED,
        REQUIRED,
        OPTIONAL
    }

    boolean containsOption(Option<?> option);

    void findOptions(String str, OptionMatcher optionMatcher);

    OptionPriority getOptionPriority(Option<?> option);

    Set<OptionPriority> getPriorities(Option<?> option);

    Set<Option<?>> listOptions();

    <ValueT> ValueT retrieveOption(Option<ValueT> option);

    <ValueT> ValueT retrieveOption(Option<ValueT> option, ValueT valuet);

    <ValueT> ValueT retrieveOptionWithPriority(Option<ValueT> option, OptionPriority optionPriority);

    public static abstract class Option<T> {
        public abstract String getId();

        public abstract Object getToken();

        public abstract Class<T> getValueClass();

        Option() {
        }

        public static <T> Option<T> create(String id, Class<?> valueClass) {
            return create(id, valueClass, null);
        }

        public static <T> Option<T> create(String id, Class<?> valueClass, Object token) {
            return new AutoValue_Config_Option(id, valueClass, token);
        }
    }

    /* renamed from: androidx.camera.core.impl.Config$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        public static boolean hasConflict(OptionPriority priority1, OptionPriority priority2) {
            return priority1 == OptionPriority.REQUIRED && priority2 == OptionPriority.REQUIRED;
        }

        public static Config mergeConfigs(Config extendedConfig, Config baseConfig) {
            MutableOptionsBundle mergedConfig;
            if (extendedConfig == null && baseConfig == null) {
                return OptionsBundle.emptyBundle();
            }
            if (baseConfig != null) {
                mergedConfig = MutableOptionsBundle.from(baseConfig);
            } else {
                mergedConfig = MutableOptionsBundle.create();
            }
            if (extendedConfig != null) {
                for (Option<?> opt : extendedConfig.listOptions()) {
                    mergeOptionValue(mergedConfig, baseConfig, extendedConfig, opt);
                }
            }
            return OptionsBundle.from(mergedConfig);
        }

        public static void mergeOptionValue(MutableOptionsBundle mergedConfig, Config baseConfig, Config extendedConfig, Option<?> opt) {
            if (Objects.equals(opt, ImageOutputConfig.OPTION_RESOLUTION_SELECTOR)) {
                ResolutionSelector resolutionSelectorToOverride = (ResolutionSelector) extendedConfig.retrieveOption(opt, null);
                ResolutionSelector baseResolutionSelector = (ResolutionSelector) baseConfig.retrieveOption(opt, null);
                mergedConfig.insertOption(opt, extendedConfig.getOptionPriority(opt), ResolutionSelectorUtil.overrideResolutionSelectors(baseResolutionSelector, resolutionSelectorToOverride));
                return;
            }
            mergedConfig.insertOption(opt, extendedConfig.getOptionPriority(opt), extendedConfig.retrieveOption(opt));
        }
    }
}
