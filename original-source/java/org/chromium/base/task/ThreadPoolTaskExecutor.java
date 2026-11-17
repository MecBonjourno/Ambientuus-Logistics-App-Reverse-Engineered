package org.chromium.base.task;

/* loaded from: classes17.dex */
class ThreadPoolTaskExecutor implements TaskExecutor {
    private static final int TRAITS_COUNT = 6;
    private final TaskRunner[] mTraitsToRunnerMap = new TaskRunner[6];

    public ThreadPoolTaskExecutor() {
        for (int i = 0; i < 6; i++) {
            this.mTraitsToRunnerMap[i] = createTaskRunner(i + 0);
        }
    }

    @Override // org.chromium.base.task.TaskExecutor
    public TaskRunner createTaskRunner(int taskTraits) {
        return new TaskRunnerImpl(taskTraits);
    }

    @Override // org.chromium.base.task.TaskExecutor
    public SequencedTaskRunner createSequencedTaskRunner(int taskTraits) {
        return new SequencedTaskRunnerImpl(taskTraits);
    }

    @Override // org.chromium.base.task.TaskExecutor
    public SingleThreadTaskRunner createSingleThreadTaskRunner(int taskTraits) {
        return new SingleThreadTaskRunnerImpl(null, taskTraits);
    }

    @Override // org.chromium.base.task.TaskExecutor
    public void postDelayedTask(int taskTraits, Runnable task, long delay) {
        int index = taskTraits + 0;
        this.mTraitsToRunnerMap[index].postDelayedTask(task, delay);
    }

    @Override // org.chromium.base.task.TaskExecutor
    public boolean canRunTaskImmediately(int traits) {
        return false;
    }
}
