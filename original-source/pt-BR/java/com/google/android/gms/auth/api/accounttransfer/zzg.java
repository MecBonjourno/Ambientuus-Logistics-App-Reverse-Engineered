package com.google.android.gms.auth.api.accounttransfer;

import android.os.RemoteException;
import com.google.android.gms.internal.auth.zzaq;
import com.google.android.gms.internal.auth.zzau;

/* compiled from: com.google.android.gms:play-services-auth-base@@18.0.10 */
/* carregado de: classes16.dex */
final class zzg extends zzl {
    final /* sintético */ zzaq zza;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    zzg(AccountTransferClient accountTransferClient, int i, zzaq zzaqVar) {
        super(1608, null);
        this.zza = zzaqVar;
    }

    @Override // com.google.android.gms.auth.api.accounttransfer.zzl
    protected final void zza(zzau zzauVar) throws RemoteException {
        zzauVar.zzd(new zzf(this, this), this.zza);
    }
}
