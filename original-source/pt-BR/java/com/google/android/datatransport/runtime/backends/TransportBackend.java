package com.google.android.datatransport.runtime.backends;

import com.google.android.datatransport.runtime.EventInternal;

/* carregado de: classes.dex */
public interface TransportBackend {
    EventInternal decorate(EventInternal eventInternal);

    BackendResponse send(BackendRequest backendRequest);
}
