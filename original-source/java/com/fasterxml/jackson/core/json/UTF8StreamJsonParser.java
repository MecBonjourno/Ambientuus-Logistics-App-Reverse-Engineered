package com.fasterxml.jackson.core.json;

import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.credentials.provider.CredentialEntry;
import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.JsonLocation;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.core.SerializableString;
import com.fasterxml.jackson.core.base.GeneratorBase;
import com.fasterxml.jackson.core.base.ParserBase;
import com.fasterxml.jackson.core.io.CharTypes;
import com.fasterxml.jackson.core.io.IOContext;
import com.fasterxml.jackson.core.sym.ByteQuadsCanonicalizer;
import com.fasterxml.jackson.core.util.ByteArrayBuilder;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Writer;
import org.apache.commons.lang.CharUtils;

/* loaded from: classes.dex */
public class UTF8StreamJsonParser extends ParserBase {
    static final byte BYTE_LF = 10;
    protected boolean _bufferRecyclable;
    protected byte[] _inputBuffer;
    protected InputStream _inputStream;
    protected int _nameStartCol;
    protected int _nameStartOffset;
    protected int _nameStartRow;
    protected ObjectCodec _objectCodec;
    private int _quad1;
    protected int[] _quadBuffer;
    protected final ByteQuadsCanonicalizer _symbols;
    protected boolean _tokenIncomplete;
    private static final int[] _icUTF8 = CharTypes.getInputCodeUtf8();
    protected static final int[] _icLatin1 = CharTypes.getInputCodeLatin1();
    protected static final int FEAT_MASK_TRAILING_COMMA = JsonParser.Feature.ALLOW_TRAILING_COMMA.getMask();

