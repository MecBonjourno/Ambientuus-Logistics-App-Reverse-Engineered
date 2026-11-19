package com.google.common.collect;

import java.util.Collection;
import java.util.List;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
public abstract class ForwardingListMultimap<K, V> extends ForwardingMultimap<K, V> implements ListMultimap<K, V> {
    /* JADX INFO: modificadores de acesso alterados de: protected */
    @Override // com.google.common.collect.ForwardingMultimap, com.google.common.collect.ForwardingObject
    public abstract ListMultimap<K, V> delegate();

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // com.google.common.collect.ForwardingMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* sintético */ Collection get(@ParametricNullness Object obj) {
        return get((ForwardingListMultimap<K, V>) obj);
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // com.google.common.collect.ForwardingMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* sintético */ Collection replaceValues(@ParametricNullness Object obj, Iterable iterable) {
        return replaceValues((ForwardingListMultimap<K, V>) obj, iterable);
    }

    protected ForwardingListMultimap() {
    }

    @Override // com.google.common.collect.ForwardingMultimap, com.google.common.collect.Multimap
    public List<V> get(@ParametricNullness K key) {
        return delegate().get((ListMultimap<K, V>) key);
    }

    @Override // com.google.common.collect.ForwardingMultimap, com.google.common.collect.Multimap
    public List<V> removeAll(@CheckForNull Object key) {
        return delegate().removeAll(key);
    }

    @Override // com.google.common.collect.ForwardingMultimap, com.google.common.collect.Multimap
    public List<V> replaceValues(@ParametricNullness K key, Iterable<? extends V> values) {
        return delegate().replaceValues((ListMultimap<K, V>) key, (Iterable) values);
    }
}
