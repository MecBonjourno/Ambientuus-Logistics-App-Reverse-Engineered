package com.google.android.gms.internal.mlkit_vision_barcode;

import android.os.SystemClock;

/* compiled from: com.google.android.gms:play-services-mlkit-barcode-scanning@@18.3.1 */
/* carregado de: classes16.dex */
public final class zzar {
    private static final zzbb zza;

    static {
        zzbb zzaqVar;
        try {
            SystemClock.elapsedRealtimeNanos();
            zzaqVar = new zzap();
        } catch (Throwable th) {
            SystemClock.elapsedRealtime();
            zzaqVar = new zzaq();
        }
        zza = zzaqVar;
    }

    public static zzbb zza() {
        return zza;
    }
}
