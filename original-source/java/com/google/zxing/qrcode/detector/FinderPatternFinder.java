package com.google.zxing.qrcode.detector;

import com.google.zxing.DecodeHintType;
import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.ResultPointCallback;
import com.google.zxing.common.BitMatrix;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes16.dex */
public class FinderPatternFinder {
    private static final int CENTER_QUORUM = 2;
    protected static final int MAX_MODULES = 57;
    protected static final int MIN_SKIP = 3;
    private final int[] crossCheckStateCount;
    private boolean hasSkipped;
    private final BitMatrix image;
    private final List<FinderPattern> possibleCenters;
    private final ResultPointCallback resultPointCallback;

    public FinderPatternFinder(BitMatrix image) {
        this(image, null);
    }

    public FinderPatternFinder(BitMatrix image, ResultPointCallback resultPointCallback) {
        this.image = image;
        this.possibleCenters = new ArrayList();
        this.crossCheckStateCount = new int[5];
        this.resultPointCallback = resultPointCallback;
    }

    protected final BitMatrix getImage() {
        return this.image;
    }

    protected final List<FinderPattern> getPossibleCenters() {
        return this.possibleCenters;
    }

    final FinderPatternInfo find(Map<DecodeHintType, ?> hints) throws NotFoundException {
        int i;
        char c;
        int currentState = 1;
        int i2 = 0;
        boolean tryHarder = hints != null && hints.containsKey(DecodeHintType.TRY_HARDER);
        boolean pureBarcode = hints != null && hints.containsKey(DecodeHintType.PURE_BARCODE);
        int maxI = this.image.getHeight();
        int maxJ = this.image.getWidth();
        int iSkip = (maxI * 3) / 228;
        char c2 = 3;
        if (iSkip < 3 || tryHarder) {
            iSkip = 3;
        }
        boolean done = false;
        int[] stateCount = new int[5];
        int i3 = iSkip - 1;
        while (i3 < maxI && !done) {
            stateCount[i2] = i2;
            stateCount[currentState] = i2;
            char c3 = 2;
            stateCount[2] = i2;
            stateCount[c2] = i2;
            stateCount[4] = i2;
            int currentState2 = 0;
            int i4 = i2;
            int j = 0;
            while (j < maxJ) {
                char c4 = c2;
                if (this.image.get(j, i3)) {
                    if ((currentState2 & 1) == currentState) {
                        currentState2++;
                    }
                    stateCount[currentState2] = stateCount[currentState2] + currentState;
                    i = currentState;
                    c = c3;
                } else if ((currentState2 & 1) == 0) {
                    if (currentState2 == 4) {
                        if (foundPatternCross(stateCount)) {
                            boolean confirmed = handlePossibleCenter(stateCount, i3, j, pureBarcode);
                            if (confirmed) {
                                iSkip = 2;
                                i = currentState;
                                if (this.hasSkipped) {
                                    done = haveMultiplyConfirmedCenters();
                                    c = c3;
                                } else {
                                    int rowSkip = findRowSkip();
                                    c = c3;
                                    if (rowSkip > stateCount[c]) {
                                        i3 += (rowSkip - stateCount[c]) - 2;
                                        j = maxJ - 1;
                                    }
                                }
                                stateCount[i4] = i4;
                                stateCount[i] = i4;
                                stateCount[c] = i4;
                                stateCount[c4] = i4;
                                stateCount[4] = i4;
                                currentState2 = 0;
                            } else {
                                i = currentState;
                                c = c3;
                                stateCount[i4] = stateCount[c];
                                stateCount[i] = stateCount[c4];
                                stateCount[c] = stateCount[4];
                                stateCount[c4] = i;
                                stateCount[4] = i4;
                                currentState2 = 3;
                            }
                        } else {
                            i = currentState;
                            c = c3;
                            stateCount[i4] = stateCount[c];
                            stateCount[i] = stateCount[c4];
                            stateCount[c] = stateCount[4];
                            stateCount[c4] = i;
                            stateCount[4] = i4;
                            currentState2 = 3;
                        }
                    } else {
                        i = currentState;
                        c = c3;
                        currentState2++;
                        stateCount[currentState2] = stateCount[currentState2] + 1;
                    }
                } else {
                    i = currentState;
                    c = c3;
                    stateCount[currentState2] = stateCount[currentState2] + 1;
                }
                j++;
                c2 = c4;
                currentState = i;
                c3 = c;
            }
            int i5 = currentState;
            char c5 = c2;
            if (foundPatternCross(stateCount)) {
                boolean confirmed2 = handlePossibleCenter(stateCount, i3, maxJ, pureBarcode);
                if (confirmed2) {
                    int iSkip2 = stateCount[i4];
                    if (!this.hasSkipped) {
                        iSkip = iSkip2;
                    } else {
                        done = haveMultiplyConfirmedCenters();
                        iSkip = iSkip2;
                    }
                }
            }
            i3 += iSkip;
            i2 = i4;
            c2 = c5;
            currentState = i5;
        }
        FinderPattern[] patternInfo = selectBestPatterns();
        ResultPoint.orderBestPatterns(patternInfo);
        return new FinderPatternInfo(patternInfo);
    }

