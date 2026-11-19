package com.google.common.base;

import java.lang.ref.PhantomReference;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
public abstract class FinalizablePhantomReference<T> extends PhantomReference<T> implements FinalizableReference {
    protected FinalizablePhantomReference(@CheckForNull T referent, FinalizableReferenceQueue queue) {
        super(referent, queue.queue);
        queue.cleanUp();
    }
}
