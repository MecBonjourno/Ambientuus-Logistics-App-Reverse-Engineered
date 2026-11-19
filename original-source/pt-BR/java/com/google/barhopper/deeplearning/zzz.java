package com.google.barhopper.deeplearning;

import com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzeh;
import com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzfn;

/* compiled from: com.google.mlkit:barcode-scanning@@17.3.0 */
/* carregado de: classes16.dex */
public final class zzz extends zzeh implements zzfn {
    private static final zzz zzb;

    static {
        zzz zzzVar = new zzz();
        zzb = zzzVar;
        zzeh.zzV(zzz.class, zzzVar);
    }

    private zzz() {
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzeh
    protected final Object zzg(int i, Object obj, Object obj2) {
        zzx zzxVar = null;
        switch (i - 1) {
            case 0:
                return (byte) 1;
            case 1:
            default:
                return null;
            case 2:
                return zzS(zzb, "\u0001\u0000", null);
            case 3:
                return new zzz();
            case 4:
                return new zzy(zzxVar);
            case 5:
                return zzb;
        }
    }
}