    public UTF8StreamJsonParser(IOContext ctxt, int features, InputStream in, ObjectCodec codec, ByteQuadsCanonicalizer sym, byte[] inputBuffer, int start, int end, boolean bufferRecyclable) {
        super(ctxt, features);
        this._quadBuffer = new int[16];
        this._inputStream = in;
        this._objectCodec = codec;
        this._symbols = sym;
        this._inputBuffer = inputBuffer;
        this._inputPtr = start;
        this._inputEnd = end;
        this._currInputRowStart = start;
        this._currInputProcessed = -start;
        this._bufferRecyclable = bufferRecyclable;
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
        int count = this._inputEnd - this._inputPtr;
        if (count < 1) {
            return 0;
        }
        int origPtr = this._inputPtr;
        out.write(this._inputBuffer, origPtr, count);
        return count;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public Object getInputSource() {
        return this._inputStream;
    }

    protected final boolean _loadMore() throws IOException {
        int space;
        int bufSize = this._inputEnd;
        this._currInputProcessed += this._inputEnd;
        this._currInputRowStart -= this._inputEnd;
        this._nameStartOffset -= bufSize;
        if (this._inputStream == null || (space = this._inputBuffer.length) == 0) {
            return false;
        }
        int count = this._inputStream.read(this._inputBuffer, 0, space);
        if (count > 0) {
            this._inputPtr = 0;
            this._inputEnd = count;
            return true;
        }
        _closeInput();
        if (count == 0) {
            throw new IOException("InputStream.read() returned 0 characters when trying to read " + this._inputBuffer.length + " bytes");
        }
        return false;
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase
    protected void _closeInput() throws IOException {
        if (this._inputStream != null) {
            if (this._ioContext.isResourceManaged() || isEnabled(JsonParser.Feature.AUTO_CLOSE_SOURCE)) {
                this._inputStream.close();
            }
            this._inputStream = null;
        }
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase
    protected void _releaseBuffers() throws IOException {
        byte[] buf;
        super._releaseBuffers();
        this._symbols.release();
        if (this._bufferRecyclable && (buf = this._inputBuffer) != null) {
            this._inputBuffer = NO_BYTES;
            this._ioContext.releaseReadIOBuffer(buf);
        }
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
        if (this._currToken == null) {
            return 0;
        }
        switch (this._currToken.id()) {
            case 5:
                return this._parsingContext.getCurrentName().length();
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
                return this._currToken.asCharArray().length;
        }
        return this._textBuffer.size();
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

    /* JADX WARN: Code restructure failed: missing block: B:36:0x0120, code lost:
    
        r17._tokenIncomplete = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x0122, code lost:
    
        if (r4 <= 0) goto L84;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x0124, code lost:
    
        r7 = r7 + r4;
        r19.write(r20, 0, r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x0128, code lost:
    
        return r7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:?, code lost:
    
        return r7;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected int _readBinary(com.fasterxml.jackson.core.Base64Variant r18, java.io.OutputStream r19, byte[] r20) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 354
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.UTF8StreamJsonParser._readBinary(com.fasterxml.jackson.core.Base64Variant, java.io.OutputStream, byte[]):int");
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public JsonToken nextToken() throws IOException {
        JsonToken t;
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
        if (i == 93) {
            _closeArrayScope();
            JsonToken jsonToken = JsonToken.END_ARRAY;
            this._currToken = jsonToken;
            return jsonToken;
        }
        if (i == 125) {
            _closeObjectScope();
            JsonToken jsonToken2 = JsonToken.END_OBJECT;
            this._currToken = jsonToken2;
            return jsonToken2;
        }
        if (this._parsingContext.expectComma()) {
            if (i != 44) {
                _reportUnexpectedChar(i, "was expecting comma to separate " + this._parsingContext.typeDesc() + " entries");
            }
            i = _skipWS();
            if ((this._features & FEAT_MASK_TRAILING_COMMA) != 0 && (i == 93 || i == 125)) {
                return _closeScope(i);
            }
        }
        if (!this._parsingContext.inObject()) {
            _updateLocation();
            return _nextTokenNotInObject(i);
        }
        _updateNameLocation();
        String n = _parseName(i);
        this._parsingContext.setCurrentName(n);
        this._currToken = JsonToken.FIELD_NAME;
        int i2 = _skipColon();
        _updateLocation();
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
                _matchFalse();
                t = JsonToken.VALUE_FALSE;
                break;
            case 110:
                _matchNull();
                t = JsonToken.VALUE_NULL;
                break;
            case 116:
                _matchTrue();
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
                _matchFalse();
                JsonToken jsonToken3 = JsonToken.VALUE_FALSE;
                this._currToken = jsonToken3;
                return jsonToken3;
            case 110:
                _matchNull();
                JsonToken jsonToken4 = JsonToken.VALUE_NULL;
                this._currToken = jsonToken4;
                return jsonToken4;
            case 116:
                _matchTrue();
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
    public boolean nextFieldName(SerializableString str) throws IOException {
        this._numTypesValid = 0;
        if (this._currToken == JsonToken.FIELD_NAME) {
            _nextAfterName();
            return false;
        }
        if (this._tokenIncomplete) {
            _skipString();
        }
        int i = _skipWSOrEnd();
        if (i < 0) {
            close();
            this._currToken = null;
            return false;
        }
        this._binaryValue = null;
        if (i == 93) {
            _closeArrayScope();
            this._currToken = JsonToken.END_ARRAY;
            return false;
        }
        if (i == 125) {
            _closeObjectScope();
            this._currToken = JsonToken.END_OBJECT;
            return false;
        }
        if (this._parsingContext.expectComma()) {
            if (i != 44) {
                _reportUnexpectedChar(i, "was expecting comma to separate " + this._parsingContext.typeDesc() + " entries");
            }
            i = _skipWS();
            if ((this._features & FEAT_MASK_TRAILING_COMMA) != 0 && (i == 93 || i == 125)) {
                _closeScope(i);
                return false;
            }
        }
        if (!this._parsingContext.inObject()) {
            _updateLocation();
            _nextTokenNotInObject(i);
            return false;
        }
        _updateNameLocation();
        if (i == 34) {
            byte[] nameBytes = str.asQuotedUTF8();
            int len = nameBytes.length;
            if (this._inputPtr + len + 4 < this._inputEnd) {
                int end = this._inputPtr + len;
                if (this._inputBuffer[end] == 34) {
                    int offset = 0;
                    int ptr = this._inputPtr;
                    while (ptr != end) {
                        if (nameBytes[offset] == this._inputBuffer[ptr]) {
                            offset++;
                            ptr++;
                        }
                    }
                    this._parsingContext.setCurrentName(str.getValue());
                    _isNextTokenNameYes(_skipColonFast(ptr + 1));
                    return true;
                }
            }
        }
        return _isNextTokenNameMaybe(i, str);
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
        int i = _skipWSOrEnd();
        if (i < 0) {
            close();
            this._currToken = null;
            return null;
        }
        this._binaryValue = null;
        if (i == 93) {
            _closeArrayScope();
            this._currToken = JsonToken.END_ARRAY;
            return null;
        }
        if (i == 125) {
            _closeObjectScope();
            this._currToken = JsonToken.END_OBJECT;
            return null;
        }
        if (this._parsingContext.expectComma()) {
            if (i != 44) {
                _reportUnexpectedChar(i, "was expecting comma to separate " + this._parsingContext.typeDesc() + " entries");
            }
            i = _skipWS();
            if ((this._features & FEAT_MASK_TRAILING_COMMA) != 0 && (i == 93 || i == 125)) {
                _closeScope(i);
                return null;
            }
        }
        if (!this._parsingContext.inObject()) {
            _updateLocation();
            _nextTokenNotInObject(i);
            return null;
        }
        _updateNameLocation();
        String nameStr = _parseName(i);
        this._parsingContext.setCurrentName(nameStr);
        this._currToken = JsonToken.FIELD_NAME;
        int i2 = _skipColon();
        _updateLocation();
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
                _matchFalse();
                t = JsonToken.VALUE_FALSE;
                break;
            case 110:
                _matchNull();
                t = JsonToken.VALUE_NULL;
                break;
            case 116:
                _matchTrue();
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

    private final int _skipColonFast(int ptr) throws IOException {
        int ptr2 = ptr + 1;
        int i = this._inputBuffer[ptr];
        if (i == 58) {
            int ptr3 = ptr2 + 1;
            int i2 = this._inputBuffer[ptr2];
            if (i2 > 32) {
                if (i2 != 47 && i2 != 35) {
                    this._inputPtr = ptr3;
                    return i2;
                }
            } else if (i2 == 32 || i2 == 9) {
                int ptr4 = ptr3 + 1;
                int i3 = this._inputBuffer[ptr3];
                if (i3 > 32 && i3 != 47 && i3 != 35) {
                    this._inputPtr = ptr4;
                    return i3;
                }
                ptr3 = ptr4;
            }
            this._inputPtr = ptr3 - 1;
            return _skipColon2(true);
        }
        if (i == 32 || i == 9) {
            i = this._inputBuffer[ptr2];
            ptr2++;
        }
        if (i == 58) {
            int ptr5 = ptr2 + 1;
            int i4 = this._inputBuffer[ptr2];
            if (i4 > 32) {
                if (i4 != 47 && i4 != 35) {
                    this._inputPtr = ptr5;
                    return i4;
                }
            } else if (i4 == 32 || i4 == 9) {
                int ptr6 = ptr5 + 1;
                int i5 = this._inputBuffer[ptr5];
                if (i5 > 32 && i5 != 47 && i5 != 35) {
                    this._inputPtr = ptr6;
                    return i5;
                }
                ptr5 = ptr6;
            }
            this._inputPtr = ptr5 - 1;
            return _skipColon2(true);
        }
        this._inputPtr = ptr2 - 1;
        return _skipColon2(false);
    }

    private final void _isNextTokenNameYes(int i) throws IOException {
        this._currToken = JsonToken.FIELD_NAME;
        _updateLocation();
        switch (i) {
            case 34:
                this._tokenIncomplete = true;
                this._nextToken = JsonToken.VALUE_STRING;
                break;
            case 45:
                this._nextToken = _parseNegNumber();
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
                this._nextToken = _parsePosNumber(i);
                break;
            case 91:
                this._nextToken = JsonToken.START_ARRAY;
                break;
            case 102:
                _matchFalse();
                this._nextToken = JsonToken.VALUE_FALSE;
                break;
            case 110:
                _matchNull();
                this._nextToken = JsonToken.VALUE_NULL;
                break;
            case 116:
                _matchTrue();
                this._nextToken = JsonToken.VALUE_TRUE;
                break;
            case 123:
                this._nextToken = JsonToken.START_OBJECT;
                break;
            default:
                this._nextToken = _handleUnexpectedValue(i);
                break;
        }
    }

    private final boolean _isNextTokenNameMaybe(int i, SerializableString str) throws IOException {
        JsonToken t;
        String n = _parseName(i);
        this._parsingContext.setCurrentName(n);
        boolean match = n.equals(str.getValue());
        this._currToken = JsonToken.FIELD_NAME;
        int i2 = _skipColon();
        _updateLocation();
        if (i2 == 34) {
            this._tokenIncomplete = true;
            this._nextToken = JsonToken.VALUE_STRING;
            return match;
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
                _matchFalse();
                t = JsonToken.VALUE_FALSE;
                break;
            case 110:
                _matchNull();
                t = JsonToken.VALUE_NULL;
                break;
            case 116:
                _matchTrue();
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
        return match;
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

    /* JADX WARN: Incorrect condition in loop: B:6:0x0023 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected com.fasterxml.jackson.core.JsonToken _parsePosNumber(int r10) throws java.io.IOException {
        /*
            r9 = this;
            com.fasterxml.jackson.core.util.TextBuffer r0 = r9._textBuffer
            char[] r2 = r0.emptyAndGetCurrentSegment()
            r0 = 48
            if (r10 != r0) goto Le
            int r10 = r9._verifyNoLeadingZeroes()
        Le:
            char r1 = (char) r10
            r3 = 0
            r2[r3] = r1
            r1 = 1
            r4 = 1
            int r5 = r9._inputEnd
            int r6 = r9._inputPtr
            int r7 = r2.length
            int r6 = r6 + r7
            int r6 = r6 + (-1)
            int r7 = java.lang.Math.min(r5, r6)
            r6 = r1
        L21:
            int r1 = r9._inputPtr
            if (r1 < r7) goto L2a
            com.fasterxml.jackson.core.JsonToken r0 = r9._parseNumber2(r2, r4, r3, r6)
            return r0
        L2a:
            byte[] r1 = r9._inputBuffer
            int r5 = r9._inputPtr
            int r8 = r5 + 1
            r9._inputPtr = r8
            r1 = r1[r5]
            r10 = r1 & 255(0xff, float:3.57E-43)
            if (r10 < r0) goto L46
            r1 = 57
            if (r10 <= r1) goto L3d
            goto L46
        L3d:
            int r6 = r6 + 1
            int r1 = r4 + 1
            char r5 = (char) r10
            r2[r4] = r5
            r4 = r1
            goto L21
        L46:
            r0 = 46
            if (r10 == r0) goto L6e
            r0 = 101(0x65, float:1.42E-43)
            if (r10 == r0) goto L6e
            r0 = 69
            if (r10 != r0) goto L53
            goto L6e
        L53:
            int r0 = r9._inputPtr
            int r0 = r0 + (-1)
            r9._inputPtr = r0
            com.fasterxml.jackson.core.util.TextBuffer r0 = r9._textBuffer
            r0.setCurrentLength(r4)
            com.fasterxml.jackson.core.json.JsonReadContext r0 = r9._parsingContext
            boolean r0 = r0.inRoot()
            if (r0 == 0) goto L69
            r9._verifyRootSpace(r10)
        L69:
            com.fasterxml.jackson.core.JsonToken r0 = r9.resetInt(r3, r6)
            return r0
        L6e:
            r5 = 0
            r1 = r9
            r3 = r4
            r4 = r10
            com.fasterxml.jackson.core.JsonToken r10 = r1._parseFloat(r2, r3, r4, r5, r6)
            return r10
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.UTF8StreamJsonParser._parsePosNumber(int):com.fasterxml.jackson.core.JsonToken");
    }

    protected JsonToken _parseNegNumber() throws IOException {
        char[] outBuf = this._textBuffer.emptyAndGetCurrentSegment();
        int outPtr = 0 + 1;
        outBuf[0] = '-';
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int c = bArr[i] & 255;
        if (c <= 48) {
            if (c != 48) {
                return _handleInvalidNumberStart(c, true);
            }
            c = _verifyNoLeadingZeroes();
        } else if (c > 57) {
            return _handleInvalidNumberStart(c, true);
        }
        int outPtr2 = outPtr + 1;
        outBuf[outPtr] = (char) c;
        int end = Math.min(this._inputEnd, (this._inputPtr + outBuf.length) - outPtr2);
        int outPtr3 = 1;
        int outPtr4 = outPtr2;
        while (this._inputPtr < end) {
            byte[] bArr2 = this._inputBuffer;
            int i2 = this._inputPtr;
            this._inputPtr = i2 + 1;
            int c2 = bArr2[i2] & 255;
            if (c2 >= 48 && c2 <= 57) {
                outPtr3++;
                outBuf[outPtr4] = (char) c2;
                outPtr4++;
            } else {
                if (c2 == 46 || c2 == 101 || c2 == 69) {
                    return _parseFloat(outBuf, outPtr4, c2, true, outPtr3);
                }
                this._inputPtr--;
                this._textBuffer.setCurrentLength(outPtr4);
                if (this._parsingContext.inRoot()) {
                    _verifyRootSpace(c2);
                }
                return resetInt(true, outPtr3);
            }
        }
        return _parseNumber2(outBuf, outPtr4, true, outPtr3);
    }

    /* JADX WARN: Code restructure failed: missing block: B:22:0x0045, code lost:
    
        if (r3 == 46) goto L30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0049, code lost:
    
        if (r3 == 101) goto L30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x004d, code lost:
    
        if (r3 != 69) goto L25;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0050, code lost:
    
        r6._inputPtr--;
        r6._textBuffer.setCurrentLength(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0061, code lost:
    
        if (r6._parsingContext.inRoot() == false) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0063, code lost:
    
        r7 = r6._inputBuffer;
        r8 = r6._inputPtr;
        r6._inputPtr = r8 + 1;
        _verifyRootSpace(r7[r8] & 255);
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x0076, code lost:
    
        return resetInt(r9, r5);
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x007d, code lost:
    
        return _parseFloat(r1, r2, r3, r9, r5);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final com.fasterxml.jackson.core.JsonToken _parseNumber2(char[] r7, int r8, boolean r9, int r10) throws java.io.IOException {
        /*
            r6 = this;
            r1 = r7
            r2 = r8
            r5 = r10
        L3:
            int r7 = r6._inputPtr
            int r8 = r6._inputEnd
            if (r7 < r8) goto L19
            boolean r7 = r6._loadMore()
            if (r7 != 0) goto L19
            com.fasterxml.jackson.core.util.TextBuffer r7 = r6._textBuffer
            r7.setCurrentLength(r2)
            com.fasterxml.jackson.core.JsonToken r7 = r6.resetInt(r9, r5)
            return r7
        L19:
            byte[] r7 = r6._inputBuffer
            int r8 = r6._inputPtr
            int r10 = r8 + 1
            r6._inputPtr = r10
            r7 = r7[r8]
            r3 = r7 & 255(0xff, float:3.57E-43)
            r7 = 57
            if (r3 > r7) goto L43
            r7 = 48
            if (r3 >= r7) goto L2e
            goto L43
        L2e:
            int r7 = r1.length
            if (r2 < r7) goto L39
            com.fasterxml.jackson.core.util.TextBuffer r7 = r6._textBuffer
            char[] r7 = r7.finishCurrentSegment()
            r2 = 0
            r1 = r7
        L39:
            int r7 = r2 + 1
            char r8 = (char) r3
            r1[r2] = r8
            int r5 = r5 + 1
            r2 = r7
            goto L3
        L43:
            r7 = 46
            if (r3 == r7) goto L77
            r7 = 101(0x65, float:1.42E-43)
            if (r3 == r7) goto L77
            r7 = 69
            if (r3 != r7) goto L50
            goto L77
        L50:
            int r7 = r6._inputPtr
            int r7 = r7 + (-1)
            r6._inputPtr = r7
            com.fasterxml.jackson.core.util.TextBuffer r7 = r6._textBuffer
            r7.setCurrentLength(r2)
            com.fasterxml.jackson.core.json.JsonReadContext r7 = r6._parsingContext
            boolean r7 = r7.inRoot()
            if (r7 == 0) goto L72
            byte[] r7 = r6._inputBuffer
            int r8 = r6._inputPtr
            int r10 = r8 + 1
            r6._inputPtr = r10
            r7 = r7[r8]
            r7 = r7 & 255(0xff, float:3.57E-43)
            r6._verifyRootSpace(r7)
        L72:
            com.fasterxml.jackson.core.JsonToken r7 = r6.resetInt(r9, r5)
            return r7
        L77:
            r0 = r6
            r4 = r9
            com.fasterxml.jackson.core.JsonToken r7 = r0._parseFloat(r1, r2, r3, r4, r5)
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.UTF8StreamJsonParser._parseNumber2(char[], int, boolean, int):com.fasterxml.jackson.core.JsonToken");
    }

    private final int _verifyNoLeadingZeroes() throws IOException {
        int ch;
        if ((this._inputPtr >= this._inputEnd && !_loadMore()) || (ch = this._inputBuffer[this._inputPtr] & 255) < 48 || ch > 57) {
            return 48;
        }
        if (!isEnabled(JsonParser.Feature.ALLOW_NUMERIC_LEADING_ZEROS)) {
            reportInvalidNumber("Leading zeroes not allowed");
        }
        this._inputPtr++;
        if (ch == 48) {
            do {
                if (this._inputPtr >= this._inputEnd && !_loadMore()) {
                    break;
                }
                ch = this._inputBuffer[this._inputPtr] & 255;
                if (ch < 48 || ch > 57) {
                    return 48;
                }
                this._inputPtr++;
            } while (ch == 48);
        }
        return ch;
    }

    private final JsonToken _parseFloat(char[] outBuf, int outPtr, int c, boolean negative, int integerPartLength) throws IOException {
        int fractLen = 0;
        boolean eof = false;
        if (c == 46) {
            if (outPtr >= outBuf.length) {
                outBuf = this._textBuffer.finishCurrentSegment();
                outPtr = 0;
            }
            int outPtr2 = outPtr + 1;
            outBuf[outPtr] = (char) c;
            while (true) {
                outPtr = outPtr2;
                if (this._inputPtr >= this._inputEnd && !_loadMore()) {
                    eof = true;
                    break;
                }
                byte[] bArr = this._inputBuffer;
                int i = this._inputPtr;
                this._inputPtr = i + 1;
                c = bArr[i] & 255;
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
            if (this._inputPtr >= this._inputEnd) {
                _loadMoreGuaranteed();
            }
            byte[] bArr2 = this._inputBuffer;
            int i2 = this._inputPtr;
            this._inputPtr = i2 + 1;
            int c2 = bArr2[i2] & 255;
            if (c2 == 45 || c2 == 43) {
                if (outPtr3 >= outBuf.length) {
                    outBuf = this._textBuffer.finishCurrentSegment();
                    outPtr3 = 0;
                }
                int outPtr4 = outPtr3 + 1;
                outBuf[outPtr3] = (char) c2;
                if (this._inputPtr >= this._inputEnd) {
                    _loadMoreGuaranteed();
                }
                byte[] bArr3 = this._inputBuffer;
                int i3 = this._inputPtr;
                this._inputPtr = i3 + 1;
                int c3 = bArr3[i3] & 255;
                outPtr3 = outPtr4;
                c = c3;
            } else {
                c = c2;
            }
            while (c >= 48 && c <= 57) {
                expLen++;
                if (outPtr3 >= outBuf.length) {
                    outBuf = this._textBuffer.finishCurrentSegment();
                    outPtr3 = 0;
                }
                outPtr = outPtr3 + 1;
                outBuf[outPtr3] = (char) c;
                if (this._inputPtr >= this._inputEnd && !_loadMore()) {
                    eof = true;
                    break;
                }
                byte[] bArr4 = this._inputBuffer;
                int i4 = this._inputPtr;
                this._inputPtr = i4 + 1;
                c = bArr4[i4] & 255;
                outPtr3 = outPtr;
            }
            outPtr = outPtr3;
            if (expLen == 0) {
                reportUnexpectedNumberChar(c, "Exponent indicator not followed by a digit");
            }
        }
        if (!eof) {
            this._inputPtr--;
            if (this._parsingContext.inRoot()) {
                _verifyRootSpace(c);
            }
        }
        this._textBuffer.setCurrentLength(outPtr);
        return resetFloat(negative, integerPartLength, fractLen, expLen);
    }

    private final void _verifyRootSpace(int ch) throws IOException {
        this._inputPtr++;
        switch (ch) {
            case 9:
            case 32:
                break;
            case 10:
                this._currInputRow++;
                this._currInputRowStart = this._inputPtr;
                break;
            case 13:
                _skipCR();
                break;
            default:
                _reportMissingRootWS(ch);
                break;
        }
    }

    protected final String _parseName(int i) throws IOException {
        if (i != 34) {
            return _handleOddName(i);
        }
        if (this._inputPtr + 13 > this._inputEnd) {
            return slowParseName();
        }
        byte[] input = this._inputBuffer;
        int[] codes = _icLatin1;
        int i2 = this._inputPtr;
        this._inputPtr = i2 + 1;
        int q = input[i2] & 255;
        if (codes[q] == 0) {
            int i3 = this._inputPtr;
            this._inputPtr = i3 + 1;
            int i4 = input[i3] & 255;
            if (codes[i4] != 0) {
                if (i4 == 34) {
                    return findName(q, 1);
                }
                return parseName(q, i4, 1);
            }
            int q2 = (q << 8) | i4;
            int i5 = this._inputPtr;
            this._inputPtr = i5 + 1;
            int i6 = input[i5] & 255;
            if (codes[i6] != 0) {
                if (i6 == 34) {
                    return findName(q2, 2);
                }
                return parseName(q2, i6, 2);
            }
            int q3 = (q2 << 8) | i6;
            int i7 = this._inputPtr;
            this._inputPtr = i7 + 1;
            int i8 = input[i7] & 255;
            if (codes[i8] != 0) {
                if (i8 == 34) {
                    return findName(q3, 3);
                }
                return parseName(q3, i8, 3);
            }
            int q4 = (q3 << 8) | i8;
            int i9 = this._inputPtr;
            this._inputPtr = i9 + 1;
            int i10 = input[i9] & 255;
            if (codes[i10] != 0) {
                if (i10 == 34) {
                    return findName(q4, 4);
                }
                return parseName(q4, i10, 4);
            }
            this._quad1 = q4;
            return parseMediumName(i10);
        }
        if (q == 34) {
            return "";
        }
        return parseName(0, q, 0);
    }

    protected final String parseMediumName(int q2) throws IOException {
        byte[] input = this._inputBuffer;
        int[] codes = _icLatin1;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int i2 = input[i] & 255;
        if (codes[i2] != 0) {
            return i2 == 34 ? findName(this._quad1, q2, 1) : parseName(this._quad1, q2, i2, 1);
        }
        int q22 = (q2 << 8) | i2;
        int i3 = this._inputPtr;
        this._inputPtr = i3 + 1;
        int i4 = input[i3] & 255;
        if (codes[i4] != 0) {
            return i4 == 34 ? findName(this._quad1, q22, 2) : parseName(this._quad1, q22, i4, 2);
        }
        int q23 = (q22 << 8) | i4;
        int i5 = this._inputPtr;
        this._inputPtr = i5 + 1;
        int i6 = input[i5] & 255;
        if (codes[i6] != 0) {
            return i6 == 34 ? findName(this._quad1, q23, 3) : parseName(this._quad1, q23, i6, 3);
        }
        int q24 = (q23 << 8) | i6;
        int i7 = this._inputPtr;
        this._inputPtr = i7 + 1;
        int i8 = input[i7] & 255;
        if (codes[i8] != 0) {
            return i8 == 34 ? findName(this._quad1, q24, 4) : parseName(this._quad1, q24, i8, 4);
        }
        return parseMediumName2(i8, q24);
    }

    protected final String parseMediumName2(int q3, int q2) throws IOException {
        byte[] input = this._inputBuffer;
        int[] codes = _icLatin1;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int i2 = input[i] & 255;
        if (codes[i2] != 0) {
            if (i2 == 34) {
                return findName(this._quad1, q2, q3, 1);
            }
            return parseName(this._quad1, q2, q3, i2, 1);
        }
        int q32 = (q3 << 8) | i2;
        int i3 = this._inputPtr;
        this._inputPtr = i3 + 1;
        int i4 = input[i3] & 255;
        if (codes[i4] != 0) {
            if (i4 == 34) {
                return findName(this._quad1, q2, q32, 2);
            }
            return parseName(this._quad1, q2, q32, i4, 2);
        }
        int q33 = (q32 << 8) | i4;
        int i5 = this._inputPtr;
        this._inputPtr = i5 + 1;
        int i6 = input[i5] & 255;
        if (codes[i6] != 0) {
            if (i6 == 34) {
                return findName(this._quad1, q2, q33, 3);
            }
            return parseName(this._quad1, q2, q33, i6, 3);
        }
        int q34 = (q33 << 8) | i6;
        int i7 = this._inputPtr;
        this._inputPtr = i7 + 1;
        int i8 = input[i7] & 255;
        if (codes[i8] != 0) {
            if (i8 == 34) {
                return findName(this._quad1, q2, q34, 4);
            }
            return parseName(this._quad1, q2, q34, i8, 4);
        }
        return parseLongName(i8, q2, q34);
    }

    protected final String parseLongName(int q, int q2, int q3) throws IOException {
        this._quadBuffer[0] = this._quad1;
        this._quadBuffer[1] = q2;
        this._quadBuffer[2] = q3;
        byte[] input = this._inputBuffer;
        int[] codes = _icLatin1;
        int qlen = 3;
        int q4 = q;
        while (this._inputPtr + 4 <= this._inputEnd) {
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            int i2 = input[i] & 255;
            if (codes[i2] != 0) {
                if (i2 == 34) {
                    return findName(this._quadBuffer, qlen, q4, 1);
                }
                return parseEscapedName(this._quadBuffer, qlen, q4, i2, 1);
            }
            int i3 = q4;
            int q5 = qlen;
            int qlen2 = i3 << 8;
            int q6 = qlen2 | i2;
            int q7 = this._inputPtr;
            this._inputPtr = q7 + 1;
            int i4 = input[q7] & 255;
            if (codes[i4] != 0) {
                if (i4 == 34) {
                    return findName(this._quadBuffer, q5, q6, 2);
                }
                return parseEscapedName(this._quadBuffer, q5, q6, i4, 2);
            }
            int q8 = (q6 << 8) | i4;
            int q9 = this._inputPtr;
            this._inputPtr = q9 + 1;
            int i5 = input[q9] & 255;
            if (codes[i5] != 0) {
                if (i5 == 34) {
                    return findName(this._quadBuffer, q5, q8, 3);
                }
                return parseEscapedName(this._quadBuffer, q5, q8, i5, 3);
            }
            int q10 = (q8 << 8) | i5;
            int q11 = this._inputPtr;
            this._inputPtr = q11 + 1;
            int i6 = input[q11] & 255;
            if (codes[i6] != 0) {
                if (i6 == 34) {
                    return findName(this._quadBuffer, q5, q10, 4);
                }
                return parseEscapedName(this._quadBuffer, q5, q10, i6, 4);
            }
            if (q5 >= this._quadBuffer.length) {
                this._quadBuffer = growArrayBy(this._quadBuffer, q5);
            }
            int qlen3 = q5 + 1;
            this._quadBuffer[q5] = q10;
            q4 = i6;
            qlen = qlen3;
        }
        int q12 = q4;
        int q13 = qlen;
        return parseEscapedName(this._quadBuffer, q13, 0, q12, 0);
    }

    protected String slowParseName() throws IOException {
        if (this._inputPtr >= this._inputEnd && !_loadMore()) {
            _reportInvalidEOF(": was expecting closing '\"' for name", JsonToken.FIELD_NAME);
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int i2 = bArr[i] & 255;
        if (i2 == 34) {
            return "";
        }
        return parseEscapedName(this._quadBuffer, 0, 0, i2, 0);
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
                            int[] growArrayBy = growArrayBy(quads, quads.length);
                            quads = growArrayBy;
                            this._quadBuffer = growArrayBy;
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
                                int[] growArrayBy2 = growArrayBy(quads, quads.length);
                                quads = growArrayBy2;
                                this._quadBuffer = growArrayBy2;
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
                    int[] growArrayBy3 = growArrayBy(quads, quads.length);
                    quads = growArrayBy3;
                    this._quadBuffer = growArrayBy3;
                }
                int qlen3 = qlen + 1;
                quads[qlen] = currQuad;
                int currQuad3 = ch;
                currQuadBytes = 1;
                currQuad = currQuad3;
                qlen = qlen3;
            }
            int qlen4 = this._inputPtr;
            if (qlen4 >= this._inputEnd && !_loadMore()) {
                _reportInvalidEOF(" in field name", JsonToken.FIELD_NAME);
            }
            byte[] bArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            ch = bArr[i] & 255;
        }
        if (currQuadBytes > 0) {
            if (qlen >= quads.length) {
                int[] growArrayBy4 = growArrayBy(quads, quads.length);
                quads = growArrayBy4;
                this._quadBuffer = growArrayBy4;
            }
            quads[qlen] = _padLastQuad(currQuad, currQuadBytes);
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
        while (true) {
            if (currQuadBytes < 4) {
                currQuadBytes++;
                currQuad = (currQuad << 8) | ch;
            } else {
                if (qlen >= quads.length) {
                    int[] growArrayBy = growArrayBy(quads, quads.length);
                    quads = growArrayBy;
                    this._quadBuffer = growArrayBy;
                }
                int qlen2 = qlen + 1;
                quads[qlen] = currQuad;
                int currQuad2 = ch;
                currQuadBytes = 1;
                currQuad = currQuad2;
                qlen = qlen2;
            }
            int qlen3 = this._inputPtr;
            if (qlen3 >= this._inputEnd && !_loadMore()) {
                _reportInvalidEOF(" in field name", JsonToken.FIELD_NAME);
            }
            ch = this._inputBuffer[this._inputPtr] & 255;
            if (codes[ch] != 0) {
                break;
            }
            this._inputPtr++;
        }
        if (currQuadBytes > 0) {
            if (qlen >= quads.length) {
                int[] growArrayBy2 = growArrayBy(quads, quads.length);
                quads = growArrayBy2;
                this._quadBuffer = growArrayBy2;
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
        if (this._inputPtr >= this._inputEnd && !_loadMore()) {
            _reportInvalidEOF(": was expecting closing ''' for field name", JsonToken.FIELD_NAME);
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int ch = bArr[i] & 255;
        if (ch == 39) {
            return "";
        }
        int[] quads = this._quadBuffer;
        int qlen = 0;
        int currQuad = 0;
        int currQuadBytes = 0;
        int[] codes = _icLatin1;
        while (ch != 39) {
            if (codes[ch] != 0 && ch != 34) {
                if (ch != 92) {
                    _throwUnquotedSpace(ch, "name");
                } else {
                    ch = _decodeEscaped();
                }
                if (ch > 127) {
                    if (currQuadBytes >= 4) {
                        if (qlen >= quads.length) {
                            int[] growArrayBy = growArrayBy(quads, quads.length);
                            quads = growArrayBy;
                            this._quadBuffer = growArrayBy;
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
                                int[] growArrayBy2 = growArrayBy(quads, quads.length);
                                quads = growArrayBy2;
                                this._quadBuffer = growArrayBy2;
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
                    int[] growArrayBy3 = growArrayBy(quads, quads.length);
                    quads = growArrayBy3;
                    this._quadBuffer = growArrayBy3;
                }
                int qlen3 = qlen + 1;
                quads[qlen] = currQuad;
                int currQuad3 = ch;
                currQuadBytes = 1;
                currQuad = currQuad3;
                qlen = qlen3;
            }
            int qlen4 = this._inputPtr;
            if (qlen4 >= this._inputEnd && !_loadMore()) {
                _reportInvalidEOF(" in field name", JsonToken.FIELD_NAME);
            }
            byte[] bArr2 = this._inputBuffer;
            int i2 = this._inputPtr;
            this._inputPtr = i2 + 1;
            ch = bArr2[i2] & 255;
        }
        if (currQuadBytes > 0) {
            if (qlen >= quads.length) {
                int[] growArrayBy4 = growArrayBy(quads, quads.length);
                quads = growArrayBy4;
                this._quadBuffer = growArrayBy4;
            }
            quads[qlen] = _padLastQuad(currQuad, currQuadBytes);
            qlen++;
        }
        String name = this._symbols.findName(quads, qlen);
        if (name == null) {
            return addName(quads, qlen, currQuadBytes);
        }
        return name;
    }

    private final String findName(int q1, int lastQuadBytes) throws JsonParseException {
        int q12 = _padLastQuad(q1, lastQuadBytes);
        String name = this._symbols.findName(q12);
        if (name != null) {
            return name;
        }
        this._quadBuffer[0] = q12;
        return addName(this._quadBuffer, 1, lastQuadBytes);
    }

    private final String findName(int q1, int q2, int lastQuadBytes) throws JsonParseException {
        int q22 = _padLastQuad(q2, lastQuadBytes);
        String name = this._symbols.findName(q1, q22);
        if (name != null) {
            return name;
        }
        this._quadBuffer[0] = q1;
        this._quadBuffer[1] = q22;
        return addName(this._quadBuffer, 2, lastQuadBytes);
    }

    private final String findName(int q1, int q2, int q3, int lastQuadBytes) throws JsonParseException {
        int q32 = _padLastQuad(q3, lastQuadBytes);
        String name = this._symbols.findName(q1, q2, q32);
        if (name != null) {
            return name;
        }
        int[] quads = this._quadBuffer;
        quads[0] = q1;
        quads[1] = q2;
        quads[2] = _padLastQuad(q32, lastQuadBytes);
        return addName(quads, 3, lastQuadBytes);
    }

    private final String findName(int[] quads, int qlen, int lastQuad, int lastQuadBytes) throws JsonParseException {
        if (qlen >= quads.length) {
            int[] growArrayBy = growArrayBy(quads, quads.length);
            quads = growArrayBy;
            this._quadBuffer = growArrayBy;
        }
        int qlen2 = qlen + 1;
        quads[qlen] = _padLastQuad(lastQuad, lastQuadBytes);
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

    private static final int _padLastQuad(int q, int bytes) {
        return bytes == 4 ? q : ((-1) << (bytes << 3)) | q;
    }

    protected void _loadMoreGuaranteed() throws IOException {
        if (!_loadMore()) {
            _reportInvalidEOF();
        }
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase
    protected void _finishString() throws IOException {
        int ptr = this._inputPtr;
        if (ptr >= this._inputEnd) {
            _loadMoreGuaranteed();
            ptr = this._inputPtr;
        }
        int outPtr = 0;
        char[] outBuf = this._textBuffer.emptyAndGetCurrentSegment();
        int[] codes = _icUTF8;
        int max = Math.min(this._inputEnd, outBuf.length + ptr);
        byte[] inputBuffer = this._inputBuffer;
        while (true) {
            if (ptr >= max) {
                break;
            }
            int c = inputBuffer[ptr] & 255;
            if (codes[c] != 0) {
                if (c == 34) {
                    this._inputPtr = ptr + 1;
                    this._textBuffer.setCurrentLength(outPtr);
                    return;
                }
            } else {
                ptr++;
                outBuf[outPtr] = (char) c;
                outPtr++;
            }
        }
        this._inputPtr = ptr;
        _finishString2(outBuf, outPtr);
    }

    protected String _finishAndReturnString() throws IOException {
        int ptr = this._inputPtr;
        if (ptr >= this._inputEnd) {
            _loadMoreGuaranteed();
            ptr = this._inputPtr;
        }
        int outPtr = 0;
        char[] outBuf = this._textBuffer.emptyAndGetCurrentSegment();
        int[] codes = _icUTF8;
        int max = Math.min(this._inputEnd, outBuf.length + ptr);
        byte[] inputBuffer = this._inputBuffer;
        while (true) {
            if (ptr >= max) {
                break;
            }
            int c = inputBuffer[ptr] & 255;
            if (codes[c] != 0) {
                if (c == 34) {
                    this._inputPtr = ptr + 1;
                    return this._textBuffer.setCurrentAndReturn(outPtr);
                }
            } else {
                ptr++;
                outBuf[outPtr] = (char) c;
                outPtr++;
            }
        }
        this._inputPtr = ptr;
        _finishString2(outBuf, outPtr);
        return this._textBuffer.contentsAsString();
    }

    private final void _finishString2(char[] outBuf, int outPtr) throws IOException {
        int[] codes = _icUTF8;
        byte[] inputBuffer = this._inputBuffer;
        while (true) {
            int ptr = this._inputPtr;
            if (ptr >= this._inputEnd) {
                _loadMoreGuaranteed();
                ptr = this._inputPtr;
            }
            if (outPtr >= outBuf.length) {
                outBuf = this._textBuffer.finishCurrentSegment();
                outPtr = 0;
            }
            int max = Math.min(this._inputEnd, (outBuf.length - outPtr) + ptr);
            while (true) {
                if (ptr < max) {
                    int ptr2 = ptr + 1;
                    int c = inputBuffer[ptr] & 255;
                    if (codes[c] != 0) {
                        this._inputPtr = ptr2;
                        if (c != 34) {
                            switch (codes[c]) {
                                case 1:
                                    c = _decodeEscaped();
                                    break;
                                case 2:
                                    c = _decodeUtf8_2(c);
                                    break;
                                case 3:
                                    if (this._inputEnd - this._inputPtr >= 2) {
                                        c = _decodeUtf8_3fast(c);
                                        break;
                                    } else {
                                        c = _decodeUtf8_3(c);
                                        break;
                                    }
                                case 4:
                                    int c2 = _decodeUtf8_4(c);
                                    int outPtr2 = outPtr + 1;
                                    outBuf[outPtr] = (char) ((c2 >> 10) | GeneratorBase.SURR1_FIRST);
                                    if (outPtr2 < outBuf.length) {
                                        outPtr = outPtr2;
                                    } else {
                                        outBuf = this._textBuffer.finishCurrentSegment();
                                        outPtr = 0;
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
                            }
                            outBuf[outPtr] = (char) c;
                            outPtr++;
                        } else {
                            this._textBuffer.setCurrentLength(outPtr);
                            return;
                        }
                    } else {
                        outBuf[outPtr] = (char) c;
                        ptr = ptr2;
                        outPtr++;
                    }
                } else {
                    this._inputPtr = ptr;
                }
            }
        }
    }

    protected void _skipString() throws IOException {
        this._tokenIncomplete = false;
        int[] codes = _icUTF8;
        byte[] inputBuffer = this._inputBuffer;
        while (true) {
            int ptr = this._inputPtr;
            int max = this._inputEnd;
            if (ptr >= max) {
                _loadMoreGuaranteed();
                ptr = this._inputPtr;
                max = this._inputEnd;
            }
            while (true) {
                if (ptr < max) {
                    int ptr2 = ptr + 1;
                    int c = inputBuffer[ptr] & 255;
                    if (codes[c] == 0) {
                        ptr = ptr2;
                    } else {
                        this._inputPtr = ptr2;
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
                                    _skipUtf8_4(c);
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
                } else {
                    this._inputPtr = ptr;
                }
            }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code restructure failed: missing block: B:4:0x000c, code lost:
    
        if (r4._parsingContext.inArray() == false) goto L34;
     */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0085  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0090  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected com.fasterxml.jackson.core.JsonToken _handleUnexpectedValue(int r5) throws java.io.IOException {
        /*
            r4 = this;
            r0 = 1
            switch(r5) {
                case 39: goto L7d;
                case 43: goto L5a;
                case 44: goto L44;
                case 73: goto L2a;
                case 78: goto L10;
                case 93: goto L6;
                case 125: goto L54;
                default: goto L4;
            }
        L4:
            goto L8a
        L6:
            com.fasterxml.jackson.core.json.JsonReadContext r1 = r4._parsingContext
            boolean r1 = r1.inArray()
            if (r1 != 0) goto L44
            goto L8a
        L10:
            java.lang.String r1 = "NaN"
            r4._matchToken(r1, r0)
            com.fasterxml.jackson.core.JsonParser$Feature r0 = com.fasterxml.jackson.core.JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS
            boolean r0 = r4.isEnabled(r0)
            if (r0 == 0) goto L24
            r2 = 9221120237041090560(0x7ff8000000000000, double:NaN)
            com.fasterxml.jackson.core.JsonToken r0 = r4.resetAsNaN(r1, r2)
            return r0
        L24:
            java.lang.String r0 = "Non-standard token 'NaN': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow"
            r4._reportError(r0)
            goto L8a
        L2a:
            java.lang.String r1 = "Infinity"
            r4._matchToken(r1, r0)
            com.fasterxml.jackson.core.JsonParser$Feature r0 = com.fasterxml.jackson.core.JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS
            boolean r0 = r4.isEnabled(r0)
            if (r0 == 0) goto L3e
            r2 = 9218868437227405312(0x7ff0000000000000, double:Infinity)
            com.fasterxml.jackson.core.JsonToken r0 = r4.resetAsNaN(r1, r2)
            return r0
        L3e:
            java.lang.String r0 = "Non-standard token 'Infinity': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow"
            r4._reportError(r0)
            goto L8a
        L44:
            com.fasterxml.jackson.core.JsonParser$Feature r1 = com.fasterxml.jackson.core.JsonParser.Feature.ALLOW_MISSING_VALUES
            boolean r1 = r4.isEnabled(r1)
            if (r1 == 0) goto L54
            int r1 = r4._inputPtr
            int r1 = r1 - r0
            r4._inputPtr = r1
            com.fasterxml.jackson.core.JsonToken r0 = com.fasterxml.jackson.core.JsonToken.VALUE_NULL
            return r0
        L54:
            java.lang.String r0 = "expected a value"
            r4._reportUnexpectedChar(r5, r0)
            goto L7d
        L5a:
            int r0 = r4._inputPtr
            int r1 = r4._inputEnd
            if (r0 < r1) goto L6b
            boolean r0 = r4._loadMore()
            if (r0 != 0) goto L6b
            com.fasterxml.jackson.core.JsonToken r0 = com.fasterxml.jackson.core.JsonToken.VALUE_NUMBER_INT
            r4._reportInvalidEOFInValue(r0)
        L6b:
            byte[] r0 = r4._inputBuffer
            int r1 = r4._inputPtr
            int r2 = r1 + 1
            r4._inputPtr = r2
            r0 = r0[r1]
            r0 = r0 & 255(0xff, float:3.57E-43)
            r1 = 0
            com.fasterxml.jackson.core.JsonToken r0 = r4._handleInvalidNumberStart(r0, r1)
            return r0
        L7d:
            com.fasterxml.jackson.core.JsonParser$Feature r0 = com.fasterxml.jackson.core.JsonParser.Feature.ALLOW_SINGLE_QUOTES
            boolean r0 = r4.isEnabled(r0)
            if (r0 == 0) goto L8a
            com.fasterxml.jackson.core.JsonToken r0 = r4._handleApos()
            return r0
        L8a:
            boolean r0 = java.lang.Character.isJavaIdentifierStart(r5)
            if (r0 == 0) goto La9
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            r0.<init>()
            java.lang.String r1 = ""
            java.lang.StringBuilder r0 = r0.append(r1)
            char r1 = (char) r5
            java.lang.StringBuilder r0 = r0.append(r1)
            java.lang.String r0 = r0.toString()
            java.lang.String r1 = "('true', 'false' or 'null')"
            r4._reportInvalidToken(r0, r1)
        La9:
            java.lang.String r0 = "expected a valid value (number, String, array, object, 'true', 'false' or 'null')"
            r4._reportUnexpectedChar(r5, r0)
            r0 = 0
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.UTF8StreamJsonParser._handleUnexpectedValue(int):com.fasterxml.jackson.core.JsonToken");
    }

    protected JsonToken _handleApos() throws IOException {
        int outPtr = 0;
        char[] outBuf = this._textBuffer.emptyAndGetCurrentSegment();
        int[] codes = _icUTF8;
        byte[] inputBuffer = this._inputBuffer;
        while (true) {
            if (this._inputPtr >= this._inputEnd) {
                _loadMoreGuaranteed();
            }
            if (outPtr >= outBuf.length) {
                outBuf = this._textBuffer.finishCurrentSegment();
                outPtr = 0;
            }
            int max = this._inputEnd;
            int max2 = this._inputPtr + (outBuf.length - outPtr);
            if (max2 < max) {
                max = max2;
            }
            while (this._inputPtr < max) {
                int i = this._inputPtr;
                this._inputPtr = i + 1;
                int c = inputBuffer[i] & 255;
                if (c != 39 && codes[c] == 0) {
                    outBuf[outPtr] = (char) c;
                    outPtr++;
                } else if (c != 39) {
                    switch (codes[c]) {
                        case 1:
                            c = _decodeEscaped();
                            break;
                        case 2:
                            c = _decodeUtf8_2(c);
                            break;
                        case 3:
                            if (this._inputEnd - this._inputPtr >= 2) {
                                c = _decodeUtf8_3fast(c);
                                break;
                            } else {
                                c = _decodeUtf8_3(c);
                                break;
                            }
                        case 4:
                            int c2 = _decodeUtf8_4(c);
                            int outPtr2 = outPtr + 1;
                            outBuf[outPtr] = (char) ((c2 >> 10) | GeneratorBase.SURR1_FIRST);
                            if (outPtr2 < outBuf.length) {
                                outPtr = outPtr2;
                            } else {
                                outBuf = this._textBuffer.finishCurrentSegment();
                                outPtr = 0;
                            }
                            int outPtr3 = c2 & 1023;
                            c = outPtr3 | GeneratorBase.SURR2_FIRST;
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
                } else {
                    this._textBuffer.setCurrentLength(outPtr);
                    return JsonToken.VALUE_STRING;
                }
            }
        }
    }

    protected JsonToken _handleInvalidNumberStart(int i, boolean neg) throws IOException {
        String match;
        while (i == 73) {
            if (this._inputPtr >= this._inputEnd && !_loadMore()) {
                _reportInvalidEOFInValue(JsonToken.VALUE_NUMBER_FLOAT);
            }
            byte[] bArr = this._inputBuffer;
            int i2 = this._inputPtr;
            this._inputPtr = i2 + 1;
            i = bArr[i2];
            if (i == 78) {
                match = neg ? "-INF" : "+INF";
            } else {
                if (i != 110) {
                    break;
                }
                match = neg ? "-Infinity" : "+Infinity";
            }
            _matchToken(match, 3);
            if (isEnabled(JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS)) {
                return resetAsNaN(match, neg ? Double.NEGATIVE_INFINITY : Double.POSITIVE_INFINITY);
            }
            _reportError("Non-standard token '%s': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow", match);
        }
        reportUnexpectedNumberChar(i, "expected digit (0-9) to follow minus sign, for valid numeric value");
        return null;
    }

    protected final void _matchTrue() throws IOException {
        int ch;
        int ptr = this._inputPtr;
        if (ptr + 3 < this._inputEnd) {
            byte[] buf = this._inputBuffer;
            int ptr2 = ptr + 1;
            if (buf[ptr] == 114) {
                int ptr3 = ptr2 + 1;
                if (buf[ptr2] == 117) {
                    int ptr4 = ptr3 + 1;
                    if (buf[ptr3] == 101 && ((ch = buf[ptr4] & 255) < 48 || ch == 93 || ch == 125)) {
                        this._inputPtr = ptr4;
                        return;
                    }
                }
            }
        }
        _matchToken2(CredentialEntry.TRUE_STRING, 1);
    }

    protected final void _matchFalse() throws IOException {
        int ch;
        int ptr = this._inputPtr;
        if (ptr + 4 < this._inputEnd) {
            byte[] buf = this._inputBuffer;
            int ptr2 = ptr + 1;
            if (buf[ptr] == 97) {
                int ptr3 = ptr2 + 1;
                if (buf[ptr2] == 108) {
                    ptr2 = ptr3 + 1;
                    if (buf[ptr3] == 115) {
                        int ptr4 = ptr2 + 1;
                        if (buf[ptr2] == 101 && ((ch = buf[ptr4] & 255) < 48 || ch == 93 || ch == 125)) {
                            this._inputPtr = ptr4;
                            return;
                        }
                    }
                }
            }
        }
        _matchToken2(CredentialEntry.FALSE_STRING, 1);
    }

    protected final void _matchNull() throws IOException {
        int ch;
        int ptr = this._inputPtr;
        if (ptr + 3 < this._inputEnd) {
            byte[] buf = this._inputBuffer;
            int ptr2 = ptr + 1;
            if (buf[ptr] == 117) {
                int ptr3 = ptr2 + 1;
                if (buf[ptr2] == 108) {
                    int ptr4 = ptr3 + 1;
                    if (buf[ptr3] == 108 && ((ch = buf[ptr4] & 255) < 48 || ch == 93 || ch == 125)) {
                        this._inputPtr = ptr4;
                        return;
                    }
                }
            }
        }
        _matchToken2("null", 1);
    }

    protected final void _matchToken(String matchStr, int i) throws IOException {
        int len = matchStr.length();
        if (this._inputPtr + len >= this._inputEnd) {
            _matchToken2(matchStr, i);
            return;
        }
        do {
            if (this._inputBuffer[this._inputPtr] != matchStr.charAt(i)) {
                _reportInvalidToken(matchStr.substring(0, i));
            }
            this._inputPtr++;
            i++;
        } while (i < len);
        int ch = this._inputBuffer[this._inputPtr] & 255;
        if (ch >= 48 && ch != 93 && ch != 125) {
            _checkMatchEnd(matchStr, i, ch);
        }
    }

    private final void _matchToken2(String matchStr, int i) throws IOException {
        int ch;
        int len = matchStr.length();
        do {
            if ((this._inputPtr >= this._inputEnd && !_loadMore()) || this._inputBuffer[this._inputPtr] != matchStr.charAt(i)) {
                _reportInvalidToken(matchStr.substring(0, i));
            }
            this._inputPtr++;
            i++;
        } while (i < len);
        if ((this._inputPtr < this._inputEnd || _loadMore()) && (ch = this._inputBuffer[this._inputPtr] & 255) >= 48 && ch != 93 && ch != 125) {
            _checkMatchEnd(matchStr, i, ch);
        }
    }

    private final void _checkMatchEnd(String matchStr, int i, int ch) throws IOException {
        char c = (char) _decodeCharForError(ch);
        if (Character.isJavaIdentifierPart(c)) {
            _reportInvalidToken(matchStr.substring(0, i));
        }
    }

    private final int _skipWS() throws IOException {
        while (this._inputPtr < this._inputEnd) {
            byte[] bArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            int i2 = bArr[i] & 255;
            if (i2 > 32) {
                if (i2 == 47 || i2 == 35) {
                    this._inputPtr--;
                    return _skipWS2();
                }
                return i2;
            }
            if (i2 != 32) {
                if (i2 == 10) {
                    this._currInputRow++;
                    this._currInputRowStart = this._inputPtr;
                } else if (i2 == 13) {
                    _skipCR();
                } else if (i2 != 9) {
                    _throwInvalidSpace(i2);
                }
            }
        }
        return _skipWS2();
    }

    private final int _skipWS2() throws IOException {
        int i;
        while (true) {
            if (this._inputPtr < this._inputEnd || _loadMore()) {
                byte[] bArr = this._inputBuffer;
                int i2 = this._inputPtr;
                this._inputPtr = i2 + 1;
                i = bArr[i2] & 255;
                if (i > 32) {
                    if (i == 47) {
                        _skipComment();
                    } else if (i != 35 || !_skipYAMLComment()) {
                        break;
                    }
                } else if (i != 32) {
                    if (i == 10) {
                        this._currInputRow++;
                        this._currInputRowStart = this._inputPtr;
                    } else if (i == 13) {
                        _skipCR();
                    } else if (i != 9) {
                        _throwInvalidSpace(i);
                    }
                }
            } else {
                throw _constructError("Unexpected end-of-input within/between " + this._parsingContext.typeDesc() + " entries");
            }
        }
        return i;
    }

    private final int _skipWSOrEnd() throws IOException {
        if (this._inputPtr >= this._inputEnd && !_loadMore()) {
            return _eofAsNextChar();
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int i2 = bArr[i] & 255;
        if (i2 > 32) {
            if (i2 == 47 || i2 == 35) {
                this._inputPtr--;
                return _skipWSOrEnd2();
            }
            return i2;
        }
        if (i2 != 32) {
            if (i2 == 10) {
                this._currInputRow++;
                this._currInputRowStart = this._inputPtr;
            } else if (i2 == 13) {
                _skipCR();
            } else if (i2 != 9) {
                _throwInvalidSpace(i2);
            }
        }
        while (this._inputPtr < this._inputEnd) {
            byte[] bArr2 = this._inputBuffer;
            int i3 = this._inputPtr;
            this._inputPtr = i3 + 1;
            int i4 = bArr2[i3] & 255;
            if (i4 > 32) {
                if (i4 == 47 || i4 == 35) {
                    this._inputPtr--;
                    return _skipWSOrEnd2();
                }
                return i4;
            }
            if (i4 != 32) {
                if (i4 == 10) {
                    this._currInputRow++;
                    this._currInputRowStart = this._inputPtr;
                } else if (i4 == 13) {
                    _skipCR();
                } else if (i4 != 9) {
                    _throwInvalidSpace(i4);
                }
            }
        }
        return _skipWSOrEnd2();
    }

    private final int _skipWSOrEnd2() throws IOException {
        int i;
        while (true) {
            if (this._inputPtr < this._inputEnd || _loadMore()) {
                byte[] bArr = this._inputBuffer;
                int i2 = this._inputPtr;
                this._inputPtr = i2 + 1;
                i = bArr[i2] & 255;
                if (i > 32) {
                    if (i == 47) {
                        _skipComment();
                    } else if (i != 35 || !_skipYAMLComment()) {
                        break;
                    }
                } else if (i != 32) {
                    if (i == 10) {
                        this._currInputRow++;
                        this._currInputRowStart = this._inputPtr;
                    } else if (i == 13) {
                        _skipCR();
                    } else if (i != 9) {
                        _throwInvalidSpace(i);
                    }
                }
            } else {
                return _eofAsNextChar();
            }
        }
        return i;
    }

    private final int _skipColon() throws IOException {
        if (this._inputPtr + 4 >= this._inputEnd) {
            return _skipColon2(false);
        }
        int i = this._inputBuffer[this._inputPtr];
        if (i == 58) {
            byte[] bArr = this._inputBuffer;
            int i2 = this._inputPtr + 1;
            this._inputPtr = i2;
            int i3 = bArr[i2];
            if (i3 > 32) {
                if (i3 == 47 || i3 == 35) {
                    return _skipColon2(true);
                }
                this._inputPtr++;
                return i3;
            }
            if (i3 == 32 || i3 == 9) {
                byte[] bArr2 = this._inputBuffer;
                int i4 = this._inputPtr + 1;
                this._inputPtr = i4;
                int i5 = bArr2[i4];
                if (i5 > 32) {
                    if (i5 == 47 || i5 == 35) {
                        return _skipColon2(true);
                    }
                    this._inputPtr++;
                    return i5;
                }
            }
            return _skipColon2(true);
        }
        if (i == 32 || i == 9) {
            byte[] bArr3 = this._inputBuffer;
            int i6 = this._inputPtr + 1;
            this._inputPtr = i6;
            i = bArr3[i6];
        }
        if (i == 58) {
            byte[] bArr4 = this._inputBuffer;
            int i7 = this._inputPtr + 1;
            this._inputPtr = i7;
            int i8 = bArr4[i7];
            if (i8 > 32) {
                if (i8 == 47 || i8 == 35) {
                    return _skipColon2(true);
                }
                this._inputPtr++;
                return i8;
            }
            if (i8 == 32 || i8 == 9) {
                byte[] bArr5 = this._inputBuffer;
                int i9 = this._inputPtr + 1;
                this._inputPtr = i9;
                int i10 = bArr5[i9];
                if (i10 > 32) {
                    if (i10 == 47 || i10 == 35) {
                        return _skipColon2(true);
                    }
                    this._inputPtr++;
                    return i10;
                }
            }
            return _skipColon2(true);
        }
        return _skipColon2(false);
    }

    private final int _skipColon2(boolean gotColon) throws IOException {
        while (true) {
            if (this._inputPtr < this._inputEnd || _loadMore()) {
                byte[] bArr = this._inputBuffer;
                int i = this._inputPtr;
                this._inputPtr = i + 1;
                int i2 = bArr[i] & 255;
                if (i2 > 32) {
                    if (i2 == 47) {
                        _skipComment();
                    } else if (i2 != 35 || !_skipYAMLComment()) {
                        if (gotColon) {
                            return i2;
                        }
                        if (i2 != 58) {
                            _reportUnexpectedChar(i2, "was expecting a colon to separate field name and value");
                        }
                        gotColon = true;
                    }
                } else if (i2 != 32) {
                    if (i2 == 10) {
                        this._currInputRow++;
                        this._currInputRowStart = this._inputPtr;
                    } else if (i2 == 13) {
                        _skipCR();
                    } else if (i2 != 9) {
                        _throwInvalidSpace(i2);
                    }
                }
            } else {
                _reportInvalidEOF(" within/between " + this._parsingContext.typeDesc() + " entries", null);
                return -1;
            }
        }
    }

    private final void _skipComment() throws IOException {
        if (!isEnabled(JsonParser.Feature.ALLOW_COMMENTS)) {
            _reportUnexpectedChar(47, "maybe a (non-standard) comment? (not recognized as one since Feature 'ALLOW_COMMENTS' not enabled for parser)");
        }
        if (this._inputPtr >= this._inputEnd && !_loadMore()) {
            _reportInvalidEOF(" in a comment", null);
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int c = bArr[i] & 255;
        if (c == 47) {
            _skipLine();
        } else if (c == 42) {
            _skipCComment();
        } else {
            _reportUnexpectedChar(c, "was expecting either '*' or '/' for a comment");
        }
    }

    private final void _skipCComment() throws IOException {
        int[] codes = CharTypes.getInputCodeComment();
        while (true) {
            if (this._inputPtr < this._inputEnd || _loadMore()) {
                byte[] bArr = this._inputBuffer;
                int i = this._inputPtr;
                this._inputPtr = i + 1;
                int i2 = bArr[i] & 255;
                int code = codes[i2];
                if (code != 0) {
                    switch (code) {
                        case 2:
                            _skipUtf8_2();
                            break;
                        case 3:
                            _skipUtf8_3();
                            break;
                        case 4:
                            _skipUtf8_4(i2);
                            break;
                        case 10:
                            this._currInputRow++;
                            this._currInputRowStart = this._inputPtr;
                            break;
                        case 13:
                            _skipCR();
                            break;
                        case 42:
                            if (this._inputPtr >= this._inputEnd && !_loadMore()) {
                                break;
                            } else if (this._inputBuffer[this._inputPtr] != 47) {
                                break;
                            } else {
                                this._inputPtr++;
                                return;
                            }
                        default:
                            _reportInvalidChar(i2);
                            break;
                    }
                }
            }
        }
        _reportInvalidEOF(" in a comment", null);
    }

    private final boolean _skipYAMLComment() throws IOException {
        if (!isEnabled(JsonParser.Feature.ALLOW_YAML_COMMENTS)) {
            return false;
        }
        _skipLine();
        return true;
    }

    private final void _skipLine() throws IOException {
        int[] codes = CharTypes.getInputCodeComment();
        while (true) {
            if (this._inputPtr < this._inputEnd || _loadMore()) {
                byte[] bArr = this._inputBuffer;
                int i = this._inputPtr;
                this._inputPtr = i + 1;
                int i2 = bArr[i] & 255;
                int code = codes[i2];
                if (code != 0) {
                    switch (code) {
                        case 2:
                            _skipUtf8_2();
                            break;
                        case 3:
                            _skipUtf8_3();
                            break;
                        case 4:
                            _skipUtf8_4(i2);
                            break;
                        case 10:
                            this._currInputRow++;
                            this._currInputRowStart = this._inputPtr;
                            return;
                        case 13:
                            _skipCR();
                            return;
                        case 42:
                            break;
                        default:
                            if (code >= 0) {
                                break;
                            } else {
                                _reportInvalidChar(i2);
                                break;
                            }
                    }
                }
            } else {
                return;
            }
        }
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase
    protected char _decodeEscaped() throws IOException {
        if (this._inputPtr >= this._inputEnd && !_loadMore()) {
            _reportInvalidEOF(" in character escape sequence", JsonToken.VALUE_STRING);
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int c = bArr[i];
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
                for (int i2 = 0; i2 < 4; i2++) {
                    if (this._inputPtr >= this._inputEnd && !_loadMore()) {
                        _reportInvalidEOF(" in character escape sequence", JsonToken.VALUE_STRING);
                    }
                    byte[] bArr2 = this._inputBuffer;
                    int i3 = this._inputPtr;
                    this._inputPtr = i3 + 1;
                    int ch = bArr2[i3];
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
            int d = nextByte();
            if ((d & 192) != 128) {
                _reportInvalidOther(d & 255);
            }
            int c2 = (c << 6) | (d & 63);
            if (needed > 1) {
                int d2 = nextByte();
                if ((d2 & 192) != 128) {
                    _reportInvalidOther(d2 & 255);
                }
                int c3 = (c2 << 6) | (d2 & 63);
                if (needed > 2) {
                    int d3 = nextByte();
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
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int d = bArr[i];
        if ((d & 192) != 128) {
            _reportInvalidOther(d & 255, this._inputPtr);
        }
        return ((c & 31) << 6) | (d & 63);
    }

    private final int _decodeUtf8_3(int c1) throws IOException {
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        int c12 = c1 & 15;
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int d = bArr[i];
        if ((d & 192) != 128) {
            _reportInvalidOther(d & 255, this._inputPtr);
        }
        int c = (c12 << 6) | (d & 63);
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        byte[] bArr2 = this._inputBuffer;
        int i2 = this._inputPtr;
        this._inputPtr = i2 + 1;
        int d2 = bArr2[i2];
        if ((d2 & 192) != 128) {
            _reportInvalidOther(d2 & 255, this._inputPtr);
        }
        return (c << 6) | (d2 & 63);
    }

    private final int _decodeUtf8_3fast(int c1) throws IOException {
        int c12 = c1 & 15;
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int d = bArr[i];
        if ((d & 192) != 128) {
            _reportInvalidOther(d & 255, this._inputPtr);
        }
        int c = (c12 << 6) | (d & 63);
        byte[] bArr2 = this._inputBuffer;
        int i2 = this._inputPtr;
        this._inputPtr = i2 + 1;
        int d2 = bArr2[i2];
        if ((d2 & 192) != 128) {
            _reportInvalidOther(d2 & 255, this._inputPtr);
        }
        return (c << 6) | (d2 & 63);
    }

    private final int _decodeUtf8_4(int c) throws IOException {
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int d = bArr[i];
        if ((d & 192) != 128) {
            _reportInvalidOther(d & 255, this._inputPtr);
        }
        int c2 = ((c & 7) << 6) | (d & 63);
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        byte[] bArr2 = this._inputBuffer;
        int i2 = this._inputPtr;
        this._inputPtr = i2 + 1;
        int d2 = bArr2[i2];
        if ((d2 & 192) != 128) {
            _reportInvalidOther(d2 & 255, this._inputPtr);
        }
        int c3 = (c2 << 6) | (d2 & 63);
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        byte[] bArr3 = this._inputBuffer;
        int i3 = this._inputPtr;
        this._inputPtr = i3 + 1;
        int d3 = bArr3[i3];
        if ((d3 & 192) != 128) {
            _reportInvalidOther(d3 & 255, this._inputPtr);
        }
        return ((c3 << 6) | (d3 & 63)) - 65536;
    }

    private final void _skipUtf8_2() throws IOException {
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int c = bArr[i];
        if ((c & 192) != 128) {
            _reportInvalidOther(c & 255, this._inputPtr);
        }
    }

    private final void _skipUtf8_3() throws IOException {
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int c = bArr[i];
        if ((c & 192) != 128) {
            _reportInvalidOther(c & 255, this._inputPtr);
        }
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        byte[] bArr2 = this._inputBuffer;
        int i2 = this._inputPtr;
        this._inputPtr = i2 + 1;
        int c2 = bArr2[i2];
        if ((c2 & 192) != 128) {
            _reportInvalidOther(c2 & 255, this._inputPtr);
        }
    }

    private final void _skipUtf8_4(int c) throws IOException {
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int d = bArr[i];
        if ((d & 192) != 128) {
            _reportInvalidOther(d & 255, this._inputPtr);
        }
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        byte[] bArr2 = this._inputBuffer;
        int i2 = this._inputPtr;
        this._inputPtr = i2 + 1;
        int d2 = bArr2[i2];
        if ((d2 & 192) != 128) {
            _reportInvalidOther(d2 & 255, this._inputPtr);
        }
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        byte[] bArr3 = this._inputBuffer;
        int i3 = this._inputPtr;
        this._inputPtr = i3 + 1;
        int d3 = bArr3[i3];
        if ((d3 & 192) != 128) {
            _reportInvalidOther(d3 & 255, this._inputPtr);
        }
    }

    protected final void _skipCR() throws IOException {
        if ((this._inputPtr < this._inputEnd || _loadMore()) && this._inputBuffer[this._inputPtr] == 10) {
            this._inputPtr++;
        }
        this._currInputRow++;
        this._currInputRowStart = this._inputPtr;
    }

    private int nextByte() throws IOException {
        if (this._inputPtr >= this._inputEnd) {
            _loadMoreGuaranteed();
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        return bArr[i] & 255;
    }

    protected void _reportInvalidToken(String matchedPart, int ptr) throws IOException {
        this._inputPtr = ptr;
        _reportInvalidToken(matchedPart, "'null', 'true', 'false' or NaN");
    }

    protected void _reportInvalidToken(String matchedPart) throws IOException {
        _reportInvalidToken(matchedPart, "'null', 'true', 'false' or NaN");
    }

    protected void _reportInvalidToken(String matchedPart, String msg) throws IOException {
        StringBuilder sb = new StringBuilder(matchedPart);
        while (true) {
            if (this._inputPtr >= this._inputEnd && !_loadMore()) {
                break;
            }
            byte[] bArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            int i2 = bArr[i];
            char c = (char) _decodeCharForError(i2);
            if (!Character.isJavaIdentifierPart(c)) {
                break;
            }
            sb.append(c);
            if (sb.length() >= 256) {
                sb.append("...");
                break;
            }
        }
        _reportError("Unrecognized token '%s': was expecting %s", sb, msg);
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

    protected void _reportInvalidOther(int mask) throws JsonParseException {
        _reportError("Invalid UTF-8 middle byte 0x" + Integer.toHexString(mask));
    }

    protected void _reportInvalidOther(int mask, int ptr) throws JsonParseException {
        this._inputPtr = ptr;
        _reportInvalidOther(mask);
    }

    protected final byte[] _decodeBase64(Base64Variant b64variant) throws IOException {
        ByteArrayBuilder builder = _getByteArrayBuilder();
        while (true) {
            if (this._inputPtr >= this._inputEnd) {
                _loadMoreGuaranteed();
            }
            byte[] bArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            int ch = bArr[i] & 255;
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
                if (this._inputPtr >= this._inputEnd) {
                    _loadMoreGuaranteed();
                }
                byte[] bArr2 = this._inputBuffer;
                int i2 = this._inputPtr;
                this._inputPtr = i2 + 1;
                int ch2 = bArr2[i2] & 255;
                int bits2 = b64variant.decodeBase64Char(ch2);
                if (bits2 < 0) {
                    bits2 = _decodeBase64Escape(b64variant, ch2, 1);
                }
                int decodedData2 = (decodedData << 6) | bits2;
                if (this._inputPtr >= this._inputEnd) {
                    _loadMoreGuaranteed();
                }
                byte[] bArr3 = this._inputBuffer;
                int i3 = this._inputPtr;
                this._inputPtr = i3 + 1;
                int ch3 = bArr3[i3] & 255;
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
                        if (this._inputPtr >= this._inputEnd) {
                            _loadMoreGuaranteed();
                        }
                        byte[] bArr4 = this._inputBuffer;
                        int i4 = this._inputPtr;
                        this._inputPtr = i4 + 1;
                        int ch4 = bArr4[i4] & 255;
                        if (!b64variant.usesPaddingChar(ch4)) {
                            throw reportInvalidBase64Char(b64variant, ch4, 3, "expected padding character '" + b64variant.getPaddingChar() + "'");
                        }
                        builder.append(decodedData2 >> 4);
                    }
                }
                int decodedData3 = (decodedData2 << 6) | bits3;
                if (this._inputPtr >= this._inputEnd) {
                    _loadMoreGuaranteed();
                }
                byte[] bArr5 = this._inputBuffer;
                int i5 = this._inputPtr;
                this._inputPtr = i5 + 1;
                int ch5 = bArr5[i5] & 255;
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
        if (this._currToken == JsonToken.FIELD_NAME) {
            long total = this._currInputProcessed + (this._nameStartOffset - 1);
            return new JsonLocation(_getSourceReference(), total, -1L, this._nameStartRow, this._nameStartCol);
        }
        return new JsonLocation(_getSourceReference(), this._tokenInputTotal - 1, -1L, this._tokenInputRow, this._tokenInputCol);
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase, com.fasterxml.jackson.core.JsonParser
    public JsonLocation getCurrentLocation() {
        int col = (this._inputPtr - this._currInputRowStart) + 1;
        return new JsonLocation(_getSourceReference(), this._currInputProcessed + this._inputPtr, -1L, this._currInputRow, col);
    }

    private final void _updateLocation() {
        this._tokenInputRow = this._currInputRow;
        int ptr = this._inputPtr;
        this._tokenInputTotal = this._currInputProcessed + ptr;
        this._tokenInputCol = ptr - this._currInputRowStart;
    }

    private final void _updateNameLocation() {
        this._nameStartRow = this._currInputRow;
        int ptr = this._inputPtr;
        this._nameStartOffset = ptr;
        this._nameStartCol = ptr - this._currInputRowStart;
    }

    private final JsonToken _closeScope(int i) throws JsonParseException {
        if (i == 125) {
            _closeObjectScope();
            JsonToken jsonToken = JsonToken.END_OBJECT;
            this._currToken = jsonToken;
            return jsonToken;
        }
        _closeArrayScope();
        JsonToken jsonToken2 = JsonToken.END_ARRAY;
        this._currToken = jsonToken2;
        return jsonToken2;
    }

    private final void _closeArrayScope() throws JsonParseException {
        _updateLocation();
        if (!this._parsingContext.inArray()) {
            _reportMismatchedEndMarker(93, '}');
        }
        this._parsingContext = this._parsingContext.clearAndGetParent();
    }

    private final void _closeObjectScope() throws JsonParseException {
        _updateLocation();
        if (!this._parsingContext.inObject()) {
            _reportMismatchedEndMarker(125, ']');
        }
        this._parsingContext = this._parsingContext.clearAndGetParent();
    }
}
