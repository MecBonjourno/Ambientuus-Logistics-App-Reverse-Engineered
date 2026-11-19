package com.google.common.util.concurrent;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
public interface FutureCallback<V> {
    void onFailure(Throwable th);

    void onSuccess(@ParametricNullness V v);
}
