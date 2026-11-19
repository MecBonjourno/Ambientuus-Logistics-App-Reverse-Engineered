package com.google.common.collect;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
public interface ListMultimap<K, V> extends Multimap<K, V> {
    Map<K, Collection<V>> asMap();

    boolean equals(@CheckForNull Object obj);

    @Override // com.google.common.collect.Multimap
    List<V> get(@ParametricNullness K k);

    @Override // com.google.common.collect.Multimap
    List<V> removeAll(@CheckForNull Object obj);

    @Override // com.google.common.collect.Multimap
    List<V> replaceValues(@ParametricNullness K k, Iterable<? extends V> iterable);

    /* renomeado de: com.google.common.collect.ListMultimap$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
    }
}
