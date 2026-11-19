package com.google.common.cache;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
public enum RemovalCause {
    EXPLICIT { // da classe: com.google.common.cache.RemovalCause.1
        @Override // com.google.common.cache.RemovalCause
        boolean wasEvicted() {
            return false;
        }
    },
    REPLACED { // da classe: com.google.common.cache.RemovalCause.2
        @Override // com.google.common.cache.RemovalCause
        boolean wasEvicted() {
            return false;
        }
    },
    COLLECTED { // da classe: com.google.common.cache.RemovalCause.3
        @Override // com.google.common.cache.RemovalCause
        boolean wasEvicted() {
            return true;
        }
    },
    EXPIRED { // da classe: com.google.common.cache.RemovalCause.4
        @Override // com.google.common.cache.RemovalCause
        boolean wasEvicted() {
            return true;
        }
    },
    SIZE { // da classe: com.google.common.cache.RemovalCause.5
        @Override // com.google.common.cache.RemovalCause
        boolean wasEvicted() {
            return true;
        }
    };

    abstract boolean wasEvicted();
}
