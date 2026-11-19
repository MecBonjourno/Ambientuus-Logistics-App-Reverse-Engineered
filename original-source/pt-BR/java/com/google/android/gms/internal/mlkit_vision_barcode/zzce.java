package com.google.android.gms.internal.mlkit_vision_barcode;

import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.NoSuchElementException;

/* compiled from: com.google.android.gms:play-services-mlkit-barcode-scanning@@18.3.1 */
/* carregado de: classes16.dex */
abstract class zzce implements Iterator {
    int zzb;
    int zzc;
    int zzd;
    final /* sintético */ zzci zze;

    /* sintético */ zzce(zzci zzciVar, zzcd zzcdVar) {
        int i;
        this.zze = zzciVar;
        zzci zzciVar2 = this.zze;
        i = zzciVar2.zzf;
        this.zzb = i;
        this.zzc = zzciVar2.zze();
        this.zzd = -1;
    }

    private final void zzb() {
        int i;
        i = this.zze.zzf;
        if (i != this.zzb) {
            throw new ConcurrentModificationException();
        }
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.zzc >= 0;
    }

    @Override // java.util.Iterator
    public final Object next() {
        zzb();
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        int i = this.zzc;
        this.zzd = i;
        Object zza = zza(i);
        this.zzc = this.zze.zzf(this.zzc);
        return zza;
    }

    @Override // java.util.Iterator
    public final void remove() {
        zzb();
        zzaz.zzf(this.zzd >= 0, "no calls to next() since the last call to remove()");
        this.zzb += 32;
        int i = this.zzd;
        zzci zzciVar = this.zze;
        zzciVar.remove(zzci.zzg(zzciVar, i));
        this.zzc--;
        this.zzd = -1;
    }

    abstract Object zza(int i);
}
