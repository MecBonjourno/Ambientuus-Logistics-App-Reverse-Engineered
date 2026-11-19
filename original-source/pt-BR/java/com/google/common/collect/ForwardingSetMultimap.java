package com.google.common.collect;

import java.util.Collection;
import java.util.Map;
import java.util.Set;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
public abstract class ForwardingSetMultimap<K, V> extends ForwardingMultimap<K, V> implements SetMultimap<K, V> {
    /* JADX INFO: modificadores de acesso alterados de: protected */
    @Override // com.google.common.collect.ForwardingMultimap, com.google.common.collect.ForwardingObject
    public abstract SetMultimap<K, V> delegate();

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // com.google.common.collect.ForwardingMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* sintético */ Collection get(@ParametricNullness Object obj) {
        return get((ForwardingSetMultimap<K, V>) obj);
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // com.google.common.collect.ForwardingMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* sintético */ Collection replaceValues(@ParametricNullness Object obj, Iterable iterable) {
        return replaceValues((ForwardingSetMultimap<K, V>) obj, iterable);
    }

    @Override // com.google.common.collect.ForwardingMultimap, com.google.common.collect.Multimap
    public Set<Map.Entry<K, V>> entries() {
        return delegate().entries();
    }

    @Override // com.google.common.collect.ForwardingMultimap, com.google.common.collect.Multimap
    public Set<V> get(@ParametricNullness K key) {
        return delegate().get((SetMultimap<K, V>) key);
    }

    @Override // com.google.common.collect.ForwardingMultimap, com.google.common.collect.Multimap
    public Set<V> removeAll(@CheckForNull Object key) {
        return delegate().removeAll(key);
    }

    @Override // com.google.common.collect.ForwardingMultimap, com.google.common.collect.Multimap
    public Set<V> replaceValues(@ParametricNullness K key, Iterable<? extends V> values) {
        return delegate().replaceValues((SetMultimap<K, V>) key, (Iterable) values);
    }
}
