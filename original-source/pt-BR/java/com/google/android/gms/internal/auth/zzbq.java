package com.google.android.gms.internal.auth;

import android.content.Context;
import android.os.RemoteException;
import com.google.android.gms.auth.api.proxy.ProxyRequest;
import com.google.android.gms.common.api.GoogleApiClient;

/* compiled from: com.google.android.gms:play-services-auth-base@@18.0.10 */
/* carregado de: classes16.dex */
final class zzbq extends zzbi {
    final /* sintético */ ProxyRequest zza;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    zzbq(zzbt zzbtVar, GoogleApiClient googleApiClient, ProxyRequest proxyRequest) {
        super(googleApiClient);
        this.zza = proxyRequest;
    }

    @Override // com.google.android.gms.internal.auth.zzbi
    protected final void zza(Context context, zzbh zzbhVar) throws RemoteException {
        zzbhVar.zze(new zzbp(this), this.zza);
    }
}
