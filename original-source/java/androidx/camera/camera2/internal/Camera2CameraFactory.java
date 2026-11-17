package androidx.camera.camera2.internal;

import android.content.Context;
import android.util.Log;
import androidx.camera.camera2.internal.compat.CameraAccessExceptionCompat;
import androidx.camera.camera2.internal.compat.CameraManagerCompat;
import androidx.camera.camera2.internal.concurrent.Camera2CameraCoordinator;
import androidx.camera.core.CameraIdentifier;
import androidx.camera.core.CameraSelector;
import androidx.camera.core.CameraUnavailableException;
import androidx.camera.core.CameraXConfig;
import androidx.camera.core.InitializationException;
import androidx.camera.core.Logger;
import androidx.camera.core.concurrent.CameraCoordinator;
import androidx.camera.core.impl.CameraFactory;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.CameraStateRegistry;
import androidx.camera.core.impl.CameraThreadConfig;
import androidx.camera.core.impl.Observable;
import androidx.camera.core.internal.StreamSpecsCalculator;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* loaded from: classes.dex */
public final class Camera2CameraFactory implements CameraFactory {
    private static final int DEFAULT_ALLOWED_CONCURRENT_OPEN_CAMERAS = 1;
    private static final String TAG = "Camera2CameraFactory";
    private List<String> mAvailableCameraIds;
    private final CameraSelector mAvailableCamerasSelector;
    private final CameraCoordinator mCameraCoordinator;
    private final Map<String, Camera2CameraInfoImpl> mCameraInfos;
    private final CameraManagerCompat mCameraManager;
    private final long mCameraOpenRetryMaxTimeoutInMs;
    private final Camera2PresenceSource mCameraPresenceObservable;
    private final CameraStateRegistry mCameraStateRegistry;
    private final CameraXConfig mCameraXConfig;
    private final Context mContext;
    private final DisplayInfoManager mDisplayInfoManager;
    private final Object mLock;
    private final StreamSpecsCalculator mStreamSpecsCalculator;
    private final CameraThreadConfig mThreadConfig;

    public Camera2CameraFactory(Context context, CameraThreadConfig threadConfig, CameraSelector availableCamerasSelector, long cameraOpenRetryMaxTimeoutInMs) throws InitializationException {
        this(context, threadConfig, availableCamerasSelector, cameraOpenRetryMaxTimeoutInMs, null, StreamSpecsCalculator.NO_OP_STREAM_SPECS_CALCULATOR);
    }

    public Camera2CameraFactory(Context context, CameraThreadConfig threadConfig, CameraSelector availableCamerasSelector, long cameraOpenRetryMaxTimeoutInMs, CameraXConfig cameraXConfig, StreamSpecsCalculator streamSpecsCalculator) throws InitializationException {
        this.mCameraInfos = new HashMap();
        this.mLock = new Object();
        this.mAvailableCameraIds = new ArrayList();
        this.mContext = context;
        this.mThreadConfig = threadConfig;
        this.mCameraManager = CameraManagerCompat.from(context, this.mThreadConfig.getSchedulerHandler());
        this.mDisplayInfoManager = DisplayInfoManager.getInstance(context);
        this.mCameraCoordinator = new Camera2CameraCoordinator(this.mCameraManager);
        this.mCameraStateRegistry = new CameraStateRegistry(this.mCameraCoordinator, 1);
        this.mCameraCoordinator.addListener(this.mCameraStateRegistry);
        this.mCameraOpenRetryMaxTimeoutInMs = cameraOpenRetryMaxTimeoutInMs;
        this.mStreamSpecsCalculator = streamSpecsCalculator;
        this.mCameraXConfig = cameraXConfig;
        this.mAvailableCamerasSelector = availableCamerasSelector;
        try {
            List<String> cameraIds = Arrays.asList(this.mCameraManager.getCameraIdList());
            this.mCameraPresenceObservable = new Camera2PresenceSource(cameraIds, this.mCameraManager, this.mThreadConfig.getCameraExecutor());
            onCameraIdsUpdated(cameraIds);
        } catch (CameraAccessExceptionCompat e) {
            throw new InitializationException(CameraUnavailableExceptionHelper.createFrom(e));
        }
    }

