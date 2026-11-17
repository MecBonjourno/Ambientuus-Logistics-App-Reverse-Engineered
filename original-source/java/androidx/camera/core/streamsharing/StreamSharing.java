package androidx.camera.core.streamsharing;

import android.graphics.Rect;
import android.util.Log;
import android.util.Size;
import androidx.camera.core.CameraEffect;
import androidx.camera.core.CompositionSettings;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.ImageAnalysis$$ExternalSyntheticBackport1;
import androidx.camera.core.Logger;
import androidx.camera.core.UseCase;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.ImageInputConfig;
import androidx.camera.core.impl.ImageOutputConfig;
import androidx.camera.core.impl.MutableConfig;
import androidx.camera.core.impl.MutableOptionsBundle;
import androidx.camera.core.impl.OptionsBundle;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.impl.StreamUseCase;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.core.processing.DefaultSurfaceProcessor;
import androidx.camera.core.processing.SurfaceEdge;
import androidx.camera.core.processing.SurfaceProcessorNode;
import androidx.camera.core.processing.concurrent.DualOutConfig;
import androidx.camera.core.processing.concurrent.DualSurfaceProcessor;
import androidx.camera.core.processing.concurrent.DualSurfaceProcessorNode;
import androidx.camera.core.processing.util.OutConfig;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* loaded from: classes.dex */
public class StreamSharing extends UseCase {
    private static final String TAG = "StreamSharing";
    private SurfaceEdge mCameraEdge;
    private SessionConfig.CloseableErrorListener mCloseableErrorListener;
    private final CompositionSettings mCompositionSettings;
    private final StreamSharingConfig mDefaultConfig;
    private SurfaceEdge mDualProcessedEdge;
    private SurfaceEdge mDualSharingInputEdgeForEffect;
    private DualSurfaceProcessorNode mDualSharingNode;
    private SurfaceProcessorNode mDualSharingNodeForEffect;
    private SurfaceProcessorNode mEffectNode;
    private SurfaceEdge mSecondaryCameraEdge;
    private final CompositionSettings mSecondaryCompositionSettings;
    SessionConfig.Builder mSecondarySessionConfigBuilder;
    private SurfaceEdge mSecondarySharingInputEdge;
    SessionConfig.Builder mSessionConfigBuilder;
    private SurfaceEdge mSharingInputEdge;
    private SurfaceProcessorNode mSharingNode;
    private final VirtualCameraAdapter mVirtualCameraAdapter;

    interface Control {
        ListenableFuture<Void> jpegSnapshot(int i, int i2);
    }

    private static StreamSharingConfig getDefaultConfig(Set<UseCase> children) {
        MutableConfig mutableConfig = new StreamSharingBuilder().getMutableConfig();
        mutableConfig.insertOption(ImageInputConfig.OPTION_INPUT_FORMAT, 34);
        ArrayList arrayList = new ArrayList();
        for (UseCase child : children) {
            if (child.getCurrentConfig().containsOption(UseCaseConfig.OPTION_CAPTURE_TYPE)) {
                arrayList.add(child.getCurrentConfig().getCaptureType());
            } else {
                Log.e(TAG, "A child does not have capture type.");
            }
        }
        mutableConfig.insertOption(StreamSharingConfig.OPTION_CAPTURE_TYPES, arrayList);
        mutableConfig.insertOption(ImageOutputConfig.OPTION_MIRROR_MODE, 2);
        mutableConfig.insertOption(UseCaseConfig.OPTION_STREAM_USE_CASE, StreamUseCase.PREVIEW_VIDEO_STILL);
        return new StreamSharingConfig(OptionsBundle.from(mutableConfig));
    }

