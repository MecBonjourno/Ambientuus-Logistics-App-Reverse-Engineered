package com.google.photos.vision.barhopper;

import com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzeh;
import com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzeo;
import com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzfn;

/* compiled from: com.google.mlkit:barcode-scanning@@17.3.0 */
/* carregado de: classes16.dex */
public final class zzj extends zzeh implements zzfn {
    private static final zzj zzb;
    private int zzd;
    private String zze = "";
    private zzeo zzf = zzP();

    static {
        zzj zzjVar = new zzj();
        zzb = zzjVar;
        zzeh.zzV(zzj.class, zzjVar);
    }

    private zzj() {
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzeh
    protected final Object zzg(int i, Object obj, Object obj2) {
        zza zzaVar = null;
        switch (i - 1) {
            case 0:
                return (byte) 1;
            case 1:
            default:
                return null;
            case 2:
                return zzS(zzb, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0001\u0000\u0001ဈ\u0000\u0002\u001b", new Object[]{"zzd", "zze", "zzf", zzx.class});
            case 3:
                return new zzj();
            case 4:
                return new zzi(zzaVar);
            case 5:
                return zzb;
        }
    }
}
