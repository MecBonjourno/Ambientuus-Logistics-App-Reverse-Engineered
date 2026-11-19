package com.google.android.gms.identitycredentials;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelReader;
import com.google.android.gms.common.internal.safeparcel.SafeParcelWriter;
import java.util.Collections;
import java.util.List;

/* compiled from: com.google.android.gms:play-services-identity-credentials@@16.0.0-alpha02 */
/* carregado de: classes16.dex */
public final class RegistrationRequestCreator implements Parcelable.Creator<RegistrationRequest> {
    static void writeToParcel(RegistrationRequest registrationRequest, Parcel parcel, int i) {
        int beginObjectHeader = SafeParcelWriter.beginObjectHeader(parcel);
        SafeParcelWriter.writeByteArray(parcel, 1, registrationRequest.getCredentials(), false);
        SafeParcelWriter.writeByteArray(parcel, 2, registrationRequest.getMatcher(), false);
        SafeParcelWriter.writeString(parcel, 3, registrationRequest.getType(), false);
        SafeParcelWriter.writeString(parcel, 4, registrationRequest.getRequestType(), false);
        SafeParcelWriter.writeStringList(parcel, 5, registrationRequest.getProtocolTypes(), false);
        SafeParcelWriter.finishObjectHeader(parcel, beginObjectHeader);
    }

    /* JADX WARN: não é possível renomear o método para resolver a colisão */
    @Override // android.os.Parcelable.Creator
    public RegistrationRequest createFromParcel(Parcel parcel) {
        int validateObjectHeader = SafeParcelReader.validateObjectHeader(parcel);
        List emptyList = Collections.emptyList();
        String str = "";
        String str2 = str;
        byte[] bArr = null;
        byte[] bArr2 = null;
        while (parcel.dataPosition() < validateObjectHeader) {
            int readHeader = SafeParcelReader.readHeader(parcel);
            switch (SafeParcelReader.getFieldId(readHeader)) {
                case 1:
                    bArr = SafeParcelReader.createByteArray(parcel, readHeader);
                    break;
                case 2:
                    bArr2 = SafeParcelReader.createByteArray(parcel, readHeader);
                    break;
                case 3:
                    str = SafeParcelReader.createString(parcel, readHeader);
                    break;
                case 4:
                    str2 = SafeParcelReader.createString(parcel, readHeader);
                    break;
                case 5:
                    emptyList = SafeParcelReader.createStringList(parcel, readHeader);
                    break;
                default:
                    SafeParcelReader.skipUnknownField(parcel, readHeader);
                    break;
            }
        }
        SafeParcelReader.ensureAtEnd(parcel, validateObjectHeader);
        return new RegistrationRequest(bArr, bArr2, str, str2, emptyList);
    }

    /* JADX WARN: não é possível renomear o método para resolver a colisão */
    @Override // android.os.Parcelable.Creator
    public RegistrationRequest[] newArray(int i) {
        return new RegistrationRequest[i];
    }
}
