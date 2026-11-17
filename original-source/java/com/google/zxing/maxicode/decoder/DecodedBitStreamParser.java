package com.google.zxing.maxicode.decoder;

import com.coleta.ambientuus.database.managers.PontoColetaTableManager;
import com.google.common.base.Ascii;
import com.google.zxing.common.DecoderResult;
import java.text.DecimalFormat;
import java.text.NumberFormat;

/* loaded from: classes16.dex */
final class DecodedBitStreamParser {
    private static final char ECI = 65530;
    private static final char FS = 28;
    private static final char GS = 29;
    private static final char LATCHA = 65527;
    private static final char LATCHB = 65528;
    private static final char LOCK = 65529;
    private static final char NS = 65531;
    private static final char PAD = 65532;
    private static final char RS = 30;
    private static final char SHIFTA = 65520;
    private static final char SHIFTB = 65521;
    private static final char SHIFTC = 65522;
    private static final char SHIFTD = 65523;
    private static final char SHIFTE = 65524;
    private static final char THREESHIFTA = 65526;
    private static final char TWOSHIFTA = 65525;
    private static final NumberFormat NINE_DIGITS = new DecimalFormat("000000000");
    private static final NumberFormat THREE_DIGITS = new DecimalFormat(PontoColetaTableManager.STATUS_PENDENTE);
    private static final String[] SETS = {"\nABCDEFGHIJKLMNOPQRSTUVWXYZ\ufffa\u001c\u001d\u001e\ufffb ￼\"#$%&'()*+,-./0123456789:\ufff1\ufff2\ufff3\ufff4\ufff8", "`abcdefghijklmnopqrstuvwxyz\ufffa\u001c\u001d\u001e\ufffb{￼}~\u007f;<=>?[\\]^_ ,./:@!|￼\ufff5\ufff6￼\ufff0\ufff2\ufff3\ufff4\ufff7", "ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚ\ufffa\u001c\u001d\u001eÛÜÝÞßª¬±²³µ¹º¼½¾\u0080\u0081\u0082\u0083\u0084\u0085\u0086\u0087\u0088\u0089\ufff7 \ufff9\ufff3\ufff4\ufff8", "àáâãäåæçèéêëìíîïðñòóôõö÷øùú\ufffa\u001c\u001d\u001e\ufffbûüýþÿ¡¨«¯°´·¸»¿\u008a\u008b\u008c\u008d\u008e\u008f\u0090\u0091\u0092\u0093\u0094\ufff7 \ufff2\ufff9\ufff4\ufff8", "\u0000\u0001\u0002\u0003\u0004\u0005\u0006\u0007\b\t\n\u000b\f\r\u000e\u000f\u0010\u0011\u0012\u0013\u0014\u0015\u0016\u0017\u0018\u0019\u001a\ufffa￼￼\u001b\ufffb\u001c\u001d\u001e\u001f\u009f ¢£¤¥¦§©\u00ad®¶\u0095\u0096\u0097\u0098\u0099\u009a\u009b\u009c\u009d\u009e\ufff7 \ufff2\ufff3\ufff9\ufff8", "\u0000\u0001\u0002\u0003\u0004\u0005\u0006\u0007\b\t\n\u000b\f\r\u000e\u000f\u0010\u0011\u0012\u0013\u0014\u0015\u0016\u0017\u0018\u0019\u001a\u001b\u001c\u001d\u001e\u001f !\"#$%&'()*+,-./0123456789:;<=>?"};

    private DecodedBitStreamParser() {
    }

    static DecoderResult decode(byte[] bytes, int mode) {
        String postcode;
        StringBuilder result = new StringBuilder(144);
        switch (mode) {
            case 2:
            case 3:
                if (mode == 2) {
                    int pc = getPostCode2(bytes);
                    NumberFormat df = new DecimalFormat("0000000000".substring(0, getPostCode2Length(bytes)));
                    postcode = df.format(pc);
                } else {
                    postcode = getPostCode3(bytes);
                }
                String country = THREE_DIGITS.format(getCountry(bytes));
                String service = THREE_DIGITS.format(getServiceClass(bytes));
                result.append(getMessage(bytes, 10, 84));
                if (result.toString().startsWith("[)>\u001e01\u001d")) {
                    result.insert(9, postcode + GS + country + GS + service + GS);
                    break;
                } else {
                    result.insert(0, postcode + GS + country + GS + service + GS);
                    break;
                }
            case 4:
                result.append(getMessage(bytes, 1, 93));
                break;
            case 5:
                result.append(getMessage(bytes, 1, 77));
                break;
        }
        return new DecoderResult(bytes, result.toString(), null, String.valueOf(mode));
    }

    private static int getBit(int bit, byte[] bytes) {
        int bit2 = bit - 1;
        return (bytes[bit2 / 6] & (1 << (5 - (bit2 % 6)))) == 0 ? 0 : 1;
    }

    private static int getInt(byte[] bytes, byte[] x) {
        if (x.length == 0) {
            throw new IllegalArgumentException();
        }
        int val = 0;
        for (int i = 0; i < x.length; i++) {
            val += getBit(x[i], bytes) << ((x.length - i) - 1);
        }
        return val;
    }

