package com.google.android.gms.internal.mlkit_vision_barcode_bundled;

/* compiled from: com.google.mlkit:barcode-scanning@@17.3.0 */
/* carregado de: classes16.dex */
public final class zzx extends zzeh implements zzfn {
    private static final zzx zzb;
    private int zzd;
    private zzaa zze;

    static {
        zzx zzxVar = new zzx();
        zzb = zzxVar;
        zzeh.zzV(zzx.class, zzxVar);
    }

    private zzx() {
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzeh
    protected final Object zzg(int i, Object obj, Object obj2) {
        zzv zzvVar = null;
        switch (i - 1) {
            case 0:
                return (byte) 1;
            case 1:
            default:
                return null;
            case 2:
                return zzS(zzb, "\u0001\u0001\u0000\u0001\u000f\u000f\u0001\u0000\u0000\u0000\u000fဉ\u0000", new Object[]{"zzd", "zze"});
            case 3:
                return new zzx();
            case 4:
                return new zzw(zzvVar);
            case 5:
                return zzb;
        }
    }
}
