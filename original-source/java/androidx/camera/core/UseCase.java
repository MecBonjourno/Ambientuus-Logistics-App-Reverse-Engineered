package androidx.camera.core;

import android.graphics.Matrix;
import android.graphics.Rect;
import android.util.Range;
import android.util.Size;
import androidx.camera.core.featuregroup.GroupableFeature;
import androidx.camera.core.featuregroup.impl.feature.DynamicRangeFeature;
import androidx.camera.core.featuregroup.impl.feature.FpsRangeFeature;
import androidx.camera.core.featuregroup.impl.feature.VideoStabilizationFeature;
import androidx.camera.core.impl.CameraControlInternal;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.ImageInputConfig;
import androidx.camera.core.impl.ImageOutputConfig;
import androidx.camera.core.impl.MutableOptionsBundle;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.camera.core.internal.CameraUseCaseAdapter;
import androidx.camera.core.internal.TargetConfig;
import androidx.camera.core.internal.compat.quirk.AeFpsRangeQuirk;
import androidx.camera.core.internal.utils.UseCaseConfigUtil;
import androidx.camera.core.processing.TargetUtils;
import androidx.camera.core.resolutionselector.ResolutionSelector;
import androidx.core.util.Preconditions;
import j$.util.Objects;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/* loaded from: classes.dex */
public abstract class UseCase {
    private static final String TAG = "UseCase";
    private StreamSpec mAttachedStreamSpec;
    private CameraInternal mCamera;
    private UseCaseConfig<?> mCameraConfig;
    private UseCaseConfig<?> mCurrentConfig;
    private CameraEffect mEffect;
    private UseCaseConfig<?> mExtendedConfig;
    private Set<GroupableFeature> mFeatureGroup;
    private String mPhysicalCameraId;
    private CameraInternal mSecondaryCamera;
    private UseCaseConfig<?> mUseCaseConfig;
    private Rect mViewPortCropRect;
    private boolean mInSession = false;
    private final Set<StateChangeCallback> mStateChangeCallbacks = new HashSet();
    private final Object mCameraLock = new Object();
    private State mState = State.INACTIVE;
    private Matrix mSensorToBufferTransformMatrix = new Matrix();
    private androidx.camera.core.impl.SessionConfig mAttachedSessionConfig = androidx.camera.core.impl.SessionConfig.defaultEmptySessionConfig();
    private androidx.camera.core.impl.SessionConfig mAttachedSecondarySessionConfig = androidx.camera.core.impl.SessionConfig.defaultEmptySessionConfig();

    enum State {
        ACTIVE,
        INACTIVE
    }

    public interface StateChangeCallback {
        void onUseCaseActive(UseCase useCase);

        void onUseCaseInactive(UseCase useCase);

        void onUseCaseReset(UseCase useCase);

        void onUseCaseUpdated(UseCase useCase);
    }

    public abstract UseCaseConfig<?> getDefaultConfig(boolean z, UseCaseConfigFactory useCaseConfigFactory);

    public abstract UseCaseConfig.Builder<?, ?, ?> getUseCaseConfigBuilder(Config config);

    protected UseCase(UseCaseConfig<?> currentConfig) {
        this.mUseCaseConfig = currentConfig;
        this.mCurrentConfig = currentConfig;
    }

