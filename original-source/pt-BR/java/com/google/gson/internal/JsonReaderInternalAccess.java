package com.google.gson.internal;

import com.google.gson.stream.JsonReader;
import java.io.IOException;

/* carregado de: classes16.dex */
public abstract class JsonReaderInternalAccess {
    public static JsonReaderInternalAccess INSTANCE;

    public abstract void promoteNameToValue(JsonReader jsonReader) throws IOException;
}
