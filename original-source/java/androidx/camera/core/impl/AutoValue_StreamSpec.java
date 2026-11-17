package androidx.camera.core.impl;

import android.util.Range;
import android.util.Size;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.impl.StreamSpec;

/* loaded from: classes.dex */
final class AutoValue_StreamSpec extends StreamSpec {
    private final DynamicRange dynamicRange;
    private final Range<Integer> expectedFrameRateRange;
    private final Config implementationOptions;
    private final Size originalConfiguredResolution;
    private final Size resolution;
    private final int sessionType;
    private final boolean zslDisabled;

    private AutoValue_StreamSpec(Size resolution, Size originalConfiguredResolution, DynamicRange dynamicRange, int sessionType, Range<Integer> expectedFrameRateRange, Config implementationOptions, boolean zslDisabled) {
        this.resolution = resolution;
        this.originalConfiguredResolution = originalConfiguredResolution;
        this.dynamicRange = dynamicRange;
        this.sessionType = sessionType;
        this.expectedFrameRateRange = expectedFrameRateRange;
        this.implementationOptions = implementationOptions;
        this.zslDisabled = zslDisabled;
    }

    @Override // androidx.camera.core.impl.StreamSpec
    public Size getResolution() {
        return this.resolution;
    }

    @Override // androidx.camera.core.impl.StreamSpec
    public Size getOriginalConfiguredResolution() {
        return this.originalConfiguredResolution;
    }

    @Override // androidx.camera.core.impl.StreamSpec
    public DynamicRange getDynamicRange() {
        return this.dynamicRange;
    }

    @Override // androidx.camera.core.impl.StreamSpec
    public int getSessionType() {
        return this.sessionType;
    }

    @Override // androidx.camera.core.impl.StreamSpec
    public Range<Integer> getExpectedFrameRateRange() {
        return this.expectedFrameRateRange;
    }

    @Override // androidx.camera.core.impl.StreamSpec
    public Config getImplementationOptions() {
        return this.implementationOptions;
    }

    @Override // androidx.camera.core.impl.StreamSpec
    public boolean getZslDisabled() {
        return this.zslDisabled;
    }

    public String toString() {
        return "StreamSpec{resolution=" + this.resolution + ", originalConfiguredResolution=" + this.originalConfiguredResolution + ", dynamicRange=" + this.dynamicRange + ", sessionType=" + this.sessionType + ", expectedFrameRateRange=" + this.expectedFrameRateRange + ", implementationOptions=" + this.implementationOptions + ", zslDisabled=" + this.zslDisabled + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof StreamSpec)) {
            return false;
        }
        StreamSpec that = (StreamSpec) o;
        return this.resolution.equals(that.getResolution()) && this.originalConfiguredResolution.equals(that.getOriginalConfiguredResolution()) && this.dynamicRange.equals(that.getDynamicRange()) && this.sessionType == that.getSessionType() && this.expectedFrameRateRange.equals(that.getExpectedFrameRateRange()) && (this.implementationOptions != null ? this.implementationOptions.equals(that.getImplementationOptions()) : that.getImplementationOptions() == null) && this.zslDisabled == that.getZslDisabled();
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((((((h$ ^ this.resolution.hashCode()) * 1000003) ^ this.originalConfiguredResolution.hashCode()) * 1000003) ^ this.dynamicRange.hashCode()) * 1000003) ^ this.sessionType) * 1000003) ^ this.expectedFrameRateRange.hashCode()) * 1000003) ^ (this.implementationOptions == null ? 0 : this.implementationOptions.hashCode())) * 1000003) ^ (this.zslDisabled ? 1231 : 1237);
    }

    @Override // androidx.camera.core.impl.StreamSpec
    public StreamSpec.Builder toBuilder() {
        return new Builder(this);
    }

    static final class Builder extends StreamSpec.Builder {
        private DynamicRange dynamicRange;
        private Range<Integer> expectedFrameRateRange;
        private Config implementationOptions;
        private Size originalConfiguredResolution;
        private Size resolution;
        private Integer sessionType;
        private Boolean zslDisabled;

        Builder() {
        }

        private Builder(StreamSpec source) {
            this.resolution = source.getResolution();
            this.originalConfiguredResolution = source.getOriginalConfiguredResolution();
            this.dynamicRange = source.getDynamicRange();
            this.sessionType = Integer.valueOf(source.getSessionType());
            this.expectedFrameRateRange = source.getExpectedFrameRateRange();
            this.implementationOptions = source.getImplementationOptions();
            this.zslDisabled = Boolean.valueOf(source.getZslDisabled());
        }

        @Override // androidx.camera.core.impl.StreamSpec.Builder
        public StreamSpec.Builder setResolution(Size resolution) {
            if (resolution == null) {
                throw new NullPointerException("Null resolution");
            }
            this.resolution = resolution;
            return this;
        }

        @Override // androidx.camera.core.impl.StreamSpec.Builder
        public StreamSpec.Builder setOriginalConfiguredResolution(Size originalConfiguredResolution) {
            if (originalConfiguredResolution == null) {
                throw new NullPointerException("Null originalConfiguredResolution");
            }
            this.originalConfiguredResolution = originalConfiguredResolution;
            return this;
        }

        @Override // androidx.camera.core.impl.StreamSpec.Builder
        public StreamSpec.Builder setDynamicRange(DynamicRange dynamicRange) {
            if (dynamicRange == null) {
                throw new NullPointerException("Null dynamicRange");
            }
            this.dynamicRange = dynamicRange;
            return this;
        }

        @Override // androidx.camera.core.impl.StreamSpec.Builder
        public StreamSpec.Builder setSessionType(int sessionType) {
            this.sessionType = Integer.valueOf(sessionType);
            return this;
        }

        @Override // androidx.camera.core.impl.StreamSpec.Builder
        public StreamSpec.Builder setExpectedFrameRateRange(Range<Integer> expectedFrameRateRange) {
            if (expectedFrameRateRange == null) {
                throw new NullPointerException("Null expectedFrameRateRange");
            }
            this.expectedFrameRateRange = expectedFrameRateRange;
            return this;
        }

        @Override // androidx.camera.core.impl.StreamSpec.Builder
        public StreamSpec.Builder setImplementationOptions(Config implementationOptions) {
            this.implementationOptions = implementationOptions;
            return this;
        }

        @Override // androidx.camera.core.impl.StreamSpec.Builder
        public StreamSpec.Builder setZslDisabled(boolean zslDisabled) {
            this.zslDisabled = Boolean.valueOf(zslDisabled);
            return this;
        }

        @Override // androidx.camera.core.impl.StreamSpec.Builder
        public StreamSpec build() {
            String missing = this.resolution == null ? " resolution" : "";
            if (this.originalConfiguredResolution == null) {
                missing = missing + " originalConfiguredResolution";
            }
            if (this.dynamicRange == null) {
                missing = missing + " dynamicRange";
            }
            if (this.sessionType == null) {
                missing = missing + " sessionType";
            }
            if (this.expectedFrameRateRange == null) {
                missing = missing + " expectedFrameRateRange";
            }
            if (this.zslDisabled == null) {
                missing = missing + " zslDisabled";
            }
            if (!missing.isEmpty()) {
                throw new IllegalStateException("Missing required properties:" + missing);
            }
            return new AutoValue_StreamSpec(this.resolution, this.originalConfiguredResolution, this.dynamicRange, this.sessionType.intValue(), this.expectedFrameRateRange, this.implementationOptions, this.zslDisabled.booleanValue());
        }
    }
}
