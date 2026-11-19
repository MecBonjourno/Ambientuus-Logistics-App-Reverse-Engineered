package com.google.api.client.util;

/* carregado de: classes16.dex */
public interface Clock {
    public static final Clock SYSTEM = new Clock() { // da classe: com.google.api.client.util.Clock.1
        @Override // com.google.api.client.util.Clock
        public long currentTimeMillis() {
            return System.currentTimeMillis();
        }
    };

    long currentTimeMillis();
}
