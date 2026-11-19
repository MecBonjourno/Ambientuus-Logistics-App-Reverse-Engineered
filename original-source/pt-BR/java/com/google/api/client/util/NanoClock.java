package com.google.api.client.util;

/* carregado de: classes16.dex */
public interface NanoClock {
    public static final NanoClock SYSTEM = new NanoClock() { // da classe: com.google.api.client.util.NanoClock.1
        @Override // com.google.api.client.util.NanoClock
        public long nanoTime() {
            return System.nanoTime();
        }
    };

    long nanoTime();
}
