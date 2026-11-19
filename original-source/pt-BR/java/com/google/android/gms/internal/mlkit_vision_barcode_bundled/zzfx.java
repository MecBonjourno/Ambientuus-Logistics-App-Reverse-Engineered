package com.google.android.gms.internal.mlkit_vision_barcode_bundled;

import java.util.NoSuchElementException;

/* compiled from: com.google.mlkit:barcode-scanning@@17.3.0 */
/* carregado de: classes16.dex */
final class zzfx extends zzcz {
    final zzgb zza;
    zzdb zzb = zzb();
    final /* sintético */ zzgd zzc;

    zzfx(zzgd zzgdVar) {
        this.zzc = zzgdVar;
        this.zza = new zzgb(this.zzc, null);
    }

    private final zzdb zzb() {
        zzgb zzgbVar = this.zza;
        if (zzgbVar.hasNext()) {
            return zzgbVar.next().iterator();
        }
        return null;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.zzb != null;
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzdb
    public final byte zza() {
        zzdb zzdbVar = this.zzb;
        if (zzdbVar == null) {
            throw new NoSuchElementException();
        }
        byte zza = zzdbVar.zza();
        if (!this.zzb.hasNext()) {
            this.zzb = zzb();
        }
        return zza;
    }
}
