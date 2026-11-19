package com.google.android.gms.internal.fido;

import java.io.IOException;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.Map;

/* compiled from: com.google.android.gms:play-services-fido@@21.0.0 */
/* carregado de: classes16.dex */
public final class zzhm extends zzhp {
    private final int zza;
    private final zzcj zzb;

    zzhm(zzcj zzcjVar) throws zzhf {
        if (zzcjVar == null) {
            throw null;
        }
        this.zzb = zzcjVar;
        zzdc it = this.zzb.entrySet().iterator();
        int i = 0;
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            int zzb = ((zzhp) entry.getKey()).zzb();
            i = i < zzb ? zzb : i;
            int zzb2 = ((zzhp) entry.getValue()).zzb();
            if (i < zzb2) {
                i = zzb2;
            }
        }
        int i2 = i + 1;
        this.zza = i2;
        if (i2 > 8) {
            throw new zzhf("Exceeded cutoff limit for max depth of cbor value");
        }
    }

    @Override // java.lang.Comparable
    public final /* bridge */ /* sintético */ int compareTo(Object obj) {
        int compareTo;
        zzhp zzhpVar = (zzhp) obj;
        if (zzd((byte) -96) != zzhpVar.zza()) {
            return zzd((byte) -96) - zzhpVar.zza();
        }
        zzhm zzhmVar = (zzhm) zzhpVar;
        if (this.zzb.size() != zzhmVar.zzb.size()) {
            return this.zzb.size() - zzhmVar.zzb.size();
        }
        zzdc it = this.zzb.entrySet().iterator();
        zzdc it2 = zzhmVar.zzb.entrySet().iterator();
        do {
            if (!it.hasNext() && !it2.hasNext()) {
                return 0;
            }
            Map.Entry entry = (Map.Entry) it.next();
            Map.Entry entry2 = (Map.Entry) it2.next();
            int compareTo2 = ((zzhp) entry.getKey()).compareTo((zzhp) entry2.getKey());
            if (compareTo2 != 0) {
                return compareTo2;
            }
            compareTo = ((zzhp) entry.getValue()).compareTo((zzhp) entry2.getValue());
        } while (compareTo == 0);
        return compareTo;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && getClass() == obj.getClass()) {
            return this.zzb.equals(((zzhm) obj).zzb);
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(zzd((byte) -96)), this.zzb});
    }

    public final String toString() {
        if (this.zzb.isEmpty()) {
            return "{}";
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        zzdc it = this.zzb.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            linkedHashMap.put(((zzhp) entry.getKey()).toString().replace("\n", "\n  "), ((zzhp) entry.getValue()).toString().replace("\n", "\n  "));
        }
        zzbd zza = zzbd.zza(",\n  ");
        StringBuilder sb = new StringBuilder("{\n  ");
        try {
            zzbc.zza(sb, linkedHashMap.entrySet().iterator(), zza, " : ");
            sb.append("\n}");
            return sb.toString();
        } catch (IOException e) {
            throw new AssertionError(e);
        }
    }

    @Override // com.google.android.gms.internal.fido.zzhp
    protected final int zza() {
        return zzd((byte) -96);
    }

    @Override // com.google.android.gms.internal.fido.zzhp
    protected final int zzb() {
        return this.zza;
    }

    public final zzcj zzc() {
        return this.zzb;
    }
}
