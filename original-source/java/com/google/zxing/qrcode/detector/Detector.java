package com.google.zxing.qrcode.detector;

import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.ResultPointCallback;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.DetectorResult;
import com.google.zxing.common.GridSampler;
import com.google.zxing.common.PerspectiveTransform;
import com.google.zxing.common.detector.MathUtils;
import com.google.zxing.qrcode.decoder.Version;
import java.util.Map;

/* loaded from: classes16.dex */
public class Detector {
    private final BitMatrix image;
    private ResultPointCallback resultPointCallback;

    public Detector(BitMatrix image) {
        this.image = image;
    }

    protected final BitMatrix getImage() {
        return this.image;
    }

    protected final ResultPointCallback getResultPointCallback() {
        return this.resultPointCallback;
    }

    public DetectorResult detect() throws NotFoundException, FormatException {
        return detect(null);
    }

    public final DetectorResult detect(Map<DecodeHintType, ?> hints) throws NotFoundException, FormatException {
        this.resultPointCallback = hints == null ? null : (ResultPointCallback) hints.get(DecodeHintType.NEED_RESULT_POINT_CALLBACK);
        FinderPatternFinder finder = new FinderPatternFinder(this.image, this.resultPointCallback);
        FinderPatternInfo info = finder.find(hints);
        return processFinderPatternInfo(info);
    }

    protected final DetectorResult processFinderPatternInfo(FinderPatternInfo info) throws NotFoundException, FormatException {
        ResultPoint[] points;
        FinderPattern topLeft = info.getTopLeft();
        FinderPattern topRight = info.getTopRight();
        FinderPattern bottomLeft = info.getBottomLeft();
        float moduleSize = calculateModuleSize(topLeft, topRight, bottomLeft);
        if (moduleSize < 1.0f) {
            throw NotFoundException.getNotFoundInstance();
        }
        int dimension = computeDimension(topLeft, topRight, bottomLeft, moduleSize);
        Version provisionalVersion = Version.getProvisionalVersionForDimension(dimension);
        int modulesBetweenFPCenters = provisionalVersion.getDimensionForVersion() - 7;
        AlignmentPattern alignmentPattern = null;
        if (provisionalVersion.getAlignmentPatternCenters().length > 0) {
            float bottomRightX = (topRight.getX() - topLeft.getX()) + bottomLeft.getX();
            float bottomRightY = (topRight.getY() - topLeft.getY()) + bottomLeft.getY();
            float correctionToTopLeft = 1.0f - (3.0f / modulesBetweenFPCenters);
            int estAlignmentX = (int) (topLeft.getX() + ((bottomRightX - topLeft.getX()) * correctionToTopLeft));
            int estAlignmentY = (int) (topLeft.getY() + ((bottomRightY - topLeft.getY()) * correctionToTopLeft));
            int i = 4;
            while (true) {
                if (i > 16) {
                    break;
                }
                try {
                    alignmentPattern = findAlignmentInRegion(moduleSize, estAlignmentX, estAlignmentY, i);
                    break;
                } catch (NotFoundException e) {
                    i <<= 1;
                }
            }
        }
        PerspectiveTransform transform = createTransform(topLeft, topRight, bottomLeft, alignmentPattern, dimension);
        BitMatrix bits = sampleGrid(this.image, transform, dimension);
        if (alignmentPattern == null) {
            points = new ResultPoint[]{bottomLeft, topLeft, topRight};
        } else {
            points = new ResultPoint[]{bottomLeft, topLeft, topRight, alignmentPattern};
        }
        return new DetectorResult(bits, points);
    }

    private static PerspectiveTransform createTransform(ResultPoint topLeft, ResultPoint topRight, ResultPoint bottomLeft, ResultPoint alignmentPattern, int dimension) {
        float bottomRightX;
        float bottomRightY;
        float sourceBottomRightX;
        float sourceBottomRightY;
        float dimMinusThree = dimension - 3.5f;
        if (alignmentPattern != null) {
            float bottomRightX2 = alignmentPattern.getX();
            float bottomRightY2 = alignmentPattern.getY();
            float sourceBottomRightX2 = dimMinusThree - 3.0f;
            bottomRightX = bottomRightX2;
            bottomRightY = bottomRightY2;
            sourceBottomRightX = sourceBottomRightX2;
            sourceBottomRightY = sourceBottomRightX2;
        } else {
            float bottomRightX3 = topRight.getX();
            float bottomRightX4 = (bottomRightX3 - topLeft.getX()) + bottomLeft.getX();
            float bottomRightY3 = (topRight.getY() - topLeft.getY()) + bottomLeft.getY();
            bottomRightX = bottomRightX4;
            bottomRightY = bottomRightY3;
            sourceBottomRightX = dimMinusThree;
            sourceBottomRightY = dimMinusThree;
        }
        return PerspectiveTransform.quadrilateralToQuadrilateral(3.5f, 3.5f, dimMinusThree, 3.5f, sourceBottomRightX, sourceBottomRightY, 3.5f, dimMinusThree, topLeft.getX(), topLeft.getY(), topRight.getX(), topRight.getY(), bottomRightX, bottomRightY, bottomLeft.getX(), bottomLeft.getY());
    }

