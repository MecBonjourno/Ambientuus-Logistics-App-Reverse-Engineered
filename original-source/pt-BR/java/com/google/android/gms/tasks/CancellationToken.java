package com.google.android.gms.tasks;

/* compiled from: com.google.android.gms:play-services-tasks@@18.4.0 */
/* carregado de: classes16.dex */
public abstract class CancellationToken {
    public abstract boolean isCancellationRequested();

    public abstract CancellationToken onCanceledRequested(OnTokenCanceledListener onTokenCanceledListener);
}
