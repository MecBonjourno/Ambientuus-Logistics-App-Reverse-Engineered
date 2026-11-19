package com.google.android.gms.auth.api.accounttransfer;

import android.os.RemoteException;
import com.google.android.gms.internal.auth.zzau;
import com.google.android.gms.internal.auth.zzaz;

/* compiled from: com.google.android.gms:play-services-auth-base@@18.0.10 */
/* carregado de: classes16.dex */
final class zzc extends zzn {
    final /* sintético */ zzaz zza;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    zzc(AccountTransferClient accountTransferClient, int i, zzaz zzazVar) {
        super(1606);
        this.zza = zzazVar;
    }

    @Override // com.google.android.gms.auth.api.accounttransfer.zzl
    protected final void zza(zzau zzauVar) throws RemoteException {
        zzauVar.zzh(this.zzc, this.zza);
    }
}
