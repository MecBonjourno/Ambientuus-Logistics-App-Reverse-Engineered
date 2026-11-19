package androidx.camera.core.internal;

import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.SurfaceTexture;
import android.util.Log;
import android.util.Range;
import android.util.Size;
import android.view.Surface;
import androidx.camera.core.Camera;
import androidx.camera.core.CameraControl;
import androidx.camera.core.CameraEffect;
import androidx.camera.core.CameraIdentifier;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.CompositionSettings;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.Logger;
import androidx.camera.core.Preview;
import androidx.camera.core.SurfaceRequest;
import androidx.camera.core.UseCase;
import androidx.camera.core.ViewPort;
import androidx.camera.core.concurrent.CameraCoordinator;
import androidx.camera.core.featuregroup.GroupableFeature;
import androidx.camera.core.featuregroup.impl.ResolvedFeatureGroup;
import androidx.camera.core.impl.AdapterCameraInfo;
import androidx.camera.core.impl.AdapterCameraInternal;
import androidx.camera.core.impl.CameraConfig;
import androidx.camera.core.impl.CameraConfigs;
import androidx.camera.core.impl.CameraControlInternal;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.ImageCaptureConfig;
import androidx.camera.core.impl.MutableOptionsBundle;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.internal.compat.workaround.StreamSharingForceEnabler;
import androidx.camera.core.processing.TargetUtils;
import androidx.camera.core.streamsharing.StreamSharing;
import androidx.core.util.Consumer;
import androidx.core.util.Preconditions;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* carregado de: classes.dex */
public final class CameraUseCaseAdapter implements Camera {
    private static final String TAG = "CameraUseCaseAdapter";
    private final List<UseCase> mAppUseCases;
    private boolean mAttached;
    private final CameraConfig mCameraConfig;
    private final CameraCoordinator mCameraCoordinator;
    private final CameraIdentifier mCameraIdentifier;
    private final AdapterCameraInternal mCameraInternal;
    private final List<UseCase> mCameraUseCases;
    private final CompositionSettings mCompositionSettings;
    private List<CameraEffect> mEffects;
    private Range<Integer> mFrameRate;
    private Config mInteropConfig;
    private final Object mLock;
    private UseCase mPlaceholderForExtensions;
    private final AdapterCameraInternal mSecondaryCameraInternal;
    private final CompositionSettings mSecondaryCompositionSettings;
    private int mSessionType;
    private StreamSharing mStreamSharing;
    private final StreamSharingForceEnabler mStreamSharingForceEnabler;
    private final StreamSpecsCalculator mStreamSpecsCalculator;
    private final UseCaseConfigFactory mUseCaseConfigFactory;
    private ViewPort mViewPort;

    @Override // androidx.camera.core.Camera
    public /* sintético */ boolean isUseCasesCombinationSupported(UseCase... useCaseArr) {
        boolean isUseCasesCombinationSupported;
        isUseCasesCombinationSupported = isUseCasesCombinationSupported(true, useCaseArr);
        return isUseCasesCombinationSupported;
    }

    @Override // androidx.camera.core.Camera
    public /* sintético */ boolean isUseCasesCombinationSupportedByFramework(UseCase... useCaseArr) {
        boolean isUseCasesCombinationSupported;
        isUseCasesCombinationSupported = isUseCasesCombinationSupported(false, useCaseArr);
        return isUseCasesCombinationSupported;
    }

    public CameraUseCaseAdapter(CameraInternal camera, CameraCoordinator cameraCoordinator, StreamSpecsCalculator streamSpecsCalculator, UseCaseConfigFactory useCaseConfigFactory) {
        this(camera, null, new AdapterCameraInfo(camera.getCameraInfoInternal(), CameraConfigs.defaultConfig()), null, CompositionSettings.DEFAULT, CompositionSettings.DEFAULT, cameraCoordinator, streamSpecsCalculator, useCaseConfigFactory);
    }

    public CameraUseCaseAdapter(CameraInternal camera, CameraInternal secondaryCamera, AdapterCameraInfo adapterCameraInfo, AdapterCameraInfo secondaryAdapterCameraInfo, CompositionSettings compositionSettings, CompositionSettings secondaryCompositionSettings, CameraCoordinator cameraCoordinator, StreamSpecsCalculator streamSpecsCalculator, UseCaseConfigFactory useCaseConfigFactory) {
        this.mAppUseCases = new ArrayList();
        this.mCameraUseCases = new ArrayList();
        this.mEffects = Collections.emptyList();
        this.mSessionType = 0;
        this.mFrameRate = StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED;
        this.mLock = new Object();
        this.mAttached = true;
        this.mInteropConfig = null;
        this.mStreamSharingForceEnabler = new StreamSharingForceEnabler();
        this.mCameraConfig = adapterCameraInfo.getCameraConfig();
        this.mCameraInternal = new AdapterCameraInternal(camera, adapterCameraInfo);
        if (secondaryCamera != null && secondaryAdapterCameraInfo != null) {
            this.mSecondaryCameraInternal = new AdapterCameraInternal(secondaryCamera, secondaryAdapterCameraInfo);
        } else {
            this.mSecondaryCameraInternal = null;
        }
        this.mCompositionSettings = compositionSettings;
        this.mSecondaryCompositionSettings = secondaryCompositionSettings;
        this.mCameraCoordinator = cameraCoordinator;
        this.mUseCaseConfigFactory = useCaseConfigFactory;
        this.mCameraIdentifier = CameraIdentifier.fromAdapterInfos(adapterCameraInfo, secondaryAdapterCameraInfo);
        this.mStreamSpecsCalculator = streamSpecsCalculator;
    }

