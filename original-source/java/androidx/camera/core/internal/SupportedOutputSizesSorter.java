package androidx.camera.core.internal;

import android.util.Pair;
import android.util.Rational;
import android.util.Size;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.ImageOutputConfig;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.utils.AspectRatioUtil;
import androidx.camera.core.impl.utils.CameraOrientationUtil;
import androidx.camera.core.impl.utils.CompareSizesByArea;
import androidx.camera.core.internal.utils.SizeUtil;
import androidx.camera.core.resolutionselector.AspectRatioStrategy;
import androidx.camera.core.resolutionselector.ResolutionFilter;
import androidx.camera.core.resolutionselector.ResolutionSelector;
import androidx.camera.core.resolutionselector.ResolutionStrategy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public class SupportedOutputSizesSorter {
    private static final String TAG = "SupportedOutputSizesCollector";
    private final CameraInfoInternal mCameraInfoInternal;
    private final Rational mFullFovRatio;
    private final int mLensFacing;
    private final int mSensorOrientation;
    private final SupportedOutputSizesSorterLegacy mSupportedOutputSizesSorterLegacy;

    public SupportedOutputSizesSorter(CameraInfoInternal cameraInfoInternal, Size activeArraySize) {
        this.mCameraInfoInternal = cameraInfoInternal;
        this.mSensorOrientation = this.mCameraInfoInternal.getSensorRotationDegrees();
        this.mLensFacing = this.mCameraInfoInternal.getLensFacing();
        this.mFullFovRatio = activeArraySize != null ? calculateFullFovRatioFromActiveArraySize(activeArraySize) : calculateFullFovRatioFromSupportedOutputSizes(this.mCameraInfoInternal);
        this.mSupportedOutputSizesSorterLegacy = new SupportedOutputSizesSorterLegacy(cameraInfoInternal, this.mFullFovRatio);
    }

    private Rational calculateFullFovRatioFromActiveArraySize(Size activeArraySize) {
        return new Rational(activeArraySize.getWidth(), activeArraySize.getHeight());
    }

    private Rational calculateFullFovRatioFromSupportedOutputSizes(CameraInfoInternal cameraInfoInternal) {
        List<Size> jpegOutputSizes = cameraInfoInternal.getSupportedResolutions(256);
        if (jpegOutputSizes.isEmpty()) {
            return null;
        }
        Size maxSize = (Size) Collections.max(jpegOutputSizes, new CompareSizesByArea());
        return new Rational(maxSize.getWidth(), maxSize.getHeight());
    }

    public List<Size> getSortedSupportedOutputSizes(UseCaseConfig<?> useCaseConfig) {
        List<Size> candidateSizes;
        ImageOutputConfig imageOutputConfig = (ImageOutputConfig) useCaseConfig;
        List<Size> customOrderedResolutions = imageOutputConfig.getCustomOrderedResolutions(null);
        if (customOrderedResolutions != null) {
            return customOrderedResolutions;
        }
        ResolutionSelector resolutionSelector = imageOutputConfig.getResolutionSelector(null);
        List<Pair<Integer, Size[]>> customResolutions = imageOutputConfig.getSupportedResolutions(null);
        List<Size> candidateSizes2 = getResolutionCandidateList(customResolutions, useCaseConfig.getInputFormat());
        if (resolutionSelector != null) {
            Size maxResolution = ((ImageOutputConfig) useCaseConfig).getMaxResolution(null);
            int targetRotation = imageOutputConfig.getTargetRotation(0);
            if (useCaseConfig.isHighResolutionDisabled(false)) {
                candidateSizes = candidateSizes2;
            } else {
                candidateSizes = applyHighResolutionSettings(candidateSizes2, resolutionSelector, useCaseConfig.getInputFormat());
            }
            Logger.d(TAG, "useCaseConfig = " + useCaseConfig + ", candidateSizes = " + candidateSizes);
            return sortSupportedOutputSizesByResolutionSelector(imageOutputConfig.getResolutionSelector(), candidateSizes, maxResolution, targetRotation, this.mFullFovRatio, this.mSensorOrientation, this.mLensFacing);
        }
        return this.mSupportedOutputSizesSorterLegacy.sortSupportedOutputSizes(candidateSizes2, useCaseConfig);
    }

    private List<Size> getSizeListByFormat(List<Pair<Integer, Size[]>> resolutionsPairList, int imageFormat) {
        Size[] outputSizes = null;
        if (resolutionsPairList != null) {
            Iterator<Pair<Integer, Size[]>> it = resolutionsPairList.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                Pair<Integer, Size[]> formatResolutionPair = it.next();
                if (((Integer) formatResolutionPair.first).intValue() == imageFormat) {
                    outputSizes = (Size[]) formatResolutionPair.second;
                    break;
                }
            }
        }
        if (outputSizes == null) {
            return null;
        }
        return Arrays.asList(outputSizes);
    }

    public static List<Size> sortSupportedOutputSizesByResolutionSelector(ResolutionSelector resolutionSelector, List<Size> candidateSizes, Size maxResolution, int targetRotation, Rational fullFovRatio, int sensorOrientation, int lensFacing) {
        LinkedHashMap<Rational, List<Size>> aspectRatioSizeListMap = applyAspectRatioStrategy(candidateSizes, resolutionSelector.getAspectRatioStrategy(), fullFovRatio);
        if (maxResolution != null) {
            applyMaxResolutionRestriction(aspectRatioSizeListMap, maxResolution);
        }
        applyResolutionStrategy(aspectRatioSizeListMap, resolutionSelector.getResolutionStrategy());
        List<Size> resultList = new ArrayList<>();
        for (List<Size> sortedSizes : aspectRatioSizeListMap.values()) {
            for (Size size : sortedSizes) {
                if (!resultList.contains(size)) {
                    resultList.add(size);
                }
            }
        }
        return applyResolutionFilter(resultList, resolutionSelector.getResolutionFilter(), targetRotation, sensorOrientation, lensFacing);
    }

    private List<Size> getResolutionCandidateList(List<Pair<Integer, Size[]>> customResolutions, int imageFormat) {
        List<Size> resolutionCandidateList = getSizeListByFormat(customResolutions, imageFormat);
        if (resolutionCandidateList == null) {
            resolutionCandidateList = this.mCameraInfoInternal.getSupportedResolutions(imageFormat);
        }
        List<Size> resolutionCandidateList2 = new ArrayList<>(resolutionCandidateList);
        Collections.sort(resolutionCandidateList2, new CompareSizesByArea(true));
        if (resolutionCandidateList2.isEmpty()) {
            Logger.w(TAG, "The retrieved supported resolutions from camera info internal is empty. Format is " + imageFormat + ".");
        }
        return resolutionCandidateList2;
    }

    private List<Size> applyHighResolutionSettings(List<Size> resolutionCandidateList, ResolutionSelector resolutionSelector, int imageFormat) {
        if (resolutionSelector.getAllowedResolutionMode() == 1) {
            List<Size> allSizesList = new ArrayList<>();
            allSizesList.addAll(resolutionCandidateList);
            allSizesList.addAll(this.mCameraInfoInternal.getSupportedHighResolutions(imageFormat));
            Collections.sort(allSizesList, new CompareSizesByArea(true));
            return allSizesList;
        }
        return resolutionCandidateList;
    }

    private static LinkedHashMap<Rational, List<Size>> applyAspectRatioStrategy(List<Size> resolutionCandidateList, AspectRatioStrategy aspectRatioStrategy, Rational fullFovRatio) {
        Map<Rational, List<Size>> aspectRatioSizeListMap = groupSizesByAspectRatio(resolutionCandidateList);
        return applyAspectRatioStrategyFallbackRule(aspectRatioSizeListMap, aspectRatioStrategy, fullFovRatio);
    }

    private static LinkedHashMap<Rational, List<Size>> applyAspectRatioStrategyFallbackRule(Map<Rational, List<Size>> sizeGroupsMap, AspectRatioStrategy aspectRatioStrategy, Rational fullFovRatio) {
        boolean isSensorLandscapeResolution = true;
        if (fullFovRatio != null && fullFovRatio.getNumerator() < fullFovRatio.getDenominator()) {
            isSensorLandscapeResolution = false;
        }
        Rational aspectRatio = getTargetAspectRatioRationalValue(aspectRatioStrategy.getPreferredAspectRatio(), isSensorLandscapeResolution);
        if (aspectRatioStrategy.getFallbackRule() == 0) {
            Rational preferredAspectRatio = getTargetAspectRatioRationalValue(aspectRatioStrategy.getPreferredAspectRatio(), isSensorLandscapeResolution);
            Iterator it = new ArrayList(sizeGroupsMap.keySet()).iterator();
            while (it.hasNext()) {
                Rational ratio = (Rational) it.next();
                if (!ratio.equals(preferredAspectRatio)) {
                    sizeGroupsMap.remove(ratio);
                }
            }
        }
        List<Rational> aspectRatios = new ArrayList<>(sizeGroupsMap.keySet());
        Collections.sort(aspectRatios, new AspectRatioUtil.CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace(aspectRatio, fullFovRatio));
        LinkedHashMap<Rational, List<Size>> sortedAspectRatioSizeListMap = new LinkedHashMap<>();
        for (Rational ratio2 : aspectRatios) {
            sortedAspectRatioSizeListMap.put(ratio2, sizeGroupsMap.get(ratio2));
        }
        return sortedAspectRatioSizeListMap;
    }

    private static void applyResolutionStrategy(LinkedHashMap<Rational, List<Size>> sortedAspectRatioSizeListMap, ResolutionStrategy resolutionStrategy) {
        if (resolutionStrategy == null) {
            return;
        }
        for (Rational key : sortedAspectRatioSizeListMap.keySet()) {
            applyResolutionStrategyFallbackRule(sortedAspectRatioSizeListMap.get(key), resolutionStrategy);
        }
    }

    private static void applyResolutionStrategyFallbackRule(List<Size> supportedSizesList, ResolutionStrategy resolutionStrategy) {
        if (supportedSizesList.isEmpty()) {
        }
        Integer fallbackRule = Integer.valueOf(resolutionStrategy.getFallbackRule());
        if (resolutionStrategy.equals(ResolutionStrategy.HIGHEST_AVAILABLE_STRATEGY)) {
            return;
        }
        Size boundSize = resolutionStrategy.getBoundSize();
        switch (fallbackRule.intValue()) {
            case 0:
                sortSupportedSizesByFallbackRuleNone(supportedSizesList, boundSize);
                break;
            case 1:
                sortSupportedSizesByFallbackRuleClosestHigherThenLower(supportedSizesList, boundSize, true);
                break;
            case 2:
                sortSupportedSizesByFallbackRuleClosestHigherThenLower(supportedSizesList, boundSize, false);
                break;
            case 3:
                sortSupportedSizesByFallbackRuleClosestLowerThenHigher(supportedSizesList, boundSize, true);
                break;
            case 4:
                sortSupportedSizesByFallbackRuleClosestLowerThenHigher(supportedSizesList, boundSize, false);
                break;
        }
    }

    private static void applyMaxResolutionRestriction(LinkedHashMap<Rational, List<Size>> sortedAspectRatioSizeListMap, Size maxResolution) {
        int maxResolutionAreaSize = SizeUtil.getArea(maxResolution);
        for (Rational key : sortedAspectRatioSizeListMap.keySet()) {
            List<Size> supportedSizesList = sortedAspectRatioSizeListMap.get(key);
            List<Size> filteredResultList = new ArrayList<>();
            for (Size size : supportedSizesList) {
                if (SizeUtil.getArea(size) <= maxResolutionAreaSize) {
                    filteredResultList.add(size);
                }
            }
            supportedSizesList.clear();
            supportedSizesList.addAll(filteredResultList);
        }
    }

    private static List<Size> applyResolutionFilter(List<Size> sizeList, ResolutionFilter resolutionFilter, int targetRotation, int sensorOrientation, int lensFacing) {
        if (resolutionFilter == null) {
            return sizeList;
        }
        int destRotationDegrees = CameraOrientationUtil.surfaceRotationToDegrees(targetRotation);
        int rotationDegrees = CameraOrientationUtil.getRelativeImageRotation(destRotationDegrees, sensorOrientation, lensFacing == 1);
        List<Size> filteredResultList = resolutionFilter.filter(new ArrayList(sizeList), rotationDegrees);
        if (sizeList.containsAll(filteredResultList)) {
            return filteredResultList;
        }
        throw new IllegalArgumentException("The returned sizes list of the resolution filter must be a subset of the provided sizes list.");
    }

    private static void sortSupportedSizesByFallbackRuleNone(List<Size> supportedSizesList, Size boundSize) {
        boolean containsBoundSize = supportedSizesList.contains(boundSize);
        supportedSizesList.clear();
        if (containsBoundSize) {
            supportedSizesList.add(boundSize);
        }
    }

    static void sortSupportedSizesByFallbackRuleClosestHigherThenLower(List<Size> supportedSizesList, Size boundSize, boolean keepLowerSizes) {
        List<Size> lowerSizes = new ArrayList<>();
        for (int i = supportedSizesList.size() - 1; i >= 0; i--) {
            Size outputSize = supportedSizesList.get(i);
            if (outputSize.getWidth() >= boundSize.getWidth() && outputSize.getHeight() >= boundSize.getHeight()) {
                break;
            }
            lowerSizes.add(0, outputSize);
        }
        supportedSizesList.removeAll(lowerSizes);
        Collections.reverse(supportedSizesList);
        if (keepLowerSizes) {
            supportedSizesList.addAll(lowerSizes);
        }
    }

    private static void sortSupportedSizesByFallbackRuleClosestLowerThenHigher(List<Size> supportedSizesList, Size boundSize, boolean keepHigherSizes) {
        List<Size> higherSizes = new ArrayList<>();
        for (int i = 0; i < supportedSizesList.size(); i++) {
            Size outputSize = supportedSizesList.get(i);
            if (outputSize.getWidth() <= boundSize.getWidth() && outputSize.getHeight() <= boundSize.getHeight()) {
                break;
            }
            higherSizes.add(0, outputSize);
        }
        supportedSizesList.removeAll(higherSizes);
        if (keepHigherSizes) {
            supportedSizesList.addAll(higherSizes);
        }
    }

    static Rational getTargetAspectRatioRationalValue(int aspectRatio, boolean isSensorLandscapeResolution) {
        switch (aspectRatio) {
            case -1:
                return null;
            case 0:
                Rational outputRatio = isSensorLandscapeResolution ? AspectRatioUtil.ASPECT_RATIO_4_3 : AspectRatioUtil.ASPECT_RATIO_3_4;
                return outputRatio;
            case 1:
                Rational outputRatio2 = isSensorLandscapeResolution ? AspectRatioUtil.ASPECT_RATIO_16_9 : AspectRatioUtil.ASPECT_RATIO_9_16;
                return outputRatio2;
            default:
                Logger.e(TAG, "Undefined target aspect ratio: " + aspectRatio);
                return null;
        }
    }

    static List<Rational> getResolutionListGroupingAspectRatioKeys(List<Size> resolutionCandidateList) {
        List<Rational> aspectRatios = new ArrayList<>();
        aspectRatios.add(AspectRatioUtil.ASPECT_RATIO_4_3);
        aspectRatios.add(AspectRatioUtil.ASPECT_RATIO_16_9);
        for (Size size : resolutionCandidateList) {
            Rational newRatio = new Rational(size.getWidth(), size.getHeight());
            boolean aspectRatioFound = aspectRatios.contains(newRatio);
            if (!aspectRatioFound) {
                boolean hasMatchingAspectRatio = false;
                Iterator<Rational> it = aspectRatios.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    Rational aspectRatio = it.next();
                    if (AspectRatioUtil.hasMatchingAspectRatio(size, aspectRatio)) {
                        hasMatchingAspectRatio = true;
                        break;
                    }
                }
                if (!hasMatchingAspectRatio) {
                    aspectRatios.add(newRatio);
                }
            }
        }
        return aspectRatios;
    }

    static Map<Rational, List<Size>> groupSizesByAspectRatio(List<Size> sizes) {
        Map<Rational, List<Size>> aspectRatioSizeListMap = new HashMap<>();
        List<Rational> aspectRatioKeys = getResolutionListGroupingAspectRatioKeys(sizes);
        for (Rational aspectRatio : aspectRatioKeys) {
            aspectRatioSizeListMap.put(aspectRatio, new ArrayList<>());
        }
        for (Size outputSize : sizes) {
            for (Rational key : aspectRatioSizeListMap.keySet()) {
                if (AspectRatioUtil.hasMatchingAspectRatio(outputSize, key)) {
                    aspectRatioSizeListMap.get(key).add(outputSize);
                }
            }
        }
        return aspectRatioSizeListMap;
    }
}
