package com.google.api.client.json.gson;

import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.JsonGenerator;
import com.google.api.client.json.JsonParser;
import com.google.api.client.util.Charsets;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.io.StringReader;
import java.io.Writer;
import java.nio.charset.Charset;

/* carregado de: classes16.dex */
public class GsonFactory extends JsonFactory {
    public static GsonFactory getDefaultInstance() {
        return InstanceHolder.INSTANCE;
    }

    static class InstanceHolder {
        static final GsonFactory INSTANCE = new GsonFactory();

        InstanceHolder() {
        }
    }

    @Override // com.google.api.client.json.JsonFactory
    public JsonParser createJsonParser(InputStream in) {
        return createJsonParser(new InputStreamReader(in, Charsets.UTF_8));
    }

    @Override // com.google.api.client.json.JsonFactory
    public JsonParser createJsonParser(InputStream in, Charset charset) {
        if (charset == null) {
            return createJsonParser(in);
        }
        return createJsonParser(new InputStreamReader(in, charset));
    }

    @Override // com.google.api.client.json.JsonFactory
    public JsonParser createJsonParser(String value) {
        return createJsonParser(new StringReader(value));
    }

    @Override // com.google.api.client.json.JsonFactory
    public JsonParser createJsonParser(Reader reader) {
        return new GsonParser(this, new JsonReader(reader));
    }

    @Override // com.google.api.client.json.JsonFactory
    public JsonGenerator createJsonGenerator(OutputStream out, Charset enc) {
        return createJsonGenerator(new OutputStreamWriter(out, enc));
    }

    @Override // com.google.api.client.json.JsonFactory
    public JsonGenerator createJsonGenerator(Writer writer) {
        return new GsonGenerator(this, new JsonWriter(writer));
    }
}
