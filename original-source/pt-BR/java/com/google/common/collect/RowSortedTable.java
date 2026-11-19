package com.google.common.collect;

import java.util.Map;
import java.util.SortedMap;
import java.util.SortedSet;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
public interface RowSortedTable<R, C, V> extends Table<R, C, V> {
    @Override // com.google.common.collect.Table
    SortedSet<R> rowKeySet();

    @Override // com.google.common.collect.Table
    SortedMap<R, Map<C, V>> rowMap();

    /* renomeado de: com.google.common.collect.RowSortedTable$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
    }
}
