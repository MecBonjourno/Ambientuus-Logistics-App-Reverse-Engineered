package com.google.android.gms.internal.mlkit_vision_barcode_bundled;

/* compiled from: com.google.mlkit:barcode-scanning@@17.3.0 */
/* carregado de: classes16.dex */
public final class zzho extends zzeh implements zzfn {
    private static final zzho zzb;
    private int zzd;
    private int zze = -1;

    static {
        zzho zzhoVar = new zzho();
        zzb = zzhoVar;
        zzeh.zzV(zzho.class, zzhoVar);
    }

    private zzho() {
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
                return new zzho();
            case 4:
                return new zzhn(zzhiVar);
            case 5:
                return zzb;
        }
    }
}
