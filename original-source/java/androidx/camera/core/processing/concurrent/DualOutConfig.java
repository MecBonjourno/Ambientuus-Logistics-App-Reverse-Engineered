package androidx.camera.core.processing.concurrent;

import androidx.camera.core.processing.util.OutConfig;

/* loaded from: classes.dex */
public abstract class DualOutConfig {
    public abstract OutConfig getPrimaryOutConfig();

    public abstract OutConfig getSecondaryOutConfig();

    public static DualOutConfig of(OutConfig primaryOutConfig, OutConfig secondaryOutConfig) {
        return new AutoValue_DualOutConfig(primaryOutConfig, secondaryOutConfig);
    }
}
