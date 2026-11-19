package j$.sun.nio.cs;

import j$.sun.nio.cs.Surrogate;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CoderResult;
import java.util.Arrays;

/* carregado de: classes15.dex */
public class DoubleByte {
    public static final char[] B2C_UNMAPPABLE = new char[256];

    static {
        Arrays.fill(B2C_UNMAPPABLE, CharsetMapping.UNMAPPABLE_DECODING);
    }

    public static class Decoder extends CharsetDecoder implements DelegatableDecoder, ArrayDecoder {
        final int b2Max;
        final int b2Min;
        final char[][] b2c;
        final char[] b2cSB;
        final boolean isASCIICompatible;

        protected CoderResult crMalformedOrUnderFlow(int b) {
            return CoderResult.UNDERFLOW;
        }

        protected CoderResult crMalformedOrUnmappable(int b1, int b2) {
            if (this.b2c[b1] == DoubleByte.B2C_UNMAPPABLE || this.b2c[b2] != DoubleByte.B2C_UNMAPPABLE || decodeSingle(b2) != 65533) {
                return CoderResult.malformedForLength(1);
            }
            return CoderResult.unmappableForLength(2);
        }

        public Decoder(Charset cs, float avgcpb, float maxcpb, char[][] b2c, char[] b2cSB, int b2Min, int b2Max, boolean isASCIICompatible) {
            super(cs, avgcpb, maxcpb);
            this.b2c = b2c;
            this.b2cSB = b2cSB;
            this.b2Min = b2Min;
            this.b2Max = b2Max;
            this.isASCIICompatible = isASCIICompatible;
        }

        public Decoder(Charset cs, char[][] b2c, char[] b2cSB, int b2Min, int b2Max, boolean isASCIICompatible) {
            this(cs, 0.5f, 1.0f, b2c, b2cSB, b2Min, b2Max, isASCIICompatible);
        }

        public Decoder(Charset cs, char[][] b2c, char[] b2cSB, int b2Min, int b2Max) {
            this(cs, 0.5f, 1.0f, b2c, b2cSB, b2Min, b2Max, false);
        }

        protected CoderResult decodeArrayLoop(ByteBuffer src, CharBuffer dst) {
            byte[] sa = src.array();
            int sp = src.arrayOffset() + src.position();
            int sl = src.arrayOffset() + src.limit();
            char[] da = dst.array();
            int dp = dst.arrayOffset() + dst.position();
            int dl = dst.arrayOffset() + dst.limit();
            while (sp < sl && dp < dl) {
                int inSize = 1;
                try {
                    int b1 = sa[sp] & 255;
                    char c = this.b2cSB[b1];
                    if (c == 65533) {
                        if (sl - sp < 2) {
                            CoderResult crMalformedOrUnderFlow = crMalformedOrUnderFlow(b1);
                            return crMalformedOrUnderFlow;
                        }
                        int b2 = sa[sp + 1] & 255;
                        if (b2 >= this.b2Min && b2 <= this.b2Max) {
                            char c2 = this.b2c[b1][b2 - this.b2Min];
                            c = c2;
                            if (c2 != 65533) {
                                inSize = 1 + 1;
                            }
                        }
                        CoderResult crMalformedOrUnmappable = crMalformedOrUnmappable(b1, b2);
                        return crMalformedOrUnmappable;
                    }
                    int dp2 = dp + 1;
                    try {
                        da[dp] = c;
                        sp += inSize;
                        dp = dp2;
                    } catch (Throwable th) {
                        th = th;
                        dp = dp2;
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                }
            }
            CoderResult coderResult = sp >= sl ? CoderResult.UNDERFLOW : CoderResult.OVERFLOW;
            return coderResult;
        }

        protected CoderResult decodeBufferLoop(ByteBuffer src, CharBuffer dst) {
            int mark = src.position();
            while (src.hasRemaining() && dst.hasRemaining()) {
                try {
                    int b1 = src.get() & 255;
                    char c = this.b2cSB[b1];
                    int inSize = 1;
                    if (c == 65533) {
                        if (src.remaining() < 1) {
                            return crMalformedOrUnderFlow(b1);
                        }
                        int b2 = src.get() & 255;
                        if (b2 >= this.b2Min && b2 <= this.b2Max) {
                            char c2 = this.b2c[b1][b2 - this.b2Min];
                            c = c2;
                            if (c2 != 65533) {
                                inSize = 1 + 1;
                            }
                        }
                        return crMalformedOrUnmappable(b1, b2);
                    }
                    dst.put(c);
                    mark += inSize;
                } finally {
                }
            }
            return src.hasRemaining() ? CoderResult.OVERFLOW : CoderResult.UNDERFLOW;
        }

        @Override // java.nio.charset.CharsetDecoder, j$.sun.nio.cs.DelegatableDecoder
        public CoderResult decodeLoop(ByteBuffer src, CharBuffer dst) {
            if (src.hasArray() && dst.hasArray()) {
                return decodeArrayLoop(src, dst);
            }
            return decodeBufferLoop(src, dst);
        }

        @Override // j$.sun.nio.cs.ArrayDecoder
        public int decode(byte[] src, int b1, int len, char[] dst) {
            int dp = 0;
            int sl = b1 + len;
            char repl = replacement().charAt(0);
            while (b1 < sl) {
                int b2 = b1 + 1;
                int b12 = src[b1] & 255;
                char c = this.b2cSB[b12];
                if (c == 65533) {
                    if (b2 < sl) {
                        int sp = b2 + 1;
                        int b22 = src[b2] & 255;
                        if (b22 >= this.b2Min && b22 <= this.b2Max) {
                            char c2 = this.b2c[b12][b22 - this.b2Min];
                            c = c2;
                            if (c2 != 65533) {
                                b2 = sp;
                            }
                        }
                        if (crMalformedOrUnmappable(b12, b22).length() != 1) {
                            b2 = sp;
                        } else {
                            b2 = sp - 1;
                        }
                    }
                    if (c == 65533) {
                        c = repl;
                    }
                }
                dst[dp] = c;
                b1 = b2;
                dp++;
            }
            return dp;
        }

        @Override // j$.sun.nio.cs.ArrayDecoder
        public boolean isASCIICompatible() {
            return this.isASCIICompatible;
        }

        @Override // java.nio.charset.CharsetDecoder, j$.sun.nio.cs.DelegatableDecoder
        public void implReset() {
            super.implReset();
        }

        @Override // java.nio.charset.CharsetDecoder, j$.sun.nio.cs.DelegatableDecoder
        public CoderResult implFlush(CharBuffer out) {
            return super.implFlush(out);
        }

        public char decodeSingle(int b) {
            return this.b2cSB[b];
        }

        public char decodeDouble(int b1, int b2) {
            if (b1 < 0 || b1 > this.b2c.length || b2 < this.b2Min || b2 > this.b2Max) {
                return CharsetMapping.UNMAPPABLE_DECODING;
            }
            return this.b2c[b1][b2 - this.b2Min];
        }
    }

