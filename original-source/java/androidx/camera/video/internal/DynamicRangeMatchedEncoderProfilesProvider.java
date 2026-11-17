package androidx.camera.video.internal;

import androidx.camera.core.DynamicRange;
import androidx.camera.core.impl.EncoderProfilesProvider;
import androidx.camera.core.impl.EncoderProfilesProxy;
import androidx.camera.video.internal.utils.DynamicRangeUtil;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public class DynamicRangeMatchedEncoderProfilesProvider implements EncoderProfilesProvider {
    private final DynamicRange mDynamicRange;
    private final Map<Integer, EncoderProfilesProxy> mEncoderProfilesCache = new HashMap();
    private final EncoderProfilesProvider mEncoderProfilesProvider;

    public DynamicRangeMatchedEncoderProfilesProvider(EncoderProfilesProvider provider, DynamicRange dynamicRange) {
        this.mEncoderProfilesProvider = provider;
        this.mDynamicRange = dynamicRange;
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
        EncoderProfilesProxy profiles = filterUnmatchedDynamicRange(baseProfiles, this.mDynamicRange);
        this.mEncoderProfilesCache.put(Integer.valueOf(quality), profiles);
        return profiles;
    }

    private static EncoderProfilesProxy filterUnmatchedDynamicRange(EncoderProfilesProxy encoderProfiles, DynamicRange dynamicRange) {
        if (encoderProfiles == null) {
            return null;
        }
        List<EncoderProfilesProxy.VideoProfileProxy> validVideoProfiles = new ArrayList<>();
        for (EncoderProfilesProxy.VideoProfileProxy videoProfile : encoderProfiles.getVideoProfiles()) {
            if (DynamicRangeUtil.isHdrSettingsMatched(videoProfile, dynamicRange)) {
                validVideoProfiles.add(videoProfile);
            }
        }
        if (validVideoProfiles.isEmpty()) {
            return null;
        }
        return EncoderProfilesProxy.ImmutableEncoderProfilesProxy.create(encoderProfiles.getDefaultDurationSeconds(), encoderProfiles.getRecommendedFileFormat(), encoderProfiles.getAudioProfiles(), validVideoProfiles);
    }
}
