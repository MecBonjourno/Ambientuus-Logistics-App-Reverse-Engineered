package org.chromium.base.task;

import android.os.Handler;
import org.chromium.base.annotations.JNINamespace;

@JNINamespace("base")
/* carregado de: classes17.dex */
public class SingleThreadTaskRunnerImpl extends TaskRunnerImpl implements SingleThreadTaskRunner {
    static final /* sintético */ boolean $assertionsDisabled = false;
    private final Handler mHandler;

    public SingleThreadTaskRunnerImpl(Handler handler, int traits) {
        super(traits, "SingleThreadTaskRunnerImpl", 2);
        this.mHandler = handler;
    }

    @Override // org.chromium.base.task.SingleThreadTaskRunner
    public boolean belongsToCurrentThread() {
        Boolean belongs = belongsToCurrentThreadInternal();
        if (belongs != null) {
            return belongs.booleanValue();
        }
        if (this.mHandler != null) {
            return this.mHandler.getLooper().getThread() == Thread.currentThread();
        }
        throw new AssertionError();
    }

    @Override // org.chromium.base.task.TaskRunnerImpl
    protected void schedulePreNativeTask() {
        if (this.mHandler == null) {
            return;
        }
        this.mHandler.post(this.mRunPreNativeTaskClosure);
    }

    @Override // org.chromium.base.task.TaskRunnerImpl
    protected boolean schedulePreNativeDelayedTask(Runnable task, long delay) {
        if (this.mHandler == null) {
            return false;
        }
        this.mHandler.postDelayed(task, delay);
        return true;
    }
}
