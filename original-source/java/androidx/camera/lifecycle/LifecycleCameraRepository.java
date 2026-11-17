package androidx.camera.lifecycle;

import androidx.camera.core.CameraIdentifier;
import androidx.camera.core.Logger;
import androidx.camera.core.SessionConfig;
import androidx.camera.core.concurrent.CameraCoordinator;
import androidx.camera.core.internal.CameraUseCaseAdapter;
import androidx.core.util.Preconditions;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleObserver;
import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.OnLifecycleEvent;
import j$.util.DesugarCollections;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayDeque;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/* loaded from: classes.dex */
final class LifecycleCameraRepository {
    private static final String TAG = "LifecycleCameraRepository";
    CameraCoordinator mCameraCoordinator;
    private static final Object INSTANCE_LOCK = new Object();
    private static LifecycleCameraRepository sInstance = null;
    private final Object mLock = new Object();
    private final Map<Key, LifecycleCamera> mCameraMap = new HashMap();
    private final Map<LifecycleCameraRepositoryObserver, Set<Key>> mLifecycleObserverMap = new HashMap();
    private final ArrayDeque<LifecycleOwner> mActiveLifecycleOwners = new ArrayDeque<>();

    @Retention(RetentionPolicy.SOURCE)
    @interface FromUseCaseAdapter {
    }

    LifecycleCameraRepository() {
    }

    static LifecycleCameraRepository getInstance() {
        LifecycleCameraRepository lifecycleCameraRepository;
        synchronized (INSTANCE_LOCK) {
            if (sInstance == null) {
                sInstance = new LifecycleCameraRepository();
            }
            lifecycleCameraRepository = sInstance;
        }
        return lifecycleCameraRepository;
    }

    LifecycleCamera createLifecycleCamera(LifecycleOwner lifecycleOwner, CameraUseCaseAdapter cameraUseCaseAdapter) {
        synchronized (this.mLock) {
            Key key = Key.create(lifecycleOwner, cameraUseCaseAdapter.getAdapterIdentifier());
            Preconditions.checkArgument(this.mCameraMap.get(key) == null, "LifecycleCamera already exists for the given LifecycleOwner and set of cameras");
            LifecycleCamera lifecycleCamera = new LifecycleCamera(lifecycleOwner, cameraUseCaseAdapter);
            if (cameraUseCaseAdapter.getUseCases().isEmpty()) {
                lifecycleCamera.suspend();
            }
            if (lifecycleOwner.getLifecycle().getState() == Lifecycle.State.DESTROYED) {
                return lifecycleCamera;
            }
            registerCamera(lifecycleCamera);
            return lifecycleCamera;
        }
    }

    LifecycleCamera getLifecycleCamera(LifecycleOwner lifecycleOwner, CameraIdentifier cameraUseCaseAdapterIdentifier) {
        LifecycleCamera lifecycleCamera;
        synchronized (this.mLock) {
            lifecycleCamera = this.mCameraMap.get(Key.create(lifecycleOwner, cameraUseCaseAdapterIdentifier));
        }
        return lifecycleCamera;
    }

    Collection<LifecycleCamera> getLifecycleCameras() {
        Collection<LifecycleCamera> unmodifiableCollection;
        synchronized (this.mLock) {
            unmodifiableCollection = DesugarCollections.unmodifiableCollection(this.mCameraMap.values());
        }
        return unmodifiableCollection;
    }

    void removeLifecycleCameras(Set<Key> lifecycleCameraKeys) {
        Set<Key> keysToUnbind;
        synchronized (this.mLock) {
            if (lifecycleCameraKeys != null) {
                keysToUnbind = lifecycleCameraKeys;
            } else {
                try {
                    keysToUnbind = this.mCameraMap.keySet();
                } catch (Throwable th) {
                    throw th;
                }
            }
            for (Key key : keysToUnbind) {
                if (this.mCameraMap.containsKey(key)) {
                    unregisterCamera(this.mCameraMap.get(key));
                }
            }
        }
    }

