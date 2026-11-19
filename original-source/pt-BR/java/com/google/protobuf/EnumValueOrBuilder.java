package com.google.protobuf;

import java.util.List;

/* carregado de: classes16.dex */
public interface EnumValueOrBuilder extends MessageLiteOrBuilder {
    String getName();

    ByteString getNameBytes();

    int getNumber();

    Option getOptions(int index);

    int getOptionsCount();

    List<Option> getOptionsList();
}