    public static class Decoder_EBCDIC extends Decoder {
        private static final int DBCS = 1;
        private static final int SBCS = 0;
        private static final int SI = 15;
        private static final int SO = 14;
        private int currentState;

        public Decoder_EBCDIC(Charset cs, char[][] b2c, char[] b2cSB, int b2Min, int b2Max, boolean isASCIICompatible) {
            super(cs, b2c, b2cSB, b2Min, b2Max, isASCIICompatible);
        }

        public Decoder_EBCDIC(Charset cs, char[][] b2c, char[] b2cSB, int b2Min, int b2Max) {
            super(cs, b2c, b2cSB, b2Min, b2Max, false);
        }

        @Override // j$.sun.nio.cs.DoubleByte.Decoder, java.nio.charset.CharsetDecoder, j$.sun.nio.cs.DelegatableDecoder
        public void implReset() {
            this.currentState = 0;
        }

        private static boolean isDoubleByte(int b1, int b2) {
            return (65 <= b1 && b1 <= 254 && 65 <= b2 && b2 <= 254) || (b1 == 64 && b2 == 64);
        }

        @Override // j$.sun.nio.cs.DoubleByte.Decoder
        protected CoderResult decodeArrayLoop(ByteBuffer src, CharBuffer dst) {
            char c;
            char c2;
            byte[] sa = src.array();
            int sp = src.arrayOffset() + src.position();
            int sl = src.arrayOffset() + src.limit();
            char[] da = dst.array();
            int dp = dst.arrayOffset() + dst.position();
            int dl = dst.arrayOffset() + dst.limit();
            int dp2 = dp;
            int dp3 = sp;
            while (dp3 < sl) {
                try {
                    int b1 = sa[dp3] & 255;
                    int inSize = 1;
                    if (b1 == 14) {
                        if (this.currentState != 0) {
                            CoderResult malformedForLength = CoderResult.malformedForLength(1);
                            return malformedForLength;
                        }
                        this.currentState = 1;
                    } else if (b1 != 15) {
                        if (this.currentState == 0) {
                            c2 = this.b2cSB[b1];
                            if (c2 == 65533) {
                                CoderResult unmappableForLength = CoderResult.unmappableForLength(1);
                                return unmappableForLength;
                            }
                        } else {
                            if (sl - dp3 < 2) {
                                CoderResult coderResult = CoderResult.UNDERFLOW;
                                return coderResult;
                            }
                            int b2 = sa[dp3 + 1] & 255;
                            if (b2 < this.b2Min || b2 > this.b2Max || (c = this.b2c[b1][b2 - this.b2Min]) == 65533) {
                                if (isDoubleByte(b1, b2)) {
                                    CoderResult unmappableForLength2 = CoderResult.unmappableForLength(2);
                                    return unmappableForLength2;
                                }
                                CoderResult malformedForLength2 = CoderResult.malformedForLength(2);
                                return malformedForLength2;
                            }
                            inSize = 1 + 1;
                            c2 = c;
                        }
                        if (dl - dp2 < 1) {
                            CoderResult coderResult2 = CoderResult.OVERFLOW;
                            return coderResult2;
                        }
                        int dp4 = dp2 + 1;
                        try {
                            da[dp2] = c2;
                            dp2 = dp4;
                        } catch (Throwable th) {
                            th = th;
                            dp2 = dp4;
                            throw th;
                        }
                    } else {
                        if (this.currentState != 1) {
                            CoderResult malformedForLength3 = CoderResult.malformedForLength(1);
                            return malformedForLength3;
                        }
                        this.currentState = 0;
                    }
                    dp3 += inSize;
                } catch (Throwable th2) {
                    th = th2;
                }
            }
            CoderResult coderResult3 = CoderResult.UNDERFLOW;
            return coderResult3;
        }

