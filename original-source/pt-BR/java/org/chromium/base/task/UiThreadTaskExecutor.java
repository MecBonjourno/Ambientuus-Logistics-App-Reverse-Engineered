package org.chromium.base.task;

import android.os.Handler;

/* carregado de: classes17.dex */
public class UiThreadTaskExecutor implements TaskExecutor {
    private static boolean sRegistered;
    private final SingleThreadTaskRunner mBestEffortTaskRunner;
    private final SingleThreadTaskRunner mUserBlockingTaskRunner;
    private final SingleThreadTaskRunner mUserVisibleTaskRunner;

    public UiThreadTaskExecutor(Handler handler) {
        this.mBestEffortTaskRunner = new SingleThreadTaskRunnerImpl(handler, 6);
        this.mUserVisibleTaskRunner = new SingleThreadTaskRunnerImpl(handler, 7);
        this.mUserBlockingTaskRunner = new SingleThreadTaskRunnerImpl(handler, 8);
    }

    @Override // org.chromium.base.task.TaskExecutor
    public TaskRunner createTaskRunner(int taskTraits) {
        return createSingleThreadTaskRunner(taskTraits);
    }

    @Override // org.chromium.base.task.TaskExecutor
    public SequencedTaskRunner createSequencedTaskRunner(int taskTraits) {
        return createSingleThreadTaskRunner(taskTraits);
    }

    @Override // org.chromium.base.task.TaskExecutor
    public SingleThreadTaskRunner createSingleThreadTaskRunner(int taskTraits) {
        if (6 == taskTraits) {
            return this.mBestEffortTaskRunner;
        }
        if (7 == taskTraits) {
            return this.mUserVisibleTaskRunner;
        }
        if (8 == taskTraits) {
            return this.mUserBlockingTaskRunner;
        }
        throw new RuntimeException();
    }

    @Override // org.chromium.base.task.TaskExecutor
    public void postDelayedTask(int taskTraits, Runnable task, long delay) {
        createSingleThreadTaskRunner(taskTraits).postDelayedTask(task, delay);
    }

    @Override // org.chromium.base.task.TaskExecutor
    public boolean canRunTaskImmediately(int traits) {
        return createSingleThreadTaskRunner(traits).belongsToCurrentThread();
    }
}
