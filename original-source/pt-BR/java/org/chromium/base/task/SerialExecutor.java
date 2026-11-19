package org.chromium.base.task;

import java.util.ArrayDeque;
import java.util.concurrent.Executor;

/* carregado de: classes17.dex */
class SerialExecutor implements Executor {
    Runnable mActive;
    final ArrayDeque<Runnable> mTasks = new ArrayDeque<>();

    SerialExecutor() {
    }

    @Override // java.util.concurrent.Executor
    public synchronized void execute(final Runnable r) {
        this.mTasks.offer(new Runnable() { // da classe: org.chromium.base.task.SerialExecutor.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    r.run();
                } finally {
                    SerialExecutor.this.scheduleNext();
                }
            }
        });
        if (this.mActive == null) {
            scheduleNext();
        }
    }

    protected synchronized void scheduleNext() {
        Runnable poll = this.mTasks.poll();
        this.mActive = poll;
        if (poll != null) {
            AsyncTask.THREAD_POOL_EXECUTOR.execute(this.mActive);
        }
    }
}