        @Override // j$.sun.nio.cs.DoubleByte.Decoder
        protected CoderResult decodeBufferLoop(ByteBuffer src, CharBuffer dst) {
            char c;
            char c2;
            int mark = src.position();
            while (src.hasRemaining()) {
                try {
                    int b1 = src.get() & 255;
                    int inSize = 1;
                    if (b1 == 14) {
                        if (this.currentState != 0) {
                            return CoderResult.malformedForLength(1);
                        }
                        this.currentState = 1;
                    } else if (b1 != 15) {
                        if (this.currentState == 0) {
                            c2 = this.b2cSB[b1];
                            if (c2 == 65533) {
                                return CoderResult.unmappableForLength(1);
                            }
                        } else {
                            if (src.remaining() < 1) {
                                return CoderResult.UNDERFLOW;
                            }
                            int b2 = src.get() & 255;
                            if (b2 < this.b2Min || b2 > this.b2Max || (c = this.b2c[b1][b2 - this.b2Min]) == 65533) {
                                return !isDoubleByte(b1, b2) ? CoderResult.malformedForLength(2) : CoderResult.unmappableForLength(2);
                            }
                            inSize = 1 + 1;
                            c2 = c;
                        }
                        if (dst.remaining() < 1) {
                            return CoderResult.OVERFLOW;
                        }
                        dst.put(c2);
                    } else {
                        if (this.currentState != 1) {
                            return CoderResult.malformedForLength(1);
                        }
                        this.currentState = 0;
                    }
                    mark += inSize;
                } finally {
                }
            }
            return CoderResult.UNDERFLOW;
        }

        @Override // j$.sun.nio.cs.DoubleByte.Decoder, j$.sun.nio.cs.ArrayDecoder
        public int decode(byte[] src, int b1, int len, char[] dst) {
            char c;
            int dp = 0;
            int sl = b1 + len;
            this.currentState = 0;
            char repl = replacement().charAt(0);
            while (b1 < sl) {
                int sp = b1 + 1;
                int b12 = src[b1] & 255;
                if (b12 == 14) {
                    if (this.currentState != 0) {
                        dst[dp] = repl;
                        b1 = sp;
                        dp++;
                    } else {
                        this.currentState = 1;
                        b1 = sp;
                    }
                } else if (b12 == 15) {
                    if (this.currentState != 1) {
                        dst[dp] = repl;
                        b1 = sp;
                        dp++;
                    } else {
                        this.currentState = 0;
                        b1 = sp;
                    }
                } else {
                    if (this.currentState == 0) {
                        c = this.b2cSB[b12];
                        if (c == 65533) {
                            c = repl;
                        }
                    } else if (sl == sp) {
                        c = repl;
                    } else {
                        int sp2 = sp + 1;
                        int b2 = src[sp] & 255;
                        if (b2 >= this.b2Min && b2 <= this.b2Max) {
                            char c2 = this.b2c[b12][b2 - this.b2Min];
                            c = c2;
                            if (c2 != 65533) {
                                sp = sp2;
                            }
                        }
                        c = repl;
                        sp = sp2;
                    }
                    dst[dp] = c;
                    b1 = sp;
                    dp++;
                }
            }
            return dp;
        }
    }

    public static class Decoder_DBCSONLY extends Decoder {
        static final char[] b2cSB_UNMAPPABLE = new char[256];

        static {
            Arrays.fill(b2cSB_UNMAPPABLE, CharsetMapping.UNMAPPABLE_DECODING);
        }

        @Override // j$.sun.nio.cs.DoubleByte.Decoder
        protected CoderResult crMalformedOrUnmappable(int b1, int b2) {
            return CoderResult.unmappableForLength(2);
        }

        public Decoder_DBCSONLY(Charset cs, char[][] b2c, char[] b2cSB, int b2Min, int b2Max, boolean isASCIICompatible) {
            super(cs, 0.5f, 1.0f, b2c, b2cSB_UNMAPPABLE, b2Min, b2Max, isASCIICompatible);
        }

        public Decoder_DBCSONLY(Charset cs, char[][] b2c, char[] b2cSB, int b2Min, int b2Max) {
            super(cs, 0.5f, 1.0f, b2c, b2cSB_UNMAPPABLE, b2Min, b2Max, false);
        }
    }

    public static class Decoder_EUC_SIM extends Decoder {
        private final int SS2;
        private final int SS3;

        public Decoder_EUC_SIM(Charset cs, char[][] b2c, char[] b2cSB, int b2Min, int b2Max, boolean isASCIICompatible) {
            super(cs, b2c, b2cSB, b2Min, b2Max, isASCIICompatible);
            this.SS2 = 142;
            this.SS3 = 143;
        }

        @Override // j$.sun.nio.cs.DoubleByte.Decoder
        protected CoderResult crMalformedOrUnderFlow(int b) {
            if (b == 142 || b == 143) {
                return CoderResult.malformedForLength(1);
            }
            return CoderResult.UNDERFLOW;
        }

