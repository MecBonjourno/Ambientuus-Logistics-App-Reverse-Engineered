package com.google.android.gms.internal.fido;

/* compiled from: com.google.android.gms:play-services-fido@@21.0.0 */
/* carregado de: classes16.dex */
enum zzfh {
    BOOLEAN,
    STRING,
    LONG,
    DOUBLE;

    static /* bridge */ /* sintético */ zzfh zza(Object obj) {
        if (obj instanceof String) {
            return STRING;
        }
        if (obj instanceof Boolean) {
            return BOOLEAN;
        }
        if (obj instanceof Long) {
            return LONG;
        }
        if (obj instanceof Double) {
            return DOUBLE;
        }
        throw new AssertionError("invalid tag type: ".concat(String.valueOf(String.valueOf(obj.getClass()))));
    }
}
