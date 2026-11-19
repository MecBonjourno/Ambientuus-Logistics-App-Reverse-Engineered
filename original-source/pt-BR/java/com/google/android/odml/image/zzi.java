package com.google.android.odml.image;

import android.media.Image;

/* compiled from: com.google.android.odml:image@@1.0.0-beta1 */
/* carregado de: classes16.dex */
final class zzi implements zzg {
    private final Image zza;
    private final ImageProperties zzb;

    public zzi(Image image) {
        int i;
        this.zza = image;
        zzb zzbVar = new zzb();
        zzbVar.zzb(3);
        int format = image.getFormat();
        if (format != 42) {
            if (format != 41) {
                switch (format) {
                    case 35:
                        i = 7;
                        break;
                    case 256:
                        i = 9;
                        break;
                    default:
                        i = 0;
                        break;
                }
            } else {
                i = 2;
            }
        } else {
            i = 1;
        }
        zzbVar.zza(i);
        this.zzb = zzbVar.zzc();
    }

    public final Image zza() {
        return this.zza;
    }

    @Override // com.google.android.odml.image.zzg
    public final ImageProperties zzb() {
        return this.zzb;
    }

    @Override // com.google.android.odml.image.zzg
    public final void zzc() {
        this.zza.close();
    }
}
