package org.chromium.base.supplier;

import org.chromium.base.Callback;

/* carregado de: classes17.dex */
public interface ObservableSupplier<E> extends Supplier<E> {
    E addObserver(Callback<E> callback);

    void removeObserver(Callback<E> callback);
}
