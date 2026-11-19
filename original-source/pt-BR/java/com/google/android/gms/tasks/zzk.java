package com.google.android.gms.tasks;

import com.google.android.gms.common.internal.Preconditions;
import j$.util.Objects;

/* compiled from: com.google.android.gms:play-services-tasks@@18.4.0 */
/* carregado de: classes16.dex */
final class zzk implements Runnable {
    final /* sintético */ Task zza;
    final /* sintético */ zzl zzb;

    zzk(zzl zzlVar, Task task) {
        this.zza = task;
        Objects.requireNonNull(zzlVar);
        this.zzb = zzlVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzl zzlVar = this.zzb;
        synchronized (zzlVar.zzc()) {
            if (zzlVar.zzd() != null) {
                zzlVar.zzd().onFailure((Exception) Preconditions.checkNotNull(this.zza.getException()));
            }
        }
    }
}
