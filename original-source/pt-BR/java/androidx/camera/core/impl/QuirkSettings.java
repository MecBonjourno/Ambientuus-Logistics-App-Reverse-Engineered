package androidx.camera.core.impl;

import j$.util.DesugarCollections;
import j$.util.Objects;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/* carregado de: classes.dex */
public class QuirkSettings {
    private final boolean mEnabledWhenDeviceHasQuirk;
    private final Set<Class<? extends Quirk>> mForceDisabledQuirks;
    private final Set<Class<? extends Quirk>> mForceEnabledQuirks;

    private QuirkSettings(boolean enabledWhenDeviceHasQuirk, Set<Class<? extends Quirk>> forceEnabledQuirks, Set<Class<? extends Quirk>> forceDisabledQuirks) {
        this.mEnabledWhenDeviceHasQuirk = enabledWhenDeviceHasQuirk;
        this.mForceEnabledQuirks = forceEnabledQuirks == null ? Collections.emptySet() : new HashSet<>(forceEnabledQuirks);
        this.mForceDisabledQuirks = forceDisabledQuirks == null ? Collections.emptySet() : new HashSet<>(forceDisabledQuirks);
    }

    public static QuirkSettings withDefaultBehavior() {
        return new Builder().setEnabledWhenDeviceHasQuirk(true).build();
    }

    public static QuirkSettings withAllQuirksDisabled() {
        return new Builder().setEnabledWhenDeviceHasQuirk(false).build();
    }

    public static QuirkSettings withQuirksForceEnabled(Set<Class<? extends Quirk>> quirks) {
        return new Builder().forceEnableQuirks(quirks).build();
    }

    public static QuirkSettings withQuirksForceDisabled(Set<Class<? extends Quirk>> quirks) {
        return new Builder().forceDisableQuirks(quirks).build();
    }

    public boolean isEnabledWhenDeviceHasQuirk() {
        return this.mEnabledWhenDeviceHasQuirk;
    }

    public Set<Class<? extends Quirk>> getForceEnabledQuirks() {
        return DesugarCollections.unmodifiableSet(this.mForceEnabledQuirks);
    }

    public Set<Class<? extends Quirk>> getForceDisabledQuirks() {
        return DesugarCollections.unmodifiableSet(this.mForceDisabledQuirks);
    }

    public boolean shouldEnableQuirk(Class<? extends Quirk> quirk, boolean deviceHasQuirk) {
        if (this.mForceEnabledQuirks.contains(quirk)) {
            return true;
        }
        if (this.mForceDisabledQuirks.contains(quirk)) {
            return false;
        }
        return this.mEnabledWhenDeviceHasQuirk && deviceHasQuirk;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof QuirkSettings)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        QuirkSettings other = (QuirkSettings) obj;
        return this.mEnabledWhenDeviceHasQuirk == other.mEnabledWhenDeviceHasQuirk && Objects.equals(this.mForceEnabledQuirks, other.mForceEnabledQuirks) && Objects.equals(this.mForceDisabledQuirks, other.mForceDisabledQuirks);
    }

    public int hashCode() {
        return Objects.hash(Boolean.valueOf(this.mEnabledWhenDeviceHasQuirk), this.mForceEnabledQuirks, this.mForceDisabledQuirks);
    }

    public String toString() {
        return "QuirkSettings{enabledWhenDeviceHasQuirk=" + this.mEnabledWhenDeviceHasQuirk + ", forceEnabledQuirks=" + this.mForceEnabledQuirks + ", forceDisabledQuirks=" + this.mForceDisabledQuirks + '}';
    }

    public static class Builder {
        private boolean mEnabledWhenDeviceHasQuirk = true;
        private Set<Class<? extends Quirk>> mForceDisabledQuirks;
        private Set<Class<? extends Quirk>> mForceEnabledQuirks;

        public Builder setEnabledWhenDeviceHasQuirk(boolean enabled) {
            this.mEnabledWhenDeviceHasQuirk = enabled;
            return this;
        }

        public Builder forceEnableQuirks(Set<Class<? extends Quirk>> quirks) {
            this.mForceEnabledQuirks = new HashSet(quirks);
            return this;
        }

        public Builder forceDisableQuirks(Set<Class<? extends Quirk>> quirks) {
            this.mForceDisabledQuirks = new HashSet(quirks);
            return this;
        }

        public QuirkSettings build() {
            return new QuirkSettings(this.mEnabledWhenDeviceHasQuirk, this.mForceEnabledQuirks, this.mForceDisabledQuirks);
        }
    }
}
