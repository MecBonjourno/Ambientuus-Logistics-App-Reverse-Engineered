package androidx.camera.core.streamsharing;

import android.graphics.Rect;
import android.util.Range;
import android.util.Size;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.Logger;
import androidx.camera.core.Preview;
import androidx.camera.core.UseCase;
import androidx.camera.core.impl.CameraCaptureCallback;
import androidx.camera.core.impl.CameraCaptureResult;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.ImageInputConfig;
import androidx.camera.core.impl.ImageOutputConfig;
import androidx.camera.core.impl.MutableConfig;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.camera.core.processing.SurfaceEdge;
import androidx.camera.core.processing.concurrent.DualOutConfig;
import androidx.camera.core.processing.util.OutConfig;
import androidx.camera.core.streamsharing.StreamSharing;
import androidx.core.util.Preconditions;
import j$.util.Objects;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* carregado de: classes.dex */
class VirtualCameraAdapter implements UseCase.StateChangeCallback {
    private static final String TAG = "VirtualCameraAdapter";
    final Set<UseCase> mChildren;
    private final Set<UseCaseConfig<?>> mChildrenConfigs;
    private final Map<UseCase, UseCaseConfig<?>> mChildrenConfigsMap;
    private final CameraInternal mParentCamera;
    private final ResolutionsMerger mResolutionsMerger;
    private final CameraInternal mSecondaryParentCamera;
    private ResolutionsMerger mSecondaryResolutionsMerger;
    private final UseCaseConfigFactory mUseCaseConfigFactory;
    final Map<UseCase, SurfaceEdge> mChildrenEdges = new HashMap();
    private final Map<UseCase, VirtualCamera> mChildrenVirtualCameras = new HashMap();
    final Map<UseCase, Boolean> mChildrenActiveState = new HashMap();
    private final CameraCaptureCallback mParentMetadataCallback = createCameraCaptureCallback();

    VirtualCameraAdapter(CameraInternal parentCamera, CameraInternal secondaryParentCamera, Set<UseCase> children, UseCaseConfigFactory useCaseConfigFactory, StreamSharing.Control streamSharingControl) {
        this.mParentCamera = parentCamera;
        this.mSecondaryParentCamera = secondaryParentCamera;
        this.mUseCaseConfigFactory = useCaseConfigFactory;
        this.mChildren = children;
        this.mChildrenConfigsMap = toChildrenConfigsMap(parentCamera, children, useCaseConfigFactory);
        this.mChildrenConfigs = new HashSet(this.mChildrenConfigsMap.values());
        this.mResolutionsMerger = new ResolutionsMerger(parentCamera, this.mChildrenConfigs);
        if (this.mSecondaryParentCamera != null) {
            this.mSecondaryResolutionsMerger = new ResolutionsMerger(this.mSecondaryParentCamera, this.mChildrenConfigs);
        }
        for (UseCase child : children) {
            this.mChildrenActiveState.put(child, false);
            this.mChildrenVirtualCameras.put(child, new VirtualCamera(parentCamera, this, streamSharingControl));
        }
    }

    void mergeChildrenConfigs(MutableConfig mutableConfig) {
        List<Size> mergedResolutions = this.mResolutionsMerger.getMergedResolutions(mutableConfig);
        mutableConfig.insertOption(ImageOutputConfig.OPTION_CUSTOM_ORDERED_RESOLUTIONS, mergedResolutions);
        mutableConfig.insertOption(UseCaseConfig.OPTION_SURFACE_OCCUPANCY_PRIORITY, Integer.valueOf(getHighestSurfacePriority(this.mChildrenConfigs)));
        DynamicRange dynamicRange = DynamicRangeUtils.resolveDynamicRange(this.mChildrenConfigs);
        if (dynamicRange == null) {
            throw new IllegalArgumentException("Failed to merge child dynamic ranges, can not find a dynamic range that satisfies all children.");
        }
        mutableConfig.insertOption(ImageInputConfig.OPTION_INPUT_DYNAMIC_RANGE, dynamicRange);
        mutableConfig.insertOption(UseCaseConfig.OPTION_TARGET_FRAME_RATE, resolveTargetFrameRate(this.mChildrenConfigs));
        for (UseCase useCase : this.mChildren) {
            UseCaseConfig<?> useCaseConfig = (UseCaseConfig) Objects.requireNonNull(this.mChildrenConfigsMap.get(useCase));
            if (useCaseConfig.getVideoStabilizationMode() != 0) {
                mutableConfig.insertOption(UseCaseConfig.OPTION_VIDEO_STABILIZATION_MODE, Integer.valueOf(useCaseConfig.getVideoStabilizationMode()));
            }
            if (useCaseConfig.getPreviewStabilizationMode() != 0) {
                mutableConfig.insertOption(UseCaseConfig.OPTION_PREVIEW_STABILIZATION_MODE, Integer.valueOf(useCaseConfig.getPreviewStabilizationMode()));
            }
        }
    }

