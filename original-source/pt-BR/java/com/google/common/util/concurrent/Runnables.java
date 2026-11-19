package com.google.common.util.concurrent;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
public final class Runnables {
    private static final Runnable EMPTY_RUNNABLE = new Runnable() { // da classe: com.google.common.util.concurrent.Runnables.1
        @Override // java.lang.Runnable
        public void run() {
        }
    };

    public static Runnable doNothing() {
        return EMPTY_RUNNABLE;
    }

    private Runnables() {
    }
}
