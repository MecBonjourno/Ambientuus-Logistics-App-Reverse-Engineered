package com.google.android.gms.common.internal.service;

import android.os.RemoteException;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;

/* compiled from: com.google.android.gms:play-services-base@@18.4.0 */
/* carregado de: classes16.dex */
final class zac extends zaf {
    zac(zae zaeVar, GoogleApiClient googleApiClient) {
        super(googleApiClient);
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // com.google.android.gms.common.api.internal.BaseImplementation.ApiMethodImpl
    protected final /* bridge */ /* sintético */ void doExecute(Api.AnyClient anyClient) throws RemoteException {
        ((zal) ((zah) anyClient).getService()).zae(new zad(this));
    }
}
