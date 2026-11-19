package org.chromium.base.task;

import android.util.Pair;
import java.util.Iterator;
import java.util.LinkedList;
import org.chromium.base.TraceEvent;

/* carregado de: classes17.dex */
public class ChainedTasks {
    static final /* sintético */ boolean $assertionsDisabled = false;
    private volatile boolean mCanceled;
    private boolean mFinalized;
    private final LinkedList<Pair<Integer, Runnable>> mTasks = new LinkedList<>();
    private int mIterationIdForTesting = PostTask.sTestIterationForTesting;
    private final Runnable mRunAndPost = new Runnable() { // da classe: org.chromium.base.task.ChainedTasks.1
        @Override // java.lang.Runnable
        public void run() {
            if (ChainedTasks.this.mIterationIdForTesting != PostTask.sTestIterationForTesting) {
                ChainedTasks.this.cancel();
            }
            if (ChainedTasks.this.mCanceled) {
                return;
            }
            Pair<Integer, Runnable> pair = (Pair) ChainedTasks.this.mTasks.pop();
            TraceEvent e = TraceEvent.scoped("ChainedTask.run: " + ((Runnable) pair.second).getClass().getName());
            try {
                ((Runnable) pair.second).run();
                if (e != null) {
                    e.close();
                }
                if (!ChainedTasks.this.mTasks.isEmpty()) {
                    PostTask.postTask(((Integer) ((Pair) ChainedTasks.this.mTasks.peek()).first).intValue(), this);
                }
            } catch (Throwable th) {
                if (e != null) {
                    try {
                        e.close();
                    } catch (Throwable th2) {
                        th.addSuppressed(th2);
                    }
                }
                throw th;
            }
        }
    };

    public void add(int traits, Runnable task) {
        if (this.mIterationIdForTesting != PostTask.sTestIterationForTesting) {
            throw new AssertionError();
        }
        synchronized (this.mTasks) {
            if (this.mFinalized) {
                throw new AssertionError("Must not call add() after start()");
            }
            this.mTasks.add(new Pair<>(Integer.valueOf(traits), task));
        }
    }

    public void cancel() {
        synchronized (this.mTasks) {
            this.mFinalized = true;
            this.mCanceled = true;
        }
    }

    public void start(boolean coalesceTasks) {
        synchronized (this.mTasks) {
            if (this.mFinalized) {
                throw new AssertionError("Cannot call start() several times");
            }
            this.mFinalized = true;
        }
        if (this.mTasks.isEmpty()) {
            return;
        }
        if (coalesceTasks) {
            int traits = ((Integer) this.mTasks.peek().first).intValue();
            PostTask.runOrPostTask(traits, new Runnable() { // da classe: org.chromium.base.task.ChainedTasks$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    ChainedTasks.this.m2522lambda$start$0$orgchromiumbasetaskChainedTasks();
                }
            });
        } else {
            PostTask.postTask(((Integer) this.mTasks.peek().first).intValue(), this.mRunAndPost);
        }
    }

    /* renomeado de: lambda$start$0$org-chromium-base-task-ChainedTasks, motivo: nome Java inválido */
    /* sintético */ void m2522lambda$start$0$orgchromiumbasetaskChainedTasks() {
        Iterator<Pair<Integer, Runnable>> it = this.mTasks.iterator();
        while (it.hasNext()) {
            Pair<Integer, Runnable> pair = it.next();
            if (!PostTask.canRunTaskImmediately(((Integer) pair.first).intValue())) {
                throw new AssertionError();
            }
            ((Runnable) pair.second).run();
            if (this.mCanceled) {
                return;
            }
        }
    }
}
