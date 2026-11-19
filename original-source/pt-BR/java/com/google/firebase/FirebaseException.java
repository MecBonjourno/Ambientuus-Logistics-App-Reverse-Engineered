package com.google.firebase;

import com.google.android.gms.common.internal.Preconditions;

/* compiled from: com.google.android.gms:play-services-basement@@18.8.0 */
/* carregado de: classes16.dex */
public class FirebaseException extends Exception {
    @Deprecated
    protected FirebaseException() {
    }

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    public FirebaseException(String detailMessage) {
        super(detailMessage);
        Preconditions.checkNotEmpty(detailMessage, "Detail message must not be empty");
    }

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    public FirebaseException(String detailMessage, Throwable cause) {
        super(detailMessage, cause);
        Preconditions.checkNotEmpty(detailMessage, "Detail message must not be empty");
    }
}
