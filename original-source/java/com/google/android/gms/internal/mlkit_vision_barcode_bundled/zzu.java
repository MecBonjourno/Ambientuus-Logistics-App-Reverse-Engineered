package com.google.android.gms.internal.mlkit_vision_barcode_bundled;

/* compiled from: com.google.mlkit:barcode-scanning@@17.3.0 */
/* loaded from: classes16.dex */
public final class zzu extends zzeh implements zzfn {
    private static final zzu zzb;
    private int zzd;
    private long zze;
    private long zzf;
    private zzjv zzg;
    private byte zzh = 2;

    static {
        zzu zzuVar = new zzu();
        zzb = zzuVar;
        zzeh.zzV(zzu.class, zzuVar);
        zzjv zzf = zzjv.zzf();
        zzhf zzhfVar = zzhf.MESSAGE;
        zzu zzuVar2 = zzb;
        zzeh.zzI(zzf, zzuVar2, zzuVar2, null, 13258261, zzhfVar, zzu.class);
    }

    private zzu() {
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzeh
    protected final Object zzg(int i, Object obj, Object obj2) {
        zzs zzsVar = null;
        switch (i - 1) {
            case 0:
                return Byte.valueOf(this.zzh);
            case 1:
            default:
                this.zzh = obj == null ? (byte) 0 : (byte) 1;
                return null;
            case 2:
                return zzS(zzb, "\u0001\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0003\u0001ᔅ\u0000\u0002ᔅ\u0001\u0003ᐉ\u0002", new Object[]{"zzd", "zze", "zzf", "zzg"});
            case 3:
                return new zzu();
            case 4:
                return new zzt(zzsVar);
            case 5:
                return zzb;
        }
    }
}