    public CameraIdentifier getAdapterIdentifier() {
        return this.mCameraIdentifier;
    }

    public boolean isEquivalent(CameraUseCaseAdapter cameraUseCaseAdapter) {
        return getAdapterIdentifier().equals(cameraUseCaseAdapter.getAdapterIdentifier());
    }

    public void setViewPort(ViewPort viewPort) {
        synchronized (this.mLock) {
            this.mViewPort = viewPort;
        }
    }

    public void setEffects(List<CameraEffect> effects) {
        synchronized (this.mLock) {
            this.mEffects = effects;
        }
    }

    public ViewPort getViewPort() {
        ViewPort viewPort;
        synchronized (this.mLock) {
            viewPort = this.mViewPort;
        }
        return viewPort;
    }

    public List<CameraEffect> getEffects() {
        List<CameraEffect> list;
        synchronized (this.mLock) {
            list = this.mEffects;
        }
        return list;
    }

    public void setSessionType(int sessionType) {
        synchronized (this.mLock) {
            this.mSessionType = sessionType;
        }
    }

    public int getSessionType() {
        int i;
        synchronized (this.mLock) {
            i = this.mSessionType;
        }
        return i;
    }

    public void setFrameRate(Range<Integer> frameRate) {
        synchronized (this.mLock) {
            this.mFrameRate = frameRate;
        }
    }

    public Range<Integer> getFrameRate() {
        Range<Integer> range;
        synchronized (this.mLock) {
            range = this.mFrameRate;
        }
        return range;
    }

    public void addUseCases(Collection<UseCase> appUseCasesToAdd) throws CameraException {
        addUseCases(appUseCasesToAdd, null);
    }

    public void addUseCases(Collection<UseCase> appUseCasesToAdd, ResolvedFeatureGroup featureGroup) throws CameraException {
        Logger.d(TAG, "addUseCases: appUseCasesToAdd = " + appUseCasesToAdd + ", featureGroup = " + featureGroup);
        synchronized (this.mLock) {
            applyCameraConfig();
            Set<UseCase> appUseCases = new LinkedHashSet<>(this.mAppUseCases);
            appUseCases.addAll(appUseCasesToAdd);
            Map<UseCase, Set<GroupableFeature>> previousFeatureGroupMap = applyFeatureGroup(appUseCases, featureGroup);
            try {
                applyCalculatedUseCaseChanges(calculateAndValidateUseCases(appUseCases, this.mSecondaryCameraInternal != null, false));
            } catch (IllegalArgumentException e) {
                restoreFeatureGroup(previousFeatureGroupMap);
                throw new CameraException(e);
            }
        }
    }

    public CalculatedUseCaseInfo simulateAddUseCases(Collection<UseCase> appUseCasesToAdd, ResolvedFeatureGroup featureGroup, boolean findMaxSupportedFrameRate) throws CameraException {
        CalculatedUseCaseInfo calculateAndValidateUseCases;
        Logger.d(TAG, "simulateAddUseCases: appUseCasesToAdd = " + appUseCasesToAdd + ", featureGroup = " + featureGroup);
        synchronized (this.mLock) {
            applyCameraConfig();
            Set<UseCase> appUseCases = new LinkedHashSet<>(this.mAppUseCases);
            appUseCases.addAll(appUseCasesToAdd);
            Map<UseCase, Set<GroupableFeature>> previousFeatureGRoupMap = applyFeatureGroup(appUseCases, featureGroup);
            try {
                try {
                    calculateAndValidateUseCases = calculateAndValidateUseCases(appUseCases, this.mSecondaryCameraInternal != null, findMaxSupportedFrameRate);
                } catch (IllegalArgumentException e) {
                    throw new CameraException(e);
                }
            } finally {
                restoreFeatureGroup(previousFeatureGRoupMap);
            }
        }
        return calculateAndValidateUseCases;
    }

    public void removeUseCases(Collection<UseCase> useCasesToRemove) {
        synchronized (this.mLock) {
            clearFeatureGroup(useCasesToRemove);
            Set<UseCase> appUseCases = new LinkedHashSet<>(this.mAppUseCases);
            appUseCases.removeAll(useCasesToRemove);
            applyCalculatedUseCaseChanges(calculateAndValidateUseCases(appUseCases, this.mSecondaryCameraInternal != null, false));
        }
    }

    public void removeAllUseCases() {
        synchronized (this.mLock) {
            removeUseCases(this.mAppUseCases);
        }
    }

