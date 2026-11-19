package com.google.common.collect;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
interface FilteredSetMultimap<K, V> extends FilteredMultimap<K, V>, SetMultimap<K, V> {
    @Override // com.google.common.collect.FilteredMultimap
    SetMultimap<K, V> unfiltered();

    /* renomeado de: com.google.common.collect.FilteredSetMultimap$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
    }
}
