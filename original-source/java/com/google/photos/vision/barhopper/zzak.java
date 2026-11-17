package com.google.photos.vision.barhopper;

import com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzeh;
import com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzfn;

/* compiled from: com.google.mlkit:barcode-scanning@@17.3.0 */
/* loaded from: classes16.dex */
public final class zzak extends zzeh implements zzfn {
    private static final zzak zzb;
    private int zzd;
    private byte zzg = 2;
    private String zze = "";
    private String zzf = "";

    static {
        zzak zzakVar = new zzak();
        zzb = zzakVar;
        zzeh.zzV(zzak.class, zzakVar);
    }

    private zzak() {
    }

    public static zzak zzb() {
        return zzb;
    }

    public final String zzc() {
        return this.zze;
    }

    public final String zzd() {
        return this.zzf;
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzeh
    protected final Object zzg(int i, Object obj, Object obj2) {
        zza zzaVar = null;
        switch (i - 1) {
            case 0:
                return Byte.valueOf(this.zzg);
            case 1:
            default:
                this.zzg = obj == null ? (byte) 0 : (byte) 1;
                return null;
            case 2:
                return zzS(zzb, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0001\u0001ဈ\u0000\u0002ᔈ\u0001", new Object[]{"zzd", "zze", "zzf"});
            case 3:
                return new zzak();
            case 4:
                return new zzaj(zzaVar);
            case 5:
                return zzb;
        }
    }
}