    void bindChildren() {
        for (UseCase useCase : this.mChildren) {
            useCase.bindToCamera((CameraInternal) Objects.requireNonNull(this.mChildrenVirtualCameras.get(useCase)), null, null, useCase.getDefaultConfig(true, this.mUseCaseConfigFactory));
        }
    }

    void unbindChildren() {
        for (UseCase useCase : this.mChildren) {
            useCase.unbindFromCamera((CameraInternal) Objects.requireNonNull(this.mChildrenVirtualCameras.get(useCase)));
        }
    }

    void notifySessionStart() {
        for (UseCase useCase : this.mChildren) {
            useCase.onSessionStart();
        }
    }

    void notifySessionStop() {
        for (UseCase useCase : this.mChildren) {
            useCase.onSessionStop();
        }
    }

    void notifyCameraControlReady() {
        for (UseCase useCase : this.mChildren) {
            useCase.onCameraControlReady();
        }
    }

    Set<UseCase> getChildren() {
        return this.mChildren;
    }

    Map<UseCase, OutConfig> getChildrenOutConfigs(SurfaceEdge sharingInputEdge, int parentTargetRotation, boolean isViewportSet, boolean skipMirroring) {
        Map<UseCase, OutConfig> outConfigs = new HashMap<>();
        for (UseCase useCase : this.mChildren) {
            SurfaceEdge sharingInputEdge2 = sharingInputEdge;
            OutConfig outConfig = calculateOutConfig(useCase, this.mResolutionsMerger, this.mParentCamera, sharingInputEdge2, parentTargetRotation, isViewportSet, skipMirroring);
            updateVirtualCameraRotationDegrees(useCase);
            outConfigs.put(useCase, outConfig);
            sharingInputEdge = sharingInputEdge2;
        }
        return outConfigs;
    }

    private void updateVirtualCameraRotationDegrees(UseCase useCase) {
        int childRotationDegrees = getChildRotationDegrees(useCase, this.mParentCamera);
        ((VirtualCamera) Objects.requireNonNull(this.mChildrenVirtualCameras.get(useCase))).setRotationDegrees(childRotationDegrees);
    }

    Map<UseCase, Size> getSelectedChildSizes(SurfaceEdge sharingInputEdge, boolean isViewportSet) {
        Map<UseCase, Size> selectedChildSizes = new HashMap<>();
        for (UseCase useCase : this.mChildren) {
            PreferredChildSize preferredChildSize = this.mResolutionsMerger.getPreferredChildSize((UseCaseConfig) Objects.requireNonNull(this.mChildrenConfigsMap.get(useCase)), sharingInputEdge.getCropRect(), TransformUtils.getRotationDegrees(sharingInputEdge.getSensorToBufferTransform()), isViewportSet);
            selectedChildSizes.put(useCase, preferredChildSize.getOriginalSelectedChildSize());
            Logger.d(TAG, "Selected child size: " + preferredChildSize.getOriginalSelectedChildSize() + ", useCase: " + useCase);
        }
        return selectedChildSizes;
    }

    private Preview getPreviewFromChildren() {
        for (UseCase child : this.mChildren) {
            if (child instanceof Preview) {
                return (Preview) child;
            }
        }
        return null;
    }

