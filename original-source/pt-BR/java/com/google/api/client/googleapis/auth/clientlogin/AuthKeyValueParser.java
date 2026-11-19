package com.google.api.client.googleapis.auth.clientlogin;

import com.google.api.client.http.HttpResponse;
import com.google.api.client.util.ClassInfo;
import com.google.api.client.util.FieldInfo;
import com.google.api.client.util.GenericData;
import com.google.api.client.util.ObjectParser;
import com.google.api.client.util.Types;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.lang.reflect.Field;
import java.lang.reflect.Type;
import java.nio.charset.Charset;
import java.util.Map;

/* carregado de: classes16.dex */
final class AuthKeyValueParser implements ObjectParser {
    public static final AuthKeyValueParser INSTANCE = new AuthKeyValueParser();

    public String getContentType() {
        return "text/plain";
    }

    public <T> T parse(HttpResponse httpResponse, Class<T> cls) throws IOException {
        httpResponse.setContentLoggingLimit(0);
        InputStream content = httpResponse.getContent();
        try {
            return (T) parse(content, cls);
        } finally {
            content.close();
        }
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    public <T> T parse(InputStream inputStream, Class<T> cls) throws IOException {
        Object valueOf;
        ClassInfo of = ClassInfo.of(cls);
        T t = (T) Types.newInstance(cls);
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
        while (true) {
            String readLine = bufferedReader.readLine();
            if (readLine != null) {
                int indexOf = readLine.indexOf(61);
                String substring = readLine.substring(0, indexOf);
                String substring2 = readLine.substring(indexOf + 1);
                Field field = of.getField(substring);
                if (field != null) {
                    Class<?> type = field.getType();
                    if (type == Boolean.TYPE || type == Boolean.class) {
                        valueOf = Boolean.valueOf(substring2);
                    } else {
                        valueOf = substring2;
                    }
                    FieldInfo.setFieldValue(field, t, valueOf);
                } else if (GenericData.class.isAssignableFrom(cls)) {
                    ((GenericData) t).set(substring, substring2);
                } else if (Map.class.isAssignableFrom(cls)) {
                    ((Map) t).put(substring, substring2);
                }
            } else {
                return t;
            }
        }
    }

    private AuthKeyValueParser() {
    }

    @Override // com.google.api.client.util.ObjectParser
    public <T> T parseAndClose(InputStream inputStream, Charset charset, Class<T> cls) throws IOException {
        return (T) parseAndClose((Reader) new InputStreamReader(inputStream, charset), (Class) cls);
    }

    @Override // com.google.api.client.util.ObjectParser
    public Object parseAndClose(InputStream in, Charset charset, Type dataType) {
        throw new UnsupportedOperationException("Type-based parsing is not yet supported -- use Class<T> instead");
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // com.google.api.client.util.ObjectParser
    public <T> T parseAndClose(Reader reader, Class<T> cls) throws IOException {
        Object valueOf;
        try {
            ClassInfo of = ClassInfo.of(cls);
            T t = (T) Types.newInstance(cls);
            BufferedReader bufferedReader = new BufferedReader(reader);
            while (true) {
                String readLine = bufferedReader.readLine();
                if (readLine != null) {
                    int indexOf = readLine.indexOf(61);
                    String substring = readLine.substring(0, indexOf);
                    String substring2 = readLine.substring(indexOf + 1);
                    Field field = of.getField(substring);
                    if (field != null) {
                        Class<?> type = field.getType();
                        if (type != Boolean.TYPE && type != Boolean.class) {
                            valueOf = substring2;
                            FieldInfo.setFieldValue(field, t, valueOf);
                        }
                        valueOf = Boolean.valueOf(substring2);
                        FieldInfo.setFieldValue(field, t, valueOf);
                    } else if (GenericData.class.isAssignableFrom(cls)) {
                        ((GenericData) t).set(substring, substring2);
                    } else if (Map.class.isAssignableFrom(cls)) {
                        ((Map) t).put(substring, substring2);
                    }
                } else {
                    return t;
                }
            }
        } finally {
            reader.close();
        }
    }

    @Override // com.google.api.client.util.ObjectParser
    public Object parseAndClose(Reader reader, Type dataType) {
        throw new UnsupportedOperationException("Type-based parsing is not yet supported -- use Class<T> instead");
    }
}
