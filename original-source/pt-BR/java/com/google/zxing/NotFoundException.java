package com.google.zxing;

/* carregado de: classes16.dex */
public final class NotFoundException extends ReaderException {
    private static final NotFoundException instance = new NotFoundException();

    private NotFoundException() {
    }

    public static NotFoundException getNotFoundInstance() {
        return instance;
    }
}