        @Override // j$.sun.nio.cs.DoubleByte.Decoder
        protected CoderResult crMalformedOrUnmappable(int b1, int b2) {
            if (b1 == 142 || b1 == 143) {
                return CoderResult.malformedForLength(1);
            }
            return CoderResult.unmappableForLength(2);
        }

        /* JADX WARN: Code restructure failed: missing block: B:11:0x0038, code lost:
        
            if (r7 == 65533) goto L13;
         */
        @Override // j$.sun.nio.cs.DoubleByte.Decoder, j$.sun.nio.cs.ArrayDecoder
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public int decode(byte[] r10, int r11, int r12, char[] r13) {
            /*
                r9 = this;
                r0 = 0
                int r1 = r11 + r12
                java.lang.String r2 = r9.replacement()
                r3 = 0
                char r2 = r2.charAt(r3)
            Lc:
                if (r11 >= r1) goto L4f
                int r3 = r11 + 1
                r11 = r10[r11]
                r11 = r11 & 255(0xff, float:3.57E-43)
                char[] r4 = r9.b2cSB
                char r4 = r4[r11]
                r5 = 65533(0xfffd, float:9.1831E-41)
                if (r4 != r5) goto L48
                if (r3 >= r1) goto L47
                int r6 = r3 + 1
                r3 = r10[r3]
                r3 = r3 & 255(0xff, float:3.57E-43)
                int r7 = r9.b2Min
                if (r3 < r7) goto L3a
                int r7 = r9.b2Max
                if (r3 > r7) goto L3a
                char[][] r7 = r9.b2c
                r7 = r7[r11]
                int r8 = r9.b2Min
                int r8 = r3 - r8
                char r7 = r7[r8]
                r4 = r7
                if (r7 != r5) goto L45
            L3a:
                r5 = 142(0x8e, float:1.99E-43)
                if (r11 == r5) goto L42
                r5 = 143(0x8f, float:2.0E-43)
                if (r11 != r5) goto L44
            L42:
                int r6 = r6 + (-1)
            L44:
                r4 = r2
            L45:
                r3 = r6
                goto L48
            L47:
                r4 = r2
            L48:
                int r5 = r0 + 1
                r13[r0] = r4
                r11 = r3
                r0 = r5
                goto Lc
            L4f:
                return r0
            */
            throw new UnsupportedOperationException("Method not decompiled: j$.sun.nio.cs.DoubleByte.Decoder_EUC_SIM.decode(byte[], int, int, char[]):int");
        }
    }

    public static class Encoder extends CharsetEncoder implements ArrayEncoder {
        protected final int MAX_SINGLEBYTE;
        private final char[] c2b;
        private final char[] c2bIndex;
        final boolean isASCIICompatible;
        protected byte[] repl;
        protected Surrogate.Parser sgp;

        public Encoder(Charset cs, char[] c2b, char[] c2bIndex) {
            this(cs, c2b, c2bIndex, false);
        }

        public Encoder(Charset cs, char[] c2b, char[] c2bIndex, boolean isASCIICompatible) {
            super(cs, 2.0f, 2.0f);
            this.MAX_SINGLEBYTE = 255;
            this.repl = replacement();
            this.c2b = c2b;
            this.c2bIndex = c2bIndex;
            this.isASCIICompatible = isASCIICompatible;
        }

        public Encoder(Charset cs, float avg, float max, byte[] repl, char[] c2b, char[] c2bIndex, boolean isASCIICompatible) {
            super(cs, avg, max, repl);
            this.MAX_SINGLEBYTE = 255;
            this.repl = replacement();
            this.c2b = c2b;
            this.c2bIndex = c2bIndex;
            this.isASCIICompatible = isASCIICompatible;
        }

        @Override // java.nio.charset.CharsetEncoder
        public boolean canEncode(char c) {
            return encodeChar(c) != 65533;
        }

        protected Surrogate.Parser sgp() {
            if (this.sgp == null) {
                this.sgp = new Surrogate.Parser();
            }
            return this.sgp;
        }

        protected CoderResult encodeArrayLoop(CharBuffer src, ByteBuffer dst) {
            char[] sa = src.array();
            int sp = src.arrayOffset() + src.position();
            int sl = src.arrayOffset() + src.limit();
            byte[] da = dst.array();
            int dp = dst.arrayOffset() + dst.position();
            int dl = dst.arrayOffset() + dst.limit();
            while (sp < sl) {
                try {
                    char c = sa[sp];
                    int bb = encodeChar(c);
                    if (bb == 65533) {
                        if (!Character.isSurrogate(c)) {
                            CoderResult unmappableForLength = CoderResult.unmappableForLength(1);
                            return unmappableForLength;
                        }
                        if (sgp().parse(c, sa, sp, sl) < 0) {
                            CoderResult error = this.sgp.error();
                            return error;
                        }
                        CoderResult unmappableResult = this.sgp.unmappableResult();
                        return unmappableResult;
                    }
                    if (bb > 255) {
                        if (dl - dp < 2) {
                            CoderResult coderResult = CoderResult.OVERFLOW;
                            return coderResult;
                        }
                        int dp2 = dp + 1;
                        try {
                            da[dp] = (byte) (bb >> 8);
                            dp = dp2 + 1;
                            da[dp2] = (byte) bb;
                        } catch (Throwable th) {
                            th = th;
                            dp = dp2;
                            throw th;
                        }
                    } else {
                        if (dl - dp < 1) {
                            CoderResult coderResult2 = CoderResult.OVERFLOW;
                            return coderResult2;
                        }
                        int dp3 = dp + 1;
                        da[dp] = (byte) bb;
                        dp = dp3;
                    }
                    sp++;
                } catch (Throwable th2) {
                    th = th2;
                }
            }
            CoderResult coderResult3 = CoderResult.UNDERFLOW;
            return coderResult3;
        }

