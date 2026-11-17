package androidx.camera.core.impl;

import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.params.InputConfiguration;
import android.util.Range;
import android.util.Size;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.AutoValue_SessionConfig_OutputConfig;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.internal.HighSpeedFpsModifier;
import androidx.camera.core.internal.compat.workaround.SurfaceSorter;
import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes.dex */
public final class SessionConfig {
    public static final int DEFAULT_SESSION_TYPE = 0;
    public static final int SESSION_TYPE_HIGH_SPEED = 1;
    public static final int SESSION_TYPE_REGULAR = 0;
    private static final List<Integer> SUPPORTED_TEMPLATE_PRIORITY = Arrays.asList(1, 5, 3);
    private final List<CameraDevice.StateCallback> mDeviceStateCallbacks;
    private final ErrorListener mErrorListener;
    private InputConfiguration mInputConfiguration;
    private final List<OutputConfig> mOutputConfigs;
    private final OutputConfig mPostviewOutputConfig;
    private final CaptureConfig mRepeatingCaptureConfig;
    private final List<CameraCaptureSession.StateCallback> mSessionStateCallbacks;
    private final int mSessionType;
    private final List<CameraCaptureCallback> mSingleCameraCaptureCallbacks;

    public interface ErrorListener {
        void onError(SessionConfig sessionConfig, SessionError sessionError);
    }

    public interface OptionUnpacker {
        void unpack(Size size, UseCaseConfig<?> useCaseConfig, Builder builder);
    }

    public enum SessionError {
        SESSION_ERROR_SURFACE_NEEDS_RESET,
        SESSION_ERROR_UNKNOWN
    }

    public static abstract class OutputConfig {
        public static final int SURFACE_GROUP_ID_NONE = -1;

        public static abstract class Builder {
            public abstract OutputConfig build();

            public abstract Builder setDynamicRange(DynamicRange dynamicRange);

            public abstract Builder setMirrorMode(int i);

            public abstract Builder setPhysicalCameraId(String str);

            public abstract Builder setSharedSurfaces(List<DeferrableSurface> list);

            public abstract Builder setSurface(DeferrableSurface deferrableSurface);

            public abstract Builder setSurfaceGroupId(int i);
        }

        public abstract DynamicRange getDynamicRange();

        public abstract int getMirrorMode();

        public abstract String getPhysicalCameraId();

        public abstract List<DeferrableSurface> getSharedSurfaces();

        public abstract DeferrableSurface getSurface();

        public abstract int getSurfaceGroupId();

        public static Builder builder(DeferrableSurface surface) {
            return new AutoValue_SessionConfig_OutputConfig.Builder().setSurface(surface).setSharedSurfaces(Collections.emptyList()).setPhysicalCameraId(null).setMirrorMode(-1).setSurfaceGroupId(-1).setDynamicRange(DynamicRange.SDR);
        }
    }

    SessionConfig(List<OutputConfig> outputConfigs, List<CameraDevice.StateCallback> deviceStateCallbacks, List<CameraCaptureSession.StateCallback> sessionStateCallbacks, List<CameraCaptureCallback> singleCameraCaptureCallbacks, CaptureConfig repeatingCaptureConfig, ErrorListener errorListener, InputConfiguration inputConfiguration, int sessionType, OutputConfig postviewOutputConfig) {
        this.mOutputConfigs = outputConfigs;
        this.mDeviceStateCallbacks = DesugarCollections.unmodifiableList(deviceStateCallbacks);
        this.mSessionStateCallbacks = DesugarCollections.unmodifiableList(sessionStateCallbacks);
        this.mSingleCameraCaptureCallbacks = DesugarCollections.unmodifiableList(singleCameraCaptureCallbacks);
        this.mErrorListener = errorListener;
        this.mRepeatingCaptureConfig = repeatingCaptureConfig;
        this.mInputConfiguration = inputConfiguration;
        this.mSessionType = sessionType;
        this.mPostviewOutputConfig = postviewOutputConfig;
    }

