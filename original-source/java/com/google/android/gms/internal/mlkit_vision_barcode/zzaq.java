package com.google.android.gms.internal.mlkit_vision_barcode;

import android.os.SystemClock;
import org.chromium.base.TimeUtils;

/* compiled from: com.google.android.gms:play-services-mlkit-barcode-scanning@@18.3.1 */
/* loaded from: classes16.dex */
final class zzaq extends zzbb {
    zzaq() {
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode.zzbb
    public final long zza() {
        return SystemClock.elapsedRealtime() * TimeUtils.NANOSECONDS_PER_MILLISECOND;
    }
}
