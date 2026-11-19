package org.chromium.base.metrics;

import android.os.Trace;

/* carregado de: classes17.dex */
public class ScopedSysTraceEvent implements AutoCloseable {
    public static ScopedSysTraceEvent scoped(String name) {
        return new ScopedSysTraceEvent(name);
    }

    private ScopedSysTraceEvent(String name) {
        Trace.beginSection(name);
    }

    @Override // java.lang.AutoCloseable
    public void close() {
        Trace.endSection();
    }
}
