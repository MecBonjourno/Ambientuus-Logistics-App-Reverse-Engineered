package androidx.camera.video.internal;

import android.util.Size;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.impl.EncoderProfilesProvider;
import androidx.camera.core.impl.EncoderProfilesProxy;
import androidx.camera.core.impl.utils.CompareSizesByArea;
import androidx.camera.core.internal.utils.SizeUtil;
import androidx.camera.video.CapabilitiesByQuality;
import androidx.camera.video.Quality;
import androidx.camera.video.internal.encoder.VideoEncoderInfo;
import androidx.camera.video.internal.utils.DynamicRangeUtil;
import androidx.camera.video.internal.utils.EncoderProfilesUtil;
import androidx.core.util.Preconditions;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

/* carregado de: classes.dex */
public class QualityExploredEncoderProfilesProvider implements EncoderProfilesProvider {
    private final EncoderProfilesProvider mBaseEncoderProfilesProvider;
    private final Set<Size> mCameraSupportedResolutions;
    private final Set<DynamicRange> mTargetDynamicRanges;
    private final Set<Quality> mTargetQualities;
    private final VideoEncoderInfo.Finder mVideoEncoderInfoFinder;
    private final Map<Integer, EncoderProfilesProxy> mEncoderProfilesCache = new HashMap();
    private final Map<DynamicRange, CapabilitiesByQuality> mDynamicRangeToCapabilitiesMap = new HashMap();

