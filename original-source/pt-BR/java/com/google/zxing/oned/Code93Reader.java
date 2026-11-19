package com.google.zxing.oned;

import androidx.constraintlayout.core.motion.utils.TypedValues;
import com.google.api.client.http.HttpStatusCodes;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.ChecksumException;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitArray;
import java.util.Arrays;
import java.util.Map;

/* carregado de: classes16.dex */
public final class Code93Reader extends OneDReader {
    private static final String ALPHABET_STRING = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. $/+%abcd*";
    private static final char[] ALPHABET = ALPHABET_STRING.toCharArray();
    private static final int[] CHARACTER_ENCODINGS = {276, 328, 324, 322, 296, 292, 290, 336, 274, 266, TypedValues.CycleType.TYPE_WAVE_OFFSET, TypedValues.CycleType.TYPE_EASING, 418, HttpStatusCodes.STATUS_CODE_NOT_FOUND, TypedValues.CycleType.TYPE_VISIBILITY, 394, 360, 356, 354, 308, 282, 344, 332, 326, 300, 278, 436, 434, 428, 422, 406, 410, 364, 358, 310, 314, 302, 468, 466, 458, 366, 374, 430, 294, 474, 470, 306, 350};
    private static final int ASTERISK_ENCODING = CHARACTER_ENCODINGS[47];
    private final StringBuilder decodeRowResult = new StringBuilder(20);
    private final int[] counters = new int[6];

    @Override // com.google.zxing.oned.OneDReader
    public Result decodeRow(int rowNumber, BitArray row, Map<DecodeHintType, ?> hints) throws NotFoundException, ChecksumException, FormatException {
        BitArray bitArray = row;
        int[] start = findAsteriskPattern(bitArray);
        int nextStart = bitArray.getNextSet(start[1]);
        int end = bitArray.getSize();
        int[] theCounters = this.counters;
        Arrays.fill(theCounters, 0);
        StringBuilder result = this.decodeRowResult;
        result.setLength(0);
        while (true) {
            recordPattern(bitArray, nextStart, theCounters);
            int pattern = toPattern(theCounters);
            if (pattern < 0) {
                throw NotFoundException.getNotFoundInstance();
            }
            char decodedChar = patternToChar(pattern);
            result.append(decodedChar);
            int lastStart = nextStart;
            for (int counter : theCounters) {
                nextStart += counter;
            }
            nextStart = bitArray.getNextSet(nextStart);
            if (decodedChar == '*') {
                result.deleteCharAt(result.length() - 1);
                int lastPatternSize = 0;
                for (int counter2 : theCounters) {
                    lastPatternSize += counter2;
                }
                if (nextStart == end || !bitArray.get(nextStart)) {
                    throw NotFoundException.getNotFoundInstance();
                }
                if (result.length() < 2) {
                    throw NotFoundException.getNotFoundInstance();
                }
                checkChecksums(result);
                result.setLength(result.length() - 2);
                String resultString = decodeExtended(result);
                float left = (start[1] + start[0]) / 2.0f;
                float right = lastStart + (lastPatternSize / 2.0f);
                return new Result(resultString, null, new ResultPoint[]{new ResultPoint(left, rowNumber), new ResultPoint(right, rowNumber)}, BarcodeFormat.CODE_93);
            }
            bitArray = row;
        }
    }