    DualOutConfig getChildPreviewOutConfig(SurfaceEdge primaryInputSurfaceEdge, SurfaceEdge secondaryInputSurfaceEdge, int parentTargetRotation, boolean isViewportSet) {
        Preview preview = (Preview) Preconditions.checkNotNull(getPreviewFromChildren());
        OutConfig primaryoutConfig = calculateOutConfig(preview, this.mResolutionsMerger, this.mParentCamera, primaryInputSurfaceEdge, parentTargetRotation, isViewportSet, false);
        OutConfig secondaryOutConfig = calculateOutConfig(preview, this.mResolutionsMerger, this.mSecondaryParentCamera, secondaryInputSurfaceEdge, parentTargetRotation, isViewportSet, false);
        return DualOutConfig.of(primaryoutConfig, secondaryOutConfig);
    }

    Map<UseCase, DualOutConfig> getChildrenOutConfigs(SurfaceEdge primaryInputEdge, SurfaceEdge secondaryInputEdge, int parentTargetRotation, boolean isViewportSet) {
        Map<UseCase, DualOutConfig> outConfigs = new HashMap<>();
        for (UseCase useCase : this.mChildren) {
            SurfaceEdge primaryInputEdge2 = primaryInputEdge;
            int parentTargetRotation2 = parentTargetRotation;
            boolean isViewportSet2 = isViewportSet;
            OutConfig primaryOutConfig = calculateOutConfig(useCase, this.mResolutionsMerger, this.mParentCamera, primaryInputEdge2, parentTargetRotation2, isViewportSet2, false);
            SurfaceEdge secondaryInputEdge2 = secondaryInputEdge;
            OutConfig secondaryOutConfig = calculateOutConfig(useCase, (ResolutionsMerger) Objects.requireNonNull(this.mSecondaryResolutionsMerger), (CameraInternal) Objects.requireNonNull(this.mSecondaryParentCamera), secondaryInputEdge2, parentTargetRotation2, isViewportSet2, false);
            updateVirtualCameraRotationDegrees(useCase);
            outConfigs.put(useCase, DualOutConfig.of(primaryOutConfig, secondaryOutConfig));
            primaryInputEdge = primaryInputEdge2;
            secondaryInputEdge = secondaryInputEdge2;
            parentTargetRotation = parentTargetRotation2;
            isViewportSet = isViewportSet2;
        }
        return outConfigs;
    }

    private OutConfig calculateOutConfig(UseCase useCase, ResolutionsMerger resolutionsMerger, CameraInternal cameraInternal, SurfaceEdge cameraInputEdge, int parentTargetRotation, boolean isViewportSet, boolean skipMirroring) {
        int parentRotationDegrees = cameraInternal.getCameraInfo().getSensorRotationDegrees(parentTargetRotation);
        boolean parentIsMirrored = TransformUtils.isMirrored(cameraInputEdge.getSensorToBufferTransform());
        PreferredChildSize preferredChildSize = resolutionsMerger.getPreferredChildSize((UseCaseConfig) Objects.requireNonNull(this.mChildrenConfigsMap.get(useCase)), cameraInputEdge.getCropRect(), TransformUtils.getRotationDegrees(cameraInputEdge.getSensorToBufferTransform()), isViewportSet);
        Rect cropRectBeforeScaling = preferredChildSize.getCropRectBeforeScaling();
        Size childSizeToScale = preferredChildSize.getChildSizeToScale();
        int childRotationDegrees = getChildRotationDegrees(useCase, cameraInternal);
        int childParentDelta = TransformUtils.within360((cameraInputEdge.getRotationDegrees() + childRotationDegrees) - parentRotationDegrees);
        boolean doMirroring = skipMirroring ? false : useCase.isMirroringRequired(cameraInternal) ^ parentIsMirrored;
        return OutConfig.of(getChildTargetType(useCase), getChildFormat(useCase), cropRectBeforeScaling, TransformUtils.rotateSize(childSizeToScale, childParentDelta), childParentDelta, doMirroring);
    }

    void setChildrenEdges(Map<UseCase, SurfaceEdge> childrenEdges, Map<UseCase, Size> selectedChildSizes) {
        this.mChildrenEdges.clear();
        this.mChildrenEdges.putAll(childrenEdges);
        for (Map.Entry<UseCase, SurfaceEdge> entry : this.mChildrenEdges.entrySet()) {
            UseCase useCase = entry.getKey();
            SurfaceEdge surfaceEdge = entry.getValue();
            useCase.setViewPortCropRect(surfaceEdge.getCropRect());
            useCase.setSensorToBufferTransformMatrix(surfaceEdge.getSensorToBufferTransform());
            StreamSpec streamSpec = getChildStreamSpec(useCase, surfaceEdge.getStreamSpec(), selectedChildSizes);
            useCase.updateSuggestedStreamSpec(streamSpec, null);
            useCase.notifyState();
        }
    }

