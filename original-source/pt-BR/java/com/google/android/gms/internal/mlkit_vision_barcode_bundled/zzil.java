package com.google.android.gms.internal.mlkit_vision_barcode_bundled;

/* compiled from: com.google.mlkit:barcode-scanning@@17.3.0 */
/* carregado de: classes16.dex */
public final class zzil extends zzeh implements zzfn {
    private static final zzil zzb;
    private int zzd;
    private boolean zze;
    private boolean zzf;

    static {
        zzil zzilVar = new zzil();
        zzb = zzilVar;
        zzeh.zzV(zzil.class, zzilVar);
    }

    private zzil() {
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
                return zzS(zzb, "\u0001\u0002\u0000\u0001\u0005\u0006\u0002\u0000\u0000\u0000\u0005ဇ\u0000\u0006ဇ\u0001", new Object[]{"zzd", "zze", "zzf"});
            case 3:
                return new zzil();
            case 4:
                return new zzik(zzhiVar);
            case 5:
                return zzb;
        }
    }
}
