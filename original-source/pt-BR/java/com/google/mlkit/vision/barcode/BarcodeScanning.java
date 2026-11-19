package com.google.mlkit.vision.barcode;

import com.google.android.gms.common.internal.Preconditions;
import com.google.mlkit.common.sdkinternal.MlKitContext;
import com.google.mlkit.vision.barcode.internal.zzg;

/* compiled from: com.google.android.gms:play-services-mlkit-barcode-scanning@@18.3.1 */
/* carregado de: classes16.dex */
public class BarcodeScanning {
    private BarcodeScanning() {
    }

    public static BarcodeScanner getClient() {
        return ((zzg) MlKitContext.getInstance().get(zzg.class)).zza();
    }

    public static BarcodeScanner getClient(BarcodeScannerOptions options) {
        Preconditions.checkNotNull(options, "You must provide a valid BarcodeScannerOptions.");
        return ((zzg) MlKitContext.getInstance().get(zzg.class)).zzb(options);
    }
}