    void resetChildren() {
        Threads.checkMainThread();
        for (UseCase useCase : this.mChildren) {
            onUseCaseReset(useCase);
        }
    }

    CameraCaptureCallback getParentMetadataCallback() {
        return this.mParentMetadataCallback;
    }

    @Override // androidx.camera.core.UseCase.StateChangeCallback
    public void onUseCaseActive(UseCase useCase) {
        Threads.checkMainThread();
        if (isUseCaseActive(useCase)) {
            return;
        }
        this.mChildrenActiveState.put(useCase, true);
        DeferrableSurface childSurface = getChildSurface(useCase);
        if (childSurface != null) {
            forceSetProvider(getUseCaseEdge(useCase), childSurface, useCase.getSessionConfig());
        }
    }

    @Override // androidx.camera.core.UseCase.StateChangeCallback
    public void onUseCaseInactive(UseCase useCase) {
        Threads.checkMainThread();
        if (!isUseCaseActive(useCase)) {
            return;
        }
        this.mChildrenActiveState.put(useCase, false);
        getUseCaseEdge(useCase).disconnect();
    }

    @Override // androidx.camera.core.UseCase.StateChangeCallback
    public void onUseCaseUpdated(UseCase useCase) {
        Threads.checkMainThread();
        if (!isUseCaseActive(useCase)) {
            return;
        }
        SurfaceEdge edge = getUseCaseEdge(useCase);
        DeferrableSurface childSurface = getChildSurface(useCase);
        if (childSurface != null) {
            forceSetProvider(edge, childSurface, useCase.getSessionConfig());
        } else {
            edge.disconnect();
        }
    }

    @Override // androidx.camera.core.UseCase.StateChangeCallback
    public void onUseCaseReset(UseCase useCase) {
        DeferrableSurface childSurface;
        Threads.checkMainThread();
        SurfaceEdge edge = getUseCaseEdge(useCase);
        if (isUseCaseActive(useCase) && (childSurface = getChildSurface(useCase)) != null) {
            forceSetProvider(edge, childSurface, useCase.getSessionConfig());
        }
    }

    private int getChildRotationDegrees(UseCase child, CameraInternal cameraInternal) {
        int childTargetRotation = ((ImageOutputConfig) child.getCurrentConfig()).getTargetRotation(0);
        return cameraInternal.getCameraInfo().getSensorRotationDegrees(childTargetRotation);
    }

    private static StreamSpec getChildStreamSpec(UseCase useCase, StreamSpec baseStreamSpec, Map<UseCase, Size> selectedChildSizes) {
        StreamSpec.Builder builder = baseStreamSpec.toBuilder();
        Size selectedChildSize = selectedChildSizes.get(useCase);
        if (selectedChildSize != null) {
            builder.setOriginalConfiguredResolution(selectedChildSize);
        }
        return builder.build();
    }

    private static int getChildFormat(UseCase useCase) {
        return useCase instanceof ImageCapture ? 256 : 34;
    }

    private static int getChildTargetType(UseCase useCase) {
        if (useCase instanceof Preview) {
            return 1;
        }
        if (useCase instanceof ImageCapture) {
            return 4;
        }
        return 2;
    }

    private static Map<UseCase, UseCaseConfig<?>> toChildrenConfigsMap(CameraInternal parentCamera, Set<UseCase> children, UseCaseConfigFactory useCaseConfigFactory) {
        Map<UseCase, UseCaseConfig<?>> result = new HashMap<>();
        for (UseCase useCase : children) {
            UseCaseConfig<?> config = useCase.mergeConfigs(parentCamera.getCameraInfoInternal(), null, useCase.getDefaultConfig(true, useCaseConfigFactory));
            result.put(useCase, config);
        }
        return result;
    }

