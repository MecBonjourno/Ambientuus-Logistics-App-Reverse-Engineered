package com.google.common.cache;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
public interface Weigher<K, V> {
    int weigh(K k, V v);
}
