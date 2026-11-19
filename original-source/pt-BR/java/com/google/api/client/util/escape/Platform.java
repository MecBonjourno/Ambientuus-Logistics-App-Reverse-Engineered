package com.google.api.client.util.escape;

/* carregado de: classes16.dex */
final class Platform {
    private static final ThreadLocal<char[]> DEST_TL = new ThreadLocal<char[]>() { // da classe: com.google.api.client.util.escape.Platform.1
        /* JADX INFO: modificadores de acesso alterados de: protected */
        @Override // java.lang.ThreadLocal
        public char[] initialValue() {
            return new char[1024];
        }
    };

    private Platform() {
    }

    static char[] charBufferFromThreadLocal() {
        return DEST_TL.get();
    }
}
