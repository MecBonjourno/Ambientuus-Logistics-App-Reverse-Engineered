package com.google.android.gms.auth.api.signin.internal;

import android.content.Context;
import android.os.RemoteException;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.auth.api.signin.GoogleSignInResult;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;

/* compiled from: com.google.android.gms:play-services-auth@@21.4.0 */
/* carregado de: classes16.dex */
final class zbg extends zbl {
    final /* sintético */ Context zba;
    final /* sintético */ GoogleSignInOptions zbb;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    zbg(GoogleApiClient googleApiClient, Context context, GoogleSignInOptions googleSignInOptions) {
        super(googleApiClient);
        this.zba = context;
        this.zbb = googleSignInOptions;
    }

    @Override // com.google.android.gms.common.api.internal.BasePendingResult
    protected final /* sintético */ Result createFailedResult(Status status) {
        return new GoogleSignInResult(null, status);
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // com.google.android.gms.common.api.internal.BaseImplementation.ApiMethodImpl
    protected final /* bridge */ /* sintético */ void doExecute(Api.AnyClient anyClient) throws RemoteException {
        zbs zbsVar = (zbs) ((zbe) anyClient).getService();
        Context context = this.zba;
        GoogleSignInOptions googleSignInOptions = this.zbb;
        zbsVar.zbc(new zbf(this, context, googleSignInOptions), googleSignInOptions);
    }
}