        protected CoderResult encodeBufferLoop(CharBuffer src, ByteBuffer dst) {
            int mark = src.position();
            while (src.hasRemaining()) {
                try {
                    char c = src.get();
                    int bb = encodeChar(c);
                    if (bb == 65533) {
                        return Character.isSurrogate(c) ? sgp().parse(c, src) < 0 ? this.sgp.error() : this.sgp.unmappableResult() : CoderResult.unmappableForLength(1);
                    }
                    if (bb > 255) {
                        if (dst.remaining() < 2) {
                            return CoderResult.OVERFLOW;
                        }
                        dst.put((byte) (bb >> 8));
                        dst.put((byte) bb);
                    } else {
                        if (dst.remaining() < 1) {
                            return CoderResult.OVERFLOW;
                        }
                        dst.put((byte) bb);
                    }
                    mark++;
                } finally {
                }
            }
            return CoderResult.UNDERFLOW;
        }

        @Override // java.nio.charset.CharsetEncoder
        protected CoderResult encodeLoop(CharBuffer src, ByteBuffer dst) {
            if (src.hasArray() && dst.hasArray()) {
                return encodeArrayLoop(src, dst);
            }
            return encodeBufferLoop(src, dst);
        }

        @Override // java.nio.charset.CharsetEncoder
        protected void implReplaceWith(byte[] newReplacement) {
            this.repl = newReplacement;
        }

        @Override // j$.sun.nio.cs.ArrayEncoder
        public int encode(char[] src, int sp, int len, byte[] dst) {
            int dp = 0;
            int sl = sp + len;
            int length = dst.length;
            while (sp < sl) {
                int sp2 = sp + 1;
                char c = src[sp];
                int bb = encodeChar(c);
                if (bb == 65533) {
                    if (Character.isHighSurrogate(c) && sp2 < sl && Character.isLowSurrogate(src[sp2])) {
                        sp2++;
                    }
                    int dp2 = dp + 1;
                    dst[dp] = this.repl[0];
                    if (this.repl.length <= 1) {
                        sp = sp2;
                        dp = dp2;
                    } else {
                        dp = dp2 + 1;
                        dst[dp2] = this.repl[1];
                        sp = sp2;
                    }
                } else {
                    if (bb > 255) {
                        int dp3 = dp + 1;
                        dst[dp] = (byte) (bb >> 8);
                        dp = dp3 + 1;
                        dst[dp3] = (byte) bb;
                    } else {
                        dst[dp] = (byte) bb;
                        dp++;
                    }
                    sp = sp2;
                }
            }
            return dp;
        }

        @Override // j$.sun.nio.cs.ArrayEncoder
        public int encodeFromLatin1(byte[] src, int sp, int len, byte[] dst) {
            int dp = 0;
            int sl = sp + len;
            while (sp < sl) {
                int sp2 = sp + 1;
                char c = (char) (src[sp] & 255);
                int bb = encodeChar(c);
                if (bb == 65533) {
                    int dp2 = dp + 1;
                    dst[dp] = this.repl[0];
                    if (this.repl.length <= 1) {
                        sp = sp2;
                        dp = dp2;
                    } else {
                        dp = dp2 + 1;
                        dst[dp2] = this.repl[1];
                        sp = sp2;
                    }
                } else {
                    if (bb > 255) {
                        int dp3 = dp + 1;
                        dst[dp] = (byte) (bb >> 8);
                        dp = dp3 + 1;
                        dst[dp3] = (byte) bb;
                    } else {
                        dst[dp] = (byte) bb;
                        dp++;
                    }
                    sp = sp2;
                }
            }
            return dp;
        }

        @Override // j$.sun.nio.cs.ArrayEncoder
        public int encodeFromUTF16(byte[] src, int sp, int len, byte[] dst) {
            int dp = 0;
            int sl = sp + len;
            while (sp < sl) {
                int sp2 = sp + 1;
                char c = StringUTF16.getChar(src, sp);
                int bb = encodeChar(c);
                if (bb == 65533) {
                    if (Character.isHighSurrogate(c) && sp2 < sl && Character.isLowSurrogate(StringUTF16.getChar(src, sp2))) {
                        sp2++;
                    }
                    int dp2 = dp + 1;
                    dst[dp] = this.repl[0];
                    if (this.repl.length <= 1) {
                        sp = sp2;
                        dp = dp2;
                    } else {
                        dp = dp2 + 1;
                        dst[dp2] = this.repl[1];
                        sp = sp2;
                    }
                } else {
                    if (bb > 255) {
                        int dp3 = dp + 1;
                        dst[dp] = (byte) (bb >> 8);
                        dp = dp3 + 1;
                        dst[dp3] = (byte) bb;
                    } else {
                        dst[dp] = (byte) bb;
                        dp++;
                    }
                    sp = sp2;
                }
            }
            return dp;
        }

