package com.google.android.gms.internal.auth;

import android.os.RemoteException;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.internal.BaseImplementation;

/* compiled from: com.google.android.gms:play-services-auth-base@@18.0.10 */
/* carregado de: classes16.dex */
final class zzac extends BaseImplementation.ApiMethodImpl {
    final /* sintético */ boolean zza;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    zzac(zzal zzalVar, Api api, GoogleApiClient googleApiClient, boolean z) {
        super((Api<?>) api, googleApiClient);
        this.zza = z;
    }

    @Override // com.google.android.gms.common.api.internal.BasePendingResult
    protected final Result createFailedResult(Status status) {
        return new zzaj(status);
    }

    @Override // com.google.android.gms.common.api.internal.BaseImplementation.ApiMethodImpl
    protected final /* bridge */ /* sintético */ void doExecute(Api.AnyClient anyClient) throws RemoteException {
        ((com.google.android.gms.auth.account.zze) ((zzam) anyClient).getService()).zzf(this.zza);
        setResult((zzac) new zzaj(Status.RESULT_SUCCESS));
    }

    @Override // com.google.android.gms.common.api.internal.BaseImplementation.ApiMethodImpl, com.google.android.gms.common.api.internal.BaseImplementation.ResultHolder
    public final /* bridge */ /* sintético */ void setResult(Object obj) {
        super.setResult((zzac) obj);
    }
}
