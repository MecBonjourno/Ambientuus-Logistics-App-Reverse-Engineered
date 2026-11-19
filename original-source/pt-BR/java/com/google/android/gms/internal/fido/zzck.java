package com.google.android.gms.internal.fido;

import j$.util.SortedSet;
import java.util.Comparator;
import java.util.NavigableSet;
import javax.annotation.CheckForNull;

/* compiled from: com.google.android.gms:play-services-fido@@21.0.0 */
/* carregado de: classes16.dex */
public abstract class zzck extends zzcf implements NavigableSet, zzda, SortedSet {
    final transient Comparator zza;

    @CheckForNull
    transient zzck zzb;

    zzck(Comparator comparator) {
        this.zza = comparator;
    }

    static zzcv zzs(Comparator comparator) {
        if (zzcq.zza.equals(comparator)) {
            return zzcv.zzc;
        }
        int i = zzcc.zzd;
        return new zzcv(zzct.zza, comparator);
    }

    @CheckForNull
    @Deprecated
    public final void addFirst(Object obj) {
        throw new UnsupportedOperationException();
    }

    @CheckForNull
    @Deprecated
    public final void addLast(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.SortedSet, com.google.android.gms.internal.fido.zzda
    public final Comparator comparator() {
        return this.zza;
    }

    @Override // java.util.SortedSet
    public Object first() {
        return iterator().next();
    }

    public final Object getFirst() {
        return first();
    }

    public final Object getLast() {
        return last();
    }

    @Override // java.util.SortedSet
    public Object last() {
        return descendingIterator().next();
    }

    @Override // java.util.NavigableSet
    @CheckForNull
    @Deprecated
    public final Object pollFirst() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.NavigableSet
    @CheckForNull
    @Deprecated
    public final Object pollLast() {
        throw new UnsupportedOperationException();
    }

    @Deprecated
    public final Object removeFirst() {
        throw new UnsupportedOperationException();
    }

    @Deprecated
    public final Object removeLast() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.NavigableSet, java.util.SortedSet
    public final /* bridge */ /* sintético */ java.util.SortedSet subSet(Object obj, Object obj2) {
        return subSet(obj, true, obj2, false);
    }

    @Override // com.google.android.gms.internal.fido.zzcf, com.google.android.gms.internal.fido.zzby, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    /* renomeado de: zzd */
    public abstract zzdc iterator();

    abstract zzck zzf();

    @Override // java.util.NavigableSet
    /* renomeado de: zzn, motivo: mesclado com método bridge [métodos inline] */
    public final zzck descendingSet() {
        zzck zzckVar = this.zzb;
        if (zzckVar != null) {
            return zzckVar;
        }
        zzck zzf = zzf();
        this.zzb = zzf;
        zzf.zzb = this;
        return zzf;
    }

    abstract zzck zzo(Object obj, boolean z);

    @Override // java.util.NavigableSet
    /* renomeado de: zzp, motivo: mesclado com método bridge [métodos inline] */
    public final zzck subSet(Object obj, boolean z, Object obj2, boolean z2) {
        if (obj == null) {
            throw null;
        }
        if (obj2 == null) {
            throw null;
        }
        zzbm.zzc(this.zza.compare(obj, obj2) <= 0);
        return zzq(obj, z, obj2, z2);
    }

    abstract zzck zzq(Object obj, boolean z, Object obj2, boolean z2);

    abstract zzck zzr(Object obj, boolean z);

    @Override // java.util.NavigableSet
    /* renomeado de: zzt, motivo: mesclado com método bridge [métodos inline] */
    public abstract zzdc descendingIterator();

    @Override // java.util.NavigableSet, java.util.SortedSet
    public final /* sintético */ java.util.SortedSet headSet(Object obj) {
        if (obj != null) {
            return zzo(obj, false);
        }
        throw null;
    }

    @Override // java.util.NavigableSet, java.util.SortedSet
    public final /* sintético */ java.util.SortedSet tailSet(Object obj) {
        if (obj != null) {
            return zzr(obj, true);
        }
        throw null;
    }

    @Override // java.util.NavigableSet
    @CheckForNull
    public Object ceiling(Object obj) {
        if (obj != null) {
            return zzcl.zza(zzr(obj, true), null);
        }
        throw null;
    }

    @Override // java.util.NavigableSet
    @CheckForNull
    public Object floor(Object obj) {
        if (obj != null) {
            return zzcn.zza(zzo(obj, true).descendingIterator(), null);
        }
        throw null;
    }

    @Override // java.util.NavigableSet
    @CheckForNull
    public Object higher(Object obj) {
        if (obj != null) {
            return zzcl.zza(zzr(obj, false), null);
        }
        throw null;
    }

    @Override // java.util.NavigableSet
    @CheckForNull
    public Object lower(Object obj) {
        if (obj != null) {
            return zzcn.zza(zzo(obj, false).descendingIterator(), null);
        }
        throw null;
    }

    @Override // java.util.NavigableSet
    public final /* sintético */ NavigableSet headSet(Object obj, boolean z) {
        if (obj != null) {
            return zzo(obj, z);
        }
        throw null;
    }

    @Override // java.util.NavigableSet
    public final /* sintético */ NavigableSet tailSet(Object obj, boolean z) {
        if (obj != null) {
            return zzr(obj, z);
        }
        throw null;
    }
}
