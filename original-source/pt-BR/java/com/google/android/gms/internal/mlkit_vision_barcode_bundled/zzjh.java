package com.google.android.gms.internal.mlkit_vision_barcode_bundled;

/* compiled from: com.google.mlkit:barcode-scanning@@17.3.0 */
/* carregado de: classes16.dex */
public final class zzjh extends zzeh implements zzfn {
    private static final zzjh zzb;
    private int zzd;
    private String zze = "";
    private String zzf = "";

    static {
        zzjh zzjhVar = new zzjh();
        zzb = zzjhVar;
        zzeh.zzV(zzjh.class, zzjhVar);
    }

    private zzjh() {
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
                return zzS(zzb, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဈ\u0000\u0002ဈ\u0001", new Object[]{"zzd", "zze", "zzf"});
            case 3:
                return new zzjh();
            case 4:
                return new zzjg(zzhiVar);
            case 5:
                return zzb;
        }
    }
}
