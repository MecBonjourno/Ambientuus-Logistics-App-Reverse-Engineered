package com.google.api.client.extensions.android.json;

import android.util.JsonReader;
import androidx.credentials.provider.CredentialEntry;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.JsonParser;
import com.google.api.client.json.JsonToken;
import com.google.api.client.util.Preconditions;
import java.io.EOFException;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

/* carregado de: classes16.dex */
class AndroidJsonParser extends JsonParser {
    private List<String> currentNameStack = new ArrayList();
    private String currentText;
    private JsonToken currentToken;
    private final AndroidJsonFactory factory;
    private final JsonReader reader;

    AndroidJsonParser(AndroidJsonFactory factory, JsonReader reader) {
        this.factory = factory;
        this.reader = reader;
        reader.setLenient(true);
    }

    @Override // com.google.api.client.json.JsonParser
    public void close() throws IOException {
        this.reader.close();
    }

    @Override // com.google.api.client.json.JsonParser
    public String getCurrentName() {
        if (this.currentNameStack.isEmpty()) {
            return null;
        }
        return this.currentNameStack.get(this.currentNameStack.size() - 1);
    }

    @Override // com.google.api.client.json.JsonParser
    public JsonToken getCurrentToken() {
        return this.currentToken;
    }

    @Override // com.google.api.client.json.JsonParser
    public JsonFactory getFactory() {
        return this.factory;
    }

    @Override // com.google.api.client.json.JsonParser
    public byte getByteValue() {
        checkNumber();
        return Byte.parseByte(this.currentText);
    }

    @Override // com.google.api.client.json.JsonParser
    public short getShortValue() {
        checkNumber();
        return Short.parseShort(this.currentText);
    }

    @Override // com.google.api.client.json.JsonParser
    public int getIntValue() {
        checkNumber();
        return Integer.parseInt(this.currentText);
    }

    @Override // com.google.api.client.json.JsonParser
    public float getFloatValue() {
        checkNumber();
        return Float.parseFloat(this.currentText);
    }

    @Override // com.google.api.client.json.JsonParser
    public BigInteger getBigIntegerValue() {
        checkNumber();
        return new BigInteger(this.currentText);
    }

    @Override // com.google.api.client.json.JsonParser
    public BigDecimal getDecimalValue() {
        checkNumber();
        return new BigDecimal(this.currentText);
    }

    @Override // com.google.api.client.json.JsonParser
    public double getDoubleValue() {
        checkNumber();
        return Double.parseDouble(this.currentText);
    }

    @Override // com.google.api.client.json.JsonParser
    public long getLongValue() {
        checkNumber();
        return Long.parseLong(this.currentText);
    }

    private void checkNumber() {
        Preconditions.checkArgument(this.currentToken == JsonToken.VALUE_NUMBER_INT || this.currentToken == JsonToken.VALUE_NUMBER_FLOAT);
    }

    @Override // com.google.api.client.json.JsonParser
    public String getText() {
        return this.currentText;
    }

