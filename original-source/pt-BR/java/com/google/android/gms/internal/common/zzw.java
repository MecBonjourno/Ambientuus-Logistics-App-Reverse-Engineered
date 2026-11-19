package com.google.android.gms.internal.common;

import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* compiled from: com.google.android.gms:play-services-basement@@18.8.0 */
/* carregado de: classes16.dex */
public final class zzw {
    private final zzp zza;
    private final boolean zzb;
    private final zzu zzc;

    private zzw(zzu zzuVar, boolean z, zzp zzpVar, int i) {
        this.zzc = zzuVar;
        this.zzb = z;
        this.zza = zzpVar;
    }

    public static zzw zza(zzp zzpVar) {
        return new zzw(new zzu(zzpVar), false, zzo.zza, Integer.MAX_VALUE);
    }

    public final zzw zzb() {
        return new zzw(this.zzc, true, this.zza, Integer.MAX_VALUE);
    }

    public final Iterable zzc(CharSequence charSequence) {
        return new zzt(this, charSequence);
    }

    public final List zzd(CharSequence charSequence) {
        if (charSequence == null) {
            throw null;
        }
        Iterator zza = this.zzc.zza(this, charSequence);
        ArrayList arrayList = new ArrayList();
        while (zza.hasNext()) {
            arrayList.add((String) zza.next());
        }
        return DesugarCollections.unmodifiableList(arrayList);
    }

    final /* sintético */ Iterator zze(CharSequence charSequence) {
        return this.zzc.zza(this, charSequence);
    }

    final /* sintético */ zzp zzf() {
        return this.zza;
    }

    final /* sintético */ boolean zzg() {
        return this.zzb;
    }
}
