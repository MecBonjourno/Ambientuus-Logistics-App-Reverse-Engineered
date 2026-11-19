package androidx.camera.video;

import android.util.Size;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.EncoderProfilesProvider;
import androidx.camera.core.impl.EncoderProfilesProxy;
import androidx.camera.core.impl.utils.CompareSizesByArea;
import androidx.camera.core.internal.utils.SizeUtil;
import androidx.camera.video.Quality;
import androidx.camera.video.internal.VideoValidatedEncoderProfilesProxy;
import androidx.core.util.Preconditions;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/* carregado de: classes.dex */
public class CapabilitiesByQuality {
    private static final String TAG = "CapabilitiesByQuality";
    private final VideoValidatedEncoderProfilesProxy mHighestProfiles;
    private final VideoValidatedEncoderProfilesProxy mLowestProfiles;
    private final Map<Quality, VideoValidatedEncoderProfilesProxy> mSupportedProfilesMap = new LinkedHashMap();
    private final TreeMap<Size, Quality> mAreaSortedSizeToQualityMap = new TreeMap<>(new CompareSizesByArea());

    public CapabilitiesByQuality(EncoderProfilesProvider provider, int qualitySource) {
        for (Quality quality : Quality.getSortedQualities()) {
            EncoderProfilesProxy profiles = getEncoderProfiles(quality, provider, qualitySource);
            if (profiles != null) {
                Logger.d(TAG, "profiles = " + profiles);
                VideoValidatedEncoderProfilesProxy validatedProfiles = toValidatedProfiles(profiles);
                if (validatedProfiles == null) {
                    Logger.w(TAG, "EncoderProfiles of quality " + quality + " has no video validated profiles.");
                } else {
                    EncoderProfilesProxy.VideoProfileProxy videoProfile = validatedProfiles.getDefaultVideoProfile();
                    this.mAreaSortedSizeToQualityMap.put(videoProfile.getResolution(), quality);
                    this.mSupportedProfilesMap.put(quality, validatedProfiles);
                }
            }
        }
        if (this.mSupportedProfilesMap.isEmpty()) {
            Logger.e(TAG, "No supported EncoderProfiles");
            this.mLowestProfiles = null;
            this.mHighestProfiles = null;
        } else {
            Deque<VideoValidatedEncoderProfilesProxy> profileQueue = new ArrayDeque<>(this.mSupportedProfilesMap.values());
            this.mHighestProfiles = profileQueue.peekFirst();
            this.mLowestProfiles = profileQueue.peekLast();
        }
    }

    public List<Quality> getSupportedQualities() {
        return new ArrayList(this.mSupportedProfilesMap.keySet());
    }

    public boolean isQualitySupported(Quality quality) {
        checkQualityConstantsOrThrow(quality);
        return getProfiles(quality) != null;
    }

    public VideoValidatedEncoderProfilesProxy getProfiles(Quality quality) {
        checkQualityConstantsOrThrow(quality);
        if (quality == Quality.HIGHEST) {
            return this.mHighestProfiles;
        }
        if (quality == Quality.LOWEST) {
            return this.mLowestProfiles;
        }
        return this.mSupportedProfilesMap.get(quality);
    }

    public VideoValidatedEncoderProfilesProxy findNearestHigherSupportedEncoderProfilesFor(Size size) {
        VideoValidatedEncoderProfilesProxy encoderProfiles = null;
        Quality highestSupportedQuality = findNearestHigherSupportedQualityFor(size);
        Logger.d(TAG, "Using supported quality of " + highestSupportedQuality + " for size " + size);
        if (highestSupportedQuality != Quality.NONE && (encoderProfiles = getProfiles(highestSupportedQuality)) == null) {
            throw new AssertionError("Camera advertised available quality but did not produce EncoderProfiles for advertised quality.");
        }
        return encoderProfiles;
    }

    public Quality findNearestHigherSupportedQualityFor(Size size) {
        Quality quality = (Quality) SizeUtil.findNearestHigherFor(size, this.mAreaSortedSizeToQualityMap);
        return quality != null ? quality : Quality.NONE;
    }

    private EncoderProfilesProxy getEncoderProfiles(Quality quality, EncoderProfilesProvider provider, int qualitySource) {
        Preconditions.checkState(quality instanceof Quality.ConstantQuality, "Currently only support ConstantQuality");
        Quality.ConstantQuality constantQuality = (Quality.ConstantQuality) quality;
        int qualityValue = constantQuality.getQualityValue(qualitySource);
        return provider.getAll(qualityValue);
    }

    private VideoValidatedEncoderProfilesProxy toValidatedProfiles(EncoderProfilesProxy profiles) {
        List<EncoderProfilesProxy.VideoProfileProxy> videoProfiles = profiles.getVideoProfiles();
        if (videoProfiles.isEmpty()) {
            return null;
        }
        return VideoValidatedEncoderProfilesProxy.from(profiles);
    }

    public static boolean containsSupportedQuality(EncoderProfilesProvider provider, int qualitySource) {
        return !new CapabilitiesByQuality(provider, qualitySource).getSupportedQualities().isEmpty();
    }

    private static void checkQualityConstantsOrThrow(Quality quality) {
        Preconditions.checkArgument(Quality.containsQuality(quality), "Unknown quality: " + quality);
    }
}
