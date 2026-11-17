package androidx.camera.video.internal.compat.quirk;

import android.os.Build;
import android.util.Range;
import android.util.Size;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.EncoderProfilesProvider;
import androidx.camera.core.impl.EncoderProfilesProxy;
import androidx.camera.core.impl.Quirk;
import androidx.camera.core.internal.utils.SizeUtil;
import androidx.camera.video.VideoSpec;
import androidx.camera.video.internal.encoder.VideoEncoderInfo;
import androidx.camera.video.internal.utils.EncoderProfilesUtil;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes.dex */
public class ExtraSupportedQualityQuirk implements Quirk {
    private static final String MOTO_C_FRONT_CAM_ID = "1";

    static boolean load() {
        return isMotoC();
    }

    private static boolean isMotoC() {
        return "motorola".equalsIgnoreCase(Build.BRAND) && "moto c".equalsIgnoreCase(Build.MODEL);
    }

    public Map<Integer, EncoderProfilesProxy> getExtraEncoderProfiles(CameraInfoInternal cameraInfo, EncoderProfilesProvider encoderProfilesProvider, VideoEncoderInfo.Finder videoEncoderInfoFinder) {
        if (isMotoC()) {
            return getExtraEncoderProfilesForMotoC(cameraInfo, encoderProfilesProvider, videoEncoderInfoFinder);
        }
        return Collections.emptyMap();
    }

    private Map<Integer, EncoderProfilesProxy> getExtraEncoderProfilesForMotoC(CameraInfoInternal cameraInfo, EncoderProfilesProvider encoderProfilesProvider, VideoEncoderInfo.Finder videoEncoderInfoFinder) {
        EncoderProfilesProxy profilesHigh;
        EncoderProfilesProxy.VideoProfileProxy videoProfileHigh;
        if (!MOTO_C_FRONT_CAM_ID.equals(cameraInfo.getCameraId()) || encoderProfilesProvider.hasProfile(4) || (videoProfileHigh = EncoderProfilesUtil.getFirstVideoProfile((profilesHigh = encoderProfilesProvider.getAll(1)))) == null) {
            return null;
        }
        Range<Integer> supportedBitrateRange = getSupportedBitrateRange(videoProfileHigh, videoEncoderInfoFinder);
        EncoderProfilesProxy.VideoProfileProxy derivedVideoProfile = EncoderProfilesUtil.deriveVideoProfile(videoProfileHigh, SizeUtil.RESOLUTION_480P, supportedBitrateRange);
        EncoderProfilesProxy create = EncoderProfilesProxy.ImmutableEncoderProfilesProxy.create(profilesHigh.getDefaultDurationSeconds(), profilesHigh.getRecommendedFileFormat(), profilesHigh.getAudioProfiles(), Collections.singletonList(derivedVideoProfile));
        Map<Integer, EncoderProfilesProxy> extraEncoderProfilesMap = new HashMap<>();
        extraEncoderProfilesMap.put(4, create);
        Size sizeHigh = videoProfileHigh.getResolution();
        if (SizeUtil.getArea(SizeUtil.RESOLUTION_480P) > SizeUtil.getArea(sizeHigh)) {
            extraEncoderProfilesMap.put(1, create);
        }
        return extraEncoderProfilesMap;
    }

    private static Range<Integer> getSupportedBitrateRange(EncoderProfilesProxy.VideoProfileProxy videoProfile, VideoEncoderInfo.Finder videoEncoderInfoFinder) {
        VideoEncoderInfo encoderInfo = videoEncoderInfoFinder.find(videoProfile.getMediaType());
        return encoderInfo != null ? encoderInfo.getSupportedBitrateRange() : VideoSpec.BITRATE_RANGE_AUTO;
    }
}
