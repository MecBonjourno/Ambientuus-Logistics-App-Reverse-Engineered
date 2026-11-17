package org.chromium.base;

import android.os.Handler;
import j$.util.Objects;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.function.Function;
import org.chromium.base.Callback;
import org.chromium.base.Promise;

/* loaded from: classes17.dex */
public class Promise<T> {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private Exception mRejectReason;
    private T mResult;
    private boolean mThrowingRejectionHandler;
    private int mState = 0;
    private final List<Callback<T>> mFulfillCallbacks = new LinkedList();
    private final List<Callback<Exception>> mRejectCallbacks = new LinkedList();
    private final Thread mThread = Thread.currentThread();
    private final Handler mHandler = new Handler();

    public interface AsyncFunction<A, RT> extends Function<A, Promise<RT>> {
    }

    @Retention(RetentionPolicy.SOURCE)
    private @interface PromiseState {
        public static final int FULFILLED = 1;
        public static final int REJECTED = 2;
        public static final int UNFULFILLED = 0;
    }

    public static class UnhandledRejectionException extends RuntimeException {
        public UnhandledRejectionException(String message, Throwable cause) {
            super(message, cause);
        }
    }

    public void then(Callback<T> onFulfill) {
        checkThread();
        if (this.mThrowingRejectionHandler) {
            thenInner(onFulfill);
        } else {
            if (this.mRejectCallbacks.size() != 0) {
                throw new AssertionError("Do not call the single argument Promise.then(Callback) on a Promise that already has a rejection handler.");
            }
            Callback<Exception> onReject = new Callback() { // from class: org.chromium.base.Promise$$ExternalSyntheticLambda4
                @Override // org.chromium.base.Callback
                public /* synthetic */ Runnable bind(Object obj) {
                    return Callback.CC.$default$bind(this, obj);
                }

                @Override // org.chromium.base.Callback
                public final void onResult(Object obj) {
                    Promise.lambda$then$0((Exception) obj);
                }
            };
            then(onFulfill, onReject);
            this.mThrowingRejectionHandler = true;
        }
    }

    static /* synthetic */ void lambda$then$0(Exception reason) {
        throw new UnhandledRejectionException("Promise was rejected without a rejection handler.", reason);
    }

    public void then(Callback<T> onFulfill, Callback<Exception> onReject) {
        checkThread();
        thenInner(onFulfill);
        exceptInner(onReject);
    }

    public void except(Callback<Exception> onReject) {
        checkThread();
        exceptInner(onReject);
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void thenInner(Callback<T> callback) {
        if (this.mState == 1) {
            postCallbackToLooper(callback, this.mResult);
        } else if (this.mState == 0) {
            this.mFulfillCallbacks.add(callback);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void exceptInner(Callback<Exception> callback) {
        if (this.mThrowingRejectionHandler) {
            throw new AssertionError("Do not add an exception handler to a Promise you have called the single argument Promise.then(Callback) on.");
        }
        if (this.mState == 2) {
            postCallbackToLooper(callback, this.mRejectReason);
        } else if (this.mState == 0) {
            this.mRejectCallbacks.add(callback);
        }
    }

    public <RT> Promise<RT> then(final Function<T, RT> function) {
        checkThread();
        final Promise<RT> promise = new Promise<>();
        thenInner(new Callback() { // from class: org.chromium.base.Promise$$ExternalSyntheticLambda2
            @Override // org.chromium.base.Callback
            public /* synthetic */ Runnable bind(Object obj) {
                return Callback.CC.$default$bind(this, obj);
            }

            @Override // org.chromium.base.Callback
            public final void onResult(Object obj) {
                Promise.lambda$then$1(Promise.this, function, obj);
            }
        });
        Objects.requireNonNull(promise);
        exceptInner(new Promise$$ExternalSyntheticLambda1(promise));
        return promise;
    }

    /* JADX WARN: Multi-variable type inference failed */
    static /* synthetic */ void lambda$then$1(Promise promise, Function function, Object result) {
        try {
            promise.fulfill(function.apply(result));
        } catch (Exception e) {
            promise.reject(e);
        }
    }

    public <RT> Promise<RT> then(final AsyncFunction<T, RT> function) {
        checkThread();
        final Promise<RT> promise = new Promise<>();
        thenInner(new Callback() { // from class: org.chromium.base.Promise$$ExternalSyntheticLambda3
            @Override // org.chromium.base.Callback
            public /* synthetic */ Runnable bind(Object obj) {
                return Callback.CC.$default$bind(this, obj);
            }

            @Override // org.chromium.base.Callback
            public final void onResult(Object obj) {
                Promise.lambda$then$2(Promise.AsyncFunction.this, promise, obj);
            }
        });
        Objects.requireNonNull(promise);
        exceptInner(new Promise$$ExternalSyntheticLambda1(promise));
        return promise;
    }

    static /* synthetic */ void lambda$then$2(AsyncFunction function, final Promise promise, Object result) {
        try {
            Promise apply = function.apply(result);
            Objects.requireNonNull(promise);
            Callback<T> callback = new Callback() { // from class: org.chromium.base.Promise$$ExternalSyntheticLambda0
                @Override // org.chromium.base.Callback
                public /* synthetic */ Runnable bind(Object obj) {
                    return Callback.CC.$default$bind(this, obj);
                }

                @Override // org.chromium.base.Callback
                public final void onResult(Object obj) {
                    Promise.this.fulfill(obj);
                }
            };
            Objects.requireNonNull(promise);
            apply.then(callback, new Promise$$ExternalSyntheticLambda1(promise));
        } catch (Exception e) {
            promise.reject(e);
        }
    }

    public void fulfill(T t) {
        checkThread();
        if (this.mState != 0) {
            throw new AssertionError();
        }
        this.mState = 1;
        this.mResult = t;
        Iterator<Callback<T>> it = this.mFulfillCallbacks.iterator();
        while (it.hasNext()) {
            postCallbackToLooper(it.next(), t);
        }
        this.mFulfillCallbacks.clear();
    }

    public void reject(Exception reason) {
        checkThread();
        if (this.mState != 0) {
            throw new AssertionError();
        }
        this.mState = 2;
        this.mRejectReason = reason;
        Iterator<Callback<Exception>> it = this.mRejectCallbacks.iterator();
        while (it.hasNext()) {
            postCallbackToLooper((Callback) it.next(), reason);
        }
        this.mRejectCallbacks.clear();
    }

    public void reject() {
        reject(null);
    }

    public boolean isFulfilled() {
        checkThread();
        return this.mState == 1;
    }

    public boolean isRejected() {
        checkThread();
        return this.mState == 2;
    }

    public T getResult() {
        if (!isFulfilled()) {
            throw new AssertionError();
        }
        return this.mResult;
    }

    public static <T> Promise<T> fulfilled(T result) {
        Promise<T> promise = new Promise<>();
        promise.fulfill(result);
        return promise;
    }

    public static <T> Promise<T> rejected() {
        Promise<T> promise = new Promise<>();
        promise.reject();
        return promise;
    }

    private void checkThread() {
        if (this.mThread != Thread.currentThread()) {
            throw new AssertionError("Promise must only be used on a single Thread.");
        }
    }

    private <S> void postCallbackToLooper(Callback<S> callback, S result) {
        this.mHandler.post(callback.bind(result));
    }
}
