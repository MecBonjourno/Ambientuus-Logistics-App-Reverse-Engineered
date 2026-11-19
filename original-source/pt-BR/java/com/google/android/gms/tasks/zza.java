package com.google.android.gms.tasks;

import j$.util.Objects;

/* compiled from: com.google.android.gms:play-services-tasks@@18.4.0 */
/* carregado de: classes16.dex */
final class zza implements OnSuccessListener {
    final /* sintético */ OnTokenCanceledListener zza;

    zza(zzb zzbVar, OnTokenCanceledListener onTokenCanceledListener) {
        this.zza = onTokenCanceledListener;
        Objects.requireNonNull(zzbVar);
    }

    @Override // com.google.android.gms.tasks.OnSuccessListener
    public final /* bridge */ /* sintético */ void onSuccess(Object obj) {
        this.zza.onCanceled();
    }
}
