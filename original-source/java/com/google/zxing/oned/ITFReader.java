package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitArray;
import java.util.Map;

/* loaded from: classes16.dex */
public final class ITFReader extends OneDReader {
    private static final float MAX_AVG_VARIANCE = 0.38f;
    private static final float MAX_INDIVIDUAL_VARIANCE = 0.78f;
    private static final int N = 1;
    private static final int W = 3;
    private int narrowLineWidth = -1;
    private static final int[] DEFAULT_ALLOWED_LENGTHS = {6, 8, 10, 12, 14};
    private static final int[] START_PATTERN = {1, 1, 1, 1};
    private static final int[] END_PATTERN_REVERSED = {1, 1, 3};
    static final int[][] PATTERNS = {new int[]{1, 1, 3, 3, 1}, new int[]{3, 1, 1, 1, 3}, new int[]{1, 3, 1, 1, 3}, new int[]{3, 3, 1, 1, 1}, new int[]{1, 1, 3, 1, 3}, new int[]{3, 1, 3, 1, 1}, new int[]{1, 3, 3, 1, 1}, new int[]{1, 1, 1, 3, 3}, new int[]{3, 1, 1, 3, 1}, new int[]{1, 3, 1, 3, 1}};

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r16v0 */
    /* JADX WARN: Type inference failed for: r16v1 */
    /* JADX WARN: Type inference failed for: r16v4 */
    @Override // com.google.zxing.oned.OneDReader
    public Result decodeRow(int i, BitArray bitArray, Map<DecodeHintType, ?> map) throws FormatException, NotFoundException {
        ?? r16;
        int[] decodeStart = decodeStart(bitArray);
        int[] decodeEnd = decodeEnd(bitArray);
        StringBuilder sb = new StringBuilder(20);
        boolean z = true;
        decodeMiddle(bitArray, decodeStart[1], decodeEnd[0], sb);
        String sb2 = sb.toString();
        int[] iArr = null;
        if (map != null) {
            iArr = (int[]) map.get(DecodeHintType.ALLOWED_LENGTHS);
        }
        if (iArr == null) {
            iArr = DEFAULT_ALLOWED_LENGTHS;
        }
        int length = sb2.length();
        boolean z2 = false;
        int i2 = 0;
        int length2 = iArr.length;
        int i3 = 0;
        while (true) {
            if (i3 >= length2) {
                r16 = z;
                break;
            }
            boolean z3 = z;
            int i4 = iArr[i3];
            if (length == i4) {
                z2 = true;
                r16 = z3;
                break;
            }
            if (i4 > i2) {
                i2 = i4;
            }
            i3++;
            z = z3 ? 1 : 0;
        }
        if (!z2 && length > i2) {
            z2 = true;
        }
        if (!z2) {
            throw FormatException.getFormatInstance();
        }
        ResultPoint[] resultPointArr = new ResultPoint[2];
        resultPointArr[0] = new ResultPoint(decodeStart[r16], i);
        resultPointArr[r16] = new ResultPoint(decodeEnd[0], i);
        return new Result(sb2, null, resultPointArr, BarcodeFormat.ITF);
    }

    private static void decodeMiddle(BitArray row, int payloadStart, int payloadEnd, StringBuilder resultString) throws NotFoundException {
        int[] counterDigitPair = new int[10];
        int[] counterBlack = new int[5];
        int[] counterWhite = new int[5];
        while (payloadStart < payloadEnd) {
            recordPattern(row, payloadStart, counterDigitPair);
            for (int k = 0; k < 5; k++) {
                int twoK = k * 2;
                counterBlack[k] = counterDigitPair[twoK];
                counterWhite[k] = counterDigitPair[twoK + 1];
            }
            int bestMatch = decodeDigit(counterBlack);
            resultString.append((char) (bestMatch + 48));
            int bestMatch2 = decodeDigit(counterWhite);
            resultString.append((char) (bestMatch2 + 48));
            for (int counterDigit : counterDigitPair) {
                payloadStart += counterDigit;
            }
        }
    }

