package org.chromium.base;

import java.util.HashMap;

/* loaded from: classes17.dex */
public abstract class Flag {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static HashMap<String, Flag> sFlagsCreated = new HashMap<>();
    protected final String mFeatureName;
    protected Boolean mValue;

    protected abstract void clearInMemoryCachedValueForTesting();

    public abstract boolean isEnabled();

    protected Flag(String featureName) {
        if (sFlagsCreated.containsKey(featureName)) {
            throw new AssertionError("Duplicate flag creation for feature: " + featureName);
        }
        this.mFeatureName = featureName;
        sFlagsCreated.put(this.mFeatureName, this);
    }

    public String getFeatureName() {
        return this.mFeatureName;
    }

    public static void resetFlagsForTesting() {
        resetAllInMemoryCachedValuesForTesting();
        sFlagsCreated.clear();
    }

    public static void resetAllInMemoryCachedValuesForTesting() {
        for (Flag flag : sFlagsCreated.values()) {
            flag.clearInMemoryCachedValueForTesting();
        }
    }
}
