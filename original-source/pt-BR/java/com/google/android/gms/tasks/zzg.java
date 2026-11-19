package com.google.android.gms.tasks;

import j$.util.Objects;

/* compiled from: com.google.android.gms:play-services-tasks@@18.4.0 */
/* carregado de: classes16.dex */
final class zzg implements Runnable {
    final /* sintético */ zzh zza;

    zzg(zzh zzhVar) {
        Objects.requireNonNull(zzhVar);
        this.zza = zzhVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzh zzhVar = this.zza;
        synchronized (zzhVar.zzc()) {
            if (zzhVar.zzd() != null) {
                zzhVar.zzd().onCanceled();
            }
        }
    }
}
