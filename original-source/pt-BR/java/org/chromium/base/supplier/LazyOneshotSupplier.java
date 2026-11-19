package org.chromium.base.supplier;

import org.chromium.base.Callback;
import org.chromium.base.Promise;
import org.chromium.base.ThreadUtils;

/* carregado de: classes17.dex */
public abstract class LazyOneshotSupplier<T> implements OneshotSupplier<T> {
    static final /* sintético */ boolean $assertionsDisabled = false;
    private final Promise<T> mPromise = new Promise<>();
    private final ThreadUtils.ThreadChecker mThreadChecker = new ThreadUtils.ThreadChecker();

    public abstract void doSet();

    @Override // org.chromium.base.supplier.OneshotSupplier
    public T onAvailable(Callback<T> callback) {
        this.mThreadChecker.assertOnValidThread();
        this.mPromise.then(callback);
        if (hasValue()) {
            return get();
        }
        return null;
    }

    @Override // org.chromium.base.supplier.Supplier
    public T get() {
        this.mThreadChecker.assertOnValidThread();
        if (!hasValue()) {
            doSet();
        }
        if (hasValue()) {
            return this.mPromise.getResult();
        }
        return null;
    }

    @Override // org.chromium.base.supplier.Supplier
    public boolean hasValue() {
        return this.mPromise.isFulfilled();
    }

    public void set(T object) {
        this.mThreadChecker.assertOnValidThread();
        if (this.mPromise.isFulfilled()) {
            throw new AssertionError();
        }
        if (object == null) {
            throw new AssertionError();
        }
        this.mPromise.fulfill(object);
    }
}
