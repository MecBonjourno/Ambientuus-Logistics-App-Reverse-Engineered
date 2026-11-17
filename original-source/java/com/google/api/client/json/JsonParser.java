package com.google.api.client.json;

import com.google.api.client.json.JsonPolymorphicTypeMap;
import com.google.api.client.util.ClassInfo;
import com.google.api.client.util.Data;
import com.google.api.client.util.FieldInfo;
import com.google.api.client.util.Preconditions;
import com.google.api.client.util.Sets;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/* loaded from: classes16.dex */
public abstract class JsonParser {
    private static WeakHashMap<Class<?>, Field> cachedTypemapFields = new WeakHashMap<>();
    private static final Lock lock = new ReentrantLock();

    public abstract void close() throws IOException;

    public abstract BigInteger getBigIntegerValue() throws IOException;

    public abstract byte getByteValue() throws IOException;

    public abstract String getCurrentName() throws IOException;

    public abstract JsonToken getCurrentToken();

    public abstract BigDecimal getDecimalValue() throws IOException;

    public abstract double getDoubleValue() throws IOException;

    public abstract JsonFactory getFactory();

    public abstract float getFloatValue() throws IOException;

    public abstract int getIntValue() throws IOException;

    public abstract long getLongValue() throws IOException;

    public abstract short getShortValue() throws IOException;

    public abstract String getText() throws IOException;

    public abstract JsonToken nextToken() throws IOException;

    public abstract JsonParser skipChildren() throws IOException;

    public final <T> T parseAndClose(Class<T> cls) throws IOException {
        return (T) parseAndClose((Class) cls, (CustomizeJsonParser) null);
    }

    public final <T> T parseAndClose(Class<T> cls, CustomizeJsonParser customizeJsonParser) throws IOException {
        try {
            return (T) parse((Class) cls, customizeJsonParser);
        } finally {
            close();
        }
    }

    public final void skipToKey(String keyToFind) throws IOException {
        skipToKey(Collections.singleton(keyToFind));
    }

    public final String skipToKey(Set<String> keysToFind) throws IOException {
        JsonToken curToken = startParsingObjectOrArray();
        while (curToken == JsonToken.FIELD_NAME) {
            String key = getText();
            nextToken();
            if (keysToFind.contains(key)) {
                return key;
            }
            skipChildren();
            curToken = nextToken();
        }
        return null;
    }

    private JsonToken startParsing() throws IOException {
        JsonToken currentToken = getCurrentToken();
        if (currentToken == null) {
            currentToken = nextToken();
        }
        Preconditions.checkArgument(currentToken != null, "no JSON input found");
        return currentToken;
    }

    private JsonToken startParsingObjectOrArray() throws IOException {
        JsonToken currentToken = startParsing();
        switch (currentToken) {
            case START_OBJECT:
                JsonToken currentToken2 = nextToken();
                Preconditions.checkArgument(currentToken2 == JsonToken.FIELD_NAME || currentToken2 == JsonToken.END_OBJECT, currentToken2);
                return currentToken2;
            case START_ARRAY:
                return nextToken();
            default:
                return currentToken;
        }
    }

    public final void parseAndClose(Object destination) throws IOException {
        parseAndClose(destination, (CustomizeJsonParser) null);
    }

    public final void parseAndClose(Object destination, CustomizeJsonParser customizeParser) throws IOException {
        try {
            parse(destination, customizeParser);
        } finally {
            close();
        }
    }

    public final <T> T parse(Class<T> cls) throws IOException {
        return (T) parse((Class) cls, (CustomizeJsonParser) null);
    }

    public final <T> T parse(Class<T> cls, CustomizeJsonParser customizeJsonParser) throws IOException {
        return (T) parse((Type) cls, false, customizeJsonParser);
    }

