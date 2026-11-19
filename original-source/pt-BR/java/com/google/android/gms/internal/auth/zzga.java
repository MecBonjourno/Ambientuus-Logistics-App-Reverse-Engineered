package com.google.android.gms.internal.auth;

import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.core.text.HtmlCompat;
import com.coleta.ambientuus.BuildConfig;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.List;
import kotlinx.coroutines.internal.LockFreeTaskQueueCore;
import sun.misc.Unsafe;

/* compiled from: com.google.android.gms:play-services-auth-base@@18.0.10 */
/* carregado de: classes16.dex */
final class zzga<T> implements zzgi<T> {
    private static final int[] zza = new int[0];
    private static final Unsafe zzb = zzhj.zzg();
    private final int[] zzc;
    private final Object[] zzd;
    private final int zze;
    private final int zzf;
    private final zzfx zzg;
    private final int[] zzh;
    private final int zzi;
    private final int zzj;
    private final zzfl zzk;
    private final zzgz zzl;
    private final zzem zzm;
    private final zzgc zzn;
    private final zzfs zzo;

    private zzga(int[] iArr, Object[] objArr, int i, int i2, zzfx zzfxVar, int i3, boolean z, int[] iArr2, int i4, int i5, zzgc zzgcVar, zzfl zzflVar, zzgz zzgzVar, zzem zzemVar, zzfs zzfsVar) {
        this.zzc = iArr;
        this.zzd = objArr;
        this.zze = i;
        this.zzf = i2;
        this.zzh = iArr2;
        this.zzi = i4;
        this.zzj = i5;
        this.zzn = zzgcVar;
        this.zzk = zzflVar;
        this.zzl = zzgzVar;
        this.zzm = zzemVar;
        this.zzg = zzfxVar;
        this.zzo = zzfsVar;
    }

    private final void zzA(Object obj, int i, int i2) {
        zzhj.zzn(obj, zzl(i2) & 1048575, i);
    }

    private final void zzB(Object obj, int i, Object obj2) {
        zzb.putObject(obj, zzo(i) & 1048575, obj2);
        zzz(obj, i);
    }

    private final void zzC(Object obj, int i, int i2, Object obj2) {
        zzb.putObject(obj, zzo(i2) & 1048575, obj2);
        zzA(obj, i, i2);
    }

    private final boolean zzD(Object obj, Object obj2, int i) {
        return zzE(obj, i) == zzE(obj2, i);
    }

    private final boolean zzE(Object obj, int i) {
        int zzl = zzl(i);
        long j = zzl & 1048575;
        if (j != 1048575) {
            return (zzhj.zzc(obj, j) & (1 << (zzl >>> 20))) != 0;
        }
        int zzo = zzo(i);
        long j2 = zzo & 1048575;
        switch (zzn(zzo)) {
            case 0:
                return Double.doubleToRawLongBits(zzhj.zza(obj, j2)) != 0;
            case 1:
                return Float.floatToRawIntBits(zzhj.zzb(obj, j2)) != 0;
            case 2:
                return zzhj.zzd(obj, j2) != 0;
            case 3:
                return zzhj.zzd(obj, j2) != 0;
            case 4:
                return zzhj.zzc(obj, j2) != 0;
            case 5:
                return zzhj.zzd(obj, j2) != 0;
            case 6:
                return zzhj.zzc(obj, j2) != 0;
            case 7:
                return zzhj.zzt(obj, j2);
            case 8:
                Object zzf = zzhj.zzf(obj, j2);
                if (zzf instanceof String) {
                    return !((String) zzf).isEmpty();
                }
                if (zzf instanceof zzef) {
                    return !zzef.zzb.equals(zzf);
                }
                throw new IllegalArgumentException();
            case 9:
                return zzhj.zzf(obj, j2) != null;
            case 10:
                return !zzef.zzb.equals(zzhj.zzf(obj, j2));
            case 11:
                return zzhj.zzc(obj, j2) != 0;
            case 12:
                return zzhj.zzc(obj, j2) != 0;
            case 13:
                return zzhj.zzc(obj, j2) != 0;
            case 14:
                return zzhj.zzd(obj, j2) != 0;
            case 15:
                return zzhj.zzc(obj, j2) != 0;
            case 16:
                return zzhj.zzd(obj, j2) != 0;
            case 17:
                return zzhj.zzf(obj, j2) != null;
            default:
                throw new IllegalArgumentException();
        }
    }

    private final boolean zzF(Object obj, int i, int i2, int i3, int i4) {
        return i2 == 1048575 ? zzE(obj, i) : (i3 & i4) != 0;
    }

    private static boolean zzG(Object obj, int i, zzgi zzgiVar) {
        return zzgiVar.zzi(zzhj.zzf(obj, i & 1048575));
    }

    private static boolean zzH(Object obj) {
        if (obj == null) {
            return false;
        }
        if (obj instanceof zzev) {
            return ((zzev) obj).zzm();
        }
        return true;
    }

