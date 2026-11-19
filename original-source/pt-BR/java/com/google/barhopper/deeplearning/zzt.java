package com.google.barhopper.deeplearning;

import com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzeh;
import com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzfn;

/* compiled from: com.google.mlkit:barcode-scanning@@17.3.0 */
/* carregado de: classes16.dex */
public final class zzt extends zzeh implements zzfn {
    private static final zzt zzb;

    static {
        zzt zztVar = new zzt();
        zzb = zztVar;
        zzeh.zzV(zzt.class, zztVar);
    }

    private zzt() {
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzeh
    protected final Object zzg(int i, Object obj, Object obj2) {
        zzr zzrVar = null;
        switch (i - 1) {
            case 0:
                return (byte) 1;
            case 1:
            default:
                return null;
            case 2:
                return zzS(zzb, "\u0001\u0000", null);
            case 3:
                return new zzt();
            case 4:
                return new zzs(zzrVar);
            case 5:
                return zzb;
        }
    }
}