    private static BitMatrix sampleGrid(BitMatrix image, PerspectiveTransform transform, int dimension) throws NotFoundException {
        GridSampler sampler = GridSampler.getInstance();
        return sampler.sampleGrid(image, dimension, dimension, transform);
    }

    private static int computeDimension(ResultPoint topLeft, ResultPoint topRight, ResultPoint bottomLeft, float moduleSize) throws NotFoundException {
        int tltrCentersDimension = MathUtils.round(ResultPoint.distance(topLeft, topRight) / moduleSize);
        int tlblCentersDimension = MathUtils.round(ResultPoint.distance(topLeft, bottomLeft) / moduleSize);
        int dimension = ((tltrCentersDimension + tlblCentersDimension) / 2) + 7;
        switch (dimension & 3) {
            case 0:
                return dimension + 1;
            case 1:
            default:
                return dimension;
            case 2:
                return dimension - 1;
            case 3:
                throw NotFoundException.getNotFoundInstance();
        }
    }

    protected final float calculateModuleSize(ResultPoint topLeft, ResultPoint topRight, ResultPoint bottomLeft) {
        return (calculateModuleSizeOneWay(topLeft, topRight) + calculateModuleSizeOneWay(topLeft, bottomLeft)) / 2.0f;
    }

    private float calculateModuleSizeOneWay(ResultPoint pattern, ResultPoint otherPattern) {
        float moduleSizeEst1 = sizeOfBlackWhiteBlackRunBothWays((int) pattern.getX(), (int) pattern.getY(), (int) otherPattern.getX(), (int) otherPattern.getY());
        float moduleSizeEst2 = sizeOfBlackWhiteBlackRunBothWays((int) otherPattern.getX(), (int) otherPattern.getY(), (int) pattern.getX(), (int) pattern.getY());
        if (Float.isNaN(moduleSizeEst1)) {
            return moduleSizeEst2 / 7.0f;
        }
        if (Float.isNaN(moduleSizeEst2)) {
            return moduleSizeEst1 / 7.0f;
        }
        return (moduleSizeEst1 + moduleSizeEst2) / 14.0f;
    }

    private float sizeOfBlackWhiteBlackRunBothWays(int fromX, int fromY, int toX, int toY) {
        float result = sizeOfBlackWhiteBlackRun(fromX, fromY, toX, toY);
        float scale = 1.0f;
        int otherToX = fromX - (toX - fromX);
        if (otherToX < 0) {
            scale = fromX / (fromX - otherToX);
            otherToX = 0;
        } else if (otherToX >= this.image.getWidth()) {
            scale = ((this.image.getWidth() - 1) - fromX) / (otherToX - fromX);
            otherToX = this.image.getWidth() - 1;
        }
        int otherToY = (int) (fromY - ((toY - fromY) * scale));
        float scale2 = 1.0f;
        if (otherToY < 0) {
            scale2 = fromY / (fromY - otherToY);
            otherToY = 0;
        } else if (otherToY >= this.image.getHeight()) {
            scale2 = ((this.image.getHeight() - 1) - fromY) / (otherToY - fromY);
            otherToY = this.image.getHeight() - 1;
        }
        return (result + sizeOfBlackWhiteBlackRun(fromX, fromY, (int) (fromX + ((otherToX - fromX) * scale2)), otherToY)) - 1.0f;
    }

