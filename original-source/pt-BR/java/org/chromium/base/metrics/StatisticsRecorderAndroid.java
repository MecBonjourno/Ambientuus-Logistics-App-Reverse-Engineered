package org.chromium.base.metrics;

import org.chromium.base.annotations.JNINamespace;

@JNINamespace("base::android")
/* carregado de: classes17.dex */
public final class StatisticsRecorderAndroid {

    interface Natives {
        String toJson(int i);
    }

    private StatisticsRecorderAndroid() {
    }

    public static String toJson(int verbosityLevel) {
        return StatisticsRecorderAndroidJni.get().toJson(verbosityLevel);
    }
}
