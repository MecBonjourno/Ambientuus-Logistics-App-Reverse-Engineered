package org.apache.commons.lang.math;

import androidx.camera.video.AudioStats;
import java.math.BigDecimal;
import java.math.BigInteger;
import org.apache.commons.lang.StringUtils;

/* carregado de: classes17.dex */
public class NumberUtils {
    public static final Long LONG_ZERO = new Long(0);
    public static final Long LONG_ONE = new Long(1);
    public static final Long LONG_MINUS_ONE = new Long(-1);
    public static final Integer INTEGER_ZERO = new Integer(0);
    public static final Integer INTEGER_ONE = new Integer(1);
    public static final Integer INTEGER_MINUS_ONE = new Integer(-1);
    public static final Short SHORT_ZERO = new Short((short) 0);
    public static final Short SHORT_ONE = new Short((short) 1);
    public static final Short SHORT_MINUS_ONE = new Short((short) -1);
    public static final Byte BYTE_ZERO = new Byte((byte) 0);
    public static final Byte BYTE_ONE = new Byte((byte) 1);
    public static final Byte BYTE_MINUS_ONE = new Byte((byte) -1);
    public static final Double DOUBLE_ZERO = new Double(AudioStats.AUDIO_AMPLITUDE_NONE);
    public static final Double DOUBLE_ONE = new Double(1.0d);
    public static final Double DOUBLE_MINUS_ONE = new Double(-1.0d);
    public static final Float FLOAT_ZERO = new Float(0.0f);
    public static final Float FLOAT_ONE = new Float(1.0f);
    public static final Float FLOAT_MINUS_ONE = new Float(-1.0f);

    public static int stringToInt(String str) {
        return toInt(str);
    }

    public static int toInt(String str) {
        return toInt(str, 0);
    }

    public static int stringToInt(String str, int defaultValue) {
        return toInt(str, defaultValue);
    }

