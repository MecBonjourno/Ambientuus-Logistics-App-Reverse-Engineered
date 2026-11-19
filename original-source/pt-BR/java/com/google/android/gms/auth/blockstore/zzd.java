package com.google.android.gms.auth.blockstore;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.auth.blockstore.RetrieveBytesResponse;
import com.google.android.gms.common.internal.safeparcel.SafeParcelReader;
import java.util.ArrayList;

/* compiled from: com.google.android.gms:play-services-auth-blockstore@@16.4.0 */
/* carregado de: classes16.dex */
public final class zzd implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final /* bridge */ /* sintético */ Object createFromParcel(Parcel parcel) {
        int validateObjectHeader = SafeParcelReader.validateObjectHeader(parcel);
        Bundle bundle = null;
        ArrayList arrayList = null;
        while (parcel.dataPosition() < validateObjectHeader) {
            int readHeader = SafeParcelReader.readHeader(parcel);
            switch (SafeParcelReader.getFieldId(readHeader)) {
                case 1:
                    bundle = SafeParcelReader.createBundle(parcel, readHeader);
                    break;
                case 2:
                    arrayList = SafeParcelReader.createTypedList(parcel, readHeader, RetrieveBytesResponse.BlockstoreData.CREATOR);
                    break;
                default:
                    SafeParcelReader.skipUnknownField(parcel, readHeader);
                    break;
            }
        }
        SafeParcelReader.ensureAtEnd(parcel, validateObjectHeader);
        return new RetrieveBytesResponse(bundle, arrayList);
    }

    @Override // android.os.Parcelable.Creator
    public final /* sintético */ Object[] newArray(int i) {
        return new RetrieveBytesResponse[i];
    }
}
