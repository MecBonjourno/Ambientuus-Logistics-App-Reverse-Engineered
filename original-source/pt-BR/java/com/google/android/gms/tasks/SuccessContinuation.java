package com.google.android.gms.tasks;

/* compiled from: com.google.android.gms:play-services-tasks@@18.4.0 */
/* carregado de: classes16.dex */
public interface SuccessContinuation<TResult, TContinuationResult> {
    Task<TContinuationResult> then(TResult tresult) throws Exception;
}