    public static int toInt(String str, int defaultValue) {
        if (str == null) {
            return defaultValue;
        }
        try {
            return Integer.parseInt(str);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    public static long toLong(String str) {
        return toLong(str, 0L);
    }

    public static long toLong(String str, long defaultValue) {
        if (str == null) {
            return defaultValue;
        }
        try {
            return Long.parseLong(str);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    public static float toFloat(String str) {
        return toFloat(str, 0.0f);
    }

    public static float toFloat(String str, float defaultValue) {
        if (str == null) {
            return defaultValue;
        }
        try {
            return Float.parseFloat(str);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    public static double toDouble(String str) {
        return toDouble(str, AudioStats.AUDIO_AMPLITUDE_NONE);
    }

    public static double toDouble(String str, double defaultValue) {
        if (str == null) {
            return defaultValue;
        }
        try {
            return Double.parseDouble(str);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    /* JADX WARN: não é possível corrigir a ordem dos casos do switch; parte do código será duplicada */
    /* JADX WARN: região duplicada removida para o bloco: B:65:0x0121 A[Catch: NumberFormatException -> 0x0130, TRY_LEAVE, TryCatch #7 {NumberFormatException -> 0x0130, blocks: (B:63:0x0117, B:65:0x0121), top: B:62:0x0117 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.Number createNumber(java.lang.String r18) throws java.lang.NumberFormatException {
        /*
            Method dump skipped, instructions count: 484
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang.math.NumberUtils.createNumber(java.lang.String):java.lang.Number");
    }

    private static boolean isAllZeros(String str) {
        if (str == null) {
            return true;
        }
        for (int i = str.length() - 1; i >= 0; i--) {
            if (str.charAt(i) != '0') {
                return false;
            }
        }
        int i2 = str.length();
        return i2 > 0;
    }

    public static Float createFloat(String str) {
        if (str == null) {
            return null;
        }
        return Float.valueOf(str);
    }

    public static Double createDouble(String str) {
        if (str == null) {
            return null;
        }
        return Double.valueOf(str);
    }

    public static Integer createInteger(String str) {
        if (str == null) {
            return null;
        }
        return Integer.decode(str);
    }

    public static Long createLong(String str) {
        if (str == null) {
            return null;
        }
        return Long.valueOf(str);
    }

    public static BigInteger createBigInteger(String str) {
        if (str == null) {
            return null;
        }
        return new BigInteger(str);
    }

    public static BigDecimal createBigDecimal(String str) {
        if (str == null) {
            return null;
        }
        if (StringUtils.isBlank(str)) {
            throw new NumberFormatException("A blank string is not a valid number");
        }
        return new BigDecimal(str);
    }

    public static long min(long[] array) {
        if (array == null) {
            throw new IllegalArgumentException("The Array must not be null");
        }
        if (array.length == 0) {
            throw new IllegalArgumentException("Array cannot be empty.");
        }
        long min = array[0];
        for (int i = 1; i < array.length; i++) {
            if (array[i] < min) {
                min = array[i];
            }
        }
        return min;
    }

    public static int min(int[] array) {
        if (array == null) {
            throw new IllegalArgumentException("The Array must not be null");
        }
        if (array.length == 0) {
            throw new IllegalArgumentException("Array cannot be empty.");
        }
        int min = array[0];
        for (int j = 1; j < array.length; j++) {
            if (array[j] < min) {
                min = array[j];
            }
        }
        return min;
    }

    public static short min(short[] array) {
        if (array == null) {
            throw new IllegalArgumentException("The Array must not be null");
        }
        if (array.length == 0) {
            throw new IllegalArgumentException("Array cannot be empty.");
        }
        short min = array[0];
        for (int i = 1; i < array.length; i++) {
            if (array[i] < min) {
                min = array[i];
            }
        }
        return min;
    }

    public static byte min(byte[] array) {
        if (array == null) {
            throw new IllegalArgumentException("The Array must not be null");
        }
        if (array.length == 0) {
            throw new IllegalArgumentException("Array cannot be empty.");
        }
        byte min = array[0];
        for (int i = 1; i < array.length; i++) {
            if (array[i] < min) {
                min = array[i];
            }
        }
        return min;
    }

    public static double min(double[] array) {
        if (array == null) {
            throw new IllegalArgumentException("The Array must not be null");
        }
        if (array.length == 0) {
            throw new IllegalArgumentException("Array cannot be empty.");
        }
        double min = array[0];
        for (int i = 1; i < array.length; i++) {
            if (!Double.isNaN(array[i])) {
                if (array[i] < min) {
                    min = array[i];
                }
            } else {
                return Double.NaN;
            }
        }
        return min;
    }

    public static float min(float[] array) {
        if (array == null) {
            throw new IllegalArgumentException("The Array must not be null");
        }
        if (array.length == 0) {
            throw new IllegalArgumentException("Array cannot be empty.");
        }
        float min = array[0];
        for (int i = 1; i < array.length; i++) {
            if (!Float.isNaN(array[i])) {
                if (array[i] < min) {
                    min = array[i];
                }
            } else {
                return Float.NaN;
            }
        }
        return min;
    }

    public static long max(long[] array) {
        if (array == null) {
            throw new IllegalArgumentException("The Array must not be null");
        }
        if (array.length == 0) {
            throw new IllegalArgumentException("Array cannot be empty.");
        }
        long max = array[0];
        for (int j = 1; j < array.length; j++) {
            if (array[j] > max) {
                max = array[j];
            }
        }
        return max;
    }

    public static int max(int[] array) {
        if (array == null) {
            throw new IllegalArgumentException("The Array must not be null");
        }
        if (array.length == 0) {
            throw new IllegalArgumentException("Array cannot be empty.");
        }
        int max = array[0];
        for (int j = 1; j < array.length; j++) {
            if (array[j] > max) {
                max = array[j];
            }
        }
        return max;
    }

    public static short max(short[] array) {
        if (array == null) {
            throw new IllegalArgumentException("The Array must not be null");
        }
        if (array.length == 0) {
            throw new IllegalArgumentException("Array cannot be empty.");
        }
        short max = array[0];
        for (int i = 1; i < array.length; i++) {
            if (array[i] > max) {
                max = array[i];
            }
        }
        return max;
    }

    public static byte max(byte[] array) {
        if (array == null) {
            throw new IllegalArgumentException("The Array must not be null");
        }
        if (array.length == 0) {
            throw new IllegalArgumentException("Array cannot be empty.");
        }
        byte max = array[0];
        for (int i = 1; i < array.length; i++) {
            if (array[i] > max) {
                max = array[i];
            }
        }
        return max;
    }

    public static double max(double[] array) {
        if (array == null) {
            throw new IllegalArgumentException("The Array must not be null");
        }
        if (array.length == 0) {
            throw new IllegalArgumentException("Array cannot be empty.");
        }
        double max = array[0];
        for (int j = 1; j < array.length; j++) {
            if (!Double.isNaN(array[j])) {
                if (array[j] > max) {
                    max = array[j];
                }
            } else {
                return Double.NaN;
            }
        }
        return max;
    }

    public static float max(float[] array) {
        if (array == null) {
            throw new IllegalArgumentException("The Array must not be null");
        }
        if (array.length == 0) {
            throw new IllegalArgumentException("Array cannot be empty.");
        }
        float max = array[0];
        for (int j = 1; j < array.length; j++) {
            if (!Float.isNaN(array[j])) {
                if (array[j] > max) {
                    max = array[j];
                }
            } else {
                return Float.NaN;
            }
        }
        return max;
    }

    public static long min(long a, long b, long c) {
        if (b < a) {
            a = b;
        }
        if (c < a) {
            return c;
        }
        return a;
    }

    public static int min(int a, int b, int c) {
        if (b < a) {
            a = b;
        }
        if (c < a) {
            return c;
        }
        return a;
    }

    public static short min(short a, short b, short c) {
        if (b < a) {
            a = b;
        }
        if (c < a) {
            return c;
        }
        return a;
    }

    public static byte min(byte a, byte b, byte c) {
        if (b < a) {
            a = b;
        }
        if (c < a) {
            return c;
        }
        return a;
    }

    public static double min(double a, double b, double c) {
        return Math.min(Math.min(a, b), c);
    }

    public static float min(float a, float b, float c) {
        return Math.min(Math.min(a, b), c);
    }

    public static long max(long a, long b, long c) {
        if (b > a) {
            a = b;
        }
        if (c > a) {
            return c;
        }
        return a;
    }

    public static int max(int a, int b, int c) {
        if (b > a) {
            a = b;
        }
        if (c > a) {
            return c;
        }
        return a;
    }

    public static short max(short a, short b, short c) {
        if (b > a) {
            a = b;
        }
        if (c > a) {
            return c;
        }
        return a;
    }

    public static byte max(byte a, byte b, byte c) {
        if (b > a) {
            a = b;
        }
        if (c > a) {
            return c;
        }
        return a;
    }

    public static double max(double a, double b, double c) {
        return Math.max(Math.max(a, b), c);
    }

    public static float max(float a, float b, float c) {
        return Math.max(Math.max(a, b), c);
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
        if (StringUtils.isEmpty(str)) {
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
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang.math.NumberUtils.isNumber(java.lang.String):boolean");
    }
}
