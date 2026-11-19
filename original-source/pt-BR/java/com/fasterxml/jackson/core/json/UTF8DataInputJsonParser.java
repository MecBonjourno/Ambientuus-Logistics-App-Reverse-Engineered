package com.fasterxml.jackson.core.json;

import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.credentials.provider.CredentialEntry;
import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.JsonLocation;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.core.base.GeneratorBase;
import com.fasterxml.jackson.core.base.ParserBase;
import com.fasterxml.jackson.core.io.CharTypes;
import com.fasterxml.jackson.core.io.IOContext;
import com.fasterxml.jackson.core.sym.ByteQuadsCanonicalizer;
import com.fasterxml.jackson.core.util.ByteArrayBuilder;
import java.io.DataInput;
import java.io.EOFException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Writer;
import java.util.Arrays;
import org.apache.commons.lang.CharUtils;

/* carregado de: classes.dex */
public class UTF8DataInputJsonParser extends ParserBase {
    static final byte BYTE_LF = 10;
    protected DataInput _inputData;
    protected int _nextByte;
    protected ObjectCodec _objectCodec;
    private int _quad1;
    protected int[] _quadBuffer;
    protected final ByteQuadsCanonicalizer _symbols;
    protected boolean _tokenIncomplete;
    private static final int[] _icUTF8 = CharTypes.getInputCodeUtf8();
    protected static final int[] _icLatin1 = CharTypes.getInputCodeLatin1();

