package com.google.protobuf;

@CheckReturnValue
/* carregado de: classes16.dex */
interface SchemaFactory {
    <T> Schema<T> createSchema(Class<T> messageType);
}
