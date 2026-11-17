package com.google.android.gms.internal.fido;

import java.io.IOException;
import javax.annotation.CheckForNull;

/* compiled from: com.google.android.gms:play-services-fido@@21.0.0 */
/* loaded from: classes16.dex */
final class zzgd extends zzge {
    private zzgd(zzgb zzgbVar, @CheckForNull Character ch) {
        super(zzgbVar, ch);
        char[] cArr;
        cArr = zzgbVar.zzf;
        zzbm.zzc(cArr.length == 64);
    }

    @Override // com.google.android.gms.internal.fido.zzge
    final zzgf zza(zzgb zzgbVar, @CheckForNull Character ch) {
        return new zzgd(zzgbVar, ch);
    }

    @Override // com.google.android.gms.internal.fido.zzge, com.google.android.gms.internal.fido.zzgf
    final void zzb(Appendable appendable, byte[] bArr, int i, int i2) throws IOException {
        int i3 = 0;
        zzbm.zze(0, i2, bArr.length);
        for (int i4 = i2; i4 >= 3; i4 -= 3) {
            int i5 = i3 + 1;
            int i6 = bArr[i3] & 255;
            int i7 = bArr[i5] & 255;
            int i8 = i5 + 1;
            int i9 = (i6 << 16) | (i7 << 8) | (bArr[i8] & 255);
            appendable.append(this.zzb.zza(i9 >>> 18));
            appendable.append(this.zzb.zza((i9 >>> 12) & 63));
            appendable.append(this.zzb.zza((i9 >>> 6) & 63));
            appendable.append(this.zzb.zza(i9 & 63));
            i3 = i8 + 1;
        }
        if (i3 < i2) {
            zze(appendable, bArr, i3, i2 - i3);
        }
    }

    zzgd(String str, String str2, @CheckForNull Character ch) {
        this(new zzgb(str, str2.toCharArray()), ch);
    }
}
