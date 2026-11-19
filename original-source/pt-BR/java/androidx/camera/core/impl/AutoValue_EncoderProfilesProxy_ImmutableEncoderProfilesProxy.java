package androidx.camera.core.impl;

import androidx.camera.core.impl.EncoderProfilesProxy;
import java.util.List;

/* carregado de: classes.dex */
final class AutoValue_EncoderProfilesProxy_ImmutableEncoderProfilesProxy extends EncoderProfilesProxy.ImmutableEncoderProfilesProxy {
    private final List<EncoderProfilesProxy.AudioProfileProxy> audioProfiles;
    private final int defaultDurationSeconds;
    private final int recommendedFileFormat;
    private final List<EncoderProfilesProxy.VideoProfileProxy> videoProfiles;

    AutoValue_EncoderProfilesProxy_ImmutableEncoderProfilesProxy(int defaultDurationSeconds, int recommendedFileFormat, List<EncoderProfilesProxy.AudioProfileProxy> audioProfiles, List<EncoderProfilesProxy.VideoProfileProxy> videoProfiles) {
        this.defaultDurationSeconds = defaultDurationSeconds;
        this.recommendedFileFormat = recommendedFileFormat;
        if (audioProfiles == null) {
            throw new NullPointerException("Null audioProfiles");
        }
        this.audioProfiles = audioProfiles;
        if (videoProfiles == null) {
            throw new NullPointerException("Null videoProfiles");
        }
        this.videoProfiles = videoProfiles;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProxy
    public int getDefaultDurationSeconds() {
        return this.defaultDurationSeconds;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProxy
    public int getRecommendedFileFormat() {
        return this.recommendedFileFormat;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProxy
    public List<EncoderProfilesProxy.AudioProfileProxy> getAudioProfiles() {
        return this.audioProfiles;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProxy
    public List<EncoderProfilesProxy.VideoProfileProxy> getVideoProfiles() {
        return this.videoProfiles;
    }

    public String toString() {
        return "ImmutableEncoderProfilesProxy{defaultDurationSeconds=" + this.defaultDurationSeconds + ", recommendedFileFormat=" + this.recommendedFileFormat + ", audioProfiles=" + this.audioProfiles + ", videoProfiles=" + this.videoProfiles + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof EncoderProfilesProxy.ImmutableEncoderProfilesProxy)) {
            return false;
        }
        EncoderProfilesProxy.ImmutableEncoderProfilesProxy that = (EncoderProfilesProxy.ImmutableEncoderProfilesProxy) o;
        return this.defaultDurationSeconds == that.getDefaultDurationSeconds() && this.recommendedFileFormat == that.getRecommendedFileFormat() && this.audioProfiles.equals(that.getAudioProfiles()) && this.videoProfiles.equals(that.getVideoProfiles());
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((h$ ^ this.defaultDurationSeconds) * 1000003) ^ this.recommendedFileFormat) * 1000003) ^ this.audioProfiles.hashCode()) * 1000003) ^ this.videoProfiles.hashCode();
    }
}
