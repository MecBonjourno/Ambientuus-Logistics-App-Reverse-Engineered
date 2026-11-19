package com.google.android.gms.internal.fido;

import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.common.api.Status;

/* compiled from: com.google.android.gms:play-services-fido@@21.0.0 */
/* carregado de: classes16.dex */
public abstract class zzd extends zzb implements zze {
    public zzd() {
        super("com.google.android.gms.fido.fido2.api.IBooleanCallback");
    }

    @Override // com.google.android.gms.internal.fido.zzb
    protected final boolean zza(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
        switch (i) {
            case 1:
                int i3 = zzc.zza;
                boolean z = parcel.readInt() != 0;
                zzc.zzc(parcel);
                zzb(z);
                break;
            case 2:
                Status status = (Status) zzc.zza(parcel, Status.CREATOR);
                zzc.zzc(parcel);
                zzc(status);
                break;
            default:
                return false;
        }
        parcel2.writeNoException();
        return true;
    }
}
