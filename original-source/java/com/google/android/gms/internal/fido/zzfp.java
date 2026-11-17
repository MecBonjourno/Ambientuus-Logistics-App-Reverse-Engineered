package com.google.android.gms.internal.fido;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/* compiled from: com.google.android.gms:play-services-fido@@21.0.0 */
/* loaded from: classes16.dex */
abstract class zzfp extends zzfr {
    private final ByteBuffer zza = ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN);

    zzfp() {
    }

    protected void zzb(byte[] bArr, int i, int i2) {
        throw null;
    }

    @Override // com.google.android.gms.internal.fido.zzfr, com.google.android.gms.internal.fido.zzfv
    public final zzfv zza(byte[] bArr) {
        if (bArr == null) {
            throw null;
        }
        zzb(bArr, 0, bArr.length);
        return this;
    }
}