        @Override // j$.sun.nio.cs.ArrayEncoder
        public boolean isASCIICompatible() {
            return this.isASCIICompatible;
        }

        public int encodeChar(char ch) {
            return this.c2b[this.c2bIndex[ch >> '\b'] + (ch & 255)];
        }

        /* JADX WARN: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxOverflowException: Type inference error: updates count limit reached
        	at jadx.core.dex.visitors.typeinference.TypeUpdateInfo.requestUpdate(TypeUpdateInfo.java:35)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:210)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:183)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.moveListener(TypeUpdate.java:447)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:188)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.moveListener(TypeUpdate.java:447)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:183)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.allSameListener(TypeUpdate.java:473)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:183)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.allSameListener(TypeUpdate.java:473)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:183)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.allSameListener(TypeUpdate.java:466)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:188)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.allSameListener(TypeUpdate.java:466)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:188)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.allSameListener(TypeUpdate.java:473)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:183)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.allSameListener(TypeUpdate.java:473)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:183)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.moveListener(TypeUpdate.java:447)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:183)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.allSameListener(TypeUpdate.java:473)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:183)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.allSameListener(TypeUpdate.java:473)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:183)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.allSameListener(TypeUpdate.java:466)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:188)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.allSameListener(TypeUpdate.java:466)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:188)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.allSameListener(TypeUpdate.java:473)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:183)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.allSameListener(TypeUpdate.java:466)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:188)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.allSameListener(TypeUpdate.java:473)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:183)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.moveListener(TypeUpdate.java:447)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:183)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.allSameListener(TypeUpdate.java:473)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:183)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.allSameListener(TypeUpdate.java:466)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:188)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.moveListener(TypeUpdate.java:447)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:188)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.apply(TypeUpdate.java:83)
        	at jadx.core.dex.visitors.typeinference.TypeUpdate.applyWithWiderIgnSame(TypeUpdate.java:70)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.applyResolvedVars(TypeSearch.java:100)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:76)
        	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.runMultiVariableSearch(FixTypesVisitor.java:116)
        	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:91)
         */
        public static void initC2B(String[] strArr, String str, String str2, String str3, int i, int i2, char[] cArr, char[] cArr2) {
            Arrays.fill(cArr, CharsetMapping.UNMAPPABLE_DECODING);
            char c = 256;
            c = 256;
            char[][] cArr3 = new char[strArr.length][];
            char[] cArr4 = null;
            if (str != null) {
                cArr4 = str.toCharArray();
            }
            for (int i3 = 0; i3 < strArr.length; i3++) {
                if (strArr[i3] != null) {
                    cArr3[i3] = strArr[i3].toCharArray();
                }
            }
            if (str2 != null) {
                int i4 = 0;
                while (i4 < str2.length()) {
                    int i5 = i4 + 1;
                    char charAt = str2.charAt(i4);
                    int i6 = i5 + 1;
                    char charAt2 = str2.charAt(i5);
                    if (charAt < 256 && cArr4 != null) {
                        if (cArr4[charAt] == charAt2) {
                            cArr4[charAt] = CharsetMapping.UNMAPPABLE_DECODING;
                        }
                    } else if (cArr3[charAt >> '\b'][(charAt & 255) - i] == charAt2) {
                        cArr3[charAt >> '\b'][(charAt & 255) - i] = CharsetMapping.UNMAPPABLE_DECODING;
                    }
                    i4 = i6;
                }
            }
            if (cArr4 != null) {
                int i7 = 0;
                while (i7 < cArr4.length) {
                    char c2 = cArr4[i7];
                    if (c2 != 65533) {
                        char c3 = cArr2[c2 >> '\b'];
                        c = c;
                        if (c3 == 0) {
                            c3 = c;
                            cArr2[c2 >> '\b'] = c3;
                            c += 256;
                        }
                        cArr[(c2 & 255) + c3] = (char) i7;
                    }
                    i7++;
                    c = c;
                }
            }
            int i8 = 0;
            char c4 = c;
            while (i8 < strArr.length) {
                char[] cArr5 = cArr3[i8];
                if (cArr5 != null) {
                    int i9 = i;
                    c4 = c4;
                    while (i9 <= i2) {
                        char c5 = cArr5[i9 - i];
                        if (c5 != 65533) {
                            char c6 = cArr2[c5 >> '\b'];
                            c4 = c4;
                            if (c6 == 0) {
                                c6 = c4;
                                cArr2[c5 >> '\b'] = c6;
                                c4 += 256;
                            }
                            cArr[(c5 & 255) + c6] = (char) ((i8 << 8) | i9);
                        }
                        i9++;
                        c4 = c4;
                    }
                }
                i8++;
                c4 = c4;
            }
            if (str3 != null) {
                int i10 = 0;
                int i11 = c4;
                while (i10 < str3.length()) {
                    char charAt3 = str3.charAt(i10);
                    char charAt4 = str3.charAt(i10 + 1);
                    int i12 = charAt4 >> '\b';
                    if (cArr2[i12] == 0) {
                        cArr2[i12] = (char) i11;
                        i11 += 256;
                    }
                    cArr[cArr2[i12] + (charAt4 & 255)] = charAt3;
                    i10 += 2;
                    i11 = i11;
                }
            }
        }
    }

