package org.chromium.net.impl;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.concurrent.Executor;
import org.chromium.net.InlineExecutionProhibitedException;

/* loaded from: classes17.dex */
public final class JavaUrlRequestUtils {

    public interface CheckedRunnable {
        void run() throws Exception;
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface State {
        public static final int AWAITING_FOLLOW_REDIRECT = 3;
        public static final int AWAITING_READ = 4;
        public static final int CANCELLED = 8;
        public static final int COMPLETE = 7;
        public static final int ERROR = 6;
        public static final int NOT_STARTED = 0;
        public static final int READING = 5;
        public static final int REDIRECT_RECEIVED = 2;
        public static final int STARTED = 1;
    }

    public static final class DirectPreventingExecutor implements Executor {
        private final Executor mDelegate;

        public DirectPreventingExecutor(Executor delegate) {
            this.mDelegate = delegate;
        }

        @Override // java.util.concurrent.Executor
        public void execute(Runnable command) {
            Thread currentThread = Thread.currentThread();
            InlineCheckingRunnable runnable = new InlineCheckingRunnable(command, currentThread);
            this.mDelegate.execute(runnable);
            if (runnable.mExecutedInline != null) {
                throw runnable.mExecutedInline;
            }
            runnable.mCallingThread = null;
        }

        private static final class InlineCheckingRunnable implements Runnable {
            private Thread mCallingThread;
            private final Runnable mCommand;
            private InlineExecutionProhibitedException mExecutedInline;

            private InlineCheckingRunnable(Runnable command, Thread callingThread) {
                this.mCommand = command;
                this.mCallingThread = callingThread;
            }

            @Override // java.lang.Runnable
            public void run() {
                if (Thread.currentThread() == this.mCallingThread) {
                    this.mExecutedInline = new InlineExecutionProhibitedException();
                } else {
                    this.mCommand.run();
                }
            }
        }
    }
}
