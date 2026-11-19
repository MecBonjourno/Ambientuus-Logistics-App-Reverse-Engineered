package com.google.android.gms.internal.mlkit_vision_barcode_bundled;

import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.core.text.HtmlCompat;
import com.coleta.ambientuus.BuildConfig;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlinx.coroutines.internal.LockFreeTaskQueueCore;
import sun.misc.Unsafe;

/* compiled from: com.google.mlkit:barcode-scanning@@17.3.0 */
/* carregado de: classes16.dex */
final class zzfp<T> implements zzge<T> {
    private static final int[] zza = new int[0];
    private static final Unsafe zzb = zzgz.zzg();
    private final int[] zzc;
    private final Object[] zzd;
    private final int zze;
    private final int zzf;
    private final zzfm zzg;
    private final boolean zzh;
    private final int[] zzi;
    private final int zzj;
    private final int zzk;
    private final zzgs zzl;
    private final zzdt zzm;

    private zzfp(int[] iArr, Object[] objArr, int i, int i2, zzfm zzfmVar, boolean z, int[] iArr2, int i3, int i4, zzfs zzfsVar, zzez zzezVar, zzgs zzgsVar, zzdt zzdtVar, zzfh zzfhVar) {
        this.zzc = iArr;
        this.zzd = objArr;
        this.zze = i;
        this.zzf = i2;
        boolean z2 = false;
        if (zzdtVar != null && (zzfmVar instanceof zzed)) {
            z2 = true;
        }
        this.zzh = z2;
        this.zzi = iArr2;
        this.zzj = i3;
        this.zzk = i4;
        this.zzl = zzgsVar;
        this.zzm = zzdtVar;
        this.zzg = zzfmVar;
    }

    private static void zzA(Object obj) {
        if (!zzL(obj)) {
            throw new IllegalArgumentException("Mutating immutable message: ".concat(String.valueOf(String.valueOf(obj))));
        }
    }

    private final void zzB(Object obj, Object obj2, int i) {
        if (zzI(obj2, i)) {
            long zzs = zzs(i) & 1048575;
            Object object = zzb.getObject(obj2, zzs);
            if (object == null) {
                throw new IllegalStateException("Source subfield " + this.zzc[i] + " is present but null: " + obj2.toString());
            }
            zzge zzv = zzv(i);
            if (!zzI(obj, i)) {
                if (zzL(object)) {
                    Object zze = zzv.zze();
                    zzv.zzg(zze, object);
                    zzb.putObject(obj, zzs, zze);
                } else {
                    zzb.putObject(obj, zzs, object);
                }
                zzD(obj, i);
                return;
            }
            Object object2 = zzb.getObject(obj, zzs);
            if (!zzL(object2)) {
                Object zze2 = zzv.zze();
                zzv.zzg(zze2, object2);
                zzb.putObject(obj, zzs, zze2);
                object2 = zze2;
            }
            zzv.zzg(object2, object);
        }
    }

    private final void zzC(Object obj, Object obj2, int i) {
        int i2 = this.zzc[i];
        if (zzM(obj2, i2, i)) {
            long zzs = zzs(i) & 1048575;
            Object object = zzb.getObject(obj2, zzs);
            if (object == null) {
                throw new IllegalStateException("Source subfield " + this.zzc[i] + " is present but null: " + obj2.toString());
            }
            zzge zzv = zzv(i);
            if (!zzM(obj, i2, i)) {
                if (zzL(object)) {
                    Object zze = zzv.zze();
                    zzv.zzg(zze, object);
                    zzb.putObject(obj, zzs, zze);
                } else {
                    zzb.putObject(obj, zzs, object);
                }
                zzE(obj, i2, i);
                return;
            }
            Object object2 = zzb.getObject(obj, zzs);
            if (!zzL(object2)) {
                Object zze2 = zzv.zze();
                zzv.zzg(zze2, object2);
                zzb.putObject(obj, zzs, zze2);
                object2 = zze2;
            }
            zzv.zzg(object2, object);
        }
    }

    private final void zzD(Object obj, int i) {
        int zzp = zzp(i);
        long j = 1048575 & zzp;
        if (j == 1048575) {
            return;
        }
        zzgz.zzq(obj, j, (1 << (zzp >>> 20)) | zzgz.zzc(obj, j));
    }

    private final void zzE(Object obj, int i, int i2) {
        zzgz.zzq(obj, zzp(i2) & 1048575, i);
    }

    private final void zzF(Object obj, int i, Object obj2) {
        zzb.putObject(obj, zzs(i) & 1048575, obj2);
        zzD(obj, i);
    }

    private final void zzG(Object obj, int i, int i2, Object obj2) {
        zzb.putObject(obj, zzs(i2) & 1048575, obj2);
        zzE(obj, i, i2);
    }

    private final boolean zzH(Object obj, Object obj2, int i) {
        return zzI(obj, i) == zzI(obj2, i);
    }

    private final boolean zzI(Object obj, int i) {
        int zzp = zzp(i);
        long j = zzp & 1048575;
        if (j != 1048575) {
            return (zzgz.zzc(obj, j) & (1 << (zzp >>> 20))) != 0;
        }
        int zzs = zzs(i);
        long j2 = zzs & 1048575;
        switch (zzr(zzs)) {
            case 0:
                return Double.doubleToRawLongBits(zzgz.zza(obj, j2)) != 0;
            case 1:
                return Float.floatToRawIntBits(zzgz.zzb(obj, j2)) != 0;
            case 2:
                return zzgz.zzd(obj, j2) != 0;
            case 3:
                return zzgz.zzd(obj, j2) != 0;
            case 4:
                return zzgz.zzc(obj, j2) != 0;
            case 5:
                return zzgz.zzd(obj, j2) != 0;
            case 6:
                return zzgz.zzc(obj, j2) != 0;
            case 7:
                return zzgz.zzw(obj, j2);
            case 8:
                Object zzf = zzgz.zzf(obj, j2);
                if (zzf instanceof String) {
                    return !((String) zzf).isEmpty();
                }
                if (zzf instanceof zzdf) {
                    return !zzdf.zzb.equals(zzf);
                }
                throw new IllegalArgumentException();
            case 9:
                return zzgz.zzf(obj, j2) != null;
            case 10:
                return !zzdf.zzb.equals(zzgz.zzf(obj, j2));
            case 11:
                return zzgz.zzc(obj, j2) != 0;
            case 12:
                return zzgz.zzc(obj, j2) != 0;
            case 13:
                return zzgz.zzc(obj, j2) != 0;
            case 14:
                return zzgz.zzd(obj, j2) != 0;
            case 15:
                return zzgz.zzc(obj, j2) != 0;
            case 16:
                return zzgz.zzd(obj, j2) != 0;
            case 17:
                return zzgz.zzf(obj, j2) != null;
            default:
                throw new IllegalArgumentException();
        }
    }

    private final boolean zzJ(Object obj, int i, int i2, int i3, int i4) {
        return i2 == 1048575 ? zzI(obj, i) : (i3 & i4) != 0;
    }

    private static boolean zzK(Object obj, int i, zzge zzgeVar) {
        return zzgeVar.zzk(zzgz.zzf(obj, i & 1048575));
    }

