package org.chromium.base;

import android.os.Handler;
import android.os.Looper;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;
import org.chromium.base.ThreadUtils;
import org.chromium.base.lifetime.DestroyChecker;

/* carregado de: classes17.dex */
public final class UnownedUserDataHost {
    private final DestroyChecker mDestroyChecker;
    private Handler mHandler;
    private final ThreadUtils.ThreadChecker mThreadChecker;
    private HashMap<UnownedUserDataKey<?>, WeakReference<? extends UnownedUserData>> mUnownedUserDataMap;

    private static Looper retrieveNonNullLooperOrThrow() {
        Looper looper = Looper.myLooper();
        if (looper == null) {
            throw new IllegalStateException();
        }
        return looper;
    }

    public UnownedUserDataHost() {
        this(new Handler(retrieveNonNullLooperOrThrow()));
    }

    UnownedUserDataHost(Handler handler) {
        this.mThreadChecker = new ThreadUtils.ThreadChecker();
        this.mDestroyChecker = new DestroyChecker();
        this.mUnownedUserDataMap = new HashMap<>();
        this.mHandler = handler;
    }

    <T extends UnownedUserData> void set(UnownedUserDataKey<T> key, T newValue) {
        checkState();
        if (this.mUnownedUserDataMap.containsKey(key) && !newValue.equals(get(key))) {
            key.detachFromHost(this);
        }
        this.mUnownedUserDataMap.put(key, new WeakReference<>(newValue));
    }

    <T extends UnownedUserData> T get(UnownedUserDataKey<T> key) {
        checkState();
        WeakReference<? extends UnownedUserData> valueWeakRef = this.mUnownedUserDataMap.get(key);
        if (valueWeakRef == null) {
            return null;
        }
        UnownedUserData value = valueWeakRef.get();
        if (value == null) {
            key.detachFromHost(this);
            return null;
        }
        return key.getValueClass().cast(value);
    }

    <T extends UnownedUserData> void remove(UnownedUserDataKey<T> key) {
        final UnownedUserData value;
        checkState();
        WeakReference<? extends UnownedUserData> valueWeakRef = this.mUnownedUserDataMap.remove(key);
        if (valueWeakRef != null && (value = valueWeakRef.get()) != null && value.informOnDetachmentFromHost()) {
            this.mHandler.post(new Runnable() { // da classe: org.chromium.base.UnownedUserDataHost$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    UnownedUserDataHost.this.m2505lambda$remove$0$orgchromiumbaseUnownedUserDataHost(value);
                }
            });
        }
    }

    /* renomeado de: lambda$remove$0$org-chromium-base-UnownedUserDataHost, motivo: nome Java inválido */
    /* sintético */ void m2505lambda$remove$0$orgchromiumbaseUnownedUserDataHost(UnownedUserData value) {
        value.onDetachedFromHost(this);
    }

    public void destroy() {
        this.mThreadChecker.assertOnValidThread();
        if (this.mDestroyChecker.isDestroyed()) {
            return;
        }
        Set<UnownedUserDataKey<?>> keys = new HashSet<>(this.mUnownedUserDataMap.keySet());
        for (UnownedUserDataKey<?> key : keys) {
            key.detachFromHost(this);
        }
        this.mUnownedUserDataMap = null;
        this.mHandler = null;
        this.mDestroyChecker.destroy();
    }

    int getMapSize() {
        checkState();
        return this.mUnownedUserDataMap.size();
    }

    boolean isDestroyed() {
        return this.mDestroyChecker.isDestroyed();
    }

    private void checkState() {
        this.mThreadChecker.assertOnValidThread();
        this.mDestroyChecker.checkNotDestroyed();
    }
}
