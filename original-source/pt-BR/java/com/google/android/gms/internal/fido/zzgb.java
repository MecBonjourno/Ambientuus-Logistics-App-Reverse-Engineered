package com.google.android.gms.internal.fido;

import java.math.RoundingMode;
import java.util.Arrays;
import javax.annotation.CheckForNull;

/* compiled from: com.google.android.gms:play-services-fido@@21.0.0 */
/* carregado de: classes16.dex */
final class zzgb {
    final int zza;
    final int zzb;
    final int zzc;
    final int zzd;
    private final String zze;
    private final char[] zzf;
    private final byte[] zzg;
    private final boolean zzh;

    /* JADX WARN: instruções ilegais antes da chamada do construtor */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    zzgb(java.lang.String r10, char[] r11) {
        /*
            r9 = this;
            r0 = 128(0x80, float:1.8E-43)
            byte[] r1 = new byte[r0]
            r2 = -1
            java.util.Arrays.fill(r1, r2)
            r3 = 0
            r4 = r3
        La:
            int r5 = r11.length
            if (r4 >= r5) goto L2c
            char r5 = r11[r4]
            r6 = 1
            if (r5 >= r0) goto L14
            r7 = r6
            goto L15
        L14:
            r7 = r3
        L15:
            java.lang.String r8 = "Non-ASCII character: %s"
            com.google.android.gms.internal.fido.zzbm.zzd(r7, r8, r5)
            r7 = r1[r5]
            if (r7 != r2) goto L20
            goto L21
        L20:
            r6 = r3
        L21:
            java.lang.String r7 = "Duplicate character: %s"
            com.google.android.gms.internal.fido.zzbm.zzd(r6, r7, r5)
            byte r6 = (byte) r4
            r1[r5] = r6
            int r4 = r4 + 1
            goto La
        L2c:
            r9.<init>(r10, r11, r1, r3)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.fido.zzgb.<init>(java.lang.String, char[]):void");
    }

    public final boolean equals(@CheckForNull Object obj) {
        if (obj instanceof zzgb) {
            zzgb zzgbVar = (zzgb) obj;
            if (this.zzh == zzgbVar.zzh && Arrays.equals(this.zzf, zzgbVar.zzf)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(this.zzf) + (true != this.zzh ? 1237 : 1231);
    }

    public final String toString() {
        return this.zze;
    }

    final char zza(int i) {
        return this.zzf[i];
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    /* JADX WARN: falha na inferência de tipo para: r3v11 */
    final zzgb zzb() {
        int i;
        boolean z;
        int i2 = 0;
        while (true) {
            char[] cArr = this.zzf;
            if (i2 >= cArr.length) {
                return this;
            }
            if (zzba.zza(cArr[i2])) {
                int i3 = 0;
                while (true) {
                    if (i3 >= cArr.length) {
                        z = false;
                        break;
                    }
                    char c = cArr[i3];
                    if (c >= 'A' && c <= 'Z') {
                        z = true;
                        break;
                    }
                    i3++;
                }
                zzbm.zzf(!z, "Cannot call upperCase() on a mixed-case alphabet");
                char[] cArr2 = new char[this.zzf.length];
                int i4 = 0;
                while (true) {
                    char[] cArr3 = this.zzf;
                    if (i4 >= cArr3.length) {
                        break;
                    }
                    char c2 = cArr3[i4];
                    if (zzba.zza(c2)) {
                        c2 ^= 32;
                    }
                    cArr2[i4] = (char) c2;
                    i4++;
                }
                zzgb zzgbVar = new zzgb(this.zze.concat(".upperCase()"), cArr2);
                if (!this.zzh) {
                    return zzgbVar;
                }
                if (zzgbVar.zzh) {
                    return zzgbVar;
                }
                byte[] bArr = zzgbVar.zzg;
                byte[] copyOf = Arrays.copyOf(bArr, bArr.length);
                for (i = 65; i <= 90; i++) {
                    int i5 = i | 32;
                    byte[] bArr2 = zzgbVar.zzg;
                    byte b = bArr2[i];
                    byte b2 = bArr2[i5];
                    if (b == -1) {
                        copyOf[i] = b2;
                    } else {
                        char c3 = (char) i;
                        char c4 = (char) i5;
                        if (b2 != -1) {
                            throw new IllegalStateException(zzbo.zza("Can't ignoreCase() since '%s' and '%s' encode different values", Character.valueOf(c3), Character.valueOf(c4)));
                        }
                        copyOf[i5] = b;
                    }
                }
                return new zzgb(zzgbVar.zze.concat(".ignoreCase()"), zzgbVar.zzf, copyOf, true);
            }
            i2++;
        }
    }

    public final boolean zzc(char c) {
        byte[] bArr = this.zzg;
        return bArr.length > 61 && bArr[61] != -1;
    }

    private zzgb(String str, char[] cArr, byte[] bArr, boolean z) {
        this.zze = str;
        if (cArr != null) {
            this.zzf = cArr;
            try {
                int length = cArr.length;
                int zzb = zzgh.zzb(length, RoundingMode.UNNECESSARY);
                this.zzb = zzb;
                int numberOfTrailingZeros = Integer.numberOfTrailingZeros(zzb);
                int i = 1 << (3 - numberOfTrailingZeros);
                this.zzc = i;
                this.zzd = this.zzb >> numberOfTrailingZeros;
                this.zza = length - 1;
                this.zzg = bArr;
                boolean[] zArr = new boolean[i];
                for (int i2 = 0; i2 < this.zzd; i2++) {
                    zArr[zzgh.zza(i2 * 8, this.zzb, RoundingMode.CEILING)] = true;
                }
                this.zzh = z;
                return;
            } catch (ArithmeticException e) {
                throw new IllegalArgumentException("Illegal alphabet length " + cArr.length, e);
            }
        }
        throw null;
    }
}