    public Object parse(Type dataType, boolean close) throws IOException {
        return parse(dataType, close, (CustomizeJsonParser) null);
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x002c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object parse(java.lang.reflect.Type r9, boolean r10, com.google.api.client.json.CustomizeJsonParser r11) throws java.io.IOException {
        /*
            r8 = this;
            java.lang.Class<java.lang.Void> r0 = java.lang.Void.class
            boolean r0 = r0.equals(r9)     // Catch: java.lang.Throwable -> L27
            if (r0 != 0) goto L10
            r8.startParsing()     // Catch: java.lang.Throwable -> Lc
            goto L10
        Lc:
            r0 = move-exception
            r3 = r9
            r6 = r11
            goto L2a
        L10:
            java.util.ArrayList r4 = new java.util.ArrayList     // Catch: java.lang.Throwable -> L27
            r4.<init>()     // Catch: java.lang.Throwable -> L27
            r5 = 0
            r7 = 1
            r2 = 0
            r1 = r8
            r3 = r9
            r6 = r11
            java.lang.Object r9 = r1.parseValue(r2, r3, r4, r5, r6, r7)     // Catch: java.lang.Throwable -> L25
            if (r10 == 0) goto L24
            r8.close()
        L24:
            return r9
        L25:
            r0 = move-exception
            goto L2a
        L27:
            r0 = move-exception
            r3 = r9
            r6 = r11
        L2a:
            if (r10 == 0) goto L2f
            r8.close()
        L2f:
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.api.client.json.JsonParser.parse(java.lang.reflect.Type, boolean, com.google.api.client.json.CustomizeJsonParser):java.lang.Object");
    }

    public final void parse(Object destination) throws IOException {
        parse(destination, (CustomizeJsonParser) null);
    }

    public final void parse(Object destination, CustomizeJsonParser customizeParser) throws IOException {
        ArrayList<Type> context = new ArrayList<>();
        context.add(destination.getClass());
        parse(context, destination, customizeParser);
    }

    /* JADX WARN: Incorrect condition in loop: B:13:0x0042 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void parse(java.util.ArrayList<java.lang.reflect.Type> r15, java.lang.Object r16, com.google.api.client.json.CustomizeJsonParser r17) throws java.io.IOException {
        /*
            r14 = this;
            r4 = r16
            boolean r0 = r4 instanceof com.google.api.client.json.GenericJson
            if (r0 == 0) goto L10
            r0 = r4
            com.google.api.client.json.GenericJson r0 = (com.google.api.client.json.GenericJson) r0
            com.google.api.client.json.JsonFactory r1 = r14.getFactory()
            r0.setFactory(r1)
        L10:
            com.google.api.client.json.JsonToken r0 = r14.startParsingObjectOrArray()
            java.lang.Class r11 = r4.getClass()
            com.google.api.client.util.ClassInfo r12 = com.google.api.client.util.ClassInfo.of(r11)
            java.lang.Class<com.google.api.client.util.GenericData> r1 = com.google.api.client.util.GenericData.class
            boolean r13 = r1.isAssignableFrom(r11)
            if (r13 != 0) goto L3d
            java.lang.Class<java.util.Map> r1 = java.util.Map.class
            boolean r1 = r1.isAssignableFrom(r11)
            if (r1 == 0) goto L3d
            r7 = r4
            java.util.Map r7 = (java.util.Map) r7
            r6 = 0
            java.lang.reflect.Type r8 = com.google.api.client.util.Types.getMapValueParameter(r11)
            r5 = r14
            r9 = r15
            r10 = r17
            r5.parseMap(r6, r7, r8, r9, r10)
            r5 = r10
            return
        L3d:
            r5 = r17
            r7 = r0
        L40:
            com.google.api.client.json.JsonToken r0 = com.google.api.client.json.JsonToken.FIELD_NAME
            if (r7 != r0) goto Lb6
            java.lang.String r8 = r14.getText()
            r14.nextToken()
            if (r5 == 0) goto L54
            boolean r0 = r5.stopAt(r4, r8)
            if (r0 == 0) goto L54
            return
        L54:
            com.google.api.client.util.FieldInfo r9 = r12.getFieldInfo(r8)
            if (r9 == 0) goto L93
            boolean r0 = r9.isFinal()
            if (r0 == 0) goto L6f
            boolean r0 = r9.isPrimitive()
            if (r0 == 0) goto L67
            goto L6f
        L67:
            java.lang.IllegalArgumentException r0 = new java.lang.IllegalArgumentException
            java.lang.String r1 = "final array/object fields are not supported"
            r0.<init>(r1)
            throw r0
        L6f:
            java.lang.reflect.Field r1 = r9.getField()
            int r10 = r15.size()
            java.lang.reflect.Type r0 = r1.getGenericType()
            r15.add(r0)
            java.lang.reflect.Type r2 = r9.getGenericType()
            r6 = 1
            r0 = r14
            r3 = r15
            java.lang.Object r2 = r0.parseValue(r1, r2, r3, r4, r5, r6)
            r15.remove(r10)
            r9.setValue(r4, r2)
            r5 = r17
            goto Lb1
        L93:
            if (r13 == 0) goto La7
            r10 = r4
            com.google.api.client.util.GenericData r10 = (com.google.api.client.util.GenericData) r10
            r2 = 0
            r6 = 1
            r1 = 0
            r0 = r14
            r3 = r15
            r5 = r17
            java.lang.Object r1 = r0.parseValue(r1, r2, r3, r4, r5, r6)
            r10.set(r8, r1)
            goto Lb1
        La7:
            r5 = r17
            if (r5 == 0) goto Lae
            r5.handleUnrecognizedKey(r4, r8)
        Lae:
            r14.skipChildren()
        Lb1:
            com.google.api.client.json.JsonToken r7 = r14.nextToken()
            goto L40
        Lb6:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.api.client.json.JsonParser.parse(java.util.ArrayList, java.lang.Object, com.google.api.client.json.CustomizeJsonParser):void");
    }

    public final <T> Collection<T> parseArrayAndClose(Class<?> destinationCollectionClass, Class<T> destinationItemClass) throws IOException {
        return parseArrayAndClose(destinationCollectionClass, destinationItemClass, (CustomizeJsonParser) null);
    }

    public final <T> Collection<T> parseArrayAndClose(Class<?> destinationCollectionClass, Class<T> destinationItemClass, CustomizeJsonParser customizeParser) throws IOException {
        try {
            return parseArray(destinationCollectionClass, destinationItemClass, customizeParser);
        } finally {
            close();
        }
    }

    public final <T> void parseArrayAndClose(Collection<? super T> destinationCollection, Class<T> destinationItemClass) throws IOException {
        parseArrayAndClose(destinationCollection, destinationItemClass, (CustomizeJsonParser) null);
    }

    public final <T> void parseArrayAndClose(Collection<? super T> destinationCollection, Class<T> destinationItemClass, CustomizeJsonParser customizeParser) throws IOException {
        try {
            parseArray(destinationCollection, destinationItemClass, customizeParser);
        } finally {
            close();
        }
    }

    public final <T> Collection<T> parseArray(Class<?> destinationCollectionClass, Class<T> destinationItemClass) throws IOException {
        return parseArray(destinationCollectionClass, destinationItemClass, (CustomizeJsonParser) null);
    }

    public final <T> Collection<T> parseArray(Class<?> cls, Class<T> cls2, CustomizeJsonParser customizeJsonParser) throws IOException {
        Collection<T> collection = (Collection<T>) Data.newCollectionInstance(cls);
        parseArray(collection, cls2, customizeJsonParser);
        return collection;
    }

    public final <T> void parseArray(Collection<? super T> destinationCollection, Class<T> destinationItemClass) throws IOException {
        parseArray(destinationCollection, destinationItemClass, (CustomizeJsonParser) null);
    }

    public final <T> void parseArray(Collection<? super T> destinationCollection, Class<T> destinationItemClass, CustomizeJsonParser customizeParser) throws IOException {
        parseArray(null, destinationCollection, destinationItemClass, new ArrayList<>(), customizeParser);
    }

    /* JADX WARN: Multi-variable type inference failed */
    private <T> void parseArray(Field fieldContext, Collection<T> collection, Type destinationItemType, ArrayList<Type> context, CustomizeJsonParser customizeParser) throws IOException {
        JsonToken curToken = startParsingObjectOrArray();
        while (curToken != JsonToken.END_ARRAY) {
            Field fieldContext2 = fieldContext;
            collection.add(parseValue(fieldContext2, destinationItemType, context, collection, customizeParser, true));
            curToken = nextToken();
            fieldContext = fieldContext2;
        }
    }

    private void parseMap(Field fieldContext, Map<String, Object> destinationMap, Type valueType, ArrayList<Type> context, CustomizeJsonParser customizeParser) throws IOException {
        JsonToken curToken = startParsingObjectOrArray();
        while (curToken == JsonToken.FIELD_NAME) {
            String key = getText();
            nextToken();
            if (customizeParser != null && customizeParser.stopAt(destinationMap, key)) {
                return;
            }
            Field fieldContext2 = fieldContext;
            Object value = parseValue(fieldContext2, valueType, context, destinationMap, customizeParser, true);
            destinationMap.put(key, value);
            curToken = nextToken();
            fieldContext = fieldContext2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:147:0x01bf A[Catch: IllegalArgumentException -> 0x0364, TryCatch #2 {IllegalArgumentException -> 0x0364, blocks: (B:14:0x0032, B:35:0x004a, B:37:0x0051, B:39:0x0058, B:41:0x0060, B:43:0x0068, B:45:0x0075, B:47:0x007d, B:49:0x008a, B:52:0x0093, B:56:0x00a9, B:61:0x00cb, B:64:0x00d5, B:68:0x00e0, B:69:0x00e5, B:72:0x00b1, B:74:0x00b9, B:76:0x00c1, B:79:0x00f0, B:81:0x00f9, B:83:0x0100, B:88:0x010e, B:92:0x0117, B:97:0x0121, B:102:0x012a, B:107:0x0133, B:112:0x013c, B:117:0x0145, B:120:0x014a, B:121:0x0162, B:122:0x0163, B:124:0x016c, B:126:0x0175, B:128:0x017e, B:130:0x0187, B:132:0x0190, B:134:0x0199, B:138:0x01a0, B:141:0x01a6, B:145:0x01b2, B:147:0x01bf, B:149:0x01c2, B:156:0x01cf, B:163:0x01e9, B:165:0x01f0, B:168:0x01fa, B:175:0x0202, B:177:0x020a), top: B:13:0x0032 }] */
    /* JADX WARN: Removed duplicated region for block: B:149:0x01c2 A[Catch: IllegalArgumentException -> 0x0364, TRY_LEAVE, TryCatch #2 {IllegalArgumentException -> 0x0364, blocks: (B:14:0x0032, B:35:0x004a, B:37:0x0051, B:39:0x0058, B:41:0x0060, B:43:0x0068, B:45:0x0075, B:47:0x007d, B:49:0x008a, B:52:0x0093, B:56:0x00a9, B:61:0x00cb, B:64:0x00d5, B:68:0x00e0, B:69:0x00e5, B:72:0x00b1, B:74:0x00b9, B:76:0x00c1, B:79:0x00f0, B:81:0x00f9, B:83:0x0100, B:88:0x010e, B:92:0x0117, B:97:0x0121, B:102:0x012a, B:107:0x0133, B:112:0x013c, B:117:0x0145, B:120:0x014a, B:121:0x0162, B:122:0x0163, B:124:0x016c, B:126:0x0175, B:128:0x017e, B:130:0x0187, B:132:0x0190, B:134:0x0199, B:138:0x01a0, B:141:0x01a6, B:145:0x01b2, B:147:0x01bf, B:149:0x01c2, B:156:0x01cf, B:163:0x01e9, B:165:0x01f0, B:168:0x01fa, B:175:0x0202, B:177:0x020a), top: B:13:0x0032 }] */
    /* JADX WARN: Removed duplicated region for block: B:207:0x02b7 A[Catch: IllegalArgumentException -> 0x0343, TryCatch #1 {IllegalArgumentException -> 0x0343, blocks: (B:205:0x02b2, B:207:0x02b7, B:210:0x02bd, B:213:0x02cf, B:215:0x02eb, B:219:0x02f7, B:217:0x02fd, B:222:0x0307), top: B:204:0x02b2 }] */
    /* JADX WARN: Removed duplicated region for block: B:209:0x02bc A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:210:0x02bd A[Catch: IllegalArgumentException -> 0x0343, TryCatch #1 {IllegalArgumentException -> 0x0343, blocks: (B:205:0x02b2, B:207:0x02b7, B:210:0x02bd, B:213:0x02cf, B:215:0x02eb, B:219:0x02f7, B:217:0x02fd, B:222:0x0307), top: B:204:0x02b2 }] */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0371  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x037c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object parseValue(java.lang.reflect.Field r21, java.lang.reflect.Type r22, java.util.ArrayList<java.lang.reflect.Type> r23, java.lang.Object r24, com.google.api.client.json.CustomizeJsonParser r25, boolean r26) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 944
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.api.client.json.JsonParser.parseValue(java.lang.reflect.Field, java.lang.reflect.Type, java.util.ArrayList, java.lang.Object, com.google.api.client.json.CustomizeJsonParser, boolean):java.lang.Object");
    }

    private static Field getCachedTypemapFieldFor(Class<?> cls) {
        if (cls == null) {
            return null;
        }
        lock.lock();
        try {
            if (cachedTypemapFields.containsKey(cls)) {
                return cachedTypemapFields.get(cls);
            }
            Field field = null;
            Iterator<FieldInfo> it = ClassInfo.of(cls).getFieldInfos().iterator();
            while (it.hasNext()) {
                Field field2 = it.next().getField();
                JsonPolymorphicTypeMap jsonPolymorphicTypeMap = (JsonPolymorphicTypeMap) field2.getAnnotation(JsonPolymorphicTypeMap.class);
                if (jsonPolymorphicTypeMap != null) {
                    boolean z = false;
                    Preconditions.checkArgument(field == null, "Class contains more than one field with @JsonPolymorphicTypeMap annotation: %s", cls);
                    Preconditions.checkArgument(Data.isPrimitive(field2.getType()), "Field which has the @JsonPolymorphicTypeMap, %s, is not a supported type: %s", cls, field2.getType());
                    field = field2;
                    JsonPolymorphicTypeMap.TypeDef[] typeDefinitions = jsonPolymorphicTypeMap.typeDefinitions();
                    HashSet newHashSet = Sets.newHashSet();
                    Preconditions.checkArgument(typeDefinitions.length > 0, "@JsonPolymorphicTypeMap must have at least one @TypeDef");
                    int length = typeDefinitions.length;
                    int i = 0;
                    while (i < length) {
                        JsonPolymorphicTypeMap.TypeDef typeDef = typeDefinitions[i];
                        boolean add = newHashSet.add(typeDef.key());
                        boolean z2 = z;
                        Object[] objArr = new Object[1];
                        objArr[z2 ? 1 : 0] = typeDef.key();
                        Preconditions.checkArgument(add, "Class contains two @TypeDef annotations with identical key: %s", objArr);
                        i++;
                        z = z2 ? 1 : 0;
                    }
                }
            }
            cachedTypemapFields.put(cls, field);
            return field;
        } finally {
            lock.unlock();
        }
    }
}
