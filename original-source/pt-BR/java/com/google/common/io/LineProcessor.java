package com.google.common.io;

import java.io.IOException;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
public interface LineProcessor<T> {
    @ParametricNullness
    T getResult();

    boolean processLine(String str) throws IOException;
}
