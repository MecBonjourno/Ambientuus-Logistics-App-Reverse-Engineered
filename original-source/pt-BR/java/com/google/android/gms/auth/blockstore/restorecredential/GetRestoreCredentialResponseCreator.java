package com.google.android.gms.auth.blockstore.restorecredential;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelReader;
import com.google.android.gms.common.internal.safeparcel.SafeParcelWriter;

/* compiled from: com.google.android.gms:play-services-auth-blockstore@@16.4.0 */
/* carregado de: classes16.dex */
public final class GetRestoreCredentialResponseCreator implements Parcelable.Creator<GetRestoreCredentialResponse> {
    static void writeToParcel(GetRestoreCredentialResponse getRestoreCredentialResponse, Parcel parcel, int i) {
        int beginObjectHeader = SafeParcelWriter.beginObjectHeader(parcel);
        SafeParcelWriter.writeBundle(parcel, 1, getRestoreCredentialResponse.getResponseBundle(), false);
        SafeParcelWriter.finishObjectHeader(parcel, beginObjectHeader);
    }

    /* JADX WARN: não é possível renomear o método para resolver a colisão */
    @Override // android.os.Parcelable.Creator
    public GetRestoreCredentialResponse createFromParcel(Parcel parcel) {
        int validateObjectHeader = SafeParcelReader.validateObjectHeader(parcel);
        Bundle bundle = null;
        while (parcel.dataPosition() < validateObjectHeader) {
            int readHeader = SafeParcelReader.readHeader(parcel);
            switch (SafeParcelReader.getFieldId(readHeader)) {
                case 1:
                    bundle = SafeParcelReader.createBundle(parcel, readHeader);
                    break;
                default:
                    SafeParcelReader.skipUnknownField(parcel, readHeader);
                    break;
            }
        }
        SafeParcelReader.ensureAtEnd(parcel, validateObjectHeader);
        return new GetRestoreCredentialResponse(bundle);
    }

    /* JADX WARN: não é possível renomear o método para resolver a colisão */
    @Override // android.os.Parcelable.Creator
    public GetRestoreCredentialResponse[] newArray(int i) {
        return new GetRestoreCredentialResponse[i];
    }
}
