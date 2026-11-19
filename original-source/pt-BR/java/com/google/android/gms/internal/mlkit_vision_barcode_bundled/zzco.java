package com.google.android.gms.internal.mlkit_vision_barcode_bundled;

/* compiled from: com.google.mlkit:barcode-scanning@@17.3.0 */
/* carregado de: classes16.dex */
public final class zzco extends zzeh implements zzfn {
    private static final zzco zzb;
    private int zzd;
    private int zze;
    private String zzf = "";

    static {
        zzco zzcoVar = new zzco();
        zzb = zzcoVar;
        zzeh.zzV(zzco.class, zzcoVar);
    }

    private zzco() {
    }

    public static zzco zzb() {
        return zzb;
    }

    public final String zzc() {
        return this.zzf;
    }

    public final int zzd() {
        int zza = zzcn.zza(this.zze);
        if (zza == 0) {
            return 1;
        }
        return zza;
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzeh
    protected final Object zzg(int i, Object obj, Object obj2) {
        zzce zzceVar = null;
        switch (i - 1) {
            case 0:
                return (byte) 1;
            case 1:
            default:
                return null;
            case 2:
                return zzS(zzb, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001᠌\u0000\u0002ဈ\u0001", new Object[]{"zzd", "zze", zzcm.zza, "zzf"});
            case 3:
                return new zzco();
            case 4:
                return new zzcl(zzceVar);
            case 5:
                return zzb;
        }
    }
}
