package org.chromium.base.task;

/* carregado de: classes17.dex */
public interface TaskExecutor {
    boolean canRunTaskImmediately(int i);

    SequencedTaskRunner createSequencedTaskRunner(int i);

    SingleThreadTaskRunner createSingleThreadTaskRunner(int i);

    TaskRunner createTaskRunner(int i);

    void postDelayedTask(int i, Runnable runnable, long j);
}
