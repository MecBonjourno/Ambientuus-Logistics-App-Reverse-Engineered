package com.google.common.base;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
public abstract class Ticker {
    private static final Ticker SYSTEM_TICKER = new Ticker() { // da classe: com.google.common.base.Ticker.1
        @Override // com.google.common.base.Ticker
        public long read() {
            return Platform.systemNanoTime();
        }
    };

    public abstract long read();

    protected Ticker() {
    }

    public static Ticker systemTicker() {
        return SYSTEM_TICKER;
    }
}
