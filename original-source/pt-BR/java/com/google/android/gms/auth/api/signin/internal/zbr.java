package com.google.android.gms.auth.api.signin.internal;

import android.os.IInterface;
import android.os.RemoteException;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.common.api.Status;

/* compiled from: com.google.android.gms:play-services-auth@@21.4.0 */
/* carregado de: classes16.dex */
public interface zbr extends IInterface {
    void zbb(GoogleSignInAccount googleSignInAccount, Status status) throws RemoteException;

    void zbc(Status status) throws RemoteException;

    void zbd(Status status) throws RemoteException;
}
