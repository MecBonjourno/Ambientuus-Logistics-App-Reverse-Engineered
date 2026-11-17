package org.chromium.base;

import org.chromium.base.annotations.JNINamespace;

@JNINamespace("base::android")
/* loaded from: classes17.dex */
public abstract class PathService {
    public static final int DIR_MODULE = 3;

    interface Natives {
        void override(int i, String str);
    }

    private PathService() {
    }

    public static void override(int what, String path) {
        PathServiceJni.get().override(what, path);
    }
}
