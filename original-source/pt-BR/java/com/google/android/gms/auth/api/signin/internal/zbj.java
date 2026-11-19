package com.google.android.gms.auth.api.signin.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.Status;
import j$.util.Objects;

/* compiled from: com.google.android.gms:play-services-auth@@21.4.0 */
/* carregado de: classes16.dex */
final class zbj extends zba {
    final /* sintético */ zbk zba;

    zbj(zbk zbkVar) {
        Objects.requireNonNull(zbkVar);
        this.zba = zbkVar;
    }

    @Override // com.google.android.gms.auth.api.signin.internal.zba, com.google.android.gms.auth.api.signin.internal.zbr
    public final void zbd(Status status) throws RemoteException {
        this.zba.setResult((zbk) status);
    }
}