    void clear() {
        synchronized (this.mLock) {
            Set<LifecycleCameraRepositoryObserver> keySet = new HashSet<>(this.mLifecycleObserverMap.keySet());
            for (LifecycleCameraRepositoryObserver observer : keySet) {
                unregisterLifecycle(observer.getLifecycleOwner());
            }
        }
    }

    private void registerCamera(LifecycleCamera lifecycleCamera) {
        Set<Key> lifecycleCameraKeySet;
        synchronized (this.mLock) {
            LifecycleOwner lifecycleOwner = lifecycleCamera.getLifecycleOwner();
            Key key = Key.create(lifecycleOwner, lifecycleCamera.getCameraUseCaseAdapter().getAdapterIdentifier());
            LifecycleCameraRepositoryObserver observer = getLifecycleCameraRepositoryObserver(lifecycleOwner);
            if (observer != null) {
                lifecycleCameraKeySet = this.mLifecycleObserverMap.get(observer);
            } else {
                lifecycleCameraKeySet = new HashSet<>();
            }
            lifecycleCameraKeySet.add(key);
            this.mCameraMap.put(key, lifecycleCamera);
            if (observer == null) {
                LifecycleCameraRepositoryObserver observer2 = new LifecycleCameraRepositoryObserver(lifecycleOwner, this);
                this.mLifecycleObserverMap.put(observer2, lifecycleCameraKeySet);
                lifecycleOwner.getLifecycle().addObserver(observer2);
            }
        }
    }

    private void unregisterCamera(LifecycleCamera lifecycleCamera) {
        synchronized (this.mLock) {
            LifecycleOwner lifecycleOwner = lifecycleCamera.getLifecycleOwner();
            Key key = Key.create(lifecycleOwner, lifecycleCamera.getCameraUseCaseAdapter().getAdapterIdentifier());
            this.mCameraMap.remove(key);
            Set<LifecycleOwner> lifecycleOwnerToUnregister = new HashSet<>();
            for (LifecycleCameraRepositoryObserver observer : this.mLifecycleObserverMap.keySet()) {
                if (lifecycleOwner.equals(observer.getLifecycleOwner())) {
                    Set<Key> keySet = this.mLifecycleObserverMap.get(observer);
                    keySet.remove(key);
                    if (keySet.isEmpty()) {
                        lifecycleOwnerToUnregister.add(observer.getLifecycleOwner());
                    }
                }
            }
            for (LifecycleOwner owner : lifecycleOwnerToUnregister) {
                unregisterLifecycle(owner);
            }
        }
    }

    void unregisterLifecycle(LifecycleOwner lifecycleOwner) {
        synchronized (this.mLock) {
            LifecycleCameraRepositoryObserver observer = getLifecycleCameraRepositoryObserver(lifecycleOwner);
            if (observer == null) {
                return;
            }
            setInactive(lifecycleOwner);
            for (Key key : this.mLifecycleObserverMap.get(observer)) {
                this.mCameraMap.remove(key);
            }
            this.mLifecycleObserverMap.remove(observer);
            observer.getLifecycleOwner().getLifecycle().removeObserver(observer);
        }
    }

    private LifecycleCameraRepositoryObserver getLifecycleCameraRepositoryObserver(LifecycleOwner lifecycleOwner) {
        synchronized (this.mLock) {
            for (LifecycleCameraRepositoryObserver observer : this.mLifecycleObserverMap.keySet()) {
                if (lifecycleOwner.equals(observer.getLifecycleOwner())) {
                    return observer;
                }
            }
            return null;
        }
    }

