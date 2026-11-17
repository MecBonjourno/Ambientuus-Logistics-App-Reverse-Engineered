package org.chromium.base.supplier;

import org.chromium.base.Callback;
import org.chromium.base.Promise;
import org.chromium.base.ThreadUtils;
import org.chromium.base.supplier.Supplier;

/* loaded from: classes17.dex */
public class OneshotSupplierImpl<T> implements OneshotSupplier<T> {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private final Promise<T> mPromise = new Promise<>();
    private final ThreadUtils.ThreadChecker mThreadChecker = new ThreadUtils.ThreadChecker();

    @Override // org.chromium.base.supplier.Supplier
    public /* synthetic */ boolean hasValue() {
        return Supplier.CC.$default$hasValue(this);
    }

    @Override // org.chromium.base.supplier.OneshotSupplier
    public T onAvailable(Callback<T> callback) {
        this.mThreadChecker.assertOnValidThread();
        this.mPromise.then(callback);
        return get();
    }

    @Override // org.chromium.base.supplier.Supplier
    public T get() {
        this.mThreadChecker.assertOnValidThread();
        if (this.mPromise.isFulfilled()) {
            return this.mPromise.getResult();
        }
        return null;
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
