package com.google.api.client.http;

import com.google.api.client.util.Charsets;
import com.google.api.client.util.Data;
import com.google.api.client.util.ObjectParser;
import com.google.api.client.util.Preconditions;
import com.google.api.client.util.Throwables;
import com.google.api.client.util.Types;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringReader;
import java.lang.reflect.Type;
import java.nio.charset.Charset;
import java.util.List;

/* carregado de: classes16.dex */
public class UrlEncodedParser implements ObjectParser {
    public static final String CONTENT_TYPE = "application/x-www-form-urlencoded";
    public static final String MEDIA_TYPE = new HttpMediaType(CONTENT_TYPE).setCharsetParameter(Charsets.UTF_8).build();

    public static void parse(String content, Object data) {
        if (content == null) {
            return;
        }
        try {
            parse(new StringReader(content), data);
        } catch (IOException exception) {
            throw Throwables.propagate(exception);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:22:0x0062, code lost:
    
        r12 = com.google.api.client.util.escape.CharEscapers.decodeUri(r8.toString());
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x006e, code lost:
    
        if (r12.length() == 0) goto L47;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0070, code lost:
    
        r13 = com.google.api.client.util.escape.CharEscapers.decodeUri(r9.toString());
        r14 = r2.getFieldInfo(r12);
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x007c, code lost:
    
        if (r14 == null) goto L37;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x007f, code lost:
    
        r15 = com.google.api.client.util.Data.resolveWildcardTypeOrTypeVariable(r3, r14.getGenericType());
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x008b, code lost:
    
        if (com.google.api.client.util.Types.isArray(r15) == false) goto L26;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x008e, code lost:
    
        r5 = com.google.api.client.util.Types.getRawArrayComponentType(r3, com.google.api.client.util.Types.getArrayComponentType(r15));
        r17 = r1;
        r18 = r2;
        r7.put(r14.getField(), r5, parseValue(r5, r3, r13));
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0105, code lost:
    
        r2 = new java.io.StringWriter();
        r5 = new java.io.StringWriter();
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x0111, code lost:
    
        if (r11 != (-1)) goto L52;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x0118, code lost:
    
        r10 = true;
        r8 = r2;
        r9 = r5;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x0114, code lost:
    
        r7.setValues();
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x0117, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x00a6, code lost:
    
        r17 = r1;
        r18 = r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x00b4, code lost:
    
        if (com.google.api.client.util.Types.isAssignableToOrFrom(com.google.api.client.util.Types.getRawArrayComponentType(r3, r15), java.lang.Iterable.class) == false) goto L36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x00b6, code lost:
    
        r1 = (java.util.Collection) r14.getValue(r20);
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x00bc, code lost:
    
        if (r1 != null) goto L31;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x00be, code lost:
    
        r1 = com.google.api.client.util.Data.newCollectionInstance(r15);
        r14.setValue(r20, r1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x00c7, code lost:
    
        if (r15 != java.lang.Object.class) goto L34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00c9, code lost:
    
        r2 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00cf, code lost:
    
        r1.add(parseValue(r2, r3, r13));
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x00cb, code lost:
    
        r2 = com.google.api.client.util.Types.getIterableParameter(r15);
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x00d7, code lost:
    
        r14.setValue(r20, parseValue(r15, r3, r13));
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x00df, code lost:
    
        r17 = r1;
        r18 = r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x00e3, code lost:
    
        if (r6 == null) goto L48;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x00e5, code lost:
    
        r1 = (java.util.ArrayList) r6.get(r12);
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x00eb, code lost:
    
        if (r1 != null) goto L45;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x00ed, code lost:
    
        r1 = new java.util.ArrayList<>();
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x00f3, code lost:
    
        if (r4 == null) goto L44;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x00f5, code lost:
    
        r4.set(r12, r1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x00f9, code lost:
    
        r6.put(r12, r1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x00fc, code lost:
    
        r1.add(r13);
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x0101, code lost:
    
        r17 = r1;
        r18 = r2;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void parse(java.io.Reader r19, java.lang.Object r20) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 308
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.api.client.http.UrlEncodedParser.parse(java.io.Reader, java.lang.Object):void");
    }

    private static Object parseValue(Type valueType, List<Type> context, String value) {
        Type resolved = Data.resolveWildcardTypeOrTypeVariable(context, valueType);
        return Data.parsePrimitiveValue(resolved, value);
    }

    @Override // com.google.api.client.util.ObjectParser
    public <T> T parseAndClose(InputStream inputStream, Charset charset, Class<T> cls) throws IOException {
        return (T) parseAndClose((Reader) new InputStreamReader(inputStream, charset), (Class) cls);
    }

    @Override // com.google.api.client.util.ObjectParser
    public Object parseAndClose(InputStream in, Charset charset, Type dataType) throws IOException {
        InputStreamReader r = new InputStreamReader(in, charset);
        return parseAndClose(r, dataType);
    }

    @Override // com.google.api.client.util.ObjectParser
    public <T> T parseAndClose(Reader reader, Class<T> cls) throws IOException {
        return (T) parseAndClose(reader, (Type) cls);
    }

    @Override // com.google.api.client.util.ObjectParser
    public Object parseAndClose(Reader reader, Type dataType) throws IOException {
        Preconditions.checkArgument(dataType instanceof Class, "dataType has to be of type Class<?>");
        Object newInstance = Types.newInstance((Class) dataType);
        parse(new BufferedReader(reader), newInstance);
        return newInstance;
    }
}
