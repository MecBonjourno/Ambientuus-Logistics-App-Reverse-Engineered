package org.chromium.base.task;

import android.os.Binder;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.concurrent.Callable;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.FutureTask;
import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicBoolean;
import org.chromium.base.Log;
import org.chromium.base.ThreadUtils;
import org.chromium.base.TraceEvent;
import org.chromium.base.metrics.RecordHistogram;

/* carregado de: classes17.dex */
public abstract class AsyncTask<Result> {
    private static final String GET_STATUS_UMA_HISTOGRAM = "Android.Jank.AsyncTaskGetOnUiThreadStatus";
    private static final String TAG = "AsyncTask";
    public static final Executor THREAD_POOL_EXECUTOR = new Executor() { // da classe: org.chromium.base.task.AsyncTask$$ExternalSyntheticLambda1
        @Override // java.util.concurrent.Executor
        public final void execute(Runnable runnable) {
            PostTask.postTask(1, runnable);
        }
    };
    public static final Executor SERIAL_EXECUTOR = new SerialExecutor();
    private static final StealRunnableHandler STEAL_RUNNABLE_HANDLER = new StealRunnableHandler();
    private volatile int mStatus = 0;
    private final AtomicBoolean mCancelled = new AtomicBoolean();
    private final AtomicBoolean mTaskInvoked = new AtomicBoolean();
    private int mIterationIdForTesting = PostTask.sTestIterationForTesting;
    private final Callable<Result> mWorker = new Callable<Result>() { // da classe: org.chromium.base.task.AsyncTask.1
        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        @Override // java.util.concurrent.Callable
        public Result call() throws Exception {
            AsyncTask.this.mTaskInvoked.set(true);
            Result result = null;
            try {
                result = AsyncTask.this.doInBackground();
                Binder.flushPendingCommands();
                return result;
            } finally {
            }
        }
    };
    private final AsyncTask<Result>.NamedFutureTask mFuture = new NamedFutureTask(this.mWorker);

    @Retention(RetentionPolicy.SOURCE)
    public @interface Status {
        public static final int FINISHED = 2;
        public static final int NUM_ENTRIES = 3;
        public static final int PENDING = 0;
        public static final int RUNNING = 1;
    }

    protected abstract Result doInBackground();

    protected abstract void onPostExecute(Result result);

    private static class StealRunnableHandler implements RejectedExecutionHandler {
        private StealRunnableHandler() {
        }

        @Override // java.util.concurrent.RejectedExecutionHandler
        public void rejectedExecution(Runnable r, ThreadPoolExecutor executor) {
            AsyncTask.THREAD_POOL_EXECUTOR.execute(r);
        }
    }

