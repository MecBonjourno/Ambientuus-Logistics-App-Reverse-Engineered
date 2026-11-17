package org.chromium.base.supplier;

import android.os.Handler;
import java.util.Iterator;
import org.chromium.base.Callback;
import org.chromium.base.ObserverList;
import org.chromium.base.ResettersForTesting;
import org.chromium.base.supplier.Supplier;

/* loaded from: classes17.dex */
public class ObservableSupplierImpl<E> implements ObservableSupplier<E> {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static boolean sIgnoreThreadChecksForTesting;
    private E mObject;
    private final Thread mThread = Thread.currentThread();
    private final Handler mHandler = new Handler();
    private final ObserverList<Callback<E>> mObservers = new ObserverList<>();

    @Override // org.chromium.base.supplier.Supplier
    public /* synthetic */ boolean hasValue() {
        return Supplier.CC.$default$hasValue(this);
    }

    public ObservableSupplierImpl() {
    }

    public ObservableSupplierImpl(E initialValue) {
        this.mObject = initialValue;
    }

    @Override // org.chromium.base.supplier.ObservableSupplier
    public E addObserver(final Callback<E> obs) {
        checkThread();
        this.mObservers.addObserver(obs);
        if (this.mObject != null) {
            final E currentObject = this.mObject;
            this.mHandler.post(new Runnable() { // from class: org.chromium.base.supplier.ObservableSupplierImpl$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    ObservableSupplierImpl.this.m2509x39bd9e04(currentObject, obs);
                }
            });
        }
        E currentObject2 = this.mObject;
        return currentObject2;
    }

    /* renamed from: lambda$addObserver$0$org-chromium-base-supplier-ObservableSupplierImpl, reason: not valid java name */
    /* synthetic */ void m2509x39bd9e04(Object currentObject, Callback obs) {
        if (this.mObject != currentObject || !this.mObservers.hasObserver(obs)) {
            return;
        }
        obs.onResult(this.mObject);
    }

    @Override // org.chromium.base.supplier.ObservableSupplier
    public void removeObserver(Callback<E> obs) {
        checkThread();
        this.mObservers.removeObserver(obs);
    }

    public void set(E object) {
        checkThread();
        if (object == this.mObject) {
            return;
        }
        this.mObject = object;
        Iterator<Callback<E>> it = this.mObservers.iterator();
        while (it.hasNext()) {
            Callback<E> observer = it.next();
            observer.onResult(this.mObject);
        }
    }

    @Override // org.chromium.base.supplier.Supplier
    public E get() {
        checkThread();
        return this.mObject;
    }

    private void checkThread() {
        if (!sIgnoreThreadChecksForTesting && this.mThread != Thread.currentThread()) {
            throw new AssertionError("ObservableSupplierImpl must only be used on a single Thread.");
        }
    }

    public static void setIgnoreThreadChecksForTesting(boolean ignoreThreadChecks) {
        sIgnoreThreadChecksForTesting = ignoreThreadChecks;
        ResettersForTesting.register(new Runnable() { // from class: org.chromium.base.supplier.ObservableSupplierImpl$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                ObservableSupplierImpl.sIgnoreThreadChecksForTesting = false;
            }
        });
    }
}
