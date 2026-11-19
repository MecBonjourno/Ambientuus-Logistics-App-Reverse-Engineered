package org.chromium.base;

import org.chromium.base.annotations.JNINamespace;

@JNINamespace("base::android")
/* carregado de: classes17.dex */
public class EventLog {
    public static void writeEvent(int tag, int value) {
        android.util.EventLog.writeEvent(tag, value);
    }
}
