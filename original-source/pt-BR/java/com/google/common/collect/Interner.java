package com.google.common.collect;

import com.google.errorprone.annotations.DoNotMock;

@DoNotMock("Use Interners.new*Interner")
@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
public interface Interner<E> {
    E intern(E e);
}