    void bindToLifecycleCamera(LifecycleCamera lifecycleCamera, SessionConfig sessionConfig, CameraCoordinator cameraCoordinator) {
        synchronized (this.mLock) {
            Preconditions.checkArgument(!sessionConfig.getUseCases().isEmpty());
            this.mCameraCoordinator = cameraCoordinator;
            LifecycleOwner lifecycleOwner = lifecycleCamera.getLifecycleOwner();
            LifecycleCameraRepositoryObserver observer = getLifecycleCameraRepositoryObserver(lifecycleOwner);
            if (observer == null) {
                return;
            }
            Set<Key> lifecycleCameraKeySet = this.mLifecycleObserverMap.get(observer);
            if (this.mCameraCoordinator == null || this.mCameraCoordinator.getCameraOperatingMode() != 2) {
                for (Key key : lifecycleCameraKeySet) {
                    LifecycleCamera camera = (LifecycleCamera) Preconditions.checkNotNull(this.mCameraMap.get(key));
                    if (!camera.equals(lifecycleCamera) && !camera.getUseCases().isEmpty()) {
                        if (!camera.isLegacySessionConfigBound() && !sessionConfig.getIsLegacy()) {
                            camera.unbindAll();
                        } else {
                            throw new IllegalArgumentException("Multiple LifecycleCameras with use cases are registered to the same LifecycleOwner. Please unbind first.");
                        }
                    }
                }
            }
            try {
                lifecycleCamera.bind(sessionConfig);
                if (lifecycleOwner.getLifecycle().getState().isAtLeast(Lifecycle.State.STARTED)) {
                    setActive(lifecycleOwner);
                }
            } catch (CameraUseCaseAdapter.CameraException e) {
                throw new IllegalArgumentException(e);
            }
        }
    }

    void unbind(SessionConfig sessionConfig) {
        unbind(sessionConfig, null);
    }

    void unbind(SessionConfig sessionConfig, Set<Key> lifecycleCameraKeys) {
        Set<Key> keysToUnbind;
        synchronized (this.mLock) {
            if (lifecycleCameraKeys != null) {
                keysToUnbind = lifecycleCameraKeys;
            } else {
                try {
                    keysToUnbind = this.mCameraMap.keySet();
                } catch (Throwable th) {
                    throw th;
                }
            }
            for (Key key : keysToUnbind) {
                if (this.mCameraMap.containsKey(key)) {
                    LifecycleCamera lifecycleCamera = this.mCameraMap.get(key);
                    boolean hasUseCase = !lifecycleCamera.getUseCases().isEmpty();
                    lifecycleCamera.unbind(sessionConfig);
                    if (hasUseCase && lifecycleCamera.getUseCases().isEmpty()) {
                        setInactive(lifecycleCamera.getLifecycleOwner());
                    }
                } else {
                    Logger.w(TAG, "Attempt to unbind use cases from an invalid camera.");
                }
            }
        }
    }

    void unbindAll() {
        unbindAll(null);
    }

    void unbindAll(Set<Key> lifecycleCameraKeys) {
        Set<Key> keysToUnbind;
        synchronized (this.mLock) {
            if (lifecycleCameraKeys != null) {
                keysToUnbind = lifecycleCameraKeys;
            } else {
                try {
                    keysToUnbind = this.mCameraMap.keySet();
                } catch (Throwable th) {
                    throw th;
                }
            }
            for (Key key : keysToUnbind) {
                LifecycleCamera lifecycleCamera = this.mCameraMap.get(key);
                if (lifecycleCamera != null) {
                    lifecycleCamera.unbindAll();
                    setInactive(lifecycleCamera.getLifecycleOwner());
                }
            }
        }
    }

    void setActive(LifecycleOwner lifecycleOwner) {
        synchronized (this.mLock) {
            if (hasUseCaseBound(lifecycleOwner)) {
                if (this.mActiveLifecycleOwners.isEmpty()) {
                    this.mActiveLifecycleOwners.push(lifecycleOwner);
                } else if (this.mCameraCoordinator == null || this.mCameraCoordinator.getCameraOperatingMode() != 2) {
                    LifecycleOwner currentActiveLifecycleOwner = this.mActiveLifecycleOwners.peek();
                    if (!lifecycleOwner.equals(currentActiveLifecycleOwner)) {
                        suspendUseCases(currentActiveLifecycleOwner);
                        this.mActiveLifecycleOwners.remove(lifecycleOwner);
                        this.mActiveLifecycleOwners.push(lifecycleOwner);
                    }
                }
                unsuspendUseCases(lifecycleOwner);
            }
        }
    }

