package com.google.common.collect;

import java.util.Map;
import java.util.Set;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
public interface BiMap<K, V> extends Map<K, V> {
    @CheckForNull
    V forcePut(@ParametricNullness K k, @ParametricNullness V v);

    BiMap<V, K> inverse();

    @CheckForNull
    V put(@ParametricNullness K k, @ParametricNullness V v);

    void putAll(Map<? extends K, ? extends V> map);

    @Override // java.util.Map
    Set<V> values();

    /* renomeado de: com.google.common.collect.BiMap$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
    }
}
