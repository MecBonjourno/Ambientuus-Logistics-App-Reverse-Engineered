package com.google.firebase.components;

import com.google.firebase.inject.Deferred;
import com.google.firebase.inject.Provider;

/* carregado de: classes16.dex */
final /* sintético */ class OptionalProvider$$Lambda$4 implements Deferred.DeferredHandler {
    private static final OptionalProvider$$Lambda$4 instance = new OptionalProvider$$Lambda$4();

    private OptionalProvider$$Lambda$4() {
    }

    @Override // com.google.firebase.inject.Deferred.DeferredHandler
    public void handle(Provider provider) {
        OptionalProvider.lambda$static$0(provider);
    }
}