    int[] decodeStart(BitArray row) throws NotFoundException {
        int endStart = skipWhiteSpace(row);
        int[] startPattern = findGuardPattern(row, endStart, START_PATTERN);
        this.narrowLineWidth = (startPattern[1] - startPattern[0]) / 4;
        validateQuietZone(row, startPattern[0]);
        return startPattern;
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x001d, code lost:
    
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void validateQuietZone(com.google.zxing.common.BitArray r4, int r5) throws com.google.zxing.NotFoundException {
        /*
            r3 = this;
            int r0 = r3.narrowLineWidth
            int r0 = r0 * 10
            if (r0 >= r5) goto L8
            r1 = r0
            goto L9
        L8:
            r1 = r5
        L9:
            int r0 = r5 + (-1)
        Lb:
            if (r1 <= 0) goto L1b
            if (r0 < 0) goto L1b
            boolean r2 = r4.get(r0)
            if (r2 == 0) goto L16
            goto L1b
        L16:
            int r1 = r1 + (-1)
            int r0 = r0 + (-1)
            goto Lb
        L1b:
            if (r1 != 0) goto L1e
            return
        L1e:
            com.google.zxing.NotFoundException r0 = com.google.zxing.NotFoundException.getNotFoundInstance()
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.zxing.oned.ITFReader.validateQuietZone(com.google.zxing.common.BitArray, int):void");
    }

    private static int skipWhiteSpace(BitArray row) throws NotFoundException {
        int width = row.getSize();
        int endStart = row.getNextSet(0);
        if (endStart == width) {
            throw NotFoundException.getNotFoundInstance();
        }
        return endStart;
    }

    int[] decodeEnd(BitArray row) throws NotFoundException {
        row.reverse();
        try {
            int endStart = skipWhiteSpace(row);
            int[] endPattern = findGuardPattern(row, endStart, END_PATTERN_REVERSED);
            validateQuietZone(row, endPattern[0]);
            int temp = endPattern[0];
            endPattern[0] = row.getSize() - endPattern[1];
            endPattern[1] = row.getSize() - temp;
            return endPattern;
        } finally {
            row.reverse();
        }
    }

    private static int[] findGuardPattern(BitArray row, int rowOffset, int[] pattern) throws NotFoundException {
        int patternLength = pattern.length;
        int[] counters = new int[patternLength];
        int width = row.getSize();
        boolean isWhite = false;
        int counterPosition = 0;
        int patternStart = rowOffset;
        for (int x = rowOffset; x < width; x++) {
            if (row.get(x) ^ isWhite) {
                counters[counterPosition] = counters[counterPosition] + 1;
            } else {
                if (counterPosition == patternLength - 1) {
                    if (patternMatchVariance(counters, pattern, MAX_INDIVIDUAL_VARIANCE) < 0.38f) {
                        return new int[]{patternStart, x};
                    }
                    patternStart += counters[0] + counters[1];
                    System.arraycopy(counters, 2, counters, 0, patternLength - 2);
                    counters[patternLength - 2] = 0;
                    counters[patternLength - 1] = 0;
                    counterPosition--;
                } else {
                    counterPosition++;
                }
                counters[counterPosition] = 1;
                isWhite = isWhite ? false : true;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static int decodeDigit(int[] counters) throws NotFoundException {
        float bestVariance = 0.38f;
        int bestMatch = -1;
        int max = PATTERNS.length;
        for (int i = 0; i < max; i++) {
            int[] pattern = PATTERNS[i];
            float variance = patternMatchVariance(counters, pattern, MAX_INDIVIDUAL_VARIANCE);
            if (variance < bestVariance) {
                bestVariance = variance;
                bestMatch = i;
            }
        }
        if (bestMatch >= 0) {
            return bestMatch;
        }
        throw NotFoundException.getNotFoundInstance();
    }
}
