package androidx.camera.camera2.internal.compat.workaround;

import androidx.camera.camera2.internal.compat.quirk.Preview3AThreadCrashQuirk;
import androidx.camera.core.impl.Quirks;

/* carregado de: classes.dex */
public class SessionResetPolicy {
    private final boolean mNeedAbortCapture;

    public SessionResetPolicy(Quirks deviceQuirks) {
        this.mNeedAbortCapture = deviceQuirks.contains(Preview3AThreadCrashQuirk.class);
    }

    public boolean needAbortCapture() {
        return this.mNeedAbortCapture;
    }
}
