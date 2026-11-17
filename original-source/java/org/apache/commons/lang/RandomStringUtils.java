package org.apache.commons.lang;

import com.fasterxml.jackson.core.base.GeneratorBase;
import java.util.Random;
import kotlinx.coroutines.scheduling.WorkQueueKt;

/* loaded from: classes17.dex */
public class RandomStringUtils {
    private static final Random RANDOM = new Random();

    public static String random(int count) {
        return random(count, false, false);
    }

    public static String randomAscii(int count) {
        return random(count, 32, WorkQueueKt.MASK, false, false);
    }

    public static String randomAlphabetic(int count) {
        return random(count, true, false);
    }

    public static String randomAlphanumeric(int count) {
        return random(count, true, true);
    }

    public static String randomNumeric(int count) {
        return random(count, false, true);
    }

    public static String random(int count, boolean letters, boolean numbers) {
        return random(count, 0, 0, letters, numbers);
    }

    public static String random(int count, int start, int end, boolean letters, boolean numbers) {
        return random(count, start, end, letters, numbers, null, RANDOM);
    }

    public static String random(int count, int start, int end, boolean letters, boolean numbers, char[] chars) {
        return random(count, start, end, letters, numbers, chars, RANDOM);
    }

    public static String random(int count, int start, int end, boolean letters, boolean numbers, char[] chars, Random random) {
        char ch;
        if (count == 0) {
            return "";
        }
        if (count < 0) {
            throw new IllegalArgumentException(new StringBuffer().append("Requested random string length ").append(count).append(" is less than 0.").toString());
        }
        if (start == 0 && end == 0) {
            end = 123;
            start = 32;
            if (!letters && !numbers) {
                start = 0;
                end = Integer.MAX_VALUE;
            }
        }
        char[] buffer = new char[count];
        int gap = end - start;
        while (true) {
            int count2 = count - 1;
            if (count != 0) {
                if (chars == null) {
                    ch = (char) (random.nextInt(gap) + start);
                } else {
                    ch = chars[random.nextInt(gap) + start];
                }
                if (!(letters && Character.isLetter(ch)) && (!(numbers && Character.isDigit(ch)) && (letters || numbers))) {
                    count = count2 + 1;
                } else if (ch >= 56320 && ch <= 57343) {
                    if (count2 == 0) {
                        count = count2 + 1;
                    } else {
                        buffer[count2] = ch;
                        int count3 = count2 - 1;
                        buffer[count3] = (char) (random.nextInt(128) + GeneratorBase.SURR1_FIRST);
                        count = count3;
                    }
                } else if (ch >= 55296 && ch <= 56191) {
                    if (count2 == 0) {
                        count = count2 + 1;
                    } else {
                        buffer[count2] = (char) (random.nextInt(128) + GeneratorBase.SURR2_FIRST);
                        int count4 = count2 - 1;
                        buffer[count4] = ch;
                        count = count4;
                    }
                } else if (ch >= 56192 && ch <= 56319) {
                    count = count2 + 1;
                } else {
                    buffer[count2] = ch;
                    count = count2;
                }
            } else {
                return new String(buffer);
            }
        }
    }

    public static String random(int count, String chars) {
        if (chars == null) {
            return random(count, 0, 0, false, false, null, RANDOM);
        }
        return random(count, chars.toCharArray());
    }

    public static String random(int count, char[] chars) {
        if (chars == null) {
            return random(count, 0, 0, false, false, null, RANDOM);
        }
        return random(count, 0, chars.length, false, false, chars, RANDOM);
    }
}
