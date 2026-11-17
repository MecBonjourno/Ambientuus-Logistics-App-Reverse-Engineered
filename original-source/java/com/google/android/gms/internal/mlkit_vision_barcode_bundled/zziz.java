package com.google.android.gms.internal.mlkit_vision_barcode_bundled;

/* compiled from: com.google.mlkit:barcode-scanning@@17.3.0 */
/* loaded from: classes16.dex */
public final class zziz extends zzeh implements zzfn {
    private static final zziz zzb;
    private int zzd;
    private int zze;

    static {
        zziz zzizVar = new zziz();
        zzb = zzizVar;
        zzeh.zzV(zziz.class, zzizVar);
    }

    private zziz() {
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
                return zzS(zzb, "\u0001\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001င\u0000", new Object[]{"zzd", "zze"});
            case 3:
                return new zziz();
            case 4:
                return new zziy(zzhiVar);
            case 5:
                return zzb;
        }
    }
}
