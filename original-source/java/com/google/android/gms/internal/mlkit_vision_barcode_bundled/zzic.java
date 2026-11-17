package com.google.android.gms.internal.mlkit_vision_barcode_bundled;

/* compiled from: com.google.mlkit:barcode-scanning@@17.3.0 */
/* loaded from: classes16.dex */
public final class zzic extends zzeh implements zzfn {
    private static final zzic zzb;
    private int zzd;
    private int zze;
    private long zzf;

    static {
        zzic zzicVar = new zzic();
        zzb = zzicVar;
        zzeh.zzV(zzic.class, zzicVar);
    }

    private zzic() {
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzeh
    protected final Object zzg(int i, Object obj, Object obj2) {
        zzhi zzhiVar = null;
        switch (i - 1) {
            case 0:
                return (byte) 1;
            case 1:
            default:
                return null;
            case 2:
                return zzS(zzb, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001᠌\u0000\u0002ဂ\u0001", new Object[]{"zzd", "zze", zzid.zza, "zzf"});
            case 3:
                return new zzic();
            case 4:
                return new zzib(zzhiVar);
            case 5:
                return zzb;
        }
    }
}
