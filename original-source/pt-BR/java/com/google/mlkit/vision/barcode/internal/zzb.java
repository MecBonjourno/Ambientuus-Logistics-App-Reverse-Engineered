package com.google.mlkit.vision.barcode.internal;

import android.util.SparseArray;
import com.google.android.gms.internal.mlkit_vision_barcode.zzcp;
import com.google.android.gms.internal.mlkit_vision_barcode.zzra;
import com.google.android.gms.internal.mlkit_vision_barcode.zzrb;
import com.google.android.gms.internal.mlkit_vision_barcode.zzrc;
import com.google.android.gms.internal.mlkit_vision_barcode.zzrd;
import com.google.android.gms.internal.mlkit_vision_barcode.zzrn;
import com.google.android.gms.internal.mlkit_vision_barcode.zzro;
import com.google.android.gms.internal.mlkit_vision_barcode.zzrs;
import com.google.android.gms.internal.mlkit_vision_barcode.zzvw;
import com.google.android.gms.internal.mlkit_vision_barcode.zzvx;
import com.google.android.gms.internal.mlkit_vision_barcode.zzvz;
import com.google.android.gms.internal.mlkit_vision_barcode.zzwe;
import com.google.android.gms.internal.mlkit_vision_barcode.zzwo;
import com.google.android.gms.internal.mlkit_vision_barcode.zzwp;
import com.google.android.gms.internal.mlkit_vision_barcode.zzws;
import com.google.mlkit.common.sdkinternal.MlKitContext;
import com.google.mlkit.vision.barcode.BarcodeScannerOptions;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;

/* compiled from: com.google.android.gms:play-services-mlkit-barcode-scanning@@18.3.1 */
/* carregado de: classes16.dex */
public final class zzb {
    private static final Map zzd;
    private static final SparseArray zzb = new SparseArray();
    private static final SparseArray zzc = new SparseArray();
    static final AtomicReference zza = new AtomicReference();

    static {
        zzb.put(-1, zzrn.FORMAT_UNKNOWN);
        zzb.put(1, zzrn.FORMAT_CODE_128);
        zzb.put(2, zzrn.FORMAT_CODE_39);
        zzb.put(4, zzrn.FORMAT_CODE_93);
        zzb.put(8, zzrn.FORMAT_CODABAR);
        zzb.put(16, zzrn.FORMAT_DATA_MATRIX);
        zzb.put(32, zzrn.FORMAT_EAN_13);
        zzb.put(64, zzrn.FORMAT_EAN_8);
        zzb.put(128, zzrn.FORMAT_ITF);
        zzb.put(256, zzrn.FORMAT_QR_CODE);
        zzb.put(512, zzrn.FORMAT_UPC_A);
        zzb.put(1024, zzrn.FORMAT_UPC_E);
        zzb.put(2048, zzrn.FORMAT_PDF417);
        zzb.put(4096, zzrn.FORMAT_AZTEC);
        zzc.put(0, zzro.TYPE_UNKNOWN);
        zzc.put(1, zzro.TYPE_CONTACT_INFO);
        zzc.put(2, zzro.TYPE_EMAIL);
        zzc.put(3, zzro.TYPE_ISBN);
        zzc.put(4, zzro.TYPE_PHONE);
        zzc.put(5, zzro.TYPE_PRODUCT);
        zzc.put(6, zzro.TYPE_SMS);
        zzc.put(7, zzro.TYPE_TEXT);
        zzc.put(8, zzro.TYPE_URL);
        zzc.put(9, zzro.TYPE_WIFI);
        zzc.put(10, zzro.TYPE_GEO);
        zzc.put(11, zzro.TYPE_CALENDAR_EVENT);
        zzc.put(12, zzro.TYPE_DRIVER_LICENSE);
        zzd = new HashMap();
        zzd.put(1, zzvw.CODE_128);
        zzd.put(2, zzvw.CODE_39);
        zzd.put(4, zzvw.CODE_93);
        zzd.put(8, zzvw.CODABAR);
        zzd.put(16, zzvw.DATA_MATRIX);
        zzd.put(32, zzvw.EAN_13);
        zzd.put(64, zzvw.EAN_8);
        zzd.put(128, zzvw.ITF);
        zzd.put(256, zzvw.QR_CODE);
        zzd.put(512, zzvw.UPC_A);
        zzd.put(1024, zzvw.UPC_E);
        zzd.put(2048, zzvw.PDF417);
        zzd.put(4096, zzvw.AZTEC);
    }

    public static zzrn zza(int i) {
        zzrn zzrnVar = (zzrn) zzb.get(i);
        return zzrnVar == null ? zzrn.FORMAT_UNKNOWN : zzrnVar;
    }

    public static zzro zzb(int i) {
        zzro zzroVar = (zzro) zzc.get(i);
        return zzroVar == null ? zzro.TYPE_UNKNOWN : zzroVar;
    }

    public static zzvz zzc(BarcodeScannerOptions barcodeScannerOptions) {
        int zza2 = barcodeScannerOptions.zza();
        zzcp zzcpVar = new zzcp();
        if (zza2 == 0) {
            zzcpVar.zze(zzd.values());
        } else {
            for (Map.Entry entry : zzd.entrySet()) {
                if ((((Integer) entry.getKey()).intValue() & zza2) != 0) {
                    zzcpVar.zzd((zzvw) entry.getValue());
                }
            }
        }
        zzvx zzvxVar = new zzvx();
        zzvxVar.zzb(zzcpVar.zzf());
        return zzvxVar.zzc();
    }

    public static String zzd() {
        return true != zzf() ? "play-services-mlkit-barcode-scanning" : "barcode-scanning";
    }

    static void zze(zzwp zzwpVar, final zzrb zzrbVar) {
        zzwpVar.zzf(new zzwo() { // da classe: com.google.mlkit.vision.barcode.internal.zza
            @Override // com.google.android.gms.internal.mlkit_vision_barcode.zzwo
            public final zzwe zza() {
                zzrd zzrdVar = new zzrd();
                zzra zzraVar = zzb.zzf() ? zzra.TYPE_THICK : zzra.TYPE_THIN;
                zzrb zzrbVar2 = zzrb.this;
                zzrdVar.zze(zzraVar);
                zzrs zzrsVar = new zzrs();
                zzrsVar.zzb(zzrbVar2);
                zzrdVar.zzh(zzrsVar.zzc());
                return zzws.zzf(zzrdVar);
            }
        }, zzrc.ON_DEVICE_BARCODE_LOAD);
    }

    static boolean zzf() {
        if (zza.get() != null) {
            return ((Boolean) zza.get()).booleanValue();
        }
        boolean zzd2 = zzo.zzd(MlKitContext.getInstance().getApplicationContext());
        zza.set(Boolean.valueOf(zzd2));
        return zzd2;
    }
}
