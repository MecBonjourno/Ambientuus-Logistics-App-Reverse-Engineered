package com.google.android.gms.internal.mlkit_vision_barcode_bundled;

import java.io.IOException;
import java.util.Arrays;

/* compiled from: com.google.mlkit:barcode-scanning@@17.3.0 */
/* carregado de: classes16.dex */
public final class zzgt {
    private static final zzgt zza = new zzgt(0, new int[0], new Object[0], false);
    private int zzb;
    private int[] zzc;
    private Object[] zzd;
    private int zze;
    private boolean zzf;

    private zzgt() {
        this(0, new int[8], new Object[8], true);
    }

    private zzgt(int i, int[] iArr, Object[] objArr, boolean z) {
        this.zze = -1;
        this.zzb = i;
        this.zzc = iArr;
        this.zzd = objArr;
        this.zzf = z;
    }

    public static zzgt zzc() {
        return zza;
    }

    static zzgt zze(zzgt zzgtVar, zzgt zzgtVar2) {
        int i = zzgtVar.zzb + zzgtVar2.zzb;
        int[] copyOf = Arrays.copyOf(zzgtVar.zzc, i);
        System.arraycopy(zzgtVar2.zzc, 0, copyOf, zzgtVar.zzb, zzgtVar2.zzb);
        Object[] copyOf2 = Arrays.copyOf(zzgtVar.zzd, i);
        System.arraycopy(zzgtVar2.zzd, 0, copyOf2, zzgtVar.zzb, zzgtVar2.zzb);
        return new zzgt(i, copyOf, copyOf2, true);
    }

    static zzgt zzf() {
        return new zzgt(0, new int[8], new Object[8], true);
    }