    public StreamSharing(CameraInternal camera, CameraInternal secondaryCamera, CompositionSettings compositionSettings, CompositionSettings secondaryCompositionSettings, Set<UseCase> children, UseCaseConfigFactory useCaseConfigFactory) {
        super(getDefaultConfig(children));
        this.mDefaultConfig = getDefaultConfig(children);
        this.mCompositionSettings = compositionSettings;
        this.mSecondaryCompositionSettings = secondaryCompositionSettings;
        this.mVirtualCameraAdapter = new VirtualCameraAdapter(camera, secondaryCamera, children, useCaseConfigFactory, new Control() { // from class: androidx.camera.core.streamsharing.StreamSharing$$ExternalSyntheticLambda3
            @Override // androidx.camera.core.streamsharing.StreamSharing.Control
            public final ListenableFuture jpegSnapshot(int i, int i2) {
                return StreamSharing.this.m237lambda$new$0$androidxcameracorestreamsharingStreamSharing(i, i2);
            }
        });
        updateFeatureGroup(children);
    }

    /* renamed from: lambda$new$0$androidx-camera-core-streamsharing-StreamSharing, reason: not valid java name */
    /* synthetic */ ListenableFuture m237lambda$new$0$androidxcameracorestreamsharingStreamSharing(int jpegQuality, int rotationDegrees) {
        SurfaceProcessorNode sharingNode = this.mSharingNode;
        if (sharingNode != null) {
            return sharingNode.getSurfaceProcessor().snapshot(jpegQuality, rotationDegrees);
        }
        return Futures.immediateFailedFuture(new Exception("Failed to take picture: pipeline is not ready."));
    }

    public void updateFeatureGroup(Set<UseCase> children) {
        setFeatureGroup(children.iterator().next().getFeatureGroup());
    }

    /* JADX WARN: Type inference failed for: r1v2, types: [androidx.camera.core.impl.UseCaseConfig, androidx.camera.core.impl.UseCaseConfig<?>] */
    @Override // androidx.camera.core.UseCase
    public UseCaseConfig<?> getDefaultConfig(boolean applyDefaultConfig, UseCaseConfigFactory factory) {
        Config captureConfig = factory.getConfig(this.mDefaultConfig.getCaptureType(), 1);
        if (applyDefaultConfig) {
            captureConfig = Config.CC.mergeConfigs(captureConfig, this.mDefaultConfig.getConfig());
        }
        if (captureConfig == null) {
            return null;
        }
        return getUseCaseConfigBuilder(captureConfig).getUseCaseConfig();
    }

