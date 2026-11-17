package androidx.camera.camera2.internal.concurrent;

import android.hardware.camera2.CameraCharacteristics;
import androidx.camera.camera2.internal.CameraIdUtil;
import androidx.camera.camera2.internal.compat.CameraAccessExceptionCompat;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.camera2.internal.compat.CameraManagerCompat;
import androidx.camera.camera2.interop.Camera2CameraInfo;
import androidx.camera.core.CameraFilter;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.CameraSelector;
import androidx.camera.core.InitializationException;
import androidx.camera.core.Logger;
import androidx.camera.core.concurrent.CameraCoordinator;
import androidx.camera.core.impl.CameraRepository;
import androidx.camera.core.impl.CameraUpdateException;
import androidx.camera.core.impl.Identifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* loaded from: classes.dex */
public class Camera2CameraCoordinator implements CameraCoordinator {
    private static final String TAG = "Camera2CameraCoordinator";
    private final CameraManagerCompat mCameraManager;
    private final Object mLock = new Object();
    private Map<String, List<String>> mConcurrentCameraIdMap = new HashMap();
    private Set<Set<String>> mConcurrentCameraIds = new HashSet();
    private List<CameraInfo> mActiveConcurrentCameraInfos = new ArrayList();
    private int mCameraOperatingMode = 0;
    private final List<CameraCoordinator.ConcurrentCameraModeListener> mConcurrentCameraModeListeners = new ArrayList();

    @Override // androidx.camera.core.concurrent.CameraCoordinator
    public /* synthetic */ void init(CameraRepository cameraRepository) {
        CameraCoordinator.CC.$default$init(this, cameraRepository);
    }

    public Camera2CameraCoordinator(CameraManagerCompat cameraManager) {
        this.mCameraManager = cameraManager;
        try {
            List<String> cameraIds = Arrays.asList(cameraManager.getCameraIdList());
            onCamerasUpdated(cameraIds);
        } catch (CameraAccessExceptionCompat | CameraUpdateException e) {
            Logger.e(TAG, "Failed to get concurrent camera ids", e);
        }
    }

    @Override // androidx.camera.core.impl.InternalCameraPresenceListener
    public void onCamerasUpdated(List<String> cameraIds) throws CameraUpdateException {
        Map<String, List<String>> tempConcurrentCameraIdMap = new HashMap<>();
        Set<Set<String>> tempConcurrentCameraIds = new HashSet<>();
        try {
            Set<Set<String>> allConcurrentSets = this.mCameraManager.getConcurrentCameraIds();
            for (Set<String> concurrentSet : allConcurrentSets) {
                if (cameraIds.containsAll(concurrentSet)) {
                    List<String> cameraIdList = new ArrayList<>(concurrentSet);
                    if (cameraIdList.size() >= 2) {
                        String id1 = cameraIdList.get(0);
                        String id2 = cameraIdList.get(1);
                        try {
                            if (CameraIdUtil.isBackwardCompatible(this.mCameraManager, id1) && CameraIdUtil.isBackwardCompatible(this.mCameraManager, id2)) {
                                tempConcurrentCameraIds.add(new HashSet<>(Arrays.asList(id1, id2)));
                                if (!tempConcurrentCameraIdMap.containsKey(id1)) {
                                    tempConcurrentCameraIdMap.put(id1, new ArrayList<>());
                                }
                                tempConcurrentCameraIdMap.get(id1).add(id2);
                                if (!tempConcurrentCameraIdMap.containsKey(id2)) {
                                    tempConcurrentCameraIdMap.put(id2, new ArrayList<>());
                                }
                                tempConcurrentCameraIdMap.get(id2).add(id1);
                            }
                        } catch (InitializationException e) {
                            Logger.d(TAG, "Concurrent camera id pair: (" + id1 + ", " + id1 + ") is not backward compatible");
                        }
                    }
                }
            }
            synchronized (this.mLock) {
                this.mConcurrentCameraIdMap = tempConcurrentCameraIdMap;
                this.mConcurrentCameraIds = tempConcurrentCameraIds;
                Logger.d(TAG, "Updated concurrent camera map: " + this.mConcurrentCameraIdMap);
            }
        } catch (CameraAccessExceptionCompat e2) {
            throw new CameraUpdateException("Failed to retrieve concurrent camera id info.", e2);
        }
    }

    @Override // androidx.camera.core.concurrent.CameraCoordinator
    public List<List<CameraSelector>> getConcurrentCameraSelectors() {
        List<List<CameraSelector>> concurrentCameraSelectorLists = new ArrayList<>();
        synchronized (this.mLock) {
            for (Set<String> concurrentCameraIdList : this.mConcurrentCameraIds) {
                List<CameraSelector> cameraSelectors = new ArrayList<>();
                for (String concurrentCameraId : concurrentCameraIdList) {
                    cameraSelectors.add(createCameraSelectorById(this.mCameraManager, concurrentCameraId));
                }
                concurrentCameraSelectorLists.add(cameraSelectors);
            }
        }
        return concurrentCameraSelectorLists;
    }

    @Override // androidx.camera.core.concurrent.CameraCoordinator
    public List<CameraInfo> getActiveConcurrentCameraInfos() {
        ArrayList arrayList;
        synchronized (this.mLock) {
            arrayList = new ArrayList(this.mActiveConcurrentCameraInfos);
        }
        return arrayList;
    }