    private CalculatedUseCaseInfo calculateAndValidateUseCases(Collection<UseCase> appUseCases, boolean applyStreamSharing, boolean findMaxSupportedFrameRate) throws IllegalArgumentException {
        StreamSpecQueryResult secondaryStreamSpecResult;
        boolean z = findMaxSupportedFrameRate;
        checkUnsupportedFeatureCombinationAndThrow(appUseCases);
        if (!applyStreamSharing && shouldForceEnableStreamSharing(appUseCases)) {
            return calculateAndValidateUseCases(appUseCases, true, z);
        }
        StreamSharing streamSharing = createOrReuseStreamSharing(appUseCases, applyStreamSharing);
        UseCase placeholderForExtensions = calculatePlaceholderForExtensions(appUseCases, streamSharing);
        Collection<?> cameraUseCases = calculateCameraUseCases(appUseCases, placeholderForExtensions, streamSharing);
        List<UseCase> cameraUseCasesToAttach = new ArrayList<>((Collection<? extends UseCase>) cameraUseCases);
        cameraUseCasesToAttach.removeAll(this.mCameraUseCases);
        List<UseCase> cameraUseCasesToKeep = new ArrayList<>((Collection<? extends UseCase>) cameraUseCases);
        cameraUseCasesToKeep.retainAll(this.mCameraUseCases);
        List<UseCase> cameraUseCasesToDetach = new ArrayList<>(this.mCameraUseCases);
        cameraUseCasesToDetach.removeAll(cameraUseCases);
        Map<UseCase, ConfigPair> configs = getConfigs(cameraUseCasesToAttach, this.mCameraConfig.getUseCaseConfigFactory(), this.mUseCaseConfigFactory, this.mSessionType, this.mFrameRate);
        boolean isFeatureComboInvocation = isFeatureComboInvocation(cameraUseCasesToAttach, cameraUseCasesToKeep);
        try {
            try {
                try {
                    try {
                        try {
                            try {
                                StreamSpecQueryResult primaryStreamSpecResult = this.mStreamSpecsCalculator.calculateSuggestedStreamSpecs(getCameraMode(), this.mCameraInternal.getCameraInfoInternal(), cameraUseCasesToAttach, cameraUseCasesToKeep, this.mCameraConfig, this.mSessionType, this.mFrameRate, isFeatureComboInvocation, z);
                                try {
                                    if (this.mSecondaryCameraInternal == null) {
                                        secondaryStreamSpecResult = null;
                                    } else {
                                        try {
                                            z = findMaxSupportedFrameRate;
                                        } catch (IllegalArgumentException e) {
                                            exception = e;
                                            z = findMaxSupportedFrameRate;
                                        }
                                        try {
                                            StreamSpecQueryResult secondaryStreamSpecResult2 = this.mStreamSpecsCalculator.calculateSuggestedStreamSpecs(getCameraMode(), ((AdapterCameraInternal) Objects.requireNonNull(this.mSecondaryCameraInternal)).getCameraInfoInternal(), cameraUseCasesToAttach, cameraUseCasesToKeep, this.mCameraConfig, this.mSessionType, this.mFrameRate, isFeatureComboInvocation, z);
                                            secondaryStreamSpecResult = secondaryStreamSpecResult2;
                                        } catch (IllegalArgumentException e2) {
                                            exception = e2;
                                            if (applyStreamSharing) {
                                            }
                                            throw exception;
                                        }
                                    }
                                    return new CalculatedUseCaseInfo(appUseCases, cameraUseCases, cameraUseCasesToAttach, cameraUseCasesToKeep, cameraUseCasesToDetach, streamSharing, placeholderForExtensions, configs, primaryStreamSpecResult, secondaryStreamSpecResult);
                                } catch (IllegalArgumentException e3) {
                                    exception = e3;
                                    z = findMaxSupportedFrameRate;
                                    if (applyStreamSharing && isStreamSharingAllowed()) {
                                        return calculateAndValidateUseCases(appUseCases, true, z);
                                    }
                                    throw exception;
                                }
                            } catch (IllegalArgumentException e4) {
                                exception = e4;
                            }
                        } catch (IllegalArgumentException e5) {
                            exception = e5;
                        }
                    } catch (IllegalArgumentException e6) {
                        exception = e6;
                    }
                } catch (IllegalArgumentException e7) {
                    exception = e7;
                }
            } catch (IllegalArgumentException e8) {
                exception = e8;
            }
        } catch (IllegalArgumentException e9) {
            exception = e9;
        }
    }

    private void applyCalculatedUseCaseChanges(CalculatedUseCaseInfo info) {
        updateViewPortAndSensorToBufferMatrix(info.getPrimaryStreamSpecResult().getStreamSpecs(), info.getCameraUseCases());
        updateEffects(this.mEffects, info.getCameraUseCases(), info.getAppUseCases());
        Iterator<UseCase> it = info.getCameraUseCasesToDetach().iterator();
        while (it.hasNext()) {
            it.next().unbindFromCamera(this.mCameraInternal);
        }
        this.mCameraInternal.detachUseCases(info.getCameraUseCasesToDetach());
        if (this.mSecondaryCameraInternal != null) {
            Iterator<UseCase> it2 = info.getCameraUseCasesToDetach().iterator();
            while (it2.hasNext()) {
                it2.next().unbindFromCamera((CameraInternal) Objects.requireNonNull(this.mSecondaryCameraInternal));
            }
            ((AdapterCameraInternal) Objects.requireNonNull(this.mSecondaryCameraInternal)).detachUseCases(info.getCameraUseCasesToDetach());
        }
        if (info.getCameraUseCasesToDetach().isEmpty()) {
            for (UseCase useCase : info.getCameraUseCasesToKeep()) {
                Map<UseCase, StreamSpec> primaryStreamSpecMap = info.getPrimaryStreamSpecResult().getStreamSpecs();
                if (primaryStreamSpecMap.containsKey(useCase)) {
                    StreamSpec newStreamSpec = primaryStreamSpecMap.get(useCase);
                    Config config = ((StreamSpec) Objects.requireNonNull(newStreamSpec)).getImplementationOptions();
                    if (config != null && hasImplementationOptionChanged(newStreamSpec, useCase.getSessionConfig())) {
                        useCase.updateSuggestedStreamSpecImplementationOptions(config);
                        if (this.mAttached) {
                            this.mCameraInternal.onUseCaseUpdated(useCase);
                            if (this.mSecondaryCameraInternal != null) {
                                ((AdapterCameraInternal) Objects.requireNonNull(this.mSecondaryCameraInternal)).onUseCaseUpdated(useCase);
                            }
                        }
                    }
                }
            }
        }
        for (UseCase useCase2 : info.getCameraUseCasesToAttach()) {
            ConfigPair configPair = (ConfigPair) Objects.requireNonNull(info.getUseCaseConfigs().get(useCase2));
            if (this.mSecondaryCameraInternal != null) {
                useCase2.bindToCamera(this.mCameraInternal, (CameraInternal) Objects.requireNonNull(this.mSecondaryCameraInternal), configPair.mExtendedConfig, configPair.mCameraConfig);
                useCase2.updateSuggestedStreamSpec((StreamSpec) Preconditions.checkNotNull(info.getPrimaryStreamSpecResult().getStreamSpecs().get(useCase2)), ((StreamSpecQueryResult) Preconditions.checkNotNull(info.getSecondaryStreamSpecResult())).getStreamSpecs().get(useCase2));
            } else {
                useCase2.bindToCamera(this.mCameraInternal, null, configPair.mExtendedConfig, configPair.mCameraConfig);
                useCase2.updateSuggestedStreamSpec((StreamSpec) Preconditions.checkNotNull(info.getPrimaryStreamSpecResult().getStreamSpecs().get(useCase2)), null);
            }
        }
        if (this.mAttached) {
            this.mCameraInternal.attachUseCases(info.getCameraUseCasesToAttach());
            if (this.mSecondaryCameraInternal != null) {
                ((AdapterCameraInternal) Objects.requireNonNull(this.mSecondaryCameraInternal)).attachUseCases(info.getCameraUseCasesToAttach());
            }
        }
        Iterator<UseCase> it3 = info.getCameraUseCasesToAttach().iterator();
        while (it3.hasNext()) {
            it3.next().notifyState();
        }
        this.mAppUseCases.clear();
        this.mAppUseCases.addAll(info.getAppUseCases());
        this.mCameraUseCases.clear();
        this.mCameraUseCases.addAll(info.getCameraUseCases());
        this.mPlaceholderForExtensions = info.getPlaceholderForExtensions();
        this.mStreamSharing = info.getStreamSharing();
    }

