package com.google.android.gms.internal.auth;

import android.accounts.Account;
import android.os.RemoteException;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.internal.BaseImplementation;

/* compiled from: com.google.android.gms:play-services-auth-base@@18.0.10 */
/* carregado de: classes16.dex */
final class zzag extends BaseImplementation.ApiMethodImpl {
    final /* sintético */ Account zza;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    zzag(zzal zzalVar, Api api, GoogleApiClient googleApiClient, Account account) {
        super((Api<?>) api, googleApiClient);
        this.zza = account;
    }

    @Override // com.google.android.gms.common.api.internal.BasePendingResult
    protected final Result createFailedResult(Status status) {
        return new zzak(status);
    }

    @Override // com.google.android.gms.common.api.internal.BaseImplementation.ApiMethodImpl
    protected final /* bridge */ /* sintético */ void doExecute(Api.AnyClient anyClient) throws RemoteException {
        ((com.google.android.gms.auth.account.zze) ((zzam) anyClient).getService()).zze(new zzaf(this), this.zza);
    }

    @Override // com.google.android.gms.common.api.internal.BaseImplementation.ApiMethodImpl, com.google.android.gms.common.api.internal.BaseImplementation.ResultHolder
    public final /* bridge */ /* sintético */ void setResult(Object obj) {
        super.setResult((zzag) obj);
    }
}