    @Override // androidx.camera.core.concurrent.CameraCoordinator
    public void setActiveConcurrentCameraInfos(List<CameraInfo> cameraInfos) {
        synchronized (this.mLock) {
            this.mActiveConcurrentCameraInfos = new ArrayList(cameraInfos);
        }
    }

    @Override // androidx.camera.core.concurrent.CameraCoordinator
    public String getPairedConcurrentCameraId(String cameraId) {
        synchronized (this.mLock) {
            if (!this.mConcurrentCameraIdMap.containsKey(cameraId)) {
                return null;
            }
            List<String> pairedIds = this.mConcurrentCameraIdMap.get(cameraId);
            if (pairedIds == null) {
                return null;
            }
            for (String pairedCameraId : pairedIds) {
                for (CameraInfo cameraInfo : this.mActiveConcurrentCameraInfos) {
                    if (pairedCameraId.equals(Camera2CameraInfo.from(cameraInfo).getCameraId())) {
                        return pairedCameraId;
                    }
                }
            }
            return null;
        }
    }

    @Override // androidx.camera.core.concurrent.CameraCoordinator
    public int getCameraOperatingMode() {
        int i;
        synchronized (this.mLock) {
            i = this.mCameraOperatingMode;
        }
        return i;
    }

    @Override // androidx.camera.core.concurrent.CameraCoordinator
    public void setCameraOperatingMode(int cameraOperatingMode) {
        synchronized (this.mLock) {
            if (cameraOperatingMode == this.mCameraOperatingMode) {
                return;
            }
            int previousMode = this.mCameraOperatingMode;
            this.mCameraOperatingMode = cameraOperatingMode;
            List<CameraCoordinator.ConcurrentCameraModeListener> listenersSnapshot = new ArrayList<>(this.mConcurrentCameraModeListeners);
            if (previousMode == 2 && cameraOperatingMode != 2) {
                this.mActiveConcurrentCameraInfos.clear();
            }
            notifyCameraModeListener(listenersSnapshot, previousMode, cameraOperatingMode);
        }
    }

    private void notifyCameraModeListener(List<CameraCoordinator.ConcurrentCameraModeListener> listeners, int prevMode, int currMode) {
        for (CameraCoordinator.ConcurrentCameraModeListener listener : listeners) {
            listener.onCameraOperatingModeUpdated(prevMode, currMode);
        }
    }

    @Override // androidx.camera.core.concurrent.CameraCoordinator
    public void addListener(CameraCoordinator.ConcurrentCameraModeListener listener) {
        synchronized (this.mLock) {
            this.mConcurrentCameraModeListeners.add(listener);
        }
    }

    @Override // androidx.camera.core.concurrent.CameraCoordinator
    public void removeListener(CameraCoordinator.ConcurrentCameraModeListener listener) {
        synchronized (this.mLock) {
            this.mConcurrentCameraModeListeners.remove(listener);
        }
    }

    @Override // androidx.camera.core.concurrent.CameraCoordinator
    public void shutdown() {
        synchronized (this.mLock) {
            this.mConcurrentCameraModeListeners.clear();
            this.mConcurrentCameraIdMap.clear();
            this.mActiveConcurrentCameraInfos.clear();
            this.mConcurrentCameraIds.clear();
            this.mCameraOperatingMode = 0;
        }
    }

    private static CameraSelector createCameraSelectorById(CameraManagerCompat cameraManager, final String cameraId) {
        CameraSelector.Builder builder = new CameraSelector.Builder().addCameraFilter(new CameraFilter() { // from class: androidx.camera.camera2.internal.concurrent.Camera2CameraCoordinator$$ExternalSyntheticLambda0
            @Override // androidx.camera.core.CameraFilter
            public final List filter(List list) {
                return Camera2CameraCoordinator.lambda$createCameraSelectorById$0(cameraId, list);
            }

            @Override // androidx.camera.core.CameraFilter
            public /* synthetic */ Identifier getIdentifier() {
                Identifier identifier;
                identifier = CameraFilter.DEFAULT_ID;
                return identifier;
            }
        });
        try {
            CameraCharacteristicsCompat cameraCharacteristics = cameraManager.getCameraCharacteristicsCompat(cameraId);
            Integer cameraLensFacing = (Integer) cameraCharacteristics.get(CameraCharacteristics.LENS_FACING);
            if (cameraLensFacing != null) {
                builder.requireLensFacing(cameraLensFacing.intValue());
            }
            return builder.build();
        } catch (CameraAccessExceptionCompat e) {
            throw new RuntimeException("Unable to get camera characteristics for " + cameraId, e);
        }
    }

    static /* synthetic */ List lambda$createCameraSelectorById$0(String cameraId, List cameraInfos) {
        Iterator it = cameraInfos.iterator();
        while (it.hasNext()) {
            CameraInfo cameraInfo = (CameraInfo) it.next();
            if (cameraId.equals(Camera2CameraInfo.from(cameraInfo).getCameraId())) {
                return Collections.singletonList(cameraInfo);
            }
        }
        throw new IllegalArgumentException("No camera can be find for id: " + cameraId);
    }
}
