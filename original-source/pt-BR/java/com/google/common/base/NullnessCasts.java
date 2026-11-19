package com.google.common.base;

import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
final class NullnessCasts {
    @ParametricNullness
    static <T> T uncheckedCastNullableTToT(@CheckForNull T t) {
        return t;
    }

    private NullnessCasts() {
    }
}