    @Override // androidx.camera.core.UseCase
    public UseCaseConfig.Builder<?, ?, ?> getUseCaseConfigBuilder(Config config) {
        return new StreamSharingBuilder(MutableOptionsBundle.from(config));
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [androidx.camera.core.impl.UseCaseConfig, androidx.camera.core.impl.UseCaseConfig<?>] */
    @Override // androidx.camera.core.UseCase
    protected UseCaseConfig<?> onMergeConfig(CameraInfoInternal cameraInfo, UseCaseConfig.Builder<?, ?, ?> builder) {
        this.mVirtualCameraAdapter.mergeChildrenConfigs(builder.getMutableConfig());
        return builder.getUseCaseConfig();
    }

    @Override // androidx.camera.core.UseCase
    protected StreamSpec onSuggestedStreamSpecUpdated(StreamSpec primaryStreamSpec, StreamSpec secondaryStreamSpec) {
        Logger.d(TAG, "onSuggestedStreamSpecUpdated: primaryStreamSpec = " + primaryStreamSpec + ", secondaryStreamSpec " + secondaryStreamSpec);
        updateSessionConfig(createPipelineAndUpdateChildrenSpecs(getCameraId(), getSecondaryCameraId(), getCurrentConfig(), primaryStreamSpec, secondaryStreamSpec));
        notifyActive();
        return primaryStreamSpec;
    }

    @Override // androidx.camera.core.UseCase
    protected StreamSpec onSuggestedStreamSpecImplementationOptionsUpdated(Config config) {
        List<SessionConfig> m;
        this.mSessionConfigBuilder.addImplementationOptions(config);
        m = ImageAnalysis$$ExternalSyntheticBackport1.m(new Object[]{this.mSessionConfigBuilder.build()});
        updateSessionConfig(m);
        return getAttachedStreamSpec().toBuilder().setImplementationOptions(config).build();
    }

    @Override // androidx.camera.core.UseCase
    public void onBind() {
        super.onBind();
        this.mVirtualCameraAdapter.bindChildren();
    }

    @Override // androidx.camera.core.UseCase
    public void onUnbind() {
        super.onUnbind();
        clearPipeline();
        this.mVirtualCameraAdapter.unbindChildren();
    }

    @Override // androidx.camera.core.UseCase
    public void onSessionStart() {
        super.onSessionStart();
        this.mVirtualCameraAdapter.notifySessionStart();
    }

    @Override // androidx.camera.core.UseCase
    public void onSessionStop() {
        super.onSessionStop();
        this.mVirtualCameraAdapter.notifySessionStop();
    }

    @Override // androidx.camera.core.UseCase
    public void onCameraControlReady() {
        super.onCameraControlReady();
        this.mVirtualCameraAdapter.notifyCameraControlReady();
    }

    public Set<UseCase> getChildren() {
        return this.mVirtualCameraAdapter.getChildren();
    }

    @Override // androidx.camera.core.UseCase
    public Set<Integer> getSupportedEffectTargets() {
        Set<Integer> targets = new HashSet<>();
        targets.add(3);
        return targets;
    }

    private List<SessionConfig> createPipelineAndUpdateChildrenSpecs(String cameraId, String secondaryCameraId, UseCaseConfig<?> config, StreamSpec primaryStreamSpec, StreamSpec secondaryStreamSpec) {
        List<SessionConfig> m;
        List<SessionConfig> m2;
        Threads.checkMainThread();
        if (secondaryStreamSpec == null) {
            SurfaceEdge inputSurfaceEdge = createPrimaryCameraInputSurface(cameraId, secondaryCameraId, config, primaryStreamSpec, null);
            this.mSharingNode = createEffectOrCopyNode((CameraInternal) Objects.requireNonNull(getCamera()), primaryStreamSpec);
            transformAndOutputToChildUseCases(inputSurfaceEdge, this.mSharingNode, false);
            m2 = ImageAnalysis$$ExternalSyntheticBackport1.m(new Object[]{this.mSessionConfigBuilder.build()});
            return m2;
        }
        SurfaceEdge inputSurfacePrimary = createPrimaryCameraInputSurface(cameraId, secondaryCameraId, config, primaryStreamSpec, secondaryStreamSpec);
        SurfaceEdge inputSurfaceSecondary = createSecondaryCameraInputSurface(cameraId, secondaryCameraId, config, primaryStreamSpec, secondaryStreamSpec);
        this.mDualSharingNode = createDualSharingNode(getCamera(), getSecondaryCamera(), primaryStreamSpec, this.mCompositionSettings, this.mSecondaryCompositionSettings);
        transformDualSurfacesAndOutputToChildUseCases(inputSurfacePrimary, inputSurfaceSecondary, this.mDualSharingNode, primaryStreamSpec);
        m = ImageAnalysis$$ExternalSyntheticBackport1.m(new Object[]{this.mSessionConfigBuilder.build(), this.mSecondarySessionConfigBuilder.build()});
        return m;
    }

    private void transformAndOutputToChildUseCases(SurfaceEdge inputSurfaceEdge, SurfaceProcessorNode processorNode, boolean skipMirroring) {
        boolean isViewportSet = getViewPortCropRect() != null;
        Map<UseCase, OutConfig> outConfigMap = this.mVirtualCameraAdapter.getChildrenOutConfigs(inputSurfaceEdge, getTargetRotationInternal(), isViewportSet, skipMirroring);
        SurfaceProcessorNode.Out out = processorNode.transform(SurfaceProcessorNode.In.of(inputSurfaceEdge, new ArrayList(outConfigMap.values())));
        Map<UseCase, SurfaceEdge> outputEdges = new HashMap<>();
        for (Map.Entry<UseCase, OutConfig> entry : outConfigMap.entrySet()) {
            outputEdges.put(entry.getKey(), out.get(entry.getValue()));
        }
        Map<UseCase, Size> selectedChildSizeMap = this.mVirtualCameraAdapter.getSelectedChildSizes(inputSurfaceEdge, isViewportSet);
        this.mVirtualCameraAdapter.setChildrenEdges(outputEdges, selectedChildSizeMap);
    }

    private void transformDualSurfacesAndOutputToChildUseCases(SurfaceEdge inputSurfacePrimary, SurfaceEdge inputSurfaceSecondary, DualSurfaceProcessorNode dualProcessorNode, StreamSpec streamSpec) {
        if (getEffect() != null) {
            DualOutConfig dualOutConfig = this.mVirtualCameraAdapter.getChildPreviewOutConfig(inputSurfacePrimary, inputSurfaceSecondary, getTargetRotationInternal(), getViewPortCropRect() != null);
            DualSurfaceProcessorNode.Out out = dualProcessorNode.transform(DualSurfaceProcessorNode.In.of(inputSurfacePrimary, inputSurfaceSecondary, Arrays.asList(dualOutConfig)));
            this.mDualProcessedEdge = out.values().iterator().next();
            if (getEffect().getOutputOption() == 1) {
                this.mDualSharingInputEdgeForEffect = this.mDualProcessedEdge;
            } else {
                this.mDualSharingInputEdgeForEffect = getEffectTransformedEdge((SurfaceEdge) Objects.requireNonNull(this.mDualProcessedEdge), (CameraInternal) Objects.requireNonNull(getCamera()));
            }
            this.mDualSharingNodeForEffect = createEffectOrCopyNode((CameraInternal) Objects.requireNonNull(getCamera()), streamSpec);
            transformAndOutputToChildUseCases(this.mDualSharingInputEdgeForEffect, this.mDualSharingNodeForEffect, true);
            return;
        }
        boolean isViewportSet = getViewPortCropRect() != null;
        Map<UseCase, DualOutConfig> outConfigMap = this.mVirtualCameraAdapter.getChildrenOutConfigs(inputSurfacePrimary, inputSurfaceSecondary, getTargetRotationInternal(), isViewportSet);
        DualSurfaceProcessorNode.Out out2 = this.mDualSharingNode.transform(DualSurfaceProcessorNode.In.of(inputSurfacePrimary, inputSurfaceSecondary, new ArrayList(outConfigMap.values())));
        Map<UseCase, SurfaceEdge> outputEdges = new HashMap<>();
        for (Map.Entry<UseCase, DualOutConfig> entry : outConfigMap.entrySet()) {
            outputEdges.put(entry.getKey(), out2.get(entry.getValue()));
        }
        Map<UseCase, Size> primarySelectedChildSizes = this.mVirtualCameraAdapter.getSelectedChildSizes(inputSurfacePrimary, isViewportSet);
        this.mVirtualCameraAdapter.setChildrenEdges(outputEdges, primarySelectedChildSizes);
    }

    private SurfaceEdge createPrimaryCameraInputSurface(String cameraId, String secondaryCameraId, UseCaseConfig<?> config, StreamSpec primaryStreamSpec, StreamSpec secondaryStreamSpec) {
        this.mCameraEdge = new SurfaceEdge(3, 34, primaryStreamSpec, getSensorToBufferTransformMatrix(), ((CameraInternal) Objects.requireNonNull(getCamera())).getHasTransform(), (Rect) Objects.requireNonNull(getCropRect(primaryStreamSpec.getResolution())), getRelativeRotation((CameraInternal) Objects.requireNonNull(getCamera())), -1, isMirroringRequired((CameraInternal) Objects.requireNonNull(getCamera())));
        boolean isDualCamera = secondaryCameraId != null;
        this.mSharingInputEdge = getSharingInputEdge(this.mCameraEdge, (CameraInternal) Objects.requireNonNull(getCamera()), isDualCamera);
        this.mSessionConfigBuilder = createSessionConfigBuilder(this.mCameraEdge, config, primaryStreamSpec);
        addCameraErrorListener(this.mSessionConfigBuilder, cameraId, secondaryCameraId, config, primaryStreamSpec, secondaryStreamSpec);
        return this.mSharingInputEdge;
    }

    private SurfaceEdge createSecondaryCameraInputSurface(String cameraId, String secondaryCameraId, UseCaseConfig<?> config, StreamSpec primaryStreamSpec, StreamSpec secondaryStreamSpec) {
        this.mSecondaryCameraEdge = new SurfaceEdge(3, 34, secondaryStreamSpec, getSensorToBufferTransformMatrix(), ((CameraInternal) Objects.requireNonNull(getSecondaryCamera())).getHasTransform(), (Rect) Objects.requireNonNull(getCropRect(secondaryStreamSpec.getResolution())), getRelativeRotation((CameraInternal) Objects.requireNonNull(getSecondaryCamera())), -1, isMirroringRequired((CameraInternal) Objects.requireNonNull(getSecondaryCamera())));
        this.mSecondarySharingInputEdge = getSharingInputEdge(this.mSecondaryCameraEdge, (CameraInternal) Objects.requireNonNull(getSecondaryCamera()), true);
        this.mSecondarySessionConfigBuilder = createSessionConfigBuilder(this.mSecondaryCameraEdge, config, secondaryStreamSpec);
        addCameraErrorListener(this.mSecondarySessionConfigBuilder, cameraId, secondaryCameraId, config, primaryStreamSpec, secondaryStreamSpec);
        return this.mSecondarySharingInputEdge;
    }

    private SessionConfig.Builder createSessionConfigBuilder(SurfaceEdge surfaceEdge, UseCaseConfig<?> config, StreamSpec streamSpec) {
        SessionConfig.Builder builder = SessionConfig.Builder.createFrom(config, streamSpec.getResolution());
        propagateChildrenTemplate(builder);
        propagateChildrenCamera2Interop(streamSpec.getResolution(), builder);
        DeferrableSurface deferrableSurface = surfaceEdge.getDeferrableSurface();
        builder.addSurface(deferrableSurface, streamSpec.getDynamicRange(), null, -1);
        builder.addRepeatingCameraCaptureCallback(this.mVirtualCameraAdapter.getParentMetadataCallback());
        if (streamSpec.getImplementationOptions() != null) {
            builder.addImplementationOptions(streamSpec.getImplementationOptions());
        }
        builder.setSessionType(streamSpec.getSessionType());
        applyExpectedFrameRateRange(builder, streamSpec);
        return builder;
    }

    private void propagateChildrenTemplate(SessionConfig.Builder builder) {
        int targetTemplate = -1;
        for (UseCase child : getChildren()) {
            targetTemplate = SessionConfig.getHigherPriorityTemplateType(targetTemplate, getChildTemplate(child));
        }
        if (targetTemplate != -1) {
            builder.setTemplateType(targetTemplate);
        }
    }

    private static int getChildTemplate(UseCase useCase) {
        return useCase.getCurrentConfig().getDefaultSessionConfig().getTemplateType();
    }

    private void propagateChildrenCamera2Interop(Size resolution, SessionConfig.Builder builder) {
        for (UseCase useCase : getChildren()) {
            SessionConfig childConfig = SessionConfig.Builder.createFrom(useCase.getCurrentConfig(), resolution).build();
            builder.addAllRepeatingCameraCaptureCallbacks(childConfig.getRepeatingCameraCaptureCallbacks());
            builder.addAllCameraCaptureCallbacks(childConfig.getSingleCameraCaptureCallbacks());
            builder.addAllSessionStateCallbacks(childConfig.getSessionStateCallbacks());
            builder.addAllDeviceStateCallbacks(childConfig.getDeviceStateCallbacks());
            builder.addImplementationOptions(childConfig.getImplementationOptions());
        }
    }

    private SurfaceEdge getSharingInputEdge(SurfaceEdge cameraEdge, CameraInternal camera, boolean isDualCamera) {
        if (getEffect() == null) {
            return cameraEdge;
        }
        if (getEffect().getTransformation() == 2) {
            return cameraEdge;
        }
        if (isDualCamera) {
            return cameraEdge;
        }
        if (getEffect().getOutputOption() == 1) {
            return cameraEdge;
        }
        return getEffectTransformedEdge(cameraEdge, camera);
    }

    private SurfaceEdge getEffectTransformedEdge(SurfaceEdge inputEdge, CameraInternal camera) {
        this.mEffectNode = new SurfaceProcessorNode(camera, getEffect().createSurfaceProcessorInternal());
        int rotationAppliedByEffect = getRotationAppliedByEffect();
        Rect cropRectAppliedByEffect = getCropRectAppliedByEffect(inputEdge);
        OutConfig outConfig = OutConfig.of(inputEdge.getTargets(), inputEdge.getFormat(), cropRectAppliedByEffect, TransformUtils.getRotatedSize(cropRectAppliedByEffect, rotationAppliedByEffect), rotationAppliedByEffect, getMirroringAppliedByEffect(), true);
        SurfaceProcessorNode.In in = SurfaceProcessorNode.In.of(inputEdge, Collections.singletonList(outConfig));
        SurfaceProcessorNode.Out out = this.mEffectNode.transform(in);
        return (SurfaceEdge) Objects.requireNonNull(out.get(outConfig));
    }

    private SurfaceProcessorNode createEffectOrCopyNode(CameraInternal camera, StreamSpec streamSpec) {
        if (getEffect() != null && getEffect().getOutputOption() == 1) {
            this.mEffectNode = new SurfaceProcessorNode(camera, getEffect().createSurfaceProcessorInternal());
            return this.mEffectNode;
        }
        return new SurfaceProcessorNode(camera, DefaultSurfaceProcessor.Factory.newInstance(streamSpec.getDynamicRange()));
    }

    private DualSurfaceProcessorNode createDualSharingNode(CameraInternal primaryCamera, CameraInternal secondaryCamera, StreamSpec streamSpec, CompositionSettings primaryCompositionSettings, CompositionSettings secondaryCompositionSettings) {
        return new DualSurfaceProcessorNode(primaryCamera, secondaryCamera, DualSurfaceProcessor.Factory.newInstance(streamSpec.getDynamicRange(), primaryCompositionSettings, secondaryCompositionSettings));
    }

    private int getRotationAppliedByEffect() {
        CameraEffect effect = (CameraEffect) Preconditions.checkNotNull(getEffect());
        if (effect.getTransformation() == 1) {
            return getRelativeRotation((CameraInternal) Preconditions.checkNotNull(getCamera()));
        }
        return 0;
    }

    private boolean getMirroringAppliedByEffect() {
        CameraEffect effect = (CameraEffect) Preconditions.checkNotNull(getEffect());
        if (effect.getTransformation() != 1) {
            return false;
        }
        CameraInternal camera = (CameraInternal) Preconditions.checkNotNull(getCamera());
        return camera.isFrontFacing() && camera.getHasTransform();
    }

    private Rect getCropRectAppliedByEffect(SurfaceEdge cameraEdge) {
        CameraEffect effect = (CameraEffect) Preconditions.checkNotNull(getEffect());
        if (effect.getTransformation() == 1) {
            Size parentSize = cameraEdge.getStreamSpec().getResolution();
            return TransformUtils.sizeToRect(parentSize);
        }
        return cameraEdge.getCropRect();
    }

    private void addCameraErrorListener(SessionConfig.Builder sessionConfigBuilder, final String cameraId, final String secondaryCameraId, final UseCaseConfig<?> config, final StreamSpec primaryStreamSpec, final StreamSpec secondaryStreamSpec) {
        if (this.mCloseableErrorListener != null) {
            this.mCloseableErrorListener.close();
        }
        this.mCloseableErrorListener = new SessionConfig.CloseableErrorListener(new SessionConfig.ErrorListener() { // from class: androidx.camera.core.streamsharing.StreamSharing$$ExternalSyntheticLambda2
            @Override // androidx.camera.core.impl.SessionConfig.ErrorListener
            public final void onError(SessionConfig sessionConfig, SessionConfig.SessionError sessionError) {
                StreamSharing.this.m236x83a3b685(cameraId, secondaryCameraId, config, primaryStreamSpec, secondaryStreamSpec, sessionConfig, sessionError);
            }
        });
        sessionConfigBuilder.setErrorListener(this.mCloseableErrorListener);
    }

    /* renamed from: lambda$addCameraErrorListener$1$androidx-camera-core-streamsharing-StreamSharing, reason: not valid java name */
    /* synthetic */ void m236x83a3b685(String cameraId, String secondaryCameraId, UseCaseConfig config, StreamSpec primaryStreamSpec, StreamSpec secondaryStreamSpec, SessionConfig sessionConfig, SessionConfig.SessionError error) {
        if (getCamera() == null) {
            return;
        }
        clearPipeline();
        updateSessionConfig(createPipelineAndUpdateChildrenSpecs(cameraId, secondaryCameraId, config, primaryStreamSpec, secondaryStreamSpec));
        notifyReset();
        this.mVirtualCameraAdapter.resetChildren();
    }

    private void clearPipeline() {
        if (this.mCloseableErrorListener != null) {
            this.mCloseableErrorListener.close();
            this.mCloseableErrorListener = null;
        }
        if (this.mCameraEdge != null) {
            this.mCameraEdge.close();
            this.mCameraEdge = null;
        }
        if (this.mSecondaryCameraEdge != null) {
            this.mSecondaryCameraEdge.close();
            this.mSecondaryCameraEdge = null;
        }
        if (this.mSharingInputEdge != null) {
            this.mSharingInputEdge.close();
            this.mSharingInputEdge = null;
        }
        if (this.mSecondarySharingInputEdge != null) {
            this.mSecondarySharingInputEdge.close();
            this.mSecondarySharingInputEdge = null;
        }
        if (this.mDualProcessedEdge != null) {
            this.mDualProcessedEdge.close();
            this.mDualProcessedEdge = null;
        }
        if (this.mDualSharingInputEdgeForEffect != null) {
            this.mDualSharingInputEdgeForEffect.close();
            this.mDualSharingInputEdgeForEffect = null;
        }
        if (this.mSharingNode != null) {
            this.mSharingNode.release();
            this.mSharingNode = null;
        }
        if (this.mDualSharingNode != null) {
            this.mDualSharingNode.release();
            this.mDualSharingNode = null;
        }
        if (this.mEffectNode != null) {
            this.mEffectNode.release();
            this.mEffectNode = null;
        }
        if (this.mDualSharingNodeForEffect != null) {
            this.mDualSharingNodeForEffect.release();
            this.mDualSharingNodeForEffect = null;
        }
    }

    private Rect getCropRect(Size surfaceResolution) {
        if (getViewPortCropRect() != null) {
            return getViewPortCropRect();
        }
        return new Rect(0, 0, surfaceResolution.getWidth(), surfaceResolution.getHeight());
    }

    SurfaceEdge getCameraEdge() {
        return this.mCameraEdge;
    }

    SurfaceProcessorNode getSharingNode() {
        return this.mSharingNode;
    }

    VirtualCameraAdapter getVirtualCameraAdapter() {
        return this.mVirtualCameraAdapter;
    }

    public static List<UseCaseConfigFactory.CaptureType> getCaptureTypes(UseCase useCase) {
        List<UseCaseConfigFactory.CaptureType> result = new ArrayList<>();
        if (isStreamSharing(useCase)) {
            for (UseCase child : ((StreamSharing) useCase).getChildren()) {
                result.add(child.getCurrentConfig().getCaptureType());
            }
        } else {
            result.add(useCase.getCurrentConfig().getCaptureType());
        }
        return result;
    }

    public static boolean isStreamSharing(UseCase useCase) {
        return useCase instanceof StreamSharing;
    }

    public SurfaceEdge getSharingInputEdge() {
        return this.mSharingInputEdge;
    }

    @Override // androidx.camera.core.UseCase
    public Set<DynamicRange> getSupportedDynamicRanges(CameraInfoInternal cameraInfo) {
        Set<UseCase> children = getChildren();
        if (children.isEmpty()) {
            return null;
        }
        Set<DynamicRange> intersectedRanges = null;
        for (UseCase child : children) {
            Set<DynamicRange> childSupportedRanges = child.getSupportedDynamicRanges(cameraInfo);
            if (childSupportedRanges != null) {
                if (intersectedRanges == null) {
                    intersectedRanges = new HashSet<>(childSupportedRanges);
                } else {
                    intersectedRanges.retainAll(childSupportedRanges);
                }
            }
        }
        return intersectedRanges;
    }
}
