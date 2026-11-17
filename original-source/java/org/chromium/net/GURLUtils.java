package org.chromium.net;

import org.chromium.base.annotations.JNINamespace;

@JNINamespace("net")
/* loaded from: classes17.dex */
public final class GURLUtils {

    public interface Natives {
        String getOrigin(String str);
    }

    public static String getOrigin(String url) {
        return GURLUtilsJni.get().getOrigin(url);
    }
}
