package org.chromium.base;

import org.chromium.base.annotations.JNINamespace;

@JNINamespace("base::android")
/* carregado de: classes17.dex */
public class ImportantFileWriterAndroid {

    interface Natives {
        boolean writeFileAtomically(String str, byte[] bArr);
    }

    public static boolean writeFileAtomically(String fileName, byte[] data) {
        return ImportantFileWriterAndroidJni.get().writeFileAtomically(fileName, data);
    }
}
