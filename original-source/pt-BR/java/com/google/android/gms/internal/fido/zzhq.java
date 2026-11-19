package com.google.android.gms.internal.fido;

import android.support.v4.media.session.PlaybackStateCompat;
import java.io.IOException;
import java.io.InputStream;
import java.util.TreeMap;
import org.chromium.net.NetError;

/* compiled from: com.google.android.gms:play-services-fido@@21.0.0 */
/* carregado de: classes16.dex */
final class zzhq {
    static final zzhp zza(InputStream inputStream, zzhs zzhsVar) throws zzhj {
        try {
            return zzb(inputStream, zzhsVar);
        } finally {
            try {
                zzhsVar.close();
            } catch (IOException e) {
            }
        }
    }

    private static final zzhp zzb(InputStream inputStream, zzhs zzhsVar) throws zzhj {
        try {
            zzhr zzd = zzhsVar.zzd();
            if (zzd == null) {
                throw new zzhj("Parser being asked to parse an empty input stream");
            }
            try {
                byte zza = zzd.zza();
                int i = 0;
                switch (zzd.zzb()) {
                    case Byte.MIN_VALUE:
                        long zza2 = zzhsVar.zza();
                        if (zza2 > 1000) {
                            throw new zzhj("Parser being asked to read a large CBOR array");
                        }
                        zzc(zza, zza2, inputStream, zzhsVar);
                        zzhp[] zzhpVarArr = new zzhp[(int) zza2];
                        while (i < zza2) {
                            zzhpVarArr[i] = zzb(inputStream, zzhsVar);
                            i++;
                        }
                        return new zzhg(zzcc.zzi(zzhpVarArr));
                    case -96:
                        long zzc = zzhsVar.zzc();
                        if (zzc > 1000) {
                            throw new zzhj("Parser being asked to read a large CBOR map");
                        }
                        zzc(zza, zzc, inputStream, zzhsVar);
                        int i2 = (int) zzc;
                        zzhl[] zzhlVarArr = new zzhl[i2];
                        zzhp zzhpVar = null;
                        int i3 = 0;
                        while (i3 < zzc) {
                            zzhp zzb = zzb(inputStream, zzhsVar);
                            if (zzhpVar != null && zzb.compareTo(zzhpVar) <= 0) {
                                throw new zzhf(String.format("Keys in CBOR Map not in strictly ascending natural order:\nPrevious key: %s\nCurrent key: %s", zzhpVar.toString(), zzb.toString()));
                            }
                            zzhlVarArr[i3] = new zzhl(zzb, zzb(inputStream, zzhsVar));
                            i3++;
                            zzhpVar = zzb;
                        }
                        TreeMap treeMap = new TreeMap();
                        while (i < i2) {
                            zzhl zzhlVar = zzhlVarArr[i];
                            if (treeMap.containsKey(zzhlVar.zza())) {
                                throw new zzhf("Attempted to add duplicate key to canonical CBOR Map.");
                            }
                            treeMap.put(zzhlVar.zza(), zzhlVar.zzb());
                            i++;
                        }
                        return new zzhm(zzcj.zzf(treeMap));
                    case -64:
                        throw new zzhj("Tags are currently unsupported");
                    case NetError.ERR_BLOCKED_BY_ORB /* -32 */:
                        return new zzhh(zzhsVar.zzf());
                    case 0:
                    case 32:
                        long zzb2 = zzhsVar.zzb();
                        zzc(zza, zzb2 > 0 ? zzb2 : ~zzb2, inputStream, zzhsVar);
                        return new zzhk(zzb2);
                    case 64:
                        byte[] zzg = zzhsVar.zzg();
                        int length = zzg.length;
                        zzc(zza, length, inputStream, zzhsVar);
                        return new zzhi(zzgx.zzl(zzg, 0, length));
                    case 96:
                        String zze = zzhsVar.zze();
                        zzc(zza, zze.length(), inputStream, zzhsVar);
                        return new zzhn(zze);
                    default:
                        throw new zzhj("Unidentifiable major type: " + zzd.zzc());
                }
            } catch (IOException | RuntimeException e) {
                throw new zzhj("Error in decoding CborValue from bytes", e);
            }
        } catch (IOException e2) {
            throw new zzhj("Error in decoding CborValue from bytes", e2);
        }
    }

    private static final void zzc(byte b, long j, InputStream inputStream, zzhs zzhsVar) throws IOException {
        switch (b) {
            case 24:
                if (j >= 24) {
                    return;
                }
                throw new zzhf("Integer value " + j + " after add info could have been represented in 0 additional bytes, but used 1");
            case 25:
                if (j >= 256) {
                    return;
                }
                throw new zzhf("Integer value " + j + " after add info could have been represented in 0-1 additional bytes, but used 2");
            case 26:
                if (j >= PlaybackStateCompat.ACTION_PREPARE_FROM_SEARCH) {
                    return;
                }
                throw new zzhf("Integer value " + j + " after add info could have been represented in 0-2 additional bytes, but used 4");
            case 27:
                if (j >= 4294967296L) {
                    return;
                }
                throw new zzhf("Integer value " + j + " after add info could have been represented in 0-4 additional bytes, but used 8");
            default:
                return;
        }
    }
}
