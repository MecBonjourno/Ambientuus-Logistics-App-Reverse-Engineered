package com.google.android.gms.auth.api.accounttransfer;

import android.os.RemoteException;
import com.google.android.gms.internal.auth.zzau;
import com.google.android.gms.internal.auth.zzbb;

/* compiled from: com.google.android.gms:play-services-auth-base@@18.0.10 */
/* carregado de: classes16.dex */
final class zzh extends zzn {
    final /* sintético */ zzbb zza;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    zzh(AccountTransferClient accountTransferClient, int i, zzbb zzbbVar) {
        super(1609);
        this.zza = zzbbVar;
    }

    @Override // com.google.android.gms.auth.api.accounttransfer.zzl
    protected final void zza(zzau zzauVar) throws RemoteException {
        zzauVar.zze(this.zzc, this.zza);
    }
}
