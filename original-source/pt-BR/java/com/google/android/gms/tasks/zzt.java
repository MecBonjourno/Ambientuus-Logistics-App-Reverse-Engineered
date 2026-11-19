package com.google.android.gms.tasks;

import java.util.concurrent.Executor;

/* compiled from: com.google.android.gms:play-services-tasks@@18.4.0 */
/* carregado de: classes16.dex */
final class zzt implements Executor {
    zzt() {
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        runnable.run();
    }
}
