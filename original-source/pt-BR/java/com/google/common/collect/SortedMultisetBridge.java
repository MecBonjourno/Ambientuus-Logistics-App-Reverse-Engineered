package com.google.common.collect;

import java.util.SortedSet;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
interface SortedMultisetBridge<E> extends Multiset<E> {
    @Override // com.google.common.collect.Multiset
    SortedSet<E> elementSet();

    /* renomeado de: com.google.common.collect.SortedMultisetBridge$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
    }
}
