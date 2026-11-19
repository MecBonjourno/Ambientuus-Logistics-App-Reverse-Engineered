package com.google.barhopper.deeplearning;

import com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzeh;
import com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzeo;
import com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzfn;

/* compiled from: com.google.mlkit:barcode-scanning@@17.3.0 */
/* carregado de: classes16.dex */
public final class zzq extends zzeh implements zzfn {
    private static final zzq zzb;
    private zzeo zzd = zzP();
    private zzeo zze = zzP();

    static {
        zzq zzqVar = new zzq();
        zzb = zzqVar;
        zzeh.zzV(zzq.class, zzqVar);
    }

    private zzq() {
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzeh
    protected final Object zzg(int i, Object obj, Object obj2) {
        zzo zzoVar = null;
        switch (i - 1) {
            case 0:
                return (byte) 1;
            case 1:
            default:
                return null;
            case 2:
                return zzS(zzb, "\u0004\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0002\u0000\u0001\u001b\u0002\u001b", new Object[]{"zzd", zzn.class, "zze", zzn.class});
            case 3:
                return new zzq();
            case 4:
                return new zzp(zzoVar);
            case 5:
                return zzb;
        }
    }
}
