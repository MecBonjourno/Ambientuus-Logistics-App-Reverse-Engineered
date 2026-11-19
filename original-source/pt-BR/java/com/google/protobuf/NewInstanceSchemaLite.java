package com.google.protobuf;

@CheckReturnValue
/* carregado de: classes16.dex */
final class NewInstanceSchemaLite implements NewInstanceSchema {
    NewInstanceSchemaLite() {
    }

    @Override // com.google.protobuf.NewInstanceSchema
    public Object newInstance(Object defaultInstance) {
        return ((GeneratedMessageLite) defaultInstance).newMutableInstance();
    }
}