    /* JADX WARN: Code restructure failed: missing block: B:38:0x0099, code lost:
    
        if (r13 != 2) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x00a1, code lost:
    
        return com.google.zxing.common.detector.MathUtils.distance(r20 + r12, r7, r4, r5);
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x00a2, code lost:
    
        return Float.NaN;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private float sizeOfBlackWhiteBlackRun(int r20, int r21, int r22, int r23) {
        /*
            r19 = this;
            int r0 = r23 - r21
            int r0 = java.lang.Math.abs(r0)
            int r1 = r22 - r20
            int r1 = java.lang.Math.abs(r1)
            r3 = 1
            if (r0 <= r1) goto L11
            r0 = r3
            goto L12
        L11:
            r0 = 0
        L12:
            if (r0 == 0) goto L1f
            r1 = r20
            r4 = r21
            r5 = r1
            r1 = r22
            r6 = r23
            r7 = r1
            goto L27
        L1f:
            r4 = r20
            r5 = r21
            r6 = r22
            r7 = r23
        L27:
            int r1 = r6 - r4
            int r1 = java.lang.Math.abs(r1)
            int r8 = r7 - r5
            int r8 = java.lang.Math.abs(r8)
            int r9 = -r1
            r10 = 2
            int r9 = r9 / r10
            r11 = -1
            if (r4 >= r6) goto L3b
            r12 = r3
            goto L3c
        L3b:
            r12 = r11
        L3c:
            if (r5 >= r7) goto L3f
            r11 = r3
        L3f:
            r13 = 0
            int r14 = r6 + r12
            r15 = r4
            r16 = r5
            r2 = r16
        L47:
            if (r15 == r14) goto L90
            if (r0 == 0) goto L4e
            r17 = r2
            goto L50
        L4e:
            r17 = r15
        L50:
            r20 = r17
            if (r0 == 0) goto L57
            r17 = r15
            goto L59
        L57:
            r17 = r2
        L59:
            r21 = r17
            if (r13 != r3) goto L5e
            goto L5f
        L5e:
            r3 = 0
        L5f:
            r10 = r19
            r18 = r0
            com.google.zxing.common.BitMatrix r0 = r10.image
            r23 = r1
            r1 = r20
            r20 = r6
            r6 = r21
            boolean r0 = r0.get(r1, r6)
            if (r3 != r0) goto L7d
            r0 = 2
            if (r13 != r0) goto L7b
            float r0 = com.google.zxing.common.detector.MathUtils.distance(r15, r2, r4, r5)
            return r0
        L7b:
            int r13 = r13 + 1
        L7d:
            int r9 = r9 + r8
            if (r9 <= 0) goto L86
            if (r2 != r7) goto L83
            goto L98
        L83:
            int r2 = r2 + r11
            int r9 = r9 - r23
        L86:
            int r15 = r15 + r12
            r6 = r20
            r1 = r23
            r0 = r18
            r3 = 1
            r10 = 2
            goto L47
        L90:
            r10 = r19
            r18 = r0
            r23 = r1
            r20 = r6
        L98:
            r0 = 2
            if (r13 != r0) goto La2
            int r6 = r20 + r12
            float r0 = com.google.zxing.common.detector.MathUtils.distance(r6, r7, r4, r5)
            return r0
        La2:
            r0 = 2143289344(0x7fc00000, float:NaN)
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.zxing.qrcode.detector.Detector.sizeOfBlackWhiteBlackRun(int, int, int, int):float");
    }

    protected final AlignmentPattern findAlignmentInRegion(float overallEstModuleSize, int estAlignmentX, int estAlignmentY, float allowanceFactor) throws NotFoundException {
        int allowance = (int) (allowanceFactor * overallEstModuleSize);
        int alignmentAreaLeftX = Math.max(0, estAlignmentX - allowance);
        int alignmentAreaRightX = Math.min(this.image.getWidth() - 1, estAlignmentX + allowance);
        if (alignmentAreaRightX - alignmentAreaLeftX < overallEstModuleSize * 3.0f) {
            throw NotFoundException.getNotFoundInstance();
        }
        int alignmentAreaTopY = Math.max(0, estAlignmentY - allowance);
        int alignmentAreaBottomY = Math.min(this.image.getHeight() - 1, estAlignmentY + allowance);
        if (alignmentAreaBottomY - alignmentAreaTopY < 3.0f * overallEstModuleSize) {
            throw NotFoundException.getNotFoundInstance();
        }
        AlignmentPatternFinder alignmentFinder = new AlignmentPatternFinder(this.image, alignmentAreaLeftX, alignmentAreaTopY, alignmentAreaRightX - alignmentAreaLeftX, alignmentAreaBottomY - alignmentAreaTopY, overallEstModuleSize, this.resultPointCallback);
        return alignmentFinder.find();
    }
}
