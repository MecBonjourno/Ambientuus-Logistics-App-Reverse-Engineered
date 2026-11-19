package com.google.common.util.concurrent;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
public interface AsyncFunction<I, O> {
    ListenableFuture<O> apply(@ParametricNullness I i) throws Exception;
}