    public static SessionConfig defaultEmptySessionConfig() {
        return new SessionConfig(new ArrayList(), new ArrayList(0), new ArrayList(0), new ArrayList(0), new CaptureConfig.Builder().build(), null, null, 0, null);
    }

    public InputConfiguration getInputConfiguration() {
        return this.mInputConfiguration;
    }

    public List<DeferrableSurface> getSurfaces() {
        List<DeferrableSurface> deferrableSurfaces = new ArrayList<>();
        for (OutputConfig outputConfig : this.mOutputConfigs) {
            deferrableSurfaces.add(outputConfig.getSurface());
            for (DeferrableSurface sharedSurface : outputConfig.getSharedSurfaces()) {
                deferrableSurfaces.add(sharedSurface);
            }
        }
        return DesugarCollections.unmodifiableList(deferrableSurfaces);
    }

    public List<OutputConfig> getOutputConfigs() {
        return this.mOutputConfigs;
    }

    public OutputConfig getPostviewOutputConfig() {
        return this.mPostviewOutputConfig;
    }

    public Config getImplementationOptions() {
        return this.mRepeatingCaptureConfig.getImplementationOptions();
    }

    public int getTemplateType() {
        return this.mRepeatingCaptureConfig.getTemplateType();
    }

    public int getSessionType() {
        return this.mSessionType;
    }

    public Range<Integer> getExpectedFrameRateRange() {
        return this.mRepeatingCaptureConfig.getExpectedFrameRateRange();
    }

    public List<CameraDevice.StateCallback> getDeviceStateCallbacks() {
        return this.mDeviceStateCallbacks;
    }

    public List<CameraCaptureSession.StateCallback> getSessionStateCallbacks() {
        return this.mSessionStateCallbacks;
    }

    public List<CameraCaptureCallback> getRepeatingCameraCaptureCallbacks() {
        return this.mRepeatingCaptureConfig.getCameraCaptureCallbacks();
    }

    public ErrorListener getErrorListener() {
        return this.mErrorListener;
    }

    public List<CameraCaptureCallback> getSingleCameraCaptureCallbacks() {
        return this.mSingleCameraCaptureCallbacks;
    }

    public CaptureConfig getRepeatingCaptureConfig() {
        return this.mRepeatingCaptureConfig;
    }

    public static int getHigherPriorityTemplateType(int type1, int type2) {
        return SUPPORTED_TEMPLATE_PRIORITY.indexOf(Integer.valueOf(type1)) >= SUPPORTED_TEMPLATE_PRIORITY.indexOf(Integer.valueOf(type2)) ? type1 : type2;
    }

    public static final class CloseableErrorListener implements ErrorListener {
        private final ErrorListener mErrorListener;
        private final AtomicBoolean mIsClosed = new AtomicBoolean(false);

        public CloseableErrorListener(ErrorListener errorListener) {
            this.mErrorListener = errorListener;
        }

        @Override // androidx.camera.core.impl.SessionConfig.ErrorListener
        public void onError(SessionConfig sessionConfig, SessionError error) {
            if (!this.mIsClosed.get()) {
                this.mErrorListener.onError(sessionConfig, error);
            }
        }

        public void close() {
            this.mIsClosed.set(true);
        }
    }

    static class BaseBuilder {
        ErrorListener mErrorListener;
        InputConfiguration mInputConfiguration;
        OutputConfig mPostviewOutputConfig;
        final Set<OutputConfig> mOutputConfigs = new LinkedHashSet();
        final CaptureConfig.Builder mCaptureConfigBuilder = new CaptureConfig.Builder();
        final List<CameraDevice.StateCallback> mDeviceStateCallbacks = new ArrayList();
        final List<CameraCaptureSession.StateCallback> mSessionStateCallbacks = new ArrayList();
        final List<CameraCaptureCallback> mSingleCameraCaptureCallbacks = new ArrayList();
        int mSessionType = 0;

