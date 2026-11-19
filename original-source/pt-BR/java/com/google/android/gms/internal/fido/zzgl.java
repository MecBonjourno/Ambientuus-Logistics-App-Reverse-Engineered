package com.google.android.gms.internal.fido;

import j$.util.Objects;
import java.util.Comparator;

/* compiled from: com.google.android.gms:play-services-fido@@21.0.0 */
/* carregado de: classes16.dex */
final class zzgl {
    static final String zza = String.valueOf(zzgl.class.getName()).concat("$UnsafeComparator");
    static final Comparator zzb;

    static {
        Comparator comparator;
        try {
            comparator = (Comparator) ((Object[]) Objects.requireNonNull(Class.forName(zza).getEnumConstants()))[0];
        } catch (Throwable th) {
            comparator = zzgk.INSTANCE;
        }
        zzb = comparator;
    }

    zzgl() {
    }
}
