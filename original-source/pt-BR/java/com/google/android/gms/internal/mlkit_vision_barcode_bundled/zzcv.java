package com.google.android.gms.internal.mlkit_vision_barcode_bundled;

import com.google.common.base.Ascii;
import java.io.IOException;
import kotlinx.coroutines.scheduling.WorkQueueKt;

/* compiled from: com.google.mlkit:barcode-scanning@@17.3.0 */
/* carregado de: classes16.dex */
final class zzcv {
    public static final /* sintético */ int zza = 0;
    private static volatile int zzb = 100;

    static int zza(byte[] bArr, int i, zzcu zzcuVar) throws zzer {
        int zzj = zzj(bArr, i, zzcuVar);
        int i2 = zzcuVar.zza;
        if (i2 < 0) {
            throw new zzer("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        if (i2 > bArr.length - zzj) {
            throw new zzer("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        if (i2 == 0) {
            zzcuVar.zzc = zzdf.zzb;
            return zzj;
        }
        zzcuVar.zzc = zzdf.zzr(bArr, zzj, i2);
        return zzj + i2;
    }

    static int zzb(int i, byte[] bArr, int i2, int i3, zzed zzedVar, zzef zzefVar, zzgs zzgsVar, zzcu zzcuVar) throws IOException {
        Object obj;
        Object obj2;
        zzdx zzdxVar = zzedVar.zzb;
        zzhf zzhfVar = zzefVar.zzb.zzb;
        Object obj3 = null;
        if (zzhfVar == zzhf.ENUM) {
            zzj(bArr, i2, zzcuVar);
            throw null;
        }
        switch (zzhfVar) {
            case DOUBLE:
                i2 += 8;
                obj3 = Double.valueOf(Double.longBitsToDouble(zzq(bArr, i2)));
                break;
            case FLOAT:
                i2 += 4;
                obj3 = Float.valueOf(Float.intBitsToFloat(zzc(bArr, i2)));
                break;
            case INT64:
            case UINT64:
                i2 = zzm(bArr, i2, zzcuVar);
                obj3 = Long.valueOf(zzcuVar.zzb);
                break;
            case INT32:
            case UINT32:
                i2 = zzj(bArr, i2, zzcuVar);
                obj3 = Integer.valueOf(zzcuVar.zza);
                break;
            case FIXED64:
            case SFIXED64:
                i2 += 8;
                obj3 = Long.valueOf(zzq(bArr, i2));
                break;
            case FIXED32:
            case SFIXED32:
                i2 += 4;
                obj3 = Integer.valueOf(zzc(bArr, i2));
                break;
            case BOOL:
                i2 = zzm(bArr, i2, zzcuVar);
                obj3 = Boolean.valueOf(zzcuVar.zzb != 0);
                break;
            case STRING:
                i2 = zzh(bArr, i2, zzcuVar);
                obj3 = zzcuVar.zzc;
                break;
            case GROUP:
                int i4 = ((i >>> 3) << 3) | 4;
                zzge zzb2 = zzfu.zza().zzb(zzefVar.zza.getClass());
                Object zze = zzdxVar.zze(zzefVar.zzb);
                if (zze == null) {
                    Object zze2 = zzb2.zze();
                    zzdxVar.zzi(zzefVar.zzb, zze2);
                    obj = zze2;
                } else {
                    obj = zze;
                }
                return zzn(obj, zzb2, bArr, i2, i3, i4, zzcuVar);
            case MESSAGE:
                zzge zzb3 = zzfu.zza().zzb(zzefVar.zza.getClass());
                Object zze3 = zzdxVar.zze(zzefVar.zzb);
                if (zze3 == null) {
                    Object zze4 = zzb3.zze();
                    zzdxVar.zzi(zzefVar.zzb, zze4);
                    obj2 = zze4;
                } else {
                    obj2 = zze3;
                }
                return zzo(obj2, zzb3, bArr, i2, i3, zzcuVar);
            case BYTES:
                i2 = zza(bArr, i2, zzcuVar);
                obj3 = zzcuVar.zzc;
                break;
            case ENUM:
                throw new IllegalStateException("Shouldn't reach here.");
            case SINT32:
                i2 = zzj(bArr, i2, zzcuVar);
                obj3 = Integer.valueOf(zzdj.zzb(zzcuVar.zza));
                break;
            case SINT64:
                i2 = zzm(bArr, i2, zzcuVar);
                obj3 = Long.valueOf(zzdj.zzc(zzcuVar.zzb));
                break;
        }
        zzdxVar.zzi(zzefVar.zzb, obj3);
        return i2;
    }

    static int zzc(byte[] bArr, int i) {
        int i2 = bArr[i] & 255;
        int i3 = bArr[i + 1] & 255;
        int i4 = bArr[i + 2] & 255;
        return ((bArr[i + 3] & 255) << 24) | (i3 << 8) | i2 | (i4 << 16);
    }

    static int zzd(zzge zzgeVar, byte[] bArr, int i, int i2, int i3, zzcu zzcuVar) throws IOException {
        Object zze = zzgeVar.zze();
        int zzn = zzn(zze, zzgeVar, bArr, i, i2, i3, zzcuVar);
        zzgeVar.zzf(zze);
        zzcuVar.zzc = zze;
        return zzn;
    }

    static int zze(zzge zzgeVar, byte[] bArr, int i, int i2, zzcu zzcuVar) throws IOException {
        Object zze = zzgeVar.zze();
        int zzo = zzo(zze, zzgeVar, bArr, i, i2, zzcuVar);
        zzgeVar.zzf(zze);
        zzcuVar.zzc = zze;
        return zzo;
    }

    static int zzf(zzge zzgeVar, int i, byte[] bArr, int i2, int i3, zzeo zzeoVar, zzcu zzcuVar) throws IOException {
        int zze = zze(zzgeVar, bArr, i2, i3, zzcuVar);
        zzeoVar.add(zzcuVar.zzc);
        while (zze < i3) {
            int zzj = zzj(bArr, zze, zzcuVar);
            if (i != zzcuVar.zza) {
                break;
            }
            zze = zze(zzgeVar, bArr, zzj, i3, zzcuVar);
            zzeoVar.add(zzcuVar.zzc);
        }
        return zze;
    }

    static int zzg(byte[] bArr, int i, zzeo zzeoVar, zzcu zzcuVar) throws IOException {
        zzei zzeiVar = (zzei) zzeoVar;
        int zzj = zzj(bArr, i, zzcuVar);
        int i2 = zzcuVar.zza + zzj;
        while (zzj < i2) {
            zzj = zzj(bArr, zzj, zzcuVar);
            zzeiVar.zzg(zzcuVar.zza);
        }
        if (zzj == i2) {
            return zzj;
        }
        throw new zzer("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
    }

    static int zzh(byte[] bArr, int i, zzcu zzcuVar) throws zzer {
        int zzj = zzj(bArr, i, zzcuVar);
        int i2 = zzcuVar.zza;
        if (i2 < 0) {
            throw new zzer("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        if (i2 == 0) {
            zzcuVar.zzc = "";
            return zzj;
        }
        zzcuVar.zzc = new String(bArr, zzj, i2, zzep.zza);
        return zzj + i2;
    }

    static int zzi(int i, byte[] bArr, int i2, int i3, zzgt zzgtVar, zzcu zzcuVar) throws zzer {
        int i4;
        zzcu zzcuVar2;
        if ((i >>> 3) == 0) {
            throw new zzer("Protocol message contained an invalid tag (zero).");
        }
        switch (i & 7) {
            case 0:
                int zzm = zzm(bArr, i2, zzcuVar);
                zzgtVar.zzj(i, Long.valueOf(zzcuVar.zzb));
                return zzm;
            case 1:
                zzgtVar.zzj(i, Long.valueOf(zzq(bArr, i2)));
                return i2 + 8;
            case 2:
                int zzj = zzj(bArr, i2, zzcuVar);
                int i5 = zzcuVar.zza;
                if (i5 < 0) {
                    throw new zzer("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
                }
                if (i5 > bArr.length - zzj) {
                    throw new zzer("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                }
                if (i5 == 0) {
                    zzgtVar.zzj(i, zzdf.zzb);
                } else {
                    zzgtVar.zzj(i, zzdf.zzr(bArr, zzj, i5));
                }
                return zzj + i5;
            case 3:
                int i6 = (i & (-8)) | 4;
                zzgt zzf = zzgt.zzf();
                int i7 = zzcuVar.zze + 1;
                zzcuVar.zze = i7;
                zzr(i7);
                int i8 = 0;
                while (true) {
                    if (i2 < i3) {
                        int zzj2 = zzj(bArr, i2, zzcuVar);
                        i8 = zzcuVar.zza;
                        if (i8 == i6) {
                            i4 = i3;
                            zzcuVar2 = zzcuVar;
                            i2 = zzj2;
                        } else {
                            i2 = zzi(i8, bArr, zzj2, i3, zzf, zzcuVar);
                        }
                    } else {
                        i4 = i3;
                        zzcuVar2 = zzcuVar;
                    }
                }
                zzcuVar2.zze--;
                if (i2 > i4 || i8 != i6) {
                    throw new zzer("Failed to parse the message.");
                }
                zzgtVar.zzj(i, zzf);
                return i2;
            case 4:
            default:
                throw new zzer("Protocol message contained an invalid tag (zero).");
            case 5:
                zzgtVar.zzj(i, Integer.valueOf(zzc(bArr, i2)));
                return i2 + 4;
        }
    }

    static int zzj(byte[] bArr, int i, zzcu zzcuVar) {
        int i2 = i + 1;
        byte b = bArr[i];
        if (b < 0) {
            return zzk(b, bArr, i2, zzcuVar);
        }
        zzcuVar.zza = b;
        return i2;
    }

    static int zzk(int i, byte[] bArr, int i2, zzcu zzcuVar) {
        byte b = bArr[i2];
        int i3 = i2 + 1;
        int i4 = i & WorkQueueKt.MASK;
        if (b >= 0) {
            zzcuVar.zza = i4 | (b << 7);
            return i3;
        }
        int i5 = i4 | ((b & Byte.MAX_VALUE) << 7);
        int i6 = i3 + 1;
        byte b2 = bArr[i3];
        if (b2 >= 0) {
            zzcuVar.zza = i5 | (b2 << Ascii.SO);
            return i6;
        }
        int i7 = i5 | ((b2 & Byte.MAX_VALUE) << 14);
        int i8 = i6 + 1;
        byte b3 = bArr[i6];
        if (b3 >= 0) {
            zzcuVar.zza = i7 | (b3 << Ascii.NAK);
            return i8;
        }
        int i9 = i7 | ((b3 & Byte.MAX_VALUE) << 21);
        int i10 = i8 + 1;
        byte b4 = bArr[i8];
        if (b4 >= 0) {
            zzcuVar.zza = i9 | (b4 << Ascii.FS);
            return i10;
        }
        int i11 = i9 | ((b4 & Byte.MAX_VALUE) << 28);
        while (true) {
            int i12 = i10 + 1;
            if (bArr[i10] >= 0) {
                zzcuVar.zza = i11;
                return i12;
            }
            i10 = i12;
        }
    }

    static int zzl(int i, byte[] bArr, int i2, int i3, zzeo zzeoVar, zzcu zzcuVar) {
        zzei zzeiVar = (zzei) zzeoVar;
        int zzj = zzj(bArr, i2, zzcuVar);
        zzeiVar.zzg(zzcuVar.zza);
        while (zzj < i3) {
            int zzj2 = zzj(bArr, zzj, zzcuVar);
            if (i != zzcuVar.zza) {
                break;
            }
            zzj = zzj(bArr, zzj2, zzcuVar);
            zzeiVar.zzg(zzcuVar.zza);
        }
        return zzj;
    }

    static int zzm(byte[] bArr, int i, zzcu zzcuVar) {
        long j = bArr[i];
        int i2 = i + 1;
        if (j >= 0) {
            zzcuVar.zzb = j;
            return i2;
        }
        int i3 = i2 + 1;
        byte b = bArr[i2];
        long j2 = (j & 127) | ((b & Byte.MAX_VALUE) << 7);
        int i4 = 7;
        while (b < 0) {
            int i5 = i3 + 1;
            byte b2 = bArr[i3];
            i4 += 7;
            j2 |= (b2 & Byte.MAX_VALUE) << i4;
            i3 = i5;
            b = b2;
        }
        zzcuVar.zzb = j2;
        return i3;
    }

    static int zzn(Object obj, zzge zzgeVar, byte[] bArr, int i, int i2, int i3, zzcu zzcuVar) throws IOException {
        int i4 = zzcuVar.zze + 1;
        zzcuVar.zze = i4;
        zzr(i4);
        int zzc = ((zzfp) zzgeVar).zzc(obj, bArr, i, i2, i3, zzcuVar);
        zzcuVar.zze--;
        zzcuVar.zzc = obj;
        return zzc;
    }

    static int zzo(Object obj, zzge zzgeVar, byte[] bArr, int i, int i2, zzcu zzcuVar) throws IOException {
        int i3;
        int i4 = i + 1;
        int i5 = bArr[i];
        if (i5 < 0) {
            int zzk = zzk(i5, bArr, i4, zzcuVar);
            i5 = zzcuVar.zza;
            i3 = zzk;
        } else {
            i3 = i4;
        }
        if (i5 < 0 || i5 > i2 - i3) {
            throw new zzer("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        int i6 = zzcuVar.zze + 1;
        zzcuVar.zze = i6;
        zzr(i6);
        int i7 = i3 + i5;
        zzgeVar.zzh(obj, bArr, i3, i7, zzcuVar);
        zzcuVar.zze--;
        zzcuVar.zzc = obj;
        return i7;
    }

    static int zzp(int i, byte[] bArr, int i2, int i3, zzcu zzcuVar) throws zzer {
        if ((i >>> 3) == 0) {
            throw new zzer("Protocol message contained an invalid tag (zero).");
        }
        switch (i & 7) {
            case 0:
                return zzm(bArr, i2, zzcuVar);
            case 1:
                return i2 + 8;
            case 2:
                return zzj(bArr, i2, zzcuVar) + zzcuVar.zza;
            case 3:
                int i4 = (i & (-8)) | 4;
                int i5 = 0;
                while (i2 < i3) {
                    i2 = zzj(bArr, i2, zzcuVar);
                    i5 = zzcuVar.zza;
                    if (i5 == i4) {
                        if (i2 <= i3 || i5 != i4) {
                            throw new zzer("Failed to parse the message.");
                        }
                        return i2;
                    }
                    i2 = zzp(i5, bArr, i2, i3, zzcuVar);
                }
                if (i2 <= i3) {
                }
                throw new zzer("Failed to parse the message.");
            case 4:
            default:
                throw new zzer("Protocol message contained an invalid tag (zero).");
            case 5:
                return i2 + 4;
        }
    }

    static long zzq(byte[] bArr, int i) {
        return (bArr[i] & 255) | ((bArr[i + 1] & 255) << 8) | ((bArr[i + 2] & 255) << 16) | ((bArr[i + 3] & 255) << 24) | ((bArr[i + 4] & 255) << 32) | ((bArr[i + 5] & 255) << 40) | ((bArr[i + 6] & 255) << 48) | ((bArr[i + 7] & 255) << 56);
    }

    private static void zzr(int i) throws zzer {
        if (i >= zzb) {
            throw new zzer("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
    }
}
