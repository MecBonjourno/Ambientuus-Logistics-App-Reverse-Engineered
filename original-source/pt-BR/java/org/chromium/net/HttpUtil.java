package org.chromium.net;

import org.chromium.base.annotations.JNINamespace;

@JNINamespace("net")
/* carregado de: classes17.dex */
public final class HttpUtil {

    interface Natives {
        boolean isAllowedHeader(String str, String str2);
    }

    public static boolean isAllowedHeader(String headerName, String headerValue) {
        return HttpUtilJni.get().isAllowedHeader(headerName, headerValue);
    }
}
