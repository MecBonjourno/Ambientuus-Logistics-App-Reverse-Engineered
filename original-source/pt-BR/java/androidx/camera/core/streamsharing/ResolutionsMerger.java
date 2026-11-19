package androidx.camera.core.streamsharing;

import android.graphics.Rect;
import android.graphics.RectF;
import android.util.Pair;
import android.util.Rational;
import android.util.Size;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.ImageOutputConfig;
import androidx.camera.core.impl.MutableConfig;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.utils.AspectRatioUtil;
import androidx.camera.core.impl.utils.CompareSizesByArea;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.camera.core.internal.SupportedOutputSizesSorter;
import androidx.camera.core.resolutionselector.ResolutionSelector;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* carregado de: classes.dex */
public class ResolutionsMerger {
    private static final double SAME_AREA_WIDTH_HEIGHT_RATIO = Math.sqrt(2.3703703703703702d);
    private static final String TAG = "ResolutionsMerger";
    private final CameraInfoInternal mCameraInfo;
    private final Map<UseCaseConfig<?>, List<Size>> mChildSizesCache;
    private final Set<UseCaseConfig<?>> mChildrenConfigs;
    private final Rational mFallbackAspectRatio;
    private final Rational mSensorAspectRatio;
    private final Size mSensorSize;
    private final SupportedOutputSizesSorter mSizeSorter;

    ResolutionsMerger(CameraInternal cameraInternal, Set<UseCaseConfig<?>> childrenConfigs) {
        this(TransformUtils.rectToSize(cameraInternal.getCameraInfoInternal().getSensorRect()), cameraInternal.getCameraInfoInternal(), childrenConfigs);
    }

    private ResolutionsMerger(Size sensorSize, CameraInfoInternal cameraInfo, Set<UseCaseConfig<?>> childrenConfigs) {
        this(sensorSize, cameraInfo, childrenConfigs, new SupportedOutputSizesSorter(cameraInfo, sensorSize));
    }

    ResolutionsMerger(Size sensorSize, CameraInfoInternal cameraInfo, Set<UseCaseConfig<?>> childrenConfigs, SupportedOutputSizesSorter supportedOutputSizesSorter) {
        this.mChildSizesCache = new HashMap();
        this.mSensorSize = sensorSize;
        this.mSensorAspectRatio = getSensorAspectRatio(sensorSize);
        this.mFallbackAspectRatio = getFallbackAspectRatio(this.mSensorAspectRatio);
        this.mCameraInfo = cameraInfo;
        this.mChildrenConfigs = childrenConfigs;
        this.mSizeSorter = supportedOutputSizesSorter;
    }

    List<Size> getMergedResolutions(MutableConfig parentConfig) {
        List<Size> candidateSizes = getCameraSupportedResolutions();
        if (shouldIncludeHighResolutions()) {
            candidateSizes = new ArrayList(candidateSizes);
            candidateSizes.addAll(getCameraSupportedHighResolutions());
        }
        List<Pair<Integer, Size[]>> parentSupportedSizesMap = (List) parentConfig.retrieveOption(ImageOutputConfig.OPTION_SUPPORTED_RESOLUTIONS, null);
        if (parentSupportedSizesMap != null) {
            candidateSizes = getSupportedPrivResolutions(parentSupportedSizesMap);
        }
        return selectParentResolutions(candidateSizes);
    }

    PreferredChildSize getPreferredChildSize(UseCaseConfig<?> childConfig, Rect parentCropRect, int sensorToBufferRotationDegrees, boolean isViewportSet) {
        boolean isWidthHeightRevertedForComputation = false;
        if (TransformUtils.is90or270(sensorToBufferRotationDegrees)) {
            parentCropRect = reverseRect(parentCropRect);
            isWidthHeightRevertedForComputation = true;
        }
        PreferredChildSize preferredChildSize = getPreferredChildSizeInternal(parentCropRect, childConfig, isViewportSet);
        if (isWidthHeightRevertedForComputation) {
            return new PreferredChildSize(reverseRect(preferredChildSize.getCropRectBeforeScaling()), TransformUtils.reverseSize(preferredChildSize.getChildSizeToScale()), preferredChildSize.getOriginalSelectedChildSize());
        }
        return preferredChildSize;
    }

