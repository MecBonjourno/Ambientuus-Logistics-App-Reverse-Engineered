package com.google.common.base;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
interface PatternCompiler {
    CommonPattern compile(String str);

    boolean isPcreLike();
}
