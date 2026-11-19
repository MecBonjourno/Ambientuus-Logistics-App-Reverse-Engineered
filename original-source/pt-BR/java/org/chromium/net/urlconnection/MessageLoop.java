package org.chromium.net.urlconnection;

import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.SocketTimeoutException;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.TimeUnit;

/* carregado de: classes17.dex */
class MessageLoop implements Executor {
    static final /* sintético */ boolean $assertionsDisabled = false;
    private static final long INVALID_THREAD_ID = -1;
    private boolean mLoopFailed;
    private boolean mLoopRunning;
    private InterruptedIOException mPriorInterruptedIOException;
    private RuntimeException mPriorRuntimeException;
    private long mThreadId = -1;
    private final BlockingQueue<Runnable> mQueue = new LinkedBlockingQueue();

    MessageLoop() {
    }

    private boolean calledOnValidThread() {
        if (this.mThreadId != -1) {
            return this.mThreadId == Thread.currentThread().getId();
        }
        this.mThreadId = Thread.currentThread().getId();
        return true;
    }

    private Runnable take(boolean useTimeout, long timeoutNano) throws InterruptedIOException {
        Runnable task;
        try {
            if (!useTimeout) {
                task = this.mQueue.take();
            } else {
                task = this.mQueue.poll(timeoutNano, TimeUnit.NANOSECONDS);
            }
            if (task == null) {
                throw new SocketTimeoutException();
            }
            return task;
        } catch (InterruptedException e) {
            InterruptedIOException exception = new InterruptedIOException();
            exception.initCause(e);
            throw exception;
        }
    }

    public void loop() throws IOException {
        loop(0);
    }

    public void loop(int timeoutMilli) throws IOException {
        if (!calledOnValidThread()) {
            throw new AssertionError();
        }
        long startNano = System.nanoTime();
        long timeoutNano = TimeUnit.NANOSECONDS.convert(timeoutMilli, TimeUnit.MILLISECONDS);
        if (this.mLoopFailed) {
            if (this.mPriorInterruptedIOException != null) {
                throw this.mPriorInterruptedIOException;
            }
            throw this.mPriorRuntimeException;
        }
        if (this.mLoopRunning) {
            throw new IllegalStateException("Cannot run loop when it is already running.");
        }
        this.mLoopRunning = true;
        while (this.mLoopRunning) {
            if (timeoutMilli != 0) {
                take(true, (timeoutNano - System.nanoTime()) + startNano).run();
            } else {
                try {
                    take(false, 0L).run();
                } catch (InterruptedIOException e) {
                    this.mLoopRunning = false;
                    this.mLoopFailed = true;
                    this.mPriorInterruptedIOException = e;
                    throw e;
                } catch (RuntimeException e2) {
                    this.mLoopRunning = false;
                    this.mLoopFailed = true;
                    this.mPriorRuntimeException = e2;
                    throw e2;
                }
            }
        }
    }

    public void quit() {
        if (!calledOnValidThread()) {
            throw new AssertionError();
        }
        this.mLoopRunning = false;
    }

    @Override // java.util.concurrent.Executor
    public void execute(Runnable task) throws RejectedExecutionException {
        if (task == null) {
            throw new IllegalArgumentException();
        }
        try {
            this.mQueue.put(task);
        } catch (InterruptedException e) {
            throw new RejectedExecutionException(e);
        }
    }

    public boolean isRunning() {
        return this.mLoopRunning;
    }

    public boolean hasLoopFailed() {
        return this.mLoopFailed;
    }
}