    private PreferredChildSize getPreferredChildSizeInternal(Rect parentCropRect, UseCaseConfig<?> childConfig, boolean isViewportSet) {
        Size viewPortSize;
        Size selectedChildSize;
        Rect cropRectBeforeScaling;
        if (isViewportSet) {
            cropRectBeforeScaling = parentCropRect;
            Pair<Size, Size> pair = getPreferredChildSizeForViewport(TransformUtils.rectToSize(parentCropRect), childConfig);
            selectedChildSize = (Size) pair.first;
            viewPortSize = (Size) pair.second;
        } else {
            Size parentSize = TransformUtils.rectToSize(parentCropRect);
            viewPortSize = getPreferredChildSize(parentSize, childConfig);
            selectedChildSize = viewPortSize;
            cropRectBeforeScaling = getCropRectOfReferenceAspectRatio(parentSize, viewPortSize);
        }
        return new PreferredChildSize(cropRectBeforeScaling, viewPortSize, selectedChildSize);
    }

    Size getPreferredChildSize(Size parentSize, UseCaseConfig<?> childConfig) {
        List<Size> candidateChildSizes = getSortedChildSizes(childConfig);
        for (Size childSize : candidateChildSizes) {
            if (!isDoubleCropping(parentSize, childSize) && !hasUpscaling(childSize, parentSize)) {
                return childSize;
            }
        }
        for (Size childSize2 : candidateChildSizes) {
            if (!hasUpscaling(childSize2, parentSize)) {
                return childSize2;
            }
        }
        return parentSize;
    }

    Pair<Size, Size> getPreferredChildSizeForViewport(Size parentSize, UseCaseConfig<?> childConfig) {
        List<Size> candidateChildSizes = getSortedChildSizes(childConfig);
        for (Size childSize : candidateChildSizes) {
            Size childSizeToCrop = TransformUtils.rectToSize(getCropRectOfReferenceAspectRatio(childSize, parentSize));
            if (!hasUpscaling(childSizeToCrop, parentSize)) {
                return Pair.create(childSize, childSizeToCrop);
            }
        }
        return Pair.create(parentSize, parentSize);
    }

    private List<Size> getCameraSupportedResolutions() {
        return this.mCameraInfo.getSupportedResolutions(34);
    }

    private List<Size> getCameraSupportedHighResolutions() {
        return this.mCameraInfo.getSupportedHighResolutions(34);
    }

    private boolean shouldIncludeHighResolutions() {
        ResolutionSelector resolutionSelector;
        for (UseCaseConfig<?> childConfig : this.mChildrenConfigs) {
            if (!childConfig.isHighResolutionDisabled(false) && (childConfig instanceof ImageOutputConfig) && (resolutionSelector = ((ImageOutputConfig) childConfig).getResolutionSelector(null)) != null && resolutionSelector.getAllowedResolutionMode() == 1) {
                return true;
            }
        }
        return false;
    }

    private boolean shouldPrioritizeFallbackAspectRatio() {
        if (this.mChildrenConfigs.isEmpty()) {
            return false;
        }
        for (UseCaseConfig<?> childConfig : this.mChildrenConfigs) {
            List<Size> sortedChildSizes = getSortedChildSizes(childConfig);
            boolean nonFallbackAspectRatioSizeFound = false;
            boolean fallbackAspectRatioSizeFound = false;
            for (Size size : sortedChildSizes) {
                boolean isFallbackAspectRatio = AspectRatioUtil.hasMatchingAspectRatio(size, this.mFallbackAspectRatio);
                if (isFallbackAspectRatio) {
                    fallbackAspectRatioSizeFound = true;
                }
                if (nonFallbackAspectRatioSizeFound && isFallbackAspectRatio) {
                    return false;
                }
                if (!isFallbackAspectRatio) {
                    nonFallbackAspectRatioSizeFound = true;
                }
            }
            if (!fallbackAspectRatioSizeFound) {
                return false;
            }
        }
        return true;
    }

