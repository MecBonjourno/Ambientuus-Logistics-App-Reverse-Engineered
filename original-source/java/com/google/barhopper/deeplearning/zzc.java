package com.google.barhopper.deeplearning;

import com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzeh;
import com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzem;
import com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzfn;

/* compiled from: com.google.mlkit:barcode-scanning@@17.3.0 */
/* loaded from: classes16.dex */
public final class zzc extends zzeh implements zzfn {
    private static final zzc zzb;
    private int zzd;
    private zzem zze = zzM();
    private zzem zzf = zzM();
    private int zzg;
    private int zzh;
    private int zzi;
    private int zzj;

    static {
        zzc zzcVar = new zzc();
        zzb = zzcVar;
        zzeh.zzV(zzc.class, zzcVar);
    }

    private zzc() {
    }

    public static zzb zza() {
        return (zzb) zzb.zzG();
    }

    static /* synthetic */ void zzc(zzc zzcVar, int i) {
        zzcVar.zzd |= 2;
        zzcVar.zzh = i;
    }

    static /* synthetic */ void zzd(zzc zzcVar, float f) {
        zzem zzemVar = zzcVar.zze;
        if (!zzemVar.zzc()) {
            zzcVar.zze = zzeh.zzN(zzemVar);
        }
        zzcVar.zze.zzh(f);
    }

    static /* synthetic */ void zze(zzc zzcVar, float f) {
        zzem zzemVar = zzcVar.zzf;
        if (!zzemVar.zzc()) {
            zzcVar.zzf = zzeh.zzN(zzemVar);
        }
        zzcVar.zzf.zzh(f);
    }

    static /* synthetic */ void zzf(zzc zzcVar, int i) {
        zzcVar.zzd |= 1;
        zzcVar.zzg = i;
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzeh
    protected final Object zzg(int i, Object obj, Object obj2) {
        zza zzaVar = null;
        switch (i - 1) {
            case 0:
                return (byte) 1;
            case 1:
            default:
                return null;
            case 2:
                return zzS(zzb, "\u0004\u0006\u0000\u0001\u0001\u0006\u0006\u0000\u0002\u0000\u0001\u0013\u0002\u0013\u0003ဋ\u0000\u0004ဋ\u0001\u0005ဋ\u0002\u0006ဋ\u0003", new Object[]{"zzd", "zze", "zzf", "zzg", "zzh", "zzi", "zzj"});
            case 3:
                return new zzc();
            case 4:
                return new zzb(zzaVar);
            case 5:
                return zzb;
        }
    }
}
