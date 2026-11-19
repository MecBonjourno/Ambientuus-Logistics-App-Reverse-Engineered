package com.google.android.gms.internal.mlkit_vision_barcode_bundled;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

/* compiled from: com.google.mlkit:barcode-scanning@@17.3.0 */
/* carregado de: classes16.dex */
public class zzb extends Binder implements IInterface {
    protected zzb(String str) {
        attachInterface(this, str);
    }

    @Override // android.os.IInterface
    public IBinder asBinder() {
        return this;
    }

    @Override // android.os.Binder
    public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
        if (code <= 16777215) {
            data.enforceInterface(getInterfaceDescriptor());
        } else if (super.onTransact(code, data, reply, flags)) {
            return true;
        }
        return zza(code, data, reply, flags);
    }

    protected boolean zza(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
        throw null;
    }
}
