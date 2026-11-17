package com.google.android.odml.image;

import android.graphics.Bitmap;

/* compiled from: com.google.android.odml:image@@1.0.0-beta1 */
/* loaded from: classes16.dex */
final class zze implements zzg {
    private final Bitmap zza;
    private final ImageProperties zzb;

    public zze(Bitmap bitmap) {
        int i;
        this.zza = bitmap;
        zzb zzbVar = new zzb();
        switch (zzd.zza[bitmap.getConfig().ordinal()]) {
            case 1:
                i = 8;
                break;
            case 2:
                i = 1;
                break;
            default:
                i = 0;
                break;
        }
        zzbVar.zza(i);
        zzbVar.zzb(1);
        this.zzb = zzbVar.zzc();
    }

    public final Bitmap zza() {
        return this.zza;
    }

    @Override // com.google.android.odml.image.zzg
    public final ImageProperties zzb() {
        return this.zzb;
    }

    @Override // com.google.android.odml.image.zzg
    public final void zzc() {
        this.zza.recycle();
    }
}
