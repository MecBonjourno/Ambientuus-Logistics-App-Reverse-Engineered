package org.apache.commons.lang;

import java.math.BigDecimal;
import java.math.BigInteger;

/* loaded from: classes17.dex */
public final class NumberUtils {
    public static int stringToInt(String str) {
        return stringToInt(str, 0);
    }

    public static int stringToInt(String str, int defaultValue) {
        try {
            return Integer.parseInt(str);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0121 A[Catch: NumberFormatException -> 0x0130, TRY_LEAVE, TryCatch #7 {NumberFormatException -> 0x0130, blocks: (B:63:0x0117, B:65:0x0121), top: B:62:0x0117 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.Number createNumber(java.lang.String r18) throws java.lang.NumberFormatException {
        /*
            Method dump skipped, instructions count: 484
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang.NumberUtils.createNumber(java.lang.String):java.lang.Number");
    }

    private static boolean isAllZeros(String s) {
        if (s == null) {
            return true;
        }
        for (int i = s.length() - 1; i >= 0; i--) {
            if (s.charAt(i) != '0') {
                return false;
            }
        }
        int i2 = s.length();
        return i2 > 0;
    }

    public static Float createFloat(String val) {
        return Float.valueOf(val);
    }

    public static Double createDouble(String val) {
        return Double.valueOf(val);
    }

    public static Integer createInteger(String val) {
        return Integer.decode(val);
    }

    public static Long createLong(String val) {
        return Long.valueOf(val);
    }

    public static BigInteger createBigInteger(String val) {
        BigInteger bi = new BigInteger(val);
        return bi;
    }

    public static BigDecimal createBigDecimal(String val) {
        BigDecimal bd = new BigDecimal(val);
        return bd;
    }

    public static long minimum(long a, long b, long c) {
        if (b < a) {
            a = b;
        }
        if (c < a) {
            return c;
        }
        return a;
    }

    public static int minimum(int a, int b, int c) {
        if (b < a) {
            a = b;
        }
        if (c < a) {
            return c;
        }
        return a;
    }

    public static long maximum(long a, long b, long c) {
        if (b > a) {
            a = b;
        }
        if (c > a) {
            return c;
        }
        return a;
    }

    public static int maximum(int a, int b, int c) {
        if (b > a) {
            a = b;
        }
        if (c > a) {
            return c;
        }
        return a;
    }

    public static int compare(double lhs, double rhs) {
        if (lhs < rhs) {
            return -1;
        }
        if (lhs > rhs) {
            return 1;
        }
        long lhsBits = Double.doubleToLongBits(lhs);
        long rhsBits = Double.doubleToLongBits(rhs);
        if (lhsBits == rhsBits) {
            return 0;
        }
        return lhsBits < rhsBits ? -1 : 1;
    }

    public static int compare(float lhs, float rhs) {
        if (lhs < rhs) {
            return -1;
        }
        if (lhs > rhs) {
            return 1;
        }
        int lhsBits = Float.floatToIntBits(lhs);
        int rhsBits = Float.floatToIntBits(rhs);
        if (lhsBits == rhsBits) {
            return 0;
        }
        return lhsBits < rhsBits ? -1 : 1;
    }

    public static boolean isDigits(String str) {
        if (str == null || str.length() == 0) {
            return false;
        }
        for (int i = 0; i < str.length(); i++) {
            if (!Character.isDigit(str.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    /* JADX WARN: Code restructure failed: missing block: B:100:0x008e, code lost:
    
        if (r0[r10] == 'd') goto L65;
     */
    /* JADX WARN: Code restructure failed: missing block: B:102:0x0094, code lost:
    
        if (r0[r10] == 'D') goto L65;
     */
    /* JADX WARN: Code restructure failed: missing block: B:104:0x0098, code lost:
    
        if (r0[r10] == 'f') goto L65;
     */
    /* JADX WARN: Code restructure failed: missing block: B:106:0x009c, code lost:
    
        if (r0[r10] != r11) goto L66;
     */
    /* JADX WARN: Code restructure failed: missing block: B:107:0x009e, code lost:
    
        return r6;
     */
    /* JADX WARN: Code restructure failed: missing block: B:109:0x00a3, code lost:
    
        if (r0[r10] == 'l') goto L72;
     */
    /* JADX WARN: Code restructure failed: missing block: B:111:0x00a9, code lost:
    
        if (r0[r10] != 'L') goto L71;
     */
    /* JADX WARN: Code restructure failed: missing block: B:112:0x00ac, code lost:
    
        return r16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:113:0x00ad, code lost:
    
        if (r6 == false) goto L75;
     */
    /* JADX WARN: Code restructure failed: missing block: B:114:0x00af, code lost:
    
        if (r3 != false) goto L75;
     */
    /* JADX WARN: Code restructure failed: missing block: B:116:?, code lost:
    
        return r17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:118:0x00b6, code lost:
    
        return r16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:119:0x00b7, code lost:
    
        return r16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:120:0x00b8, code lost:
    
        if (r5 != false) goto L81;
     */
    /* JADX WARN: Code restructure failed: missing block: B:121:0x00ba, code lost:
    
        if (r6 == false) goto L81;
     */
    /* JADX WARN: Code restructure failed: missing block: B:123:?, code lost:
    
        return r17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:125:0x00c1, code lost:
    
        return r16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x00de, code lost:
    
        return r16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:88:0x0074, code lost:
    
        if (r10 >= r0.length) goto L78;
     */
    /* JADX WARN: Code restructure failed: missing block: B:90:0x0078, code lost:
    
        if (r0[r10] < '0') goto L51;
     */
    /* JADX WARN: Code restructure failed: missing block: B:92:0x007c, code lost:
    
        if (r0[r10] > '9') goto L51;
     */
    /* JADX WARN: Code restructure failed: missing block: B:93:0x007e, code lost:
    
        return r17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:95:0x0081, code lost:
    
        if (r0[r10] == 'e') goto L77;
     */
    /* JADX WARN: Code restructure failed: missing block: B:97:0x0085, code lost:
    
        if (r0[r10] != 'E') goto L56;
     */
    /* JADX WARN: Code restructure failed: missing block: B:98:0x0088, code lost:
    
        if (r5 != false) goto L66;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static boolean isNumber(java.lang.String r18) {
        /*
            Method dump skipped, instructions count: 272
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang.NumberUtils.isNumber(java.lang.String):boolean");
    }
}