    private int[] findAsteriskPattern(BitArray row) throws NotFoundException {
        int width = row.getSize();
        int rowOffset = row.getNextSet(0);
        Arrays.fill(this.counters, 0);
        int[] theCounters = this.counters;
        int patternStart = rowOffset;
        boolean isWhite = false;
        int patternLength = theCounters.length;
        int counterPosition = 0;
        for (int i = rowOffset; i < width; i++) {
            if (row.get(i) ^ isWhite) {
                theCounters[counterPosition] = theCounters[counterPosition] + 1;
            } else {
                if (counterPosition == patternLength - 1) {
                    if (toPattern(theCounters) == ASTERISK_ENCODING) {
                        return new int[]{patternStart, i};
                    }
                    patternStart += theCounters[0] + theCounters[1];
                    System.arraycopy(theCounters, 2, theCounters, 0, patternLength - 2);
                    theCounters[patternLength - 2] = 0;
                    theCounters[patternLength - 1] = 0;
                    counterPosition--;
                } else {
                    counterPosition++;
                }
                theCounters[counterPosition] = 1;
                isWhite = isWhite ? false : true;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static int toPattern(int[] counters) {
        int max = counters.length;
        int sum = 0;
        for (int counter : counters) {
            sum += counter;
        }
        int pattern = 0;
        for (int i = 0; i < max; i++) {
            int scaled = Math.round((counters[i] * 9.0f) / sum);
            if (scaled < 1 || scaled > 4) {
                return -1;
            }
            if ((i & 1) == 0) {
                for (int j = 0; j < scaled; j++) {
                    pattern = (pattern << 1) | 1;
                }
            } else {
                pattern <<= scaled;
            }
        }
        return pattern;
    }

    private static char patternToChar(int pattern) throws NotFoundException {
        for (int i = 0; i < CHARACTER_ENCODINGS.length; i++) {
            if (CHARACTER_ENCODINGS[i] == pattern) {
                return ALPHABET[i];
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    /* JADX WARN: não é possível corrigir a ordem dos casos do switch; parte do código será duplicada */
    private static String decodeExtended(CharSequence encoded) throws FormatException {
        int length = encoded.length();
        StringBuilder decoded = new StringBuilder(length);
        int i = 0;
        while (i < length) {
            char c = encoded.charAt(i);
            if (c >= 'a' && c <= 'd') {
                if (i >= length - 1) {
                    throw FormatException.getFormatInstance();
                }
                char next = encoded.charAt(i + 1);
                char decodedChar = 0;
                switch (c) {
                    case 'a':
                        if (next >= 'A' && next <= 'Z') {
                            decodedChar = (char) (next - '@');
                            decoded.append(decodedChar);
                            i++;
                            break;
                        } else {
                            throw FormatException.getFormatInstance();
                        }
                    case 'b':
                        if (next >= 'A' && next <= 'E') {
                            decodedChar = (char) (next - '&');
                        } else if (next >= 'F' && next <= 'W') {
                            decodedChar = (char) (next - 11);
                        } else {
                            throw FormatException.getFormatInstance();
                        }
                        decoded.append(decodedChar);
                        i++;
                        break;
                    case 'c':
                        if (next >= 'A' && next <= 'O') {
                            decodedChar = (char) (next - ' ');
                        } else if (next == 'Z') {
                            decodedChar = ':';
                        } else {
                            throw FormatException.getFormatInstance();
                        }
                        decoded.append(decodedChar);
                        i++;
                        break;
                    case 'd':
                        if (next >= 'A' && next <= 'Z') {
                            decodedChar = (char) (next + ' ');
                            decoded.append(decodedChar);
                            i++;
                            break;
                        } else {
                            throw FormatException.getFormatInstance();
                        }
                    default:
                        decoded.append(decodedChar);
                        i++;
                        break;
                }
            } else {
                decoded.append(c);
            }
            i++;
        }
        return decoded.toString();
    }

    private static void checkChecksums(CharSequence result) throws ChecksumException {
        int length = result.length();
        checkOneChecksum(result, length - 2, 20);
        checkOneChecksum(result, length - 1, 15);
    }

    private static void checkOneChecksum(CharSequence result, int checkPosition, int weightMax) throws ChecksumException {
        int weight = 1;
        int total = 0;
        for (int i = checkPosition - 1; i >= 0; i--) {
            total += ALPHABET_STRING.indexOf(result.charAt(i)) * weight;
            weight++;
            if (weight > weightMax) {
                weight = 1;
            }
        }
        int i2 = result.charAt(checkPosition);
        if (i2 != ALPHABET[total % 47]) {
            throw ChecksumException.getChecksumInstance();
        }
    }
}
