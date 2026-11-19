package com.google.android.gms.auth;

import android.os.IBinder;
import android.os.RemoteException;
import java.io.IOException;

/* compiled from: com.google.android.gms:play-services-auth-base@@18.0.10 */
/* carregado de: classes16.dex */
final class zzi implements zzk {
    final /* sintético */ AccountChangeEventsRequest zza;

    zzi(AccountChangeEventsRequest accountChangeEventsRequest) {
        this.zza = accountChangeEventsRequest;
    }

    @Override // com.google.android.gms.auth.zzk
    public final /* bridge */ /* sintético */ Object zza(IBinder iBinder) throws RemoteException, IOException, GoogleAuthException {
        AccountChangeEventsResponse zzh = com.google.android.gms.internal.auth.zze.zzb(iBinder).zzh(this.zza);
        zzl.zzc(zzh);
        return zzh.getEvents();
    }
}
