package org.chromium.base;

import org.chromium.base.annotations.JNINamespace;

@JNINamespace("base::android")
/* carregado de: classes17.dex */
public abstract class CpuFeatures {

    interface Natives {
        int getCoreCount();

        long getCpuFeatures();
    }

    public static int getCount() {
        return CpuFeaturesJni.get().getCoreCount();
    }

    public static long getMask() {
        return CpuFeaturesJni.get().getCpuFeatures();
    }
}
