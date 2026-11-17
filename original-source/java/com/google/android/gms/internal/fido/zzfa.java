package com.google.android.gms.internal.fido;

import java.util.Comparator;

/* compiled from: com.google.android.gms:play-services-fido@@21.0.0 */
/* loaded from: classes16.dex */
final class zzfa implements Comparator {
    zzfa() {
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        zzfh zza = zzfh.zza(obj);
        zzfh zza2 = zzfh.zza(obj2);
        if (zza != zza2) {
            return zza.compareTo(zza2);
        }
        switch (zza) {
            case BOOLEAN:
                return ((Boolean) obj).compareTo((Boolean) obj2);
            case STRING:
                return ((String) obj).compareTo((String) obj2);
            case LONG:
                return ((Long) obj).compareTo((Long) obj2);
            case DOUBLE:
                return ((Double) obj).compareTo((Double) obj2);
            default:
                throw null;
        }
    }
}
