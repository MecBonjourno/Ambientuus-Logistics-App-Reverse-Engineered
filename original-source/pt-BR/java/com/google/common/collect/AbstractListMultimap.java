package com.google.common.collect;

import j$.util.DesugarCollections;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
abstract class AbstractListMultimap<K, V> extends AbstractMapBasedMultimap<K, V> implements ListMultimap<K, V> {
    private static final long serialVersionUID = 6588350623831699109L;

    /* JADX INFO: modificadores de acesso alterados de: package-private */
    @Override // com.google.common.collect.AbstractMapBasedMultimap
    public abstract List<V> createCollection();

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* sintético */ Collection get(@ParametricNullness Object obj) {
        return get((AbstractListMultimap<K, V>) obj);
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* sintético */ Collection replaceValues(@ParametricNullness Object obj, Iterable iterable) {
        return replaceValues((AbstractListMultimap<K, V>) obj, iterable);
    }

    protected AbstractListMultimap(Map<K, Collection<V>> map) {
        super(map);
    }

    /* JADX INFO: modificadores de acesso alterados de: package-private */
    @Override // com.google.common.collect.AbstractMapBasedMultimap
    public List<V> createUnmodifiableEmptyCollection() {
        return Collections.emptyList();
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap
    <E> Collection<E> unmodifiableCollectionSubclass(Collection<E> collection) {
        return DesugarCollections.unmodifiableList((List) collection);
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap
    Collection<V> wrapCollection(@ParametricNullness K key, Collection<V> collection) {
        return wrapList(key, (List) collection, null);
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.Multimap
    public List<V> get(@ParametricNullness K key) {
        return (List) super.get((AbstractListMultimap<K, V>) key);
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.Multimap
    public List<V> removeAll(@CheckForNull Object key) {
        return (List) super.removeAll(key);
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public List<V> replaceValues(@ParametricNullness K key, Iterable<? extends V> values) {
        return (List) super.replaceValues((AbstractListMultimap<K, V>) key, (Iterable) values);
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public boolean put(@ParametricNullness K key, @ParametricNullness V value) {
        return super.put(key, value);
    }

    @Override // com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap, com.google.common.collect.ListMultimap
    public Map<K, Collection<V>> asMap() {
        return super.asMap();
    }

    @Override // com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap, com.google.common.collect.ListMultimap
    public boolean equals(@CheckForNull Object object) {
        return super.equals(object);
    }
}
