package androidx.camera.camera2.internal;

import android.content.Context;
import android.media.CamcorderProfile;
import android.os.Build;
import android.util.Size;
import androidx.camera.camera2.impl.FeatureCombinationQueryImpl;
import androidx.camera.camera2.internal.compat.CameraManagerCompat;
import androidx.camera.core.CameraUnavailableException;
import androidx.camera.core.featuregroup.impl.FeatureCombinationQuery;
import androidx.camera.core.impl.AttachedSurfaceInfo;
import androidx.camera.core.impl.CameraDeviceSurfaceManager;
import androidx.camera.core.impl.CameraUpdateException;
import androidx.camera.core.impl.StreamUseCase;
import androidx.camera.core.impl.SurfaceConfig;
import androidx.camera.core.impl.SurfaceStreamSpecQueryResult;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.core.util.Preconditions;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* carregado de: classes.dex */
public final class Camera2DeviceSurfaceManager implements CameraDeviceSurfaceManager {
    private static final String TAG = "Camera2DeviceSurfaceManager";
    private final CamcorderProfileHelper mCamcorderProfileHelper;
    private final CameraManagerCompat mCameraManager;
    private final Map<String, SupportedSurfaceCombination> mCameraSupportedSurfaceCombinationMap;
    private final Context mContext;
    private final Object mLock;

    public Camera2DeviceSurfaceManager(Context context, Object cameraManager, Set<String> availableCameraIds) throws CameraUnavailableException {
        this(context, new CamcorderProfileHelper() { // da classe: androidx.camera.camera2.internal.Camera2DeviceSurfaceManager.1
            @Override // androidx.camera.camera2.internal.CamcorderProfileHelper
            public boolean hasProfile(int cameraId, int quality) {
                return CamcorderProfile.hasProfile(cameraId, quality);
            }

            @Override // androidx.camera.camera2.internal.CamcorderProfileHelper
            public CamcorderProfile get(int cameraId, int quality) {
                return CamcorderProfile.get(cameraId, quality);
            }
        }, cameraManager, availableCameraIds);
    }

    Camera2DeviceSurfaceManager(Context context, CamcorderProfileHelper camcorderProfileHelper, Object cameraManager, Set<String> availableCameraIds) throws CameraUnavailableException {
        this.mLock = new Object();
        this.mCameraSupportedSurfaceCombinationMap = new HashMap();
        Preconditions.checkNotNull(camcorderProfileHelper);
        this.mCamcorderProfileHelper = camcorderProfileHelper;
        this.mContext = context;
        if (cameraManager instanceof CameraManagerCompat) {
            this.mCameraManager = (CameraManagerCompat) cameraManager;
        } else {
            this.mCameraManager = CameraManagerCompat.from(context);
        }
        try {
            onCamerasUpdated(new ArrayList(availableCameraIds));
        } catch (CameraUpdateException e) {
            if (e.getCause() instanceof CameraUnavailableException) {
                throw ((CameraUnavailableException) e.getCause());
            }
            throw new CameraUnavailableException(3, e);
        }
    }

    @Override // androidx.camera.core.impl.InternalCameraPresenceListener
    public void onCamerasUpdated(List<String> newCameraIds) throws CameraUpdateException {
        Set<String> combinationsToCreate;
        Map<String, SupportedSurfaceCombination> newCombinations = new HashMap<>();
        synchronized (this.mLock) {
            combinationsToCreate = new HashSet<>(newCameraIds);
            combinationsToCreate.removeAll(this.mCameraSupportedSurfaceCombinationMap.keySet());
        }
        try {
            for (String cameraId : combinationsToCreate) {
                newCombinations.put(cameraId, createSurfaceCombination(cameraId));
            }
            synchronized (this.mLock) {
                Map<String, SupportedSurfaceCombination> finalCombinations = new HashMap<>();
                for (String cameraId2 : newCameraIds) {
                    if (this.mCameraSupportedSurfaceCombinationMap.containsKey(cameraId2)) {
                        finalCombinations.put(cameraId2, this.mCameraSupportedSurfaceCombinationMap.get(cameraId2));
                    } else {
                        finalCombinations.put(cameraId2, newCombinations.get(cameraId2));
                    }
                }
                this.mCameraSupportedSurfaceCombinationMap.clear();
                this.mCameraSupportedSurfaceCombinationMap.putAll(finalCombinations);
            }
        } catch (CameraUnavailableException | RuntimeException e) {
            throw new CameraUpdateException("Failed to create SupportedSurfaceCombination", e);
        }
    }

    private SupportedSurfaceCombination createSurfaceCombination(String cameraId) throws CameraUnavailableException {
        FeatureCombinationQuery featureCombinationQuery;
        FeatureCombinationQuery featureCombinationQuery2 = FeatureCombinationQuery.NO_OP_FEATURE_COMBINATION_QUERY;
        if (Build.VERSION.SDK_INT < 35) {
            featureCombinationQuery = featureCombinationQuery2;
        } else {
            FeatureCombinationQuery featureCombinationQuery3 = new FeatureCombinationQueryImpl(this.mContext, cameraId, this.mCameraManager);
            featureCombinationQuery = featureCombinationQuery3;
        }
        return new SupportedSurfaceCombination(this.mContext, cameraId, this.mCameraManager, this.mCamcorderProfileHelper, featureCombinationQuery);
    }

    @Override // androidx.camera.core.impl.CameraDeviceSurfaceManager
    public SurfaceConfig transformSurfaceConfig(int cameraMode, String cameraId, int imageFormat, Size size, StreamUseCase streamUseCase) {
        SupportedSurfaceCombination supportedSurfaceCombination = this.mCameraSupportedSurfaceCombinationMap.get(cameraId);
        Preconditions.checkArgument(supportedSurfaceCombination != null, "No such camera id in supported combination list: " + cameraId);
        return supportedSurfaceCombination.transformSurfaceConfig(cameraMode, imageFormat, size, streamUseCase);
    }

    @Override // androidx.camera.core.impl.CameraDeviceSurfaceManager
    public SurfaceStreamSpecQueryResult getSuggestedStreamSpecs(int cameraMode, String cameraId, List<AttachedSurfaceInfo> existingSurfaces, Map<UseCaseConfig<?>, List<Size>> newUseCaseConfigsSupportedSizeMap, boolean isPreviewStabilizationOn, boolean hasVideoCapture, boolean isFeatureComboInvocation, boolean findMaxSupportedFrameRate) {
        Preconditions.checkArgument(!newUseCaseConfigsSupportedSizeMap.isEmpty(), "No new use cases to be bound.");
        SupportedSurfaceCombination supportedSurfaceCombination = this.mCameraSupportedSurfaceCombinationMap.get(cameraId);
        Preconditions.checkArgument(supportedSurfaceCombination != null, "No such camera id in supported combination list: " + cameraId);
        return supportedSurfaceCombination.getSuggestedStreamSpecifications(cameraMode, existingSurfaces, newUseCaseConfigsSupportedSizeMap, isPreviewStabilizationOn, hasVideoCapture, isFeatureComboInvocation, findMaxSupportedFrameRate);
    }
}