    public static class Encoder_DBCSONLY extends Encoder {
        public Encoder_DBCSONLY(Charset cs, byte[] repl, char[] c2b, char[] c2bIndex, boolean isASCIICompatible) {
            super(cs, 2.0f, 2.0f, repl, c2b, c2bIndex, isASCIICompatible);
        }

        @Override // j$.sun.nio.cs.DoubleByte.Encoder
        public int encodeChar(char ch) {
            int bb = super.encodeChar(ch);
            if (bb <= 255) {
                return CharsetMapping.UNMAPPABLE_ENCODING;
            }
            return bb;
        }
    }

    public static class Encoder_EBCDIC extends Encoder {
        static final int DBCS = 1;
        static final int SBCS = 0;
        static final byte SI = 15;
        static final byte SO = 14;
        protected int currentState;

        public Encoder_EBCDIC(Charset cs, char[] c2b, char[] c2bIndex, boolean isASCIICompatible) {
            super(cs, 4.0f, 5.0f, new byte[]{111}, c2b, c2bIndex, isASCIICompatible);
            this.currentState = 0;
        }

        @Override // java.nio.charset.CharsetEncoder
        protected void implReset() {
            this.currentState = 0;
        }

        @Override // java.nio.charset.CharsetEncoder
        protected CoderResult implFlush(ByteBuffer out) {
            if (this.currentState == 1) {
                if (out.remaining() < 1) {
                    return CoderResult.OVERFLOW;
                }
                out.put((byte) 15);
            }
            implReset();
            return CoderResult.UNDERFLOW;
        }

        @Override // j$.sun.nio.cs.DoubleByte.Encoder
        protected CoderResult encodeArrayLoop(CharBuffer src, ByteBuffer dst) {
            char[] sa = src.array();
            int sp = src.arrayOffset() + src.position();
            int sl = src.arrayOffset() + src.limit();
            byte[] da = dst.array();
            int dp = dst.arrayOffset() + dst.position();
            int dl = dst.arrayOffset() + dst.limit();
            while (sp < sl) {
                try {
                    char c = sa[sp];
                    int bb = encodeChar(c);
                    if (bb == 65533) {
                        if (!Character.isSurrogate(c)) {
                            CoderResult unmappableForLength = CoderResult.unmappableForLength(1);
                            return unmappableForLength;
                        }
                        if (sgp().parse(c, sa, sp, sl) < 0) {
                            CoderResult error = this.sgp.error();
                            return error;
                        }
                        CoderResult unmappableResult = this.sgp.unmappableResult();
                        return unmappableResult;
                    }
                    if (bb > 255) {
                        if (this.currentState == 0) {
                            if (dl - dp < 1) {
                                CoderResult coderResult = CoderResult.OVERFLOW;
                                return coderResult;
                            }
                            this.currentState = 1;
                            int dp2 = dp + 1;
                            try {
                                da[dp] = 14;
                                dp = dp2;
                            } catch (Throwable th) {
                                th = th;
                                dp = dp2;
                                throw th;
                            }
                        }
                        if (dl - dp < 2) {
                            CoderResult coderResult2 = CoderResult.OVERFLOW;
                            return coderResult2;
                        }
                        int dp3 = dp + 1;
                        da[dp] = (byte) (bb >> 8);
                        dp = dp3 + 1;
                        da[dp3] = (byte) bb;
                    } else {
                        if (this.currentState == 1) {
                            if (dl - dp < 1) {
                                CoderResult coderResult3 = CoderResult.OVERFLOW;
                                return coderResult3;
                            }
                            this.currentState = 0;
                            int dp4 = dp + 1;
                            da[dp] = 15;
                            dp = dp4;
                        }
                        if (dl - dp < 1) {
                            CoderResult coderResult4 = CoderResult.OVERFLOW;
                            return coderResult4;
                        }
                        int dp5 = dp + 1;
                        da[dp] = (byte) bb;
                        dp = dp5;
                    }
                    sp++;
                } catch (Throwable th2) {
                    th = th2;
                }
            }
            CoderResult coderResult5 = CoderResult.UNDERFLOW;
            return coderResult5;
        }

        @Override // j$.sun.nio.cs.DoubleByte.Encoder
        protected CoderResult encodeBufferLoop(CharBuffer src, ByteBuffer dst) {
            int mark = src.position();
            while (src.hasRemaining()) {
                try {
                    char c = src.get();
                    int bb = encodeChar(c);
                    if (bb == 65533) {
                        return Character.isSurrogate(c) ? sgp().parse(c, src) < 0 ? this.sgp.error() : this.sgp.unmappableResult() : CoderResult.unmappableForLength(1);
                    }
                    if (bb > 255) {
                        if (this.currentState == 0) {
                            if (dst.remaining() < 1) {
                                return CoderResult.OVERFLOW;
                            }
                            this.currentState = 1;
                            dst.put((byte) 14);
                        }
                        if (dst.remaining() < 2) {
                            return CoderResult.OVERFLOW;
                        }
                        dst.put((byte) (bb >> 8));
                        dst.put((byte) bb);
                    } else {
                        if (this.currentState == 1) {
                            if (dst.remaining() < 1) {
                                return CoderResult.OVERFLOW;
                            }
                            this.currentState = 0;
                            dst.put((byte) 15);
                        }
                        if (dst.remaining() < 1) {
                            return CoderResult.OVERFLOW;
                        }
                        dst.put((byte) bb);
                    }
                    mark++;
                } finally {
                }
            }
            return CoderResult.UNDERFLOW;
        }