    @Override // com.google.api.client.json.JsonParser
    public JsonToken nextToken() throws IOException {
        android.util.JsonToken peek;
        if (this.currentToken != null) {
            switch (this.currentToken) {
                case START_ARRAY:
                    this.reader.beginArray();
                    this.currentNameStack.add(null);
                    break;
                case START_OBJECT:
                    this.reader.beginObject();
                    this.currentNameStack.add(null);
                    break;
            }
        }
        try {
            peek = this.reader.peek();
        } catch (EOFException e) {
            peek = android.util.JsonToken.END_DOCUMENT;
        }
        switch (AnonymousClass1.$SwitchMap$android$util$JsonToken[peek.ordinal()]) {
            case 1:
                this.currentText = "[";
                this.currentToken = JsonToken.START_ARRAY;
                break;
            case 2:
                this.currentText = "]";
                this.currentToken = JsonToken.END_ARRAY;
                this.currentNameStack.remove(this.currentNameStack.size() - 1);
                this.reader.endArray();
                break;
            case 3:
                this.currentText = "{";
                this.currentToken = JsonToken.START_OBJECT;
                break;
            case 4:
                this.currentText = "}";
                this.currentToken = JsonToken.END_OBJECT;
                this.currentNameStack.remove(this.currentNameStack.size() - 1);
                this.reader.endObject();
                break;
            case 5:
                if (this.reader.nextBoolean()) {
                    this.currentText = CredentialEntry.TRUE_STRING;
                    this.currentToken = JsonToken.VALUE_TRUE;
                    break;
                } else {
                    this.currentText = CredentialEntry.FALSE_STRING;
                    this.currentToken = JsonToken.VALUE_FALSE;
                    break;
                }
            case 6:
                this.currentText = "null";
                this.currentToken = JsonToken.VALUE_NULL;
                this.reader.nextNull();
                break;
            case 7:
                this.currentText = this.reader.nextString();
                this.currentToken = JsonToken.VALUE_STRING;
                break;
            case 8:
                this.currentText = this.reader.nextString();
                this.currentToken = this.currentText.indexOf(46) == -1 ? JsonToken.VALUE_NUMBER_INT : JsonToken.VALUE_NUMBER_FLOAT;
                break;
            case 9:
                this.currentText = this.reader.nextName();
                this.currentToken = JsonToken.FIELD_NAME;
                this.currentNameStack.set(this.currentNameStack.size() - 1, this.currentText);
                break;
            default:
                this.currentText = null;
                this.currentToken = null;
                break;
        }
        return this.currentToken;
    }

    /* renomeado de: com.google.api.client.extensions.android.json.AndroidJsonParser$1, motivo: nome de classe inválido */
    static /* sintético */ class AnonymousClass1 {
        static final /* sintético */ int[] $SwitchMap$android$util$JsonToken = new int[android.util.JsonToken.values().length];

        static {
            try {
                $SwitchMap$android$util$JsonToken[android.util.JsonToken.BEGIN_ARRAY.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$android$util$JsonToken[android.util.JsonToken.END_ARRAY.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$android$util$JsonToken[android.util.JsonToken.BEGIN_OBJECT.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$android$util$JsonToken[android.util.JsonToken.END_OBJECT.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$android$util$JsonToken[android.util.JsonToken.BOOLEAN.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$android$util$JsonToken[android.util.JsonToken.NULL.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$android$util$JsonToken[android.util.JsonToken.STRING.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
            try {
                $SwitchMap$android$util$JsonToken[android.util.JsonToken.NUMBER.ordinal()] = 8;
            } catch (NoSuchFieldError e8) {
            }
            try {
                $SwitchMap$android$util$JsonToken[android.util.JsonToken.NAME.ordinal()] = 9;
            } catch (NoSuchFieldError e9) {
            }
            $SwitchMap$com$google$api$client$json$JsonToken = new int[JsonToken.values().length];
            try {
                $SwitchMap$com$google$api$client$json$JsonToken[JsonToken.START_ARRAY.ordinal()] = 1;
            } catch (NoSuchFieldError e10) {
            }
            try {
                $SwitchMap$com$google$api$client$json$JsonToken[JsonToken.START_OBJECT.ordinal()] = 2;
            } catch (NoSuchFieldError e11) {
            }
        }
    }

    /* JADX WARN: não é possível corrigir a ordem dos casos do switch; parte do código será duplicada */
    @Override // com.google.api.client.json.JsonParser
    public JsonParser skipChildren() throws IOException {
        if (this.currentToken != null) {
            switch (this.currentToken) {
                case START_ARRAY:
                    this.reader.skipValue();
                    this.currentText = "]";
                    this.currentToken = JsonToken.END_ARRAY;
                    break;
                case START_OBJECT:
                    this.reader.skipValue();
                    this.currentText = "}";
                    this.currentToken = JsonToken.END_OBJECT;
                    break;
            }
        }
        return this;
    }
}