    public UTF8DataInputJsonParser(IOContext ctxt, int features, DataInput inputData, ObjectCodec codec, ByteQuadsCanonicalizer sym, int firstByte) {
        super(ctxt, features);
        this._quadBuffer = new int[16];
        this._nextByte = -1;
        this._objectCodec = codec;
        this._symbols = sym;
        this._inputData = inputData;
        this._nextByte = firstByte;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public ObjectCodec getCodec() {
        return this._objectCodec;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public void setCodec(ObjectCodec c) {
        this._objectCodec = c;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int releaseBuffered(OutputStream out) throws IOException {
        return 0;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public Object getInputSource() {
        return this._inputData;
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase
    protected void _closeInput() throws IOException {
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase
    protected void _releaseBuffers() throws IOException {
        super._releaseBuffers();
        this._symbols.release();
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public String getText() throws IOException {
        if (this._currToken == JsonToken.VALUE_STRING) {
            if (this._tokenIncomplete) {
                this._tokenIncomplete = false;
                return _finishAndReturnString();
            }
            return this._textBuffer.contentsAsString();
        }
        return _getText2(this._currToken);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int getText(Writer writer) throws IOException {
        JsonToken t = this._currToken;
        if (t == JsonToken.VALUE_STRING) {
            if (this._tokenIncomplete) {
                this._tokenIncomplete = false;
                _finishString();
            }
            return this._textBuffer.contentsToWriter(writer);
        }
        if (t == JsonToken.FIELD_NAME) {
            String n = this._parsingContext.getCurrentName();
            writer.write(n);
            return n.length();
        }
        if (t == null) {
            return 0;
        }
        if (t.isNumeric()) {
            return this._textBuffer.contentsToWriter(writer);
        }
        char[] ch = t.asCharArray();
        writer.write(ch);
        return ch.length;
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public String getValueAsString() throws IOException {
        if (this._currToken == JsonToken.VALUE_STRING) {
            if (this._tokenIncomplete) {
                this._tokenIncomplete = false;
                return _finishAndReturnString();
            }
            return this._textBuffer.contentsAsString();
        }
        if (this._currToken == JsonToken.FIELD_NAME) {
            return getCurrentName();
        }
        return super.getValueAsString(null);
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public String getValueAsString(String defValue) throws IOException {
        if (this._currToken == JsonToken.VALUE_STRING) {
            if (this._tokenIncomplete) {
                this._tokenIncomplete = false;
                return _finishAndReturnString();
            }
            return this._textBuffer.contentsAsString();
        }
        if (this._currToken == JsonToken.FIELD_NAME) {
            return getCurrentName();
        }
        return super.getValueAsString(defValue);
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public int getValueAsInt() throws IOException {
        JsonToken t = this._currToken;
        if (t == JsonToken.VALUE_NUMBER_INT || t == JsonToken.VALUE_NUMBER_FLOAT) {
            if ((this._numTypesValid & 1) == 0) {
                if (this._numTypesValid == 0) {
                    return _parseIntValue();
                }
                if ((this._numTypesValid & 1) == 0) {
                    convertNumberToInt();
                }
            }
            return this._numberInt;
        }
        return super.getValueAsInt(0);
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public int getValueAsInt(int defValue) throws IOException {
        JsonToken t = this._currToken;
        if (t == JsonToken.VALUE_NUMBER_INT || t == JsonToken.VALUE_NUMBER_FLOAT) {
            if ((this._numTypesValid & 1) == 0) {
                if (this._numTypesValid == 0) {
                    return _parseIntValue();
                }
                if ((this._numTypesValid & 1) == 0) {
                    convertNumberToInt();
                }
            }
            return this._numberInt;
        }
        return super.getValueAsInt(defValue);
    }

    protected final String _getText2(JsonToken t) {
        if (t == null) {
            return null;
        }
        switch (t.id()) {
            case 5:
                return this._parsingContext.getCurrentName();
            case 6:
            case 7:
            case 8:
                return this._textBuffer.contentsAsString();
            default:
                return t.asString();
        }
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public char[] getTextCharacters() throws IOException {
        if (this._currToken != null) {
            switch (this._currToken.id()) {
                case 5:
                    if (!this._nameCopied) {
                        String name = this._parsingContext.getCurrentName();
                        int nameLen = name.length();
                        if (this._nameCopyBuffer == null) {
                            this._nameCopyBuffer = this._ioContext.allocNameCopyBuffer(nameLen);
                        } else if (this._nameCopyBuffer.length < nameLen) {
                            this._nameCopyBuffer = new char[nameLen];
                        }
                        name.getChars(0, nameLen, this._nameCopyBuffer, 0);
                        this._nameCopied = true;
                    }
                    return this._nameCopyBuffer;
                case 6:
                    if (this._tokenIncomplete) {
                        this._tokenIncomplete = false;
                        _finishString();
                        break;
                    }
                    break;
                case 7:
                case 8:
                    break;
                default:
                    return this._currToken.asCharArray();
            }
            return this._textBuffer.getTextBuffer();
        }
        return null;
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public int getTextLength() throws IOException {
        if (this._currToken == JsonToken.VALUE_STRING) {
            if (this._tokenIncomplete) {
                this._tokenIncomplete = false;
                _finishString();
            }
            return this._textBuffer.size();
        }
        if (this._currToken == JsonToken.FIELD_NAME) {
            return this._parsingContext.getCurrentName().length();
        }
        if (this._currToken == null) {
            return 0;
        }
        if (this._currToken.isNumeric()) {
            return this._textBuffer.size();
        }
        return this._currToken.asCharArray().length;
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public int getTextOffset() throws IOException {
        if (this._currToken != null) {
            switch (this._currToken.id()) {
                case 5:
                    return 0;
                case 6:
                    if (this._tokenIncomplete) {
                        this._tokenIncomplete = false;
                        _finishString();
                        break;
                    }
                    break;
            }
            return this._textBuffer.getTextOffset();
        }
        return 0;
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase, com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public byte[] getBinaryValue(Base64Variant b64variant) throws IOException {
        if (this._currToken != JsonToken.VALUE_STRING && (this._currToken != JsonToken.VALUE_EMBEDDED_OBJECT || this._binaryValue == null)) {
            _reportError("Current token (" + this._currToken + ") not VALUE_STRING or VALUE_EMBEDDED_OBJECT, can not access as binary");
        }
        if (this._tokenIncomplete) {
            try {
                this._binaryValue = _decodeBase64(b64variant);
                this._tokenIncomplete = false;
            } catch (IllegalArgumentException iae) {
                throw _constructError("Failed to decode VALUE_STRING as base64 (" + b64variant + "): " + iae.getMessage());
            }
        } else if (this._binaryValue == null) {
            ByteArrayBuilder builder = _getByteArrayBuilder();
            _decodeBase64(getText(), builder, b64variant);
            this._binaryValue = builder.toByteArray();
        }
        return this._binaryValue;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int readBinaryValue(Base64Variant b64variant, OutputStream out) throws IOException {
        if (!this._tokenIncomplete || this._currToken != JsonToken.VALUE_STRING) {
            byte[] b = getBinaryValue(b64variant);
            out.write(b);
            return b.length;
        }
        byte[] buf = this._ioContext.allocBase64Buffer();
        try {
            return _readBinary(b64variant, out, buf);
        } finally {
            this._ioContext.releaseBase64Buffer(buf);
        }
    }

    protected int _readBinary(Base64Variant b64variant, OutputStream out, byte[] buffer) throws IOException {
        int outputPtr = 0;
        int outputEnd = buffer.length - 3;
        int outputCount = 0;
        while (true) {
            int ch = this._inputData.readUnsignedByte();
            if (ch > 32) {
                int bits = b64variant.decodeBase64Char(ch);
                if (bits < 0) {
                    if (ch == 34) {
                        break;
                    }
                    bits = _decodeBase64Escape(b64variant, ch, 0);
                    if (bits < 0) {
                        continue;
                    }
                }
                if (outputPtr > outputEnd) {
                    outputCount += outputPtr;
                    out.write(buffer, 0, outputPtr);
                    outputPtr = 0;
                }
                int decodedData = bits;
                int ch2 = this._inputData.readUnsignedByte();
                int bits2 = b64variant.decodeBase64Char(ch2);
                if (bits2 < 0) {
                    bits2 = _decodeBase64Escape(b64variant, ch2, 1);
                }
                int decodedData2 = (decodedData << 6) | bits2;
                int ch3 = this._inputData.readUnsignedByte();
                int bits3 = b64variant.decodeBase64Char(ch3);
                if (bits3 < 0) {
                    if (bits3 != -2) {
                        if (ch3 == 34 && !b64variant.usesPadding()) {
                            buffer[outputPtr] = (byte) (decodedData2 >> 4);
                            outputPtr++;
                            break;
                        }
                        bits3 = _decodeBase64Escape(b64variant, ch3, 2);
                    }
                    if (bits3 == -2) {
                        int ch4 = this._inputData.readUnsignedByte();
                        if (!b64variant.usesPaddingChar(ch4)) {
                            throw reportInvalidBase64Char(b64variant, ch4, 3, "expected padding character '" + b64variant.getPaddingChar() + "'");
                        }
                        buffer[outputPtr] = (byte) (decodedData2 >> 4);
                        outputPtr++;
                    }
                }
                int decodedData3 = (decodedData2 << 6) | bits3;
                int ch5 = this._inputData.readUnsignedByte();
                int bits4 = b64variant.decodeBase64Char(ch5);
                if (bits4 < 0) {
                    if (bits4 != -2) {
                        if (ch5 == 34 && !b64variant.usesPadding()) {
                            int decodedData4 = decodedData3 >> 2;
                            int outputPtr2 = outputPtr + 1;
                            buffer[outputPtr] = (byte) (decodedData4 >> 8);
                            outputPtr = outputPtr2 + 1;
                            buffer[outputPtr2] = (byte) decodedData4;
                            break;
                        }
                        bits4 = _decodeBase64Escape(b64variant, ch5, 3);
                    }
                    if (bits4 == -2) {
                        int decodedData5 = decodedData3 >> 2;
                        int outputPtr3 = outputPtr + 1;
                        buffer[outputPtr] = (byte) (decodedData5 >> 8);
                        outputPtr = outputPtr3 + 1;
                        buffer[outputPtr3] = (byte) decodedData5;
                    }
                }
                int decodedData6 = (decodedData3 << 6) | bits4;
                int outputPtr4 = outputPtr + 1;
                buffer[outputPtr] = (byte) (decodedData6 >> 16);
                int outputPtr5 = outputPtr4 + 1;
                buffer[outputPtr4] = (byte) (decodedData6 >> 8);
                buffer[outputPtr5] = (byte) decodedData6;
                outputPtr = outputPtr5 + 1;
            }
        }
        this._tokenIncomplete = false;
        if (outputPtr > 0) {
            int outputCount2 = outputCount + outputPtr;
            out.write(buffer, 0, outputPtr);
            return outputCount2;
        }
        return outputCount;
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public JsonToken nextToken() throws IOException {
        JsonToken t;
        if (this._closed) {
            return null;
        }
        if (this._currToken == JsonToken.FIELD_NAME) {
            return _nextAfterName();
        }
        this._numTypesValid = 0;
        if (this._tokenIncomplete) {
            _skipString();
        }
        int i = _skipWSOrEnd();
        if (i < 0) {
            close();
            this._currToken = null;
            return null;
        }
        this._binaryValue = null;
        this._tokenInputRow = this._currInputRow;
        if (i == 93 || i == 125) {
            _closeScope(i);
            return this._currToken;
        }
        if (this._parsingContext.expectComma()) {
            if (i != 44) {
                _reportUnexpectedChar(i, "was expecting comma to separate " + this._parsingContext.typeDesc() + " entries");
            }
            i = _skipWS();
            if (JsonParser.Feature.ALLOW_TRAILING_COMMA.enabledIn(this._features) && (i == 93 || i == 125)) {
                _closeScope(i);
                return this._currToken;
            }
        }
        if (!this._parsingContext.inObject()) {
            return _nextTokenNotInObject(i);
        }
        String n = _parseName(i);
        this._parsingContext.setCurrentName(n);
        this._currToken = JsonToken.FIELD_NAME;
        int i2 = _skipColon();
        if (i2 == 34) {
            this._tokenIncomplete = true;
            this._nextToken = JsonToken.VALUE_STRING;
            return this._currToken;
        }
        switch (i2) {
            case 45:
                t = _parseNegNumber();
                break;
            case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE /* 48 */:
            case 49:
            case 50:
            case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_TAG /* 51 */:
            case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_BASELINE_TO_TOP_OF /* 52 */:
            case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_BASELINE_TO_BOTTOM_OF /* 53 */:
            case ConstraintLayout.LayoutParams.Table.LAYOUT_MARGIN_BASELINE /* 54 */:
            case ConstraintLayout.LayoutParams.Table.LAYOUT_GONE_MARGIN_BASELINE /* 55 */:
            case 56:
            case 57:
                t = _parsePosNumber(i2);
                break;
            case 91:
                t = JsonToken.START_ARRAY;
                break;
            case 102:
                _matchToken(CredentialEntry.FALSE_STRING, 1);
                t = JsonToken.VALUE_FALSE;
                break;
            case 110:
                _matchToken("null", 1);
                t = JsonToken.VALUE_NULL;
                break;
            case 116:
                _matchToken(CredentialEntry.TRUE_STRING, 1);
                t = JsonToken.VALUE_TRUE;
                break;
            case 123:
                t = JsonToken.START_OBJECT;
                break;
            default:
                t = _handleUnexpectedValue(i2);
                break;
        }
        this._nextToken = t;
        return this._currToken;
    }

    private final JsonToken _nextTokenNotInObject(int i) throws IOException {
        if (i == 34) {
            this._tokenIncomplete = true;
            JsonToken jsonToken = JsonToken.VALUE_STRING;
            this._currToken = jsonToken;
            return jsonToken;
        }
        switch (i) {
            case 45:
                JsonToken _parseNegNumber = _parseNegNumber();
                this._currToken = _parseNegNumber;
                return _parseNegNumber;
            case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE /* 48 */:
            case 49:
            case 50:
            case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_TAG /* 51 */:
            case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_BASELINE_TO_TOP_OF /* 52 */:
            case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_BASELINE_TO_BOTTOM_OF /* 53 */:
            case ConstraintLayout.LayoutParams.Table.LAYOUT_MARGIN_BASELINE /* 54 */:
            case ConstraintLayout.LayoutParams.Table.LAYOUT_GONE_MARGIN_BASELINE /* 55 */:
            case 56:
            case 57:
                JsonToken _parsePosNumber = _parsePosNumber(i);
                this._currToken = _parsePosNumber;
                return _parsePosNumber;
            case 91:
                this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
                JsonToken jsonToken2 = JsonToken.START_ARRAY;
                this._currToken = jsonToken2;
                return jsonToken2;
            case 102:
                _matchToken(CredentialEntry.FALSE_STRING, 1);
                JsonToken jsonToken3 = JsonToken.VALUE_FALSE;
                this._currToken = jsonToken3;
                return jsonToken3;
            case 110:
                _matchToken("null", 1);
                JsonToken jsonToken4 = JsonToken.VALUE_NULL;
                this._currToken = jsonToken4;
                return jsonToken4;
            case 116:
                _matchToken(CredentialEntry.TRUE_STRING, 1);
                JsonToken jsonToken5 = JsonToken.VALUE_TRUE;
                this._currToken = jsonToken5;
                return jsonToken5;
            case 123:
                this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
                JsonToken jsonToken6 = JsonToken.START_OBJECT;
                this._currToken = jsonToken6;
                return jsonToken6;
            default:
                JsonToken _handleUnexpectedValue = _handleUnexpectedValue(i);
                this._currToken = _handleUnexpectedValue;
                return _handleUnexpectedValue;
        }
    }

    private final JsonToken _nextAfterName() {
        this._nameCopied = false;
        JsonToken t = this._nextToken;
        this._nextToken = null;
        if (t == JsonToken.START_ARRAY) {
            this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
        } else if (t == JsonToken.START_OBJECT) {
            this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
        }
        this._currToken = t;
        return t;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public void finishToken() throws IOException {
        if (this._tokenIncomplete) {
            this._tokenIncomplete = false;
            _finishString();
        }
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public String nextFieldName() throws IOException {
        JsonToken t;
        this._numTypesValid = 0;
        if (this._currToken == JsonToken.FIELD_NAME) {
            _nextAfterName();
            return null;
        }
        if (this._tokenIncomplete) {
            _skipString();
        }
        int i = _skipWS();
        this._binaryValue = null;
        this._tokenInputRow = this._currInputRow;
        if (i == 93 || i == 125) {
            _closeScope(i);
            return null;
        }
        if (this._parsingContext.expectComma()) {
            if (i != 44) {
                _reportUnexpectedChar(i, "was expecting comma to separate " + this._parsingContext.typeDesc() + " entries");
            }
            i = _skipWS();
            if (JsonParser.Feature.ALLOW_TRAILING_COMMA.enabledIn(this._features) && (i == 93 || i == 125)) {
                _closeScope(i);
                return null;
            }
        }
        if (!this._parsingContext.inObject()) {
            _nextTokenNotInObject(i);
            return null;
        }
        String nameStr = _parseName(i);
        this._parsingContext.setCurrentName(nameStr);
        this._currToken = JsonToken.FIELD_NAME;
        int i2 = _skipColon();
        if (i2 == 34) {
            this._tokenIncomplete = true;
            this._nextToken = JsonToken.VALUE_STRING;
            return nameStr;
        }
        switch (i2) {
            case 45:
                t = _parseNegNumber();
                break;
            case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE /* 48 */:
            case 49:
            case 50:
            case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_TAG /* 51 */:
            case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_BASELINE_TO_TOP_OF /* 52 */:
            case ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_BASELINE_TO_BOTTOM_OF /* 53 */:
            case ConstraintLayout.LayoutParams.Table.LAYOUT_MARGIN_BASELINE /* 54 */:
            case ConstraintLayout.LayoutParams.Table.LAYOUT_GONE_MARGIN_BASELINE /* 55 */:
            case 56:
            case 57:
                t = _parsePosNumber(i2);
                break;
            case 91:
                t = JsonToken.START_ARRAY;
                break;
            case 102:
                _matchToken(CredentialEntry.FALSE_STRING, 1);
                t = JsonToken.VALUE_FALSE;
                break;
            case 110:
                _matchToken("null", 1);
                t = JsonToken.VALUE_NULL;
                break;
            case 116:
                _matchToken(CredentialEntry.TRUE_STRING, 1);
                t = JsonToken.VALUE_TRUE;
                break;
            case 123:
                t = JsonToken.START_OBJECT;
                break;
            default:
                t = _handleUnexpectedValue(i2);
                break;
        }
        this._nextToken = t;
        return nameStr;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public String nextTextValue() throws IOException {
        if (this._currToken == JsonToken.FIELD_NAME) {
            this._nameCopied = false;
            JsonToken t = this._nextToken;
            this._nextToken = null;
            this._currToken = t;
            if (t == JsonToken.VALUE_STRING) {
                if (this._tokenIncomplete) {
                    this._tokenIncomplete = false;
                    return _finishAndReturnString();
                }
                return this._textBuffer.contentsAsString();
            }
            if (t == JsonToken.START_ARRAY) {
                this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
            } else if (t == JsonToken.START_OBJECT) {
                this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
            }
            return null;
        }
        if (nextToken() == JsonToken.VALUE_STRING) {
            return getText();
        }
        return null;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int nextIntValue(int defaultValue) throws IOException {
        if (this._currToken != JsonToken.FIELD_NAME) {
            return nextToken() == JsonToken.VALUE_NUMBER_INT ? getIntValue() : defaultValue;
        }
        this._nameCopied = false;
        JsonToken t = this._nextToken;
        this._nextToken = null;
        this._currToken = t;
        if (t == JsonToken.VALUE_NUMBER_INT) {
            return getIntValue();
        }
        if (t == JsonToken.START_ARRAY) {
            this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
        } else if (t == JsonToken.START_OBJECT) {
            this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
        }
        return defaultValue;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public long nextLongValue(long defaultValue) throws IOException {
        if (this._currToken != JsonToken.FIELD_NAME) {
            return nextToken() == JsonToken.VALUE_NUMBER_INT ? getLongValue() : defaultValue;
        }
        this._nameCopied = false;
        JsonToken t = this._nextToken;
        this._nextToken = null;
        this._currToken = t;
        if (t == JsonToken.VALUE_NUMBER_INT) {
            return getLongValue();
        }
        if (t == JsonToken.START_ARRAY) {
            this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
        } else if (t == JsonToken.START_OBJECT) {
            this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
        }
        return defaultValue;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public Boolean nextBooleanValue() throws IOException {
        if (this._currToken == JsonToken.FIELD_NAME) {
            this._nameCopied = false;
            JsonToken t = this._nextToken;
            this._nextToken = null;
            this._currToken = t;
            if (t == JsonToken.VALUE_TRUE) {
                return Boolean.TRUE;
            }
            if (t == JsonToken.VALUE_FALSE) {
                return Boolean.FALSE;
            }
            if (t == JsonToken.START_ARRAY) {
                this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
            } else if (t == JsonToken.START_OBJECT) {
                this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
            }
            return null;
        }
        JsonToken t2 = nextToken();
        if (t2 == JsonToken.VALUE_TRUE) {
            return Boolean.TRUE;
        }
        if (t2 == JsonToken.VALUE_FALSE) {
            return Boolean.FALSE;
        }
        return null;
    }

    protected JsonToken _parsePosNumber(int c) throws IOException {
        int c2;
        int outPtr;
        char[] outBuf = this._textBuffer.emptyAndGetCurrentSegment();
        if (c == 48) {
            c2 = _handleLeadingZeroes();
            if (c2 <= 57 && c2 >= 48) {
                outPtr = 0;
            } else {
                outBuf[0] = '0';
                outPtr = 1;
            }
        } else {
            outBuf[0] = (char) c;
            c2 = this._inputData.readUnsignedByte();
            outPtr = 1;
        }
        int i = outPtr;
        int i2 = outPtr;
        int c3 = c2;
        int outPtr2 = i2;
        int intLen = i;
        while (c3 <= 57 && c3 >= 48) {
            intLen++;
            outBuf[outPtr2] = (char) c3;
            c3 = this._inputData.readUnsignedByte();
            outPtr2++;
        }
        if (c3 == 46 || c3 == 101 || c3 == 69) {
            return _parseFloat(outBuf, outPtr2, c3, false, intLen);
        }
        this._textBuffer.setCurrentLength(outPtr2);
        if (this._parsingContext.inRoot()) {
            _verifyRootSpace();
        } else {
            this._nextByte = c3;
        }
        return resetInt(false, intLen);
    }

    protected JsonToken _parseNegNumber() throws IOException {
        int c;
        char[] outBuf = this._textBuffer.emptyAndGetCurrentSegment();
        int outPtr = 0 + 1;
        outBuf[0] = '-';
        int c2 = this._inputData.readUnsignedByte();
        int outPtr2 = outPtr + 1;
        outBuf[outPtr] = (char) c2;
        if (c2 <= 48) {
            if (c2 == 48) {
                c = _handleLeadingZeroes();
            } else {
                return _handleInvalidNumberStart(c2, true);
            }
        } else {
            if (c2 > 57) {
                return _handleInvalidNumberStart(c2, true);
            }
            c = this._inputData.readUnsignedByte();
        }
        int intLen = 1;
        while (c <= 57 && c >= 48) {
            intLen++;
            outBuf[outPtr2] = (char) c;
            c = this._inputData.readUnsignedByte();
            outPtr2++;
        }
        if (c == 46 || c == 101 || c == 69) {
            return _parseFloat(outBuf, outPtr2, c, true, intLen);
        }
        this._textBuffer.setCurrentLength(outPtr2);
        this._nextByte = c;
        if (this._parsingContext.inRoot()) {
            _verifyRootSpace();
        }
        return resetInt(true, intLen);
    }

    private final int _handleLeadingZeroes() throws IOException {
        int ch = this._inputData.readUnsignedByte();
        if (ch < 48 || ch > 57) {
            return ch;
        }
        if (!isEnabled(JsonParser.Feature.ALLOW_NUMERIC_LEADING_ZEROS)) {
            reportInvalidNumber("Leading zeroes not allowed");
        }
        while (ch == 48) {
            ch = this._inputData.readUnsignedByte();
        }
        return ch;
    }

    private final JsonToken _parseFloat(char[] outBuf, int outPtr, int c, boolean negative, int integerPartLength) throws IOException {
        int fractLen = 0;
        if (c == 46) {
            int outPtr2 = outPtr + 1;
            outBuf[outPtr] = (char) c;
            while (true) {
                outPtr = outPtr2;
                c = this._inputData.readUnsignedByte();
                if (c < 48 || c > 57) {
                    break;
                }
                fractLen++;
                if (outPtr >= outBuf.length) {
                    outBuf = this._textBuffer.finishCurrentSegment();
                    outPtr = 0;
                }
                outPtr2 = outPtr + 1;
                outBuf[outPtr] = (char) c;
            }
            if (fractLen == 0) {
                reportUnexpectedNumberChar(c, "Decimal point not followed by a digit");
            }
        }
        int expLen = 0;
        if (c == 101 || c == 69) {
            if (outPtr >= outBuf.length) {
                outBuf = this._textBuffer.finishCurrentSegment();
                outPtr = 0;
            }
            int outPtr3 = outPtr + 1;
            outBuf[outPtr] = (char) c;
            int c2 = this._inputData.readUnsignedByte();
            if (c2 == 45 || c2 == 43) {
                if (outPtr3 >= outBuf.length) {
                    outBuf = this._textBuffer.finishCurrentSegment();
                    outPtr3 = 0;
                }
                outBuf[outPtr3] = (char) c2;
                c = this._inputData.readUnsignedByte();
                outPtr = outPtr3 + 1;
            } else {
                c = c2;
                outPtr = outPtr3;
            }
            while (c <= 57 && c >= 48) {
                expLen++;
                if (outPtr >= outBuf.length) {
                    outBuf = this._textBuffer.finishCurrentSegment();
                    outPtr = 0;
                }
                outBuf[outPtr] = (char) c;
                c = this._inputData.readUnsignedByte();
                outPtr++;
            }
            if (expLen == 0) {
                reportUnexpectedNumberChar(c, "Exponent indicator not followed by a digit");
            }
        }
        this._nextByte = c;
        if (this._parsingContext.inRoot()) {
            _verifyRootSpace();
        }
        this._textBuffer.setCurrentLength(outPtr);
        return resetFloat(negative, integerPartLength, fractLen, expLen);
    }

    private final void _verifyRootSpace() throws IOException {
        int ch = this._nextByte;
        if (ch <= 32) {
            this._nextByte = -1;
            if (ch == 13 || ch == 10) {
                this._currInputRow++;
                return;
            }
            return;
        }
        _reportMissingRootWS(ch);
    }

    protected final String _parseName(int i) throws IOException {
        if (i != 34) {
            return _handleOddName(i);
        }
        int[] codes = _icLatin1;
        int q = this._inputData.readUnsignedByte();
        if (codes[q] == 0) {
            int i2 = this._inputData.readUnsignedByte();
            if (codes[i2] != 0) {
                if (i2 == 34) {
                    return findName(q, 1);
                }
                return parseName(q, i2, 1);
            }
            int q2 = (q << 8) | i2;
            int i3 = this._inputData.readUnsignedByte();
            if (codes[i3] != 0) {
                if (i3 == 34) {
                    return findName(q2, 2);
                }
                return parseName(q2, i3, 2);
            }
            int q3 = (q2 << 8) | i3;
            int i4 = this._inputData.readUnsignedByte();
            if (codes[i4] != 0) {
                if (i4 == 34) {
                    return findName(q3, 3);
                }
                return parseName(q3, i4, 3);
            }
            int q4 = (q3 << 8) | i4;
            int i5 = this._inputData.readUnsignedByte();
            if (codes[i5] != 0) {
                if (i5 == 34) {
                    return findName(q4, 4);
                }
                return parseName(q4, i5, 4);
            }
            this._quad1 = q4;
            return _parseMediumName(i5);
        }
        if (q == 34) {
            return "";
        }
        return parseName(0, q, 0);
    }

    private final String _parseMediumName(int q2) throws IOException {
        int[] codes = _icLatin1;
        int i = this._inputData.readUnsignedByte();
        if (codes[i] != 0) {
            return i == 34 ? findName(this._quad1, q2, 1) : parseName(this._quad1, q2, i, 1);
        }
        int q22 = (q2 << 8) | i;
        int i2 = this._inputData.readUnsignedByte();
        if (codes[i2] != 0) {
            return i2 == 34 ? findName(this._quad1, q22, 2) : parseName(this._quad1, q22, i2, 2);
        }
        int q23 = (q22 << 8) | i2;
        int i3 = this._inputData.readUnsignedByte();
        if (codes[i3] != 0) {
            return i3 == 34 ? findName(this._quad1, q23, 3) : parseName(this._quad1, q23, i3, 3);
        }
        int q24 = (q23 << 8) | i3;
        int i4 = this._inputData.readUnsignedByte();
        if (codes[i4] != 0) {
            return i4 == 34 ? findName(this._quad1, q24, 4) : parseName(this._quad1, q24, i4, 4);
        }
        return _parseMediumName2(i4, q24);
    }

    private final String _parseMediumName2(int q3, int q2) throws IOException {
        int[] codes = _icLatin1;
        int i = this._inputData.readUnsignedByte();
        if (codes[i] != 0) {
            if (i == 34) {
                return findName(this._quad1, q2, q3, 1);
            }
            return parseName(this._quad1, q2, q3, i, 1);
        }
        int q32 = (q3 << 8) | i;
        int i2 = this._inputData.readUnsignedByte();
        if (codes[i2] != 0) {
            if (i2 != 34) {
                return parseName(this._quad1, q2, q32, i2, 2);
            }
            return findName(this._quad1, q2, q32, 2);
        }
        int q33 = (q32 << 8) | i2;
        int i3 = this._inputData.readUnsignedByte();
        if (codes[i3] != 0) {
            if (i3 != 34) {
                return parseName(this._quad1, q2, q33, i3, 3);
            }
            return findName(this._quad1, q2, q33, 3);
        }
        int q34 = (q33 << 8) | i3;
        int i4 = this._inputData.readUnsignedByte();
        if (codes[i4] != 0) {
            if (i4 != 34) {
                return parseName(this._quad1, q2, q34, i4, 4);
            }
            return findName(this._quad1, q2, q34, 4);
        }
        return _parseLongName(i4, q2, q34);
    }

    private final String _parseLongName(int q, int q2, int q3) throws IOException {
        this._quadBuffer[0] = this._quad1;
        this._quadBuffer[1] = q2;
        this._quadBuffer[2] = q3;
        int[] codes = _icLatin1;
        int q4 = 3;
        int q5 = q;
        while (true) {
            int i = this._inputData.readUnsignedByte();
            if (codes[i] != 0) {
                if (i == 34) {
                    return findName(this._quadBuffer, q4, q5, 1);
                }
                return parseEscapedName(this._quadBuffer, q4, q5, i, 1);
            }
            int qlen = q4;
            int q6 = (q5 << 8) | i;
            int i2 = this._inputData.readUnsignedByte();
            if (codes[i2] != 0) {
                if (i2 == 34) {
                    return findName(this._quadBuffer, qlen, q6, 2);
                }
                return parseEscapedName(this._quadBuffer, qlen, q6, i2, 2);
            }
            int q7 = (q6 << 8) | i2;
            int i3 = this._inputData.readUnsignedByte();
            if (codes[i3] != 0) {
                if (i3 == 34) {
                    return findName(this._quadBuffer, qlen, q7, 3);
                }
                return parseEscapedName(this._quadBuffer, qlen, q7, i3, 3);
            }
            int q8 = (q7 << 8) | i3;
            int i4 = this._inputData.readUnsignedByte();
            if (codes[i4] != 0) {
                if (i4 == 34) {
                    return findName(this._quadBuffer, qlen, q8, 4);
                }
                return parseEscapedName(this._quadBuffer, qlen, q8, i4, 4);
            }
            if (qlen >= this._quadBuffer.length) {
                this._quadBuffer = _growArrayBy(this._quadBuffer, qlen);
            }
            this._quadBuffer[qlen] = q8;
            q5 = i4;
            q4 = qlen + 1;
        }
    }

    private final String parseName(int q1, int ch, int lastQuadBytes) throws IOException {
        return parseEscapedName(this._quadBuffer, 0, q1, ch, lastQuadBytes);
    }

    private final String parseName(int q1, int q2, int ch, int lastQuadBytes) throws IOException {
        this._quadBuffer[0] = q1;
        return parseEscapedName(this._quadBuffer, 1, q2, ch, lastQuadBytes);
    }

    private final String parseName(int q1, int q2, int q3, int ch, int lastQuadBytes) throws IOException {
        this._quadBuffer[0] = q1;
        this._quadBuffer[1] = q2;
        return parseEscapedName(this._quadBuffer, 2, q3, ch, lastQuadBytes);
    }

    protected final String parseEscapedName(int[] quads, int qlen, int currQuad, int ch, int currQuadBytes) throws IOException {
        int[] codes = _icLatin1;
        while (true) {
            if (codes[ch] != 0) {
                if (ch == 34) {
                    break;
                }
                if (ch != 92) {
                    _throwUnquotedSpace(ch, "name");
                } else {
                    ch = _decodeEscaped();
                }
                if (ch > 127) {
                    if (currQuadBytes >= 4) {
                        if (qlen >= quads.length) {
                            int[] _growArrayBy = _growArrayBy(quads, quads.length);
                            quads = _growArrayBy;
                            this._quadBuffer = _growArrayBy;
                        }
                        quads[qlen] = currQuad;
                        currQuad = 0;
                        currQuadBytes = 0;
                        qlen++;
                    }
                    if (ch < 2048) {
                        currQuad = (currQuad << 8) | (ch >> 6) | 192;
                        currQuadBytes++;
                    } else {
                        int currQuad2 = (currQuad << 8) | (ch >> 12) | 224;
                        int currQuadBytes2 = currQuadBytes + 1;
                        if (currQuadBytes2 >= 4) {
                            if (qlen >= quads.length) {
                                int[] _growArrayBy2 = _growArrayBy(quads, quads.length);
                                quads = _growArrayBy2;
                                this._quadBuffer = _growArrayBy2;
                            }
                            quads[qlen] = currQuad2;
                            currQuad2 = 0;
                            currQuadBytes2 = 0;
                            qlen++;
                        }
                        int qlen2 = currQuad2 << 8;
                        currQuad = qlen2 | ((ch >> 6) & 63) | 128;
                        currQuadBytes = currQuadBytes2 + 1;
                    }
                    ch = (ch & 63) | 128;
                }
            }
            if (currQuadBytes < 4) {
                currQuadBytes++;
                currQuad = (currQuad << 8) | ch;
            } else {
                if (qlen >= quads.length) {
                    int[] _growArrayBy3 = _growArrayBy(quads, quads.length);
                    quads = _growArrayBy3;
                    this._quadBuffer = _growArrayBy3;
                }
                int qlen3 = qlen + 1;
                quads[qlen] = currQuad;
                int currQuad3 = ch;
                currQuadBytes = 1;
                currQuad = currQuad3;
                qlen = qlen3;
            }
            ch = this._inputData.readUnsignedByte();
        }
        if (currQuadBytes > 0) {
            if (qlen >= quads.length) {
                int[] _growArrayBy4 = _growArrayBy(quads, quads.length);
                quads = _growArrayBy4;
                this._quadBuffer = _growArrayBy4;
            }
            quads[qlen] = pad(currQuad, currQuadBytes);
            qlen++;
        }
        String name = this._symbols.findName(quads, qlen);
        if (name == null) {
            return addName(quads, qlen, currQuadBytes);
        }
        return name;
    }

    protected String _handleOddName(int ch) throws IOException {
        if (ch == 39 && isEnabled(JsonParser.Feature.ALLOW_SINGLE_QUOTES)) {
            return _parseAposName();
        }
        if (!isEnabled(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES)) {
            char c = (char) _decodeCharForError(ch);
            _reportUnexpectedChar(c, "was expecting double-quote to start field name");
        }
        int[] codes = CharTypes.getInputCodeUtf8JsNames();
        if (codes[ch] != 0) {
            _reportUnexpectedChar(ch, "was expecting either valid name character (for unquoted name) or double-quote (for quoted) to start field name");
        }
        int[] quads = this._quadBuffer;
        int qlen = 0;
        int currQuad = 0;
        int currQuadBytes = 0;
        do {
            if (currQuadBytes < 4) {
                currQuadBytes++;
                currQuad = (currQuad << 8) | ch;
            } else {
                if (qlen >= quads.length) {
                    int[] _growArrayBy = _growArrayBy(quads, quads.length);
                    quads = _growArrayBy;
                    this._quadBuffer = _growArrayBy;
                }
                int qlen2 = qlen + 1;
                quads[qlen] = currQuad;
                int currQuad2 = ch;
                currQuadBytes = 1;
                currQuad = currQuad2;
                qlen = qlen2;
            }
            ch = this._inputData.readUnsignedByte();
        } while (codes[ch] == 0);
        this._nextByte = ch;
        if (currQuadBytes > 0) {
            if (qlen >= quads.length) {
                int[] _growArrayBy2 = _growArrayBy(quads, quads.length);
                quads = _growArrayBy2;
                this._quadBuffer = _growArrayBy2;
            }
            quads[qlen] = currQuad;
            qlen++;
        }
        String name = this._symbols.findName(quads, qlen);
        if (name == null) {
            return addName(quads, qlen, currQuadBytes);
        }
        return name;
    }

    protected String _parseAposName() throws IOException {
        int ch = this._inputData.readUnsignedByte();
        if (ch == 39) {
            return "";
        }
        int[] quads = this._quadBuffer;
        int qlen = 0;
        int currQuad = 0;
        int currQuadBytes = 0;
        int[] codes = _icLatin1;
        while (ch != 39) {
            if (ch != 34 && codes[ch] != 0) {
                if (ch != 92) {
                    _throwUnquotedSpace(ch, "name");
                } else {
                    ch = _decodeEscaped();
                }
                if (ch > 127) {
                    if (currQuadBytes >= 4) {
                        if (qlen >= quads.length) {
                            int[] _growArrayBy = _growArrayBy(quads, quads.length);
                            quads = _growArrayBy;
                            this._quadBuffer = _growArrayBy;
                        }
                        quads[qlen] = currQuad;
                        currQuad = 0;
                        currQuadBytes = 0;
                        qlen++;
                    }
                    if (ch < 2048) {
                        currQuad = (currQuad << 8) | (ch >> 6) | 192;
                        currQuadBytes++;
                    } else {
                        int currQuad2 = (currQuad << 8) | (ch >> 12) | 224;
                        int currQuadBytes2 = currQuadBytes + 1;
                        if (currQuadBytes2 >= 4) {
                            if (qlen >= quads.length) {
                                int[] _growArrayBy2 = _growArrayBy(quads, quads.length);
                                quads = _growArrayBy2;
                                this._quadBuffer = _growArrayBy2;
                            }
                            quads[qlen] = currQuad2;
                            currQuad2 = 0;
                            currQuadBytes2 = 0;
                            qlen++;
                        }
                        int qlen2 = currQuad2 << 8;
                        currQuad = qlen2 | ((ch >> 6) & 63) | 128;
                        currQuadBytes = currQuadBytes2 + 1;
                    }
                    ch = (ch & 63) | 128;
                }
            }
            if (currQuadBytes < 4) {
                currQuadBytes++;
                currQuad = (currQuad << 8) | ch;
            } else {
                if (qlen >= quads.length) {
                    int[] _growArrayBy3 = _growArrayBy(quads, quads.length);
                    quads = _growArrayBy3;
                    this._quadBuffer = _growArrayBy3;
                }
                int qlen3 = qlen + 1;
                quads[qlen] = currQuad;
                int currQuad3 = ch;
                currQuadBytes = 1;
                currQuad = currQuad3;
                qlen = qlen3;
            }
            ch = this._inputData.readUnsignedByte();
        }
        if (currQuadBytes > 0) {
            if (qlen >= quads.length) {
                int[] _growArrayBy4 = _growArrayBy(quads, quads.length);
                quads = _growArrayBy4;
                this._quadBuffer = _growArrayBy4;
            }
            quads[qlen] = pad(currQuad, currQuadBytes);
            qlen++;
        }
        String name = this._symbols.findName(quads, qlen);
        if (name == null) {
            return addName(quads, qlen, currQuadBytes);
        }
        return name;
    }

    private final String findName(int q1, int lastQuadBytes) throws JsonParseException {
        int q12 = pad(q1, lastQuadBytes);
        String name = this._symbols.findName(q12);
        if (name != null) {
            return name;
        }
        this._quadBuffer[0] = q12;
        return addName(this._quadBuffer, 1, lastQuadBytes);
    }

    private final String findName(int q1, int q2, int lastQuadBytes) throws JsonParseException {
        int q22 = pad(q2, lastQuadBytes);
        String name = this._symbols.findName(q1, q22);
        if (name != null) {
            return name;
        }
        this._quadBuffer[0] = q1;
        this._quadBuffer[1] = q22;
        return addName(this._quadBuffer, 2, lastQuadBytes);
    }

    private final String findName(int q1, int q2, int q3, int lastQuadBytes) throws JsonParseException {
        int q32 = pad(q3, lastQuadBytes);
        String name = this._symbols.findName(q1, q2, q32);
        if (name != null) {
            return name;
        }
        int[] quads = this._quadBuffer;
        quads[0] = q1;
        quads[1] = q2;
        quads[2] = pad(q32, lastQuadBytes);
        return addName(quads, 3, lastQuadBytes);
    }

    private final String findName(int[] quads, int qlen, int lastQuad, int lastQuadBytes) throws JsonParseException {
        if (qlen >= quads.length) {
            int[] _growArrayBy = _growArrayBy(quads, quads.length);
            quads = _growArrayBy;
            this._quadBuffer = _growArrayBy;
        }
        int qlen2 = qlen + 1;
        quads[qlen] = pad(lastQuad, lastQuadBytes);
        String name = this._symbols.findName(quads, qlen2);
        if (name == null) {
            return addName(quads, qlen2, lastQuadBytes);
        }
        return name;
    }

    private final String addName(int[] quads, int qlen, int lastQuadBytes) throws JsonParseException {
        int lastQuad;
        int ch;
        int needed;
        int byteLen = ((qlen << 2) - 4) + lastQuadBytes;
        if (lastQuadBytes < 4) {
            lastQuad = quads[qlen - 1];
            quads[qlen - 1] = lastQuad << ((4 - lastQuadBytes) << 3);
        } else {
            lastQuad = 0;
        }
        char[] cbuf = this._textBuffer.emptyAndGetCurrentSegment();
        int cix = 0;
        int ix = 0;
        while (ix < byteLen) {
            int byteIx = ix & 3;
            int ch2 = (quads[ix >> 2] >> ((3 - byteIx) << 3)) & 255;
            ix++;
            if (ch2 > 127) {
                if ((ch2 & 224) == 192) {
                    ch = ch2 & 31;
                    needed = 1;
                } else {
                    int needed2 = ch2 & 240;
                    if (needed2 == 224) {
                        ch = ch2 & 15;
                        needed = 2;
                    } else {
                        int needed3 = ch2 & 248;
                        if (needed3 == 240) {
                            ch = ch2 & 7;
                            needed = 3;
                        } else {
                            _reportInvalidInitial(ch2);
                            ch = 1;
                            needed = 1;
                        }
                    }
                }
                if (ix + needed > byteLen) {
                    _reportInvalidEOF(" in field name", JsonToken.FIELD_NAME);
                }
                int byteIx2 = ix & 3;
                int ch22 = quads[ix >> 2] >> ((3 - byteIx2) << 3);
                ix++;
                if ((ch22 & 192) != 128) {
                    _reportInvalidOther(ch22);
                }
                ch2 = (ch << 6) | (ch22 & 63);
                if (needed > 1) {
                    int byteIx3 = ix & 3;
                    int ch23 = quads[ix >> 2] >> ((3 - byteIx3) << 3);
                    ix++;
                    if ((ch23 & 192) != 128) {
                        _reportInvalidOther(ch23);
                    }
                    ch2 = (ch2 << 6) | (ch23 & 63);
                    if (needed > 2) {
                        int byteIx4 = ix & 3;
                        int ch24 = quads[ix >> 2] >> ((3 - byteIx4) << 3);
                        ix++;
                        if ((ch24 & 192) != 128) {
                            _reportInvalidOther(ch24 & 255);
                        }
                        ch2 = (ch2 << 6) | (ch24 & 63);
                    }
                }
                if (needed > 2) {
                    int ch3 = ch2 - 65536;
                    if (cix >= cbuf.length) {
                        cbuf = this._textBuffer.expandCurrentSegment();
                    }
                    cbuf[cix] = (char) ((ch3 >> 10) + GeneratorBase.SURR1_FIRST);
                    ch2 = (ch3 & 1023) | GeneratorBase.SURR2_FIRST;
                    cix++;
                }
            }
            int cix2 = cbuf.length;
            if (cix >= cix2) {
                cbuf = this._textBuffer.expandCurrentSegment();
            }
            cbuf[cix] = (char) ch2;
            cix++;
        }
        String baseName = new String(cbuf, 0, cix);
        if (lastQuadBytes < 4) {
            quads[qlen - 1] = lastQuad;
        }
        return this._symbols.addName(baseName, quads, qlen);
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase
    protected void _finishString() throws IOException {
        int outPtr = 0;
        char[] outBuf = this._textBuffer.emptyAndGetCurrentSegment();
        int[] codes = _icUTF8;
        int outEnd = outBuf.length;
        while (true) {
            int c = this._inputData.readUnsignedByte();
            if (codes[c] != 0) {
                if (c == 34) {
                    this._textBuffer.setCurrentLength(outPtr);
                    return;
                } else {
                    _finishString2(outBuf, outPtr, c);
                    return;
                }
            }
            int outPtr2 = outPtr + 1;
            outBuf[outPtr] = (char) c;
            if (outPtr2 < outEnd) {
                outPtr = outPtr2;
            } else {
                _finishString2(outBuf, outPtr2, this._inputData.readUnsignedByte());
                return;
            }
        }
    }

    private String _finishAndReturnString() throws IOException {
        int outPtr = 0;
        char[] outBuf = this._textBuffer.emptyAndGetCurrentSegment();
        int[] codes = _icUTF8;
        int outEnd = outBuf.length;
        while (true) {
            int c = this._inputData.readUnsignedByte();
            if (codes[c] != 0) {
                if (c == 34) {
                    return this._textBuffer.setCurrentAndReturn(outPtr);
                }
                _finishString2(outBuf, outPtr, c);
                return this._textBuffer.contentsAsString();
            }
            int outPtr2 = outPtr + 1;
            outBuf[outPtr] = (char) c;
            if (outPtr2 < outEnd) {
                outPtr = outPtr2;
            } else {
                _finishString2(outBuf, outPtr2, this._inputData.readUnsignedByte());
                return this._textBuffer.contentsAsString();
            }
        }
    }

    private final void _finishString2(char[] outBuf, int outPtr, int c) throws IOException {
        int[] codes = _icUTF8;
        int outEnd = outBuf.length;
        while (true) {
            if (codes[c] == 0) {
                if (outPtr >= outEnd) {
                    outBuf = this._textBuffer.finishCurrentSegment();
                    outPtr = 0;
                    outEnd = outBuf.length;
                }
                outBuf[outPtr] = (char) c;
                c = this._inputData.readUnsignedByte();
                outPtr++;
            } else if (c != 34) {
                switch (codes[c]) {
                    case 1:
                        c = _decodeEscaped();
                        break;
                    case 2:
                        c = _decodeUtf8_2(c);
                        break;
                    case 3:
                        c = _decodeUtf8_3(c);
                        break;
                    case 4:
                        int c2 = _decodeUtf8_4(c);
                        int outPtr2 = outPtr + 1;
                        outBuf[outPtr] = (char) ((c2 >> 10) | GeneratorBase.SURR1_FIRST);
                        if (outPtr2 < outBuf.length) {
                            outPtr = outPtr2;
                        } else {
                            outBuf = this._textBuffer.finishCurrentSegment();
                            outPtr = 0;
                            outEnd = outBuf.length;
                        }
                        int outPtr3 = c2 & 1023;
                        c = outPtr3 | GeneratorBase.SURR2_FIRST;
                        break;
                    default:
                        if (c < 32) {
                            _throwUnquotedSpace(c, "string value");
                            break;
                        } else {
                            _reportInvalidChar(c);
                            break;
                        }
                }
                if (outPtr >= outBuf.length) {
                    outBuf = this._textBuffer.finishCurrentSegment();
                    outPtr = 0;
                    outEnd = outBuf.length;
                }
                outBuf[outPtr] = (char) c;
                c = this._inputData.readUnsignedByte();
                outPtr++;
            } else {
                this._textBuffer.setCurrentLength(outPtr);
                return;
            }
        }
    }

    protected void _skipString() throws IOException {
        this._tokenIncomplete = false;
        int[] codes = _icUTF8;
        while (true) {
            int c = this._inputData.readUnsignedByte();
            if (codes[c] != 0) {
                if (c != 34) {
                    switch (codes[c]) {
                        case 1:
                            _decodeEscaped();
                            break;
                        case 2:
                            _skipUtf8_2();
                            break;
                        case 3:
                            _skipUtf8_3();
                            break;
                        case 4:
                            _skipUtf8_4();
                            break;
                        default:
                            if (c < 32) {
                                _throwUnquotedSpace(c, "string value");
                                break;
                            } else {
                                _reportInvalidChar(c);
                                break;
                            }
                    }
                } else {
                    return;
                }
            }
        }
    }

    /* JADX WARN: não é possível corrigir a ordem dos casos do switch; parte do código será duplicada */
    /* JADX WARN: Code restructure failed: missing block: B:4:0x000b, code lost:
    
        if (r4._parsingContext.inArray() == false) goto L29;
     */
    /* JADX WARN: região duplicada removida para o bloco: B:25:0x0069  */
    /* JADX WARN: região duplicada removida para o bloco: B:29:0x0074  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected com.fasterxml.jackson.core.JsonToken _handleUnexpectedValue(int r5) throws java.io.IOException {
        /*
            r4 = this;
            r0 = 1
            switch(r5) {
                case 39: goto L61;
                case 43: goto L55;
                case 44: goto L42;
                case 73: goto L28;
                case 78: goto Le;
                case 93: goto L5;
                case 125: goto L4f;
                default: goto L4;
            }
        L4:
            goto L6e
        L5:
            com.fasterxml.jackson.core.json.JsonReadContext r0 = r4._parsingContext
            boolean r0 = r0.inArray()
            if (r0 != 0) goto L42
            goto L6e
        Le:
            java.lang.String r1 = "NaN"
            r4._matchToken(r1, r0)
            com.fasterxml.jackson.core.JsonParser$Feature r0 = com.fasterxml.jackson.core.JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS
            boolean r0 = r4.isEnabled(r0)
            if (r0 == 0) goto L22
            r2 = 9221120237041090560(0x7ff8000000000000, double:NaN)
            com.fasterxml.jackson.core.JsonToken r0 = r4.resetAsNaN(r1, r2)
            return r0
        L22:
            java.lang.String r0 = "Non-standard token 'NaN': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow"
            r4._reportError(r0)
            goto L6e
        L28:
            java.lang.String r1 = "Infinity"
            r4._matchToken(r1, r0)
            com.fasterxml.jackson.core.JsonParser$Feature r0 = com.fasterxml.jackson.core.JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS
            boolean r0 = r4.isEnabled(r0)
            if (r0 == 0) goto L3c
            r2 = 9218868437227405312(0x7ff0000000000000, double:Infinity)
            com.fasterxml.jackson.core.JsonToken r0 = r4.resetAsNaN(r1, r2)
            return r0
        L3c:
            java.lang.String r0 = "Non-standard token 'Infinity': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow"
            r4._reportError(r0)
            goto L6e
        L42:
            com.fasterxml.jackson.core.JsonParser$Feature r0 = com.fasterxml.jackson.core.JsonParser.Feature.ALLOW_MISSING_VALUES
            boolean r0 = r4.isEnabled(r0)
            if (r0 == 0) goto L4f
            r4._nextByte = r5
            com.fasterxml.jackson.core.JsonToken r0 = com.fasterxml.jackson.core.JsonToken.VALUE_NULL
            return r0
        L4f:
            java.lang.String r0 = "expected a value"
            r4._reportUnexpectedChar(r5, r0)
            goto L61
        L55:
            java.io.DataInput r0 = r4._inputData
            int r0 = r0.readUnsignedByte()
            r1 = 0
            com.fasterxml.jackson.core.JsonToken r0 = r4._handleInvalidNumberStart(r0, r1)
            return r0
        L61:
            com.fasterxml.jackson.core.JsonParser$Feature r0 = com.fasterxml.jackson.core.JsonParser.Feature.ALLOW_SINGLE_QUOTES
            boolean r0 = r4.isEnabled(r0)
            if (r0 == 0) goto L6e
            com.fasterxml.jackson.core.JsonToken r0 = r4._handleApos()
            return r0
        L6e:
            boolean r0 = java.lang.Character.isJavaIdentifierStart(r5)
            if (r0 == 0) goto L8d
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            r0.<init>()
            java.lang.String r1 = ""
            java.lang.StringBuilder r0 = r0.append(r1)
            char r1 = (char) r5
            java.lang.StringBuilder r0 = r0.append(r1)
            java.lang.String r0 = r0.toString()
            java.lang.String r1 = "('true', 'false' or 'null')"
            r4._reportInvalidToken(r5, r0, r1)
        L8d:
            java.lang.String r0 = "expected a valid value (number, String, array, object, 'true', 'false' or 'null')"
            r4._reportUnexpectedChar(r5, r0)
            r0 = 0
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.UTF8DataInputJsonParser._handleUnexpectedValue(int):com.fasterxml.jackson.core.JsonToken");
    }

    protected JsonToken _handleApos() throws IOException {
        int outPtr = 0;
        char[] outBuf = this._textBuffer.emptyAndGetCurrentSegment();
        int[] codes = _icUTF8;
        while (true) {
            int outEnd = outBuf.length;
            if (outPtr >= outBuf.length) {
                outBuf = this._textBuffer.finishCurrentSegment();
                outPtr = 0;
                outEnd = outBuf.length;
            }
            while (true) {
                int c = this._inputData.readUnsignedByte();
                if (c != 39) {
                    if (codes[c] == 0) {
                        int outPtr2 = outPtr + 1;
                        outBuf[outPtr] = (char) c;
                        if (outPtr2 < outEnd) {
                            outPtr = outPtr2;
                        } else {
                            outPtr = outPtr2;
                        }
                    } else {
                        int outEnd2 = codes[c];
                        switch (outEnd2) {
                            case 1:
                                c = _decodeEscaped();
                                break;
                            case 2:
                                c = _decodeUtf8_2(c);
                                break;
                            case 3:
                                c = _decodeUtf8_3(c);
                                break;
                            case 4:
                                int c2 = _decodeUtf8_4(c);
                                int outPtr3 = outPtr + 1;
                                outBuf[outPtr] = (char) ((c2 >> 10) | GeneratorBase.SURR1_FIRST);
                                if (outPtr3 < outBuf.length) {
                                    outPtr = outPtr3;
                                } else {
                                    outBuf = this._textBuffer.finishCurrentSegment();
                                    outPtr = 0;
                                }
                                int outPtr4 = c2 & 1023;
                                c = outPtr4 | GeneratorBase.SURR2_FIRST;
                                break;
                            default:
                                if (c < 32) {
                                    _throwUnquotedSpace(c, "string value");
                                }
                                _reportInvalidChar(c);
                                break;
                        }
                        if (outPtr >= outBuf.length) {
                            outBuf = this._textBuffer.finishCurrentSegment();
                            outPtr = 0;
                        }
                        outBuf[outPtr] = (char) c;
                        outPtr++;
                    }
                } else {
                    this._textBuffer.setCurrentLength(outPtr);
                    return JsonToken.VALUE_STRING;
                }
            }
        }
    }

    protected JsonToken _handleInvalidNumberStart(int ch, boolean neg) throws IOException {
        String match;
        while (ch == 73) {
            ch = this._inputData.readUnsignedByte();
            if (ch == 78) {
                match = neg ? "-INF" : "+INF";
            } else {
                if (ch != 110) {
                    break;
                }
                match = neg ? "-Infinity" : "+Infinity";
            }
            _matchToken(match, 3);
            if (isEnabled(JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS)) {
                return resetAsNaN(match, neg ? Double.NEGATIVE_INFINITY : Double.POSITIVE_INFINITY);
            }
            _reportError("Non-standard token '" + match + "': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow");
        }
        reportUnexpectedNumberChar(ch, "expected digit (0-9) to follow minus sign, for valid numeric value");
        return null;
    }

    protected final void _matchToken(String matchStr, int i) throws IOException {
        int len = matchStr.length();
        do {
            int ch = this._inputData.readUnsignedByte();
            if (ch != matchStr.charAt(i)) {
                _reportInvalidToken(ch, matchStr.substring(0, i));
            }
            i++;
        } while (i < len);
        int ch2 = this._inputData.readUnsignedByte();
        if (ch2 >= 48 && ch2 != 93 && ch2 != 125) {
            _checkMatchEnd(matchStr, i, ch2);
        }
        this._nextByte = ch2;
    }

    private final void _checkMatchEnd(String matchStr, int i, int ch) throws IOException {
        char c = (char) _decodeCharForError(ch);
        if (Character.isJavaIdentifierPart(c)) {
            _reportInvalidToken(c, matchStr.substring(0, i));
        }
    }

    private final int _skipWS() throws IOException {
        int i = this._nextByte;
        if (i < 0) {
            i = this._inputData.readUnsignedByte();
        } else {
            this._nextByte = -1;
        }
        while (i <= 32) {
            if (i == 13 || i == 10) {
                this._currInputRow++;
            }
            i = this._inputData.readUnsignedByte();
        }
        if (i == 47 || i == 35) {
            return _skipWSComment(i);
        }
        return i;
    }

    private final int _skipWSOrEnd() throws IOException {
        int i = this._nextByte;
        if (i < 0) {
            try {
                i = this._inputData.readUnsignedByte();
            } catch (EOFException e) {
                return _eofAsNextChar();
            }
        } else {
            this._nextByte = -1;
        }
        while (i <= 32) {
            if (i == 13 || i == 10) {
                this._currInputRow++;
            }
            try {
                i = this._inputData.readUnsignedByte();
            } catch (EOFException e2) {
                return _eofAsNextChar();
            }
        }
        if (i == 47 || i == 35) {
            return _skipWSComment(i);
        }
        return i;
    }

    private final int _skipWSComment(int i) throws IOException {
        while (true) {
            if (i > 32) {
                if (i == 47) {
                    _skipComment();
                } else if (i == 35) {
                    if (!_skipYAMLComment()) {
                        return i;
                    }
                } else {
                    return i;
                }
            } else if (i == 13 || i == 10) {
                this._currInputRow++;
            }
            i = this._inputData.readUnsignedByte();
        }
    }

    private final int _skipColon() throws IOException {
        int i = this._nextByte;
        if (i < 0) {
            i = this._inputData.readUnsignedByte();
        } else {
            this._nextByte = -1;
        }
        if (i == 58) {
            int i2 = this._inputData.readUnsignedByte();
            if (i2 > 32) {
                if (i2 == 47 || i2 == 35) {
                    return _skipColon2(i2, true);
                }
                return i2;
            }
            if ((i2 == 32 || i2 == 9) && (i2 = this._inputData.readUnsignedByte()) > 32) {
                if (i2 == 47 || i2 == 35) {
                    return _skipColon2(i2, true);
                }
                return i2;
            }
            return _skipColon2(i2, true);
        }
        if (i == 32 || i == 9) {
            i = this._inputData.readUnsignedByte();
        }
        if (i == 58) {
            int i3 = this._inputData.readUnsignedByte();
            if (i3 > 32) {
                if (i3 == 47 || i3 == 35) {
                    return _skipColon2(i3, true);
                }
                return i3;
            }
            if ((i3 == 32 || i3 == 9) && (i3 = this._inputData.readUnsignedByte()) > 32) {
                if (i3 == 47 || i3 == 35) {
                    return _skipColon2(i3, true);
                }
                return i3;
            }
            return _skipColon2(i3, true);
        }
        return _skipColon2(i, false);
    }

    private final int _skipColon2(int i, boolean gotColon) throws IOException {
        while (true) {
            if (i > 32) {
                if (i == 47) {
                    _skipComment();
                } else if (i != 35 || !_skipYAMLComment()) {
                    if (gotColon) {
                        return i;
                    }
                    if (i != 58) {
                        _reportUnexpectedChar(i, "was expecting a colon to separate field name and value");
                    }
                    gotColon = true;
                }
            } else if (i == 13 || i == 10) {
                this._currInputRow++;
            }
            i = this._inputData.readUnsignedByte();
        }
    }

    private final void _skipComment() throws IOException {
        if (!isEnabled(JsonParser.Feature.ALLOW_COMMENTS)) {
            _reportUnexpectedChar(47, "maybe a (non-standard) comment? (not recognized as one since Feature 'ALLOW_COMMENTS' not enabled for parser)");
        }
        int c = this._inputData.readUnsignedByte();
        if (c == 47) {
            _skipLine();
        } else if (c == 42) {
            _skipCComment();
        } else {
            _reportUnexpectedChar(c, "was expecting either '*' or '/' for a comment");
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x0015, code lost:
    
        r1 = r4._inputData.readUnsignedByte();
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x001d, code lost:
    
        if (r1 != 47) goto L25;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x001f, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x000a, code lost:
    
        continue;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final void _skipCComment() throws java.io.IOException {
        /*
            r4 = this;
            int[] r0 = com.fasterxml.jackson.core.io.CharTypes.getInputCodeComment()
            java.io.DataInput r1 = r4._inputData
            int r1 = r1.readUnsignedByte()
        La:
            r2 = r0[r1]
            if (r2 == 0) goto L33
            switch(r2) {
                case 2: goto L2f;
                case 3: goto L2b;
                case 4: goto L27;
                case 10: goto L20;
                case 13: goto L20;
                case 42: goto L15;
                default: goto L11;
            }
        L11:
            r4._reportInvalidChar(r1)
            goto L33
        L15:
            java.io.DataInput r3 = r4._inputData
            int r1 = r3.readUnsignedByte()
            r3 = 47
            if (r1 != r3) goto La
            return
        L20:
            int r3 = r4._currInputRow
            int r3 = r3 + 1
            r4._currInputRow = r3
            goto L33
        L27:
            r4._skipUtf8_4()
            goto L33
        L2b:
            r4._skipUtf8_3()
            goto L33
        L2f:
            r4._skipUtf8_2()
        L33:
            java.io.DataInput r3 = r4._inputData
            int r1 = r3.readUnsignedByte()
            goto La
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.UTF8DataInputJsonParser._skipCComment():void");
    }

    private final boolean _skipYAMLComment() throws IOException {
        if (!isEnabled(JsonParser.Feature.ALLOW_YAML_COMMENTS)) {
            return false;
        }
        _skipLine();
        return true;
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x0018, code lost:
    
        r4._currInputRow++;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x001e, code lost:
    
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final void _skipLine() throws java.io.IOException {
        /*
            r4 = this;
            int[] r0 = com.fasterxml.jackson.core.io.CharTypes.getInputCodeComment()
        L4:
            java.io.DataInput r1 = r4._inputData
            int r1 = r1.readUnsignedByte()
            r2 = r0[r1]
            if (r2 == 0) goto L2b
            switch(r2) {
                case 2: goto L27;
                case 3: goto L23;
                case 4: goto L1f;
                case 10: goto L18;
                case 13: goto L18;
                case 42: goto L17;
                default: goto L11;
            }
        L11:
            if (r2 >= 0) goto L2b
            r4._reportInvalidChar(r1)
            goto L2b
        L17:
            goto L2b
        L18:
            int r3 = r4._currInputRow
            int r3 = r3 + 1
            r4._currInputRow = r3
            return
        L1f:
            r4._skipUtf8_4()
            goto L2b
        L23:
            r4._skipUtf8_3()
            goto L2b
        L27:
            r4._skipUtf8_2()
        L2b:
            goto L4
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.UTF8DataInputJsonParser._skipLine():void");
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase
    protected char _decodeEscaped() throws IOException {
        int c = this._inputData.readUnsignedByte();
        switch (c) {
            case 34:
            case 47:
            case 92:
                return (char) c;
            case 98:
                return '\b';
            case 102:
                return '\f';
            case 110:
                return '\n';
            case 114:
                return CharUtils.CR;
            case 116:
                return '\t';
            case 117:
                int value = 0;
                for (int i = 0; i < 4; i++) {
                    int ch = this._inputData.readUnsignedByte();
                    int digit = CharTypes.charToHex(ch);
                    if (digit < 0) {
                        _reportUnexpectedChar(ch, "expected a hex-digit for character escape sequence");
                    }
                    value = (value << 4) | digit;
                }
                return (char) value;
            default:
                return _handleUnrecognizedCharacterEscape((char) _decodeCharForError(c));
        }
    }

    protected int _decodeCharForError(int firstByte) throws IOException {
        int needed;
        int c = firstByte & 255;
        if (c > 127) {
            if ((c & 224) == 192) {
                c &= 31;
                needed = 1;
            } else {
                int needed2 = c & 240;
                if (needed2 == 224) {
                    c &= 15;
                    needed = 2;
                } else {
                    int needed3 = c & 248;
                    if (needed3 == 240) {
                        c &= 7;
                        needed = 3;
                    } else {
                        int needed4 = c & 255;
                        _reportInvalidInitial(needed4);
                        needed = 1;
                    }
                }
            }
            int d = this._inputData.readUnsignedByte();
            if ((d & 192) != 128) {
                _reportInvalidOther(d & 255);
            }
            int c2 = (c << 6) | (d & 63);
            if (needed > 1) {
                int d2 = this._inputData.readUnsignedByte();
                if ((d2 & 192) != 128) {
                    _reportInvalidOther(d2 & 255);
                }
                int c3 = (c2 << 6) | (d2 & 63);
                if (needed > 2) {
                    int d3 = this._inputData.readUnsignedByte();
                    if ((d3 & 192) != 128) {
                        _reportInvalidOther(d3 & 255);
                    }
                    return (c3 << 6) | (d3 & 63);
                }
                return c3;
            }
            return c2;
        }
        return c;
    }

    private final int _decodeUtf8_2(int c) throws IOException {
        int d = this._inputData.readUnsignedByte();
        if ((d & 192) != 128) {
            _reportInvalidOther(d & 255);
        }
        return ((c & 31) << 6) | (d & 63);
    }

    private final int _decodeUtf8_3(int c1) throws IOException {
        int c12 = c1 & 15;
        int d = this._inputData.readUnsignedByte();
        if ((d & 192) != 128) {
            _reportInvalidOther(d & 255);
        }
        int c = (c12 << 6) | (d & 63);
        int d2 = this._inputData.readUnsignedByte();
        if ((d2 & 192) != 128) {
            _reportInvalidOther(d2 & 255);
        }
        return (c << 6) | (d2 & 63);
    }

    private final int _decodeUtf8_4(int c) throws IOException {
        int d = this._inputData.readUnsignedByte();
        if ((d & 192) != 128) {
            _reportInvalidOther(d & 255);
        }
        int c2 = ((c & 7) << 6) | (d & 63);
        int d2 = this._inputData.readUnsignedByte();
        if ((d2 & 192) != 128) {
            _reportInvalidOther(d2 & 255);
        }
        int c3 = (c2 << 6) | (d2 & 63);
        int d3 = this._inputData.readUnsignedByte();
        if ((d3 & 192) != 128) {
            _reportInvalidOther(d3 & 255);
        }
        return ((c3 << 6) | (d3 & 63)) - 65536;
    }

    private final void _skipUtf8_2() throws IOException {
        int c = this._inputData.readUnsignedByte();
        if ((c & 192) != 128) {
            _reportInvalidOther(c & 255);
        }
    }

    private final void _skipUtf8_3() throws IOException {
        int c = this._inputData.readUnsignedByte();
        if ((c & 192) != 128) {
            _reportInvalidOther(c & 255);
        }
        int c2 = this._inputData.readUnsignedByte();
        if ((c2 & 192) != 128) {
            _reportInvalidOther(c2 & 255);
        }
    }

    private final void _skipUtf8_4() throws IOException {
        int d = this._inputData.readUnsignedByte();
        if ((d & 192) != 128) {
            _reportInvalidOther(d & 255);
        }
        int d2 = this._inputData.readUnsignedByte();
        if ((d2 & 192) != 128) {
            _reportInvalidOther(d2 & 255);
        }
        int d3 = this._inputData.readUnsignedByte();
        if ((d3 & 192) != 128) {
            _reportInvalidOther(d3 & 255);
        }
    }

    protected void _reportInvalidToken(int ch, String matchedPart) throws IOException {
        _reportInvalidToken(ch, matchedPart, "'null', 'true', 'false' or NaN");
    }

    protected void _reportInvalidToken(int ch, String matchedPart, String msg) throws IOException {
        StringBuilder sb = new StringBuilder(matchedPart);
        while (true) {
            char c = (char) _decodeCharForError(ch);
            if (Character.isJavaIdentifierPart(c)) {
                sb.append(c);
                ch = this._inputData.readUnsignedByte();
            } else {
                _reportError("Unrecognized token '" + sb.toString() + "': was expecting " + msg);
                return;
            }
        }
    }

    protected void _reportInvalidChar(int c) throws JsonParseException {
        if (c < 32) {
            _throwInvalidSpace(c);
        }
        _reportInvalidInitial(c);
    }

    protected void _reportInvalidInitial(int mask) throws JsonParseException {
        _reportError("Invalid UTF-8 start byte 0x" + Integer.toHexString(mask));
    }

    private void _reportInvalidOther(int mask) throws JsonParseException {
        _reportError("Invalid UTF-8 middle byte 0x" + Integer.toHexString(mask));
    }

    private static int[] _growArrayBy(int[] arr, int more) {
        if (arr == null) {
            return new int[more];
        }
        return Arrays.copyOf(arr, arr.length + more);
    }

    protected final byte[] _decodeBase64(Base64Variant b64variant) throws IOException {
        ByteArrayBuilder builder = _getByteArrayBuilder();
        while (true) {
            int ch = this._inputData.readUnsignedByte();
            if (ch > 32) {
                int bits = b64variant.decodeBase64Char(ch);
                if (bits < 0) {
                    if (ch == 34) {
                        return builder.toByteArray();
                    }
                    bits = _decodeBase64Escape(b64variant, ch, 0);
                    if (bits < 0) {
                        continue;
                    }
                }
                int decodedData = bits;
                int ch2 = this._inputData.readUnsignedByte();
                int bits2 = b64variant.decodeBase64Char(ch2);
                if (bits2 < 0) {
                    bits2 = _decodeBase64Escape(b64variant, ch2, 1);
                }
                int decodedData2 = (decodedData << 6) | bits2;
                int ch3 = this._inputData.readUnsignedByte();
                int bits3 = b64variant.decodeBase64Char(ch3);
                if (bits3 < 0) {
                    if (bits3 != -2) {
                        if (ch3 == 34 && !b64variant.usesPadding()) {
                            builder.append(decodedData2 >> 4);
                            return builder.toByteArray();
                        }
                        bits3 = _decodeBase64Escape(b64variant, ch3, 2);
                    }
                    if (bits3 == -2) {
                        int ch4 = this._inputData.readUnsignedByte();
                        if (!b64variant.usesPaddingChar(ch4)) {
                            throw reportInvalidBase64Char(b64variant, ch4, 3, "expected padding character '" + b64variant.getPaddingChar() + "'");
                        }
                        builder.append(decodedData2 >> 4);
                    }
                }
                int decodedData3 = (decodedData2 << 6) | bits3;
                int ch5 = this._inputData.readUnsignedByte();
                int bits4 = b64variant.decodeBase64Char(ch5);
                if (bits4 < 0) {
                    if (bits4 != -2) {
                        if (ch5 == 34 && !b64variant.usesPadding()) {
                            builder.appendTwoBytes(decodedData3 >> 2);
                            return builder.toByteArray();
                        }
                        bits4 = _decodeBase64Escape(b64variant, ch5, 3);
                    }
                    if (bits4 == -2) {
                        builder.appendTwoBytes(decodedData3 >> 2);
                    }
                }
                builder.appendThreeBytes((decodedData3 << 6) | bits4);
            }
        }
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase, com.fasterxml.jackson.core.JsonParser
    public JsonLocation getTokenLocation() {
        return new JsonLocation(_getSourceReference(), -1L, -1L, this._tokenInputRow, -1);
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase, com.fasterxml.jackson.core.JsonParser
    public JsonLocation getCurrentLocation() {
        return new JsonLocation(_getSourceReference(), -1L, -1L, this._currInputRow, -1);
    }

    private void _closeScope(int i) throws JsonParseException {
        if (i == 93) {
            if (!this._parsingContext.inArray()) {
                _reportMismatchedEndMarker(i, '}');
            }
            this._parsingContext = this._parsingContext.clearAndGetParent();
            this._currToken = JsonToken.END_ARRAY;
        }
        if (i == 125) {
            if (!this._parsingContext.inObject()) {
                _reportMismatchedEndMarker(i, ']');
            }
            this._parsingContext = this._parsingContext.clearAndGetParent();
            this._currToken = JsonToken.END_OBJECT;
        }
    }

    private static final int pad(int q, int bytes) {
        return bytes == 4 ? q : ((-1) << (bytes << 3)) | q;
    }
}
