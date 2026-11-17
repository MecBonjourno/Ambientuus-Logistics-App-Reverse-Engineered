package com.google.protobuf;

@CheckReturnValue
/* loaded from: classes16.dex */
interface MessageInfo {
    MessageLite getDefaultInstance();

    ProtoSyntax getSyntax();

    boolean isMessageSetWireFormat();
}
