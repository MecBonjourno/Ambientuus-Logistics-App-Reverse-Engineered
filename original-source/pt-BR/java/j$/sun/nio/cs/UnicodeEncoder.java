package j$.sun.nio.cs;

import j$.sun.nio.cs.Surrogate;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CoderResult;

/* carregado de: classes15.dex */
public abstract class UnicodeEncoder extends CharsetEncoder {
    protected static final int BIG = 0;
    protected static final char BYTE_ORDER_MARK = 65279;
    protected static final int LITTLE = 1;
    protected static final char REVERSED_MARK = 65534;
    private int byteOrder;
    private boolean needsMark;
    private final Surrogate.Parser sgp;
    private boolean usesMark;

    /* JADX WARN: instruções ilegais antes da chamada do construtor */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected UnicodeEncoder(java.nio.charset.Charset r8, int r9, boolean r10) {
        /*
            r7 = this;
            r0 = 1073741824(0x40000000, float:2.0)
            if (r10 == 0) goto L8
            r1 = 1082130432(0x40800000, float:4.0)
            goto L9
        L8:
            r1 = r0
        L9:
            r2 = -1
            r3 = 1
            r4 = -3
            r5 = 0
            r6 = 2
            if (r9 != 0) goto L17
            byte[] r6 = new byte[r6]
            r6[r5] = r2
            r6[r3] = r4
            goto L1d
        L17:
            byte[] r6 = new byte[r6]
            r6[r5] = r4
            r6[r3] = r2
        L1d:
            r7.<init>(r8, r0, r1, r6)
            j$.sun.nio.cs.Surrogate$Parser r0 = new j$.sun.nio.cs.Surrogate$Parser
            r0.<init>()
            r7.sgp = r0
            r7.needsMark = r10
            r7.usesMark = r10
            r7.byteOrder = r9
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: j$.sun.nio.cs.UnicodeEncoder.<init>(java.nio.charset.Charset, int, boolean):void");
    }

    private void put(char c, ByteBuffer dst) {
        if (this.byteOrder == 0) {
            dst.put((byte) (c >> '\b'));
            dst.put((byte) (c & 255));
        } else {
            dst.put((byte) (c & 255));
            dst.put((byte) (c >> '\b'));
        }
    }

    @Override // java.nio.charset.CharsetEncoder
    protected CoderResult encodeLoop(CharBuffer src, ByteBuffer dst) {
        int mark = src.position();
        if (this.needsMark && src.hasRemaining()) {
            if (dst.remaining() < 2) {
                return CoderResult.OVERFLOW;
            }
            put(BYTE_ORDER_MARK, dst);
            this.needsMark = false;
        }
        while (src.hasRemaining()) {
            try {
                char c = src.get();
                if (Character.isSurrogate(c)) {
                    int d = this.sgp.parse(c, src);
                    if (d < 0) {
                        return this.sgp.error();
                    }
                    if (dst.remaining() < 4) {
                        return CoderResult.OVERFLOW;
                    }
                    mark += 2;
                    put(Character.highSurrogate(d), dst);
                    put(Character.lowSurrogate(d), dst);
                } else {
                    if (dst.remaining() < 2) {
                        return CoderResult.OVERFLOW;
                    }
                    mark++;
                    put(c, dst);
                }
            } finally {
            }
        }
        return CoderResult.UNDERFLOW;
    }

    @Override // java.nio.charset.CharsetEncoder
    protected void implReset() {
        this.needsMark = this.usesMark;
    }

    @Override // java.nio.charset.CharsetEncoder
    public boolean canEncode(char c) {
        return !Character.isSurrogate(c);
    }
}
