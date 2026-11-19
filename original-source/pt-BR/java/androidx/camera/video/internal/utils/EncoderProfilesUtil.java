package androidx.camera.video.internal.utils;

import android.util.Range;
import android.util.Size;
import androidx.camera.core.impl.EncoderProfilesProxy;
import androidx.camera.video.internal.config.VideoConfigUtil;

/* carregado de: classes.dex */
public class EncoderProfilesUtil {
    private EncoderProfilesUtil() {
    }

    public static EncoderProfilesProxy.VideoProfileProxy deriveVideoProfile(EncoderProfilesProxy.VideoProfileProxy baseVideoProfile, Size newResolution, Range<Integer> bitrateRangeToClamp) {
        int derivedBitrate = VideoConfigUtil.scaleAndClampBitrate(baseVideoProfile.getBitrate(), baseVideoProfile.getBitDepth(), baseVideoProfile.getBitDepth(), baseVideoProfile.getFrameRate(), baseVideoProfile.getFrameRate(), newResolution.getWidth(), baseVideoProfile.getWidth(), newResolution.getHeight(), baseVideoProfile.getHeight(), bitrateRangeToClamp);
        return EncoderProfilesProxy.VideoProfileProxy.create(baseVideoProfile.getCodec(), baseVideoProfile.getMediaType(), derivedBitrate, baseVideoProfile.getFrameRate(), newResolution.getWidth(), newResolution.getHeight(), baseVideoProfile.getProfile(), baseVideoProfile.getBitDepth(), baseVideoProfile.getChromaSubsampling(), baseVideoProfile.getHdrFormat());
    }

    public static EncoderProfilesProxy.VideoProfileProxy getFirstVideoProfile(EncoderProfilesProxy encoderProfiles) {
        if (encoderProfiles != null && !encoderProfiles.getVideoProfiles().isEmpty()) {
            return encoderProfiles.getVideoProfiles().get(0);
        }
        return null;
    }
}