    private List<Size> selectParentResolutions(List<Size> candidateParentResolutions) {
        List<Size> result = new ArrayList<>();
        if (needToAddSensorResolutions()) {
            result.addAll(selectParentResolutionsByAspectRatio(this.mSensorAspectRatio, candidateParentResolutions, false));
        }
        int currentSize = result.size();
        result.addAll(shouldPrioritizeFallbackAspectRatio() ? 0 : currentSize, selectParentResolutionsByAspectRatio(this.mFallbackAspectRatio, candidateParentResolutions, false));
        result.addAll(selectOtherAspectRatioParentResolutionsWithFovPriority(candidateParentResolutions, false));
        if (result.isEmpty()) {
            Logger.w(TAG, "Failed to find a parent resolution that does not result in double-cropping, this might due to camera not supporting 4:3 and 16:9resolutions or a strict ResolutionSelector settings. Starting resolution selection process with resolutions that might have a smaller FOV.");
            result.addAll(selectOtherAspectRatioParentResolutionsWithFovPriority(candidateParentResolutions, true));
        }
        Logger.d(TAG, "Parent resolutions: " + result);
        return result;
    }

    private List<Size> selectParentResolutionsByAspectRatio(Rational aspectRatio, List<Size> candidateParentResolutions, boolean allowDoubleCropping) {
        List<Size> candidates = filterResolutionsByAspectRatio(aspectRatio, candidateParentResolutions);
        sortInDescendingOrder(candidates);
        Set<Size> sizesTooLarge = new HashSet<>(candidates);
        for (UseCaseConfig<?> childConfig : this.mChildrenConfigs) {
            List<Size> childSizes = getSortedChildSizes(childConfig);
            if (!allowDoubleCropping) {
                childSizes = filterOutChildSizesCausingDoubleCropping(aspectRatio, childSizes);
            }
            if (childSizes.isEmpty()) {
                return new ArrayList();
            }
            candidates = filterOutParentSizeThatIsTooSmall(childSizes, candidates);
            sizesTooLarge.retainAll(getParentSizesThatAreTooLarge(childSizes, candidates));
        }
        List<Size> result = new ArrayList<>();
        for (Size candidate : candidates) {
            if (!sizesTooLarge.contains(candidate)) {
                result.add(candidate);
            }
        }
        return result;
    }

    private List<Size> selectOtherAspectRatioParentResolutionsWithFovPriority(List<Size> candidates, boolean allowDoubleCropping) {
        Map<Rational, List<Size>> ratioToSizesMap = groupSizesByAspectRatio(candidates);
        List<Rational> ratios = new ArrayList<>(ratioToSizesMap.keySet());
        sortByFov(ratios);
        List<Size> result = new ArrayList<>();
        for (Rational ratio : ratios) {
            if (!ratio.equals(AspectRatioUtil.ASPECT_RATIO_16_9) && !ratio.equals(AspectRatioUtil.ASPECT_RATIO_4_3)) {
                List<Size> sizes = (List) Objects.requireNonNull(ratioToSizesMap.get(ratio));
                result.addAll(selectParentResolutionsByAspectRatio(ratio, sizes, allowDoubleCropping));
            }
        }
        return result;
    }

