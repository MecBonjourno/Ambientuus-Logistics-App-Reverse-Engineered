package androidx.camera.core.impl;

import android.util.Range;
import androidx.camera.core.impl.Config;
import j$.util.DesugarCollections;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/* carregado de: classes.dex */
public final class CaptureConfig {
    public static final String CAPTURE_CONFIG_ID_TAG_KEY = "CAPTURE_CONFIG_ID_KEY";
    public static final int DEFAULT_ID = -1;
    public static final int TEMPLATE_TYPE_NONE = -1;
    final List<CameraCaptureCallback> mCameraCaptureCallbacks;
    private final CameraCaptureResult mCameraCaptureResult;
    final Config mImplementationOptions;
    final boolean mPostviewEnabled;
    final List<DeferrableSurface> mSurfaces;
    private final TagBundle mTagBundle;
    final int mTemplateType;
    private final boolean mUseRepeatingSurface;
    public static final Config.Option<Integer> OPTION_ROTATION = Config.Option.create("camerax.core.captureConfig.rotation", Integer.TYPE);
    public static final Config.Option<Integer> OPTION_JPEG_QUALITY = Config.Option.create("camerax.core.captureConfig.jpegQuality", Integer.class);
    private static final Config.Option<Range<Integer>> OPTION_RESOLVED_FRAME_RATE = Config.Option.create("camerax.core.captureConfig.resolvedFrameRate", Range.class);

    public interface OptionUnpacker {
        void unpack(UseCaseConfig<?> useCaseConfig, Builder builder);
    }

    CaptureConfig(List<DeferrableSurface> surfaces, Config implementationOptions, int templateType, boolean postviewEnabled, List<CameraCaptureCallback> cameraCaptureCallbacks, boolean useRepeatingSurface, TagBundle tagBundle, CameraCaptureResult cameraCaptureResult) {
        this.mSurfaces = surfaces;
        this.mImplementationOptions = implementationOptions;
        this.mTemplateType = templateType;
        this.mCameraCaptureCallbacks = DesugarCollections.unmodifiableList(cameraCaptureCallbacks);
        this.mUseRepeatingSurface = useRepeatingSurface;
        this.mTagBundle = tagBundle;
        this.mCameraCaptureResult = cameraCaptureResult;
        this.mPostviewEnabled = postviewEnabled;
    }

    public static CaptureConfig defaultEmptyCaptureConfig() {
        return new Builder().build();
    }

    public CameraCaptureResult getCameraCaptureResult() {
        return this.mCameraCaptureResult;
    }

    public List<DeferrableSurface> getSurfaces() {
        return DesugarCollections.unmodifiableList(this.mSurfaces);
    }

    public Config getImplementationOptions() {
        return this.mImplementationOptions;
    }

    public int getTemplateType() {
        return this.mTemplateType;
    }

    public int getId() {
        Object id = this.mTagBundle.getTag(CAPTURE_CONFIG_ID_TAG_KEY);
        if (id == null) {
            return -1;
        }
        return ((Integer) id).intValue();
    }

    public Range<Integer> getExpectedFrameRateRange() {
        return (Range) Objects.requireNonNull((Range) this.mImplementationOptions.retrieveOption(OPTION_RESOLVED_FRAME_RATE, StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED));
    }

    public int getPreviewStabilizationMode() {
        return ((Integer) Objects.requireNonNull((Integer) this.mImplementationOptions.retrieveOption(UseCaseConfig.OPTION_PREVIEW_STABILIZATION_MODE, 0))).intValue();
    }

    public int getVideoStabilizationMode() {
        return ((Integer) Objects.requireNonNull((Integer) this.mImplementationOptions.retrieveOption(UseCaseConfig.OPTION_VIDEO_STABILIZATION_MODE, 0))).intValue();
    }

    public boolean isPostviewEnabled() {
        return this.mPostviewEnabled;
    }

    public boolean isUseRepeatingSurface() {
        return this.mUseRepeatingSurface;
    }

    public List<CameraCaptureCallback> getCameraCaptureCallbacks() {
        return this.mCameraCaptureCallbacks;
    }

    public TagBundle getTagBundle() {
        return this.mTagBundle;
    }

    public static final class Builder {
        private List<CameraCaptureCallback> mCameraCaptureCallbacks;
        private CameraCaptureResult mCameraCaptureResult;
        private MutableConfig mImplementationOptions;
        private MutableTagBundle mMutableTagBundle;
        private boolean mPostviewEnabled;
        private final Set<DeferrableSurface> mSurfaces;
        private int mTemplateType;
        private boolean mUseRepeatingSurface;

        public Builder() {
            this.mSurfaces = new HashSet();
            this.mImplementationOptions = MutableOptionsBundle.create();
            this.mTemplateType = -1;
            this.mPostviewEnabled = false;
            this.mCameraCaptureCallbacks = new ArrayList();
            this.mUseRepeatingSurface = false;
            this.mMutableTagBundle = MutableTagBundle.create();
        }

        private Builder(CaptureConfig base) {
            this.mSurfaces = new HashSet();
            this.mImplementationOptions = MutableOptionsBundle.create();
            this.mTemplateType = -1;
            this.mPostviewEnabled = false;
            this.mCameraCaptureCallbacks = new ArrayList();
            this.mUseRepeatingSurface = false;
            this.mMutableTagBundle = MutableTagBundle.create();
            this.mSurfaces.addAll(base.mSurfaces);
            this.mImplementationOptions = MutableOptionsBundle.from(base.mImplementationOptions);
            this.mTemplateType = base.mTemplateType;
            this.mCameraCaptureCallbacks.addAll(base.getCameraCaptureCallbacks());
            this.mUseRepeatingSurface = base.isUseRepeatingSurface();
            this.mMutableTagBundle = MutableTagBundle.from(base.getTagBundle());
            this.mPostviewEnabled = base.mPostviewEnabled;
        }

