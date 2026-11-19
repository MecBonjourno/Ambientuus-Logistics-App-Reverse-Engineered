package com.google.android.gms.auth.api.accounttransfer;

import android.os.RemoteException;
import com.google.android.gms.internal.auth.zzau;
import com.google.android.gms.internal.auth.zzax;

/* compiled from: com.google.android.gms:play-services-auth-base@@18.0.10 */
/* carregado de: classes16.dex */
final class zze extends zzl {
    final /* sintético */ zzax zza;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    zze(AccountTransferClient accountTransferClient, int i, zzax zzaxVar) {
        super(1607, null);
        this.zza = zzaxVar;
    }

    @Override // com.google.android.gms.auth.api.accounttransfer.zzl
    protected final void zza(zzau zzauVar) throws RemoteException {
        zzauVar.zzg(new zzd(this, this), this.zza);
    }
}