    public QualityExploredEncoderProfilesProvider(EncoderProfilesProvider baseProvider, Collection<Quality> targetQualities, Collection<DynamicRange> targetDynamicRanges, Collection<Size> cameraSupportedResolutions, VideoEncoderInfo.Finder videoEncoderInfoFinder) {
        checkFullySpecifiedOrThrow(targetDynamicRanges);
        this.mBaseEncoderProfilesProvider = baseProvider;
        this.mTargetQualities = new HashSet(targetQualities);
        this.mTargetDynamicRanges = new HashSet(targetDynamicRanges);
        this.mCameraSupportedResolutions = new HashSet(cameraSupportedResolutions);
        this.mVideoEncoderInfoFinder = videoEncoderInfoFinder;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProvider
    public boolean hasProfile(int quality) {
        return getProfilesInternal(quality) != null;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProvider
    public EncoderProfilesProxy getAll(int quality) {
        return getProfilesInternal(quality);
    }

    private EncoderProfilesProxy getProfilesInternal(int qualityValue) {
        if (this.mEncoderProfilesCache.containsKey(Integer.valueOf(qualityValue))) {
            return this.mEncoderProfilesCache.get(Integer.valueOf(qualityValue));
        }
        EncoderProfilesProxy profiles = this.mBaseEncoderProfilesProvider.getAll(qualityValue);
        Quality.ConstantQuality quality = findQualityInTargetQualities(qualityValue);
        if (quality != null && !hasMatchedVideoProfileForAllTargetDynamicRanges(profiles)) {
            profiles = mergeEncoderProfiles(profiles, exploreProfiles(quality));
        }
        this.mEncoderProfilesCache.put(Integer.valueOf(qualityValue), profiles);
        return profiles;
    }

    private boolean hasMatchedVideoProfileForAllTargetDynamicRanges(EncoderProfilesProxy encoderProfiles) {
        if (encoderProfiles == null) {
            return false;
        }
        for (DynamicRange dynamicRange : this.mTargetDynamicRanges) {
            if (!hasMatchedVideoProfileForDynamicRange(encoderProfiles, dynamicRange)) {
                return false;
            }
        }
        return true;
    }

    private EncoderProfilesProxy exploreProfiles(Quality.ConstantQuality quality) {
        VideoValidatedEncoderProfilesProxy encoderProfiles;
        Preconditions.checkArgument(this.mTargetQualities.contains(quality));
        EncoderProfilesProxy qualityMappedProfiles = this.mBaseEncoderProfilesProvider.getAll(quality.getQualityValue(1));
        for (Size size : quality.getTypicalSizes()) {
            if (this.mCameraSupportedResolutions.contains(size)) {
                TreeMap<Size, EncoderProfilesProxy> areaSortedSizeToEncoderProfilesMap = new TreeMap<>(new CompareSizesByArea());
                List<EncoderProfilesProxy.VideoProfileProxy> generatedVideoProfiles = new ArrayList<>();
                for (DynamicRange dynamicRange : this.mTargetDynamicRanges) {
                    if (!hasMatchedVideoProfileForDynamicRange(qualityMappedProfiles, dynamicRange) && (encoderProfiles = getCapabilitiesByQualityFor(dynamicRange).findNearestHigherSupportedEncoderProfilesFor(size)) != null) {
                        EncoderProfilesProxy.VideoProfileProxy baseVideoProfile = encoderProfiles.getDefaultVideoProfile();
                        VideoEncoderInfo encoderInfo = this.mVideoEncoderInfoFinder.find(baseVideoProfile.getMediaType());
                        if (encoderInfo != null && encoderInfo.isSizeSupportedAllowSwapping(size.getWidth(), size.getHeight())) {
                            areaSortedSizeToEncoderProfilesMap.put(baseVideoProfile.getResolution(), encoderProfiles);
                            generatedVideoProfiles.add(EncoderProfilesUtil.deriveVideoProfile(baseVideoProfile, size, encoderInfo.getSupportedBitrateRange()));
                        }
                    }
                }
                if (!generatedVideoProfiles.isEmpty()) {
                    EncoderProfilesProxy baseProfiles = (EncoderProfilesProxy) Objects.requireNonNull((EncoderProfilesProxy) SizeUtil.findNearestHigherFor(size, areaSortedSizeToEncoderProfilesMap));
                    return EncoderProfilesProxy.ImmutableEncoderProfilesProxy.create(baseProfiles.getDefaultDurationSeconds(), baseProfiles.getRecommendedFileFormat(), baseProfiles.getAudioProfiles(), generatedVideoProfiles);
                }
            }
        }
        return null;
    }

    private Quality.ConstantQuality findQualityInTargetQualities(int qualityValue) {
        for (Quality quality : this.mTargetQualities) {
            Quality.ConstantQuality constantQuality = (Quality.ConstantQuality) quality;
            if (constantQuality.getQualityValue(1) == qualityValue) {
                return constantQuality;
            }
        }
        return null;
    }

    private CapabilitiesByQuality getCapabilitiesByQualityFor(DynamicRange dynamicRange) {
        if (this.mDynamicRangeToCapabilitiesMap.containsKey(dynamicRange)) {
            return (CapabilitiesByQuality) Objects.requireNonNull(this.mDynamicRangeToCapabilitiesMap.get(dynamicRange));
        }
        EncoderProfilesProvider constrainedProvider = new DynamicRangeMatchedEncoderProfilesProvider(this.mBaseEncoderProfilesProvider, dynamicRange);
        CapabilitiesByQuality capabilities = new CapabilitiesByQuality(constrainedProvider, 1);
        this.mDynamicRangeToCapabilitiesMap.put(dynamicRange, capabilities);
        return capabilities;
    }

    private static EncoderProfilesProxy mergeEncoderProfiles(EncoderProfilesProxy baseProfiles, EncoderProfilesProxy profilesToMerge) {
        if (baseProfiles == null && profilesToMerge == null) {
            return null;
        }
        int duration = baseProfiles != null ? baseProfiles.getDefaultDurationSeconds() : profilesToMerge.getDefaultDurationSeconds();
        int format = baseProfiles != null ? baseProfiles.getRecommendedFileFormat() : profilesToMerge.getRecommendedFileFormat();
        List<EncoderProfilesProxy.AudioProfileProxy> audioProfiles = baseProfiles != null ? baseProfiles.getAudioProfiles() : profilesToMerge.getAudioProfiles();
        List<EncoderProfilesProxy.VideoProfileProxy> videoProfiles = new ArrayList<>();
        if (baseProfiles != null) {
            videoProfiles.addAll(baseProfiles.getVideoProfiles());
        }
        if (profilesToMerge != null) {
            videoProfiles.addAll(profilesToMerge.getVideoProfiles());
        }
        return EncoderProfilesProxy.ImmutableEncoderProfilesProxy.create(duration, format, audioProfiles, videoProfiles);
    }

    private static boolean hasMatchedVideoProfileForDynamicRange(EncoderProfilesProxy encoderProfiles, DynamicRange dynamicRange) {
        if (encoderProfiles == null) {
            return false;
        }
        for (EncoderProfilesProxy.VideoProfileProxy videoProfile : encoderProfiles.getVideoProfiles()) {
            if (DynamicRangeUtil.isHdrSettingsMatched(videoProfile, dynamicRange)) {
                return true;
            }
        }
        return false;
    }

    private static void checkFullySpecifiedOrThrow(Collection<DynamicRange> dynamicRanges) {
        for (DynamicRange dynamicRange : dynamicRanges) {
            if (!dynamicRange.isFullySpecified()) {
                throw new IllegalArgumentException("Contains non-fully specified DynamicRange: " + dynamicRange);
            }
        }
    }
}
