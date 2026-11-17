package com.fasterxml.jackson.core.io;

import java.math.BigDecimal;

/* loaded from: classes.dex */
public final class NumberInput {
    static final long L_BILLION = 1000000000;
    public static final String NASTY_SMALL_DOUBLE = "2.2250738585072012e-308";
    static final String MIN_LONG_STR_NO_SIGN = String.valueOf(Long.MIN_VALUE).substring(1);
    static final String MAX_LONG_STR = String.valueOf(Long.MAX_VALUE);

    public static int parseInt(char[] ch, int off, int len) {
        int num = ch[off] - '0';
        if (len > 4) {
            int num2 = ((num * 10) + (ch[r6] - '0')) * 10;
            int num3 = (num2 + (ch[r6] - '0')) * 10;
            int num4 = (num3 + (ch[r6] - '0')) * 10;
            off = off + 1 + 1 + 1 + 1;
            num = num4 + (ch[off] - '0');
            len -= 4;
            if (len > 4) {
                int num5 = ((num * 10) + (ch[r6] - '0')) * 10;
                int num6 = (num5 + (ch[r6] - '0')) * 10;
                int off2 = off + 1 + 1 + 1;
                return ((num6 + (ch[off2] - '0')) * 10) + (ch[off2 + 1] - '0');
            }
        }
        if (len > 1) {
            int off3 = off + 1;
            int num7 = (num * 10) + (ch[off3] - '0');
            if (len > 2) {
                int off4 = off3 + 1;
                int num8 = (num7 * 10) + (ch[off4] - '0');
                if (len > 3) {
                    return (num8 * 10) + (ch[off4 + 1] - '0');
                }
                return num8;
            }
            return num7;
        }
        return num;
    }

    public static int parseInt(String s) {
        int offset;
        char c = s.charAt(0);
        int len = s.length();
        boolean neg = c == '-';
        int offset2 = 1;
        if (neg) {
            if (len == 1 || len > 10) {
                int offset3 = Integer.parseInt(s);
                return offset3;
            }
            int offset4 = 1 + 1;
            c = s.charAt(1);
            offset2 = offset4;
        } else if (len > 9) {
            return Integer.parseInt(s);
        }
        if (c > '9' || c < '0') {
            return Integer.parseInt(s);
        }
        int num = c - '0';
        if (offset2 < len) {
            int offset5 = offset2 + 1;
            char c2 = s.charAt(offset2);
            if (c2 > '9' || c2 < '0') {
                return Integer.parseInt(s);
            }
            num = (num * 10) + (c2 - '0');
            if (offset5 < len) {
                int offset6 = offset5 + 1;
                char c3 = s.charAt(offset5);
                if (c3 > '9' || c3 < '0') {
                    return Integer.parseInt(s);
                }
                num = (num * 10) + (c3 - '0');
                if (offset6 < len) {
                    do {
                        offset = offset6 + 1;
                        char c4 = s.charAt(offset6);
                        if (c4 > '9' || c4 < '0') {
                            return Integer.parseInt(s);
                        }
                        num = (num * 10) + (c4 - '0');
                        offset6 = offset;
                    } while (offset < len);
                }
            }
        }
        return neg ? -num : num;
    }

    public static long parseLong(char[] ch, int off, int len) {
        int len1 = len - 9;
        long val = parseInt(ch, off, len1) * L_BILLION;
        return parseInt(ch, off + len1, 9) + val;
    }

    public static long parseLong(String s) {
        int length = s.length();
        if (length <= 9) {
            return parseInt(s);
        }
        return Long.parseLong(s);
    }

    public static boolean inLongRange(char[] ch, int off, int len, boolean negative) {
        String cmpStr = negative ? MIN_LONG_STR_NO_SIGN : MAX_LONG_STR;
        int cmpLen = cmpStr.length();
        if (len < cmpLen) {
            return true;
        }
        if (len > cmpLen) {
            return false;
        }
        for (int i = 0; i < cmpLen; i++) {
            int diff = ch[off + i] - cmpStr.charAt(i);
            if (diff != 0) {
                if (diff < 0) {
                    return true;
                }
                return false;
            }
        }
        return true;
    }

    public static boolean inLongRange(String s, boolean negative) {
        String cmp = negative ? MIN_LONG_STR_NO_SIGN : MAX_LONG_STR;
        int cmpLen = cmp.length();
        int alen = s.length();
        if (alen < cmpLen) {
            return true;
        }
        if (alen > cmpLen) {
            return false;
        }
        for (int i = 0; i < cmpLen; i++) {
            int diff = s.charAt(i) - cmp.charAt(i);
            if (diff != 0) {
                if (diff < 0) {
                    return true;
                }
                return false;
            }
        }
        return true;
    }

    public static int parseAsInt(String s, int def) {
        if (s == null) {
            return def;
        }
        String s2 = s.trim();
        int len = s2.length();
        if (len == 0) {
            return def;
        }
        int i = 0;
        if (0 < len) {
            char c = s2.charAt(0);
            if (c == '+') {
                s2 = s2.substring(1);
                len = s2.length();
            } else if (c == '-') {
                i = 0 + 1;
            }
        }
        while (i < len) {
            char c2 = s2.charAt(i);
            if (c2 <= '9' && c2 >= '0') {
                i++;
            } else {
                try {
                    return (int) parseDouble(s2);
                } catch (NumberFormatException e) {
                    return def;
                }
            }
        }
        try {
            return Integer.parseInt(s2);
        } catch (NumberFormatException e2) {
            return def;
        }
    }

    public static long parseAsLong(String s, long def) {
        if (s == null) {
            return def;
        }
        String s2 = s.trim();
        int len = s2.length();
        if (len == 0) {
            return def;
        }
        int i = 0;
        if (0 < len) {
            char c = s2.charAt(0);
            if (c == '+') {
                s2 = s2.substring(1);
                len = s2.length();
            } else if (c == '-') {
                i = 0 + 1;
            }
        }
        while (i < len) {
            char c2 = s2.charAt(i);
            if (c2 <= '9' && c2 >= '0') {
                i++;
            } else {
                try {
                    return (long) parseDouble(s2);
                } catch (NumberFormatException e) {
                    return def;
                }
            }
        }
        try {
            return Long.parseLong(s2);
        } catch (NumberFormatException e2) {
            return def;
        }
    }

    public static double parseAsDouble(String s, double def) {
        if (s == null) {
            return def;
        }
        String s2 = s.trim();
        int len = s2.length();
        if (len == 0) {
            return def;
        }
        try {
            return parseDouble(s2);
        } catch (NumberFormatException e) {
            return def;
        }
    }

    public static double parseDouble(String s) throws NumberFormatException {
        if (NASTY_SMALL_DOUBLE.equals(s)) {
            return Double.MIN_VALUE;
        }
        return Double.parseDouble(s);
    }

    public static BigDecimal parseBigDecimal(String s) throws NumberFormatException {
        try {
            return new BigDecimal(s);
        } catch (NumberFormatException e) {
            throw _badBD(s);
        }
    }

    public static BigDecimal parseBigDecimal(char[] b) throws NumberFormatException {
        return parseBigDecimal(b, 0, b.length);
    }

    public static BigDecimal parseBigDecimal(char[] b, int off, int len) throws NumberFormatException {
        try {
            return new BigDecimal(b, off, len);
        } catch (NumberFormatException e) {
            throw _badBD(new String(b, off, len));
        }
    }

    private static NumberFormatException _badBD(String s) {
        return new NumberFormatException("Value \"" + s + "\" can not be represented as BigDecimal");
    }
}