        BaseBuilder() {
        }
    }

    public static class Builder extends BaseBuilder {
        public static Builder createFrom(UseCaseConfig<?> config, Size resolution) {
            OptionUnpacker unpacker = config.getSessionOptionUnpacker(null);
            if (unpacker == null) {
                throw new IllegalStateException("Implementation is missing option unpacker for " + config.getTargetName(config.toString()));
            }
            Builder builder = new Builder();
            unpacker.unpack(resolution, config, builder);
            return builder;
        }

        public Builder setInputConfiguration(InputConfiguration inputConfiguration) {
            this.mInputConfiguration = inputConfiguration;
            return this;
        }

        public Builder setTemplateType(int templateType) {
            this.mCaptureConfigBuilder.setTemplateType(templateType);
            return this;
        }

        public Builder setSessionType(int sessionType) {
            this.mSessionType = sessionType;
            return this;
        }

        public Builder setExpectedFrameRateRange(Range<Integer> expectedFrameRateRange) {
            this.mCaptureConfigBuilder.setExpectedFrameRateRange(expectedFrameRateRange);
            return this;
        }

        public Builder setPreviewStabilization(int mode) {
            if (mode != 0) {
                this.mCaptureConfigBuilder.setPreviewStabilization(mode);
            }
            return this;
        }

        public Builder setVideoStabilization(int mode) {
            if (mode != 0) {
                this.mCaptureConfigBuilder.setVideoStabilization(mode);
            }
            return this;
        }

        public Builder addTag(String key, Object tag) {
            this.mCaptureConfigBuilder.addTag(key, tag);
            return this;
        }

        public Builder addDeviceStateCallback(CameraDevice.StateCallback deviceStateCallback) {
            if (this.mDeviceStateCallbacks.contains(deviceStateCallback)) {
                return this;
            }
            this.mDeviceStateCallbacks.add(deviceStateCallback);
            return this;
        }

        public Builder addAllDeviceStateCallbacks(Collection<CameraDevice.StateCallback> deviceStateCallbacks) {
            for (CameraDevice.StateCallback callback : deviceStateCallbacks) {
                addDeviceStateCallback(callback);
            }
            return this;
        }

        public Builder addSessionStateCallback(CameraCaptureSession.StateCallback sessionStateCallback) {
            if (this.mSessionStateCallbacks.contains(sessionStateCallback)) {
                return this;
            }
            this.mSessionStateCallbacks.add(sessionStateCallback);
            return this;
        }

        public Builder addAllSessionStateCallbacks(List<CameraCaptureSession.StateCallback> sessionStateCallbacks) {
            for (CameraCaptureSession.StateCallback callback : sessionStateCallbacks) {
                addSessionStateCallback(callback);
            }
            return this;
        }

        public Builder addRepeatingCameraCaptureCallback(CameraCaptureCallback cameraCaptureCallback) {
            this.mCaptureConfigBuilder.addCameraCaptureCallback(cameraCaptureCallback);
            return this;
        }

        public Builder addAllRepeatingCameraCaptureCallbacks(Collection<CameraCaptureCallback> cameraCaptureCallbacks) {
            this.mCaptureConfigBuilder.addAllCameraCaptureCallbacks(cameraCaptureCallbacks);
            return this;
        }

        public Builder addCameraCaptureCallback(CameraCaptureCallback cameraCaptureCallback) {
            this.mCaptureConfigBuilder.addCameraCaptureCallback(cameraCaptureCallback);
            if (!this.mSingleCameraCaptureCallbacks.contains(cameraCaptureCallback)) {
                this.mSingleCameraCaptureCallbacks.add(cameraCaptureCallback);
            }
            return this;
        }

        public Builder addAllCameraCaptureCallbacks(Collection<CameraCaptureCallback> cameraCaptureCallbacks) {
            for (CameraCaptureCallback c : cameraCaptureCallbacks) {
                this.mCaptureConfigBuilder.addCameraCaptureCallback(c);
                if (!this.mSingleCameraCaptureCallbacks.contains(c)) {
                    this.mSingleCameraCaptureCallbacks.add(c);
                }
            }
            return this;
        }

