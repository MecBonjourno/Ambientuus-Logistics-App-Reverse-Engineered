package androidx.camera.core.impl.utils.futures;

import com.google.common.util.concurrent.ListenableFuture;

@FunctionalInterface
/* carregado de: classes.dex */
public interface AsyncFunction<I, O> {
    ListenableFuture<O> apply(I i) throws Exception;
}
