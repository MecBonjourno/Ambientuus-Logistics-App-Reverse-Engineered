package com.google.android.gms.internal.auth;

import java.util.ListIterator;

/* compiled from: com.google.android.gms:play-services-auth-base@@18.0.10 */
/* carregado de: classes16.dex */
final class zzhc implements ListIterator {
    final ListIterator zza;
    final /* sintético */ int zzb;
    final /* sintético */ zzhe zzc;

    zzhc(zzhe zzheVar, int i) {
        zzff zzffVar;
        this.zzc = zzheVar;
        this.zzb = i;
        zzffVar = this.zzc.zza;
        this.zza = zzffVar.listIterator(this.zzb);
    }

    @Override // java.util.ListIterator
    public final /* sintético */ void add(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final boolean hasNext() {
        return this.zza.hasNext();
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        return this.zza.hasPrevious();
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final /* bridge */ /* sintético */ Object next() {
        return (String) this.zza.next();
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        return this.zza.nextIndex();
    }

    @Override // java.util.ListIterator
    public final /* bridge */ /* sintético */ Object previous() {
        return (String) this.zza.previous();
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        return this.zza.previousIndex();
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.ListIterator
    public final /* sintético */ void set(Object obj) {
        throw new UnsupportedOperationException();
    }
}
