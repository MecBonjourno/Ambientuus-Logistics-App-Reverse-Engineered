package com.google.api.client.util;

/* carregado de: classes16.dex */
public interface Sleeper {
    public static final Sleeper DEFAULT = new Sleeper() { // da classe: com.google.api.client.util.Sleeper.1
        @Override // com.google.api.client.util.Sleeper
        public void sleep(long millis) throws InterruptedException {
            Thread.sleep(millis);
        }
    };

    void sleep(long j) throws InterruptedException;
}
