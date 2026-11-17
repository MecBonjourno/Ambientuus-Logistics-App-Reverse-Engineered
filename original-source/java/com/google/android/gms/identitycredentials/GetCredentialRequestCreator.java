package com.google.android.gms.identitycredentials;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.ResultReceiver;
import com.google.android.gms.common.internal.safeparcel.SafeParcelReader;
import com.google.android.gms.common.internal.safeparcel.SafeParcelWriter;
import java.util.ArrayList;

/* compiled from: com.google.android.gms:play-services-identity-credentials@@16.0.0-alpha02 */
/* loaded from: classes16.dex */
public final class GetCredentialRequestCreator implements Parcelable.Creator<GetCredentialRequest> {
    static void writeToParcel(GetCredentialRequest getCredentialRequest, Parcel parcel, int i) {
        int beginObjectHeader = SafeParcelWriter.beginObjectHeader(parcel);
        SafeParcelWriter.writeTypedList(parcel, 1, getCredentialRequest.getCredentialOptions(), false);
        SafeParcelWriter.writeBundle(parcel, 2, getCredentialRequest.getData(), false);
        SafeParcelWriter.writeString(parcel, 3, getCredentialRequest.getOrigin(), false);
        SafeParcelWriter.writeParcelable(parcel, 4, getCredentialRequest.getResultReceiver(), i, false);
        SafeParcelWriter.finishObjectHeader(parcel, beginObjectHeader);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // android.os.Parcelable.Creator
    public GetCredentialRequest createFromParcel(Parcel parcel) {
        int validateObjectHeader = SafeParcelReader.validateObjectHeader(parcel);
        ArrayList arrayList = null;
        Bundle bundle = null;
        String str = null;
        ResultReceiver resultReceiver = null;
        while (parcel.dataPosition() < validateObjectHeader) {
            int readHeader = SafeParcelReader.readHeader(parcel);
            switch (SafeParcelReader.getFieldId(readHeader)) {
                case 1:
                    arrayList = SafeParcelReader.createTypedList(parcel, readHeader, CredentialOption.CREATOR);
                    break;
                case 2:
                    bundle = SafeParcelReader.createBundle(parcel, readHeader);
                    break;
                case 3:
                    str = SafeParcelReader.createString(parcel, readHeader);
                    break;
                case 4:
                    resultReceiver = (ResultReceiver) SafeParcelReader.createParcelable(parcel, readHeader, ResultReceiver.CREATOR);
                    break;
                default:
                    SafeParcelReader.skipUnknownField(parcel, readHeader);
                    break;
            }
        }
        SafeParcelReader.ensureAtEnd(parcel, validateObjectHeader);
        return new GetCredentialRequest(arrayList, bundle, str, resultReceiver);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // android.os.Parcelable.Creator
    public GetCredentialRequest[] newArray(int i) {
        return new GetCredentialRequest[i];
    }
}
