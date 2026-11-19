package com.fasterxml.jackson.core.json;

import androidx.credentials.CredentialOption;
import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonStreamContext;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.core.SerializableString;
import com.fasterxml.jackson.core.io.CharTypes;
import com.fasterxml.jackson.core.io.IOContext;
import com.fasterxml.jackson.core.io.NumberOutput;
import com.google.common.base.Ascii;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.io.Writer;
import java.math.BigDecimal;
import java.math.BigInteger;
import kotlin.text.Typography;

/* carregado de: classes.dex */
public class WriterBasedJsonGenerator extends JsonGeneratorImpl {
    protected static final char[] HEX_CHARS = CharTypes.copyHexChars();
    protected static final int SHORT_WRITE = 32;
    protected char[] _charBuffer;
    protected SerializableString _currentEscape;
    protected char[] _entityBuffer;
    protected char[] _outputBuffer;
    protected int _outputEnd;
    protected int _outputHead;
    protected int _outputTail;
    protected char _quoteChar;
    protected final Writer _writer;

    public WriterBasedJsonGenerator(IOContext ctxt, int features, ObjectCodec codec, Writer w) {
        super(ctxt, features, codec);
        this._quoteChar = Typography.quote;
        this._writer = w;
        this._outputBuffer = ctxt.allocConcatBuffer();
        this._outputEnd = this._outputBuffer.length;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public Object getOutputTarget() {
        return this._writer;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public int getOutputBuffered() {
        int len = this._outputTail - this._outputHead;
        return Math.max(0, len);
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public boolean canWriteFormattedNumbers() {
        return true;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeFieldName(String name) throws IOException {
        int status = this._writeContext.writeFieldName(name);
        if (status == 4) {
            _reportError("Can not write a field name, expecting a value");
        }
        _writeFieldName(name, status == 1);
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase, com.fasterxml.jackson.core.JsonGenerator
    public void writeFieldName(SerializableString name) throws IOException {
        int status = this._writeContext.writeFieldName(name.getValue());
        if (status == 4) {
            _reportError("Can not write a field name, expecting a value");
        }
        _writeFieldName(name, status == 1);
    }

    protected final void _writeFieldName(String name, boolean commaBefore) throws IOException {
        if (this._cfgPrettyPrinter != null) {
            _writePPFieldName(name, commaBefore);
            return;
        }
        if (this._outputTail + 1 >= this._outputEnd) {
            _flushBuffer();
        }
        if (commaBefore) {
            char[] cArr = this._outputBuffer;
            int i = this._outputTail;
            this._outputTail = i + 1;
            cArr[i] = ',';
        }
        if (this._cfgUnqNames) {
            _writeString(name);
            return;
        }
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = this._quoteChar;
        _writeString(name);
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr3 = this._outputBuffer;
        int i3 = this._outputTail;
        this._outputTail = i3 + 1;
        cArr3[i3] = this._quoteChar;
    }

    protected final void _writeFieldName(SerializableString name, boolean commaBefore) throws IOException {
        if (this._cfgPrettyPrinter != null) {
            _writePPFieldName(name, commaBefore);
            return;
        }
        if (this._outputTail + 1 >= this._outputEnd) {
            _flushBuffer();
        }
        if (commaBefore) {
            char[] cArr = this._outputBuffer;
            int i = this._outputTail;
            this._outputTail = i + 1;
            cArr[i] = ',';
        }
        char[] quoted = name.asQuotedChars();
        if (this._cfgUnqNames) {
            writeRaw(quoted, 0, quoted.length);
            return;
        }
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = this._quoteChar;
        int qlen = quoted.length;
        if (this._outputTail + qlen + 1 >= this._outputEnd) {
            writeRaw(quoted, 0, qlen);
            if (this._outputTail >= this._outputEnd) {
                _flushBuffer();
            }
            char[] cArr3 = this._outputBuffer;
            int i3 = this._outputTail;
            this._outputTail = i3 + 1;
            cArr3[i3] = this._quoteChar;
            return;
        }
        System.arraycopy(quoted, 0, this._outputBuffer, this._outputTail, qlen);
        this._outputTail += qlen;
        char[] cArr4 = this._outputBuffer;
        int i4 = this._outputTail;
        this._outputTail = i4 + 1;
        cArr4[i4] = this._quoteChar;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeStartArray() throws IOException {
        _verifyValueWrite("start an array");
        this._writeContext = this._writeContext.createChildArrayContext();
        if (this._cfgPrettyPrinter != null) {
            this._cfgPrettyPrinter.writeStartArray(this);
            return;
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = '[';
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeEndArray() throws IOException {
        if (!this._writeContext.inArray()) {
            _reportError("Current context not Array but " + this._writeContext.typeDesc());
        }
        if (this._cfgPrettyPrinter != null) {
            this._cfgPrettyPrinter.writeEndArray(this, this._writeContext.getEntryCount());
        } else {
            if (this._outputTail >= this._outputEnd) {
                _flushBuffer();
            }
            char[] cArr = this._outputBuffer;
            int i = this._outputTail;
            this._outputTail = i + 1;
            cArr[i] = ']';
        }
        this._writeContext = this._writeContext.clearAndGetParent();
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase, com.fasterxml.jackson.core.JsonGenerator
    public void writeStartObject(Object forValue) throws IOException {
        _verifyValueWrite("start an object");
        JsonWriteContext ctxt = this._writeContext.createChildObjectContext();
        this._writeContext = ctxt;
        if (forValue != null) {
            ctxt.setCurrentValue(forValue);
        }
        if (this._cfgPrettyPrinter != null) {
            this._cfgPrettyPrinter.writeStartObject(this);
            return;
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = '{';
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeStartObject() throws IOException {
        _verifyValueWrite("start an object");
        this._writeContext = this._writeContext.createChildObjectContext();
        if (this._cfgPrettyPrinter != null) {
            this._cfgPrettyPrinter.writeStartObject(this);
            return;
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = '{';
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeEndObject() throws IOException {
        if (!this._writeContext.inObject()) {
            _reportError("Current context not Object but " + this._writeContext.typeDesc());
        }
        if (this._cfgPrettyPrinter != null) {
            this._cfgPrettyPrinter.writeEndObject(this, this._writeContext.getEntryCount());
        } else {
            if (this._outputTail >= this._outputEnd) {
                _flushBuffer();
            }
            char[] cArr = this._outputBuffer;
            int i = this._outputTail;
            this._outputTail = i + 1;
            cArr[i] = '}';
        }
        this._writeContext = this._writeContext.clearAndGetParent();
    }

    protected final void _writePPFieldName(String name, boolean commaBefore) throws IOException {
        if (commaBefore) {
            this._cfgPrettyPrinter.writeObjectEntrySeparator(this);
        } else {
            this._cfgPrettyPrinter.beforeObjectEntries(this);
        }
        if (this._cfgUnqNames) {
            _writeString(name);
            return;
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = this._quoteChar;
        _writeString(name);
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = this._quoteChar;
    }

    protected final void _writePPFieldName(SerializableString name, boolean commaBefore) throws IOException {
        if (commaBefore) {
            this._cfgPrettyPrinter.writeObjectEntrySeparator(this);
        } else {
            this._cfgPrettyPrinter.beforeObjectEntries(this);
        }
        char[] quoted = name.asQuotedChars();
        if (this._cfgUnqNames) {
            writeRaw(quoted, 0, quoted.length);
            return;
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = this._quoteChar;
        writeRaw(quoted, 0, quoted.length);
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = this._quoteChar;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeString(String text) throws IOException {
        _verifyValueWrite("write a string");
        if (text == null) {
            _writeNull();
            return;
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = this._quoteChar;
        _writeString(text);
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = this._quoteChar;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeString(Reader reader, int len) throws IOException {
        _verifyValueWrite("write a string");
        if (reader == null) {
            _reportError("null reader");
        }
        int toRead = len >= 0 ? len : Integer.MAX_VALUE;
        char[] buf = _allocateCopyBuffer();
        if (this._outputTail + len >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = this._quoteChar;
        while (toRead > 0) {
            int toReadNow = Math.min(toRead, buf.length);
            int numRead = reader.read(buf, 0, toReadNow);
            if (numRead <= 0) {
                break;
            }
            if (this._outputTail + len >= this._outputEnd) {
                _flushBuffer();
            }
            _writeString(buf, 0, numRead);
            toRead -= numRead;
        }
        if (this._outputTail + len >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = this._quoteChar;
        if (toRead > 0 && len >= 0) {
            _reportError("Didn't read enough from reader");
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeString(char[] text, int offset, int len) throws IOException {
        _verifyValueWrite("write a string");
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = this._quoteChar;
        _writeString(text, offset, len);
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = this._quoteChar;
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase, com.fasterxml.jackson.core.JsonGenerator
    public void writeString(SerializableString sstr) throws IOException {
        _verifyValueWrite("write a string");
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = this._quoteChar;
        char[] text = sstr.asQuotedChars();
        int len = text.length;
        if (len < 32) {
            int room = this._outputEnd - this._outputTail;
            if (len > room) {
                _flushBuffer();
            }
            System.arraycopy(text, 0, this._outputBuffer, this._outputTail, len);
            this._outputTail += len;
        } else {
            _flushBuffer();
            this._writer.write(text, 0, len);
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = this._quoteChar;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRawUTF8String(byte[] text, int offset, int length) throws IOException {
        _reportUnsupportedOperation();
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeUTF8String(byte[] text, int offset, int length) throws IOException {
        _reportUnsupportedOperation();
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRaw(String text) throws IOException {
        int len = text.length();
        int room = this._outputEnd - this._outputTail;
        if (room == 0) {
            _flushBuffer();
            room = this._outputEnd - this._outputTail;
        }
        if (room >= len) {
            text.getChars(0, len, this._outputBuffer, this._outputTail);
            this._outputTail += len;
        } else {
            writeRawLong(text);
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRaw(String text, int start, int len) throws IOException {
        int room = this._outputEnd - this._outputTail;
        if (room < len) {
            _flushBuffer();
            room = this._outputEnd - this._outputTail;
        }
        if (room >= len) {
            text.getChars(start, start + len, this._outputBuffer, this._outputTail);
            this._outputTail += len;
        } else {
            writeRawLong(text.substring(start, start + len));
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRaw(SerializableString text) throws IOException {
        writeRaw(text.getValue());
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRaw(char[] text, int offset, int len) throws IOException {
        if (len < 32) {
            int room = this._outputEnd - this._outputTail;
            if (len > room) {
                _flushBuffer();
            }
            System.arraycopy(text, offset, this._outputBuffer, this._outputTail, len);
            this._outputTail += len;
            return;
        }
        _flushBuffer();
        this._writer.write(text, offset, len);
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRaw(char c) throws IOException {
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = c;
    }

    private void writeRawLong(String text) throws IOException {
        int room = this._outputEnd - this._outputTail;
        text.getChars(0, room, this._outputBuffer, this._outputTail);
        this._outputTail += room;
        _flushBuffer();
        int offset = room;
        int len = text.length() - room;
        while (len > this._outputEnd) {
            int amount = this._outputEnd;
            text.getChars(offset, offset + amount, this._outputBuffer, 0);
            this._outputHead = 0;
            this._outputTail = amount;
            _flushBuffer();
            offset += amount;
            len -= amount;
        }
        text.getChars(offset, offset + len, this._outputBuffer, 0);
        this._outputHead = 0;
        this._outputTail = len;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeBinary(Base64Variant b64variant, byte[] data, int offset, int len) throws IOException, JsonGenerationException {
        _verifyValueWrite("write a binary value");
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = this._quoteChar;
        _writeBinary(b64variant, data, offset, offset + len);
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = this._quoteChar;
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase, com.fasterxml.jackson.core.JsonGenerator
    public int writeBinary(Base64Variant b64variant, InputStream data, int dataLength) throws IOException, JsonGenerationException {
        int bytes;
        _verifyValueWrite("write a binary value");
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = this._quoteChar;
        byte[] encodingBuffer = this._ioContext.allocBase64Buffer();
        try {
            if (dataLength < 0) {
                bytes = _writeBinary(b64variant, data, encodingBuffer);
            } else {
                int missing = _writeBinary(b64variant, data, encodingBuffer, dataLength);
                if (missing > 0) {
                    _reportError("Too few bytes available: missing " + missing + " bytes (out of " + dataLength + ")");
                }
                bytes = dataLength;
            }
            this._ioContext.releaseBase64Buffer(encodingBuffer);
            if (this._outputTail >= this._outputEnd) {
                _flushBuffer();
            }
            char[] cArr2 = this._outputBuffer;
            int i2 = this._outputTail;
            this._outputTail = i2 + 1;
            cArr2[i2] = this._quoteChar;
            return bytes;
        } catch (Throwable th) {
            this._ioContext.releaseBase64Buffer(encodingBuffer);
            throw th;
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNumber(short s) throws IOException {
        _verifyValueWrite("write a number");
        if (this._cfgNumbersAsStrings) {
            _writeQuotedShort(s);
            return;
        }
        if (this._outputTail + 6 >= this._outputEnd) {
            _flushBuffer();
        }
        this._outputTail = NumberOutput.outputInt(s, this._outputBuffer, this._outputTail);
    }

    private void _writeQuotedShort(short s) throws IOException {
        if (this._outputTail + 8 >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = this._quoteChar;
        this._outputTail = NumberOutput.outputInt(s, this._outputBuffer, this._outputTail);
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = this._quoteChar;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNumber(int i) throws IOException {
        _verifyValueWrite("write a number");
        if (this._cfgNumbersAsStrings) {
            _writeQuotedInt(i);
            return;
        }
        if (this._outputTail + 11 >= this._outputEnd) {
            _flushBuffer();
        }
        this._outputTail = NumberOutput.outputInt(i, this._outputBuffer, this._outputTail);
    }

    private void _writeQuotedInt(int i) throws IOException {
        if (this._outputTail + 13 >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr[i2] = this._quoteChar;
        this._outputTail = NumberOutput.outputInt(i, this._outputBuffer, this._outputTail);
        char[] cArr2 = this._outputBuffer;
        int i3 = this._outputTail;
        this._outputTail = i3 + 1;
        cArr2[i3] = this._quoteChar;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNumber(long l) throws IOException {
        _verifyValueWrite("write a number");
        if (this._cfgNumbersAsStrings) {
            _writeQuotedLong(l);
            return;
        }
        if (this._outputTail + 21 >= this._outputEnd) {
            _flushBuffer();
        }
        this._outputTail = NumberOutput.outputLong(l, this._outputBuffer, this._outputTail);
    }

    private void _writeQuotedLong(long l) throws IOException {
        if (this._outputTail + 23 >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = this._quoteChar;
        this._outputTail = NumberOutput.outputLong(l, this._outputBuffer, this._outputTail);
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = this._quoteChar;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNumber(BigInteger value) throws IOException {
        _verifyValueWrite("write a number");
        if (value == null) {
            _writeNull();
        } else if (this._cfgNumbersAsStrings) {
            _writeQuotedRaw(value.toString());
        } else {
            writeRaw(value.toString());
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNumber(double d) throws IOException {
        if (this._cfgNumbersAsStrings || (isEnabled(JsonGenerator.Feature.QUOTE_NON_NUMERIC_NUMBERS) && (Double.isNaN(d) || Double.isInfinite(d)))) {
            writeString(String.valueOf(d));
        } else {
            _verifyValueWrite("write a number");
            writeRaw(String.valueOf(d));
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNumber(float f) throws IOException {
        if (this._cfgNumbersAsStrings || (isEnabled(JsonGenerator.Feature.QUOTE_NON_NUMERIC_NUMBERS) && (Float.isNaN(f) || Float.isInfinite(f)))) {
            writeString(String.valueOf(f));
        } else {
            _verifyValueWrite("write a number");
            writeRaw(String.valueOf(f));
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNumber(BigDecimal value) throws IOException {
        _verifyValueWrite("write a number");
        if (value == null) {
            _writeNull();
        } else if (this._cfgNumbersAsStrings) {
            _writeQuotedRaw(_asString(value));
        } else {
            writeRaw(_asString(value));
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNumber(String encodedValue) throws IOException {
        _verifyValueWrite("write a number");
        if (this._cfgNumbersAsStrings) {
            _writeQuotedRaw(encodedValue);
        } else {
            writeRaw(encodedValue);
        }
    }

    private void _writeQuotedRaw(String value) throws IOException {
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = this._quoteChar;
        writeRaw(value);
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = this._quoteChar;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeBoolean(boolean state) throws IOException {
        int ptr;
        _verifyValueWrite("write a boolean value");
        if (this._outputTail + 5 >= this._outputEnd) {
            _flushBuffer();
        }
        int ptr2 = this._outputTail;
        char[] buf = this._outputBuffer;
        if (state) {
            buf[ptr2] = 't';
            int ptr3 = ptr2 + 1;
            buf[ptr3] = 'r';
            int ptr4 = ptr3 + 1;
            buf[ptr4] = 'u';
            ptr = ptr4 + 1;
            buf[ptr] = 'e';
        } else {
            buf[ptr2] = 'f';
            int ptr5 = ptr2 + 1;
            buf[ptr5] = 'a';
            int ptr6 = ptr5 + 1;
            buf[ptr6] = 'l';
            int ptr7 = ptr6 + 1;
            buf[ptr7] = 's';
            ptr = ptr7 + 1;
            buf[ptr] = 'e';
        }
        this._outputTail = ptr + 1;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNull() throws IOException {
        _verifyValueWrite("write a null");
        _writeNull();
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase
    protected final void _verifyValueWrite(String typeMsg) throws IOException {
        char c;
        int status = this._writeContext.writeValue();
        if (this._cfgPrettyPrinter != null) {
            _verifyPrettyValueWrite(typeMsg, status);
            return;
        }
        switch (status) {
            case 1:
                c = ',';
                break;
            case 2:
                c = ':';
                break;
            case 3:
                if (this._rootValueSeparator != null) {
                    writeRaw(this._rootValueSeparator.getValue());
                    return;
                }
                return;
            case 4:
            default:
                return;
            case 5:
                _reportCantWriteValueExpectName(typeMsg);
                return;
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = c;
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase, com.fasterxml.jackson.core.JsonGenerator, java.io.Flushable
    public void flush() throws IOException {
        _flushBuffer();
        if (this._writer != null && isEnabled(JsonGenerator.Feature.FLUSH_PASSED_TO_STREAM)) {
            this._writer.flush();
        }
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase, com.fasterxml.jackson.core.JsonGenerator, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        super.close();
        if (this._outputBuffer != null && isEnabled(JsonGenerator.Feature.AUTO_CLOSE_JSON_CONTENT)) {
            while (true) {
                JsonStreamContext ctxt = getOutputContext();
                if (ctxt.inArray()) {
                    writeEndArray();
                } else if (!ctxt.inObject()) {
                    break;
                } else {
                    writeEndObject();
                }
            }
        }
        _flushBuffer();
        this._outputHead = 0;
        this._outputTail = 0;
        if (this._writer != null) {
            if (this._ioContext.isResourceManaged() || isEnabled(JsonGenerator.Feature.AUTO_CLOSE_TARGET)) {
                this._writer.close();
            } else if (isEnabled(JsonGenerator.Feature.FLUSH_PASSED_TO_STREAM)) {
                this._writer.flush();
            }
        }
        _releaseBuffers();
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase
    protected void _releaseBuffers() {
        char[] buf = this._outputBuffer;
        if (buf != null) {
            this._outputBuffer = null;
            this._ioContext.releaseConcatBuffer(buf);
        }
        char[] buf2 = this._charBuffer;
        if (buf2 != null) {
            this._charBuffer = null;
            this._ioContext.releaseNameCopyBuffer(buf2);
        }
    }

    private void _writeString(String text) throws IOException {
        int len = text.length();
        if (len > this._outputEnd) {
            _writeLongString(text);
            return;
        }
        if (this._outputTail + len > this._outputEnd) {
            _flushBuffer();
        }
        text.getChars(0, len, this._outputBuffer, this._outputTail);
        if (this._characterEscapes != null) {
            _writeStringCustom(len);
        } else if (this._maximumNonEscapedChar != 0) {
            _writeStringASCII(len, this._maximumNonEscapedChar);
        } else {
            _writeString2(len);
        }
    }

    private void _writeString2(int len) throws IOException {
        int i;
        int end = this._outputTail + len;
        int[] escCodes = this._outputEscapes;
        int escLen = escCodes.length;
        while (this._outputTail < end) {
            do {
                char c = this._outputBuffer[this._outputTail];
                if (c >= escLen || escCodes[c] == 0) {
                    i = this._outputTail + 1;
                    this._outputTail = i;
                } else {
                    int flushLen = this._outputTail - this._outputHead;
                    if (flushLen > 0) {
                        this._writer.write(this._outputBuffer, this._outputHead, flushLen);
                    }
                    char[] cArr = this._outputBuffer;
                    int i2 = this._outputTail;
                    this._outputTail = i2 + 1;
                    char c2 = cArr[i2];
                    _prependOrWriteCharacterEscape(c2, escCodes[c2]);
                }
            } while (i < end);
            return;
        }
    }

    private void _writeLongString(String text) throws IOException {
        _flushBuffer();
        int textLen = text.length();
        int offset = 0;
        do {
            int max = this._outputEnd;
            int segmentLen = offset + max > textLen ? textLen - offset : max;
            text.getChars(offset, offset + segmentLen, this._outputBuffer, 0);
            if (this._characterEscapes != null) {
                _writeSegmentCustom(segmentLen);
            } else if (this._maximumNonEscapedChar != 0) {
                _writeSegmentASCII(segmentLen, this._maximumNonEscapedChar);
            } else {
                _writeSegment(segmentLen);
            }
            offset += segmentLen;
        } while (offset < textLen);
    }

    private void _writeSegment(int end) throws IOException {
        char c;
        int[] escCodes = this._outputEscapes;
        int escLen = escCodes.length;
        int ptr = 0;
        int start = 0;
        while (ptr < end) {
            do {
                c = this._outputBuffer[ptr];
                if (c < escLen && escCodes[c] != 0) {
                    break;
                } else {
                    ptr++;
                }
            } while (ptr < end);
            int flushLen = ptr - start;
            if (flushLen > 0) {
                this._writer.write(this._outputBuffer, start, flushLen);
                if (ptr >= end) {
                    return;
                }
            }
            int ptr2 = ptr + 1;
            start = _prependOrWriteCharacterEscape(this._outputBuffer, ptr2, end, c, escCodes[c]);
            ptr = ptr2;
        }
    }

    private void _writeString(char[] text, int offset, int len) throws IOException {
        if (this._characterEscapes != null) {
            _writeStringCustom(text, offset, len);
            return;
        }
        if (this._maximumNonEscapedChar != 0) {
            _writeStringASCII(text, offset, len, this._maximumNonEscapedChar);
            return;
        }
        int len2 = len + offset;
        int[] escCodes = this._outputEscapes;
        int escLen = escCodes.length;
        while (offset < len2) {
            int start = offset;
            do {
                char c = text[offset];
                if (c < escLen && escCodes[c] != 0) {
                    break;
                } else {
                    offset++;
                }
            } while (offset < len2);
            int newAmount = offset - start;
            if (newAmount < 32) {
                if (this._outputTail + newAmount > this._outputEnd) {
                    _flushBuffer();
                }
                if (newAmount > 0) {
                    System.arraycopy(text, start, this._outputBuffer, this._outputTail, newAmount);
                    this._outputTail += newAmount;
                }
            } else {
                _flushBuffer();
                this._writer.write(text, start, newAmount);
            }
            if (offset < len2) {
                int offset2 = offset + 1;
                char c2 = text[offset];
                _appendCharacterEscape(c2, escCodes[c2]);
                offset = offset2;
            } else {
                return;
            }
        }
    }

    /* JADX WARN: região duplicada removida para o bloco: B:17:0x0029  */
    /* JADX WARN: região duplicada removida para o bloco: B:20:0x0032 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void _writeStringASCII(int r10, int r11) throws java.io.IOException, com.fasterxml.jackson.core.JsonGenerationException {
        /*
            r9 = this;
            int r0 = r9._outputTail
            int r0 = r0 + r10
            int[] r1 = r9._outputEscapes
            int r2 = r1.length
            int r3 = r11 + 1
            int r2 = java.lang.Math.min(r2, r3)
            r3 = 0
        Ld:
            int r4 = r9._outputTail
            if (r4 >= r0) goto L45
        L11:
            char[] r4 = r9._outputBuffer
            int r5 = r9._outputTail
            char r4 = r4[r5]
            if (r4 >= r2) goto L1e
            r3 = r1[r4]
            if (r3 == 0) goto L3c
            goto L22
        L1e:
            if (r4 <= r11) goto L3c
            r3 = -1
        L22:
            int r5 = r9._outputTail
            int r6 = r9._outputHead
            int r5 = r5 - r6
            if (r5 <= 0) goto L32
            java.io.Writer r6 = r9._writer
            char[] r7 = r9._outputBuffer
            int r8 = r9._outputHead
            r6.write(r7, r8, r5)
        L32:
            int r6 = r9._outputTail
            int r6 = r6 + 1
            r9._outputTail = r6
            r9._prependOrWriteCharacterEscape(r4, r3)
            goto Ld
        L3c:
            int r5 = r9._outputTail
            int r5 = r5 + 1
            r9._outputTail = r5
            if (r5 < r0) goto L11
        L45:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.WriterBasedJsonGenerator._writeStringASCII(int, int):void");
    }

    /* JADX WARN: região duplicada removida para o bloco: B:10:0x0023 A[SYNTHETIC] */
    /* JADX WARN: região duplicada removida para o bloco: B:9:0x0041 A[LOOP:1: B:3:0x000e->B:9:0x0041, LOOP_END] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void _writeSegmentASCII(int r13, int r14) throws java.io.IOException, com.fasterxml.jackson.core.JsonGenerationException {
        /*
            r12 = this;
            int[] r0 = r12._outputEscapes
            int r1 = r0.length
            int r2 = r14 + 1
            int r1 = java.lang.Math.min(r1, r2)
            r2 = 0
            r3 = 0
            r4 = r2
        Lc:
            if (r2 >= r13) goto L43
        Le:
            char[] r5 = r12._outputBuffer
            char r10 = r5[r2]
            if (r10 >= r1) goto L1a
            r3 = r0[r10]
            if (r3 == 0) goto L1f
            r11 = r3
            goto L24
        L1a:
            if (r10 <= r14) goto L1f
            r3 = -1
            r11 = r3
            goto L24
        L1f:
            int r2 = r2 + 1
            if (r2 < r13) goto L41
            r11 = r3
        L24:
            int r3 = r2 - r4
            if (r3 <= 0) goto L34
            java.io.Writer r5 = r12._writer
            char[] r6 = r12._outputBuffer
            r5.write(r6, r4, r3)
            if (r2 < r13) goto L34
            r9 = r13
            r3 = r11
            goto L44
        L34:
            int r8 = r2 + 1
            char[] r7 = r12._outputBuffer
            r6 = r12
            r9 = r13
            int r4 = r6._prependOrWriteCharacterEscape(r7, r8, r9, r10, r11)
            r2 = r8
            r3 = r11
            goto Lc
        L41:
            r9 = r13
            goto Le
        L43:
            r9 = r13
        L44:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.WriterBasedJsonGenerator._writeSegmentASCII(int, int):void");
    }

    /* JADX WARN: região duplicada removida para o bloco: B:10:0x0020 A[EDGE_INSN: B:10:0x0020->B:11:0x0020 BREAK  A[LOOP:1: B:4:0x000e->B:24:?], SYNTHETIC] */
    /* JADX WARN: região duplicada removida para o bloco: B:24:? A[LOOP:1: B:4:0x000e->B:24:?, LOOP_END, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void _writeStringASCII(char[] r9, int r10, int r11, int r12) throws java.io.IOException, com.fasterxml.jackson.core.JsonGenerationException {
        /*
            r8 = this;
            int r11 = r11 + r10
            int[] r0 = r8._outputEscapes
            int r1 = r0.length
            int r2 = r12 + 1
            int r1 = java.lang.Math.min(r1, r2)
            r2 = 0
        Lb:
            if (r10 >= r11) goto L50
            r3 = r10
        Le:
            char r4 = r9[r10]
            if (r4 >= r1) goto L17
            r2 = r0[r4]
            if (r2 == 0) goto L1b
            goto L20
        L17:
            if (r4 <= r12) goto L1b
            r2 = -1
            goto L20
        L1b:
            int r10 = r10 + 1
            if (r10 < r11) goto Le
        L20:
            int r5 = r10 - r3
            r6 = 32
            if (r5 >= r6) goto L3f
            int r6 = r8._outputTail
            int r6 = r6 + r5
            int r7 = r8._outputEnd
            if (r6 <= r7) goto L30
            r8._flushBuffer()
        L30:
            if (r5 <= 0) goto L47
            char[] r6 = r8._outputBuffer
            int r7 = r8._outputTail
            java.lang.System.arraycopy(r9, r3, r6, r7, r5)
            int r6 = r8._outputTail
            int r6 = r6 + r5
            r8._outputTail = r6
            goto L47
        L3f:
            r8._flushBuffer()
            java.io.Writer r6 = r8._writer
            r6.write(r9, r3, r5)
        L47:
            if (r10 < r11) goto L4a
            goto L50
        L4a:
            int r10 = r10 + 1
            r8._appendCharacterEscape(r4, r2)
            goto Lb
        L50:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.WriterBasedJsonGenerator._writeStringASCII(char[], int, int, int):void");
    }

    /* JADX WARN: região duplicada removida para o bloco: B:20:0x0040  */
    /* JADX WARN: região duplicada removida para o bloco: B:23:0x0049 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void _writeStringCustom(int r13) throws java.io.IOException, com.fasterxml.jackson.core.JsonGenerationException {
        /*
            r12 = this;
            int r0 = r12._outputTail
            int r0 = r0 + r13
            int[] r1 = r12._outputEscapes
            int r2 = r12._maximumNonEscapedChar
            r3 = 1
            if (r2 >= r3) goto Le
            r2 = 65535(0xffff, float:9.1834E-41)
            goto L10
        Le:
            int r2 = r12._maximumNonEscapedChar
        L10:
            int r4 = r1.length
            int r5 = r2 + 1
            int r4 = java.lang.Math.min(r4, r5)
            r5 = 0
            com.fasterxml.jackson.core.io.CharacterEscapes r6 = r12._characterEscapes
        L1a:
            int r7 = r12._outputTail
            if (r7 >= r0) goto L5a
        L1e:
            char[] r7 = r12._outputBuffer
            int r8 = r12._outputTail
            char r7 = r7[r8]
            if (r7 >= r4) goto L2b
            r5 = r1[r7]
            if (r5 == 0) goto L52
            goto L39
        L2b:
            if (r7 <= r2) goto L2f
            r5 = -1
            goto L39
        L2f:
            com.fasterxml.jackson.core.SerializableString r8 = r6.getEscapeSequence(r7)
            r12._currentEscape = r8
            if (r8 == 0) goto L52
            r5 = -2
        L39:
            int r8 = r12._outputTail
            int r9 = r12._outputHead
            int r8 = r8 - r9
            if (r8 <= 0) goto L49
            java.io.Writer r9 = r12._writer
            char[] r10 = r12._outputBuffer
            int r11 = r12._outputHead
            r9.write(r10, r11, r8)
        L49:
            int r9 = r12._outputTail
            int r9 = r9 + r3
            r12._outputTail = r9
            r12._prependOrWriteCharacterEscape(r7, r5)
            goto L1a
        L52:
            int r8 = r12._outputTail
            int r8 = r8 + r3
            r12._outputTail = r8
            if (r8 < r0) goto L1e
        L5a:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.WriterBasedJsonGenerator._writeStringCustom(int):void");
    }

    /* JADX WARN: região duplicada removida para o bloco: B:12:0x0059 A[LOOP:1: B:6:0x001b->B:12:0x0059, LOOP_END] */
    /* JADX WARN: região duplicada removida para o bloco: B:13:0x003b A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void _writeSegmentCustom(int r15) throws java.io.IOException, com.fasterxml.jackson.core.JsonGenerationException {
        /*
            r14 = this;
            int[] r0 = r14._outputEscapes
            int r1 = r14._maximumNonEscapedChar
            r2 = 1
            if (r1 >= r2) goto Lb
            r1 = 65535(0xffff, float:9.1834E-41)
            goto Ld
        Lb:
            int r1 = r14._maximumNonEscapedChar
        Ld:
            int r2 = r0.length
            int r3 = r1 + 1
            int r2 = java.lang.Math.min(r2, r3)
            com.fasterxml.jackson.core.io.CharacterEscapes r3 = r14._characterEscapes
            r4 = 0
            r5 = 0
            r6 = r4
        L19:
            if (r4 >= r15) goto L5b
        L1b:
            char[] r7 = r14._outputBuffer
            char r12 = r7[r4]
            if (r12 >= r2) goto L27
            r5 = r0[r12]
            if (r5 == 0) goto L37
            r13 = r5
            goto L3c
        L27:
            if (r12 <= r1) goto L2c
            r5 = -1
            r13 = r5
            goto L3c
        L2c:
            com.fasterxml.jackson.core.SerializableString r7 = r3.getEscapeSequence(r12)
            r14._currentEscape = r7
            if (r7 == 0) goto L37
            r5 = -2
            r13 = r5
            goto L3c
        L37:
            int r4 = r4 + 1
            if (r4 < r15) goto L59
            r13 = r5
        L3c:
            int r5 = r4 - r6
            if (r5 <= 0) goto L4c
            java.io.Writer r7 = r14._writer
            char[] r8 = r14._outputBuffer
            r7.write(r8, r6, r5)
            if (r4 < r15) goto L4c
            r11 = r15
            r5 = r13
            goto L5c
        L4c:
            int r10 = r4 + 1
            char[] r9 = r14._outputBuffer
            r8 = r14
            r11 = r15
            int r6 = r8._prependOrWriteCharacterEscape(r9, r10, r11, r12, r13)
            r4 = r10
            r5 = r13
            goto L19
        L59:
            r11 = r15
            goto L1b
        L5b:
            r11 = r15
        L5c:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.WriterBasedJsonGenerator._writeSegmentCustom(int):void");
    }

    /* JADX WARN: região duplicada removida para o bloco: B:13:0x0037 A[EDGE_INSN: B:13:0x0037->B:14:0x0037 BREAK  A[LOOP:1: B:7:0x001b->B:27:?], SYNTHETIC] */
    /* JADX WARN: região duplicada removida para o bloco: B:27:? A[LOOP:1: B:7:0x001b->B:27:?, LOOP_END, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void _writeStringCustom(char[] r11, int r12, int r13) throws java.io.IOException, com.fasterxml.jackson.core.JsonGenerationException {
        /*
            r10 = this;
            int r13 = r13 + r12
            int[] r0 = r10._outputEscapes
            int r1 = r10._maximumNonEscapedChar
            r2 = 1
            if (r1 >= r2) goto Lc
            r1 = 65535(0xffff, float:9.1834E-41)
            goto Le
        Lc:
            int r1 = r10._maximumNonEscapedChar
        Le:
            int r2 = r0.length
            int r3 = r1 + 1
            int r2 = java.lang.Math.min(r2, r3)
            com.fasterxml.jackson.core.io.CharacterEscapes r3 = r10._characterEscapes
            r4 = 0
        L18:
            if (r12 >= r13) goto L67
            r5 = r12
        L1b:
            char r6 = r11[r12]
            if (r6 >= r2) goto L24
            r4 = r0[r6]
            if (r4 == 0) goto L32
            goto L37
        L24:
            if (r6 <= r1) goto L28
            r4 = -1
            goto L37
        L28:
            com.fasterxml.jackson.core.SerializableString r7 = r3.getEscapeSequence(r6)
            r10._currentEscape = r7
            if (r7 == 0) goto L32
            r4 = -2
            goto L37
        L32:
            int r12 = r12 + 1
            if (r12 < r13) goto L1b
        L37:
            int r7 = r12 - r5
            r8 = 32
            if (r7 >= r8) goto L56
            int r8 = r10._outputTail
            int r8 = r8 + r7
            int r9 = r10._outputEnd
            if (r8 <= r9) goto L47
            r10._flushBuffer()
        L47:
            if (r7 <= 0) goto L5e
            char[] r8 = r10._outputBuffer
            int r9 = r10._outputTail
            java.lang.System.arraycopy(r11, r5, r8, r9, r7)
            int r8 = r10._outputTail
            int r8 = r8 + r7
            r10._outputTail = r8
            goto L5e
        L56:
            r10._flushBuffer()
            java.io.Writer r8 = r10._writer
            r8.write(r11, r5, r7)
        L5e:
            if (r12 < r13) goto L61
            goto L67
        L61:
            int r12 = r12 + 1
            r10._appendCharacterEscape(r6, r4)
            goto L18
        L67:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.WriterBasedJsonGenerator._writeStringCustom(char[], int, int):void");
    }

    protected final void _writeBinary(Base64Variant b64variant, byte[] input, int b24, int inputEnd) throws IOException, JsonGenerationException {
        int inputPtr;
        int safeInputEnd = inputEnd - 3;
        int safeOutputEnd = this._outputEnd - 6;
        int chunksBeforeLF = b64variant.getMaxLineLength() >> 2;
        while (b24 <= safeInputEnd) {
            if (this._outputTail > safeOutputEnd) {
                _flushBuffer();
            }
            int inputPtr2 = b24 + 1;
            int inputPtr3 = inputPtr2 + 1;
            int inputPtr4 = inputPtr3 + 1;
            this._outputTail = b64variant.encodeBase64Chunk((((input[b24] << 8) | (input[inputPtr2] & 255)) << 8) | (input[inputPtr3] & 255), this._outputBuffer, this._outputTail);
            chunksBeforeLF--;
            if (chunksBeforeLF <= 0) {
                char[] cArr = this._outputBuffer;
                int i = this._outputTail;
                this._outputTail = i + 1;
                cArr[i] = '\\';
                char[] cArr2 = this._outputBuffer;
                int i2 = this._outputTail;
                this._outputTail = i2 + 1;
                cArr2[i2] = 'n';
                chunksBeforeLF = b64variant.getMaxLineLength() >> 2;
            }
            b24 = inputPtr4;
        }
        int inputLeft = inputEnd - b24;
        if (inputLeft > 0) {
            if (this._outputTail > safeOutputEnd) {
                _flushBuffer();
            }
            int inputPtr5 = b24 + 1;
            int b242 = input[b24] << 16;
            if (inputLeft != 2) {
                inputPtr = inputPtr5;
            } else {
                inputPtr = inputPtr5 + 1;
                b242 |= (input[inputPtr5] & 255) << 8;
            }
            this._outputTail = b64variant.encodeBase64Partial(b242, inputLeft, this._outputBuffer, this._outputTail);
        }
    }

    protected final int _writeBinary(Base64Variant b64variant, InputStream data, byte[] readBuffer, int bytesLeft) throws IOException, JsonGenerationException {
        int inputEnd;
        int amount;
        int lastFullOffset = -3;
        int safeOutputEnd = this._outputEnd - 6;
        int chunksBeforeLF = b64variant.getMaxLineLength() >> 2;
        int bytesLeft2 = bytesLeft;
        int inputPtr = 0;
        int inputEnd2 = 0;
        while (bytesLeft2 > 2) {
            if (inputPtr > lastFullOffset) {
                inputEnd2 = _readMore(data, readBuffer, inputPtr, inputEnd2, bytesLeft2);
                inputPtr = 0;
                if (inputEnd2 < 3) {
                    break;
                }
                lastFullOffset = inputEnd2 - 3;
            }
            if (this._outputTail > safeOutputEnd) {
                _flushBuffer();
            }
            int inputPtr2 = inputPtr + 1;
            int b24 = readBuffer[inputPtr] << 8;
            int inputPtr3 = inputPtr2 + 1;
            inputPtr = inputPtr3 + 1;
            bytesLeft2 -= 3;
            this._outputTail = b64variant.encodeBase64Chunk((((readBuffer[inputPtr2] & 255) | b24) << 8) | (readBuffer[inputPtr3] & 255), this._outputBuffer, this._outputTail);
            chunksBeforeLF--;
            if (chunksBeforeLF <= 0) {
                char[] cArr = this._outputBuffer;
                int i = this._outputTail;
                this._outputTail = i + 1;
                cArr[i] = '\\';
                char[] cArr2 = this._outputBuffer;
                int i2 = this._outputTail;
                this._outputTail = i2 + 1;
                cArr2[i2] = 'n';
                chunksBeforeLF = b64variant.getMaxLineLength() >> 2;
            }
        }
        if (bytesLeft2 > 0 && (inputEnd = _readMore(data, readBuffer, inputPtr, inputEnd2, bytesLeft2)) > 0) {
            if (this._outputTail > safeOutputEnd) {
                _flushBuffer();
            }
            int inputPtr4 = 0 + 1;
            int b242 = readBuffer[0] << Ascii.DLE;
            if (inputPtr4 < inputEnd) {
                b242 |= (readBuffer[inputPtr4] & 255) << 8;
                amount = 2;
            } else {
                amount = 1;
            }
            this._outputTail = b64variant.encodeBase64Partial(b242, amount, this._outputBuffer, this._outputTail);
            return bytesLeft2 - amount;
        }
        return bytesLeft2;
    }

    protected final int _writeBinary(Base64Variant b64variant, InputStream data, byte[] readBuffer) throws IOException, JsonGenerationException {
        WriterBasedJsonGenerator writerBasedJsonGenerator;
        InputStream data2;
        byte[] readBuffer2;
        int inputEnd;
        int lastFullOffset = -3;
        int bytesDone = 0;
        int safeOutputEnd = this._outputEnd - 6;
        int chunksBeforeLF = b64variant.getMaxLineLength() >> 2;
        int inputPtr = 0;
        int inputEnd2 = 0;
        while (true) {
            if (inputPtr <= lastFullOffset) {
                writerBasedJsonGenerator = this;
                data2 = data;
                readBuffer2 = readBuffer;
            } else {
                writerBasedJsonGenerator = this;
                data2 = data;
                readBuffer2 = readBuffer;
                inputEnd = writerBasedJsonGenerator._readMore(data2, readBuffer2, inputPtr, inputEnd2, readBuffer.length);
                inputPtr = 0;
                if (inputEnd < 3) {
                    break;
                }
                inputEnd2 = inputEnd;
                lastFullOffset = inputEnd - 3;
            }
            if (writerBasedJsonGenerator._outputTail > safeOutputEnd) {
                _flushBuffer();
            }
            int inputPtr2 = inputPtr + 1;
            int b24 = readBuffer2[inputPtr] << 8;
            int inputPtr3 = inputPtr2 + 1;
            inputPtr = inputPtr3 + 1;
            bytesDone += 3;
            writerBasedJsonGenerator._outputTail = b64variant.encodeBase64Chunk((((readBuffer2[inputPtr2] & 255) | b24) << 8) | (readBuffer2[inputPtr3] & 255), writerBasedJsonGenerator._outputBuffer, writerBasedJsonGenerator._outputTail);
            chunksBeforeLF--;
            if (chunksBeforeLF <= 0) {
                char[] cArr = writerBasedJsonGenerator._outputBuffer;
                int i = writerBasedJsonGenerator._outputTail;
                writerBasedJsonGenerator._outputTail = i + 1;
                cArr[i] = '\\';
                char[] cArr2 = writerBasedJsonGenerator._outputBuffer;
                int i2 = writerBasedJsonGenerator._outputTail;
                writerBasedJsonGenerator._outputTail = i2 + 1;
                cArr2[i2] = 'n';
                chunksBeforeLF = b64variant.getMaxLineLength() >> 2;
            }
            data = data2;
            readBuffer = readBuffer2;
        }
        if (0 < inputEnd) {
            if (writerBasedJsonGenerator._outputTail > safeOutputEnd) {
                _flushBuffer();
            }
            int inputPtr4 = 0 + 1;
            int b242 = readBuffer2[0] << Ascii.DLE;
            int amount = 1;
            if (inputPtr4 < inputEnd) {
                b242 |= (readBuffer2[inputPtr4] & 255) << 8;
                amount = 2;
            }
            int bytesDone2 = bytesDone + amount;
            writerBasedJsonGenerator._outputTail = b64variant.encodeBase64Partial(b242, amount, writerBasedJsonGenerator._outputBuffer, writerBasedJsonGenerator._outputTail);
            return bytesDone2;
        }
        return bytesDone;
    }

    private int _readMore(InputStream in, byte[] readBuffer, int inputPtr, int inputEnd, int maxRead) throws IOException {
        int i = 0;
        while (inputPtr < inputEnd) {
            readBuffer[i] = readBuffer[inputPtr];
            i++;
            inputPtr++;
        }
        int inputEnd2 = i;
        int maxRead2 = Math.min(maxRead, readBuffer.length);
        do {
            int length = maxRead2 - inputEnd2;
            if (length == 0) {
                break;
            }
            int count = in.read(readBuffer, inputEnd2, length);
            if (count < 0) {
                return inputEnd2;
            }
            inputEnd2 += count;
        } while (inputEnd2 < 3);
        return inputEnd2;
    }

    private final void _writeNull() throws IOException {
        if (this._outputTail + 4 >= this._outputEnd) {
            _flushBuffer();
        }
        int ptr = this._outputTail;
        char[] buf = this._outputBuffer;
        buf[ptr] = 'n';
        int ptr2 = ptr + 1;
        buf[ptr2] = 'u';
        int ptr3 = ptr2 + 1;
        buf[ptr3] = 'l';
        int ptr4 = ptr3 + 1;
        buf[ptr4] = 'l';
        this._outputTail = ptr4 + 1;
    }

    private void _prependOrWriteCharacterEscape(char ch, int escCode) throws IOException, JsonGenerationException {
        String escape;
        int ptr;
        if (escCode >= 0) {
            if (this._outputTail >= 2) {
                int ptr2 = this._outputTail - 2;
                this._outputHead = ptr2;
                this._outputBuffer[ptr2] = '\\';
                this._outputBuffer[ptr2 + 1] = (char) escCode;
                return;
            }
            char[] buf = this._entityBuffer;
            if (buf == null) {
                buf = _allocateEntityBuffer();
            }
            this._outputHead = this._outputTail;
            buf[1] = (char) escCode;
            this._writer.write(buf, 0, 2);
            return;
        }
        if (escCode != -2) {
            if (this._outputTail >= 6) {
                char[] buf2 = this._outputBuffer;
                int ptr3 = this._outputTail - 6;
                this._outputHead = ptr3;
                buf2[ptr3] = '\\';
                int ptr4 = ptr3 + 1;
                buf2[ptr4] = 'u';
                if (ch > 255) {
                    int hi = (ch >> '\b') & 255;
                    int ptr5 = ptr4 + 1;
                    buf2[ptr5] = HEX_CHARS[hi >> 4];
                    ptr = ptr5 + 1;
                    buf2[ptr] = HEX_CHARS[hi & 15];
                    ch = (char) (ch & 255);
                } else {
                    int ptr6 = ptr4 + 1;
                    buf2[ptr6] = '0';
                    ptr = ptr6 + 1;
                    buf2[ptr] = '0';
                }
                int ptr7 = ptr + 1;
                buf2[ptr7] = HEX_CHARS[ch >> 4];
                buf2[ptr7 + 1] = HEX_CHARS[ch & 15];
                return;
            }
            char[] buf3 = this._entityBuffer;
            if (buf3 == null) {
                buf3 = _allocateEntityBuffer();
            }
            this._outputHead = this._outputTail;
            if (ch > 255) {
                int hi2 = (ch >> '\b') & 255;
                int lo = ch & 255;
                buf3[10] = HEX_CHARS[hi2 >> 4];
                buf3[11] = HEX_CHARS[hi2 & 15];
                buf3[12] = HEX_CHARS[lo >> 4];
                buf3[13] = HEX_CHARS[lo & 15];
                this._writer.write(buf3, 8, 6);
                return;
            }
            buf3[6] = HEX_CHARS[ch >> 4];
            buf3[7] = HEX_CHARS[ch & 15];
            this._writer.write(buf3, 2, 6);
            return;
        }
        if (this._currentEscape == null) {
            escape = this._characterEscapes.getEscapeSequence(ch).getValue();
        } else {
            escape = this._currentEscape.getValue();
            this._currentEscape = null;
        }
        int len = escape.length();
        if (this._outputTail >= len) {
            int ptr8 = this._outputTail - len;
            this._outputHead = ptr8;
            escape.getChars(0, len, this._outputBuffer, ptr8);
        } else {
            this._outputHead = this._outputTail;
            this._writer.write(escape);
        }
    }

    private int _prependOrWriteCharacterEscape(char[] buffer, int ptr, int end, char ch, int escCode) throws IOException, JsonGenerationException {
        String escape;
        int ptr2;
        if (escCode >= 0) {
            if (ptr > 1 && ptr < end) {
                int ptr3 = ptr - 2;
                buffer[ptr3] = '\\';
                buffer[ptr3 + 1] = (char) escCode;
                return ptr3;
            }
            char[] ent = this._entityBuffer;
            if (ent == null) {
                ent = _allocateEntityBuffer();
            }
            ent[1] = (char) escCode;
            this._writer.write(ent, 0, 2);
            return ptr;
        }
        if (escCode != -2) {
            if (ptr > 5 && ptr < end) {
                int ptr4 = ptr - 6;
                int ptr5 = ptr4 + 1;
                buffer[ptr4] = '\\';
                int ptr6 = ptr5 + 1;
                buffer[ptr5] = 'u';
                if (ch > 255) {
                    int hi = (ch >> '\b') & 255;
                    int ptr7 = ptr6 + 1;
                    buffer[ptr6] = HEX_CHARS[hi >> 4];
                    ptr2 = ptr7 + 1;
                    buffer[ptr7] = HEX_CHARS[hi & 15];
                    ch = (char) (ch & 255);
                } else {
                    int ptr8 = ptr6 + 1;
                    buffer[ptr6] = '0';
                    ptr2 = ptr8 + 1;
                    buffer[ptr8] = '0';
                }
                int ptr9 = ptr2 + 1;
                buffer[ptr2] = HEX_CHARS[ch >> 4];
                buffer[ptr9] = HEX_CHARS[ch & 15];
                return ptr9 - 5;
            }
            char[] ent2 = this._entityBuffer;
            if (ent2 == null) {
                ent2 = _allocateEntityBuffer();
            }
            this._outputHead = this._outputTail;
            if (ch <= 255) {
                ent2[6] = HEX_CHARS[ch >> 4];
                ent2[7] = HEX_CHARS[ch & 15];
                this._writer.write(ent2, 2, 6);
                return ptr;
            }
            int hi2 = (ch >> '\b') & 255;
            int lo = ch & 255;
            ent2[10] = HEX_CHARS[hi2 >> 4];
            ent2[11] = HEX_CHARS[hi2 & 15];
            ent2[12] = HEX_CHARS[lo >> 4];
            ent2[13] = HEX_CHARS[lo & 15];
            this._writer.write(ent2, 8, 6);
            return ptr;
        }
        if (this._currentEscape == null) {
            escape = this._characterEscapes.getEscapeSequence(ch).getValue();
        } else {
            escape = this._currentEscape.getValue();
            this._currentEscape = null;
        }
        int len = escape.length();
        if (ptr >= len && ptr < end) {
            int ptr10 = ptr - len;
            escape.getChars(0, len, buffer, ptr10);
            return ptr10;
        }
        this._writer.write(escape);
        return ptr;
    }

    private void _appendCharacterEscape(char ch, int escCode) throws IOException, JsonGenerationException {
        String escape;
        int ptr;
        if (escCode >= 0) {
            if (this._outputTail + 2 > this._outputEnd) {
                _flushBuffer();
            }
            char[] cArr = this._outputBuffer;
            int i = this._outputTail;
            this._outputTail = i + 1;
            cArr[i] = '\\';
            char[] cArr2 = this._outputBuffer;
            int i2 = this._outputTail;
            this._outputTail = i2 + 1;
            cArr2[i2] = (char) escCode;
            return;
        }
        if (escCode != -2) {
            if (this._outputTail + 5 >= this._outputEnd) {
                _flushBuffer();
            }
            int ptr2 = this._outputTail;
            char[] buf = this._outputBuffer;
            int ptr3 = ptr2 + 1;
            buf[ptr2] = '\\';
            int ptr4 = ptr3 + 1;
            buf[ptr3] = 'u';
            if (ch > 255) {
                int hi = 255 & (ch >> '\b');
                int ptr5 = ptr4 + 1;
                buf[ptr4] = HEX_CHARS[hi >> 4];
                ptr = ptr5 + 1;
                buf[ptr5] = HEX_CHARS[hi & 15];
                ch = (char) (ch & 255);
            } else {
                int ptr6 = ptr4 + 1;
                buf[ptr4] = '0';
                ptr = ptr6 + 1;
                buf[ptr6] = '0';
            }
            int ptr7 = ptr + 1;
            buf[ptr] = HEX_CHARS[ch >> 4];
            buf[ptr7] = HEX_CHARS[ch & 15];
            this._outputTail = ptr7 + 1;
            return;
        }
        if (this._currentEscape == null) {
            escape = this._characterEscapes.getEscapeSequence(ch).getValue();
        } else {
            escape = this._currentEscape.getValue();
            this._currentEscape = null;
        }
        int len = escape.length();
        if (this._outputTail + len > this._outputEnd) {
            _flushBuffer();
            if (len > this._outputEnd) {
                this._writer.write(escape);
                return;
            }
        }
        escape.getChars(0, len, this._outputBuffer, this._outputTail);
        this._outputTail += len;
    }

    private char[] _allocateEntityBuffer() {
        char[] buf = {'\\', 0, '\\', 'u', '0', '0', 0, 0, '\\', 'u', 0, 0, 0, 0};
        this._entityBuffer = buf;
        return buf;
    }

    private char[] _allocateCopyBuffer() {
        if (this._charBuffer == null) {
            this._charBuffer = this._ioContext.allocNameCopyBuffer(CredentialOption.PRIORITY_DEFAULT);
        }
        return this._charBuffer;
    }

    protected void _flushBuffer() throws IOException {
        int len = this._outputTail - this._outputHead;
        if (len > 0) {
            int offset = this._outputHead;
            this._outputHead = 0;
            this._outputTail = 0;
            this._writer.write(this._outputBuffer, offset, len);
        }
    }
}