        @Override // j$.sun.nio.cs.DoubleByte.Encoder, j$.sun.nio.cs.ArrayEncoder
        public int encode(char[] src, int sp, int len, byte[] dst) {
            int dp = 0;
            int sl = sp + len;
            while (sp < sl) {
                int sp2 = sp + 1;
                char c = src[sp];
                int bb = encodeChar(c);
                if (bb == 65533) {
                    if (Character.isHighSurrogate(c) && sp2 < sl && Character.isLowSurrogate(src[sp2])) {
                        sp2++;
                    }
                    int dp2 = dp + 1;
                    dst[dp] = this.repl[0];
                    if (this.repl.length <= 1) {
                        dp = dp2;
                        sp = sp2;
                    } else {
                        dp = dp2 + 1;
                        dst[dp2] = this.repl[1];
                        sp = sp2;
                    }
                } else {
                    if (bb > 255) {
                        if (this.currentState == 0) {
                            this.currentState = 1;
                            dst[dp] = 14;
                            dp++;
                        }
                        int dp3 = dp + 1;
                        dst[dp] = (byte) (bb >> 8);
                        dp = dp3 + 1;
                        dst[dp3] = (byte) bb;
                    } else {
                        if (this.currentState == 1) {
                            this.currentState = 0;
                            dst[dp] = 15;
                            dp++;
                        }
                        dst[dp] = (byte) bb;
                        dp++;
                    }
                    sp = sp2;
                }
            }
            if (this.currentState == 1) {
                this.currentState = 0;
                int dp4 = dp + 1;
                dst[dp] = 15;
                return dp4;
            }
            return dp;
        }

        @Override // j$.sun.nio.cs.DoubleByte.Encoder, j$.sun.nio.cs.ArrayEncoder
        public int encodeFromLatin1(byte[] src, int sp, int len, byte[] dst) {
            int dp = 0;
            int sl = sp + len;
            while (sp < sl) {
                int sp2 = sp + 1;
                char c = (char) (src[sp] & 255);
                int bb = encodeChar(c);
                if (bb == 65533) {
                    int dp2 = dp + 1;
                    dst[dp] = this.repl[0];
                    if (this.repl.length <= 1) {
                        dp = dp2;
                        sp = sp2;
                    } else {
                        dp = dp2 + 1;
                        dst[dp2] = this.repl[1];
                        sp = sp2;
                    }
                } else {
                    if (bb > 255) {
                        if (this.currentState == 0) {
                            this.currentState = 1;
                            dst[dp] = 14;
                            dp++;
                        }
                        int dp3 = dp + 1;
                        dst[dp] = (byte) (bb >> 8);
                        dp = dp3 + 1;
                        dst[dp3] = (byte) bb;
                    } else {
                        if (this.currentState == 1) {
                            this.currentState = 0;
                            dst[dp] = 15;
                            dp++;
                        }
                        dst[dp] = (byte) bb;
                        dp++;
                    }
                    sp = sp2;
                }
            }
            if (this.currentState == 1) {
                this.currentState = 0;
                int dp4 = dp + 1;
                dst[dp] = 15;
                return dp4;
            }
            return dp;
        }

        @Override // j$.sun.nio.cs.DoubleByte.Encoder, j$.sun.nio.cs.ArrayEncoder
        public int encodeFromUTF16(byte[] src, int sp, int len, byte[] dst) {
            int dp = 0;
            int sl = sp + len;
            while (sp < sl) {
                int sp2 = sp + 1;
                char c = StringUTF16.getChar(src, sp);
                int bb = encodeChar(c);
                if (bb == 65533) {
                    if (Character.isHighSurrogate(c) && sp2 < sl && Character.isLowSurrogate(StringUTF16.getChar(src, sp2))) {
                        sp2++;
                    }
                    int dp2 = dp + 1;
                    dst[dp] = this.repl[0];
                    if (this.repl.length <= 1) {
                        dp = dp2;
                        sp = sp2;
                    } else {
                        dp = dp2 + 1;
                        dst[dp2] = this.repl[1];
                        sp = sp2;
                    }
                } else {
                    if (bb > 255) {
                        if (this.currentState == 0) {
                            this.currentState = 1;
                            dst[dp] = 14;
                            dp++;
                        }
                        int dp3 = dp + 1;
                        dst[dp] = (byte) (bb >> 8);
                        dp = dp3 + 1;
                        dst[dp3] = (byte) bb;
                    } else {
                        if (this.currentState == 1) {
                            this.currentState = 0;
                            dst[dp] = 15;
                            dp++;
                        }
                        dst[dp] = (byte) bb;
                        dp++;
                    }
                    sp = sp2;
                }
            }
            if (this.currentState == 1) {
                this.currentState = 0;
                int dp4 = dp + 1;
                dst[dp] = 15;
                return dp4;
            }
            return dp;
        }
    }

    public static class Encoder_EUC_SIM extends Encoder {
        public Encoder_EUC_SIM(Charset cs, char[] c2b, char[] c2bIndex, boolean isASCIICompatible) {
            super(cs, c2b, c2bIndex, isASCIICompatible);
        }
    }
}
