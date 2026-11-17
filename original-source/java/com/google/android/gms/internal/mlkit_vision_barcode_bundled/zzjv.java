package com.google.android.gms.internal.mlkit_vision_barcode_bundled;

/* compiled from: com.google.mlkit:barcode-scanning@@17.3.0 */
/* loaded from: classes16.dex */
public final class zzjv extends zzed implements zzfn {
    private static final zzjv zzd;
    private byte zze = 2;

    static {
        zzjv zzjvVar = new zzjv();
        zzd = zzjvVar;
        zzeh.zzV(zzjv.class, zzjvVar);
    }

    private zzjv() {
    }

    public static zzjv zzf() {
        return zzd;
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzeh
    protected final Object zzg(int i, Object obj, Object obj2) {
        zzjt zzjtVar = null;
        switch (i - 1) {
            case 0:
                return Byte.valueOf(this.zze);
            case 1:
            default:
                this.zze = obj == null ? (byte) 0 : (byte) 1;
                return null;
            case 2:
                return zzS(zzd, "\u0003\u0000", null);
            case 3:
                return new zzjv();
            case 4:
                return new zzju(zzjtVar);
            case 5:
                return zzd;
        }
    }
}