    private void applyCameraConfig() {
        this.mCameraInternal.setExtendedConfig(this.mCameraConfig);
        if (this.mSecondaryCameraInternal != null) {
            this.mSecondaryCameraInternal.setExtendedConfig(this.mCameraConfig);
        }
    }

    private static Map<UseCase, Set<GroupableFeature>> applyFeatureGroup(Collection<UseCase> useCases, ResolvedFeatureGroup featureGroup) {
        Map<UseCase, Set<GroupableFeature>> previousFeatureComboMap = new HashMap<>();
        for (UseCase useCase : useCases) {
            previousFeatureComboMap.put(useCase, useCase.getFeatureGroup());
            useCase.setFeatureGroup(featureGroup != null ? featureGroup.getFeatures() : null);
        }
        return previousFeatureComboMap;
    }

    private static void restoreFeatureGroup(Map<UseCase, Set<GroupableFeature>> previousFeatureComboMap) {
        for (Map.Entry<UseCase, Set<GroupableFeature>> entry : previousFeatureComboMap.entrySet()) {
            entry.getKey().setFeatureGroup(entry.getValue());
        }
    }

    private static void clearFeatureGroup(Collection<UseCase> useCases) {
        for (UseCase useCase : useCases) {
            useCase.setFeatureGroup(null);
        }
    }

