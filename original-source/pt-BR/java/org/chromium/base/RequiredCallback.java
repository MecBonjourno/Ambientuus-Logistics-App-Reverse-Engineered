package org.chromium.base;

import org.chromium.base.Callback;

/* carregado de: classes17.dex */
public class RequiredCallback<T> implements Callback<T> {
    static final /* sintético */ boolean $assertionsDisabled = false;
    private Callback<T> mCallback;
    private final LifetimeAssert mLifetimeAssert = LifetimeAssert.create(this);

    @Override // org.chromium.base.Callback
    public /* sintético */ Runnable bind(Object obj) {
        return Callback.CC.$default$bind(this, obj);
    }

    public RequiredCallback(Callback<T> callback) {
        this.mCallback = callback;
    }

    @Override // org.chromium.base.Callback
    public void onResult(T result) {
        if (this.mCallback == null) {
            throw new AssertionError("Callback was already called.");
        }
        this.mCallback.onResult(result);
        LifetimeAssert.setSafeToGc(this.mLifetimeAssert, true);
        this.mCallback = null;
    }
}