    void setInactive(LifecycleOwner lifecycleOwner) {
        synchronized (this.mLock) {
            this.mActiveLifecycleOwners.remove(lifecycleOwner);
            suspendUseCases(lifecycleOwner);
            if (!this.mActiveLifecycleOwners.isEmpty()) {
                LifecycleOwner newActiveLifecycleOwner = this.mActiveLifecycleOwners.peek();
                unsuspendUseCases(newActiveLifecycleOwner);
            }
        }
    }

    private boolean hasUseCaseBound(LifecycleOwner lifecycleOwner) {
        synchronized (this.mLock) {
            LifecycleCameraRepositoryObserver observer = getLifecycleCameraRepositoryObserver(lifecycleOwner);
            if (observer == null) {
                return false;
            }
            Set<Key> lifecycleCameraKeySet = this.mLifecycleObserverMap.get(observer);
            for (Key key : lifecycleCameraKeySet) {
                if (!((LifecycleCamera) Preconditions.checkNotNull(this.mCameraMap.get(key))).getUseCases().isEmpty()) {
                    return true;
                }
            }
            return false;
        }
    }

    private void suspendUseCases(LifecycleOwner lifecycleOwner) {
        synchronized (this.mLock) {
            LifecycleCameraRepositoryObserver observer = getLifecycleCameraRepositoryObserver(lifecycleOwner);
            if (observer == null) {
                return;
            }
            for (Key key : this.mLifecycleObserverMap.get(observer)) {
                ((LifecycleCamera) Preconditions.checkNotNull(this.mCameraMap.get(key))).suspend();
            }
        }
    }

    private void unsuspendUseCases(LifecycleOwner lifecycleOwner) {
        synchronized (this.mLock) {
            LifecycleCameraRepositoryObserver observer = getLifecycleCameraRepositoryObserver(lifecycleOwner);
            for (Key key : this.mLifecycleObserverMap.get(observer)) {
                LifecycleCamera lifecycleCamera = this.mCameraMap.get(key);
                if (!((LifecycleCamera) Preconditions.checkNotNull(lifecycleCamera)).getUseCases().isEmpty()) {
                    lifecycleCamera.unsuspend();
                }
            }
        }
    }

    static abstract class Key {
        public abstract CameraIdentifier getCameraIdentifier();

        public abstract int getLifecycleOwnerHash();

        Key() {
        }

        static Key create(LifecycleOwner lifecycleOwner, CameraIdentifier cameraIdentifier) {
            return new AutoValue_LifecycleCameraRepository_Key(System.identityHashCode(lifecycleOwner), cameraIdentifier);
        }
    }

    private static class LifecycleCameraRepositoryObserver implements LifecycleObserver {
        private final LifecycleCameraRepository mLifecycleCameraRepository;
        private final LifecycleOwner mLifecycleOwner;

        LifecycleCameraRepositoryObserver(LifecycleOwner lifecycleOwner, LifecycleCameraRepository lifecycleCameraRepository) {
            this.mLifecycleOwner = lifecycleOwner;
            this.mLifecycleCameraRepository = lifecycleCameraRepository;
        }

        LifecycleOwner getLifecycleOwner() {
            return this.mLifecycleOwner;
        }

        @OnLifecycleEvent(Lifecycle.Event.ON_START)
        public void onStart(LifecycleOwner lifecycleOwner) {
            this.mLifecycleCameraRepository.setActive(lifecycleOwner);
        }

        @OnLifecycleEvent(Lifecycle.Event.ON_STOP)
        public void onStop(LifecycleOwner lifecycleOwner) {
            this.mLifecycleCameraRepository.setInactive(lifecycleOwner);
        }

        @OnLifecycleEvent(Lifecycle.Event.ON_DESTROY)
        public void onDestroy(LifecycleOwner lifecycleOwner) {
            this.mLifecycleCameraRepository.unregisterLifecycle(lifecycleOwner);
        }
    }
}
