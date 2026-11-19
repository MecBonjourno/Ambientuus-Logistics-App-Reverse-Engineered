package com.google.android.odml.image;

import java.nio.ByteBuffer;

/* compiled from: com.google.android.odml:image@@1.0.0-beta1 */
/* carregado de: classes16.dex */
public class ByteBufferExtractor {
    private ByteBufferExtractor() {
    }

    public static ByteBuffer extract(MlImage image) {
        zzg zza = image.zza();
        switch (zza.zzb().getStorageType()) {
            case 2:
                return ((zzf) zza).zza().asReadOnlyBuffer();
            default:
                throw new IllegalArgumentException("Extract ByteBuffer from an MlImage created by objects other than Bytebuffer is not supported");
        }
    }
}
