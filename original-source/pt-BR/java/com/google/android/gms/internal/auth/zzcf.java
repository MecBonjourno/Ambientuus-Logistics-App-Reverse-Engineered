package com.google.android.gms.internal.auth;

import android.database.ContentObserver;
import android.os.Handler;

/* compiled from: com.google.android.gms:play-services-auth-base@@18.0.10 */
/* carregado de: classes16.dex */
final class zzcf extends ContentObserver {
    final /* sintético */ zzcg zza;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    zzcf(zzcg zzcgVar, Handler handler) {
        super(null);
        this.zza = zzcgVar;
    }

    @Override // android.database.ContentObserver
    public final void onChange(boolean z) {
        this.zza.zze();
    }
}
