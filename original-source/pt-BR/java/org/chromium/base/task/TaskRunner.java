package org.chromium.base.task;

/* carregado de: classes17.dex */
public interface TaskRunner {
    void postDelayedTask(Runnable runnable, long j);

    void postTask(Runnable runnable);
}
