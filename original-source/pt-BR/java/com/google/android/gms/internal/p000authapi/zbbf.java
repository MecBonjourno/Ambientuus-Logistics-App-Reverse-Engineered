package com.google.android.gms.internal.p000authapi;

import j$.lang.Iterable;
import j$.util.Collection;
import j$.util.Spliterator;
import j$.util.Spliterators;
import j$.util.stream.Stream;
import java.io.Serializable;
import java.util.AbstractCollection;
import java.util.Arrays;
import java.util.function.Consumer;
import java.util.function.IntFunction;
import java.util.function.Predicate;

/* compiled from: com.google.android.gms:play-services-auth@@21.4.0 */
/* carregado de: classes16.dex */
public abstract class zbbf extends AbstractCollection implements Serializable, Collection {
    private static final Object[] zba = new Object[0];

    zbbf() {
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    @Deprecated
    public final boolean add(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    @Deprecated
    public final boolean addAll(java.util.Collection collection) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    @Deprecated
    public final void clear() {
        throw new UnsupportedOperationException();
    }

    @Override // java.lang.Iterable, j$.util.Collection, j$.lang.Iterable
    public /* sintético */ void forEach(Consumer consumer) {
        Iterable.CC.$default$forEach(this, consumer);
    }

    @Override // java.util.Collection, j$.util.Collection
    public /* sintético */ Stream parallelStream() {
        return Collection.CC.$default$parallelStream(this);
    }

    @Override // java.util.Collection
    public /* sintético */ java.util.stream.Stream parallelStream() {
        return Stream.Wrapper.convert(parallelStream());
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    @Deprecated
    public final boolean remove(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    @Deprecated
    public final boolean removeAll(java.util.Collection collection) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Collection, j$.util.Collection
    public /* sintético */ boolean removeIf(Predicate predicate) {
        return Collection.CC.$default$removeIf(this, predicate);
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    @Deprecated
    public final boolean retainAll(java.util.Collection collection) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Collection, java.lang.Iterable, j$.util.Collection, j$.lang.Iterable
    public final Spliterator spliterator() {
        return Spliterators.spliterator(this, 1296);
    }

    @Override // java.util.Collection, java.lang.Iterable
    public /* sintético */ java.util.Spliterator spliterator() {
        return Spliterator.Wrapper.convert(spliterator());
    }

    @Override // java.util.Collection, j$.util.Collection
    public /* sintético */ Stream stream() {
        return Collection.CC.$default$stream(this);
    }

    @Override // java.util.Collection
    public /* sintético */ java.util.stream.Stream stream() {
        return Stream.Wrapper.convert(stream());
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final Object[] toArray() {
        return toArray(zba);
    }

    @Override // java.util.Collection, j$.util.Collection
    public /* sintético */ Object[] toArray(IntFunction intFunction) {
        return Collection.CC.$default$toArray(this, intFunction);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    /* renomeado de: zba, motivo: mesclado com método bridge [métodos inline] */
    public abstract zbbk iterator();

    Object[] zbb() {
        throw null;
    }

    int zbc() {
        throw null;
    }

    int zbd() {
        throw null;
    }

    public zbbi zbe() {
        throw null;
    }

    abstract boolean zbf();

    int zbg(Object[] objArr, int i) {
        throw null;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final Object[] toArray(Object[] objArr) {
        if (objArr == null) {
            throw null;
        }
        int size = size();
        int length = objArr.length;
        if (length < size) {
            Object[] zbb = zbb();
            if (zbb != null) {
                return Arrays.copyOfRange(zbb, zbc(), zbd(), objArr.getClass());
            }
            if (length != 0) {
                objArr = Arrays.copyOf(objArr, 0);
            }
            objArr = Arrays.copyOf(objArr, size);
        } else if (length > size) {
            objArr[size] = null;
        }
        zbg(objArr, 0);
        return objArr;
    }
}
