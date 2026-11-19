package com.fasterxml.jackson.core.async;

/* carregado de: classes.dex */
public interface NonBlockingInputFeeder {
    void endOfInput();

    boolean needMoreInput();
}
