package com.google.common.base;

import com.google.errorprone.annotations.DoNotMock;

@DoNotMock("Use an instance of one of the Finalizable*Reference classes")
@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
public interface FinalizableReference {
    void finalizeReferent();
}
