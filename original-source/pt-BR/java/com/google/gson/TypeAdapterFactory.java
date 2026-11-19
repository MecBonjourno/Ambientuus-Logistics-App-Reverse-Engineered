package com.google.gson;

import com.google.gson.reflect.TypeToken;

/* carregado de: classes16.dex */
public interface TypeAdapterFactory {
    <T> TypeAdapter<T> create(Gson gson, TypeToken<T> typeToken);
}