    @Override // androidx.camera.core.impl.CameraPresenceMonitor
    public void onCameraIdsUpdated(List<String> cameraIds) throws InitializationException {
        try {
            List<String> rawIdList = new ArrayList<>(cameraIds);
            List<String> optimizedIds = CameraSelectionOptimizer.getSelectedAvailableCameraIds(this, this.mAvailableCamerasSelector, rawIdList);
            List<String> filteredIds = getBackwardCompatibleCameraIds(optimizedIds);
            synchronized (this.mLock) {
                if (this.mAvailableCameraIds.equals(filteredIds)) {
                    return;
                }
                Logger.d(TAG, "Updated available camera list: " + this.mAvailableCameraIds + " -> " + filteredIds);
                this.mAvailableCameraIds = filteredIds;
            }
        } catch (InitializationException e) {
            Log.e(TAG, "Unable to get backward compatible camera ids", e);
            throw e;
        }
    }

    @Override // androidx.camera.core.impl.CameraFactory
    public CameraInternal getCamera(String cameraId) throws CameraUnavailableException {
        synchronized (this.mLock) {
            if (!this.mAvailableCameraIds.contains(cameraId)) {
                throw new IllegalArgumentException("The given camera id is not on the available camera id list.");
            }
        }
        return new Camera2CameraImpl(this.mContext, this.mCameraManager, cameraId, getCameraInfo(cameraId), this.mCameraCoordinator, this.mCameraStateRegistry, this.mThreadConfig.getCameraExecutor(), this.mThreadConfig.getSchedulerHandler(), this.mDisplayInfoManager, this.mCameraOpenRetryMaxTimeoutInMs, this.mCameraXConfig);
    }

    Camera2CameraInfoImpl getCameraInfo(String cameraId) throws CameraUnavailableException {
        try {
            Camera2CameraInfoImpl camera2CameraInfoImpl = this.mCameraInfos.get(cameraId);
            if (camera2CameraInfoImpl == null) {
                Camera2CameraInfoImpl camera2CameraInfoImpl2 = new Camera2CameraInfoImpl(cameraId, this.mCameraManager, this.mStreamSpecsCalculator);
                this.mCameraInfos.put(cameraId, camera2CameraInfoImpl2);
                return camera2CameraInfoImpl2;
            }
            return camera2CameraInfoImpl;
        } catch (CameraAccessExceptionCompat e) {
            throw CameraUnavailableExceptionHelper.createFrom(e);
        }
    }

    @Override // androidx.camera.core.impl.CameraFactory
    public Set<String> getAvailableCameraIds() {
        LinkedHashSet linkedHashSet;
        synchronized (this.mLock) {
            linkedHashSet = new LinkedHashSet(this.mAvailableCameraIds);
        }
        return linkedHashSet;
    }

    @Override // androidx.camera.core.impl.CameraFactory
    public CameraCoordinator getCameraCoordinator() {
        return this.mCameraCoordinator;
    }

    @Override // androidx.camera.core.impl.CameraFactory
    public CameraManagerCompat getCameraManager() {
        return this.mCameraManager;
    }

    @Override // androidx.camera.core.impl.CameraFactory
    public Observable<List<CameraIdentifier>> getCameraPresenceSource() {
        return this.mCameraPresenceObservable;
    }

    @Override // androidx.camera.core.impl.CameraFactory
    public void shutdown() {
        this.mCameraCoordinator.shutdown();
        this.mCameraPresenceObservable.stopMonitoring();
    }

    private List<String> getBackwardCompatibleCameraIds(List<String> availableCameraIds) throws InitializationException {
        List<String> backwardCompatibleCameraIds = new ArrayList<>();
        for (String cameraId : availableCameraIds) {
            if (cameraId.equals("0") || cameraId.equals("1")) {
                backwardCompatibleCameraIds.add(cameraId);
            } else if (CameraIdUtil.isBackwardCompatible(this.mCameraManager, cameraId)) {
                backwardCompatibleCameraIds.add(cameraId);
            } else {
                Logger.d(TAG, "Camera " + cameraId + " is filtered out because its capabilities do not contain REQUEST_AVAILABLE_CAPABILITIES_BACKWARD_COMPATIBLE.");
            }
        }
        return backwardCompatibleCameraIds;
    }
}