    private final void zzm(int i) {
        int[] iArr = this.zzc;
        if (i > iArr.length) {
            int i2 = this.zzb;
            int i3 = i2 + (i2 / 2);
            if (i3 >= i) {
                i = i3;
            }
            if (i < 8) {
                i = 8;
            }
            this.zzc = Arrays.copyOf(iArr, i);
            this.zzd = Arrays.copyOf(this.zzd, i);
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof zzgt)) {
            return false;
        }
        zzgt zzgtVar = (zzgt) obj;
        int i = this.zzb;
        if (i == zzgtVar.zzb) {
            int[] iArr = this.zzc;
            int[] iArr2 = zzgtVar.zzc;
            int i2 = 0;
            while (true) {
                if (i2 >= i) {
                    Object[] objArr = this.zzd;
                    Object[] objArr2 = zzgtVar.zzd;
                    int i3 = this.zzb;
                    for (int i4 = 0; i4 < i3; i4++) {
                        if (objArr[i4].equals(objArr2[i4])) {
                        }
                    }
                    return true;
                }
                if (iArr[i2] != iArr2[i2]) {
                    break;
                }
                i2++;
            }
        }
        return false;
    }

    public final int hashCode() {
        int i = this.zzb;
        int i2 = i + 527;
        int[] iArr = this.zzc;
        int i3 = 17;
        int i4 = 17;
        for (int i5 = 0; i5 < i; i5++) {
            i4 = (i4 * 31) + iArr[i5];
        }
        int i6 = ((i2 * 31) + i4) * 31;
        Object[] objArr = this.zzd;
        int i7 = this.zzb;
        for (int i8 = 0; i8 < i7; i8++) {
            i3 = (i3 * 31) + objArr[i8].hashCode();
        }
        return i6 + i3;
    }

    public final int zza() {
        int zzA;
        int i = this.zze;
        if (i != -1) {
            return i;
        }
        int i2 = 0;
        for (int i3 = 0; i3 < this.zzb; i3++) {
            int i4 = this.zzc[i3];
            int i5 = i4 >>> 3;
            switch (i4 & 7) {
                case 0:
                    zzA = zzdn.zzA(i5 << 3) + zzdn.zzB(((Long) this.zzd[i3]).longValue());
                    break;
                case 1:
                    ((Long) this.zzd[i3]).longValue();
                    zzA = zzdn.zzA(i5 << 3) + 8;
                    break;
                case 2:
                    int i6 = i5 << 3;
                    zzdf zzdfVar = (zzdf) this.zzd[i3];
                    int zzA2 = zzdn.zzA(i6);
                    int zzd = zzdfVar.zzd();
                    zzA = zzA2 + zzdn.zzA(zzd) + zzd;
                    break;
                case 3:
                    int zzA3 = zzdn.zzA(i5 << 3);
                    zzA = zzA3 + zzA3 + ((zzgt) this.zzd[i3]).zza();
                    break;
                case 4:
                default:
                    throw new IllegalStateException(new zzeq("Protocol message tag had invalid wire type."));
                case 5:
                    ((Integer) this.zzd[i3]).intValue();
                    zzA = zzdn.zzA(i5 << 3) + 4;
                    break;
            }
            i2 += zzA;
        }
        this.zze = i2;
        return i2;
    }

    public final int zzb() {
        int i = this.zze;
        if (i != -1) {
            return i;
        }
        int i2 = 0;
        for (int i3 = 0; i3 < this.zzb; i3++) {
            int i4 = this.zzc[i3] >>> 3;
            zzdf zzdfVar = (zzdf) this.zzd[i3];
            int zzA = zzdn.zzA(8);
            int zzA2 = zzdn.zzA(16) + zzdn.zzA(i4);
            int zzA3 = zzdn.zzA(24);
            int zzd = zzdfVar.zzd();
            i2 += zzA + zzA + zzA2 + zzA3 + zzdn.zzA(zzd) + zzd;
        }
        this.zze = i2;
        return i2;
    }

    final zzgt zzd(zzgt zzgtVar) {
        if (zzgtVar.equals(zza)) {
            return this;
        }
        zzg();
        int i = this.zzb + zzgtVar.zzb;
        zzm(i);
        System.arraycopy(zzgtVar.zzc, 0, this.zzc, this.zzb, zzgtVar.zzb);
        System.arraycopy(zzgtVar.zzd, 0, this.zzd, this.zzb, zzgtVar.zzb);
        this.zzb = i;
        return this;
    }

    final void zzg() {
        if (!this.zzf) {
            throw new UnsupportedOperationException();
        }
    }

    public final void zzh() {
        if (this.zzf) {
            this.zzf = false;
        }
    }

    final void zzi(StringBuilder sb, int i) {
        for (int i2 = 0; i2 < this.zzb; i2++) {
            zzfo.zzb(sb, i, String.valueOf(this.zzc[i2] >>> 3), this.zzd[i2]);
        }
    }

    final void zzj(int i, Object obj) {
        zzg();
        zzm(this.zzb + 1);
        int[] iArr = this.zzc;
        int i2 = this.zzb;
        iArr[i2] = i;
        this.zzd[i2] = obj;
        this.zzb = i2 + 1;
    }

    final void zzk(zzhh zzhhVar) throws IOException {
        for (int i = 0; i < this.zzb; i++) {
            zzhhVar.zzw(this.zzc[i] >>> 3, this.zzd[i]);
        }
    }

    public final void zzl(zzhh zzhhVar) throws IOException {
        if (this.zzb != 0) {
            for (int i = 0; i < this.zzb; i++) {
                int i2 = this.zzc[i];
                Object obj = this.zzd[i];
                int i3 = i2 & 7;
                int i4 = i2 >>> 3;
                switch (i3) {
                    case 0:
                        zzhhVar.zzt(i4, ((Long) obj).longValue());
                        break;
                    case 1:
                        zzhhVar.zzm(i4, ((Long) obj).longValue());
                        break;
                    case 2:
                        zzhhVar.zzd(i4, (zzdf) obj);
                        break;
                    case 3:
                        zzhhVar.zzF(i4);
                        ((zzgt) obj).zzl(zzhhVar);
                        zzhhVar.zzh(i4);
                        break;
                    case 4:
                    default:
                        throw new RuntimeException(new zzeq("Protocol message tag had invalid wire type."));
                    case 5:
                        zzhhVar.zzk(i4, ((Integer) obj).intValue());
                        break;
                }
            }
        }
    }
}