    private static boolean zzL(Object obj) {
        if (obj == null) {
            return false;
        }
        if (obj instanceof zzeh) {
            return ((zzeh) obj).zzY();
        }
        return true;
    }

    private final boolean zzM(Object obj, int i, int i2) {
        return zzgz.zzc(obj, (long) (zzp(i2) & 1048575)) == i;
    }

    private static boolean zzN(Object obj, long j) {
        return ((Boolean) zzgz.zzf(obj, j)).booleanValue();
    }

    private static final void zzO(int i, Object obj, zzhh zzhhVar) throws IOException {
        if (obj instanceof String) {
            zzhhVar.zzG(i, (String) obj);
        } else {
            zzhhVar.zzd(i, (zzdf) obj);
        }
    }

    static zzgt zzd(Object obj) {
        zzeh zzehVar = (zzeh) obj;
        zzgt zzgtVar = zzehVar.zzc;
        if (zzgtVar != zzgt.zzc()) {
            return zzgtVar;
        }
        zzgt zzf = zzgt.zzf();
        zzehVar.zzc = zzf;
        return zzf;
    }

    /* JADX WARN: região duplicada removida para o bloco: B:113:0x03ce  */
    /* JADX WARN: região duplicada removida para o bloco: B:97:0x036e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzfp zzl(java.lang.Class r32, com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzfj r33, com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzfs r34, com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzez r35, com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzgs r36, com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzdt r37, com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzfh r38) {
        /*
            Method dump skipped, instructions count: 1087
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzfp.zzl(java.lang.Class, com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzfj, com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzfs, com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzez, com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzgs, com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzdt, com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzfh):com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzfp");
    }

    private static double zzm(Object obj, long j) {
        return ((Double) zzgz.zzf(obj, j)).doubleValue();
    }

    private static float zzn(Object obj, long j) {
        return ((Float) zzgz.zzf(obj, j)).floatValue();
    }

    private static int zzo(Object obj, long j) {
        return ((Integer) zzgz.zzf(obj, j)).intValue();
    }

    private final int zzp(int i) {
        return this.zzc[i + 2];
    }

    private final int zzq(int i, int i2) {
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

    private static int zzr(int i) {
        return (i >>> 20) & 255;
    }

    private final int zzs(int i) {
        return this.zzc[i + 1];
    }

    private static long zzt(Object obj, long j) {
        return ((Long) zzgz.zzf(obj, j)).longValue();
    }

    private final zzel zzu(int i) {
        int i2 = i / 3;
        return (zzel) this.zzd[i2 + i2 + 1];
    }

    private final zzge zzv(int i) {
        Object[] objArr = this.zzd;
        int i2 = i / 3;
        int i3 = i2 + i2;
        zzge zzgeVar = (zzge) objArr[i3];
        if (zzgeVar != null) {
            return zzgeVar;
        }
        zzge zzb2 = zzfu.zza().zzb((Class) objArr[i3 + 1]);
        this.zzd[i3] = zzb2;
        return zzb2;
    }

    private final Object zzw(int i) {
        int i2 = i / 3;
        return this.zzd[i2 + i2];
    }

    private final Object zzx(Object obj, int i) {
        zzge zzv = zzv(i);
        int zzs = zzs(i) & 1048575;
        if (!zzI(obj, i)) {
            return zzv.zze();
        }
        Object object = zzb.getObject(obj, zzs);
        if (zzL(object)) {
            return object;
        }
        Object zze = zzv.zze();
        if (object != null) {
            zzv.zzg(zze, object);
        }
        return zze;
    }

    private final Object zzy(Object obj, int i, int i2) {
        zzge zzv = zzv(i2);
        if (!zzM(obj, i, i2)) {
            return zzv.zze();
        }
        Object object = zzb.getObject(obj, zzs(i2) & 1048575);
        if (zzL(object)) {
            return object;
        }
        Object zze = zzv.zze();
        if (object != null) {
            zzv.zzg(zze, object);
        }
        return zze;
    }

    private static Field zzz(Class cls, String str) {
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

    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzge
    public final int zza(Object obj) {
        int i;
        int zzA;
        int zzA2;
        int zzA3;
        int i2;
        zzfp<T> zzfpVar = this;
        Object obj2 = obj;
        Unsafe unsafe = zzb;
        int i3 = 1048575;
        int i4 = 0;
        int i5 = 0;
        int i6 = 0;
        int i7 = 1048575;
        while (i4 < zzfpVar.zzc.length) {
            int zzs = zzfpVar.zzs(i4);
            int zzr = zzr(zzs);
            int[] iArr = zzfpVar.zzc;
            int i8 = iArr[i4];
            int i9 = iArr[i4 + 2];
            int i10 = i9 & i3;
            if (zzr <= 17) {
                if (i10 != i7) {
                    i5 = i10 == i3 ? 0 : unsafe.getInt(obj2, i10);
                    i7 = i10;
                }
                i = 1 << (i9 >>> 20);
            } else {
                i = 0;
            }
            int i11 = zzs & i3;
            if (zzr >= zzdy.DOUBLE_LIST_PACKED.zza()) {
                zzdy.SINT64_LIST_PACKED.zza();
            }
            int i12 = i6;
            long j = i11;
            switch (zzr) {
                case 0:
                    zzfpVar = this;
                    if (zzfpVar.zzJ(obj, i4, i7, i5, i)) {
                        i6 = i12 + zzdn.zzA(i8 << 3) + 8;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case 1:
                    if (!zzJ(obj2, i4, i7, i5, i)) {
                        zzfpVar = this;
                        break;
                    } else {
                        i6 = i12 + zzdn.zzA(i8 << 3) + 4;
                        zzfpVar = this;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                case 2:
                    if (!zzJ(obj2, i4, i7, i5, i)) {
                        zzfpVar = this;
                        break;
                    } else {
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzB(unsafe.getLong(obj2, j));
                        zzfpVar = this;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                case 3:
                    if (!zzJ(obj2, i4, i7, i5, i)) {
                        zzfpVar = this;
                        break;
                    } else {
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzB(unsafe.getLong(obj2, j));
                        zzfpVar = this;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                case 4:
                    if (!zzJ(obj, i4, i7, i5, i)) {
                        zzfpVar = this;
                        break;
                    } else {
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzB(unsafe.getInt(obj, j));
                        zzfpVar = this;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                case 5:
                    if (!zzJ(obj, i4, i7, i5, i)) {
                        zzfpVar = this;
                        break;
                    } else {
                        i6 = i12 + zzdn.zzA(i8 << 3) + 8;
                        zzfpVar = this;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                case 6:
                    if (!zzJ(obj, i4, i7, i5, i)) {
                        zzfpVar = this;
                        break;
                    } else {
                        i6 = i12 + zzdn.zzA(i8 << 3) + 4;
                        zzfpVar = this;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                case 7:
                    if (!zzJ(obj2, i4, i7, i5, i)) {
                        zzfpVar = this;
                        break;
                    } else {
                        i6 = i12 + zzdn.zzA(i8 << 3) + 1;
                        zzfpVar = this;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                case 8:
                    if (!zzfpVar.zzJ(obj2, i4, i7, i5, i)) {
                        zzfpVar = this;
                        break;
                    } else {
                        int i13 = i8 << 3;
                        Object object = unsafe.getObject(obj2, j);
                        if (object instanceof zzdf) {
                            int zzA4 = zzdn.zzA(i13);
                            int zzd = ((zzdf) object).zzd();
                            i6 = i12 + zzA4 + zzdn.zzA(zzd) + zzd;
                            zzfpVar = this;
                        } else {
                            i6 = i12 + zzdn.zzA(i13) + zzdn.zzz((String) object);
                            zzfpVar = this;
                        }
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                case 9:
                    zzfpVar = this;
                    if (zzfpVar.zzJ(obj2, i4, i7, i5, i)) {
                        i6 = i12 + zzgg.zzh(i8, unsafe.getObject(obj2, j), zzfpVar.zzv(i4));
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case 10:
                    if (!zzJ(obj2, i4, i7, i5, i)) {
                        zzfpVar = this;
                        break;
                    } else {
                        zzdf zzdfVar = (zzdf) unsafe.getObject(obj2, j);
                        int zzA5 = zzdn.zzA(i8 << 3);
                        int zzd2 = zzdfVar.zzd();
                        i6 = i12 + zzA5 + zzdn.zzA(zzd2) + zzd2;
                        zzfpVar = this;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                case 11:
                    if (!zzJ(obj2, i4, i7, i5, i)) {
                        zzfpVar = this;
                        break;
                    } else {
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzA(unsafe.getInt(obj2, j));
                        zzfpVar = this;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                case 12:
                    if (!zzJ(obj, i4, i7, i5, i)) {
                        zzfpVar = this;
                        break;
                    } else {
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzB(unsafe.getInt(obj, j));
                        zzfpVar = this;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                case 13:
                    if (!zzJ(obj, i4, i7, i5, i)) {
                        zzfpVar = this;
                        break;
                    } else {
                        i6 = i12 + zzdn.zzA(i8 << 3) + 4;
                        zzfpVar = this;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                case 14:
                    if (!zzJ(obj2, i4, i7, i5, i)) {
                        zzfpVar = this;
                        break;
                    } else {
                        i6 = i12 + zzdn.zzA(i8 << 3) + 8;
                        zzfpVar = this;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                case 15:
                    if (!zzJ(obj2, i4, i7, i5, i)) {
                        zzfpVar = this;
                        break;
                    } else {
                        int i14 = unsafe.getInt(obj2, j);
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzA((i14 >> 31) ^ (i14 + i14));
                        zzfpVar = this;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                case 16:
                    if (!zzfpVar.zzJ(obj2, i4, i7, i5, i)) {
                        zzfpVar = this;
                        break;
                    } else {
                        long j2 = unsafe.getLong(obj2, j);
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzB((j2 >> 63) ^ (j2 + j2));
                        zzfpVar = this;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                case 17:
                    if (zzfpVar.zzJ(obj2, i4, i7, i5, i)) {
                        i6 = i12 + zzdn.zzw(i8, (zzfm) unsafe.getObject(obj2, j), zzfpVar.zzv(i4));
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case 18:
                    i6 = i12 + zzgg.zzd(i8, (List) unsafe.getObject(obj2, j), false);
                    continue;
                    i4 += 3;
                    obj2 = obj;
                    i3 = 1048575;
                case 19:
                    i6 = i12 + zzgg.zzb(i8, (List) unsafe.getObject(obj2, j), false);
                    continue;
                    i4 += 3;
                    obj2 = obj;
                    i3 = 1048575;
                case 20:
                    List list = (List) unsafe.getObject(obj2, j);
                    int i15 = zzgg.zza;
                    i6 = (list.size() == 0 ? 0 : zzgg.zzg(list) + (list.size() * zzdn.zzA(i8 << 3))) + i12;
                    continue;
                    i4 += 3;
                    obj2 = obj;
                    i3 = 1048575;
                case 21:
                    List list2 = (List) unsafe.getObject(obj2, j);
                    int i16 = zzgg.zza;
                    int size = list2.size();
                    i6 = i12 + (size == 0 ? 0 : zzgg.zzl(list2) + (size * zzdn.zzA(i8 << 3)));
                    continue;
                    i4 += 3;
                    obj2 = obj;
                    i3 = 1048575;
                case 22:
                    List list3 = (List) unsafe.getObject(obj2, j);
                    int i17 = zzgg.zza;
                    int size2 = list3.size();
                    i6 = i12 + (size2 == 0 ? 0 : zzgg.zzf(list3) + (size2 * zzdn.zzA(i8 << 3)));
                    continue;
                    i4 += 3;
                    obj2 = obj;
                    i3 = 1048575;
                case 23:
                    i6 = i12 + zzgg.zzd(i8, (List) unsafe.getObject(obj2, j), false);
                    continue;
                    i4 += 3;
                    obj2 = obj;
                    i3 = 1048575;
                case 24:
                    i6 = i12 + zzgg.zzb(i8, (List) unsafe.getObject(obj2, j), false);
                    continue;
                    i4 += 3;
                    obj2 = obj;
                    i3 = 1048575;
                case 25:
                    List list4 = (List) unsafe.getObject(obj2, j);
                    int i18 = zzgg.zza;
                    int size3 = list4.size();
                    i6 = i12 + (size3 == 0 ? 0 : size3 * (zzdn.zzA(i8 << 3) + 1));
                    continue;
                    i4 += 3;
                    obj2 = obj;
                    i3 = 1048575;
                case 26:
                    List list5 = (List) unsafe.getObject(obj2, j);
                    int i19 = zzgg.zza;
                    int size4 = list5.size();
                    if (size4 == 0) {
                        zzA = 0;
                    } else {
                        zzA = zzdn.zzA(i8 << 3) * size4;
                        if (list5 instanceof zzey) {
                            zzey zzeyVar = (zzey) list5;
                            for (int i20 = 0; i20 < size4; i20++) {
                                Object zza2 = zzeyVar.zza();
                                if (zza2 instanceof zzdf) {
                                    int zzd3 = ((zzdf) zza2).zzd();
                                    zzA += zzdn.zzA(zzd3) + zzd3;
                                } else {
                                    zzA += zzdn.zzz((String) zza2);
                                }
                            }
                        } else {
                            for (int i21 = 0; i21 < size4; i21++) {
                                Object obj3 = list5.get(i21);
                                if (obj3 instanceof zzdf) {
                                    int zzd4 = ((zzdf) obj3).zzd();
                                    zzA += zzdn.zzA(zzd4) + zzd4;
                                } else {
                                    zzA += zzdn.zzz((String) obj3);
                                }
                            }
                        }
                    }
                    i6 = zzA + i12;
                    continue;
                    i4 += 3;
                    obj2 = obj;
                    i3 = 1048575;
                case 27:
                    List list6 = (List) unsafe.getObject(obj2, j);
                    zzge zzv = zzfpVar.zzv(i4);
                    int i22 = zzgg.zza;
                    int size5 = list6.size();
                    if (size5 == 0) {
                        zzA2 = 0;
                    } else {
                        zzA2 = zzdn.zzA(i8 << 3) * size5;
                        for (int i23 = 0; i23 < size5; i23++) {
                            Object obj4 = list6.get(i23);
                            if (obj4 instanceof zzex) {
                                int zza3 = ((zzex) obj4).zza();
                                zzA2 += zzdn.zzA(zza3) + zza3;
                            } else {
                                zzA2 += zzdn.zzy((zzfm) obj4, zzv);
                            }
                        }
                    }
                    i6 = i12 + zzA2;
                    continue;
                    i4 += 3;
                    obj2 = obj;
                    i3 = 1048575;
                case 28:
                    List list7 = (List) unsafe.getObject(obj2, j);
                    int i24 = zzgg.zza;
                    int size6 = list7.size();
                    if (size6 == 0) {
                        zzA3 = 0;
                    } else {
                        zzA3 = size6 * zzdn.zzA(i8 << 3);
                        for (int i25 = 0; i25 < list7.size(); i25++) {
                            int zzd5 = ((zzdf) list7.get(i25)).zzd();
                            zzA3 += zzdn.zzA(zzd5) + zzd5;
                        }
                    }
                    i6 = i12 + zzA3;
                    continue;
                    i4 += 3;
                    obj2 = obj;
                    i3 = 1048575;
                case 29:
                    List list8 = (List) unsafe.getObject(obj2, j);
                    int i26 = zzgg.zza;
                    int size7 = list8.size();
                    i6 = i12 + (size7 == 0 ? 0 : zzgg.zzk(list8) + (size7 * zzdn.zzA(i8 << 3)));
                    continue;
                    i4 += 3;
                    obj2 = obj;
                    i3 = 1048575;
                case 30:
                    List list9 = (List) unsafe.getObject(obj2, j);
                    int i27 = zzgg.zza;
                    int size8 = list9.size();
                    i6 = i12 + (size8 == 0 ? 0 : zzgg.zza(list9) + (size8 * zzdn.zzA(i8 << 3)));
                    continue;
                    i4 += 3;
                    obj2 = obj;
                    i3 = 1048575;
                case 31:
                    i6 = i12 + zzgg.zzb(i8, (List) unsafe.getObject(obj2, j), false);
                    continue;
                    i4 += 3;
                    obj2 = obj;
                    i3 = 1048575;
                case 32:
                    i6 = i12 + zzgg.zzd(i8, (List) unsafe.getObject(obj2, j), false);
                    continue;
                    i4 += 3;
                    obj2 = obj;
                    i3 = 1048575;
                case 33:
                    List list10 = (List) unsafe.getObject(obj2, j);
                    int i28 = zzgg.zza;
                    int size9 = list10.size();
                    i6 = i12 + (size9 == 0 ? 0 : zzgg.zzi(list10) + (size9 * zzdn.zzA(i8 << 3)));
                    continue;
                    i4 += 3;
                    obj2 = obj;
                    i3 = 1048575;
                case 34:
                    List list11 = (List) unsafe.getObject(obj2, j);
                    int i29 = zzgg.zza;
                    int size10 = list11.size();
                    i6 = i12 + (size10 == 0 ? 0 : zzgg.zzj(list11) + (size10 * zzdn.zzA(i8 << 3)));
                    continue;
                    i4 += 3;
                    obj2 = obj;
                    i3 = 1048575;
                case 35:
                    int zze = zzgg.zze((List) unsafe.getObject(obj2, j));
                    if (zze > 0) {
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzA(zze) + zze;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case 36:
                    int zzc = zzgg.zzc((List) unsafe.getObject(obj2, j));
                    if (zzc > 0) {
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzA(zzc) + zzc;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case 37:
                    int zzg = zzgg.zzg((List) unsafe.getObject(obj2, j));
                    if (zzg > 0) {
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzA(zzg) + zzg;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case 38:
                    int zzl = zzgg.zzl((List) unsafe.getObject(obj2, j));
                    if (zzl > 0) {
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzA(zzl) + zzl;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case 39:
                    int zzf = zzgg.zzf((List) unsafe.getObject(obj2, j));
                    if (zzf > 0) {
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzA(zzf) + zzf;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case 40:
                    int zze2 = zzgg.zze((List) unsafe.getObject(obj2, j));
                    if (zze2 > 0) {
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzA(zze2) + zze2;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case 41:
                    int zzc2 = zzgg.zzc((List) unsafe.getObject(obj2, j));
                    if (zzc2 > 0) {
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzA(zzc2) + zzc2;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case 42:
                    List list12 = (List) unsafe.getObject(obj2, j);
                    int i30 = zzgg.zza;
                    int size11 = list12.size();
                    if (size11 > 0) {
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzA(size11) + size11;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case 43:
                    int zzk = zzgg.zzk((List) unsafe.getObject(obj2, j));
                    if (zzk > 0) {
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzA(zzk) + zzk;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case 44:
                    int zza4 = zzgg.zza((List) unsafe.getObject(obj2, j));
                    if (zza4 > 0) {
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzA(zza4) + zza4;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case 45:
                    int zzc3 = zzgg.zzc((List) unsafe.getObject(obj2, j));
                    if (zzc3 > 0) {
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzA(zzc3) + zzc3;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case 46:
                    int zze3 = zzgg.zze((List) unsafe.getObject(obj2, j));
                    if (zze3 > 0) {
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzA(zze3) + zze3;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case 47:
                    int zzi = zzgg.zzi((List) unsafe.getObject(obj2, j));
                    if (zzi > 0) {
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzA(zzi) + zzi;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE /* 48 */:
                    int zzj = zzgg.zzj((List) unsafe.getObject(obj2, j));
                    if (zzj > 0) {
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzA(zzj) + zzj;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case 49:
                    List list13 = (List) unsafe.getObject(obj2, j);
                    zzge zzv2 = zzfpVar.zzv(i4);
                    int i31 = zzgg.zza;
                    int size12 = list13.size();
                    if (size12 == 0) {
                        i2 = 0;
                    } else {
                        i2 = 0;
                        for (int i32 = 0; i32 < size12; i32++) {
                            i2 += zzdn.zzw(i8, (zzfm) list13.get(i32), zzv2);
                        }
                    }
                    i6 = i12 + i2;
                    continue;
                    i4 += 3;
                    obj2 = obj;
                    i3 = 1048575;
                case 50:
                    zzfg zzfgVar = (zzfg) unsafe.getObject(obj2, j);
                    if (!zzfgVar.isEmpty()) {
                        Iterator it = zzfgVar.entrySet().iterator();
                        if (it.hasNext()) {
                            Map.Entry entry = (Map.Entry) it.next();
                            entry.getKey();
                            entry.getValue();
                            throw null;
                        }
                    }
                    break;
                case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_TAG /* 51 */:
                    if (zzfpVar.zzM(obj2, i8, i4)) {
                        i6 = i12 + zzdn.zzA(i8 << 3) + 8;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_BASELINE_TO_TOP_OF /* 52 */:
                    if (zzfpVar.zzM(obj2, i8, i4)) {
                        i6 = i12 + zzdn.zzA(i8 << 3) + 4;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_BASELINE_TO_BOTTOM_OF /* 53 */:
                    if (zzfpVar.zzM(obj2, i8, i4)) {
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzB(zzt(obj2, j));
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case ConstraintLayout.LayoutParams.Table.LAYOUT_MARGIN_BASELINE /* 54 */:
                    if (zzfpVar.zzM(obj2, i8, i4)) {
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzB(zzt(obj2, j));
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case ConstraintLayout.LayoutParams.Table.LAYOUT_GONE_MARGIN_BASELINE /* 55 */:
                    if (zzfpVar.zzM(obj2, i8, i4)) {
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzB(zzo(obj2, j));
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case 56:
                    if (zzfpVar.zzM(obj2, i8, i4)) {
                        i6 = i12 + zzdn.zzA(i8 << 3) + 8;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case 57:
                    if (zzfpVar.zzM(obj2, i8, i4)) {
                        i6 = i12 + zzdn.zzA(i8 << 3) + 4;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case 58:
                    if (zzfpVar.zzM(obj2, i8, i4)) {
                        i6 = i12 + zzdn.zzA(i8 << 3) + 1;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case BuildConfig.VERSION_CODE /* 59 */:
                    if (zzfpVar.zzM(obj2, i8, i4)) {
                        int i33 = i8 << 3;
                        Object object2 = unsafe.getObject(obj2, j);
                        if (object2 instanceof zzdf) {
                            int zzA6 = zzdn.zzA(i33);
                            int zzd6 = ((zzdf) object2).zzd();
                            i6 = i12 + zzA6 + zzdn.zzA(zzd6) + zzd6;
                        } else {
                            i6 = i12 + zzdn.zzA(i33) + zzdn.zzz((String) object2);
                        }
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case 60:
                    if (zzfpVar.zzM(obj2, i8, i4)) {
                        i6 = i12 + zzgg.zzh(i8, unsafe.getObject(obj2, j), zzfpVar.zzv(i4));
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case LockFreeTaskQueueCore.CLOSED_SHIFT /* 61 */:
                    if (zzfpVar.zzM(obj2, i8, i4)) {
                        zzdf zzdfVar2 = (zzdf) unsafe.getObject(obj2, j);
                        int zzA7 = zzdn.zzA(i8 << 3);
                        int zzd7 = zzdfVar2.zzd();
                        i6 = i12 + zzA7 + zzdn.zzA(zzd7) + zzd7;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case 62:
                    if (zzfpVar.zzM(obj2, i8, i4)) {
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzA(zzo(obj2, j));
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case HtmlCompat.FROM_HTML_MODE_COMPACT /* 63 */:
                    if (zzfpVar.zzM(obj2, i8, i4)) {
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzB(zzo(obj2, j));
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case 64:
                    if (zzfpVar.zzM(obj2, i8, i4)) {
                        i6 = i12 + zzdn.zzA(i8 << 3) + 4;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case 65:
                    if (zzfpVar.zzM(obj2, i8, i4)) {
                        i6 = i12 + zzdn.zzA(i8 << 3) + 8;
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case ConstraintLayout.LayoutParams.Table.LAYOUT_WRAP_BEHAVIOR_IN_PARENT /* 66 */:
                    if (zzfpVar.zzM(obj2, i8, i4)) {
                        int zzo = zzo(obj2, j);
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzA((zzo >> 31) ^ (zzo + zzo));
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case ConstraintLayout.LayoutParams.Table.GUIDELINE_USE_RTL /* 67 */:
                    if (zzfpVar.zzM(obj2, i8, i4)) {
                        long zzt = zzt(obj2, j);
                        i6 = i12 + zzdn.zzA(i8 << 3) + zzdn.zzB((zzt >> 63) ^ (zzt + zzt));
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
                case 68:
                    if (zzfpVar.zzM(obj2, i8, i4)) {
                        i6 = i12 + zzdn.zzw(i8, (zzfm) unsafe.getObject(obj2, j), zzfpVar.zzv(i4));
                        i4 += 3;
                        obj2 = obj;
                        i3 = 1048575;
                    }
                    break;
            }
            i6 = i12;
            i4 += 3;
            obj2 = obj;
            i3 = 1048575;
        }
        int zza5 = i6 + ((zzeh) obj).zzc.zza();
        if (!zzfpVar.zzh) {
            return zza5;
        }
        zzdx zzdxVar = ((zzed) obj).zzb;
        int zzc4 = zzdxVar.zza.zzc();
        int i34 = 0;
        for (int i35 = 0; i35 < zzc4; i35++) {
            Map.Entry zzg2 = zzdxVar.zza.zzg(i35);
            i34 += zzdx.zza((zzdw) ((zzgi) zzg2).zza(), zzg2.getValue());
        }
        for (Map.Entry entry2 : zzdxVar.zza.zzd()) {
            i34 += zzdx.zza((zzdw) entry2.getKey(), entry2.getValue());
        }
        return zza5 + i34;
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzge
    public final int zzb(Object obj) {
        int i = 0;
        for (int i2 = 0; i2 < this.zzc.length; i2 += 3) {
            int zzs = zzs(i2);
            int[] iArr = this.zzc;
            int i3 = 1048575 & zzs;
            int zzr = zzr(zzs);
            int i4 = iArr[i2];
            long j = i3;
            switch (zzr) {
                case 0:
                    long doubleToLongBits = Double.doubleToLongBits(zzgz.zza(obj, j));
                    byte[] bArr = zzep.zzb;
                    i = (i * 53) + ((int) (doubleToLongBits ^ (doubleToLongBits >>> 32)));
                    break;
                case 1:
                    i = (i * 53) + Float.floatToIntBits(zzgz.zzb(obj, j));
                    break;
                case 2:
                    long zzd = zzgz.zzd(obj, j);
                    byte[] bArr2 = zzep.zzb;
                    i = (i * 53) + ((int) (zzd ^ (zzd >>> 32)));
                    break;
                case 3:
                    long zzd2 = zzgz.zzd(obj, j);
                    byte[] bArr3 = zzep.zzb;
                    i = (i * 53) + ((int) (zzd2 ^ (zzd2 >>> 32)));
                    break;
                case 4:
                    i = (i * 53) + zzgz.zzc(obj, j);
                    break;
                case 5:
                    long zzd3 = zzgz.zzd(obj, j);
                    byte[] bArr4 = zzep.zzb;
                    i = (i * 53) + ((int) (zzd3 ^ (zzd3 >>> 32)));
                    break;
                case 6:
                    i = (i * 53) + zzgz.zzc(obj, j);
                    break;
                case 7:
                    i = (i * 53) + zzep.zza(zzgz.zzw(obj, j));
                    break;
                case 8:
                    i = (i * 53) + ((String) zzgz.zzf(obj, j)).hashCode();
                    break;
                case 9:
                    int i5 = i * 53;
                    Object zzf = zzgz.zzf(obj, j);
                    i = i5 + (zzf != null ? zzf.hashCode() : 37);
                    break;
                case 10:
                    i = (i * 53) + zzgz.zzf(obj, j).hashCode();
                    break;
                case 11:
                    i = (i * 53) + zzgz.zzc(obj, j);
                    break;
                case 12:
                    i = (i * 53) + zzgz.zzc(obj, j);
                    break;
                case 13:
                    i = (i * 53) + zzgz.zzc(obj, j);
                    break;
                case 14:
                    long zzd4 = zzgz.zzd(obj, j);
                    byte[] bArr5 = zzep.zzb;
                    i = (i * 53) + ((int) (zzd4 ^ (zzd4 >>> 32)));
                    break;
                case 15:
                    i = (i * 53) + zzgz.zzc(obj, j);
                    break;
                case 16:
                    long zzd5 = zzgz.zzd(obj, j);
                    byte[] bArr6 = zzep.zzb;
                    i = (i * 53) + ((int) (zzd5 ^ (zzd5 >>> 32)));
                    break;
                case 17:
                    int i6 = i * 53;
                    Object zzf2 = zzgz.zzf(obj, j);
                    i = i6 + (zzf2 != null ? zzf2.hashCode() : 37);
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
                    i = (i * 53) + zzgz.zzf(obj, j).hashCode();
                    break;
                case 50:
                    i = (i * 53) + zzgz.zzf(obj, j).hashCode();
                    break;
                case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_TAG /* 51 */:
                    if (zzM(obj, i4, i2)) {
                        long doubleToLongBits2 = Double.doubleToLongBits(zzm(obj, j));
                        byte[] bArr7 = zzep.zzb;
                        i = (i * 53) + ((int) (doubleToLongBits2 ^ (doubleToLongBits2 >>> 32)));
                        break;
                    } else {
                        break;
                    }
                case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_BASELINE_TO_TOP_OF /* 52 */:
                    if (zzM(obj, i4, i2)) {
                        i = (i * 53) + Float.floatToIntBits(zzn(obj, j));
                        break;
                    } else {
                        break;
                    }
                case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_BASELINE_TO_BOTTOM_OF /* 53 */:
                    if (zzM(obj, i4, i2)) {
                        long zzt = zzt(obj, j);
                        byte[] bArr8 = zzep.zzb;
                        i = (i * 53) + ((int) (zzt ^ (zzt >>> 32)));
                        break;
                    } else {
                        break;
                    }
                case ConstraintLayout.LayoutParams.Table.LAYOUT_MARGIN_BASELINE /* 54 */:
                    if (zzM(obj, i4, i2)) {
                        long zzt2 = zzt(obj, j);
                        byte[] bArr9 = zzep.zzb;
                        i = (i * 53) + ((int) (zzt2 ^ (zzt2 >>> 32)));
                        break;
                    } else {
                        break;
                    }
                case ConstraintLayout.LayoutParams.Table.LAYOUT_GONE_MARGIN_BASELINE /* 55 */:
                    if (zzM(obj, i4, i2)) {
                        i = (i * 53) + zzo(obj, j);
                        break;
                    } else {
                        break;
                    }
                case 56:
                    if (zzM(obj, i4, i2)) {
                        long zzt3 = zzt(obj, j);
                        byte[] bArr10 = zzep.zzb;
                        i = (i * 53) + ((int) (zzt3 ^ (zzt3 >>> 32)));
                        break;
                    } else {
                        break;
                    }
                case 57:
                    if (zzM(obj, i4, i2)) {
                        i = (i * 53) + zzo(obj, j);
                        break;
                    } else {
                        break;
                    }
                case 58:
                    if (zzM(obj, i4, i2)) {
                        i = (i * 53) + zzep.zza(zzN(obj, j));
                        break;
                    } else {
                        break;
                    }
                case BuildConfig.VERSION_CODE /* 59 */:
                    if (zzM(obj, i4, i2)) {
                        i = (i * 53) + ((String) zzgz.zzf(obj, j)).hashCode();
                        break;
                    } else {
                        break;
                    }
                case 60:
                    if (zzM(obj, i4, i2)) {
                        i = (i * 53) + zzgz.zzf(obj, j).hashCode();
                        break;
                    } else {
                        break;
                    }
                case LockFreeTaskQueueCore.CLOSED_SHIFT /* 61 */:
                    if (zzM(obj, i4, i2)) {
                        i = (i * 53) + zzgz.zzf(obj, j).hashCode();
                        break;
                    } else {
                        break;
                    }
                case 62:
                    if (zzM(obj, i4, i2)) {
                        i = (i * 53) + zzo(obj, j);
                        break;
                    } else {
                        break;
                    }
                case HtmlCompat.FROM_HTML_MODE_COMPACT /* 63 */:
                    if (zzM(obj, i4, i2)) {
                        i = (i * 53) + zzo(obj, j);
                        break;
                    } else {
                        break;
                    }
                case 64:
                    if (zzM(obj, i4, i2)) {
                        i = (i * 53) + zzo(obj, j);
                        break;
                    } else {
                        break;
                    }
                case 65:
                    if (zzM(obj, i4, i2)) {
                        long zzt4 = zzt(obj, j);
                        byte[] bArr11 = zzep.zzb;
                        i = (i * 53) + ((int) (zzt4 ^ (zzt4 >>> 32)));
                        break;
                    } else {
                        break;
                    }
                case ConstraintLayout.LayoutParams.Table.LAYOUT_WRAP_BEHAVIOR_IN_PARENT /* 66 */:
                    if (zzM(obj, i4, i2)) {
                        i = (i * 53) + zzo(obj, j);
                        break;
                    } else {
                        break;
                    }
                case ConstraintLayout.LayoutParams.Table.GUIDELINE_USE_RTL /* 67 */:
                    if (zzM(obj, i4, i2)) {
                        long zzt5 = zzt(obj, j);
                        byte[] bArr12 = zzep.zzb;
                        i = (i * 53) + ((int) (zzt5 ^ (zzt5 >>> 32)));
                        break;
                    } else {
                        break;
                    }
                case 68:
                    if (zzM(obj, i4, i2)) {
                        i = (i * 53) + zzgz.zzf(obj, j).hashCode();
                        break;
                    } else {
                        break;
                    }
            }
        }
        int hashCode = (i * 53) + ((zzeh) obj).zzc.hashCode();
        return this.zzh ? (hashCode * 53) + ((zzed) obj).zzb.zza.hashCode() : hashCode;
    }

    /* JADX WARN: Code restructure failed: missing block: B:44:0x0e45, code lost:
    
        if (r14 == 1048575) goto L572;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x0e47, code lost:
    
        r24.putInt(r10, r14, r15);
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x0e4d, code lost:
    
        r1 = r36.zzj;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x0e51, code lost:
    
        if (r1 >= r36.zzk) goto L702;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x0e53, code lost:
    
        r2 = r36.zzi;
        r5 = r36.zzc;
        r2 = r2[r1];
        r5 = r5[r2];
        r5 = com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzgz.zzf(r10, zzs(r2) & 1048575);
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x0e69, code lost:
    
        if (r5 != null) goto L578;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x0e70, code lost:
    
        if (zzu(r2) != null) goto L701;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x0e79, code lost:
    
        r5 = (com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzfg) r5;
        r1 = (com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzff) zzw(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x0e81, code lost:
    
        throw null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x0e72, code lost:
    
        r2 = (com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzgt) null;
        r1 = r1 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x0e85, code lost:
    
        if (r11 != 0) goto L589;
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x0e87, code lost:
    
        if (r3 != r4) goto L587;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x0e8f, code lost:
    
        throw new com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzer("Failed to parse the message.");
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x0e94, code lost:
    
        return r3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x0e90, code lost:
    
        if (r3 > r4) goto L592;
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x0e92, code lost:
    
        if (r6 != r11) goto L592;
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x0e9a, code lost:
    
        throw new com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzer("Failed to parse the message.");
     */
    /* JADX WARN: região duplicada removida para o bloco: B:182:0x0b24 A[SYNTHETIC] */
    /* JADX WARN: região duplicada removida para o bloco: B:185:0x0b37 A[SYNTHETIC] */
    /* JADX WARN: região duplicada removida para o bloco: B:32:0x0db4 A[SYNTHETIC] */
    /* JADX WARN: região duplicada removida para o bloco: B:36:0x0dc7 A[SYNTHETIC] */
    /* JADX WARN: região duplicada removida para o bloco: B:630:0x0286  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    final int zzc(java.lang.Object r37, byte[] r38, int r39, int r40, int r41, com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzcu r42) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 3884
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzfp.zzc(java.lang.Object, byte[], int, int, int, com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzcu):int");
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzge
    public final Object zze() {
        return ((zzeh) this.zzg).zzK();
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzge
    public final void zzf(Object obj) {
        if (zzL(obj)) {
            if (obj instanceof zzeh) {
                zzeh zzehVar = (zzeh) obj;
                zzehVar.zzW(Integer.MAX_VALUE);
                zzehVar.zza = 0;
                zzehVar.zzU();
            }
            int[] iArr = this.zzc;
            for (int i = 0; i < iArr.length; i += 3) {
                int zzs = zzs(i);
                long j = 1048575 & zzs;
                switch (zzr(zzs)) {
                    case 9:
                    case 17:
                        if (zzI(obj, i)) {
                            zzv(i).zzf(zzb.getObject(obj, j));
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
                        ((zzeo) zzgz.zzf(obj, j)).zzb();
                        break;
                    case 50:
                        Object object = zzb.getObject(obj, j);
                        if (object != null) {
                            Unsafe unsafe = zzb;
                            ((zzfg) object).zzc();
                            unsafe.putObject(obj, j, object);
                            break;
                        } else {
                            break;
                        }
                    case 60:
                    case 68:
                        if (zzM(obj, this.zzc[i], i)) {
                            zzv(i).zzf(zzb.getObject(obj, j));
                            break;
                        } else {
                            break;
                        }
                }
            }
            this.zzl.zza(obj);
            if (this.zzh) {
                this.zzm.zza(obj);
            }
        }
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzge
    public final void zzg(Object obj, Object obj2) {
        zzA(obj);
        if (obj2 == null) {
            throw null;
        }
        for (int i = 0; i < this.zzc.length; i += 3) {
            int zzs = zzs(i);
            int i2 = 1048575 & zzs;
            int[] iArr = this.zzc;
            int zzr = zzr(zzs);
            int i3 = iArr[i];
            long j = i2;
            switch (zzr) {
                case 0:
                    if (zzI(obj2, i)) {
                        zzgz.zzo(obj, j, zzgz.zza(obj2, j));
                        zzD(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 1:
                    if (zzI(obj2, i)) {
                        zzgz.zzp(obj, j, zzgz.zzb(obj2, j));
                        zzD(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 2:
                    if (zzI(obj2, i)) {
                        zzgz.zzr(obj, j, zzgz.zzd(obj2, j));
                        zzD(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 3:
                    if (zzI(obj2, i)) {
                        zzgz.zzr(obj, j, zzgz.zzd(obj2, j));
                        zzD(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 4:
                    if (zzI(obj2, i)) {
                        zzgz.zzq(obj, j, zzgz.zzc(obj2, j));
                        zzD(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 5:
                    if (zzI(obj2, i)) {
                        zzgz.zzr(obj, j, zzgz.zzd(obj2, j));
                        zzD(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 6:
                    if (zzI(obj2, i)) {
                        zzgz.zzq(obj, j, zzgz.zzc(obj2, j));
                        zzD(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 7:
                    if (zzI(obj2, i)) {
                        zzgz.zzm(obj, j, zzgz.zzw(obj2, j));
                        zzD(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 8:
                    if (zzI(obj2, i)) {
                        zzgz.zzs(obj, j, zzgz.zzf(obj2, j));
                        zzD(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 9:
                    zzB(obj, obj2, i);
                    break;
                case 10:
                    if (zzI(obj2, i)) {
                        zzgz.zzs(obj, j, zzgz.zzf(obj2, j));
                        zzD(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 11:
                    if (zzI(obj2, i)) {
                        zzgz.zzq(obj, j, zzgz.zzc(obj2, j));
                        zzD(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 12:
                    if (zzI(obj2, i)) {
                        zzgz.zzq(obj, j, zzgz.zzc(obj2, j));
                        zzD(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 13:
                    if (zzI(obj2, i)) {
                        zzgz.zzq(obj, j, zzgz.zzc(obj2, j));
                        zzD(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 14:
                    if (zzI(obj2, i)) {
                        zzgz.zzr(obj, j, zzgz.zzd(obj2, j));
                        zzD(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 15:
                    if (zzI(obj2, i)) {
                        zzgz.zzq(obj, j, zzgz.zzc(obj2, j));
                        zzD(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 16:
                    if (zzI(obj2, i)) {
                        zzgz.zzr(obj, j, zzgz.zzd(obj2, j));
                        zzD(obj, i);
                        break;
                    } else {
                        break;
                    }
                case 17:
                    zzB(obj, obj2, i);
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
                    zzeo zzeoVar = (zzeo) zzgz.zzf(obj, j);
                    zzeo zzeoVar2 = (zzeo) zzgz.zzf(obj2, j);
                    int size = zzeoVar.size();
                    int size2 = zzeoVar2.size();
                    if (size > 0 && size2 > 0) {
                        if (!zzeoVar.zzc()) {
                            zzeoVar = zzeoVar.zzd(size2 + size);
                        }
                        zzeoVar.addAll(zzeoVar2);
                    }
                    if (size > 0) {
                        zzeoVar2 = zzeoVar;
                    }
                    zzgz.zzs(obj, j, zzeoVar2);
                    break;
                case 50:
                    int i4 = zzgg.zza;
                    zzgz.zzs(obj, j, zzfh.zza(zzgz.zzf(obj, j), zzgz.zzf(obj2, j)));
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
                    if (zzM(obj2, i3, i)) {
                        zzgz.zzs(obj, j, zzgz.zzf(obj2, j));
                        zzE(obj, i3, i);
                        break;
                    } else {
                        break;
                    }
                case 60:
                    zzC(obj, obj2, i);
                    break;
                case LockFreeTaskQueueCore.CLOSED_SHIFT /* 61 */:
                case 62:
                case HtmlCompat.FROM_HTML_MODE_COMPACT /* 63 */:
                case 64:
                case 65:
                case ConstraintLayout.LayoutParams.Table.LAYOUT_WRAP_BEHAVIOR_IN_PARENT /* 66 */:
                case ConstraintLayout.LayoutParams.Table.GUIDELINE_USE_RTL /* 67 */:
                    if (zzM(obj2, i3, i)) {
                        zzgz.zzs(obj, j, zzgz.zzf(obj2, j));
                        zzE(obj, i3, i);
                        break;
                    } else {
                        break;
                    }
                case 68:
                    zzC(obj, obj2, i);
                    break;
            }
        }
        zzgg.zzp(this.zzl, obj, obj2);
        if (this.zzh) {
            zzgg.zzo(this.zzm, obj, obj2);
        }
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzge
    public final void zzh(Object obj, byte[] bArr, int i, int i2, zzcu zzcuVar) throws IOException {
        zzc(obj, bArr, i, i2, 0, zzcuVar);
    }

    /* JADX WARN: região duplicada removida para o bloco: B:370:0x0616  */
    /* JADX WARN: região duplicada removida para o bloco: B:9:0x0031  */
    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzge
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void zzi(java.lang.Object r20, com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzhh r21) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 1734
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzfp.zzi(java.lang.Object, com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzhh):void");
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzge
    public final boolean zzj(Object obj, Object obj2) {
        boolean zzE;
        for (int i = 0; i < this.zzc.length; i += 3) {
            int zzs = zzs(i);
            long j = zzs & 1048575;
            switch (zzr(zzs)) {
                case 0:
                    if (zzH(obj, obj2, i) && Double.doubleToLongBits(zzgz.zza(obj, j)) == Double.doubleToLongBits(zzgz.zza(obj2, j))) {
                        continue;
                    }
                    return false;
                case 1:
                    if (zzH(obj, obj2, i) && Float.floatToIntBits(zzgz.zzb(obj, j)) == Float.floatToIntBits(zzgz.zzb(obj2, j))) {
                        continue;
                    }
                    return false;
                case 2:
                    if (zzH(obj, obj2, i) && zzgz.zzd(obj, j) == zzgz.zzd(obj2, j)) {
                        continue;
                    }
                    return false;
                case 3:
                    if (zzH(obj, obj2, i) && zzgz.zzd(obj, j) == zzgz.zzd(obj2, j)) {
                        continue;
                    }
                    return false;
                case 4:
                    if (zzH(obj, obj2, i) && zzgz.zzc(obj, j) == zzgz.zzc(obj2, j)) {
                        continue;
                    }
                    return false;
                case 5:
                    if (zzH(obj, obj2, i) && zzgz.zzd(obj, j) == zzgz.zzd(obj2, j)) {
                        continue;
                    }
                    return false;
                case 6:
                    if (zzH(obj, obj2, i) && zzgz.zzc(obj, j) == zzgz.zzc(obj2, j)) {
                        continue;
                    }
                    return false;
                case 7:
                    if (zzH(obj, obj2, i) && zzgz.zzw(obj, j) == zzgz.zzw(obj2, j)) {
                        continue;
                    }
                    return false;
                case 8:
                    if (zzH(obj, obj2, i) && zzgg.zzE(zzgz.zzf(obj, j), zzgz.zzf(obj2, j))) {
                        continue;
                    }
                    return false;
                case 9:
                    if (zzH(obj, obj2, i) && zzgg.zzE(zzgz.zzf(obj, j), zzgz.zzf(obj2, j))) {
                        continue;
                    }
                    return false;
                case 10:
                    if (zzH(obj, obj2, i) && zzgg.zzE(zzgz.zzf(obj, j), zzgz.zzf(obj2, j))) {
                        continue;
                    }
                    return false;
                case 11:
                    if (zzH(obj, obj2, i) && zzgz.zzc(obj, j) == zzgz.zzc(obj2, j)) {
                        continue;
                    }
                    return false;
                case 12:
                    if (zzH(obj, obj2, i) && zzgz.zzc(obj, j) == zzgz.zzc(obj2, j)) {
                        continue;
                    }
                    return false;
                case 13:
                    if (zzH(obj, obj2, i) && zzgz.zzc(obj, j) == zzgz.zzc(obj2, j)) {
                        continue;
                    }
                    return false;
                case 14:
                    if (zzH(obj, obj2, i) && zzgz.zzd(obj, j) == zzgz.zzd(obj2, j)) {
                        continue;
                    }
                    return false;
                case 15:
                    if (zzH(obj, obj2, i) && zzgz.zzc(obj, j) == zzgz.zzc(obj2, j)) {
                        continue;
                    }
                    return false;
                case 16:
                    if (zzH(obj, obj2, i) && zzgz.zzd(obj, j) == zzgz.zzd(obj2, j)) {
                        continue;
                    }
                    return false;
                case 17:
                    if (zzH(obj, obj2, i) && zzgg.zzE(zzgz.zzf(obj, j), zzgz.zzf(obj2, j))) {
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
                    zzE = zzgg.zzE(zzgz.zzf(obj, j), zzgz.zzf(obj2, j));
                    break;
                case 50:
                    zzE = zzgg.zzE(zzgz.zzf(obj, j), zzgz.zzf(obj2, j));
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
                    long zzp = zzp(i) & 1048575;
                    if (zzgz.zzc(obj, zzp) == zzgz.zzc(obj2, zzp) && zzgg.zzE(zzgz.zzf(obj, j), zzgz.zzf(obj2, j))) {
                        continue;
                    }
                    return false;
                default:
            }
            if (!zzE) {
                return false;
            }
        }
        if (!((zzeh) obj).zzc.equals(((zzeh) obj2).zzc)) {
            return false;
        }
        if (this.zzh) {
            return ((zzed) obj).zzb.equals(((zzed) obj2).zzb);
        }
        return true;
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzge
    public final boolean zzk(Object obj) {
        int i;
        int i2;
        zzfp<T> zzfpVar;
        Object obj2;
        int i3 = 0;
        int i4 = 0;
        int i5 = 1048575;
        while (i3 < this.zzj) {
            int[] iArr = this.zzi;
            int[] iArr2 = this.zzc;
            int i6 = iArr[i3];
            int i7 = iArr2[i6];
            int zzs = zzs(i6);
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
            if ((268435456 & zzs) != 0) {
                zzfpVar = this;
                obj2 = obj;
                if (!zzfpVar.zzJ(obj2, i6, i, i2, i10)) {
                    return false;
                }
            } else {
                zzfpVar = this;
                obj2 = obj;
            }
            switch (zzr(zzs)) {
                case 9:
                case 17:
                    if (zzfpVar.zzJ(obj2, i6, i, i2, i10) && !zzK(obj2, zzs, zzv(i6))) {
                        return false;
                    }
                    break;
                case 27:
                case 49:
                    List list = (List) zzgz.zzf(obj2, zzs & 1048575);
                    if (!list.isEmpty()) {
                        zzge zzv = zzv(i6);
                        for (int i11 = 0; i11 < list.size(); i11++) {
                            if (!zzv.zzk(list.get(i11))) {
                                return false;
                            }
                        }
                        break;
                    } else {
                        continue;
                    }
                case 50:
                    if (!((zzfg) zzgz.zzf(obj2, zzs & 1048575)).isEmpty()) {
                        throw null;
                    }
                    break;
                case 60:
                case 68:
                    if (zzM(obj2, i7, i6) && !zzK(obj2, zzs, zzv(i6))) {
                        return false;
                    }
                    break;
            }
            i3++;
            obj = obj2;
            i5 = i;
            i4 = i2;
        }
        return !this.zzh || ((zzed) obj).zzb.zzk();
    }
}
