package com.google.android.gms.tasks;

import j$.util.Objects;

/* compiled from: com.google.android.gms:play-services-tasks@@18.4.0 */
/* carregado de: classes16.dex */
final class zzi implements Runnable {
    final /* sintético */ Task zza;
    final /* sintético */ zzj zzb;

    zzi(zzj zzjVar, Task task) {
        this.zza = task;
        Objects.requireNonNull(zzjVar);
        this.zzb = zzjVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzj zzjVar = this.zzb;
        synchronized (zzjVar.zzc()) {
            if (zzjVar.zzd() != null) {
                zzjVar.zzd().onComplete(this.zza);
            }
        }
    }
}
