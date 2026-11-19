package com.google.common.base;

import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
public interface Predicate<T> {
    boolean apply(@ParametricNullness T t);

    boolean equals(@CheckForNull Object obj);
}
