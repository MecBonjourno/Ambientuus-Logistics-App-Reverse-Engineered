package com.fasterxml.jackson.core;

/* carregado de: classes.dex */
public class JsonGenerationException extends JsonProcessingException {
    private static final long serialVersionUID = 123;
    protected transient JsonGenerator _processor;

    @Deprecated
    public JsonGenerationException(Throwable rootCause) {
        super(rootCause);
    }

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    @Deprecated
    public JsonGenerationException(String msg) {
        super(msg, (JsonLocation) null);
    }

    @Deprecated
    public JsonGenerationException(String msg, Throwable rootCause) {
        super(msg, null, rootCause);
    }

    public JsonGenerationException(Throwable rootCause, JsonGenerator g) {
        super(rootCause);
        this._processor = g;
    }

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    public JsonGenerationException(String msg, JsonGenerator g) {
        super(msg, (JsonLocation) null);
        this._processor = g;
    }

    public JsonGenerationException(String msg, Throwable rootCause, JsonGenerator g) {
        super(msg, null, rootCause);
        this._processor = g;
    }

    public JsonGenerationException withGenerator(JsonGenerator g) {
        this._processor = g;
        return this;
    }

    @Override // com.fasterxml.jackson.core.JsonProcessingException
    public JsonGenerator getProcessor() {
        return this._processor;
    }
}