    private static float centerFromEnd(int[] stateCount, int end) {
        return ((end - stateCount[4]) - stateCount[3]) - (stateCount[2] / 2.0f);
    }

    protected static boolean foundPatternCross(int[] stateCount) {
        int totalModuleSize = 0;
        for (int i = 0; i < 5; i++) {
            int count = stateCount[i];
            if (count == 0) {
                return false;
            }
            totalModuleSize += count;
        }
        if (totalModuleSize < 7) {
            return false;
        }
        float moduleSize = totalModuleSize / 7.0f;
        float maxVariance = moduleSize / 2.0f;
        return Math.abs(moduleSize - ((float) stateCount[0])) < maxVariance && Math.abs(moduleSize - ((float) stateCount[1])) < maxVariance && Math.abs((moduleSize * 3.0f) - ((float) stateCount[2])) < 3.0f * maxVariance && Math.abs(moduleSize - ((float) stateCount[3])) < maxVariance && Math.abs(moduleSize - ((float) stateCount[4])) < maxVariance;
    }

    private int[] getCrossCheckStateCount() {
        this.crossCheckStateCount[0] = 0;
        this.crossCheckStateCount[1] = 0;
        this.crossCheckStateCount[2] = 0;
        this.crossCheckStateCount[3] = 0;
        this.crossCheckStateCount[4] = 0;
        return this.crossCheckStateCount;
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x004c, code lost:
    
        if (r18 < r5) goto L85;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0050, code lost:
    
        if (r4[1] <= r19) goto L25;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0054, code lost:
    
        if (r17 < r5) goto L95;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0056, code lost:
    
        if (r18 < r5) goto L97;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0062, code lost:
    
        if (r16.image.get(r18 - r5, r17 - r5) == false) goto L94;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0066, code lost:
    
        if (r4[0] > r19) goto L96;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x0068, code lost:
    
        r4[0] = r4[0] + 1;
        r5 = r5 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x0072, code lost:
    
        if (r4[0] <= r19) goto L35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x0074, code lost:
    
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x0075, code lost:
    
        r9 = r16.image.getHeight();
        r10 = r16.image.getWidth();
        r5 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x0084, code lost:
    
        if ((r17 + r5) >= r9) goto L99;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x0088, code lost:
    
        if ((r18 + r5) >= r10) goto L100;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x0094, code lost:
    
        if (r16.image.get(r18 + r5, r17 + r5) == false) goto L98;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x0096, code lost:
    
        r4[2] = r4[2] + 1;
        r5 = r5 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x00a0, code lost:
    
        if ((r17 + r5) >= r9) goto L84;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x00a4, code lost:
    
        if ((r18 + r5) < r10) goto L48;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x00ab, code lost:
    
        if ((r17 + r5) >= r9) goto L102;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x00af, code lost:
    
        if ((r18 + r5) >= r10) goto L104;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x00bb, code lost:
    
        if (r16.image.get(r18 + r5, r17 + r5) != false) goto L101;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x00bf, code lost:
    
        if (r4[3] >= r19) goto L103;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x00c1, code lost:
    
        r4[3] = r4[3] + 1;
        r5 = r5 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x00cb, code lost:
    
        if ((r17 + r5) >= r9) goto L83;
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x00cf, code lost:
    
        if ((r18 + r5) >= r10) goto L83;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x00d3, code lost:
    
        if (r4[3] < r19) goto L64;
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x00d9, code lost:
    
        if ((r17 + r5) >= r9) goto L106;
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x00dd, code lost:
    
        if ((r18 + r5) >= r10) goto L108;
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x00e9, code lost:
    
        if (r16.image.get(r18 + r5, r17 + r5) == false) goto L105;
     */
    /* JADX WARN: Code restructure failed: missing block: B:72:0x00ed, code lost:
    
        if (r4[4] >= r19) goto L107;
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x00ef, code lost:
    
        r4[4] = r4[4] + 1;
        r5 = r5 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x00f9, code lost:
    
        if (r4[4] < r19) goto L76;
     */
    /* JADX WARN: Code restructure failed: missing block: B:77:0x00fb, code lost:
    
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x00fc, code lost:
    
        r11 = (((r4[0] + r4[1]) + r4[2]) + r4[3]) + r4[4];
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x0112, code lost:
    
        if (java.lang.Math.abs(r11 - r20) >= (r20 * 2)) goto L81;
     */
    /* JADX WARN: Code restructure failed: missing block: B:81:0x0118, code lost:
    
        if (foundPatternCross(r4) == false) goto L81;
     */
    /* JADX WARN: Code restructure failed: missing block: B:82:?, code lost:
    
        return true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:84:0x011c, code lost:
    
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:88:0x011d, code lost:
    
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:92:0x011e, code lost:
    
        return false;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private boolean crossCheckDiagonal(int r17, int r18, int r19, int r20) {
        /*
            Method dump skipped, instructions count: 289
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.zxing.qrcode.detector.FinderPatternFinder.crossCheckDiagonal(int, int, int, int):boolean");
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x003a, code lost:
    
        if (r2[1] <= r14) goto L21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x003f, code lost:
    
        if (r3 < 0) goto L75;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0045, code lost:
    
        if (r0.get(r13, r3) == false) goto L73;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0049, code lost:
    
        if (r2[0] > r14) goto L74;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x004b, code lost:
    
        r2[0] = r2[0] + 1;
        r3 = r3 - 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x0055, code lost:
    
        if (r2[0] <= r14) goto L31;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x0057, code lost:
    
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x0058, code lost:
    
        r3 = r12 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x005a, code lost:
    
        if (r3 >= r1) goto L77;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x0060, code lost:
    
        if (r0.get(r13, r3) == false) goto L76;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x0062, code lost:
    
        r2[2] = r2[2] + 1;
        r3 = r3 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x006a, code lost:
    
        if (r3 != r1) goto L38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x006c, code lost:
    
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x006e, code lost:
    
        if (r3 >= r1) goto L80;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x0074, code lost:
    
        if (r0.get(r13, r3) != false) goto L78;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x0078, code lost:
    
        if (r2[3] >= r14) goto L79;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x007a, code lost:
    
        r2[3] = r2[3] + 1;
        r3 = r3 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x0082, code lost:
    
        if (r3 == r1) goto L66;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x0086, code lost:
    
        if (r2[3] < r14) goto L49;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x008a, code lost:
    
        if (r3 >= r1) goto L83;
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x0090, code lost:
    
        if (r0.get(r13, r3) == false) goto L81;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x0094, code lost:
    
        if (r2[4] >= r14) goto L82;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x0096, code lost:
    
        r2[4] = r2[4] + 1;
        r3 = r3 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x00a0, code lost:
    
        if (r2[4] < r14) goto L59;
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x00a2, code lost:
    
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x00a3, code lost:
    
        r7 = (((r2[0] + r2[1]) + r2[2]) + r2[3]) + r2[4];
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x00bb, code lost:
    
        if ((java.lang.Math.abs(r7 - r15) * 5) < (r15 * 2)) goto L62;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x00bd, code lost:
    
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x00c2, code lost:
    
        if (foundPatternCross(r2) == false) goto L84;
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x00c8, code lost:
    
        return centerFromEnd(r2, r3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:?, code lost:
    
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x00c9, code lost:
    
        return Float.NaN;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private float crossCheckVertical(int r12, int r13, int r14, int r15) {
        /*
            Method dump skipped, instructions count: 203
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.zxing.qrcode.detector.FinderPatternFinder.crossCheckVertical(int, int, int, int):float");
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x003a, code lost:
    
        if (r2[1] <= r14) goto L21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x003f, code lost:
    
        if (r3 < 0) goto L75;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0045, code lost:
    
        if (r0.get(r3, r13) == false) goto L73;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0049, code lost:
    
        if (r2[0] > r14) goto L74;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x004b, code lost:
    
        r2[0] = r2[0] + 1;
        r3 = r3 - 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x0055, code lost:
    
        if (r2[0] <= r14) goto L31;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x0057, code lost:
    
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x0058, code lost:
    
        r3 = r12 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x005a, code lost:
    
        if (r3 >= r1) goto L77;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x0060, code lost:
    
        if (r0.get(r3, r13) == false) goto L76;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x0062, code lost:
    
        r2[2] = r2[2] + 1;
        r3 = r3 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x006a, code lost:
    
        if (r3 != r1) goto L38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x006c, code lost:
    
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x006e, code lost:
    
        if (r3 >= r1) goto L80;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x0074, code lost:
    
        if (r0.get(r3, r13) != false) goto L78;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x0078, code lost:
    
        if (r2[3] >= r14) goto L79;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x007a, code lost:
    
        r2[3] = r2[3] + 1;
        r3 = r3 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x0082, code lost:
    
        if (r3 == r1) goto L66;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x0086, code lost:
    
        if (r2[3] < r14) goto L49;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x008a, code lost:
    
        if (r3 >= r1) goto L83;
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x0090, code lost:
    
        if (r0.get(r3, r13) == false) goto L81;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x0094, code lost:
    
        if (r2[4] >= r14) goto L82;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x0096, code lost:
    
        r2[4] = r2[4] + 1;
        r3 = r3 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x00a0, code lost:
    
        if (r2[4] < r14) goto L59;
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x00a2, code lost:
    
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x00a3, code lost:
    
        r7 = (((r2[0] + r2[1]) + r2[2]) + r2[3]) + r2[4];
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x00b9, code lost:
    
        if ((java.lang.Math.abs(r7 - r15) * 5) < r15) goto L62;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x00bb, code lost:
    
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x00c0, code lost:
    
        if (foundPatternCross(r2) == false) goto L84;
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x00c6, code lost:
    
        return centerFromEnd(r2, r3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:?, code lost:
    
        return Float.NaN;
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x00c7, code lost:
    
        return Float.NaN;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private float crossCheckHorizontal(int r12, int r13, int r14, int r15) {
        /*
            Method dump skipped, instructions count: 201
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.zxing.qrcode.detector.FinderPatternFinder.crossCheckHorizontal(int, int, int, int):float");
    }

    protected final boolean handlePossibleCenter(int[] stateCount, int i, int j, boolean pureBarcode) {
        int stateCountTotal = stateCount[0] + stateCount[1] + stateCount[2] + stateCount[3] + stateCount[4];
        float centerJ = centerFromEnd(stateCount, j);
        float centerI = crossCheckVertical(i, (int) centerJ, stateCount[2], stateCountTotal);
        if (!Float.isNaN(centerI)) {
            float centerJ2 = crossCheckHorizontal((int) centerJ, (int) centerI, stateCount[2], stateCountTotal);
            if (!Float.isNaN(centerJ2) && (!pureBarcode || crossCheckDiagonal((int) centerI, (int) centerJ2, stateCount[2], stateCountTotal))) {
                float estimatedModuleSize = stateCountTotal / 7.0f;
                boolean found = false;
                int index = 0;
                while (true) {
                    if (index >= this.possibleCenters.size()) {
                        break;
                    }
                    FinderPattern center = this.possibleCenters.get(index);
                    if (!center.aboutEquals(estimatedModuleSize, centerI, centerJ2)) {
                        index++;
                    } else {
                        this.possibleCenters.set(index, center.combineEstimate(centerI, centerJ2, estimatedModuleSize));
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    FinderPattern point = new FinderPattern(centerJ2, centerI, estimatedModuleSize);
                    this.possibleCenters.add(point);
                    if (this.resultPointCallback != null) {
                        this.resultPointCallback.foundPossibleResultPoint(point);
                    }
                }
                return true;
            }
        }
        return false;
    }

    private int findRowSkip() {
        int max = this.possibleCenters.size();
        if (max <= 1) {
            return 0;
        }
        ResultPoint firstConfirmedCenter = null;
        for (FinderPattern center : this.possibleCenters) {
            if (center.getCount() >= 2) {
                if (firstConfirmedCenter == null) {
                    firstConfirmedCenter = center;
                } else {
                    this.hasSkipped = true;
                    return ((int) (Math.abs(firstConfirmedCenter.getX() - center.getX()) - Math.abs(firstConfirmedCenter.getY() - center.getY()))) / 2;
                }
            }
        }
        return 0;
    }

    private boolean haveMultiplyConfirmedCenters() {
        int confirmedCount = 0;
        float totalModuleSize = 0.0f;
        int max = this.possibleCenters.size();
        for (FinderPattern pattern : this.possibleCenters) {
            if (pattern.getCount() >= 2) {
                confirmedCount++;
                totalModuleSize += pattern.getEstimatedModuleSize();
            }
        }
        if (confirmedCount < 3) {
            return false;
        }
        float average = totalModuleSize / max;
        float totalDeviation = 0.0f;
        Iterator<FinderPattern> it = this.possibleCenters.iterator();
        while (it.hasNext()) {
            totalDeviation += Math.abs(it.next().getEstimatedModuleSize() - average);
        }
        return totalDeviation <= 0.05f * totalModuleSize;
    }

    private FinderPattern[] selectBestPatterns() throws NotFoundException {
        int startSize = this.possibleCenters.size();
        if (startSize < 3) {
            throw NotFoundException.getNotFoundInstance();
        }
        if (startSize > 3) {
            float totalModuleSize = 0.0f;
            float square = 0.0f;
            for (FinderPattern center : this.possibleCenters) {
                float size = center.getEstimatedModuleSize();
                totalModuleSize += size;
                square += size * size;
            }
            float average = totalModuleSize / startSize;
            float stdDev = (float) Math.sqrt((square / startSize) - (average * average));
            Collections.sort(this.possibleCenters, new FurthestFromAverageComparator(average));
            float limit = Math.max(0.2f * average, stdDev);
            int i = 0;
            while (i < this.possibleCenters.size() && this.possibleCenters.size() > 3) {
                FinderPattern pattern = this.possibleCenters.get(i);
                if (Math.abs(pattern.getEstimatedModuleSize() - average) > limit) {
                    this.possibleCenters.remove(i);
                    i--;
                }
                i++;
            }
        }
        if (this.possibleCenters.size() > 3) {
            float totalModuleSize2 = 0.0f;
            for (FinderPattern possibleCenter : this.possibleCenters) {
                totalModuleSize2 += possibleCenter.getEstimatedModuleSize();
            }
            Collections.sort(this.possibleCenters, new CenterComparator(totalModuleSize2 / this.possibleCenters.size()));
            this.possibleCenters.subList(3, this.possibleCenters.size()).clear();
        }
        return new FinderPattern[]{this.possibleCenters.get(0), this.possibleCenters.get(1), this.possibleCenters.get(2)};
    }

    private static final class FurthestFromAverageComparator implements Comparator<FinderPattern>, Serializable {
        private final float average;

        private FurthestFromAverageComparator(float f) {
            this.average = f;
        }

        @Override // java.util.Comparator
        public int compare(FinderPattern center1, FinderPattern center2) {
            float dA = Math.abs(center2.getEstimatedModuleSize() - this.average);
            float dB = Math.abs(center1.getEstimatedModuleSize() - this.average);
            if (dA < dB) {
                return -1;
            }
            return dA == dB ? 0 : 1;
        }
    }

    private static final class CenterComparator implements Comparator<FinderPattern>, Serializable {
        private final float average;

        private CenterComparator(float f) {
            this.average = f;
        }

        @Override // java.util.Comparator
        public int compare(FinderPattern center1, FinderPattern center2) {
            if (center2.getCount() == center1.getCount()) {
                float dA = Math.abs(center2.getEstimatedModuleSize() - this.average);
                float dB = Math.abs(center1.getEstimatedModuleSize() - this.average);
                if (dA < dB) {
                    return 1;
                }
                return dA == dB ? 0 : -1;
            }
            return center2.getCount() - center1.getCount();
        }
    }
}