    public UseCaseConfig<?> mergeConfigs(CameraInfoInternal cameraInfo, UseCaseConfig<?> extendedConfig, UseCaseConfig<?> cameraDefaultConfig) {
        MutableOptionsBundle mergedConfig;
        if (cameraDefaultConfig != null) {
            mergedConfig = MutableOptionsBundle.from((Config) cameraDefaultConfig);
            mergedConfig.removeOption(TargetConfig.OPTION_TARGET_NAME);
        } else {
            mergedConfig = MutableOptionsBundle.create();
        }
        if ((this.mUseCaseConfig.containsOption(ImageOutputConfig.OPTION_TARGET_ASPECT_RATIO) || this.mUseCaseConfig.containsOption(ImageOutputConfig.OPTION_TARGET_RESOLUTION)) && mergedConfig.containsOption(ImageOutputConfig.OPTION_RESOLUTION_SELECTOR)) {
            mergedConfig.removeOption(ImageOutputConfig.OPTION_RESOLUTION_SELECTOR);
        }
        if (this.mUseCaseConfig.containsOption(ImageOutputConfig.OPTION_RESOLUTION_SELECTOR) && mergedConfig.containsOption(ImageOutputConfig.OPTION_MAX_RESOLUTION)) {
            ResolutionSelector resolutionSelector = (ResolutionSelector) this.mUseCaseConfig.retrieveOption(ImageOutputConfig.OPTION_RESOLUTION_SELECTOR);
            if (resolutionSelector.getResolutionStrategy() != null) {
                mergedConfig.removeOption(ImageOutputConfig.OPTION_MAX_RESOLUTION);
            }
        }
        Iterator<Config.Option<?>> it = this.mUseCaseConfig.listOptions().iterator();
        while (it.hasNext()) {
            Config.CC.mergeOptionValue(mergedConfig, mergedConfig, this.mUseCaseConfig, it.next());
        }
        if (extendedConfig != null) {
            for (Config.Option<?> opt : extendedConfig.listOptions()) {
                if (!opt.getId().equals(TargetConfig.OPTION_TARGET_NAME.getId())) {
                    Config.CC.mergeOptionValue(mergedConfig, mergedConfig, extendedConfig, opt);
                }
            }
        }
        if (mergedConfig.containsOption(ImageOutputConfig.OPTION_TARGET_RESOLUTION) && mergedConfig.containsOption(ImageOutputConfig.OPTION_TARGET_ASPECT_RATIO)) {
            mergedConfig.removeOption(ImageOutputConfig.OPTION_TARGET_ASPECT_RATIO);
        }
        if (mergedConfig.containsOption(ImageOutputConfig.OPTION_RESOLUTION_SELECTOR) && ((ResolutionSelector) mergedConfig.retrieveOption(ImageOutputConfig.OPTION_RESOLUTION_SELECTOR)).getAllowedResolutionMode() != 0) {
            mergedConfig.insertOption(UseCaseConfig.OPTION_ZSL_DISABLED, true);
        }
        applyFeatureGroupToConfig(mergedConfig);
        return onMergeConfig(cameraInfo, getUseCaseConfigBuilder(mergedConfig));
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [androidx.camera.core.impl.UseCaseConfig, androidx.camera.core.impl.UseCaseConfig<?>] */
    protected UseCaseConfig<?> onMergeConfig(CameraInfoInternal cameraInfo, UseCaseConfig.Builder<?, ?, ?> builder) {
        return builder.getUseCaseConfig();
    }

    public static int snapToSurfaceRotation(int orientation) {
        Preconditions.checkArgumentInRange(orientation, 0, 359, "orientation");
        if (orientation >= 315 || orientation < 45) {
            return 0;
        }
        if (orientation >= 225) {
            return 1;
        }
        if (orientation >= 135) {
            return 2;
        }
        return 3;
    }

    public void setPhysicalCameraId(String physicalCameraId) {
        this.mPhysicalCameraId = physicalCameraId;
    }

    public String getPhysicalCameraId() {
        return this.mPhysicalCameraId;
    }

    /* JADX WARN: Type inference failed for: r3v0, types: [androidx.camera.core.impl.UseCaseConfig, androidx.camera.core.impl.UseCaseConfig<?>] */
    protected boolean setTargetRotationInternal(int targetRotation) {
        ImageOutputConfig oldConfig = (ImageOutputConfig) getCurrentConfig();
        int oldRotation = oldConfig.getTargetRotation(-1);
        if (oldRotation == -1 || oldRotation != targetRotation) {
            UseCaseConfig.Builder<?, ?, ?> builder = getUseCaseConfigBuilder(this.mUseCaseConfig);
            UseCaseConfigUtil.updateTargetRotationAndRelatedConfigs(builder, targetRotation);
            this.mUseCaseConfig = builder.getUseCaseConfig();
            CameraInternal camera = getCamera();
            if (camera == null) {
                this.mCurrentConfig = this.mUseCaseConfig;
                return true;
            }
            this.mCurrentConfig = mergeConfigs(camera.getCameraInfoInternal(), this.mExtendedConfig, this.mCameraConfig);
            return true;
        }
        return false;
    }

    protected int getTargetRotationInternal() {
        return ((ImageOutputConfig) this.mCurrentConfig).getTargetRotation(0);
    }

    protected Range<Integer> getTargetFrameRateInternal() {
        return this.mCurrentConfig.getTargetFrameRate(StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED);
    }

    protected int getMirrorModeInternal() {
        return ((ImageOutputConfig) this.mCurrentConfig).getMirrorMode(-1);
    }

    public boolean isMirroringRequired(CameraInternal camera) {
        int mirrorMode = getMirrorModeInternal();
        switch (mirrorMode) {
            case -1:
            case 0:
                return false;
            case 1:
                return true;
            case 2:
                return camera.isFrontFacing();
            default:
                throw new AssertionError("Unknown mirrorMode: " + mirrorMode);
        }
    }

    protected int getAppTargetRotation() {
        return ((ImageOutputConfig) this.mCurrentConfig).getAppTargetRotation(-1);
    }

    protected int getRelativeRotation(CameraInternal cameraInternal) {
        return getRelativeRotation(cameraInternal, false);
    }

    protected int getRelativeRotation(CameraInternal cameraInternal, boolean requireMirroring) {
        int rotation = cameraInternal.getCameraInfoInternal().getSensorRotationDegrees(getTargetRotationInternal());
        boolean inputStreamMirrored = !cameraInternal.getHasTransform() && requireMirroring;
        if (inputStreamMirrored) {
            return TransformUtils.within360(-rotation);
        }
        return rotation;
    }

    protected void updateSessionConfig(List<androidx.camera.core.impl.SessionConfig> sessionConfigs) {
        if (sessionConfigs.isEmpty()) {
            return;
        }
        this.mAttachedSessionConfig = sessionConfigs.get(0);
        if (sessionConfigs.size() > 1) {
            this.mAttachedSecondarySessionConfig = sessionConfigs.get(1);
        }
        for (androidx.camera.core.impl.SessionConfig sessionConfig : sessionConfigs) {
            for (DeferrableSurface surface : sessionConfig.getSurfaces()) {
                if (surface.getContainerClass() == null) {
                    surface.setContainerClass(getClass());
                }
            }
        }
    }

    private void addStateChangeCallback(StateChangeCallback callback) {
        this.mStateChangeCallbacks.add(callback);
    }

    private void removeStateChangeCallback(StateChangeCallback callback) {
        this.mStateChangeCallbacks.remove(callback);
    }

    public androidx.camera.core.impl.SessionConfig getSessionConfig() {
        return this.mAttachedSessionConfig;
    }

    public androidx.camera.core.impl.SessionConfig getSecondarySessionConfig() {
        return this.mAttachedSecondarySessionConfig;
    }

    protected final void notifyActive() {
        this.mState = State.ACTIVE;
        notifyState();
    }

    protected final void notifyInactive() {
        this.mState = State.INACTIVE;
        notifyState();
    }

    protected final void notifyUpdated() {
        for (StateChangeCallback stateChangeCallback : this.mStateChangeCallbacks) {
            stateChangeCallback.onUseCaseUpdated(this);
        }
    }

    protected final void notifyReset() {
        for (StateChangeCallback stateChangeCallback : this.mStateChangeCallbacks) {
            stateChangeCallback.onUseCaseReset(this);
        }
    }

    public final void notifyState() {
        switch (this.mState) {
            case ACTIVE:
                for (StateChangeCallback stateChangeCallback : this.mStateChangeCallbacks) {
                    stateChangeCallback.onUseCaseActive(this);
                }
                break;
            case INACTIVE:
                for (StateChangeCallback stateChangeCallback2 : this.mStateChangeCallbacks) {
                    stateChangeCallback2.onUseCaseInactive(this);
                }
                break;
        }
    }

    protected String getCameraId() {
        return ((CameraInternal) Preconditions.checkNotNull(getCamera(), "No camera attached to use case: " + this)).getCameraInfoInternal().getCameraId();
    }

    protected String getSecondaryCameraId() {
        if (getSecondaryCamera() == null) {
            return null;
        }
        return getSecondaryCamera().getCameraInfoInternal().getCameraId();
    }

    protected boolean isCurrentCamera(String cameraId) {
        if (getCamera() == null) {
            return false;
        }
        return Objects.equals(cameraId, getCameraId());
    }

    public String getName() {
        return (String) Objects.requireNonNull(this.mCurrentConfig.getTargetName("<UnknownUseCase-" + hashCode() + ">"));
    }

    public UseCaseConfig<?> getAppConfig() {
        return this.mUseCaseConfig;
    }

    public UseCaseConfig<?> getCurrentConfig() {
        return this.mCurrentConfig;
    }

    public CameraInternal getCamera() {
        CameraInternal cameraInternal;
        synchronized (this.mCameraLock) {
            cameraInternal = this.mCamera;
        }
        return cameraInternal;
    }

    public CameraInternal getSecondaryCamera() {
        CameraInternal cameraInternal;
        synchronized (this.mCameraLock) {
            cameraInternal = this.mSecondaryCamera;
        }
        return cameraInternal;
    }

    public Size getAttachedSurfaceResolution() {
        if (this.mAttachedStreamSpec != null) {
            return this.mAttachedStreamSpec.getResolution();
        }
        return null;
    }

    public StreamSpec getAttachedStreamSpec() {
        return this.mAttachedStreamSpec;
    }

    public void updateSuggestedStreamSpec(StreamSpec primaryStreamSpec, StreamSpec secondaryStreamSpec) {
        this.mAttachedStreamSpec = onSuggestedStreamSpecUpdated(primaryStreamSpec, secondaryStreamSpec);
    }

    protected StreamSpec onSuggestedStreamSpecUpdated(StreamSpec primaryStreamSpec, StreamSpec secondaryStreamSpec) {
        return primaryStreamSpec;
    }

    public void updateSuggestedStreamSpecImplementationOptions(Config config) {
        this.mAttachedStreamSpec = onSuggestedStreamSpecImplementationOptionsUpdated(config);
    }

    protected StreamSpec onSuggestedStreamSpecImplementationOptionsUpdated(Config config) {
        if (this.mAttachedStreamSpec == null) {
            throw new UnsupportedOperationException("Attempt to update the implementation options for a use case without attached stream specifications.");
        }
        return this.mAttachedStreamSpec.toBuilder().setImplementationOptions(config).build();
    }

    public void onCameraControlReady() {
    }

    public final void bindToCamera(CameraInternal camera, CameraInternal secondaryCamera, UseCaseConfig<?> extendedConfig, UseCaseConfig<?> cameraConfig) {
        synchronized (this.mCameraLock) {
            this.mCamera = camera;
            this.mSecondaryCamera = secondaryCamera;
            addStateChangeCallback(camera);
            if (secondaryCamera != null) {
                addStateChangeCallback(secondaryCamera);
            }
        }
        this.mExtendedConfig = extendedConfig;
        this.mCameraConfig = cameraConfig;
        this.mCurrentConfig = mergeConfigs(camera.getCameraInfoInternal(), this.mExtendedConfig, this.mCameraConfig);
        onBind();
    }

    public void onBind() {
    }

    public final void unbindFromCamera(CameraInternal camera) {
        onUnbind();
        synchronized (this.mCameraLock) {
            if (camera == this.mCamera) {
                removeStateChangeCallback(this.mCamera);
                this.mCamera = null;
            }
            if (camera == this.mSecondaryCamera) {
                removeStateChangeCallback(this.mSecondaryCamera);
                this.mSecondaryCamera = null;
            }
        }
        this.mAttachedStreamSpec = null;
        this.mViewPortCropRect = null;
        this.mCurrentConfig = this.mUseCaseConfig;
        this.mExtendedConfig = null;
        this.mCameraConfig = null;
    }

    public void onUnbind() {
    }

    public void onSessionStart() {
        this.mInSession = true;
    }

    public void onSessionStop() {
        this.mInSession = false;
    }

    public boolean isInSession() {
        return this.mInSession;
    }

    protected CameraControlInternal getCameraControl() {
        synchronized (this.mCameraLock) {
            if (this.mCamera == null) {
                return CameraControlInternal.DEFAULT_EMPTY_INSTANCE;
            }
            return this.mCamera.getCameraControlInternal();
        }
    }

    public void setViewPortCropRect(Rect viewPortCropRect) {
        this.mViewPortCropRect = viewPortCropRect;
    }

    public void setEffect(CameraEffect effect) {
        Preconditions.checkArgument(effect == null || isEffectTargetsSupported(effect.getTargets()));
        this.mEffect = effect;
    }

    public CameraEffect getEffect() {
        return this.mEffect;
    }

    public Rect getViewPortCropRect() {
        return this.mViewPortCropRect;
    }

    public void setSensorToBufferTransformMatrix(Matrix sensorToBufferTransformMatrix) {
        this.mSensorToBufferTransformMatrix = new Matrix(sensorToBufferTransformMatrix);
    }

    public Matrix getSensorToBufferTransformMatrix() {
        return this.mSensorToBufferTransformMatrix;
    }

    public int getImageFormat() {
        return this.mCurrentConfig.getInputFormat();
    }

    protected ResolutionInfo getResolutionInfoInternal() {
        CameraInternal camera = getCamera();
        Size resolution = getAttachedSurfaceResolution();
        if (camera == null || resolution == null) {
            return null;
        }
        Rect cropRect = getViewPortCropRect();
        if (cropRect == null) {
            cropRect = new Rect(0, 0, resolution.getWidth(), resolution.getHeight());
        }
        int rotationDegrees = getRelativeRotation(camera);
        return new ResolutionInfo(resolution, cropRect, rotationDegrees);
    }

    protected Set<Integer> getSupportedEffectTargets() {
        return Collections.emptySet();
    }

    public boolean isEffectTargetsSupported(int effectTargets) {
        for (Integer useCaseTargets : getSupportedEffectTargets()) {
            if (TargetUtils.isSuperset(effectTargets, useCaseTargets.intValue())) {
                return true;
            }
        }
        return false;
    }

    protected void applyExpectedFrameRateRange(SessionConfig.Builder sessionConfigBuilder, StreamSpec streamSpec) {
        if (!StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED.equals(streamSpec.getExpectedFrameRateRange())) {
            sessionConfigBuilder.setExpectedFrameRateRange(streamSpec.getExpectedFrameRateRange());
            return;
        }
        synchronized (this.mCameraLock) {
            CameraInfoInternal cameraInfoInternal = ((CameraInternal) Preconditions.checkNotNull(this.mCamera)).getCameraInfoInternal();
            List<AeFpsRangeQuirk> aeFpsRangeQuirks = cameraInfoInternal.getCameraQuirks().getAll(AeFpsRangeQuirk.class);
            boolean z = true;
            if (aeFpsRangeQuirks.size() > 1) {
                z = false;
            }
            Preconditions.checkArgument(z, "There should not have more than one AeFpsRangeQuirk.");
            if (!aeFpsRangeQuirks.isEmpty()) {
                sessionConfigBuilder.setExpectedFrameRateRange(aeFpsRangeQuirks.get(0).getTargetAeFpsRange());
            }
        }
    }

    public void setFeatureGroup(Set<GroupableFeature> features) {
        this.mFeatureGroup = features != null ? new HashSet(features) : null;
    }

    public Set<GroupableFeature> getFeatureGroup() {
        return this.mFeatureGroup;
    }

    private void applyFeatureGroupToConfig(MutableOptionsBundle config) {
        Logger.d(TAG, "applyFeaturesToConfig: mFeatureGroup = " + this.mFeatureGroup + ", this = " + this);
        if (this.mFeatureGroup == null) {
        }
        DynamicRange dynamicRange = DynamicRangeFeature.DEFAULT_DYNAMIC_RANGE;
        Range<Integer> fpsRange = StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED;
        VideoStabilizationFeature.StabilizationMode stabilizationMode = VideoStabilizationFeature.DEFAULT_STABILIZATION_MODE;
        for (GroupableFeature feature : this.mFeatureGroup) {
            if (feature instanceof DynamicRangeFeature) {
                dynamicRange = ((DynamicRangeFeature) feature).getDynamicRange();
            } else if (feature instanceof FpsRangeFeature) {
                FpsRangeFeature fpsFeature = (FpsRangeFeature) feature;
                Range<Integer> fpsRange2 = new Range<>(Integer.valueOf(fpsFeature.getMinFps()), Integer.valueOf(fpsFeature.getMaxFps()));
                fpsRange = fpsRange2;
            } else if (feature instanceof VideoStabilizationFeature) {
                stabilizationMode = ((VideoStabilizationFeature) feature).getMode();
            }
        }
        if ((this instanceof Preview) || CameraUseCaseAdapter.isVideoCapture(this)) {
            config.insertOption(ImageInputConfig.OPTION_INPUT_DYNAMIC_RANGE, dynamicRange);
        }
        config.insertOption(UseCaseConfig.OPTION_TARGET_FRAME_RATE, fpsRange);
        switch (stabilizationMode) {
            case OFF:
                config.insertOption(UseCaseConfig.OPTION_PREVIEW_STABILIZATION_MODE, 1);
                config.insertOption(UseCaseConfig.OPTION_VIDEO_STABILIZATION_MODE, 1);
                break;
            case ON:
                config.insertOption(UseCaseConfig.OPTION_PREVIEW_STABILIZATION_MODE, 0);
                config.insertOption(UseCaseConfig.OPTION_VIDEO_STABILIZATION_MODE, 2);
                break;
            case PREVIEW:
                config.insertOption(UseCaseConfig.OPTION_PREVIEW_STABILIZATION_MODE, 2);
                config.insertOption(UseCaseConfig.OPTION_VIDEO_STABILIZATION_MODE, 0);
                break;
        }
    }

    public Set<DynamicRange> getSupportedDynamicRanges(CameraInfoInternal cameraInfo) {
        return null;
    }
}