        public static Builder createFrom(UseCaseConfig<?> config) {
            OptionUnpacker unpacker = config.getCaptureOptionUnpacker(null);
            if (unpacker == null) {
                throw new IllegalStateException("Implementation is missing option unpacker for " + config.getTargetName(config.toString()));
            }
            Builder builder = new Builder();
            unpacker.unpack(config, builder);
            return builder;
        }

        public static Builder from(CaptureConfig base) {
            return new Builder(base);
        }

        public void setCameraCaptureResult(CameraCaptureResult cameraCaptureResult) {
            this.mCameraCaptureResult = cameraCaptureResult;
        }

        public int getTemplateType() {
            return this.mTemplateType;
        }

        public Range<Integer> getExpectedFrameRateRange() {
            return (Range) this.mImplementationOptions.retrieveOption(CaptureConfig.OPTION_RESOLVED_FRAME_RATE, StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED);
        }

        public void setTemplateType(int templateType) {
            this.mTemplateType = templateType;
        }

        public void setExpectedFrameRateRange(Range<Integer> expectedFrameRateRange) {
            addImplementationOption(CaptureConfig.OPTION_RESOLVED_FRAME_RATE, expectedFrameRateRange);
        }

        public void setPreviewStabilization(int mode) {
            if (mode != 0) {
                addImplementationOption(UseCaseConfig.OPTION_PREVIEW_STABILIZATION_MODE, Integer.valueOf(mode));
            }
        }

        public void setVideoStabilization(int mode) {
            if (mode != 0) {
                addImplementationOption(UseCaseConfig.OPTION_VIDEO_STABILIZATION_MODE, Integer.valueOf(mode));
            }
        }

        public void setPostviewEnabled(boolean postviewEnabled) {
            this.mPostviewEnabled = postviewEnabled;
        }

        public void addCameraCaptureCallback(CameraCaptureCallback cameraCaptureCallback) {
            if (this.mCameraCaptureCallbacks.contains(cameraCaptureCallback)) {
                return;
            }
            this.mCameraCaptureCallbacks.add(cameraCaptureCallback);
        }

        public void addAllCameraCaptureCallbacks(Collection<CameraCaptureCallback> cameraCaptureCallbacks) {
            for (CameraCaptureCallback c : cameraCaptureCallbacks) {
                addCameraCaptureCallback(c);
            }
        }

        public boolean removeCameraCaptureCallback(CameraCaptureCallback cameraCaptureCallback) {
            return this.mCameraCaptureCallbacks.remove(cameraCaptureCallback);
        }

        public void addSurface(DeferrableSurface surface) {
            this.mSurfaces.add(surface);
        }

        public void removeSurface(DeferrableSurface surface) {
            this.mSurfaces.remove(surface);
        }

        public void clearSurfaces() {
            this.mSurfaces.clear();
        }

        public Set<DeferrableSurface> getSurfaces() {
            return this.mSurfaces;
        }

        public void setImplementationOptions(Config config) {
            this.mImplementationOptions = MutableOptionsBundle.from(config);
        }

        public void addImplementationOptions(Config config) {
            for (Config.Option<?> option : config.listOptions()) {
                Object existValue = this.mImplementationOptions.retrieveOption(option, null);
                Object newValue = config.retrieveOption(option);
                if (existValue instanceof MultiValueSet) {
                    ((MultiValueSet) existValue).addAll(((MultiValueSet) newValue).getAllItems());
                } else {
                    if (newValue instanceof MultiValueSet) {
                        newValue = ((MultiValueSet) newValue).m196clone();
                    }
                    this.mImplementationOptions.insertOption(option, config.getOptionPriority(option), newValue);
                }
            }
        }

        public <T> void addImplementationOption(Config.Option<T> option, T value) {
            this.mImplementationOptions.insertOption(option, value);
        }

        public Config getImplementationOptions() {
            return this.mImplementationOptions;
        }

        public boolean isUseRepeatingSurface() {
            return this.mUseRepeatingSurface;
        }

        public void setUseRepeatingSurface(boolean useRepeatingSurface) {
            this.mUseRepeatingSurface = useRepeatingSurface;
        }

        public Object getTag(String key) {
            return this.mMutableTagBundle.getTag(key);
        }

        public void addTag(String key, Object tag) {
            this.mMutableTagBundle.putTag(key, tag);
        }

        public void setId(int id) {
            this.mMutableTagBundle.putTag(CaptureConfig.CAPTURE_CONFIG_ID_TAG_KEY, Integer.valueOf(id));
        }

        public void addAllTags(TagBundle bundle) {
            this.mMutableTagBundle.addTagBundle(bundle);
        }

        public CaptureConfig build() {
            return new CaptureConfig(new ArrayList(this.mSurfaces), OptionsBundle.from(this.mImplementationOptions), this.mTemplateType, this.mPostviewEnabled, new ArrayList(this.mCameraCaptureCallbacks), this.mUseRepeatingSurface, TagBundle.from(this.mMutableTagBundle), this.mCameraCaptureResult);
        }
    }
}
