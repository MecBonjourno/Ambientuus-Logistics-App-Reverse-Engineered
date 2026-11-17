package org.chromium.base.supplier;

import org.chromium.base.Callback;

/* loaded from: classes17.dex */
public interface OneshotSupplier<T> extends Supplier<T> {
    T onAvailable(Callback<T> callback);
}
