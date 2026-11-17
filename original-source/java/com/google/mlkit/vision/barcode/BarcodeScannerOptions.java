package com.google.mlkit.vision.barcode;

import com.google.android.gms.common.internal.Objects;
import java.util.concurrent.Executor;

/* compiled from: com.google.android.gms:play-services-mlkit-barcode-scanning@@18.3.1 */
/* loaded from: classes16.dex */
public class BarcodeScannerOptions {
    private final int zza;
    private final boolean zzb;
    private final Executor zzc;
    private final ZoomSuggestionOptions zzd;

    /* compiled from: com.google.android.gms:play-services-mlkit-barcode-scanning@@18.3.1 */
    public static class Builder {
        private int zza = 0;
        private boolean zzb;
        private Executor zzc;
        private ZoomSuggestionOptions zzd;

        public BarcodeScannerOptions build() {
            return new BarcodeScannerOptions(this.zza, this.zzb, this.zzc, this.zzd, null);
        }

        public Builder enableAllPotentialBarcodes() {
            this.zzb = true;
            return this;
        }

        public Builder setBarcodeFormats(int format, int... moreFormats) {
            this.zza = format;
            if (moreFormats != null) {
                for (int i : moreFormats) {
                    this.zza = i | this.zza;
                }
            }
            return this;
        }

        public Builder setExecutor(Executor executor) {
            this.zzc = executor;
            return this;
        }

        public Builder setZoomSuggestionOptions(ZoomSuggestionOptions zoomSuggestionOptions) {
            this.zzd = zoomSuggestionOptions;
            return this;
        }
    }

    /* synthetic */ BarcodeScannerOptions(int i, boolean z, Executor executor, ZoomSuggestionOptions zoomSuggestionOptions, zza zzaVar) {
        this.zza = i;
        this.zzb = z;
        this.zzc = executor;
        this.zzd = zoomSuggestionOptions;
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof BarcodeScannerOptions)) {
            return false;
        }
        BarcodeScannerOptions barcodeScannerOptions = (BarcodeScannerOptions) o;
        return this.zza == barcodeScannerOptions.zza && this.zzb == barcodeScannerOptions.zzb && Objects.equal(this.zzc, barcodeScannerOptions.zzc) && Objects.equal(this.zzd, barcodeScannerOptions.zzd);
    }

    public int hashCode() {
        return Objects.hashCode(Integer.valueOf(this.zza), Boolean.valueOf(this.zzb), this.zzc, this.zzd);
    }

    public final int zza() {
        return this.zza;
    }

    public final ZoomSuggestionOptions zzb() {
        return this.zzd;
    }

    public final Executor zzc() {
        return this.zzc;
    }

    public final boolean zzd() {
        return this.zzb;
    }
}
