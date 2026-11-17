package org.chromium.base.supplier;

import java.lang.ref.WeakReference;
import org.chromium.base.Callback;

/* loaded from: classes17.dex */
public class OneShotCallback<E> {
    private final Callback<E> mCallback;
    private final Callback<E> mCallbackWrapper = new CallbackWrapper();
    private final WeakReference<ObservableSupplier<E>> mWeakSupplier;

    public OneShotCallback(ObservableSupplier<E> supplier, Callback<E> callback) {
        this.mWeakSupplier = new WeakReference<>(supplier);
        this.mCallback = callback;
        supplier.addObserver(this.mCallbackWrapper);
    }

    private class CallbackWrapper implements Callback<E> {
        static final /* synthetic */ boolean $assertionsDisabled = false;

        @Override // org.chromium.base.Callback
        public /* synthetic */ Runnable bind(Object obj) {
            return Callback.CC.$default$bind(this, obj);
        }

        private CallbackWrapper() {
        }

        @Override // org.chromium.base.Callback
        public void onResult(E result) {
            OneShotCallback.this.mCallback.onResult(result);
            ObservableSupplier<E> supplier = (ObservableSupplier) OneShotCallback.this.mWeakSupplier.get();
            if (supplier == null) {
                throw new AssertionError("This can only be called by supplier, which should not be null.");
            }
            supplier.removeObserver(OneShotCallback.this.mCallbackWrapper);
        }
    }
}
