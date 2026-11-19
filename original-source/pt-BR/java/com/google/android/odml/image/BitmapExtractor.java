package com.google.android.odml.image;

import android.graphics.Bitmap;

/* compiled from: com.google.android.odml:image@@1.0.0-beta1 */
/* carregado de: classes16.dex */
public final class BitmapExtractor {
    private BitmapExtractor() {
    }

    public static Bitmap extract(MlImage image) {
        zzg zza = image.zza();
        switch (zza.zzb().getStorageType()) {
            case 1:
                return ((zze) zza).zza();
            default:
                throw new IllegalArgumentException("Extracting Bitmap from an MlImage created by objects other than Bitmap is not supported");
        }
    }
}
