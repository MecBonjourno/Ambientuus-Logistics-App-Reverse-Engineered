package androidx.camera.camera2.internal.compat.quirk;

import android.os.Build;
import androidx.camera.core.impl.Quirk;

/* carregado de: classes.dex */
public class Preview3AThreadCrashQuirk implements Quirk {
    static boolean load() {
        return "samsungexynos7870".equalsIgnoreCase(Build.HARDWARE);
    }
}
