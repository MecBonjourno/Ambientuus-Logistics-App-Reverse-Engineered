package com.google.android.gms.auth.blockstore;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.Objects;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelWriter;
import j$.util.DesugarCollections;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* compiled from: com.google.android.gms:play-services-auth-blockstore@@16.4.0 */
/* carregado de: classes16.dex */
public class RetrieveBytesResponse extends AbstractSafeParcelable {
    public static final Parcelable.Creator<RetrieveBytesResponse> CREATOR = new zzd();

    @Deprecated
    private final Bundle zza;
    private final List zzb;
    private final Map zzc;

    /* compiled from: com.google.android.gms:play-services-auth-blockstore@@16.4.0 */
    public static class BlockstoreData extends AbstractSafeParcelable {
        public static final Parcelable.Creator<BlockstoreData> CREATOR = new zza();
        private final byte[] zza;
        private final String zzb;

        BlockstoreData(byte[] bArr, String str) {
            this.zza = bArr;
            this.zzb = str;
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof BlockstoreData)) {
                return false;
            }
            if (this == obj) {
                return true;
            }
            return Arrays.equals(this.zza, ((BlockstoreData) obj).zza);
        }

        public byte[] getBytes() {
            return this.zza;
        }

        public int hashCode() {
            return Objects.hashCode(Integer.valueOf(Arrays.hashCode(this.zza)));
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel dest, int i) {
            int beginObjectHeader = SafeParcelWriter.beginObjectHeader(dest);
            SafeParcelWriter.writeByteArray(dest, 1, getBytes(), false);
            SafeParcelWriter.writeString(dest, 2, this.zzb, false);
            SafeParcelWriter.finishObjectHeader(dest, beginObjectHeader);
        }

        public final String zza() {
            return this.zzb;
        }
    }

    RetrieveBytesResponse(Bundle bundle, List list) {
        this.zza = bundle;
        this.zzb = list;
        HashMap hashMap = new HashMap();
        Iterator it = list.iterator();
        while (it.hasNext()) {
            BlockstoreData blockstoreData = (BlockstoreData) it.next();
            hashMap.put(blockstoreData.zza(), blockstoreData);
        }
        this.zzc = hashMap;
    }

    public Map<String, BlockstoreData> getBlockstoreDataMap() {
        return DesugarCollections.unmodifiableMap(this.zzc);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int i) {
        Bundle bundle = this.zza;
        int beginObjectHeader = SafeParcelWriter.beginObjectHeader(dest);
        SafeParcelWriter.writeBundle(dest, 1, bundle, false);
        SafeParcelWriter.writeTypedList(dest, 2, this.zzb, false);
        SafeParcelWriter.finishObjectHeader(dest, beginObjectHeader);
    }
}