    private final boolean zzI(Object obj, int i, int i2) {
        return zzhj.zzc(obj, (long) (zzl(i2) & 1048575)) == i;
    }

    static zzha zzc(Object obj) {
        zzev zzevVar = (zzev) obj;
        zzha zzhaVar = zzevVar.zzc;
        if (zzhaVar != zzha.zza()) {
            return zzhaVar;
        }
        zzha zzd = zzha.zzd();
        zzevVar.zzc = zzd;
        return zzd;
    }

    /* JADX WARN: região duplicada removida para o bloco: B:112:0x03ae  */
    /* JADX WARN: região duplicada removida para o bloco: B:96:0x0350  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static com.google.android.gms.internal.auth.zzga zzj(java.lang.Class r33, com.google.android.gms.internal.auth.zzfu r34, com.google.android.gms.internal.auth.zzgc r35, com.google.android.gms.internal.auth.zzfl r36, com.google.android.gms.internal.auth.zzgz r37, com.google.android.gms.internal.auth.zzem r38, com.google.android.gms.internal.auth.zzfs r39) {
        /*
            Method dump skipped, instructions count: 1068
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.auth.zzga.zzj(java.lang.Class, com.google.android.gms.internal.auth.zzfu, com.google.android.gms.internal.auth.zzgc, com.google.android.gms.internal.auth.zzfl, com.google.android.gms.internal.auth.zzgz, com.google.android.gms.internal.auth.zzem, com.google.android.gms.internal.auth.zzfs):com.google.android.gms.internal.auth.zzga");
    }

    private static int zzk(Object obj, long j) {
        return ((Integer) zzhj.zzf(obj, j)).intValue();
    }

    private final int zzl(int i) {
        return this.zzc[i + 2];
    }

    private final int zzm(int i, int i2) {
        int length = (this.zzc.length / 3) - 1;
        while (i2 <= length) {
            int i3 = (length + i2) >>> 1;
            int i4 = i3 * 3;
            int i5 = this.zzc[i4];
            if (i == i5) {
                return i4;
            }
            if (i < i5) {
                length = i3 - 1;
            } else {
                i2 = i3 + 1;
            }
        }
        return -1;
    }

    private static int zzn(int i) {
        return (i >>> 20) & 255;
    }

    private final int zzo(int i) {
        return this.zzc[i + 1];
    }

    private static long zzp(Object obj, long j) {
        return ((Long) zzhj.zzf(obj, j)).longValue();
    }

    private final zzey zzq(int i) {
        int i2 = i / 3;
        return (zzey) this.zzd[i2 + i2 + 1];
    }

    private final zzgi zzr(int i) {
        int i2 = i / 3;
        int i3 = i2 + i2;
        zzgi zzgiVar = (zzgi) this.zzd[i3];
        if (zzgiVar != null) {
            return zzgiVar;
        }
        zzgi zzb2 = zzgf.zza().zzb((Class) this.zzd[i3 + 1]);
        this.zzd[i3] = zzb2;
        return zzb2;
    }

    private final Object zzs(int i) {
        int i2 = i / 3;
        return this.zzd[i2 + i2];
    }

    private final Object zzt(Object obj, int i) {
        zzgi zzr = zzr(i);
        int zzo = zzo(i) & 1048575;
        if (!zzE(obj, i)) {
            return zzr.zzd();
        }
        Object object = zzb.getObject(obj, zzo);
        if (zzH(object)) {
            return object;
        }
        Object zzd = zzr.zzd();
        if (object != null) {
            zzr.zzf(zzd, object);
        }
        return zzd;
    }

    private final Object zzu(Object obj, int i, int i2) {
        zzgi zzr = zzr(i2);
        if (!zzI(obj, i, i2)) {
            return zzr.zzd();
        }
        Object object = zzb.getObject(obj, zzo(i2) & 1048575);
        if (zzH(object)) {
            return object;
        }
        Object zzd = zzr.zzd();
        if (object != null) {
            zzr.zzf(zzd, object);
        }
        return zzd;
    }

    private static Field zzv(Class cls, String str) {
        try {
            return cls.getDeclaredField(str);
        } catch (NoSuchFieldException e) {
            Field[] declaredFields = cls.getDeclaredFields();
            for (Field field : declaredFields) {
                if (str.equals(field.getName())) {
                    return field;
                }
            }
            throw new RuntimeException("Field " + str + " for " + cls.getName() + " not found. Known fields are " + Arrays.toString(declaredFields));
        }
    }

    private static void zzw(Object obj) {
        if (!zzH(obj)) {
            throw new IllegalArgumentException("Mutating immutable message: ".concat(String.valueOf(String.valueOf(obj))));
        }
    }

    private final void zzx(Object obj, Object obj2, int i) {
        if (zzE(obj2, i)) {
            long zzo = zzo(i) & 1048575;
            Object object = zzb.getObject(obj2, zzo);
            if (object == null) {
                throw new IllegalStateException("Source subfield " + this.zzc[i] + " is present but null: " + obj2.toString());
            }
            zzgi zzr = zzr(i);
            if (!zzE(obj, i)) {
                if (zzH(object)) {
                    Object zzd = zzr.zzd();
                    zzr.zzf(zzd, object);
                    zzb.putObject(obj, zzo, zzd);
                } else {
                    zzb.putObject(obj, zzo, object);
                }
                zzz(obj, i);
                return;
            }
            Object object2 = zzb.getObject(obj, zzo);
            if (!zzH(object2)) {
                Object zzd2 = zzr.zzd();
                zzr.zzf(zzd2, object2);
                zzb.putObject(obj, zzo, zzd2);
                object2 = zzd2;
            }
            zzr.zzf(object2, object);
        }
    }

    private final void zzy(Object obj, Object obj2, int i) {
        int i2 = this.zzc[i];
        if (zzI(obj2, i2, i)) {
            long zzo = zzo(i) & 1048575;
            Object object = zzb.getObject(obj2, zzo);
            if (object == null) {
                throw new IllegalStateException("Source subfield " + this.zzc[i] + " is present but null: " + obj2.toString());
            }
            zzgi zzr = zzr(i);
            if (!zzI(obj, i2, i)) {
                if (zzH(object)) {
                    Object zzd = zzr.zzd();
                    zzr.zzf(zzd, object);
                    zzb.putObject(obj, zzo, zzd);
                } else {
                    zzb.putObject(obj, zzo, object);
                }
                zzA(obj, i2, i);
                return;
            }
            Object object2 = zzb.getObject(obj, zzo);
            if (!zzH(object2)) {
                Object zzd2 = zzr.zzd();
                zzr.zzf(zzd2, object2);
                zzb.putObject(obj, zzo, zzd2);
                object2 = zzd2;
            }
            zzr.zzf(object2, object);
        }
    }

    private final void zzz(Object obj, int i) {
        int zzl = zzl(i);
        long j = 1048575 & zzl;
        if (j == 1048575) {
            return;
        }
        zzhj.zzn(obj, j, (1 << (zzl >>> 20)) | zzhj.zzc(obj, j));
    }

    @Override // com.google.android.gms.internal.auth.zzgi
    public final int zza(Object obj) {
        int length = this.zzc.length;
        int i = 0;
        for (int i2 = 0; i2 < length; i2 += 3) {
            int zzo = zzo(i2);
            int i3 = this.zzc[i2];
            long j = 1048575 & zzo;
            switch (zzn(zzo)) {
                case 0:
                    long doubleToLongBits = Double.doubleToLongBits(zzhj.zza(obj, j));
                    byte[] bArr = zzfa.zzd;
                    i = (i * 53) + ((int) (doubleToLongBits ^ (doubleToLongBits >>> 32)));
                    break;
                case 1:
                    i = (i * 53) + Float.floatToIntBits(zzhj.zzb(obj, j));
                    break;
                case 2:
                    long zzd = zzhj.zzd(obj, j);
                    byte[] bArr2 = zzfa.zzd;
                    i = (i * 53) + ((int) (zzd ^ (zzd >>> 32)));
                    break;
                case 3:
                    long zzd2 = zzhj.zzd(obj, j);
                    byte[] bArr3 = zzfa.zzd;
                    i = (i * 53) + ((int) (zzd2 ^ (zzd2 >>> 32)));
                    break;
                case 4:
                    i = (i * 53) + zzhj.zzc(obj, j);
                    break;
                case 5:
                    long zzd3 = zzhj.zzd(obj, j);
                    byte[] bArr4 = zzfa.zzd;
                    i = (i * 53) + ((int) (zzd3 ^ (zzd3 >>> 32)));
                    break;
                case 6:
                    i = (i * 53) + zzhj.zzc(obj, j);
                    break;
                case 7:
                    i = (i * 53) + zzfa.zza(zzhj.zzt(obj, j));
                    break;
                case 8:
                    i = (i * 53) + ((String) zzhj.zzf(obj, j)).hashCode();
                    break;
                case 9:
                    Object zzf = zzhj.zzf(obj, j);
                    i = (i * 53) + (zzf != null ? zzf.hashCode() : 37);
                    break;
                case 10:
                    i = (i * 53) + zzhj.zzf(obj, j).hashCode();
                    break;
                case 11:
                    i = (i * 53) + zzhj.zzc(obj, j);
                    break;
                case 12:
                    i = (i * 53) + zzhj.zzc(obj, j);
                    break;
                case 13:
                    i = (i * 53) + zzhj.zzc(obj, j);
                    break;
                case 14:
                    long zzd4 = zzhj.zzd(obj, j);
                    byte[] bArr5 = zzfa.zzd;
                    i = (i * 53) + ((int) (zzd4 ^ (zzd4 >>> 32)));
                    break;
                case 15:
                    i = (i * 53) + zzhj.zzc(obj, j);
                    break;
                case 16:
                    long zzd5 = zzhj.zzd(obj, j);
                    byte[] bArr6 = zzfa.zzd;
                    i = (i * 53) + ((int) (zzd5 ^ (zzd5 >>> 32)));
                    break;
                case 17:
                    Object zzf2 = zzhj.zzf(obj, j);
                    i = (i * 53) + (zzf2 != null ? zzf2.hashCode() : 37);
                    break;
                case 18:
                case 19:
                case 20:
                case 21:
                case 22:
                case 23:
                case 24:
                case 25:
                case 26:
                case 27:
                case 28:
                case 29:
                case 30:
                case 31:
                case 32:
                case 33:
                case 34:
                case 35:
                case 36:
                case 37:
                case 38:
                case 39:
                case 40:
                case 41:
                case 42:
                case 43:
                case 44:
                case 45:
                case 46:
                case 47:
                case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE /* 48 */:
                case 49:
                    i = (i * 53) + zzhj.zzf(obj, j).hashCode();
                    break;
                case 50:
                    i = (i * 53) + zzhj.zzf(obj, j).hashCode();
                    break;
                case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_TAG /* 51 */:
                    if (zzI(obj, i3, i2)) {
                        long doubleToLongBits2 = Double.doubleToLongBits(((Double) zzhj.zzf(obj, j)).doubleValue());
                        byte[] bArr7 = zzfa.zzd;
                        i = (i * 53) + ((int) (doubleToLongBits2 ^ (doubleToLongBits2 >>> 32)));
                        break;
                    } else {
                        break;
                    }
                case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_BASELINE_TO_TOP_OF /* 52 */:
                    if (zzI(obj, i3, i2)) {
                        i = (i * 53) + Float.floatToIntBits(((Float) zzhj.zzf(obj, j)).floatValue());
                        break;
                    } else {
                        break;
                    }
                case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_BASELINE_TO_BOTTOM_OF /* 53 */:
                    if (zzI(obj, i3, i2)) {
                        long zzp = zzp(obj, j);
                        byte[] bArr8 = zzfa.zzd;
                        i = (i * 53) + ((int) (zzp ^ (zzp >>> 32)));
                        break;
                    } else {
                        break;
                    }
                case ConstraintLayout.LayoutParams.Table.LAYOUT_MARGIN_BASELINE /* 54 */:
                    if (zzI(obj, i3, i2)) {
                        long zzp2 = zzp(obj, j);
                        byte[] bArr9 = zzfa.zzd;
                        i = (i * 53) + ((int) (zzp2 ^ (zzp2 >>> 32)));
                        break;
                    } else {
                        break;
                    }
                case ConstraintLayout.LayoutParams.Table.LAYOUT_GONE_MARGIN_BASELINE /* 55 */:
                    if (zzI(obj, i3, i2)) {
                        i = (i * 53) + zzk(obj, j);
                        break;
                    } else {
                        break;
                    }
                case 56:
                    if (zzI(obj, i3, i2)) {
                        long zzp3 = zzp(obj, j);
                        byte[] bArr10 = zzfa.zzd;
                        i = (i * 53) + ((int) (zzp3 ^ (zzp3 >>> 32)));
                        break;
                    } else {
                        break;
                    }
                case 57:
                    if (zzI(obj, i3, i2)) {
                        i = (i * 53) + zzk(obj, j);
                        break;
                    } else {
                        break;
                    }
                case 58:
                    if (zzI(obj, i3, i2)) {
                        i = (i * 53) + zzfa.zza(((Boolean) zzhj.zzf(obj, j)).booleanValue());
                        break;
                    } else {
                        break;
                    }
                case BuildConfig.VERSION_CODE /* 59 */:
                    if (zzI(obj, i3, i2)) {
                        i = (i * 53) + ((String) zzhj.zzf(obj, j)).hashCode();
                        break;
                    } else {
                        break;
                    }
                case 60:
                    if (zzI(obj, i3, i2)) {
                        i = (i * 53) + zzhj.zzf(obj, j).hashCode();
                        break;
                    } else {
                        break;
                    }
                case LockFreeTaskQueueCore.CLOSED_SHIFT /* 61 */:
                    if (zzI(obj, i3, i2)) {
                        i = (i * 53) + zzhj.zzf(obj, j).hashCode();
                        break;
                    } else {
                        break;
                    }
                case 62:
                    if (zzI(obj, i3, i2)) {
                        i = (i * 53) + zzk(obj, j);
                        break;
                    } else {
                        break;
                    }
                case HtmlCompat.FROM_HTML_MODE_COMPACT /* 63 */:
                    if (zzI(obj, i3, i2)) {
                        i = (i * 53) + zzk(obj, j);
                        break;
                    } else {
                        break;
                    }
                case 64:
                    if (zzI(obj, i3, i2)) {
                        i = (i * 53) + zzk(obj, j);
                        break;
                    } else {
                        break;
                    }
                case 65:
                    if (zzI(obj, i3, i2)) {
                        long zzp4 = zzp(obj, j);
                        byte[] bArr11 = zzfa.zzd;
                        i = (i * 53) + ((int) (zzp4 ^ (zzp4 >>> 32)));
                        break;
                    } else {
                        break;
                    }
                case ConstraintLayout.LayoutParams.Table.LAYOUT_WRAP_BEHAVIOR_IN_PARENT /* 66 */:
                    if (zzI(obj, i3, i2)) {
                        i = (i * 53) + zzk(obj, j);
                        break;
                    } else {
                        break;
                    }
                case ConstraintLayout.LayoutParams.Table.GUIDELINE_USE_RTL /* 67 */:
                    if (zzI(obj, i3, i2)) {
                        long zzp5 = zzp(obj, j);
                        byte[] bArr12 = zzfa.zzd;
                        i = (i * 53) + ((int) (zzp5 ^ (zzp5 >>> 32)));
                        break;
                    } else {
                        break;
                    }
                case 68:
                    if (zzI(obj, i3, i2)) {
                        i = (i * 53) + zzhj.zzf(obj, j).hashCode();
                        break;
                    } else {
                        break;
                    }
            }
        }
        return (i * 53) + this.zzl.zzb(obj).hashCode();
    }

    /* JADX WARN: Code restructure failed: missing block: B:44:0x0dd4, code lost:
    
        if (r14 == 1048575) goto L568;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x0dd6, code lost:
    
        r29.putInt(r10, r14, r15);
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x0ddc, code lost:
    
        r1 = r33.zzi;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x0de0, code lost:
    
        if (r1 >= r33.zzj) goto L697;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x0de2, code lost:
    
        r2 = r33.zzh[r1];
        r5 = r33.zzc[r2];
        r5 = com.google.android.gms.internal.auth.zzhj.zzf(r10, zzo(r2) & 1048575);
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x0df8, code lost:
    
        if (r5 != null) goto L574;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x0dff, code lost:
    
        if (zzq(r2) != null) goto L698;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x0e04, code lost:
    
        r5 = (com.google.android.gms.internal.auth.zzfr) r5;
        r1 = (com.google.android.gms.internal.auth.zzfq) zzs(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x0e0c, code lost:
    
        throw null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x0e01, code lost:
    
        r1 = r1 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x0e0d, code lost:
    
        if (r7 != 0) goto L584;
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x0e0f, code lost:
    
        if (r3 != r4) goto L582;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x0e16, code lost:
    
        throw com.google.android.gms.internal.auth.zzfb.zzd();
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x0e1b, code lost:
    
        return r3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x0e17, code lost:
    
        if (r3 > r4) goto L587;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x0e19, code lost:
    
        if (r6 != r7) goto L587;
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x0e20, code lost:
    
        throw com.google.android.gms.internal.auth.zzfb.zzd();
     */
    /* JADX WARN: região duplicada removida para o bloco: B:173:0x0ade A[SYNTHETIC] */
    /* JADX WARN: região duplicada removida para o bloco: B:176:0x0af0 A[SYNTHETIC] */
    /* JADX WARN: região duplicada removida para o bloco: B:32:0x0d84 A[SYNTHETIC] */
    /* JADX WARN: região duplicada removida para o bloco: B:36:0x0d97 A[SYNTHETIC] */
    /* JADX WARN: região duplicada removida para o bloco: B:627:0x028d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    final int zzb(java.lang.Object r34, byte[] r35, int r36, int r37, int r38, com.google.android.gms.internal.auth.zzdt r39) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 3762
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.auth.zzga.zzb(java.lang.Object, byte[], int, int, int, com.google.android.gms.internal.auth.zzdt):int");
    }

    @Override // com.google.android.gms.internal.auth.zzgi
    public final Object zzd() {
        return ((zzev) this.zzg).zzc();
    }

    @Override // com.google.android.gms.internal.auth.zzgi
    public final void zze(Object obj) {
        if (zzH(obj)) {
            if (obj instanceof zzev) {
                zzev zzevVar = (zzev) obj;
                zzevVar.zzl(Integer.MAX_VALUE);
                zzevVar.zza = 0;
                zzevVar.zzj();
            }
            int length = this.zzc.length;
            for (int i = 0; i < length; i += 3) {
                int zzo = zzo(i);
                long j = 1048575 & zzo;
                switch (zzn(zzo)) {
                    case 9:
                    case 17:
                        if (zzE(obj, i)) {
                            zzr(i).zze(zzb.getObject(obj, j));
                            break;
                        } else {
                            break;
                        }
                    case 18:
                    case 19:
                    case 20:
                    case 21:
                    case 22:
                    case 23:
                    case 24:
                    case 25:
                    case 26:
                    case 27:
                    case 28:
                    case 29:
                    case 30:
                    case 31:
                    case 32:
                    case 33:
                    case 34:
                    case 35:
                    case 36:
                    case 37:
                    case 38:
                    case 39:
                    case 40:
                    case 41:
                    case 42:
                    case 43:
                    case 44:
                    case 45:
                    case 46:
                    case 47:
                    case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE /* 48 */:
                    case 49:
                        this.zzk.zza(obj, j);
                        break;
                    case 50:
                        Object object = zzb.getObject(obj, j);
                        if (object != null) {
                            Unsafe unsafe = zzb;
                            ((zzfr) object).zzc();
                            unsafe.putObject(obj, j, object);
                            break;
                        } else {
                            break;
                        }
                    case 60:
                    case 68:
                        if (zzI(obj, this.zzc[i], i)) {
                            zzr(i).zze(zzb.getObject(obj, j));
                            break;
                        } else {
                            break;
                        }
                }
            }
            this.zzl.zze(obj);
        }
    }

    @Override // com.google.android.gms.internal.auth.zzgi
    public final void zzf(Object obj, Object obj2) {
        zzw(obj);
        if (obj2 == null) {
            throw null;
        }
        for (int i = 0; i < this.zzc.length; i += 3) {
            int zzo = zzo(i);
            int i2 = this.zzc[i];
            long j = 1048575 & zzo;
            switch (zzn(zzo)) {
                case 0:
                    if (zzE(obj2, i)) {
                        zzhj.zzl(obj, j, zzhj.zza(obj2, j));
                        zzz(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 1:
                    if (zzE(obj2, i)) {
                        zzhj.zzm(obj, j, zzhj.zzb(obj2, j));
                        zzz(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 2:
                    if (zzE(obj2, i)) {
                        zzhj.zzo(obj, j, zzhj.zzd(obj2, j));
                        zzz(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 3:
                    if (zzE(obj2, i)) {
                        zzhj.zzo(obj, j, zzhj.zzd(obj2, j));
                        zzz(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 4:
                    if (zzE(obj2, i)) {
                        zzhj.zzn(obj, j, zzhj.zzc(obj2, j));
                        zzz(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 5:
                    if (zzE(obj2, i)) {
                        zzhj.zzo(obj, j, zzhj.zzd(obj2, j));
                        zzz(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 6:
                    if (zzE(obj2, i)) {
                        zzhj.zzn(obj, j, zzhj.zzc(obj2, j));
                        zzz(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 7:
                    if (zzE(obj2, i)) {
                        zzhj.zzk(obj, j, zzhj.zzt(obj2, j));
                        zzz(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 8:
                    if (zzE(obj2, i)) {
                        zzhj.zzp(obj, j, zzhj.zzf(obj2, j));
                        zzz(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 9:
                    zzx(obj, obj2, i);
                    break;
                case 10:
                    if (zzE(obj2, i)) {
                        zzhj.zzp(obj, j, zzhj.zzf(obj2, j));
                        zzz(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 11:
                    if (zzE(obj2, i)) {
                        zzhj.zzn(obj, j, zzhj.zzc(obj2, j));
                        zzz(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 12:
                    if (zzE(obj2, i)) {
                        zzhj.zzn(obj, j, zzhj.zzc(obj2, j));
                        zzz(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 13:
                    if (zzE(obj2, i)) {
                        zzhj.zzn(obj, j, zzhj.zzc(obj2, j));
                        zzz(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 14:
                    if (zzE(obj2, i)) {
                        zzhj.zzo(obj, j, zzhj.zzd(obj2, j));
                        zzz(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 15:
                    if (zzE(obj2, i)) {
                        zzhj.zzn(obj, j, zzhj.zzc(obj2, j));
                        zzz(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 16:
                    if (zzE(obj2, i)) {
                        zzhj.zzo(obj, j, zzhj.zzd(obj2, j));
                        zzz(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 17:
                    zzx(obj, obj2, i);
                    break;
                case 18:
                case 19:
                case 20:
                case 21:
                case 22:
                case 23:
                case 24:
                case 25:
                case 26:
                case 27:
                case 28:
                case 29:
                case 30:
                case 31:
                case 32:
                case 33:
                case 34:
                case 35:
                case 36:
                case 37:
                case 38:
                case 39:
                case 40:
                case 41:
                case 42:
                case 43:
                case 44:
                case 45:
                case 46:
                case 47:
                case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE /* 48 */:
                case 49:
                    this.zzk.zzb(obj, obj2, j);
                    break;
                case 50:
                    int i3 = zzgk.zza;
                    zzhj.zzp(obj, j, zzfs.zza(zzhj.zzf(obj, j), zzhj.zzf(obj2, j)));
                    break;
                case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_TAG /* 51 */:
                case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_BASELINE_TO_TOP_OF /* 52 */:
                case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_BASELINE_TO_BOTTOM_OF /* 53 */:
                case ConstraintLayout.LayoutParams.Table.LAYOUT_MARGIN_BASELINE /* 54 */:
                case ConstraintLayout.LayoutParams.Table.LAYOUT_GONE_MARGIN_BASELINE /* 55 */:
                case 56:
                case 57:
                case 58:
                case BuildConfig.VERSION_CODE /* 59 */:
                    if (zzI(obj2, i2, i)) {
                        zzhj.zzp(obj, j, zzhj.zzf(obj2, j));
                        zzA(obj, i2, i);
                        break;
                    } else {
                        break;
                    }
                case 60:
                    zzy(obj, obj2, i);
                    break;
                case LockFreeTaskQueueCore.CLOSED_SHIFT /* 61 */:
                case 62:
                case HtmlCompat.FROM_HTML_MODE_COMPACT /* 63 */:
                case 64:
                case 65:
                case ConstraintLayout.LayoutParams.Table.LAYOUT_WRAP_BEHAVIOR_IN_PARENT /* 66 */:
                case ConstraintLayout.LayoutParams.Table.GUIDELINE_USE_RTL /* 67 */:
                    if (zzI(obj2, i2, i)) {
                        zzhj.zzp(obj, j, zzhj.zzf(obj2, j));
                        zzA(obj, i2, i);
                        break;
                    } else {
                        break;
                    }
                case 68:
                    zzy(obj, obj2, i);
                    break;
            }
        }
        zzgk.zzd(this.zzl, obj, obj2);
    }

    @Override // com.google.android.gms.internal.auth.zzgi
    public final void zzg(Object obj, byte[] bArr, int i, int i2, zzdt zzdtVar) throws IOException {
        zzb(obj, bArr, i, i2, 0, zzdtVar);
    }

    @Override // com.google.android.gms.internal.auth.zzgi
    public final boolean zzh(Object obj, Object obj2) {
        boolean zzf;
        int length = this.zzc.length;
        for (int i = 0; i < length; i += 3) {
            int zzo = zzo(i);
            long j = zzo & 1048575;
            switch (zzn(zzo)) {
                case 0:
                    if (zzD(obj, obj2, i) && Double.doubleToLongBits(zzhj.zza(obj, j)) == Double.doubleToLongBits(zzhj.zza(obj2, j))) {
                        continue;
                    }
                    return false;
                case 1:
                    if (zzD(obj, obj2, i) && Float.floatToIntBits(zzhj.zzb(obj, j)) == Float.floatToIntBits(zzhj.zzb(obj2, j))) {
                        continue;
                    }
                    return false;
                case 2:
                    if (zzD(obj, obj2, i) && zzhj.zzd(obj, j) == zzhj.zzd(obj2, j)) {
                        continue;
                    }
                    return false;
                case 3:
                    if (zzD(obj, obj2, i) && zzhj.zzd(obj, j) == zzhj.zzd(obj2, j)) {
                        continue;
                    }
                    return false;
                case 4:
                    if (zzD(obj, obj2, i) && zzhj.zzc(obj, j) == zzhj.zzc(obj2, j)) {
                        continue;
                    }
                    return false;
                case 5:
                    if (zzD(obj, obj2, i) && zzhj.zzd(obj, j) == zzhj.zzd(obj2, j)) {
                        continue;
                    }
                    return false;
                case 6:
                    if (zzD(obj, obj2, i) && zzhj.zzc(obj, j) == zzhj.zzc(obj2, j)) {
                        continue;
                    }
                    return false;
                case 7:
                    if (zzD(obj, obj2, i) && zzhj.zzt(obj, j) == zzhj.zzt(obj2, j)) {
                        continue;
                    }
                    return false;
                case 8:
                    if (zzD(obj, obj2, i) && zzgk.zzf(zzhj.zzf(obj, j), zzhj.zzf(obj2, j))) {
                        continue;
                    }
                    return false;
                case 9:
                    if (zzD(obj, obj2, i) && zzgk.zzf(zzhj.zzf(obj, j), zzhj.zzf(obj2, j))) {
                        continue;
                    }
                    return false;
                case 10:
                    if (zzD(obj, obj2, i) && zzgk.zzf(zzhj.zzf(obj, j), zzhj.zzf(obj2, j))) {
                        continue;
                    }
                    return false;
                case 11:
                    if (zzD(obj, obj2, i) && zzhj.zzc(obj, j) == zzhj.zzc(obj2, j)) {
                        continue;
                    }
                    return false;
                case 12:
                    if (zzD(obj, obj2, i) && zzhj.zzc(obj, j) == zzhj.zzc(obj2, j)) {
                        continue;
                    }
                    return false;
                case 13:
                    if (zzD(obj, obj2, i) && zzhj.zzc(obj, j) == zzhj.zzc(obj2, j)) {
                        continue;
                    }
                    return false;
                case 14:
                    if (zzD(obj, obj2, i) && zzhj.zzd(obj, j) == zzhj.zzd(obj2, j)) {
                        continue;
                    }
                    return false;
                case 15:
                    if (zzD(obj, obj2, i) && zzhj.zzc(obj, j) == zzhj.zzc(obj2, j)) {
                        continue;
                    }
                    return false;
                case 16:
                    if (zzD(obj, obj2, i) && zzhj.zzd(obj, j) == zzhj.zzd(obj2, j)) {
                        continue;
                    }
                    return false;
                case 17:
                    if (zzD(obj, obj2, i) && zzgk.zzf(zzhj.zzf(obj, j), zzhj.zzf(obj2, j))) {
                        continue;
                    }
                    return false;
                case 18:
                case 19:
                case 20:
                case 21:
                case 22:
                case 23:
                case 24:
                case 25:
                case 26:
                case 27:
                case 28:
                case 29:
                case 30:
                case 31:
                case 32:
                case 33:
                case 34:
                case 35:
                case 36:
                case 37:
                case 38:
                case 39:
                case 40:
                case 41:
                case 42:
                case 43:
                case 44:
                case 45:
                case 46:
                case 47:
                case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE /* 48 */:
                case 49:
                    zzf = zzgk.zzf(zzhj.zzf(obj, j), zzhj.zzf(obj2, j));
                    break;
                case 50:
                    zzf = zzgk.zzf(zzhj.zzf(obj, j), zzhj.zzf(obj2, j));
                    break;
                case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_TAG /* 51 */:
                case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_BASELINE_TO_TOP_OF /* 52 */:
                case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_BASELINE_TO_BOTTOM_OF /* 53 */:
                case ConstraintLayout.LayoutParams.Table.LAYOUT_MARGIN_BASELINE /* 54 */:
                case ConstraintLayout.LayoutParams.Table.LAYOUT_GONE_MARGIN_BASELINE /* 55 */:
                case 56:
                case 57:
                case 58:
                case BuildConfig.VERSION_CODE /* 59 */:
                case 60:
                case LockFreeTaskQueueCore.CLOSED_SHIFT /* 61 */:
                case 62:
                case HtmlCompat.FROM_HTML_MODE_COMPACT /* 63 */:
                case 64:
                case 65:
                case ConstraintLayout.LayoutParams.Table.LAYOUT_WRAP_BEHAVIOR_IN_PARENT /* 66 */:
                case ConstraintLayout.LayoutParams.Table.GUIDELINE_USE_RTL /* 67 */:
                case 68:
                    long zzl = zzl(i) & 1048575;
                    if (zzhj.zzc(obj, zzl) == zzhj.zzc(obj2, zzl) && zzgk.zzf(zzhj.zzf(obj, j), zzhj.zzf(obj2, j))) {
                        continue;
                    }
                    return false;
                default:
            }
            if (!zzf) {
                return false;
            }
        }
        return this.zzl.zzb(obj).equals(this.zzl.zzb(obj2));
    }

    @Override // com.google.android.gms.internal.auth.zzgi
    public final boolean zzi(Object obj) {
        int i;
        int i2;
        zzga<T> zzgaVar;
        Object obj2;
        int i3 = 0;
        int i4 = 0;
        int i5 = 1048575;
        while (i3 < this.zzi) {
            int i6 = this.zzh[i3];
            int i7 = this.zzc[i6];
            int zzo = zzo(i6);
            int i8 = this.zzc[i6 + 2];
            int i9 = i8 & 1048575;
            int i10 = 1 << (i8 >>> 20);
            if (i9 == i5) {
                i = i5;
                i2 = i4;
            } else if (i9 != 1048575) {
                i2 = zzb.getInt(obj, i9);
                i = i9;
            } else {
                i2 = i4;
                i = i9;
            }
            if ((268435456 & zzo) != 0) {
                zzgaVar = this;
                obj2 = obj;
                if (!zzgaVar.zzF(obj2, i6, i, i2, i10)) {
                    return false;
                }
            } else {
                zzgaVar = this;
                obj2 = obj;
            }
            switch (zzn(zzo)) {
                case 9:
                case 17:
                    if (zzgaVar.zzF(obj2, i6, i, i2, i10) && !zzG(obj2, zzo, zzr(i6))) {
                        return false;
                    }
                    break;
                case 27:
                case 49:
                    List list = (List) zzhj.zzf(obj2, zzo & 1048575);
                    if (!list.isEmpty()) {
                        zzgi zzr = zzr(i6);
                        for (int i11 = 0; i11 < list.size(); i11++) {
                            if (!zzr.zzi(list.get(i11))) {
                                return false;
                            }
                        }
                        break;
                    } else {
                        continue;
                    }
                case 50:
                    if (!((zzfr) zzhj.zzf(obj2, zzo & 1048575)).isEmpty()) {
                        throw null;
                    }
                    break;
                case 60:
                case 68:
                    if (zzI(obj2, i7, i6) && !zzG(obj2, zzo, zzr(i6))) {
                        return false;
                    }
                    break;
            }
            i3++;
            obj = obj2;
            i5 = i;
            i4 = i2;
        }
        return true;
    }
}
