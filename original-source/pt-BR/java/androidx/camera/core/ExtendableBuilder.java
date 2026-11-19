package androidx.camera.core;

import androidx.camera.core.impl.MutableConfig;

/* carregado de: classes.dex */
public interface ExtendableBuilder<T> {
    T build();

    MutableConfig getMutableConfig();
}
