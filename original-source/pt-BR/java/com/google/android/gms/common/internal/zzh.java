package com.google.android.gms.common.internal;

import android.os.Parcel;
import android.os.Parcelable;

/* compiled from: com.google.android.gms:play-services-basement@@18.8.0 */
/* carregado de: classes16.dex */
final class zzh implements Parcelable.Creator {
    zzh() {
    }

    @Override // android.os.Parcelable.Creator
    public final /* sintético */ Object createFromParcel(Parcel parcel) {
        return new BinderWrapper(parcel, null);
    }

    @Override // android.os.Parcelable.Creator
    public final /* sintético */ Object[] newArray(int i) {
        return new BinderWrapper[i];
    }
}