        public boolean removeCameraCaptureCallback(CameraCaptureCallback cameraCaptureCallback) {
            boolean removedFromRepeating = this.mCaptureConfigBuilder.removeCameraCaptureCallback(cameraCaptureCallback);
            boolean removedFromSingle = this.mSingleCameraCaptureCallbacks.remove(cameraCaptureCallback);
            return removedFromRepeating || removedFromSingle;
        }

        public List<CameraCaptureCallback> getSingleCameraCaptureCallbacks() {
            return DesugarCollections.unmodifiableList(this.mSingleCameraCaptureCallbacks);
        }

        public Builder setErrorListener(ErrorListener errorListener) {
            this.mErrorListener = errorListener;
            return this;
        }

        public Builder addSurface(DeferrableSurface surface) {
            return addSurface(surface, DynamicRange.SDR);
        }

        public Builder addSurface(DeferrableSurface surface, DynamicRange dynamicRange) {
            return addSurface(surface, dynamicRange, null, -1);
        }

        public Builder addSurface(DeferrableSurface surface, DynamicRange dynamicRange, String physicalCameraId, int mirrorMode) {
            OutputConfig outputConfig = OutputConfig.builder(surface).setPhysicalCameraId(physicalCameraId).setDynamicRange(dynamicRange).setMirrorMode(mirrorMode).build();
            this.mOutputConfigs.add(outputConfig);
            this.mCaptureConfigBuilder.addSurface(surface);
            return this;
        }

        public Builder addOutputConfig(OutputConfig outputConfig) {
            this.mOutputConfigs.add(outputConfig);
            this.mCaptureConfigBuilder.addSurface(outputConfig.getSurface());
            for (DeferrableSurface sharedSurface : outputConfig.getSharedSurfaces()) {
                this.mCaptureConfigBuilder.addSurface(sharedSurface);
            }
            return this;
        }

        public Builder addNonRepeatingSurface(DeferrableSurface surface) {
            return addNonRepeatingSurface(surface, DynamicRange.SDR);
        }

        public Builder addNonRepeatingSurface(DeferrableSurface surface, DynamicRange dynamicRange) {
            OutputConfig outputConfig = OutputConfig.builder(surface).setDynamicRange(dynamicRange).build();
            this.mOutputConfigs.add(outputConfig);
            return this;
        }

        public Builder setPostviewSurface(DeferrableSurface surface) {
            this.mPostviewOutputConfig = OutputConfig.builder(surface).build();
            return this;
        }

        public Builder removeSurface(DeferrableSurface surface) {
            OutputConfig outputConfigToRemove = null;
            Iterator<OutputConfig> it = this.mOutputConfigs.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                OutputConfig config = it.next();
                if (config.getSurface().equals(surface)) {
                    outputConfigToRemove = config;
                    break;
                }
            }
            if (outputConfigToRemove != null) {
                this.mOutputConfigs.remove(outputConfigToRemove);
            }
            this.mCaptureConfigBuilder.removeSurface(surface);
            return this;
        }

        public Builder clearSurfaces() {
            this.mOutputConfigs.clear();
            this.mCaptureConfigBuilder.clearSurfaces();
            return this;
        }

        public Builder setImplementationOptions(Config config) {
            this.mCaptureConfigBuilder.setImplementationOptions(config);
            return this;
        }

        public Builder addImplementationOptions(Config config) {
            this.mCaptureConfigBuilder.addImplementationOptions(config);
            return this;
        }

