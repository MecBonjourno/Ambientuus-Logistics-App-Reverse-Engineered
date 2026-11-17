package androidx.camera.video.internal.workaround;

import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.EncoderProfilesProvider;
import androidx.camera.core.impl.EncoderProfilesProxy;
import androidx.camera.core.impl.Quirks;
import androidx.camera.video.internal.compat.quirk.ExtraSupportedQualityQuirk;
import androidx.camera.video.internal.encoder.VideoEncoderInfo;
import androidx.core.util.Preconditions;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public class QualityAddedEncoderProfilesProvider implements EncoderProfilesProvider {
    private Map<Integer, EncoderProfilesProxy> mExtraQualityToEncoderProfiles;
    private final EncoderProfilesProvider mProvider;

    public QualityAddedEncoderProfilesProvider(EncoderProfilesProvider provider, Quirks quirks, CameraInfoInternal cameraInfo, VideoEncoderInfo.Finder videoEncoderInfoFinder) {
        this.mProvider = provider;
        List<ExtraSupportedQualityQuirk> extraQuirks = quirks.getAll(ExtraSupportedQualityQuirk.class);
        if (!extraQuirks.isEmpty()) {
            Preconditions.checkState(extraQuirks.size() == 1);
            Map<Integer, EncoderProfilesProxy> extraEncoderProfiles = extraQuirks.get(0).getExtraEncoderProfiles(cameraInfo, this.mProvider, videoEncoderInfoFinder);
            if (extraEncoderProfiles != null) {
                this.mExtraQualityToEncoderProfiles = new HashMap(extraEncoderProfiles);
            }
        }
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProvider
    public boolean hasProfile(int quality) {
        return getProfilesInternal(quality) != null;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProvider
    public EncoderProfilesProxy getAll(int quality) {
        return getProfilesInternal(quality);
    }

    private EncoderProfilesProxy getProfilesInternal(int quality) {
        if (this.mExtraQualityToEncoderProfiles != null && this.mExtraQualityToEncoderProfiles.containsKey(Integer.valueOf(quality))) {
            return this.mExtraQualityToEncoderProfiles.get(Integer.valueOf(quality));
        }
        return this.mProvider.getAll(quality);
    }
}
