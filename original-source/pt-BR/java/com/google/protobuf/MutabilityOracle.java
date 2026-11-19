package com.google.protobuf;

/* carregado de: classes16.dex */
interface MutabilityOracle {
    public static final MutabilityOracle IMMUTABLE = new MutabilityOracle() { // da classe: com.google.protobuf.MutabilityOracle.1
        @Override // com.google.protobuf.MutabilityOracle
        public void ensureMutable() {
            throw new UnsupportedOperationException();
        }
    };

    void ensureMutable();
}
