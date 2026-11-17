package org.chromium.base;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import org.chromium.base.Callback;

/* loaded from: classes17.dex */
public final class CallbackController {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private ArrayList<WeakReference<Cancelable>> mCancelables = new ArrayList<>();
    private final ReentrantLock mReentrantLock = new ReentrantLock(true);

    private interface Cancelable {
        void cancel();
    }

    private class CancelableCallback<T> implements Cancelable, Callback<T> {
        private Callback<T> mCallback;

        @Override // org.chromium.base.Callback
        public /* synthetic */ Runnable bind(Object obj) {
            return Callback.CC.$default$bind(this, obj);
        }

        private CancelableCallback(Callback<T> callback) {
            this.mCallback = callback;
        }

        @Override // org.chromium.base.CallbackController.Cancelable
        public void cancel() {
            this.mCallback = null;
        }

        @Override // org.chromium.base.Callback
        public void onResult(T result) {
            AutoCloseableLock acl = AutoCloseableLock.lock(CallbackController.this.mReentrantLock);
            try {
                if (this.mCallback != null) {
                    this.mCallback.onResult(result);
                }
                if (acl != null) {
                    acl.close();
                }
            } catch (Throwable th) {
                if (acl != null) {
                    try {
                        acl.close();
                    } catch (Throwable th2) {
                        th.addSuppressed(th2);
                    }
                }
                throw th;
            }
        }
    }

    private class CancelableRunnable implements Cancelable, Runnable {
        private Runnable mRunnable;

        private CancelableRunnable(Runnable runnable) {
            this.mRunnable = runnable;
        }

        @Override // org.chromium.base.CallbackController.Cancelable
        public void cancel() {
            this.mRunnable = null;
        }

        @Override // java.lang.Runnable
        public void run() {
            AutoCloseableLock acl = AutoCloseableLock.lock(CallbackController.this.mReentrantLock);
            try {
                if (this.mRunnable != null) {
                    this.mRunnable.run();
                }
                if (acl != null) {
                    acl.close();
                }
            } catch (Throwable th) {
                if (acl != null) {
                    try {
                        acl.close();
                    } catch (Throwable th2) {
                        th.addSuppressed(th2);
                    }
                }
                throw th;
            }
        }
    }

    private static class AutoCloseableLock implements AutoCloseable {
        private boolean mIsLocked;
        private final Lock mLock;

        private AutoCloseableLock(Lock lock, boolean isLocked) {
            this.mLock = lock;
            this.mIsLocked = isLocked;
        }

        static AutoCloseableLock lock(Lock l) {
            l.lock();
            return new AutoCloseableLock(l, true);
        }

        @Override // java.lang.AutoCloseable
        public void close() {
            if (!this.mIsLocked) {
                throw new IllegalStateException("mLock isn't locked.");
            }
            this.mIsLocked = false;
            this.mLock.unlock();
        }
    }

    public <T> Callback<T> makeCancelable(Callback<T> callback) {
        AutoCloseableLock acl = AutoCloseableLock.lock(this.mReentrantLock);
        try {
            checkNotCanceled();
            CancelableCallback<T> cancelable = new CancelableCallback<>(callback);
            this.mCancelables.add(new WeakReference<>(cancelable));
            if (acl != null) {
                acl.close();
            }
            return cancelable;
        } catch (Throwable th) {
            if (acl != null) {
                try {
                    acl.close();
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                }
            }
            throw th;
        }
    }

    public Runnable makeCancelable(Runnable runnable) {
        AutoCloseableLock acl = AutoCloseableLock.lock(this.mReentrantLock);
        try {
            checkNotCanceled();
            CancelableRunnable cancelable = new CancelableRunnable(runnable);
            this.mCancelables.add(new WeakReference<>(cancelable));
            if (acl != null) {
                acl.close();
            }
            return cancelable;
        } catch (Throwable th) {
            if (acl != null) {
                try {
                    acl.close();
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                }
            }
            throw th;
        }
    }

    public void destroy() {
        if (this.mReentrantLock.isHeldByCurrentThread()) {
            throw new AssertionError();
        }
        AutoCloseableLock acl = AutoCloseableLock.lock(this.mReentrantLock);
        try {
            checkNotCanceled();
            for (Cancelable cancelable : CollectionUtil.strengthen(this.mCancelables)) {
                cancelable.cancel();
            }
            this.mCancelables = null;
            if (acl != null) {
                acl.close();
            }
        } catch (Throwable th) {
            if (acl != null) {
                try {
                    acl.close();
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                }
            }
            throw th;
        }
    }

    private void checkNotCanceled() {
        if (this.mCancelables == null) {
            throw new IllegalStateException("This CallbackController has already been destroyed.");
        }
    }
}
