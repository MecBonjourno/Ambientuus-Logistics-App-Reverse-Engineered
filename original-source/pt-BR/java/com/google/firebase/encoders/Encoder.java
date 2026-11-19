package com.google.firebase.encoders;

import java.io.IOException;

/* JADX INFO: modificadores de acesso alterados de: package-private */
/* carregado de: classes16.dex */
public interface Encoder<TValue, TContext> {
    void encode(TValue tvalue, TContext tcontext) throws IOException;
}
