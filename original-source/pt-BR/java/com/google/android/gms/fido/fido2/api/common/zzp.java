package com.google.android.gms.fido.fido2.api.common;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.fido.fido2.api.common.COSEAlgorithmIdentifier;

/* compiled from: com.google.android.gms:play-services-fido@@21.0.0 */
/* carregado de: classes16.dex */
final class zzp implements Parcelable.Creator {
    zzp() {
    }

    @Override // android.os.Parcelable.Creator
    public final /* bridge */ /* sintético */ Object createFromParcel(Parcel parcel) {
        try {
            return COSEAlgorithmIdentifier.fromCoseValue(Integer.valueOf(parcel.readInt()).intValue());
        } catch (COSEAlgorithmIdentifier.UnsupportedAlgorithmIdentifierException e) {
            throw new RuntimeException(e);
        }
    }

    @Override // android.os.Parcelable.Creator
    public final /* sintético */ Object[] newArray(int i) {
        return new COSEAlgorithmIdentifier[i];
    }
}
