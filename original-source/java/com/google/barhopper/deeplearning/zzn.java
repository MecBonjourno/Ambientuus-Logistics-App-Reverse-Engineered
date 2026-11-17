package com.google.barhopper.deeplearning;

import com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzeh;
import com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzfn;

/* compiled from: com.google.mlkit:barcode-scanning@@17.3.0 */
/* loaded from: classes16.dex */
public final class zzn extends zzeh implements zzfn {
    private static final zzn zzb;
    private int zzd = 0;
    private Object zze;

    static {
        zzn zznVar = new zzn();
        zzb = zznVar;
        zzeh.zzV(zzn.class, zznVar);
    }

    private zzn() {
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzeh
    protected final Object zzg(int i, Object obj, Object obj2) {
        zzl zzlVar = null;
        switch (i - 1) {
            case 0:
                return (byte) 1;
            case 1:
            default:
                return null;
            case 2:
                return zzS(zzb, "\u0001\u0003\u0001\u0000\u0001\u0003\u0003\u0000\u0000\u0000\u0001<\u0000\u0002<\u0000\u0003<\u0000", new Object[]{"zze", "zzd", zzt.class, zzz.class, zzw.class});
            case 3:
                return new zzn();
            case 4:
                return new zzm(zzlVar);
            case 5:
                return zzb;
        }
    }
}