    public static void takeOverAndroidThreadPool() {
        ThreadPoolExecutor exec = (ThreadPoolExecutor) android.os.AsyncTask.THREAD_POOL_EXECUTOR;
        exec.setRejectedExecutionHandler(STEAL_RUNNABLE_HANDLER);
        exec.shutdown();
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public void postResultIfNotInvoked(Result result) {
        boolean wasTaskInvoked = this.mTaskInvoked.get();
        if (!wasTaskInvoked) {
            postResult(result);
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public void postResult(final Result result) {
        if (this instanceof BackgroundOnlyAsyncTask) {
            this.mStatus = 2;
        } else if (this.mIterationIdForTesting == PostTask.sTestIterationForTesting) {
            ThreadUtils.postOnUiThread(new Runnable() { // da classe: org.chromium.base.task.AsyncTask$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    AsyncTask.this.m2518lambda$postResult$1$orgchromiumbasetaskAsyncTask(result);
                }
            });
        }
    }

    public final int getStatus() {
        return this.mStatus;
    }

    public final int getUmaStatus() {
        if (this.mStatus != 1 || this.mTaskInvoked.get()) {
            return this.mStatus;
        }
        return 0;
    }

    protected void onPreExecute() {
    }

    protected void onCancelled(Result result) {
        onCancelled();
    }

    protected void onCancelled() {
    }

    public final boolean isCancelled() {
        return this.mCancelled.get();
    }

    public final boolean cancel(boolean mayInterruptIfRunning) {
        this.mCancelled.set(true);
        return this.mFuture.cancel(mayInterruptIfRunning);
    }

    public final Result get() throws InterruptedException, ExecutionException {
        int status = getUmaStatus();
        if (status != 2 && ThreadUtils.runningOnUiThread()) {
            RecordHistogram.recordEnumeratedHistogram(GET_STATUS_UMA_HISTOGRAM, status, 3);
            StackTraceElement[] stackTrace = new Exception().getStackTrace();
            String caller = "";
            if (stackTrace.length > 1) {
                caller = stackTrace[1].getClassName() + "." + stackTrace[1].getMethodName() + ".";
            }
            TraceEvent e = TraceEvent.scoped(caller + "AsyncTask.get");
            try {
                Result r = this.mFuture.get();
                if (e != null) {
                    e.close();
                    return r;
                }
                return r;
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
        return this.mFuture.get();
    }

    public final Result get(long timeout, TimeUnit unit) throws InterruptedException, ExecutionException, TimeoutException {
        int status = getUmaStatus();
        if (status != 2 && ThreadUtils.runningOnUiThread()) {
            RecordHistogram.recordEnumeratedHistogram(GET_STATUS_UMA_HISTOGRAM, status, 3);
            StackTraceElement[] stackTrace = new Exception().getStackTrace();
            String caller = "";
            if (stackTrace.length > 1) {
                caller = stackTrace[1].getClassName() + "." + stackTrace[1].getMethodName() + ".";
            }
            TraceEvent e = TraceEvent.scoped(caller + "AsyncTask.get");
            try {
                Result r = this.mFuture.get(timeout, unit);
                if (e != null) {
                    e.close();
                    return r;
                }
                return r;
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
        return this.mFuture.get(timeout, unit);
    }

    private void executionPreamble() {
        if (this.mStatus != 0) {
            switch (this.mStatus) {
                case 1:
                    throw new IllegalStateException("Cannot execute task: the task is already running.");
                case 2:
                    throw new IllegalStateException("Cannot execute task: the task has already been executed (a task can be executed only once)");
            }
        }
        this.mStatus = 1;
        onPreExecute();
    }

    public final AsyncTask<Result> executeOnExecutor(Executor exec) {
        executionPreamble();
        exec.execute(this.mFuture);
        return this;
    }

    public final AsyncTask<Result> executeOnTaskRunner(TaskRunner taskRunner) {
        executionPreamble();
        taskRunner.postTask(this.mFuture);
        return this;
    }

    public final AsyncTask<Result> executeWithTaskTraits(int taskTraits) {
        executionPreamble();
        PostTask.postTask(taskTraits, this.mFuture);
        return this;
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    /* renomeado de: finish, motivo: mesclado com método bridge [métodos inline] */
    public void m2518lambda$postResult$1$orgchromiumbasetaskAsyncTask(Result result) {
        if (isCancelled()) {
            onCancelled(result);
        } else {
            onPostExecute(result);
        }
        this.mStatus = 2;
    }

    class NamedFutureTask extends FutureTask<Result> {
        NamedFutureTask(Callable<Result> c) {
            super(c);
        }

        Class getBlamedClass() {
            return AsyncTask.this.getClass();
        }

        @Override // java.util.concurrent.FutureTask, java.util.concurrent.RunnableFuture, java.lang.Runnable
        public void run() {
            try {
                TraceEvent e = TraceEvent.scoped("AsyncTask.run: " + AsyncTask.this.mFuture.getBlamedClass().getName());
                try {
                    super.run();
                    if (e != null) {
                        e.close();
                    }
                } finally {
                }
            } finally {
                Thread.interrupted();
            }
        }

        @Override // java.util.concurrent.FutureTask
        protected void done() {
            try {
                AsyncTask.this.postResultIfNotInvoked(get());
            } catch (InterruptedException e) {
                Log.w(AsyncTask.TAG, e.toString());
            } catch (CancellationException e2) {
                AsyncTask.this.postResultIfNotInvoked(null);
            } catch (ExecutionException e3) {
                throw new RuntimeException("An error occurred while executing doInBackground()", e3.getCause());
            }
        }
    }
}
