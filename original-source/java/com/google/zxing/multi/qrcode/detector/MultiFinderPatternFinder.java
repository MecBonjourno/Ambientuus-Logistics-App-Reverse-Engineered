package com.google.zxing.multi.qrcode.detector;

import androidx.camera.video.AudioStats;
import com.google.zxing.DecodeHintType;
import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.ResultPointCallback;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.detector.FinderPattern;
import com.google.zxing.qrcode.detector.FinderPatternFinder;
import com.google.zxing.qrcode.detector.FinderPatternInfo;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

/* loaded from: classes16.dex */
final class MultiFinderPatternFinder extends FinderPatternFinder {
    private static final float DIFF_MODSIZE_CUTOFF = 0.5f;
    private static final float DIFF_MODSIZE_CUTOFF_PERCENT = 0.05f;
    private static final FinderPatternInfo[] EMPTY_RESULT_ARRAY = new FinderPatternInfo[0];
    private static final float MAX_MODULE_COUNT_PER_EDGE = 180.0f;
    private static final float MIN_MODULE_COUNT_PER_EDGE = 9.0f;

    private static final class ModuleSizeComparator implements Comparator<FinderPattern>, Serializable {
        private ModuleSizeComparator() {
        }

        @Override // java.util.Comparator
        public int compare(FinderPattern center1, FinderPattern center2) {
            float value = center2.getEstimatedModuleSize() - center1.getEstimatedModuleSize();
            if (value < AudioStats.AUDIO_AMPLITUDE_NONE) {
                return -1;
            }
            return ((double) value) > AudioStats.AUDIO_AMPLITUDE_NONE ? 1 : 0;
        }
    }

    MultiFinderPatternFinder(BitMatrix image) {
        super(image);
    }

    MultiFinderPatternFinder(BitMatrix image, ResultPointCallback resultPointCallback) {
        super(image, resultPointCallback);
    }

    private FinderPattern[][] selectMutipleBestPatterns() throws NotFoundException {
        List<FinderPattern> list;
        int i;
        char c;
        boolean z;
        List<FinderPattern> list2;
        int i2;
        List<FinderPattern> possibleCenters = getPossibleCenters();
        int size = possibleCenters.size();
        int i3 = 3;
        if (size < 3) {
            throw NotFoundException.getNotFoundInstance();
        }
        char c2 = 2;
        boolean z2 = false;
        char c3 = 1;
        if (size == 3) {
            return new FinderPattern[][]{new FinderPattern[]{possibleCenters.get(0), possibleCenters.get(1), possibleCenters.get(2)}};
        }
        Collections.sort(possibleCenters, new ModuleSizeComparator());
        ArrayList arrayList = new ArrayList();
        int i4 = 0;
        while (i4 < size - 2) {
            FinderPattern finderPattern = possibleCenters.get(i4);
            if (finderPattern != null) {
                int i5 = i4 + 1;
                while (i5 < size - 1) {
                    FinderPattern finderPattern2 = possibleCenters.get(i5);
                    if (finderPattern2 == null) {
                        list = possibleCenters;
                        i = size;
                        c = c2;
                        z = z2;
                    } else {
                        float estimatedModuleSize = (finderPattern.getEstimatedModuleSize() - finderPattern2.getEstimatedModuleSize()) / Math.min(finderPattern.getEstimatedModuleSize(), finderPattern2.getEstimatedModuleSize());
                        float abs = Math.abs(finderPattern.getEstimatedModuleSize() - finderPattern2.getEstimatedModuleSize());
                        float f = 0.5f;
                        float f2 = DIFF_MODSIZE_CUTOFF_PERCENT;
                        if (abs <= 0.5f || estimatedModuleSize < DIFF_MODSIZE_CUTOFF_PERCENT) {
                            int i6 = i5 + 1;
                            while (true) {
                                if (i6 >= size) {
                                    list = possibleCenters;
                                    i = size;
                                    c = c2;
                                    z = z2;
                                    break;
                                }
                                FinderPattern finderPattern3 = possibleCenters.get(i6);
                                if (finderPattern3 == null) {
                                    list2 = possibleCenters;
                                    i2 = size;
                                    c = c2;
                                    z = z2;
                                } else {
                                    c = c2;
                                    z = z2;
                                    float estimatedModuleSize2 = (finderPattern2.getEstimatedModuleSize() - finderPattern3.getEstimatedModuleSize()) / Math.min(finderPattern2.getEstimatedModuleSize(), finderPattern3.getEstimatedModuleSize());
                                    if (Math.abs(finderPattern2.getEstimatedModuleSize() - finderPattern3.getEstimatedModuleSize()) > f && estimatedModuleSize2 >= f2) {
                                        list = possibleCenters;
                                        i = size;
                                        break;
                                    }
                                    FinderPattern[] finderPatternArr = new FinderPattern[i3];
                                    finderPatternArr[z ? 1 : 0] = finderPattern;
                                    finderPatternArr[c3] = finderPattern2;
                                    finderPatternArr[c] = finderPattern3;
                                    ResultPoint.orderBestPatterns(finderPatternArr);
                                    FinderPatternInfo finderPatternInfo = new FinderPatternInfo(finderPatternArr);
                                    float distance = ResultPoint.distance(finderPatternInfo.getTopLeft(), finderPatternInfo.getBottomLeft());
                                    float distance2 = ResultPoint.distance(finderPatternInfo.getTopRight(), finderPatternInfo.getBottomLeft());
                                    list2 = possibleCenters;
                                    float distance3 = ResultPoint.distance(finderPatternInfo.getTopLeft(), finderPatternInfo.getTopRight());
                                    float estimatedModuleSize3 = (distance + distance3) / (finderPattern.getEstimatedModuleSize() * 2.0f);
                                    if (estimatedModuleSize3 > MAX_MODULE_COUNT_PER_EDGE) {
                                        i2 = size;
                                    } else if (estimatedModuleSize3 < MIN_MODULE_COUNT_PER_EDGE) {
                                        i2 = size;
                                    } else if (Math.abs((distance - distance3) / Math.min(distance, distance3)) >= 0.1f) {
                                        i2 = size;
                                    } else {
                                        i2 = size;
                                        float sqrt = (float) Math.sqrt((distance * distance) + (distance3 * distance3));
                                        if (Math.abs((distance2 - sqrt) / Math.min(distance2, sqrt)) < 0.1f) {
                                            arrayList.add(finderPatternArr);
                                        }
                                    }
                                }
                                i6++;
                                c2 = c;
                                z2 = z;
                                possibleCenters = list2;
                                size = i2;
                                i3 = 3;
                                c3 = 1;
                                f = 0.5f;
                                f2 = DIFF_MODSIZE_CUTOFF_PERCENT;
                            }
                        }
                    }
                    i5++;
                    c2 = c;
                    z2 = z;
                    possibleCenters = list;
                    size = i;
                    i3 = 3;
                    c3 = 1;
                }
            }
            i4++;
            c2 = c2;
            z2 = z2;
            possibleCenters = possibleCenters;
            size = size;
            i3 = 3;
            c3 = 1;
        }
        if (!arrayList.isEmpty()) {
            return (FinderPattern[][]) arrayList.toArray(new FinderPattern[arrayList.size()][]);
        }
        throw NotFoundException.getNotFoundInstance();
    }

