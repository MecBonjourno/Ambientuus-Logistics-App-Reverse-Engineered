package com.google.protobuf;

@CheckReturnValue
/* carregado de: classes16.dex */
interface MessageInfoFactory {
    boolean isSupported(Class<?> clazz);

    MessageInfo messageInfoFor(Class<?> clazz);
}
