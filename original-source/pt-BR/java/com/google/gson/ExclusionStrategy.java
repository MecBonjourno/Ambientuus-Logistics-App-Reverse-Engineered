package com.google.gson;

/* carregado de: classes16.dex */
public interface ExclusionStrategy {
    boolean shouldSkipClass(Class<?> cls);

    boolean shouldSkipField(FieldAttributes fieldAttributes);
}
