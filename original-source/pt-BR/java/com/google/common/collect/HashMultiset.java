package com.google.common.collect;

import java.util.Set;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
public final class HashMultiset<E> extends AbstractMapBasedMultiset<E> {
    private static final long serialVersionUID = 0;

    @Override // com.google.common.collect.AbstractMultiset, java.util.AbstractCollection, java.util.Collection, com.google.common.collect.Multiset
    public /* bridge */ /* sintético */ boolean contains(@CheckForNull Object obj) {
        return super.contains(obj);
    }

    @Override // com.google.common.collect.AbstractMultiset, com.google.common.collect.Multiset
    public /* bridge */ /* sintético */ Set elementSet() {
        return super.elementSet();
    }

    @Override // com.google.common.collect.AbstractMultiset, com.google.common.collect.Multiset
    public /* bridge */ /* sintético */ Set entrySet() {
        return super.entrySet();
    }

    @Override // com.google.common.collect.AbstractMultiset, java.util.AbstractCollection, java.util.Collection
    public /* bridge */ /* sintético */ boolean isEmpty() {
        return super.isEmpty();
    }

    public static <E> HashMultiset<E> create() {
        return create(3);
    }

    public static <E> HashMultiset<E> create(int distinctElements) {
        return new HashMultiset<>(distinctElements);
    }

    public static <E> HashMultiset<E> create(Iterable<? extends E> elements) {
        HashMultiset<E> multiset = create(Multisets.inferDistinctElements(elements));
        Iterables.addAll(multiset, elements);
        return multiset;
    }

    HashMultiset(int distinctElements) {
        super(distinctElements);
    }

    @Override // com.google.common.collect.AbstractMapBasedMultiset
    ObjectCountHashMap<E> newBackingMap(int distinctElements) {
        return new ObjectCountHashMap<>(distinctElements);
    }
}
