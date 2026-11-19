package androidx.camera.video;

import android.util.Range;
import androidx.camera.video.VideoSpec;

/* carregado de: classes.dex */
final class AutoValue_VideoSpec extends VideoSpec {
    private final int aspectRatio;
    private final Range<Integer> bitrate;
    private final int encodeFrameRate;
    private final QualitySelector qualitySelector;

    private AutoValue_VideoSpec(QualitySelector qualitySelector, int encodeFrameRate, Range<Integer> bitrate, int aspectRatio) {
        this.qualitySelector = qualitySelector;
        this.encodeFrameRate = encodeFrameRate;
        this.bitrate = bitrate;
        this.aspectRatio = aspectRatio;
    }

    @Override // androidx.camera.video.VideoSpec
    public QualitySelector getQualitySelector() {
        return this.qualitySelector;
    }

    @Override // androidx.camera.video.VideoSpec
    public int getEncodeFrameRate() {
        return this.encodeFrameRate;
    }

    @Override // androidx.camera.video.VideoSpec
    public Range<Integer> getBitrate() {
        return this.bitrate;
    }

    @Override // androidx.camera.video.VideoSpec
    int getAspectRatio() {
        return this.aspectRatio;
    }

    public String toString() {
        return "VideoSpec{qualitySelector=" + this.qualitySelector + ", encodeFrameRate=" + this.encodeFrameRate + ", bitrate=" + this.bitrate + ", aspectRatio=" + this.aspectRatio + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof VideoSpec)) {
            return false;
        }
        VideoSpec that = (VideoSpec) o;
        return this.qualitySelector.equals(that.getQualitySelector()) && this.encodeFrameRate == that.getEncodeFrameRate() && this.bitrate.equals(that.getBitrate()) && this.aspectRatio == that.getAspectRatio();
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((h$ ^ this.qualitySelector.hashCode()) * 1000003) ^ this.encodeFrameRate) * 1000003) ^ this.bitrate.hashCode()) * 1000003) ^ this.aspectRatio;
    }

    @Override // androidx.camera.video.VideoSpec
    public VideoSpec.Builder toBuilder() {
        return new Builder(this);
    }

    static final class Builder extends VideoSpec.Builder {
        private Integer aspectRatio;
        private Range<Integer> bitrate;
        private Integer encodeFrameRate;
        private QualitySelector qualitySelector;

        Builder() {
        }

        private Builder(VideoSpec source) {
            this.qualitySelector = source.getQualitySelector();
            this.encodeFrameRate = Integer.valueOf(source.getEncodeFrameRate());
            this.bitrate = source.getBitrate();
            this.aspectRatio = Integer.valueOf(source.getAspectRatio());
        }

        @Override // androidx.camera.video.VideoSpec.Builder
        public VideoSpec.Builder setQualitySelector(QualitySelector qualitySelector) {
            if (qualitySelector == null) {
                throw new NullPointerException("Null qualitySelector");
            }
            this.qualitySelector = qualitySelector;
            return this;
        }

        @Override // androidx.camera.video.VideoSpec.Builder
        public VideoSpec.Builder setEncodeFrameRate(int encodeFrameRate) {
            this.encodeFrameRate = Integer.valueOf(encodeFrameRate);
            return this;
        }

        @Override // androidx.camera.video.VideoSpec.Builder
        public VideoSpec.Builder setBitrate(Range<Integer> bitrate) {
            if (bitrate == null) {
                throw new NullPointerException("Null bitrate");
            }
            this.bitrate = bitrate;
            return this;
        }

        @Override // androidx.camera.video.VideoSpec.Builder
        VideoSpec.Builder setAspectRatio(int aspectRatio) {
            this.aspectRatio = Integer.valueOf(aspectRatio);
            return this;
        }

        @Override // androidx.camera.video.VideoSpec.Builder
        public VideoSpec build() {
            String missing = this.qualitySelector == null ? " qualitySelector" : "";
            if (this.encodeFrameRate == null) {
                missing = missing + " encodeFrameRate";
            }
            if (this.bitrate == null) {
                missing = missing + " bitrate";
            }
            if (this.aspectRatio == null) {
                missing = missing + " aspectRatio";
            }
            if (!missing.isEmpty()) {
                throw new IllegalStateException("Missing required properties:" + missing);
            }
            return new AutoValue_VideoSpec(this.qualitySelector, this.encodeFrameRate.intValue(), this.bitrate, this.aspectRatio.intValue());
        }
    }
}
