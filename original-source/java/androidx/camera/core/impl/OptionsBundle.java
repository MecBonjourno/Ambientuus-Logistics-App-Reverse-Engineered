package androidx.camera.core.impl;

import android.util.ArrayMap;
import androidx.camera.core.impl.Config;
import j$.util.DesugarCollections;
import java.util.Collections;
import java.util.Comparator;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

/* loaded from: classes.dex */
public class OptionsBundle implements Config {
    protected final TreeMap<Config.Option<?>, Map<Config.OptionPriority, Object>> mOptions;
    protected static final Comparator<Config.Option<?>> ID_COMPARE = new Comparator() { // from class: androidx.camera.core.impl.OptionsBundle$$ExternalSyntheticLambda0
        @Override // java.util.Comparator
        public final int compare(Object obj, Object obj2) {
            int compareTo;
            compareTo = ((Config.Option) obj).getId().compareTo(((Config.Option) obj2).getId());
            return compareTo;
        }
    };
    private static final OptionsBundle EMPTY_BUNDLE = new OptionsBundle(new TreeMap(ID_COMPARE));

    OptionsBundle(TreeMap<Config.Option<?>, Map<Config.OptionPriority, Object>> options) {
        this.mOptions = options;
    }

    public static OptionsBundle from(Config otherConfig) {
        if (OptionsBundle.class.equals(otherConfig.getClass())) {
            return (OptionsBundle) otherConfig;
        }
        TreeMap<Config.Option<?>, Map<Config.OptionPriority, Object>> persistentOptions = new TreeMap<>(ID_COMPARE);
        for (Config.Option<?> opt : otherConfig.listOptions()) {
            Set<Config.OptionPriority> priorities = otherConfig.getPriorities(opt);
            Map<Config.OptionPriority, Object> valuesMap = new ArrayMap<>();
            for (Config.OptionPriority priority : priorities) {
                valuesMap.put(priority, otherConfig.retrieveOptionWithPriority(opt, priority));
            }
            persistentOptions.put(opt, valuesMap);
        }
        return new OptionsBundle(persistentOptions);
    }

    public static OptionsBundle emptyBundle() {
        return EMPTY_BUNDLE;
    }

    @Override // androidx.camera.core.impl.Config
    public Set<Config.Option<?>> listOptions() {
        return DesugarCollections.unmodifiableSet(this.mOptions.keySet());
    }

    @Override // androidx.camera.core.impl.Config
    public boolean containsOption(Config.Option<?> id) {
        return this.mOptions.containsKey(id);
    }

    @Override // androidx.camera.core.impl.Config
    public <ValueT> ValueT retrieveOption(Config.Option<ValueT> option) {
        Map<Config.OptionPriority, Object> map = this.mOptions.get(option);
        if (map == null) {
            throw new IllegalArgumentException("Option does not exist: " + option);
        }
        return (ValueT) map.get((Config.OptionPriority) Collections.min(map.keySet()));
    }

    @Override // androidx.camera.core.impl.Config
    public <ValueT> ValueT retrieveOption(Config.Option<ValueT> option, ValueT valuet) {
        Map<Config.OptionPriority, Object> map = this.mOptions.get(option);
        if (map == null) {
            return valuet;
        }
        return (ValueT) map.get((Config.OptionPriority) Collections.min(map.keySet()));
    }

    @Override // androidx.camera.core.impl.Config
    public <ValueT> ValueT retrieveOptionWithPriority(Config.Option<ValueT> option, Config.OptionPriority optionPriority) {
        Map<Config.OptionPriority, Object> map = this.mOptions.get(option);
        if (map == null) {
            throw new IllegalArgumentException("Option does not exist: " + option);
        }
        if (!map.containsKey(optionPriority)) {
            throw new IllegalArgumentException("Option does not exist: " + option + " with priority=" + optionPriority);
        }
        return (ValueT) map.get(optionPriority);
    }

    @Override // androidx.camera.core.impl.Config
    public Config.OptionPriority getOptionPriority(Config.Option<?> opt) {
        Map<Config.OptionPriority, Object> values = this.mOptions.get(opt);
        if (values == null) {
            throw new IllegalArgumentException("Option does not exist: " + opt);
        }
        Config.OptionPriority highestPrirotiy = (Config.OptionPriority) Collections.min(values.keySet());
        return highestPrirotiy;
    }

    @Override // androidx.camera.core.impl.Config
    public void findOptions(String idSearchString, Config.OptionMatcher matcher) {
        Config.Option<Void> query = Config.Option.create(idSearchString, Void.class);
        for (Map.Entry<Config.Option<?>, Map<Config.OptionPriority, Object>> entry : this.mOptions.tailMap(query).entrySet()) {
            if (entry.getKey().getId().startsWith(idSearchString)) {
                Config.Option<?> option = entry.getKey();
                if (!matcher.onOptionMatched(option)) {
                    return;
                }
            } else {
                return;
            }
        }
    }

    @Override // androidx.camera.core.impl.Config
    public Set<Config.OptionPriority> getPriorities(Config.Option<?> opt) {
        Map<Config.OptionPriority, Object> values = this.mOptions.get(opt);
        if (values == null) {
            return Collections.emptySet();
        }
        return DesugarCollections.unmodifiableSet(values.keySet());
    }
}