    private static int getCountry(byte[] bytes) {
        return getInt(bytes, new byte[]{53, 54, 43, 44, 45, 46, 47, 48, 37, 38});
    }

    private static int getServiceClass(byte[] bytes) {
        return getInt(bytes, new byte[]{55, 56, 57, 58, 59, 60, 49, 50, 51, 52});
    }

    private static int getPostCode2Length(byte[] bytes) {
        return getInt(bytes, new byte[]{39, 40, 41, 42, Ascii.US, 32});
    }

    private static int getPostCode2(byte[] bytes) {
        return getInt(bytes, new byte[]{33, 34, 35, 36, Ascii.EM, Ascii.SUB, Ascii.ESC, Ascii.FS, Ascii.GS, Ascii.RS, 19, Ascii.DC4, Ascii.NAK, Ascii.SYN, Ascii.ETB, Ascii.CAN, Ascii.CR, Ascii.SO, Ascii.SI, Ascii.DLE, 17, Ascii.DC2, 7, 8, 9, 10, Ascii.VT, Ascii.FF, 1, 2});
    }

    private static String getPostCode3(byte[] bytes) {
        return String.valueOf(new char[]{SETS[0].charAt(getInt(bytes, new byte[]{39, 40, 41, 42, Ascii.US, 32})), SETS[0].charAt(getInt(bytes, new byte[]{33, 34, 35, 36, Ascii.EM, Ascii.SUB})), SETS[0].charAt(getInt(bytes, new byte[]{Ascii.ESC, Ascii.FS, Ascii.GS, Ascii.RS, 19, Ascii.DC4})), SETS[0].charAt(getInt(bytes, new byte[]{Ascii.NAK, Ascii.SYN, Ascii.ETB, Ascii.CAN, Ascii.CR, Ascii.SO})), SETS[0].charAt(getInt(bytes, new byte[]{Ascii.SI, Ascii.DLE, 17, Ascii.DC2, 7, 8})), SETS[0].charAt(getInt(bytes, new byte[]{9, 10, Ascii.VT, Ascii.FF, 1, 2}))});
    }

    /* JADX WARN: Incorrect condition in loop: B:22:0x0070 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static java.lang.String getMessage(byte[] r10, int r11, int r12) {
        /*
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            r0.<init>()
            r1 = -1
            r2 = 0
            r3 = 0
            r4 = r11
            r5 = 0
        La:
            int r6 = r11 + r12
            if (r4 >= r6) goto L6c
            java.lang.String[] r6 = com.google.zxing.maxicode.decoder.DecodedBitStreamParser.SETS
            r6 = r6[r2]
            r7 = r10[r4]
            char r6 = r6.charAt(r7)
            switch(r6) {
                case 65520: goto L5a;
                case 65521: goto L5a;
                case 65522: goto L5a;
                case 65523: goto L5a;
                case 65524: goto L5a;
                case 65525: goto L56;
                case 65526: goto L52;
                case 65527: goto L4f;
                case 65528: goto L4c;
                case 65529: goto L4a;
                case 65530: goto L1b;
                case 65531: goto L1f;
                default: goto L1b;
            }
        L1b:
            r0.append(r6)
            goto L62
        L1f:
            int r4 = r4 + 1
            r5 = r10[r4]
            int r5 = r5 << 24
            int r4 = r4 + 1
            r7 = r10[r4]
            int r7 = r7 << 18
            int r5 = r5 + r7
            int r4 = r4 + 1
            r7 = r10[r4]
            int r7 = r7 << 12
            int r5 = r5 + r7
            int r4 = r4 + 1
            r7 = r10[r4]
            int r7 = r7 << 6
            int r5 = r5 + r7
            int r4 = r4 + 1
            r7 = r10[r4]
            int r5 = r5 + r7
            java.text.NumberFormat r7 = com.google.zxing.maxicode.decoder.DecodedBitStreamParser.NINE_DIGITS
            long r8 = (long) r5
            java.lang.String r7 = r7.format(r8)
            r0.append(r7)
            goto L62
        L4a:
            r1 = -1
            goto L62
        L4c:
            r2 = 1
            r1 = -1
            goto L62
        L4f:
            r2 = 0
            r1 = -1
            goto L62
        L52:
            r3 = r2
            r2 = 0
            r1 = 3
            goto L62
        L56:
            r3 = r2
            r2 = 0
            r1 = 2
            goto L62
        L5a:
            r3 = r2
            r7 = 65520(0xfff0, float:9.1813E-41)
            int r2 = r6 - r7
            r1 = 1
        L62:
            int r7 = r1 + (-1)
            if (r1 != 0) goto L68
            r1 = r3
            r2 = r1
        L68:
            int r4 = r4 + 1
            r1 = r7
            goto La
        L6c:
            int r4 = r0.length()
            if (r4 <= 0) goto L8b
            int r4 = r0.length()
            int r4 = r4 + (-1)
            char r4 = r0.charAt(r4)
            r5 = 65532(0xfffc, float:9.183E-41)
            if (r4 != r5) goto L8b
            int r4 = r0.length()
            int r4 = r4 + (-1)
            r0.setLength(r4)
            goto L6c
        L8b:
            java.lang.String r4 = r0.toString()
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.zxing.maxicode.decoder.DecodedBitStreamParser.getMessage(byte[], int, int):java.lang.String");
    }
}
