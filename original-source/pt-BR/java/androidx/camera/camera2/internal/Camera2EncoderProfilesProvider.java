package androidx.camera.camera2.internal;

import android.media.CamcorderProfile;
import android.media.EncoderProfiles;
import android.os.Build;
import androidx.camera.camera2.internal.compat.quirk.CamcorderProfileResolutionQuirk;
import androidx.camera.camera2.internal.compat.quirk.DeviceQuirks;
import androidx.camera.camera2.internal.compat.quirk.InvalidVideoProfilesQuirk;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.EncoderProfilesProvider;
import androidx.camera.core.impl.EncoderProfilesProxy;
import androidx.camera.core.impl.Quirks;
import androidx.camera.core.impl.compat.EncoderProfilesProxyCompat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* carregado de: classes.dex */
public class Camera2EncoderProfilesProvider implements EncoderProfilesProvider {
    private static final String TAG = "Camera2EncoderProfilesProvider";
    private final String mCameraId;
    private final Quirks mCameraQuirks;
    private final Map<Integer, EncoderProfilesProxy> mEncoderProfilesCache = new HashMap();
    private final boolean mHasValidCameraId;
    private final int mIntCameraId;

    public Camera2EncoderProfilesProvider(String cameraId, Quirks cameraQuirks) {
        this.mCameraId = cameraId;
        boolean hasValidCameraId = false;
        int intCameraId = -1;
        try {
            intCameraId = Integer.parseInt(cameraId);
            hasValidCameraId = true;
        } catch (NumberFormatException e) {
            Logger.w(TAG, "Camera id is not an integer: " + cameraId + ", unable to create Camera2EncoderProfilesProvider");
        }
        this.mHasValidCameraId = hasValidCameraId;
        this.mIntCameraId = intCameraId;
        this.mCameraQuirks = cameraQuirks;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProvider
    public boolean hasProfile(int quality) {
        return this.mHasValidCameraId && getAll(quality) != null;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProvider
    public EncoderProfilesProxy getAll(int quality) {
        if (!this.mHasValidCameraId || !CamcorderProfile.hasProfile(this.mIntCameraId, quality)) {
            return null;
        }
        if (this.mEncoderProfilesCache.containsKey(Integer.valueOf(quality))) {
            return this.mEncoderProfilesCache.get(Integer.valueOf(quality));
        }
        EncoderProfilesProxy profiles = getProfilesInternal(quality);
        if (profiles != null && !isEncoderProfilesResolutionValidInQuirk(profiles)) {
            profiles = quality == 1 ? findHighestQualityProfiles() : quality == 0 ? findLowestQualityProfiles() : null;
        }
        this.mEncoderProfilesCache.put(Integer.valueOf(quality), profiles);
        return profiles;
    }

    private EncoderProfilesProxy findHighestQualityProfiles() {
        Iterator<Integer> it = QUALITY_HIGH_TO_LOW.iterator();
        while (it.hasNext()) {
            int quality = it.next().intValue();
            EncoderProfilesProxy profiles = getAll(quality);
            if (profiles != null) {
                return profiles;
            }
        }
        return null;
    }

    private EncoderProfilesProxy findLowestQualityProfiles() {
        for (int quality = QUALITY_HIGH_TO_LOW.size() - 1; quality >= 0; quality--) {
            EncoderProfilesProxy profiles = getAll(quality);
            if (profiles != null) {
                return profiles;
            }
        }
        return null;
    }

    private EncoderProfilesProxy getProfilesInternal(int quality) {
        if (Build.VERSION.SDK_INT >= 31) {
            EncoderProfiles profiles = Api31Impl.getAll(this.mCameraId, quality);
            if (profiles == null) {
                return null;
            }
            boolean isVideoProfilesInvalid = DeviceQuirks.get(InvalidVideoProfilesQuirk.class) != null;
            if (isVideoProfilesInvalid) {
                Logger.d(TAG, "EncoderProfiles contains invalid video profiles, use CamcorderProfile to create EncoderProfilesProxy.");
            } else {
                try {
                    return EncoderProfilesProxyCompat.from(profiles);
                } catch (NullPointerException e) {
                    Logger.w(TAG, "Failed to create EncoderProfilesProxy, EncoderProfiles might  contain invalid video profiles. Use CamcorderProfile instead.", e);
                }
            }
        }
        return createProfilesFromCamcorderProfile(quality);
    }

    private EncoderProfilesProxy createProfilesFromCamcorderProfile(int quality) {
        CamcorderProfile profile = null;
        try {
            profile = CamcorderProfile.get(this.mIntCameraId, quality);
        } catch (RuntimeException e) {
            Logger.w(TAG, "Unable to get CamcorderProfile by quality: " + quality, e);
        }
        if (profile != null) {
            return EncoderProfilesProxyCompat.from(profile);
        }
        return null;
    }

    private boolean isEncoderProfilesResolutionValidInQuirk(EncoderProfilesProxy profiles) {
        CamcorderProfileResolutionQuirk camcorderProfileResolutionQuirk = (CamcorderProfileResolutionQuirk) this.mCameraQuirks.get(CamcorderProfileResolutionQuirk.class);
        if (camcorderProfileResolutionQuirk == null) {
            return true;
        }
        List<EncoderProfilesProxy.VideoProfileProxy> videoProfiles = profiles.getVideoProfiles();
        if (videoProfiles.isEmpty()) {
            return true;
        }
        EncoderProfilesProxy.VideoProfileProxy videoProfile = videoProfiles.get(0);
        return camcorderProfileResolutionQuirk.getSupportedResolutions().contains(videoProfile.getResolution());
    }

    static class Api31Impl {
        static EncoderProfiles getAll(String cameraId, int quality) {
            return CamcorderProfile.getAll(cameraId, quality);
        }

        private Api31Impl() {
        }
    }
}
