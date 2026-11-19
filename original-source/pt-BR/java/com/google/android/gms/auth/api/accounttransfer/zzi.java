package com.google.android.gms.auth.api.accounttransfer;

import android.os.RemoteException;
import com.google.android.gms.internal.auth.zzau;
import com.google.android.gms.internal.auth.zzav;

/* compiled from: com.google.android.gms:play-services-auth-base@@18.0.10 */
/* carregado de: classes16.dex */
final class zzi extends zzn {
    final /* sintético */ zzav zza;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    zzi(AccountTransferClient accountTransferClient, int i, zzav zzavVar) {
        super(1610);
        this.zza = zzavVar;
    }

    @Override // com.google.android.gms.auth.api.accounttransfer.zzl
    protected final void zza(zzau zzauVar) throws RemoteException {
        zzauVar.zzf(this.zzc, this.zza);
    }
}
