package org.chromium.net.impl;

import java.util.concurrent.atomic.AtomicInteger;

/* carregado de: classes17.dex */
public final class RefCountDelegate {
    static final /* sintético */ boolean $assertionsDisabled = false;
    private final AtomicInteger mCount = new AtomicInteger(1);
    private final Runnable mDelegate;

    public RefCountDelegate(Runnable delegate) {
        this.mDelegate = delegate;
    }

    public void increment() {
        int updated_count = this.mCount.incrementAndGet();
        if (updated_count <= 1) {
            throw new AssertionError("increment() called on a RefCountDelegate with count < 1");
        }
    }

    public void decrement() {
        int updated_count = this.mCount.decrementAndGet();
        if (updated_count < 0) {
            throw new AssertionError("decrement() called on a RefCountDelegate with count < 1");
        }
        if (updated_count == 0) {
            this.mDelegate.run();
        }
    }
}