    public FinderPatternInfo[] findMulti(Map<DecodeHintType, ?> hints) throws NotFoundException {
        char c;
        int i = 0;
        boolean tryHarder = hints != null && hints.containsKey(DecodeHintType.TRY_HARDER);
        boolean pureBarcode = hints != null && hints.containsKey(DecodeHintType.PURE_BARCODE);
        BitMatrix image = getImage();
        int maxI = image.getHeight();
        int maxJ = image.getWidth();
        int iSkip = (int) ((maxI / 228.0f) * 3.0f);
        char c2 = 3;
        if (iSkip < 3 || tryHarder) {
            iSkip = 3;
        }
        int[] stateCount = new int[5];
        int i2 = iSkip - 1;
        while (i2 < maxI) {
            stateCount[i] = i;
            stateCount[1] = i;
            stateCount[2] = i;
            stateCount[c2] = i;
            stateCount[4] = i;
            int currentState = 0;
            int i3 = i;
            int j = 0;
            while (j < maxJ) {
                if (image.get(j, i2)) {
                    c = c2;
                    if ((currentState & 1) == 1) {
                        currentState++;
                    }
                    stateCount[currentState] = stateCount[currentState] + 1;
                } else {
                    c = c2;
                    if ((currentState & 1) == 0) {
                        if (currentState == 4) {
                            if (foundPatternCross(stateCount) && handlePossibleCenter(stateCount, i2, j, pureBarcode)) {
                                stateCount[i3] = i3;
                                stateCount[1] = i3;
                                stateCount[2] = i3;
                                stateCount[c] = i3;
                                stateCount[4] = i3;
                                currentState = 0;
                            } else {
                                int currentState2 = stateCount[2];
                                stateCount[i3] = currentState2;
                                stateCount[1] = stateCount[c];
                                stateCount[2] = stateCount[4];
                                stateCount[c] = 1;
                                stateCount[4] = i3;
                                currentState = 3;
                            }
                        } else {
                            currentState++;
                            stateCount[currentState] = stateCount[currentState] + 1;
                        }
                    } else {
                        stateCount[currentState] = stateCount[currentState] + 1;
                    }
                }
                j++;
                c2 = c;
            }
            char c3 = c2;
            if (foundPatternCross(stateCount)) {
                handlePossibleCenter(stateCount, i2, maxJ, pureBarcode);
            }
            i2 += iSkip;
            i = i3;
            c2 = c3;
        }
        int i4 = i;
        FinderPattern[][] patternInfo = selectMutipleBestPatterns();
        List<FinderPatternInfo> result = new ArrayList<>();
        int length = patternInfo.length;
        for (int i5 = i4; i5 < length; i5++) {
            FinderPattern[] pattern = patternInfo[i5];
            ResultPoint.orderBestPatterns(pattern);
            result.add(new FinderPatternInfo(pattern));
        }
        if (result.isEmpty()) {
            return EMPTY_RESULT_ARRAY;
        }
        return (FinderPatternInfo[]) result.toArray(new FinderPatternInfo[result.size()]);
    }
}
