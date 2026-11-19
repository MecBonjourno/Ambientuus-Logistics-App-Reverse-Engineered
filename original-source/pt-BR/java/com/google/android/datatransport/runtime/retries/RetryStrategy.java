package com.google.android.datatransport.runtime.retries;

/* carregado de: classes.dex */
public interface RetryStrategy<TInput, TResult> {
    TInput shouldRetry(TInput tinput, TResult tresult);
}
