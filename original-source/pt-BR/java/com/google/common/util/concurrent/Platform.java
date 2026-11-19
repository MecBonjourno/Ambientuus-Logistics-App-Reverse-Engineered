package com.google.common.util.concurrent;

import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
final class Platform {
    static boolean isInstanceOfThrowableClass(@CheckForNull Throwable t, Class<? extends Throwable> expectedClass) {
        return expectedClass.isInstance(t);
    }

    private Platform() {
    }
}
