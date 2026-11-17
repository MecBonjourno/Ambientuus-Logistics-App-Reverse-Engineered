package com.google.barhopper.deeplearning;

import com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzeh;
import com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzfn;

/* compiled from: com.google.mlkit:barcode-scanning@@17.3.0 */
/* loaded from: classes16.dex */
public final class BarhopperV3Options extends zzeh<BarhopperV3Options, zzk> implements zzfn {
    private static final BarhopperV3Options zzb;
    private int zzd;
    private zzi zze;
    private zzac zzf;
    private zzq zzg;

    static {
        BarhopperV3Options barhopperV3Options = new BarhopperV3Options();
        zzb = barhopperV3Options;
        zzeh.zzV(BarhopperV3Options.class, barhopperV3Options);
    }

    private BarhopperV3Options() {
    }

    public static zzk zza() {
        return (zzk) zzb.zzG();
    }

    static /* synthetic */ void zzc(BarhopperV3Options barhopperV3Options, zzi zziVar) {
        zziVar.getClass();
        barhopperV3Options.zze = zziVar;
        barhopperV3Options.zzd |= 1;
    }

    static /* synthetic */ void zzd(BarhopperV3Options barhopperV3Options, zzac zzacVar) {
        zzacVar.getClass();
        barhopperV3Options.zzf = zzacVar;
        barhopperV3Options.zzd |= 2;
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzeh
    protected final Object zzg(int i, Object obj, Object obj2) {
        zzj zzjVar = null;
        switch (i - 1) {
            case 0:
                return (byte) 1;
            case 1:
            default:
                return null;
            case 2:
                return zzS(zzb, "\u0004\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001ဉ\u0000\u0002ဉ\u0001\u0003ဉ\u0002", new Object[]{"zzd", "zze", "zzf", "zzg"});
            case 3:
                return new BarhopperV3Options();
            case 4:
                return new zzk(zzjVar);
            case 5:
                return zzb;
        }
    }
}
