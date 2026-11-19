package com.google.android.gms.internal.mlkit_vision_barcode_bundled;

/* compiled from: com.google.mlkit:barcode-scanning@@17.3.0 */
/* carregado de: classes16.dex */
public final class zzjb extends zzeh implements zzfn {
    private static final zzjb zzb;
    private int zzd;
    private String zze = "";
    private zzjh zzf;

    static {
        zzjb zzjbVar = new zzjb();
        zzb = zzjbVar;
        zzeh.zzV(zzjb.class, zzjbVar);
    }

    private zzjb() {
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
                return zzS(zzb, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဈ\u0000\u0002ဉ\u0001", new Object[]{"zzd", "zze", "zzf"});
            case 3:
                return new zzjb();
            case 4:
                return new zzja(zzhiVar);
            case 5:
                return zzb;
        }
    }
}
