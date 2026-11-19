package com.google.gson;

/* carregado de: classes16.dex */
public enum LongSerializationPolicy {
    DEFAULT { // da classe: com.google.gson.LongSerializationPolicy.1
        @Override // com.google.gson.LongSerializationPolicy
        public JsonElement serialize(Long value) {
            return new JsonPrimitive((Number) value);
        }
    },
    STRING { // da classe: com.google.gson.LongSerializationPolicy.2
        @Override // com.google.gson.LongSerializationPolicy
        public JsonElement serialize(Long value) {
            return new JsonPrimitive(String.valueOf(value));
        }
    };

    public abstract JsonElement serialize(Long l);
}