    private static int getHighestSurfacePriority(Set<UseCaseConfig<?>> childrenConfigs) {
        int highestPriority = 0;
        for (UseCaseConfig<?> childConfig : childrenConfigs) {
            highestPriority = Math.max(highestPriority, childConfig.getSurfaceOccupancyPriority(0));
        }
        return highestPriority;
    }

    private SurfaceEdge getUseCaseEdge(UseCase useCase) {
        return (SurfaceEdge) Objects.requireNonNull(this.mChildrenEdges.get(useCase));
    }

    private boolean isUseCaseActive(UseCase useCase) {
        return ((Boolean) Objects.requireNonNull(this.mChildrenActiveState.get(useCase))).booleanValue();
    }

    private static void forceSetProvider(SurfaceEdge edge, DeferrableSurface childSurface, SessionConfig childSessionConfig) {
        edge.invalidate();
        try {
            edge.setProvider(childSurface);
        } catch (DeferrableSurface.SurfaceClosedException e) {
            if (childSessionConfig.getErrorListener() != null) {
                childSessionConfig.getErrorListener().onError(childSessionConfig, SessionConfig.SessionError.SESSION_ERROR_SURFACE_NEEDS_RESET);
            }
        }
    }

    static DeferrableSurface getChildSurface(UseCase child) {
        List<DeferrableSurface> surfaces;
        if (child instanceof ImageCapture) {
            surfaces = child.getSessionConfig().getSurfaces();
        } else {
            surfaces = child.getSessionConfig().getRepeatingCaptureConfig().getSurfaces();
        }
        Preconditions.checkState(surfaces.size() <= 1);
        if (surfaces.size() == 1) {
            return surfaces.get(0);
        }
        return null;
    }

    CameraCaptureCallback createCameraCaptureCallback() {
        return new VirtualCameraCaptureCallback(this);
    }

    static class VirtualCameraCaptureCallback extends CameraCaptureCallback {
        private final WeakReference<VirtualCameraAdapter> mVirtualCameraAdapterRef;

        VirtualCameraCaptureCallback(VirtualCameraAdapter virtualCameraAdapter) {
            this.mVirtualCameraAdapterRef = new WeakReference<>(virtualCameraAdapter);
        }

        @Override // androidx.camera.core.impl.CameraCaptureCallback
        public void onCaptureCompleted(int captureConfigId, CameraCaptureResult cameraCaptureResult) {
            VirtualCameraAdapter virtualCameraAdapter = this.mVirtualCameraAdapterRef.get();
            if (virtualCameraAdapter != null) {
                for (UseCase child : virtualCameraAdapter.mChildren) {
                    VirtualCameraAdapter.sendCameraCaptureResultToChild(cameraCaptureResult, child.getSessionConfig(), captureConfigId);
                }
            }
        }
    }

    static void sendCameraCaptureResultToChild(CameraCaptureResult cameraCaptureResult, SessionConfig sessionConfig, int captureConfigId) {
        for (CameraCaptureCallback callback : sessionConfig.getRepeatingCameraCaptureCallbacks()) {
            callback.onCaptureCompleted(captureConfigId, new VirtualCameraCaptureResult(sessionConfig.getRepeatingCaptureConfig().getTagBundle(), cameraCaptureResult));
        }
    }

    private static Range<Integer> resolveTargetFrameRate(Set<UseCaseConfig<?>> useCaseConfigs) {
        Range<Integer> resolvedTargetFrameRate = StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED;
        for (UseCaseConfig<?> useCaseConfig : useCaseConfigs) {
            Range<Integer> targetFrameRate = (Range) Objects.requireNonNull(useCaseConfig.getTargetFrameRate(resolvedTargetFrameRate));
            if (StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED.equals(resolvedTargetFrameRate)) {
                resolvedTargetFrameRate = targetFrameRate;
            } else {
                try {
                    resolvedTargetFrameRate = resolvedTargetFrameRate.intersect(targetFrameRate);
                } catch (IllegalArgumentException e) {
                    Logger.d(TAG, "No intersected frame rate can be found from the target frame rate settings of the UseCases! Resolved: " + resolvedTargetFrameRate + " <<>> " + targetFrameRate);
                    return resolvedTargetFrameRate.extend(targetFrameRate);
                }
            }
        }
        return resolvedTargetFrameRate;
    }
}
