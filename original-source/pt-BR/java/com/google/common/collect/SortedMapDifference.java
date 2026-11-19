package com.google.common.collect;

import com.google.common.collect.MapDifference;
import java.util.SortedMap;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
public interface SortedMapDifference<K, V> extends MapDifference<K, V> {
    @Override // com.google.common.collect.MapDifference
    SortedMap<K, MapDifference.ValueDifference<V>> entriesDiffering();

    @Override // com.google.common.collect.MapDifference
    SortedMap<K, V> entriesInCommon();

    @Override // com.google.common.collect.MapDifference
    SortedMap<K, V> entriesOnlyOnLeft();

    @Override // com.google.common.collect.MapDifference
    SortedMap<K, V> entriesOnlyOnRight();

    /* renomeado de: com.google.common.collect.SortedMapDifference$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
    }
}
