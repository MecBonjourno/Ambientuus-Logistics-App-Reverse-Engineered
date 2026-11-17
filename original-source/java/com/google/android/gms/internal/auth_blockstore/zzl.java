package com.google.android.gms.internal.auth_blockstore;

import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.auth.blockstore.RetrieveBytesResponse;
import com.google.android.gms.common.api.Status;

/* compiled from: com.google.android.gms:play-services-auth-blockstore@@16.4.0 */
/* loaded from: classes16.dex */
public abstract class zzl extends zzb implements zzm {
    public zzl() {
        super("com.google.android.gms.auth.blockstore.internal.IRetrieveBytesCallback");
    }

    @Override // com.google.android.gms.internal.auth_blockstore.zzb
    protected final boolean dispatchTransaction(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
        switch (i) {
            case 1:
                Status status = (Status) zzc.zza(parcel, Status.CREATOR);
                byte[] createByteArray = parcel.createByteArray();
                enforceNoDataAvail(parcel);
                zza(status, createByteArray);
                return true;
            case 2:
                Status status2 = (Status) zzc.zza(parcel, Status.CREATOR);
                RetrieveBytesResponse retrieveBytesResponse = (RetrieveBytesResponse) zzc.zza(parcel, RetrieveBytesResponse.CREATOR);
                enforceNoDataAvail(parcel);
                zzb(status2, retrieveBytesResponse);
                return true;
            default:
                return false;
        }
    }
}
