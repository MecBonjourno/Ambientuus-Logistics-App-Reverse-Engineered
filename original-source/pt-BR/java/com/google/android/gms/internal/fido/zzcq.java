package com.google.android.gms.internal.fido;

import java.io.Serializable;

/* compiled from: com.google.android.gms:play-services-fido@@21.0.0 */
/* carregado de: classes16.dex */
final class zzcq extends zzcs implements Serializable {
    static final zzcq zza = new zzcq();

    private zzcq() {
    }

    @Override // com.google.android.gms.internal.fido.zzcs, java.util.Comparator
    public final /* bridge */ /* sintético */ int compare(Object obj, Object obj2) {
        Comparable comparable = (Comparable) obj;
        Comparable comparable2 = (Comparable) obj2;
        if (comparable == null) {
            throw null;
        }
        if (comparable2 != null) {
            return comparable.compareTo(comparable2);
        }
        throw null;
    }

    public final String toString() {
        return "Ordering.natural()";
    }

    @Override // com.google.android.gms.internal.fido.zzcs
    public final zzcs zza() {
        return zzcw.zza;
    }
}
