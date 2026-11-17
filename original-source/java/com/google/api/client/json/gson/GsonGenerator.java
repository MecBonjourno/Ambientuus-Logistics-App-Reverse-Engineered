package com.google.api.client.json.gson;

import androidx.camera.video.AudioStats;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.JsonGenerator;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;

/* loaded from: classes16.dex */
class GsonGenerator extends JsonGenerator {
    private final GsonFactory factory;
    private final JsonWriter writer;

    GsonGenerator(GsonFactory factory, JsonWriter writer) {
        this.factory = factory;
        this.writer = writer;
        writer.setLenient(true);
    }

    @Override // com.google.api.client.json.JsonGenerator
    public void flush() throws IOException {
        this.writer.flush();
    }

    @Override // com.google.api.client.json.JsonGenerator
    public void close() throws IOException {
        this.writer.close();
    }

    @Override // com.google.api.client.json.JsonGenerator
    public JsonFactory getFactory() {
        return this.factory;
    }

    @Override // com.google.api.client.json.JsonGenerator
    public void writeBoolean(boolean state) throws IOException {
        this.writer.value(state);
    }

    @Override // com.google.api.client.json.JsonGenerator
    public void writeEndArray() throws IOException {
        this.writer.endArray();
    }

    @Override // com.google.api.client.json.JsonGenerator
    public void writeEndObject() throws IOException {
        this.writer.endObject();
    }

    @Override // com.google.api.client.json.JsonGenerator
    public void writeFieldName(String name) throws IOException {
        this.writer.name(name);
    }

    @Override // com.google.api.client.json.JsonGenerator
    public void writeNull() throws IOException {
        this.writer.nullValue();
    }

    @Override // com.google.api.client.json.JsonGenerator
    public void writeNumber(int v) throws IOException {
        this.writer.value(v);
    }

    @Override // com.google.api.client.json.JsonGenerator
    public void writeNumber(long v) throws IOException {
        this.writer.value(v);
    }

    @Override // com.google.api.client.json.JsonGenerator
    public void writeNumber(BigInteger v) throws IOException {
        this.writer.value(v);
    }

    @Override // com.google.api.client.json.JsonGenerator
    public void writeNumber(double v) throws IOException {
        this.writer.value(v);
    }

    @Override // com.google.api.client.json.JsonGenerator
    public void writeNumber(float v) throws IOException {
        this.writer.value(v);
    }

    @Override // com.google.api.client.json.JsonGenerator
    public void writeNumber(BigDecimal v) throws IOException {
        this.writer.value(v);
    }

    static final class StringNumber extends Number {
        private static final long serialVersionUID = 1;
        private final String encodedValue;

        StringNumber(String encodedValue) {
            this.encodedValue = encodedValue;
        }

        @Override // java.lang.Number
        public double doubleValue() {
            return AudioStats.AUDIO_AMPLITUDE_NONE;
        }

        @Override // java.lang.Number
        public float floatValue() {
            return 0.0f;
        }

        @Override // java.lang.Number
        public int intValue() {
            return 0;
        }

        @Override // java.lang.Number
        public long longValue() {
            return 0L;
        }

        public String toString() {
            return this.encodedValue;
        }
    }

    @Override // com.google.api.client.json.JsonGenerator
    public void writeNumber(String encodedValue) throws IOException {
        this.writer.value(new StringNumber(encodedValue));
    }

    @Override // com.google.api.client.json.JsonGenerator
    public void writeStartArray() throws IOException {
        this.writer.beginArray();
    }

    @Override // com.google.api.client.json.JsonGenerator
    public void writeStartObject() throws IOException {
        this.writer.beginObject();
    }

    @Override // com.google.api.client.json.JsonGenerator
    public void writeString(String value) throws IOException {
        this.writer.value(value);
    }

    @Override // com.google.api.client.json.JsonGenerator
    public void enablePrettyPrint() throws IOException {
        this.writer.setIndent("  ");
    }
}
