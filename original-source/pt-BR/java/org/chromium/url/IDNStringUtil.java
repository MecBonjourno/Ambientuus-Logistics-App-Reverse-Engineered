package org.chromium.url;

import java.net.IDN;
import org.chromium.base.annotations.JNINamespace;

@JNINamespace("url::android")
/* carregado de: classes17.dex */
public class IDNStringUtil {
    private static String idnToASCII(String src) {
        try {
            return IDN.toASCII(src, 2);
        } catch (Exception e) {
            return null;
        }
    }
}