    private Map<Rational, List<Size>> groupSizesByAspectRatio(List<Size> sizes) {
        Map<Rational, List<Size>> result = new HashMap<>();
        result.put(AspectRatioUtil.ASPECT_RATIO_4_3, new ArrayList<>());
        result.put(AspectRatioUtil.ASPECT_RATIO_16_9, new ArrayList<>());
        List<Rational> ratios = new ArrayList<>();
        ratios.add(AspectRatioUtil.ASPECT_RATIO_4_3);
        ratios.add(AspectRatioUtil.ASPECT_RATIO_16_9);
        for (Size size : sizes) {
            if (size.getHeight() > 0) {
                List<Size> group = null;
                Iterator<Rational> it = ratios.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    Rational ratio = it.next();
                    if (AspectRatioUtil.hasMatchingAspectRatio(size, ratio)) {
                        List<Size> group2 = result.get(ratio);
                        group = group2;
                        break;
                    }
                }
                if (group == null) {
                    group = new ArrayList<>();
                    Rational newRatio = toRational(size);
                    ratios.add(newRatio);
                    result.put(newRatio, group);
                }
                ((List) Objects.requireNonNull(group)).add(size);
            }
        }
        return result;
    }

    private List<Size> getSortedChildSizes(UseCaseConfig<?> childConfig) {
        if (!this.mChildrenConfigs.contains(childConfig)) {
            throw new IllegalArgumentException("Invalid child config: " + childConfig);
        }
        if (this.mChildSizesCache.containsKey(childConfig)) {
            return (List) Objects.requireNonNull(this.mChildSizesCache.get(childConfig));
        }
        List<Size> childSizes = filterOutChildSizesThatWillNeverBeSelected(this.mSizeSorter.getSortedSupportedOutputSizes(childConfig));
        this.mChildSizesCache.put(childConfig, childSizes);
        return childSizes;
    }

    private boolean needToAddSensorResolutions() {
        for (Size size : getChildrenRequiredResolutions()) {
            if (!AspectRatioUtil.hasMatchingAspectRatio(size, this.mFallbackAspectRatio)) {
                return true;
            }
        }
        return false;
    }

    private Set<Size> getChildrenRequiredResolutions() {
        Set<Size> result = new HashSet<>();
        for (UseCaseConfig<?> childConfig : this.mChildrenConfigs) {
            List<Size> childSizes = getSortedChildSizes(childConfig);
            result.addAll(childSizes);
        }
        return result;
    }

    private List<Size> filterOutChildSizesCausingDoubleCropping(Rational parentAspectRatio, List<Size> childSizes) {
        List<Size> result = new ArrayList<>();
        for (Size childSize : childSizes) {
            if (!isDoubleCropping(parentAspectRatio, childSize)) {
                result.add(childSize);
            }
        }
        return result;
    }

    private boolean isDoubleCropping(Rational parentRatio, Size childSize) {
        if (this.mSensorAspectRatio.equals(parentRatio) || AspectRatioUtil.hasMatchingAspectRatio(childSize, parentRatio)) {
            return false;
        }
        return areCroppingInDifferentDirection(this.mSensorAspectRatio.floatValue(), parentRatio.floatValue(), toRationalWithMod16Considered(childSize).floatValue());
    }

    private boolean isDoubleCropping(Size parentSize, Size childSize) {
        Rational parentRatio = toRationalWithMod16Considered(parentSize);
        return isDoubleCropping(parentRatio, childSize);
    }

    private boolean areCroppingInDifferentDirection(float sensorRatioValue, float parentRatioValue, float childRatioValue) {
        if (sensorRatioValue == parentRatioValue || parentRatioValue == childRatioValue) {
            return false;
        }
        return sensorRatioValue > parentRatioValue ? parentRatioValue < childRatioValue : parentRatioValue > childRatioValue;
    }

    private void sortByFov(List<Rational> ratios) {
        Rational actualSensorAspectRatio = toRational(this.mSensorSize);
        Collections.sort(ratios, new CompareAspectRatioByOverlappingAreaToReference(actualSensorAspectRatio, true));
    }

    static Rect getCropRectOfReferenceAspectRatio(Size targetSize, Size referenceSize) {
        Rational referenceRatio = toRational(referenceSize);
        return getCenterCroppedRectangle(referenceRatio, targetSize);
    }

    private static List<Size> getSupportedPrivResolutions(List<Pair<Integer, Size[]>> supportedResolutionsMap) {
        for (Pair<Integer, Size[]> pair : supportedResolutionsMap) {
            if (((Integer) pair.first).equals(34)) {
                return Arrays.asList((Size[]) pair.second);
            }
        }
        return new ArrayList();
    }

    private static Rational getSensorAspectRatio(Size sensorSize) {
        Rational result = findCloserAspectRatio(sensorSize);
        Logger.d(TAG, "The closer aspect ratio to the sensor size (" + sensorSize + ") is " + result + ".");
        return result;
    }

    private static Rational findCloserAspectRatio(Size size) {
        double widthHeightRatio = size.getWidth() / size.getHeight();
        if (widthHeightRatio > SAME_AREA_WIDTH_HEIGHT_RATIO) {
            return AspectRatioUtil.ASPECT_RATIO_16_9;
        }
        return AspectRatioUtil.ASPECT_RATIO_4_3;
    }

    static Rect reverseRect(Rect rect) {
        return new Rect(rect.top, rect.left, rect.bottom, rect.right);
    }

    private static Rect getCenterCroppedRectangle(Rational cropRatio, Size baseSize) {
        RectF cropRectInFloat;
        int width = baseSize.getWidth();
        int height = baseSize.getHeight();
        Rational referenceRatio = toRational(baseSize);
        if (cropRatio.floatValue() == referenceRatio.floatValue()) {
            cropRectInFloat = new RectF(0.0f, 0.0f, width, height);
        } else if (cropRatio.floatValue() > referenceRatio.floatValue()) {
            float cropHeight = width / cropRatio.floatValue();
            float yOffset = (height - cropHeight) / 2.0f;
            cropRectInFloat = new RectF(0.0f, yOffset, width, yOffset + cropHeight);
        } else {
            float cropWidth = height * cropRatio.floatValue();
            float xOffset = (width - cropWidth) / 2.0f;
            cropRectInFloat = new RectF(xOffset, 0.0f, xOffset + cropWidth, height);
        }
        Rect result = new Rect();
        cropRectInFloat.round(result);
        return result;
    }

    private static Rational getFallbackAspectRatio(Rational sensorAspectRatio) {
        if (sensorAspectRatio.equals(AspectRatioUtil.ASPECT_RATIO_4_3)) {
            return AspectRatioUtil.ASPECT_RATIO_16_9;
        }
        if (sensorAspectRatio.equals(AspectRatioUtil.ASPECT_RATIO_16_9)) {
            return AspectRatioUtil.ASPECT_RATIO_4_3;
        }
        throw new IllegalArgumentException("Invalid sensor aspect-ratio: " + sensorAspectRatio);
    }

    static void sortInDescendingOrder(List<Size> resolutions) {
        Collections.sort(resolutions, new CompareSizesByArea(true));
    }

    private static List<Size> removeDuplicates(List<Size> resolutions) {
        if (resolutions.isEmpty()) {
            return resolutions;
        }
        return new ArrayList(new LinkedHashSet(resolutions));
    }

    static List<Size> filterResolutionsByAspectRatio(Rational aspectRatio, List<Size> resolutionsToFilter) {
        List<Size> result = new ArrayList<>();
        for (Size resolution : resolutionsToFilter) {
            if (AspectRatioUtil.hasMatchingAspectRatio(resolution, aspectRatio)) {
                result.add(resolution);
            }
        }
        return result;
    }

    static List<Size> filterOutParentSizeThatIsTooSmall(Collection<Size> childSizes, List<Size> parentSizes) {
        if (childSizes.isEmpty() || parentSizes.isEmpty()) {
            return new ArrayList();
        }
        List<Size> result = new ArrayList<>();
        for (Size parentSize : parentSizes) {
            if (isAnyChildSizeCanBeCroppedOutWithoutUpscalingParent(childSizes, parentSize)) {
                result.add(parentSize);
            }
        }
        return result;
    }

    private static List<Size> filterOutChildSizesThatWillNeverBeSelected(List<Size> childSizes) {
        Map<Rational, Size> smallestSizeMap = new HashMap<>();
        List<Size> result = new ArrayList<>();
        for (Size size : childSizes) {
            Rational keyRatio = null;
            Iterator<Rational> it = smallestSizeMap.keySet().iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                Rational seenRatio = it.next();
                if (AspectRatioUtil.hasMatchingAspectRatio(size, seenRatio)) {
                    keyRatio = seenRatio;
                    break;
                }
            }
            if (keyRatio != null) {
                Size smallestSize = (Size) Objects.requireNonNull(smallestSizeMap.get(keyRatio));
                if (size.getHeight() <= smallestSize.getHeight()) {
                    if (size.getWidth() <= smallestSize.getWidth()) {
                        if (size.getWidth() == smallestSize.getWidth() && size.getHeight() == smallestSize.getHeight()) {
                        }
                    }
                }
            } else {
                keyRatio = toRational(size);
            }
            result.add(size);
            smallestSizeMap.put(keyRatio, size);
        }
        return result;
    }

    private static boolean isAnyChildSizeCanBeCroppedOutWithoutUpscalingParent(Collection<Size> childSizes, Size parentSize) {
        for (Size childSize : childSizes) {
            if (!hasUpscaling(childSize, parentSize)) {
                return true;
            }
        }
        return false;
    }

    static List<Size> getParentSizesThatAreTooLarge(Collection<Size> childSizes, List<Size> parentSizes) {
        if (childSizes.isEmpty() || parentSizes.isEmpty()) {
            return new ArrayList();
        }
        List<Size> parentSizes2 = removeDuplicates(parentSizes);
        List<Size> result = new ArrayList<>();
        for (Size parentSize : parentSizes2) {
            if (isAllChildSizesCanBeCroppedOutWithoutUpscalingParent(childSizes, parentSize)) {
                result.add(parentSize);
            }
        }
        if (!result.isEmpty()) {
            result.remove(result.size() - 1);
        }
        return result;
    }

    private static boolean isAllChildSizesCanBeCroppedOutWithoutUpscalingParent(Collection<Size> childSizes, Size parentSize) {
        for (Size childSize : childSizes) {
            if (hasUpscaling(childSize, parentSize)) {
                return false;
            }
        }
        return true;
    }

    static boolean hasUpscaling(Size childSize, Size parentSize) {
        return childSize.getHeight() > parentSize.getHeight() || childSize.getWidth() > parentSize.getWidth();
    }

    private static Rational toRationalWithMod16Considered(Size size) {
        if (AspectRatioUtil.hasMatchingAspectRatio(size, AspectRatioUtil.ASPECT_RATIO_4_3)) {
            return AspectRatioUtil.ASPECT_RATIO_4_3;
        }
        if (AspectRatioUtil.hasMatchingAspectRatio(size, AspectRatioUtil.ASPECT_RATIO_16_9)) {
            return AspectRatioUtil.ASPECT_RATIO_16_9;
        }
        return toRational(size);
    }

    private static Rational toRational(Size size) {
        return new Rational(size.getWidth(), size.getHeight());
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static float computeAreaOverlapping(Rational croppingRatio, Rational baseRatio) {
        float croppingRatioValue = croppingRatio.floatValue();
        float baseRatioValue = baseRatio.floatValue();
        return croppingRatioValue > baseRatioValue ? baseRatioValue / croppingRatioValue : croppingRatioValue / baseRatioValue;
    }

    private static class CompareAspectRatioByOverlappingAreaToReference implements Comparator<Rational> {
        private final Rational mReferenceAspectRatio;
        private final boolean mReverse;

        CompareAspectRatioByOverlappingAreaToReference(Rational referenceAspectRatio, boolean reverse) {
            this.mReferenceAspectRatio = referenceAspectRatio;
            this.mReverse = reverse;
        }

        @Override // java.util.Comparator
        public int compare(Rational lhs, Rational rhs) {
            float lhsOverlapping = ResolutionsMerger.computeAreaOverlapping(lhs, this.mReferenceAspectRatio);
            float rhsOverlapping = ResolutionsMerger.computeAreaOverlapping(rhs, this.mReferenceAspectRatio);
            if (this.mReverse) {
                return Float.compare(rhsOverlapping, lhsOverlapping);
            }
            return Float.compare(lhsOverlapping, rhsOverlapping);
        }
    }
}
