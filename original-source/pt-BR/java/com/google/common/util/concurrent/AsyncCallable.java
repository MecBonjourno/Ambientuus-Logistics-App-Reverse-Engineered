package com.google.common.util.concurrent;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
public interface AsyncCallable<V> {
    ListenableFuture<V> call() throws Exception;
}
