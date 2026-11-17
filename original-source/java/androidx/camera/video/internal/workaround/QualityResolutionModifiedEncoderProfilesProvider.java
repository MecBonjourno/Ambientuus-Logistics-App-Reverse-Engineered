package androidx.camera.video.internal.workaround;

import android.util.Size;
import androidx.camera.core.impl.EncoderProfilesProvider;
import androidx.camera.core.impl.EncoderProfilesProxy;
import androidx.camera.core.impl.Quirks;
import androidx.camera.video.internal.compat.quirk.StretchedVideoResolutionQuirk;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public class QualityResolutionModifiedEncoderProfilesProvider implements EncoderProfilesProvider {
    private final Map<Integer, EncoderProfilesProxy> mEncoderProfilesCache = new HashMap();
    private final EncoderProfilesProvider mProvider;
    private final Quirks mQuirks;

    public QualityResolutionModifiedEncoderProfilesProvider(EncoderProfilesProvider provider, Quirks quirks) {
        this.mProvider = provider;
        this.mQuirks = quirks;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProvider
    public boolean hasProfile(int quality) {
        return this.mProvider.hasProfile(quality) && getProfilesInternal(quality) != null;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProvider
    public EncoderProfilesProxy getAll(int quality) {
        return getProfilesInternal(quality);
    }

    private EncoderProfilesProxy getProfilesInternal(int quality) {
        if (this.mEncoderProfilesCache.containsKey(Integer.valueOf(quality))) {
            return this.mEncoderProfilesCache.get(Integer.valueOf(quality));
        }
        EncoderProfilesProxy profiles = null;
        if (this.mProvider.hasProfile(quality)) {
            EncoderProfilesProxy baseProfiles = (EncoderProfilesProxy) Objects.requireNonNull(this.mProvider.getAll(quality));
            Size alternativeResolution = getAlternativeResolution(quality);
            profiles = alternativeResolution == null ? baseProfiles : createNewEncoderProfiles(baseProfiles, alternativeResolution);
        }
        this.mEncoderProfilesCache.put(Integer.valueOf(quality), profiles);
        return profiles;
    }

    private Size getAlternativeResolution(int quality) {
        for (StretchedVideoResolutionQuirk quirk : this.mQuirks.getAll(StretchedVideoResolutionQuirk.class)) {
            if (quirk != null) {
                return quirk.getAlternativeResolution(quality);
            }
        }
        return null;
    }

    private EncoderProfilesProxy createNewEncoderProfiles(EncoderProfilesProxy baseProfiles, Size resolution) {
        List<EncoderProfilesProxy.VideoProfileProxy> newVideoProfiles = new ArrayList<>();
        for (EncoderProfilesProxy.VideoProfileProxy videoProfile : baseProfiles.getVideoProfiles()) {
            EncoderProfilesProxy.VideoProfileProxy newVideoProfile = generateVideoProfile(videoProfile, resolution);
            newVideoProfiles.add(newVideoProfile);
        }
        if (newVideoProfiles.isEmpty()) {
            return null;
        }
        return EncoderProfilesProxy.ImmutableEncoderProfilesProxy.create(baseProfiles.getDefaultDurationSeconds(), baseProfiles.getRecommendedFileFormat(), baseProfiles.getAudioProfiles(), newVideoProfiles);
    }

    private static EncoderProfilesProxy.VideoProfileProxy generateVideoProfile(EncoderProfilesProxy.VideoProfileProxy baseProfile, Size resolution) {
        return EncoderProfilesProxy.VideoProfileProxy.create(baseProfile.getCodec(), baseProfile.getMediaType(), baseProfile.getBitrate(), baseProfile.getFrameRate(), resolution.getWidth(), resolution.getHeight(), baseProfile.getProfile(), baseProfile.getBitDepth(), baseProfile.getChromaSubsampling(), baseProfile.getHdrFormat());
    }
}