    @SafeVarargs
    private static boolean isFeatureComboInvocation(List<UseCase>... useCaseLists) {
        boolean isFeatureComboInvocation = false;
        for (List<UseCase> useCases : useCaseLists) {
            Iterator<UseCase> it = useCases.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                UseCase useCase = it.next();
                if (useCase.getFeatureGroup() != null) {
                    isFeatureComboInvocation = true;
                    break;
                }
            }
            if (isFeatureComboInvocation) {
                break;
            }
        }
        return isFeatureComboInvocation;
    }

    private boolean isStreamSharingAllowed() {
        return (hasExtension() || this.mSecondaryCameraInternal != null || this.mSessionType == 1) ? false : true;
    }

    private boolean shouldForceEnableStreamSharing(Collection<UseCase> appUseCases) {
        if (hasExtension() && hasVideoCapture(appUseCases)) {
            return true;
        }
        return this.mStreamSharingForceEnabler.shouldForceEnableStreamSharing(this.mCameraInternal.getCameraInfoInternal().getCameraId(), appUseCases);
    }

    private static boolean hasImplementationOptionChanged(StreamSpec streamSpec, SessionConfig sessionConfig) {
        Config newStreamSpecOptions = streamSpec.getImplementationOptions();
        Config sessionConfigOptions = sessionConfig.getImplementationOptions();
        if (((Config) Objects.requireNonNull(newStreamSpecOptions)).listOptions().size() != sessionConfig.getImplementationOptions().listOptions().size()) {
            return true;
        }
        for (Config.Option<?> newOption : newStreamSpecOptions.listOptions()) {
            if (!sessionConfigOptions.containsOption(newOption) || !Objects.equals(sessionConfigOptions.retrieveOption(newOption), newStreamSpecOptions.retrieveOption(newOption))) {
                return true;
            }
        }
        return false;
    }

    private int getCameraMode() {
        synchronized (this.mLock) {
            return this.mCameraCoordinator.getCameraOperatingMode() == 2 ? 1 : 0;
        }
    }

    private boolean hasExtension() {
        boolean z;
        synchronized (this.mLock) {
            z = this.mCameraConfig.getSessionProcessor(null) != null;
        }
        return z;
    }

    private Set<UseCase> getStreamSharingChildren(Collection<UseCase> appUseCases, boolean forceSharingToPreviewAndVideo) {
        Set<UseCase> children = new HashSet<>();
        int sharingTargets = getSharingTargets(forceSharingToPreviewAndVideo);
        for (UseCase useCase : appUseCases) {
            Preconditions.checkArgument(!StreamSharing.isStreamSharing(useCase), "Only support one level of sharing for now.");
            if (useCase.isEffectTargetsSupported(sharingTargets)) {
                children.add(useCase);
            }
        }
        return children;
    }

    private int getSharingTargets(boolean z) {
        int i;
        synchronized (this.mLock) {
            CameraEffect cameraEffect = null;
            Iterator<CameraEffect> it = this.mEffects.iterator();
            while (true) {
                i = 0;
                if (!it.hasNext()) {
                    break;
                }
                CameraEffect next = it.next();
                if (TargetUtils.getNumberOfTargets(next.getTargets()) > 1) {
                    Preconditions.checkState(cameraEffect == null, "Can only have one sharing effect.");
                    cameraEffect = next;
                }
            }
            if (cameraEffect != null) {
                i = cameraEffect.getTargets();
            }
            if (z) {
                i |= 3;
            }
        }
        return i;
    }

    private StreamSharing createOrReuseStreamSharing(Collection<UseCase> appUseCases, boolean forceSharingToPreviewAndVideo) {
        synchronized (this.mLock) {
            Set<UseCase> newChildren = getStreamSharingChildren(appUseCases, forceSharingToPreviewAndVideo);
            if (newChildren.size() < 2 && (!hasExtension() || !hasVideoCapture(newChildren))) {
                return null;
            }
            if (this.mStreamSharing != null && this.mStreamSharing.getChildren().equals(newChildren)) {
                this.mStreamSharing.updateFeatureGroup(newChildren);
                return (StreamSharing) Objects.requireNonNull(this.mStreamSharing);
            }
            if (!isStreamSharingChildrenCombinationValid(newChildren)) {
                return null;
            }
            return new StreamSharing(this.mCameraInternal, this.mSecondaryCameraInternal, this.mCompositionSettings, this.mSecondaryCompositionSettings, newChildren, this.mUseCaseConfigFactory);
        }
    }

    static boolean isStreamSharingChildrenCombinationValid(Collection<UseCase> children) {
        int[] validChildrenTypes = {1, 2, 4};
        Set<Integer> childrenTypes = new HashSet<>();
        for (UseCase child : children) {
            for (int type : validChildrenTypes) {
                if (child.isEffectTargetsSupported(type)) {
                    if (childrenTypes.contains(Integer.valueOf(type))) {
                        return false;
                    }
                    childrenTypes.add(Integer.valueOf(type));
                }
            }
        }
        return true;
    }

    static Collection<UseCase> calculateCameraUseCases(Collection<UseCase> appUseCases, UseCase placeholderForExtensions, StreamSharing streamSharing) {
        List<UseCase> useCases = new ArrayList<>(appUseCases);
        if (placeholderForExtensions != null) {
            useCases.add(placeholderForExtensions);
        }
        if (streamSharing != null) {
            useCases.add(streamSharing);
            useCases.removeAll(streamSharing.getChildren());
        }
        return useCases;
    }

    public List<UseCase> getUseCases() {
        ArrayList arrayList;
        synchronized (this.mLock) {
            arrayList = new ArrayList(this.mAppUseCases);
        }
        return arrayList;
    }

    public Collection<UseCase> getCameraUseCases() {
        ArrayList arrayList;
        synchronized (this.mLock) {
            arrayList = new ArrayList(this.mCameraUseCases);
        }
        return arrayList;
    }

    public void attachUseCases() {
        synchronized (this.mLock) {
            if (!this.mAttached) {
                if (!this.mCameraUseCases.isEmpty()) {
                    this.mCameraInternal.setExtendedConfig(this.mCameraConfig);
                    if (this.mSecondaryCameraInternal != null) {
                        this.mSecondaryCameraInternal.setExtendedConfig(this.mCameraConfig);
                    }
                }
                this.mCameraInternal.attachUseCases(this.mCameraUseCases);
                if (this.mSecondaryCameraInternal != null) {
                    this.mSecondaryCameraInternal.attachUseCases(this.mCameraUseCases);
                }
                restoreInteropConfig();
                for (UseCase useCase : this.mCameraUseCases) {
                    useCase.notifyState();
                }
                this.mAttached = true;
            }
        }
    }

    public void setActiveResumingMode(boolean enabled) {
        this.mCameraInternal.setActiveResumingMode(enabled);
    }

    public void detachUseCases() {
        synchronized (this.mLock) {
            if (this.mAttached) {
                this.mCameraInternal.detachUseCases(new ArrayList(this.mCameraUseCases));
                if (this.mSecondaryCameraInternal != null) {
                    this.mSecondaryCameraInternal.detachUseCases(new ArrayList(this.mCameraUseCases));
                }
                cacheInteropConfig();
                this.mAttached = false;
            }
        }
    }

    private void restoreInteropConfig() {
        synchronized (this.mLock) {
            if (this.mInteropConfig != null) {
                this.mCameraInternal.getCameraControlInternal().addInteropConfig(this.mInteropConfig);
            }
        }
    }

    private void cacheInteropConfig() {
        synchronized (this.mLock) {
            CameraControlInternal cameraControlInternal = this.mCameraInternal.getCameraControlInternal();
            this.mInteropConfig = cameraControlInternal.getInteropConfig();
            cameraControlInternal.clearInteropConfig();
        }
    }

    static void updateEffects(List<CameraEffect> effects, Collection<UseCase> cameraUseCases, Collection<UseCase> appUseCases) {
        List<CameraEffect> unusedEffects = setEffectsOnUseCases(effects, cameraUseCases);
        List<UseCase> appOnlyUseCases = new ArrayList<>(appUseCases);
        appOnlyUseCases.removeAll(cameraUseCases);
        List<CameraEffect> unusedEffects2 = setEffectsOnUseCases(unusedEffects, appOnlyUseCases);
        if (!unusedEffects2.isEmpty()) {
            Logger.w(TAG, "Unused effects: " + unusedEffects2);
        }
    }

    private static List<CameraEffect> setEffectsOnUseCases(List<CameraEffect> effects, Collection<UseCase> useCases) {
        List<CameraEffect> unusedEffects = new ArrayList<>(effects);
        for (UseCase useCase : useCases) {
            useCase.setEffect(null);
            for (CameraEffect effect : effects) {
                if (useCase.isEffectTargetsSupported(effect.getTargets())) {
                    Preconditions.checkState(useCase.getEffect() == null, useCase + " already has effect" + useCase.getEffect());
                    useCase.setEffect(effect);
                    unusedEffects.remove(effect);
                }
            }
        }
        return unusedEffects;
    }

    private void updateViewPortAndSensorToBufferMatrix(Map<UseCase, StreamSpec> suggestedStreamSpecMap, Collection<UseCase> useCases) {
        Throwable th;
        Map<UseCase, StreamSpec> suggestedStreamSpecMap2;
        synchronized (this.mLock) {
            try {
                try {
                    if (this.mViewPort == null || useCases.isEmpty()) {
                        suggestedStreamSpecMap2 = suggestedStreamSpecMap;
                    } else {
                        int lensFacing = this.mCameraInternal.getCameraInfoInternal().getLensFacing();
                        boolean isFrontCamera = lensFacing == 0;
                        suggestedStreamSpecMap2 = suggestedStreamSpecMap;
                        Map<UseCase, Rect> cropRectMap = ViewPorts.calculateViewPortRects(this.mCameraInternal.getCameraInfoInternal().getSensorRect(), isFrontCamera, this.mViewPort.getAspectRatio(), this.mCameraInternal.getCameraInfoInternal().getSensorRotationDegrees(this.mViewPort.getRotation()), this.mViewPort.getScaleType(), this.mViewPort.getLayoutDirection(), suggestedStreamSpecMap2);
                        for (UseCase useCase : useCases) {
                            useCase.setViewPortCropRect((Rect) Preconditions.checkNotNull(cropRectMap.get(useCase)));
                        }
                    }
                    for (UseCase useCase2 : useCases) {
                        useCase2.setSensorToBufferTransformMatrix(calculateSensorToBufferTransformMatrix(this.mCameraInternal.getCameraInfoInternal().getSensorRect(), ((StreamSpec) Preconditions.checkNotNull(suggestedStreamSpecMap2.get(useCase2))).getResolution()));
                    }
                } catch (Throwable th2) {
                    th = th2;
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
            }
        }
    }

    private static Matrix calculateSensorToBufferTransformMatrix(Rect fullSensorRect, Size useCaseSize) {
        Preconditions.checkArgument(fullSensorRect.width() > 0 && fullSensorRect.height() > 0, "Cannot compute viewport crop rects zero sized sensor rect.");
        RectF fullSensorRectF = new RectF(fullSensorRect);
        Matrix sensorToUseCaseTransformation = new Matrix();
        RectF srcRect = new RectF(0.0f, 0.0f, useCaseSize.getWidth(), useCaseSize.getHeight());
        sensorToUseCaseTransformation.setRectToRect(srcRect, fullSensorRectF, Matrix.ScaleToFit.CENTER);
        sensorToUseCaseTransformation.invert(sensorToUseCaseTransformation);
        return sensorToUseCaseTransformation;
    }

    public static class ConfigPair {
        UseCaseConfig<?> mCameraConfig;
        UseCaseConfig<?> mExtendedConfig;

        ConfigPair(UseCaseConfig<?> extendedConfig, UseCaseConfig<?> cameraConfig) {
            this.mExtendedConfig = extendedConfig;
            this.mCameraConfig = cameraConfig;
        }
    }

    static Map<UseCase, ConfigPair> getConfigs(Collection<UseCase> useCases, UseCaseConfigFactory extendedFactory, UseCaseConfigFactory cameraFactory, int sessionType, Range<Integer> targetFrameRate) {
        UseCaseConfig<?> extendedConfig;
        Map<UseCase, ConfigPair> configs = new HashMap<>();
        for (UseCase useCase : useCases) {
            if (StreamSharing.isStreamSharing(useCase)) {
                extendedConfig = generateExtendedStreamSharingConfigFromPreview(extendedFactory, (StreamSharing) useCase);
            } else {
                extendedConfig = useCase.getDefaultConfig(false, extendedFactory);
            }
            UseCaseConfig<?> cameraConfig = useCase.getDefaultConfig(true, cameraFactory);
            configs.put(useCase, new ConfigPair(extendedConfig, attachUseCaseSharedConfigs(useCase, cameraConfig, sessionType, targetFrameRate)));
        }
        return configs;
    }

    /* JADX WARN: falha na inferência de tipo para: r1v4, types: [androidx.camera.core.impl.UseCaseConfig, androidx.camera.core.impl.UseCaseConfig<?>] */
    private static UseCaseConfig<?> attachUseCaseSharedConfigs(UseCase useCase, UseCaseConfig<?> useCaseConfig, int sessionType, Range<Integer> targetFrameRate) {
        MutableOptionsBundle mutableConfig = useCaseConfig != null ? MutableOptionsBundle.from((Config) useCaseConfig) : MutableOptionsBundle.create();
        mutableConfig.insertOption(UseCaseConfig.OPTION_SESSION_TYPE, Integer.valueOf(sessionType));
        if (!StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED.equals(targetFrameRate)) {
            mutableConfig.insertOption(UseCaseConfig.OPTION_TARGET_FRAME_RATE, Config.OptionPriority.HIGH_PRIORITY_REQUIRED, targetFrameRate);
            mutableConfig.insertOption(UseCaseConfig.OPTION_IS_STRICT_FRAME_RATE_REQUIRED, true);
        }
        return useCase.getUseCaseConfigBuilder(mutableConfig).getUseCaseConfig();
    }

    /* JADX WARN: falha na inferência de tipo para: r3v2, types: [androidx.camera.core.impl.UseCaseConfig, androidx.camera.core.impl.UseCaseConfig<?>] */
    private static UseCaseConfig<?> generateExtendedStreamSharingConfigFromPreview(UseCaseConfigFactory extendedFactory, StreamSharing streamSharing) {
        Preview preview = new Preview.Builder().build();
        Config previewConfig = preview.getDefaultConfig(false, extendedFactory);
        if (previewConfig == null) {
            return null;
        }
        MutableOptionsBundle mutableConfig = MutableOptionsBundle.from(previewConfig);
        mutableConfig.removeOption(TargetConfig.OPTION_TARGET_CLASS);
        return streamSharing.getUseCaseConfigBuilder(mutableConfig).getUseCaseConfig();
    }

    private void checkUnsupportedFeatureCombinationAndThrow(Collection<UseCase> useCases) throws IllegalArgumentException {
        if (hasExtension()) {
            if (hasNonSdrConfig(useCases)) {
                throw new IllegalArgumentException("Extensions are only supported for use with standard dynamic range.");
            }
            if (hasRawImageCapture(useCases)) {
                throw new IllegalArgumentException("Extensions are not supported for use with Raw image capture.");
            }
        }
        synchronized (this.mLock) {
            if (!this.mEffects.isEmpty() && (hasUltraHdrImageCapture(useCases) || hasRawImageCapture(useCases))) {
                throw new IllegalArgumentException("Ultra HDR image and Raw capture does not support for use with CameraEffect.");
            }
        }
    }

    private static boolean hasNonSdrConfig(Collection<UseCase> useCases) {
        for (UseCase useCase : useCases) {
            DynamicRange dynamicRange = useCase.getCurrentConfig().getDynamicRange();
            if (isNotSdr(dynamicRange)) {
                return true;
            }
        }
        return false;
    }

    private static boolean isNotSdr(DynamicRange dynamicRange) {
        boolean is10Bit = dynamicRange.getBitDepth() == 10;
        boolean isHdr = (dynamicRange.getEncoding() == 1 || dynamicRange.getEncoding() == 0) ? false : true;
        return is10Bit || isHdr;
    }

    private static boolean hasUltraHdrImageCapture(Collection<UseCase> useCases) {
        for (UseCase useCase : useCases) {
            if (isImageCapture(useCase)) {
                UseCaseConfig<?> config = useCase.getCurrentConfig();
                if (config.containsOption(ImageCaptureConfig.OPTION_OUTPUT_FORMAT) && ((Integer) Preconditions.checkNotNull((Integer) config.retrieveOption(ImageCaptureConfig.OPTION_OUTPUT_FORMAT))).intValue() == 1) {
                    return true;
                }
            }
        }
        return false;
    }

    private static boolean hasRawImageCapture(Collection<UseCase> useCases) {
        for (UseCase useCase : useCases) {
            if (isImageCapture(useCase)) {
                UseCaseConfig<?> config = useCase.getCurrentConfig();
                if (config.containsOption(ImageCaptureConfig.OPTION_OUTPUT_FORMAT) && ((Integer) Preconditions.checkNotNull((Integer) config.retrieveOption(ImageCaptureConfig.OPTION_OUTPUT_FORMAT))).intValue() == 2) {
                    return true;
                }
            }
        }
        return false;
    }

    public static final class CameraException extends Exception {
        public CameraException() {
        }

        public CameraException(String message) {
            super(message);
        }

        public CameraException(Throwable cause) {
            super(cause);
        }
    }

    @Override // androidx.camera.core.Camera
    public CameraControl getCameraControl() {
        return this.mCameraInternal.getCameraControl();
    }

    @Override // androidx.camera.core.Camera
    public CameraInfo getCameraInfo() {
        return this.mCameraInternal.getCameraInfo();
    }

    public CameraInfo getSecondaryCameraInfo() {
        if (this.mSecondaryCameraInternal != null) {
            return this.mSecondaryCameraInternal.getCameraInfo();
        }
        return null;
    }

    @Override // androidx.camera.core.Camera
    public CameraConfig getExtendedConfig() {
        CameraConfig cameraConfig;
        synchronized (this.mLock) {
            cameraConfig = this.mCameraConfig;
        }
        return cameraConfig;
    }

    @Override // androidx.camera.core.Camera
    public boolean isUseCasesCombinationSupported(boolean withStreamSharing, UseCase... useCases) {
        Collection<UseCase> useCasesToVerify = Arrays.asList(useCases);
        if (withStreamSharing) {
            try {
                StreamSharing streamSharing = createOrReuseStreamSharing(useCasesToVerify, true);
                useCasesToVerify = calculateCameraUseCases(useCasesToVerify, null, streamSharing);
            } catch (IllegalArgumentException e) {
                Logger.d(TAG, "Unable to apply StreamSharing", e);
                return false;
            }
        }
        return this.mCameraInternal.getCameraInfoInternal().isUseCaseCombinationSupported(new ArrayList(useCasesToVerify), getCameraMode(), false, this.mCameraConfig);
    }

    private UseCase calculatePlaceholderForExtensions(Collection<UseCase> appUseCases, StreamSharing streamSharing) {
        UseCase placeholder;
        synchronized (this.mLock) {
            List<UseCase> useCasesToCheck = new ArrayList<>(appUseCases);
            if (streamSharing != null) {
                useCasesToCheck.add(streamSharing);
                useCasesToCheck.removeAll(streamSharing.getChildren());
            }
            placeholder = null;
            if (isCoexistingPreviewImageCaptureRequired()) {
                if (isExtraPreviewRequired(useCasesToCheck)) {
                    placeholder = isPreview(this.mPlaceholderForExtensions) ? this.mPlaceholderForExtensions : createExtraPreview();
                } else if (isExtraImageCaptureRequired(useCasesToCheck)) {
                    placeholder = isImageCapture(this.mPlaceholderForExtensions) ? this.mPlaceholderForExtensions : createExtraImageCapture();
                }
            }
        }
        return placeholder;
    }

    private boolean isCoexistingPreviewImageCaptureRequired() {
        boolean z;
        synchronized (this.mLock) {
            z = true;
            if (this.mCameraConfig.getUseCaseCombinationRequiredRule() != 1) {
                z = false;
            }
        }
        return z;
    }

    private static boolean isExtraPreviewRequired(Collection<UseCase> useCases) {
        boolean hasPreviewOrStreamSharing = false;
        boolean hasImageCapture = false;
        for (UseCase useCase : useCases) {
            if (isPreview(useCase) || StreamSharing.isStreamSharing(useCase)) {
                hasPreviewOrStreamSharing = true;
            } else if (isImageCapture(useCase)) {
                hasImageCapture = true;
            }
        }
        return hasImageCapture && !hasPreviewOrStreamSharing;
    }

    private static boolean isExtraImageCaptureRequired(Collection<UseCase> useCases) {
        boolean hasPreviewOrStreamSharing = false;
        boolean hasImageCapture = false;
        for (UseCase useCase : useCases) {
            if (isPreview(useCase) || StreamSharing.isStreamSharing(useCase)) {
                hasPreviewOrStreamSharing = true;
            } else if (isImageCapture(useCase)) {
                hasImageCapture = true;
            }
        }
        return hasPreviewOrStreamSharing && !hasImageCapture;
    }

    static boolean hasVideoCapture(Collection<UseCase> useCases) {
        for (UseCase useCase : useCases) {
            if (isVideoCapture(useCase)) {
                return true;
            }
        }
        return false;
    }

    public static boolean isVideoCapture(UseCase useCase) {
        if (useCase != null) {
            if (useCase.getCurrentConfig().containsOption(UseCaseConfig.OPTION_CAPTURE_TYPE)) {
                return useCase.getCurrentConfig().getCaptureType() == UseCaseConfigFactory.CaptureType.VIDEO_CAPTURE;
            }
            Log.e(TAG, useCase + " UseCase does not have capture type.");
        }
        return false;
    }

    private static boolean isPreview(UseCase useCase) {
        return useCase instanceof Preview;
    }

    private static boolean isImageCapture(UseCase useCase) {
        return useCase instanceof ImageCapture;
    }

    private Preview createExtraPreview() {
        Preview preview = new Preview.Builder().setTargetName("Preview-Extra").build();
        preview.setSurfaceProvider(new Preview.SurfaceProvider() { // da classe: androidx.camera.core.internal.CameraUseCaseAdapter$$ExternalSyntheticLambda1
            @Override // androidx.camera.core.Preview.SurfaceProvider
            public final void onSurfaceRequested(SurfaceRequest surfaceRequest) {
                CameraUseCaseAdapter.lambda$createExtraPreview$1(surfaceRequest);
            }
        });
        return preview;
    }

    static /* sintético */ void lambda$createExtraPreview$1(SurfaceRequest surfaceRequest) {
        final SurfaceTexture surfaceTexture = new SurfaceTexture(0);
        surfaceTexture.setDefaultBufferSize(surfaceRequest.getResolution().getWidth(), surfaceRequest.getResolution().getHeight());
        surfaceTexture.detachFromGLContext();
        final Surface surface = new Surface(surfaceTexture);
        surfaceRequest.provideSurface(surface, CameraXExecutors.directExecutor(), new Consumer() { // da classe: androidx.camera.core.internal.CameraUseCaseAdapter$$ExternalSyntheticLambda0
            @Override // androidx.core.util.Consumer
            public final void accept(Object obj) {
                CameraUseCaseAdapter.lambda$createExtraPreview$0(surface, surfaceTexture, (SurfaceRequest.Result) obj);
            }
        });
    }

    static /* sintético */ void lambda$createExtraPreview$0(Surface surface, SurfaceTexture surfaceTexture, SurfaceRequest.Result surfaceResponse) {
        surface.release();
        surfaceTexture.release();
    }

    private ImageCapture createExtraImageCapture() {
        return new ImageCapture.Builder().setTargetName("ImageCapture-Extra").build();
    }
}
