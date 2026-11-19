package com.google.android.odml.image;

import android.graphics.Bitmap;

/* compiled from: com.google.android.odml:image@@1.0.0-beta1 */
/* carregado de: classes16.dex */
final /* sintético */ class zzd {
    static final /* sintético */ int[] zza = new int[Bitmap.Config.values().length];

    static {
        try {
            zza[Bitmap.Config.ALPHA_8.ordinal()] = 1;
        } catch (NoSuchFieldError e) {
        }
        try {
            zza[Bitmap.Config.ARGB_8888.ordinal()] = 2;
        } catch (NoSuchFieldError e2) {
        }
    }
}
