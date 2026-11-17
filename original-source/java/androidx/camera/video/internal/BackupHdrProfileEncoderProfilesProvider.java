package androidx.camera.video.internal;

import android.util.Rational;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.EncoderProfilesProvider;
import androidx.camera.core.impl.EncoderProfilesProxy;
import androidx.camera.video.internal.encoder.VideoEncoderInfo;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public class BackupHdrProfileEncoderProfilesProvider implements EncoderProfilesProvider {
    private static final String TAG = "BackupHdrProfileEncoderProfilesProvider";
    private final Map<Integer, EncoderProfilesProxy> mEncoderProfilesCache = new HashMap();
    private final EncoderProfilesProvider mEncoderProfilesProvider;
    private final VideoEncoderInfo.Finder mVideoEncoderInfoFinder;

    public BackupHdrProfileEncoderProfilesProvider(EncoderProfilesProvider provider, VideoEncoderInfo.Finder videoEncoderInfoFinder) {
        this.mEncoderProfilesProvider = provider;
        this.mVideoEncoderInfoFinder = videoEncoderInfoFinder;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProvider
    public boolean hasProfile(int quality) {
        return this.mEncoderProfilesProvider.hasProfile(quality) && getProfilesInternal(quality) != null;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProvider
    public EncoderProfilesProxy getAll(int quality) {
        return getProfilesInternal(quality);
    }

    private EncoderProfilesProxy getProfilesInternal(int quality) {
        if (this.mEncoderProfilesCache.containsKey(Integer.valueOf(quality))) {
            return this.mEncoderProfilesCache.get(Integer.valueOf(quality));
        }
        if (!this.mEncoderProfilesProvider.hasProfile(quality)) {
            return null;
        }
        EncoderProfilesProxy baseProfiles = this.mEncoderProfilesProvider.getAll(quality);
        EncoderProfilesProxy profiles = appendBackupVideoProfile(baseProfiles, 1, 10);
        this.mEncoderProfilesCache.put(Integer.valueOf(quality), profiles);
        return profiles;
    }

    private EncoderProfilesProxy appendBackupVideoProfile(EncoderProfilesProxy baseProfiles, int targetHdrFormat, int targetBitDepth) {
        if (baseProfiles == null) {
            return null;
        }
        List<EncoderProfilesProxy.VideoProfileProxy> videoProfiles = new ArrayList<>(baseProfiles.getVideoProfiles());
        EncoderProfilesProxy.VideoProfileProxy sdrProfile = null;
        Iterator<EncoderProfilesProxy.VideoProfileProxy> it = baseProfiles.getVideoProfiles().iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            EncoderProfilesProxy.VideoProfileProxy videoProfile = it.next();
            if (videoProfile.getHdrFormat() == 0) {
                sdrProfile = videoProfile;
                break;
            }
        }
        EncoderProfilesProxy.VideoProfileProxy backupProfile = validateOrAdapt(generateBackupProfile(sdrProfile, targetHdrFormat, targetBitDepth), this.mVideoEncoderInfoFinder);
        if (backupProfile != null) {
            videoProfiles.add(backupProfile);
        }
        if (videoProfiles.isEmpty()) {
            return null;
        }
        return EncoderProfilesProxy.ImmutableEncoderProfilesProxy.create(baseProfiles.getDefaultDurationSeconds(), baseProfiles.getRecommendedFileFormat(), baseProfiles.getAudioProfiles(), videoProfiles);
    }

    private static EncoderProfilesProxy.VideoProfileProxy generateBackupProfile(EncoderProfilesProxy.VideoProfileProxy baseProfile, int targetHdrFormat, int targetBitDepth) {
        int derivedCodec;
        String derivedMediaType;
        int derivedProfile;
        if (baseProfile == null) {
            return null;
        }
        int derivedCodec2 = baseProfile.getCodec();
        String derivedMediaType2 = baseProfile.getMediaType();
        int derivedProfile2 = baseProfile.getProfile();
        if (targetHdrFormat == baseProfile.getHdrFormat()) {
            derivedCodec = derivedCodec2;
            derivedMediaType = derivedMediaType2;
            derivedProfile = derivedProfile2;
        } else {
            int derivedCodec3 = deriveCodec(targetHdrFormat);
            String derivedMediaType3 = deriveMediaType(derivedCodec3);
            int derivedProfile3 = deriveProfile(targetHdrFormat);
            derivedCodec = derivedCodec3;
            derivedMediaType = derivedMediaType3;
            derivedProfile = derivedProfile3;
        }
        int derivedCodec4 = baseProfile.getBitrate();
        int derivedBitrate = scaleBitrate(derivedCodec4, targetBitDepth, baseProfile.getBitDepth());
        return EncoderProfilesProxy.VideoProfileProxy.create(derivedCodec, derivedMediaType, derivedBitrate, baseProfile.getFrameRate(), baseProfile.getWidth(), baseProfile.getHeight(), derivedProfile, targetBitDepth, baseProfile.getChromaSubsampling(), targetHdrFormat);
    }

    private static int deriveCodec(int hdrFormat) {
        switch (hdrFormat) {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
                return 5;
            default:
                throw new IllegalArgumentException("Unexpected HDR format: " + hdrFormat);
        }
    }

    private static int deriveProfile(int hdrFormat) {
        switch (hdrFormat) {
            case 0:
                return 1;
            case 1:
                return 2;
            case 2:
                return 4096;
            case 3:
                return 8192;
            case 4:
                return -1;
            default:
                throw new IllegalArgumentException("Unexpected HDR format: " + hdrFormat);
        }
    }

    private static String deriveMediaType(int codec) {
        return EncoderProfilesProxy.CC.getVideoCodecMimeType(codec);
    }

    private static int scaleBitrate(int baseBitrate, int actualBitDepth, int baseBitDepth) {
        if (actualBitDepth == baseBitDepth) {
            return baseBitrate;
        }
        Rational bitDepthRatio = new Rational(actualBitDepth, baseBitDepth);
        int resolvedBitrate = (int) (baseBitrate * bitDepthRatio.doubleValue());
        if (Logger.isDebugEnabled(TAG)) {
            String debugString = String.format("Base Bitrate(%dbps) * Bit Depth Ratio (%d / %d) = %d", Integer.valueOf(baseBitrate), Integer.valueOf(actualBitDepth), Integer.valueOf(baseBitDepth), Integer.valueOf(resolvedBitrate));
            Logger.d(TAG, debugString);
        }
        return resolvedBitrate;
    }

    static EncoderProfilesProxy.VideoProfileProxy validateOrAdapt(EncoderProfilesProxy.VideoProfileProxy profile, VideoEncoderInfo.Finder videoEncoderInfoFinder) {
        VideoEncoderInfo videoEncoderInfo;
        if (profile == null || (videoEncoderInfo = videoEncoderInfoFinder.find(profile.getMediaType())) == null || !videoEncoderInfo.isSizeSupportedAllowSwapping(profile.getWidth(), profile.getHeight())) {
            return null;
        }
        int baseBitrate = profile.getBitrate();
        int newBitrate = videoEncoderInfo.getSupportedBitrateRange().clamp(Integer.valueOf(baseBitrate)).intValue();
        return newBitrate == baseBitrate ? profile : modifyBitrate(profile, newBitrate);
    }

    private static EncoderProfilesProxy.VideoProfileProxy modifyBitrate(EncoderProfilesProxy.VideoProfileProxy baseProfile, int newBitrate) {
        return EncoderProfilesProxy.VideoProfileProxy.create(baseProfile.getCodec(), baseProfile.getMediaType(), newBitrate, baseProfile.getFrameRate(), baseProfile.getWidth(), baseProfile.getHeight(), baseProfile.getProfile(), baseProfile.getBitDepth(), baseProfile.getChromaSubsampling(), baseProfile.getHdrFormat());
    }
}
