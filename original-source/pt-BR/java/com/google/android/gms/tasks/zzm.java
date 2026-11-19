package com.google.android.gms.tasks;

import j$.util.Objects;

/* compiled from: com.google.android.gms:play-services-tasks@@18.4.0 */
/* carregado de: classes16.dex */
final class zzm implements Runnable {
    final /* sintético */ Task zza;
    final /* sintético */ zzn zzb;

    zzm(zzn zznVar, Task task) {
        this.zza = task;
        Objects.requireNonNull(zznVar);
        this.zzb = zznVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzn zznVar = this.zzb;
        synchronized (zznVar.zzc()) {
            if (zznVar.zzd() != null) {
                zznVar.zzd().onSuccess(this.zza.getResult());
            }
        }
    }
}
