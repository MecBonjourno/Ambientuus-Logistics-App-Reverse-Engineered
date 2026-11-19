package com.google.android.gms.identitycredentials;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelReader;
import com.google.android.gms.common.internal.safeparcel.SafeParcelWriter;

/* compiled from: com.google.android.gms:play-services-identity-credentials@@16.0.0-alpha02 */
/* carregado de: classes16.dex */
public final class RegistrationResponseCreator implements Parcelable.Creator<RegistrationResponse> {
    static void writeToParcel(RegistrationResponse registrationResponse, Parcel parcel, int i) {
        SafeParcelWriter.finishObjectHeader(parcel, SafeParcelWriter.beginObjectHeader(parcel));
    }

    /* JADX WARN: não é possível renomear o método para resolver a colisão */
    @Override // android.os.Parcelable.Creator
    public RegistrationResponse createFromParcel(Parcel parcel) {
        int validateObjectHeader = SafeParcelReader.validateObjectHeader(parcel);
        while (parcel.dataPosition() < validateObjectHeader) {
            int readHeader = SafeParcelReader.readHeader(parcel);
            SafeParcelReader.getFieldId(readHeader);
            SafeParcelReader.skipUnknownField(parcel, readHeader);
        }
        SafeParcelReader.ensureAtEnd(parcel, validateObjectHeader);
        return new RegistrationResponse();
    }

    /* JADX WARN: não é possível renomear o método para resolver a colisão */
    @Override // android.os.Parcelable.Creator
    public RegistrationResponse[] newArray(int i) {
        return new RegistrationResponse[i];
    }
}