        public SessionConfig build() {
            return new SessionConfig(new ArrayList(this.mOutputConfigs), new ArrayList(this.mDeviceStateCallbacks), new ArrayList(this.mSessionStateCallbacks), new ArrayList(this.mSingleCameraCaptureCallbacks), this.mCaptureConfigBuilder.build(), this.mErrorListener, this.mInputConfiguration, this.mSessionType, this.mPostviewOutputConfig);
        }
    }

    public static final class ValidatingBuilder extends BaseBuilder {
        private static final String TAG = "ValidatingBuilder";
        private final SurfaceSorter mSurfaceSorter = new SurfaceSorter();
        private boolean mValid = true;
        private StringBuilder mInvalidReason = new StringBuilder();
        private boolean mTemplateSet = false;
        private List<ErrorListener> mErrorListeners = new ArrayList();

        public <T> void addImplementationOption(Config.Option<T> option, T value) {
            this.mCaptureConfigBuilder.addImplementationOption(option, value);
        }

        public void add(SessionConfig sessionConfig) {
            CaptureConfig captureConfig = sessionConfig.getRepeatingCaptureConfig();
            if (captureConfig.getTemplateType() != -1) {
                this.mTemplateSet = true;
                this.mCaptureConfigBuilder.setTemplateType(SessionConfig.getHigherPriorityTemplateType(captureConfig.getTemplateType(), this.mCaptureConfigBuilder.getTemplateType()));
            }
            setOrVerifyExpectFrameRateRange(captureConfig.getExpectedFrameRateRange());
            setPreviewStabilizationMode(captureConfig.getPreviewStabilizationMode());
            setVideoStabilizationMode(captureConfig.getVideoStabilizationMode());
            TagBundle tagBundle = sessionConfig.getRepeatingCaptureConfig().getTagBundle();
            this.mCaptureConfigBuilder.addAllTags(tagBundle);
            this.mDeviceStateCallbacks.addAll(sessionConfig.getDeviceStateCallbacks());
            this.mSessionStateCallbacks.addAll(sessionConfig.getSessionStateCallbacks());
            this.mCaptureConfigBuilder.addAllCameraCaptureCallbacks(sessionConfig.getRepeatingCameraCaptureCallbacks());
            this.mSingleCameraCaptureCallbacks.addAll(sessionConfig.getSingleCameraCaptureCallbacks());
            if (sessionConfig.getErrorListener() != null) {
                this.mErrorListeners.add(sessionConfig.getErrorListener());
            }
            if (sessionConfig.getInputConfiguration() != null) {
                this.mInputConfiguration = sessionConfig.getInputConfiguration();
            }
            this.mOutputConfigs.addAll(sessionConfig.getOutputConfigs());
            this.mCaptureConfigBuilder.getSurfaces().addAll(captureConfig.getSurfaces());
            if (!getSurfaces().containsAll(this.mCaptureConfigBuilder.getSurfaces())) {
                Logger.d(TAG, "Invalid configuration due to capture request surfaces are not a subset of surfaces");
                this.mValid = false;
                this.mInvalidReason.append("Invalid configuration due to capture request surfaces are not a subset of surfaces");
            }
            if (sessionConfig.getSessionType() != this.mSessionType && sessionConfig.getSessionType() != 0 && this.mSessionType != 0) {
                Logger.d(TAG, "Invalid configuration due to that two non-default session types are set");
                this.mValid = false;
                this.mInvalidReason.append("Invalid configuration due to that two non-default session types are set");
            } else if (sessionConfig.getSessionType() != 0) {
                this.mSessionType = sessionConfig.getSessionType();
            }
            if (sessionConfig.mPostviewOutputConfig != null) {
                if (this.mPostviewOutputConfig == sessionConfig.mPostviewOutputConfig || this.mPostviewOutputConfig == null) {
                    this.mPostviewOutputConfig = sessionConfig.mPostviewOutputConfig;
                } else {
                    Logger.d(TAG, "Invalid configuration due to that two different postview output configs are set");
                    this.mValid = false;
                    this.mInvalidReason.append("Invalid configuration due to that two different postview output configs are set");
                }
            }
            this.mCaptureConfigBuilder.addImplementationOptions(captureConfig.getImplementationOptions());
        }

        private void setOrVerifyExpectFrameRateRange(Range<Integer> expectedFrameRateRange) {
            if (expectedFrameRateRange.equals(StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED)) {
                return;
            }
            if (this.mCaptureConfigBuilder.getExpectedFrameRateRange().equals(StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED)) {
                this.mCaptureConfigBuilder.setExpectedFrameRateRange(expectedFrameRateRange);
            } else if (!this.mCaptureConfigBuilder.getExpectedFrameRateRange().equals(expectedFrameRateRange)) {
                this.mValid = false;
                String errorMessage = "Different ExpectedFrameRateRange values; current = " + this.mCaptureConfigBuilder.getExpectedFrameRateRange() + ", new = " + expectedFrameRateRange;
                Logger.e(TAG, errorMessage);
                this.mInvalidReason.append(errorMessage);
            }
        }

        private void setPreviewStabilizationMode(int mode) {
            if (mode != 0) {
                this.mCaptureConfigBuilder.setPreviewStabilization(mode);
            }
        }

        private void setVideoStabilizationMode(int mode) {
            if (mode != 0) {
                this.mCaptureConfigBuilder.setVideoStabilization(mode);
            }
        }

        private List<DeferrableSurface> getSurfaces() {
            List<DeferrableSurface> surfaces = new ArrayList<>();
            for (OutputConfig outputConfig : this.mOutputConfigs) {
                surfaces.add(outputConfig.getSurface());
                for (DeferrableSurface sharedSurface : outputConfig.getSharedSurfaces()) {
                    surfaces.add(sharedSurface);
                }
            }
            return surfaces;
        }

        public void clearSurfaces() {
            this.mOutputConfigs.clear();
            this.mCaptureConfigBuilder.clearSurfaces();
        }

        public boolean isValid() {
            return this.mTemplateSet && this.mValid;
        }

        public String getInvalidReason() {
            if (!this.mTemplateSet) {
                return "Template is not set";
            }
            return this.mInvalidReason.toString();
        }

        public SessionConfig build() {
            ErrorListener errorListener;
            if (!this.mValid) {
                throw new IllegalArgumentException("Unsupported session configuration combination");
            }
            List<OutputConfig> outputConfigs = new ArrayList<>(this.mOutputConfigs);
            this.mSurfaceSorter.sort(outputConfigs);
            if (this.mSessionType == 1) {
                new HighSpeedFpsModifier().modifyFpsForPreviewOnlyRepeating(outputConfigs, this.mCaptureConfigBuilder);
            }
            if (this.mErrorListeners.isEmpty()) {
                errorListener = null;
            } else {
                ErrorListener errorListener2 = new ErrorListener() { // from class: androidx.camera.core.impl.SessionConfig$ValidatingBuilder$$ExternalSyntheticLambda0
                    @Override // androidx.camera.core.impl.SessionConfig.ErrorListener
                    public final void onError(SessionConfig sessionConfig, SessionConfig.SessionError sessionError) {
                        SessionConfig.ValidatingBuilder.this.m197x4be19b92(sessionConfig, sessionError);
                    }
                };
                errorListener = errorListener2;
            }
            return new SessionConfig(outputConfigs, new ArrayList(this.mDeviceStateCallbacks), new ArrayList(this.mSessionStateCallbacks), new ArrayList(this.mSingleCameraCaptureCallbacks), this.mCaptureConfigBuilder.build(), errorListener, this.mInputConfiguration, this.mSessionType, this.mPostviewOutputConfig);
        }

        /* renamed from: lambda$build$0$androidx-camera-core-impl-SessionConfig$ValidatingBuilder, reason: not valid java name */
        /* synthetic */ void m197x4be19b92(SessionConfig sessionConfig, SessionError error) {
            for (ErrorListener listener : this.mErrorListeners) {
                listener.onError(sessionConfig, error);
            }
        }
    }
}
