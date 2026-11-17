package com.fasterxml.jackson.core.io;

import com.fasterxml.jackson.core.util.BufferRecycler;
import com.fasterxml.jackson.core.util.BufferRecyclers;
import com.fasterxml.jackson.core.util.ByteArrayBuilder;
import com.fasterxml.jackson.core.util.TextBuffer;

/* loaded from: classes.dex */
public final class JsonStringEncoder {
    private static final int SURR1_FIRST = 55296;
    private static final int SURR1_LAST = 56319;
    private static final int SURR2_FIRST = 56320;
    private static final int SURR2_LAST = 57343;
    protected ByteArrayBuilder _bytes;
    protected final char[] _qbuf = new char[6];
    protected TextBuffer _text;
    private static final char[] HC = CharTypes.copyHexChars();
    private static final byte[] HB = CharTypes.copyHexBytes();

    public JsonStringEncoder() {
        this._qbuf[0] = '\\';
        this._qbuf[2] = '0';
        this._qbuf[3] = '0';
    }

    @Deprecated
    public static JsonStringEncoder getInstance() {
        return BufferRecyclers.getJsonStringEncoder();
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0029, code lost:
    
        r7 = r4 + 1;
        r4 = r15.charAt(r4);
        r8 = r2[r4];
        r9 = r14._qbuf;
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0033, code lost:
    
        if (r8 >= 0) goto L14;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x0035, code lost:
    
        r9 = _appendNumeric(r4, r9);
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x0042, code lost:
    
        if ((r6 + r9) <= r1.length) goto L21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0044, code lost:
    
        r10 = r1.length - r6;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0046, code lost:
    
        if (r10 <= 0) goto L20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0048, code lost:
    
        java.lang.System.arraycopy(r14._qbuf, 0, r1, r6, r10);
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x004d, code lost:
    
        r1 = r0.finishCurrentSegment();
        r11 = r9 - r10;
        java.lang.System.arraycopy(r14._qbuf, r10, r1, 0, r11);
        r6 = r11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x005b, code lost:
    
        java.lang.System.arraycopy(r14._qbuf, 0, r1, r6, r9);
        r6 = r6 + r9;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x003a, code lost:
    
        r9 = _appendNamed(r8, r9);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public char[] quoteAsString(java.lang.String r15) {
        /*
            r14 = this;
            com.fasterxml.jackson.core.util.TextBuffer r0 = r14._text
            if (r0 != 0) goto Ld
            com.fasterxml.jackson.core.util.TextBuffer r1 = new com.fasterxml.jackson.core.util.TextBuffer
            r2 = 0
            r1.<init>(r2)
            r0 = r1
            r14._text = r1
        Ld:
            char[] r1 = r0.emptyAndGetCurrentSegment()
            int[] r2 = com.fasterxml.jackson.core.io.CharTypes.get7BitOutputEscapes()
            int r3 = r2.length
            r4 = 0
            int r5 = r15.length()
            r6 = 0
        L1c:
            if (r4 >= r5) goto L77
        L1e:
            char r7 = r15.charAt(r4)
            if (r7 >= r3) goto L63
            r8 = r2[r7]
            if (r8 == 0) goto L63
        L29:
            int r7 = r4 + 1
            char r4 = r15.charAt(r4)
            r8 = r2[r4]
            char[] r9 = r14._qbuf
            if (r8 >= 0) goto L3a
            int r9 = r14._appendNumeric(r4, r9)
            goto L3e
        L3a:
            int r9 = r14._appendNamed(r8, r9)
        L3e:
            int r10 = r6 + r9
            int r11 = r1.length
            r12 = 0
            if (r10 <= r11) goto L5b
            int r10 = r1.length
            int r10 = r10 - r6
            if (r10 <= 0) goto L4d
            char[] r11 = r14._qbuf
            java.lang.System.arraycopy(r11, r12, r1, r6, r10)
        L4d:
            char[] r1 = r0.finishCurrentSegment()
            int r11 = r9 - r10
            char[] r13 = r14._qbuf
            java.lang.System.arraycopy(r13, r10, r1, r12, r11)
            r6 = r11
            goto L61
        L5b:
            char[] r10 = r14._qbuf
            java.lang.System.arraycopy(r10, r12, r1, r6, r9)
            int r6 = r6 + r9
        L61:
            r4 = r7
            goto L1c
        L63:
            int r8 = r1.length
            if (r6 < r8) goto L6b
            char[] r1 = r0.finishCurrentSegment()
            r6 = 0
        L6b:
            int r8 = r6 + 1
            r1[r6] = r7
            int r4 = r4 + 1
            if (r4 < r5) goto L75
            r6 = r8
            goto L77
        L75:
            r6 = r8
            goto L1e
        L77:
            r0.setCurrentLength(r6)
            char[] r7 = r0.contentsAsArray()
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.io.JsonStringEncoder.quoteAsString(java.lang.String):char[]");
    }

    public void quoteAsString(CharSequence input, StringBuilder output) {
        int[] escCodes = CharTypes.get7BitOutputEscapes();
        int escCodeCount = escCodes.length;
        int inPtr = 0;
        int inputLen = input.length();
        while (inPtr < inputLen) {
            do {
                char c = input.charAt(inPtr);
                if (c >= escCodeCount || escCodes[c] == 0) {
                    output.append(c);
                    inPtr++;
                } else {
                    int inPtr2 = inPtr + 1;
                    char d = input.charAt(inPtr);
                    int escCode = escCodes[d];
                    char[] cArr = this._qbuf;
                    int length = escCode < 0 ? _appendNumeric(d, cArr) : _appendNamed(escCode, cArr);
                    output.append(this._qbuf, 0, length);
                    inPtr = inPtr2;
                }
            } while (inPtr < inputLen);
            return;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x0041, code lost:
    
        if (r3 < r4.length) goto L23;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0043, code lost:
    
        r4 = r0.finishCurrentSegment();
        r3 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x0048, code lost:
    
        r6 = r1 + 1;
        r1 = r10.charAt(r1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x004e, code lost:
    
        if (r1 > 127) goto L59;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x005e, code lost:
    
        if (r1 > 2047) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x0060, code lost:
    
        r7 = r3 + 1;
        r4[r3] = (byte) ((r1 >> 6) | 192);
        r3 = (r1 & 63) | 128;
        r1 = r6;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x00f5, code lost:
    
        r6 = r4.length;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x00f6, code lost:
    
        if (r7 < r6) goto L56;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x00f8, code lost:
    
        r4 = r0.finishCurrentSegment();
        r7 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x00fd, code lost:
    
        r4[r7] = (byte) r3;
        r3 = r7 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x0074, code lost:
    
        if (r1 < 55296) goto L49;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x0079, code lost:
    
        if (r1 <= 57343) goto L34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x007f, code lost:
    
        if (r1 <= 56319) goto L37;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x0081, code lost:
    
        _illegal(r1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x0084, code lost:
    
        if (r6 < r2) goto L39;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x0086, code lost:
    
        _illegal(r1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x0089, code lost:
    
        r7 = r6 + 1;
        r1 = _convert(r1, r10.charAt(r6));
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x0096, code lost:
    
        if (r1 <= 1114111) goto L42;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x0098, code lost:
    
        _illegal(r1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x009b, code lost:
    
        r6 = r3 + 1;
        r4[r3] = (byte) ((r1 >> 18) | 240);
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x00a5, code lost:
    
        if (r6 < r4.length) goto L45;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x00a7, code lost:
    
        r4 = r0.finishCurrentSegment();
        r6 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x00ac, code lost:
    
        r3 = r6 + 1;
        r4[r6] = (byte) (((r1 >> 12) & 63) | 128);
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x00b8, code lost:
    
        if (r3 < r4.length) goto L48;
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x00ba, code lost:
    
        r4 = r0.finishCurrentSegment();
        r3 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x00bf, code lost:
    
        r6 = r3 + 1;
        r4[r3] = (byte) (((r1 >> 6) & 63) | 128);
        r3 = (r1 & 63) | 128;
        r1 = r7;
        r7 = r6;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x00d2, code lost:
    
        r7 = r3 + 1;
        r4[r3] = (byte) ((r1 >> 12) | 224);
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x00dc, code lost:
    
        if (r7 < r4.length) goto L52;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x00de, code lost:
    
        r4 = r0.finishCurrentSegment();
        r7 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x00e3, code lost:
    
        r4[r7] = (byte) (((r1 >> 6) & 63) | 128);
        r7 = r7 + 1;
        r3 = (r1 & 63) | 128;
        r1 = r6;
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x0050, code lost:
    
        r7 = r5[r1];
        r3 = _appendByte(r1, r7, r0, r3);
        r4 = r0.getCurrentSegment();
        r1 = r6;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public byte[] quoteAsUTF8(java.lang.String r10) {
        /*
            Method dump skipped, instructions count: 268
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.io.JsonStringEncoder.quoteAsUTF8(java.lang.String):byte[]");
    }

    public byte[] encodeAsUTF8(String text) {
        int outputPtr;
        int outputPtr2;
        ByteArrayBuilder byteBuilder = this._bytes;
        if (byteBuilder == null) {
            ByteArrayBuilder byteArrayBuilder = new ByteArrayBuilder((BufferRecycler) null);
            byteBuilder = byteArrayBuilder;
            this._bytes = byteArrayBuilder;
        }
        int c = 0;
        int inputEnd = text.length();
        int outputPtr3 = 0;
        byte[] outputBuffer = byteBuilder.resetAndGetFirstSegment();
        int outputEnd = outputBuffer.length;
        loop0: while (true) {
            if (c >= inputEnd) {
                break;
            }
            int inputPtr = c + 1;
            int c2 = text.charAt(c);
            while (c2 <= 127) {
                if (outputPtr3 >= outputEnd) {
                    outputBuffer = byteBuilder.finishCurrentSegment();
                    outputEnd = outputBuffer.length;
                    outputPtr3 = 0;
                }
                int outputPtr4 = outputPtr3 + 1;
                outputBuffer[outputPtr3] = (byte) c2;
                if (inputPtr >= inputEnd) {
                    outputPtr3 = outputPtr4;
                    break loop0;
                }
                c2 = text.charAt(inputPtr);
                inputPtr++;
                outputPtr3 = outputPtr4;
            }
            if (outputPtr3 >= outputEnd) {
                outputBuffer = byteBuilder.finishCurrentSegment();
                outputEnd = outputBuffer.length;
                outputPtr3 = 0;
            }
            if (c2 < 2048) {
                outputPtr = outputPtr3 + 1;
                outputBuffer[outputPtr3] = (byte) ((c2 >> 6) | 192);
                outputPtr2 = c2;
                c = inputPtr;
            } else if (c2 < 55296 || c2 > 57343) {
                int outputPtr5 = outputPtr3 + 1;
                outputBuffer[outputPtr3] = (byte) ((c2 >> 12) | 224);
                if (outputPtr5 >= outputEnd) {
                    outputBuffer = byteBuilder.finishCurrentSegment();
                    outputEnd = outputBuffer.length;
                    outputPtr5 = 0;
                }
                outputBuffer[outputPtr5] = (byte) (((c2 >> 6) & 63) | 128);
                outputPtr = outputPtr5 + 1;
                outputPtr2 = c2;
                c = inputPtr;
            } else {
                if (c2 > 56319) {
                    _illegal(c2);
                }
                if (inputPtr >= inputEnd) {
                    _illegal(c2);
                }
                int inputPtr2 = inputPtr + 1;
                int c3 = _convert(c2, text.charAt(inputPtr));
                if (c3 > 1114111) {
                    _illegal(c3);
                }
                int outputPtr6 = outputPtr3 + 1;
                outputBuffer[outputPtr3] = (byte) ((c3 >> 18) | 240);
                if (outputPtr6 >= outputEnd) {
                    outputBuffer = byteBuilder.finishCurrentSegment();
                    outputEnd = outputBuffer.length;
                    outputPtr6 = 0;
                }
                int outputPtr7 = outputPtr6 + 1;
                outputBuffer[outputPtr6] = (byte) (((c3 >> 12) & 63) | 128);
                if (outputPtr7 >= outputEnd) {
                    outputBuffer = byteBuilder.finishCurrentSegment();
                    outputEnd = outputBuffer.length;
                    outputPtr7 = 0;
                }
                int outputPtr8 = outputPtr7 + 1;
                outputBuffer[outputPtr7] = (byte) (((c3 >> 6) & 63) | 128);
                outputPtr2 = c3;
                c = inputPtr2;
                outputPtr = outputPtr8;
            }
            if (outputPtr >= outputEnd) {
                outputBuffer = byteBuilder.finishCurrentSegment();
                outputEnd = outputBuffer.length;
                outputPtr = 0;
            }
            outputBuffer[outputPtr] = (byte) ((outputPtr2 & 63) | 128);
            outputPtr3 = outputPtr + 1;
        }
        return this._bytes.completeAndCoalesce(outputPtr3);
    }

    private int _appendNumeric(int value, char[] qbuf) {
        qbuf[1] = 'u';
        qbuf[4] = HC[value >> 4];
        qbuf[5] = HC[value & 15];
        return 6;
    }

    private int _appendNamed(int esc, char[] qbuf) {
        qbuf[1] = (char) esc;
        return 2;
    }

    private int _appendByte(int ch, int esc, ByteArrayBuilder bb, int ptr) {
        bb.setCurrentSegmentLength(ptr);
        bb.append(92);
        if (esc < 0) {
            bb.append(117);
            if (ch > 255) {
                int hi = ch >> 8;
                bb.append(HB[hi >> 4]);
                bb.append(HB[hi & 15]);
                ch &= 255;
            } else {
                bb.append(48);
                bb.append(48);
            }
            bb.append(HB[ch >> 4]);
            bb.append(HB[ch & 15]);
        } else {
            bb.append((byte) esc);
        }
        return bb.getCurrentSegmentLength();
    }

    private static int _convert(int p1, int p2) {
        if (p2 >= 56320 && p2 <= 57343) {
            return ((p1 - 55296) << 10) + 65536 + (p2 - 56320);
        }
        throw new IllegalArgumentException("Broken surrogate pair: first char 0x" + Integer.toHexString(p1) + ", second 0x" + Integer.toHexString(p2) + "; illegal combination");
    }

    private static void _illegal(int c) {
        throw new IllegalArgumentException(UTF8Writer.illegalSurrogateDesc(c));
    }
}
