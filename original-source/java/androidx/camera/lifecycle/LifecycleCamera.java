package androidx.camera.lifecycle;

import android.os.Build;
import androidx.camera.core.Camera;
import androidx.camera.core.CameraControl;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.LegacySessionConfig;
import androidx.camera.core.SessionConfig;
import androidx.camera.core.UseCase;
import androidx.camera.core.featuregroup.GroupableFeature;
import androidx.camera.core.featuregroup.impl.ResolvedFeatureGroup;
import androidx.camera.core.impl.CameraConfig;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.internal.CameraUseCaseAdapter;
import androidx.core.util.Preconditions;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleObserver;
import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.OnLifecycleEvent;
import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/* loaded from: classes.dex */
public final class LifecycleCamera implements LifecycleObserver, Camera {
    private final CameraUseCaseAdapter mCameraUseCaseAdapter;
    private final LifecycleOwner mLifecycleOwner;
    private final Object mLock = new Object();
    private volatile boolean mIsActive = false;
    private boolean mSuspended = false;
    private boolean mReleased = false;
    private SessionConfig mBoundSessionConfig = null;

    @Override // androidx.camera.core.Camera
    public /* synthetic */ boolean isUseCasesCombinationSupported(UseCase... useCaseArr) {
        boolean isUseCasesCombinationSupported;
        isUseCasesCombinationSupported = isUseCasesCombinationSupported(true, useCaseArr);
        return isUseCasesCombinationSupported;
    }

    @Override // androidx.camera.core.Camera
    public /* synthetic */ boolean isUseCasesCombinationSupportedByFramework(UseCase... useCaseArr) {
        boolean isUseCasesCombinationSupported;
        isUseCasesCombinationSupported = isUseCasesCombinationSupported(false, useCaseArr);
        return isUseCasesCombinationSupported;
    }

    LifecycleCamera(LifecycleOwner lifecycleOwner, CameraUseCaseAdapter cameraUseCaseAdaptor) {
        this.mLifecycleOwner = lifecycleOwner;
        this.mCameraUseCaseAdapter = cameraUseCaseAdaptor;
        if (this.mLifecycleOwner.getLifecycle().getState().isAtLeast(Lifecycle.State.STARTED)) {
            this.mCameraUseCaseAdapter.attachUseCases();
        } else {
            this.mCameraUseCaseAdapter.detachUseCases();
        }
        lifecycleOwner.getLifecycle().addObserver(this);
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_START)
    public void onStart(LifecycleOwner lifecycleOwner) {
        synchronized (this.mLock) {
            if (!this.mSuspended && !this.mReleased) {
                this.mCameraUseCaseAdapter.attachUseCases();
                this.mIsActive = true;
            }
        }
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_STOP)
    public void onStop(LifecycleOwner lifecycleOwner) {
        synchronized (this.mLock) {
            if (!this.mSuspended && !this.mReleased) {
                this.mCameraUseCaseAdapter.detachUseCases();
                this.mIsActive = false;
            }
        }
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_DESTROY)
    public void onDestroy(LifecycleOwner lifecycleOwner) {
        synchronized (this.mLock) {
            this.mCameraUseCaseAdapter.removeUseCases(this.mCameraUseCaseAdapter.getUseCases());
        }
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_RESUME)
    public void onResume(LifecycleOwner lifecycleOwner) {
        if (Build.VERSION.SDK_INT >= 24) {
            this.mCameraUseCaseAdapter.setActiveResumingMode(true);
        }
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_PAUSE)
    public void onPause(LifecycleOwner lifecycleOwner) {
        if (Build.VERSION.SDK_INT >= 24) {
            this.mCameraUseCaseAdapter.setActiveResumingMode(false);
        }
    }

    public void suspend() {
        synchronized (this.mLock) {
            if (this.mSuspended) {
                return;
            }
            onStop(this.mLifecycleOwner);
            this.mSuspended = true;
        }
    }

    public void unsuspend() {
        synchronized (this.mLock) {
            if (this.mSuspended) {
                this.mSuspended = false;
                if (this.mLifecycleOwner.getLifecycle().getState().isAtLeast(Lifecycle.State.STARTED)) {
                    onStart(this.mLifecycleOwner);
                }
            }
        }
    }

    public boolean isActive() {
        boolean z;
        synchronized (this.mLock) {
            z = this.mIsActive;
        }
        return z;
    }

    public boolean isBound(UseCase useCase) {
        boolean contains;
        synchronized (this.mLock) {
            contains = this.mCameraUseCaseAdapter.getUseCases().contains(useCase);
        }
        return contains;
    }

    public boolean isBound(SessionConfig sessionConfig) {
        boolean z = true;
        Preconditions.checkState(!sessionConfig.getIsLegacy());
        synchronized (this.mLock) {
            if (this.mBoundSessionConfig != sessionConfig) {
                z = false;
            }
        }
        return z;
    }

    public List<UseCase> getUseCases() {
        List<UseCase> unmodifiableList;
        synchronized (this.mLock) {
            unmodifiableList = DesugarCollections.unmodifiableList(this.mCameraUseCaseAdapter.getUseCases());
        }
        return unmodifiableList;
    }

    public LifecycleOwner getLifecycleOwner() {
        LifecycleOwner lifecycleOwner;
        synchronized (this.mLock) {
            lifecycleOwner = this.mLifecycleOwner;
        }
        return lifecycleOwner;
    }

    public CameraUseCaseAdapter getCameraUseCaseAdapter() {
        return this.mCameraUseCaseAdapter;
    }

    void bind(final SessionConfig sessionConfig) throws CameraUseCaseAdapter.CameraException {
        synchronized (this.mLock) {
            if (this.mBoundSessionConfig == null) {
                this.mBoundSessionConfig = sessionConfig;
            } else if (sessionConfig.getIsLegacy()) {
                if (!this.mBoundSessionConfig.getIsLegacy()) {
                    throw new IllegalStateException("Cannot bind use cases when a SessionConfig is already bound to this LifecycleOwner. Please unbind first");
                }
                List<UseCase> boundUseCases = new ArrayList<>(this.mBoundSessionConfig.getUseCases());
                boundUseCases.addAll(sessionConfig.getUseCases());
                this.mBoundSessionConfig = new LegacySessionConfig(boundUseCases, sessionConfig.getViewPort(), sessionConfig.getEffects());
            } else {
                if (this.mBoundSessionConfig.getIsLegacy()) {
                    throw new IllegalStateException("Cannot bind the SessionConfig when use cases are bound to this LifecycleOwner already. Please unbind first");
                }
                this.mBoundSessionConfig = sessionConfig;
                this.mCameraUseCaseAdapter.removeUseCases(this.mCameraUseCaseAdapter.getUseCases());
            }
            this.mCameraUseCaseAdapter.setViewPort(sessionConfig.getViewPort());
            this.mCameraUseCaseAdapter.setEffects(sessionConfig.getEffects());
            this.mCameraUseCaseAdapter.setSessionType(sessionConfig.getSessionType());
            this.mCameraUseCaseAdapter.setFrameRate(sessionConfig.getFrameRateRange());
            final ResolvedFeatureGroup resolvedFeatureGroup = ResolvedFeatureGroup.resolveFeatureGroup(sessionConfig, (CameraInfoInternal) getCameraInfo());
            sessionConfig.getFeatureSelectionListenerExecutor().execute(new Runnable() { // from class: androidx.camera.lifecycle.LifecycleCamera$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    LifecycleCamera.lambda$bind$0(ResolvedFeatureGroup.this, sessionConfig);
                }
            });
            this.mCameraUseCaseAdapter.addUseCases(sessionConfig.getUseCases(), resolvedFeatureGroup);
        }
    }

    static /* synthetic */ void lambda$bind$0(ResolvedFeatureGroup resolvedFeatureGroup, SessionConfig sessionConfig) {
        Set<GroupableFeature> features = new HashSet<>();
        if (resolvedFeatureGroup != null) {
            features.addAll(resolvedFeatureGroup.getFeatures());
        }
        sessionConfig.getFeatureSelectionListener().accept(features);
    }

    SessionConfig getBoundSessionConfig() {
        SessionConfig sessionConfig;
        synchronized (this.mLock) {
            sessionConfig = this.mBoundSessionConfig;
        }
        return sessionConfig;
    }

    boolean isLegacySessionConfigBound() {
        boolean isLegacy;
        synchronized (this.mLock) {
            isLegacy = this.mBoundSessionConfig == null ? false : this.mBoundSessionConfig.getIsLegacy();
        }
        return isLegacy;
    }

    void unbind(SessionConfig sessionConfig) {
        synchronized (this.mLock) {
            if (this.mBoundSessionConfig != null && this.mBoundSessionConfig.getIsLegacy() == sessionConfig.getIsLegacy()) {
                LegacySessionConfig legacySessionConfig = null;
                if (!this.mBoundSessionConfig.getIsLegacy() && !sessionConfig.getIsLegacy()) {
                    if (this.mBoundSessionConfig != sessionConfig) {
                        return;
                    } else {
                        this.mBoundSessionConfig = null;
                    }
                } else if (this.mBoundSessionConfig.getIsLegacy() && sessionConfig.getIsLegacy()) {
                    List<UseCase> boundUseCases = new ArrayList<>(this.mBoundSessionConfig.getUseCases());
                    boundUseCases.removeAll(sessionConfig.getUseCases());
                    if (!boundUseCases.isEmpty()) {
                        legacySessionConfig = new LegacySessionConfig(boundUseCases, this.mBoundSessionConfig.getViewPort(), this.mBoundSessionConfig.getEffects());
                    }
                    this.mBoundSessionConfig = legacySessionConfig;
                }
                List<UseCase> useCasesToRemove = new ArrayList<>(sessionConfig.getUseCases());
                useCasesToRemove.retainAll(this.mCameraUseCaseAdapter.getUseCases());
                this.mCameraUseCaseAdapter.removeUseCases(useCasesToRemove);
            }
        }
    }

    void unbindAll() {
        synchronized (this.mLock) {
            this.mCameraUseCaseAdapter.removeUseCases(this.mCameraUseCaseAdapter.getUseCases());
            this.mBoundSessionConfig = null;
        }
    }

    void release() {
        synchronized (this.mLock) {
            this.mReleased = true;
            this.mIsActive = false;
            this.mLifecycleOwner.getLifecycle().removeObserver(this);
        }
    }

    @Override // androidx.camera.core.Camera
    public CameraControl getCameraControl() {
        return this.mCameraUseCaseAdapter.getCameraControl();
    }

    @Override // androidx.camera.core.Camera
    public CameraInfo getCameraInfo() {
        return this.mCameraUseCaseAdapter.getCameraInfo();
    }

    CameraInfo getSecondaryCameraInfo() {
        return this.mCameraUseCaseAdapter.getSecondaryCameraInfo();
    }

    @Override // androidx.camera.core.Camera
    public CameraConfig getExtendedConfig() {
        return this.mCameraUseCaseAdapter.getExtendedConfig();
    }

    @Override // androidx.camera.core.Camera
    public boolean isUseCasesCombinationSupported(boolean withStreamSharing, UseCase... useCases) {
        return this.mCameraUseCaseAdapter.isUseCasesCombinationSupported(withStreamSharing, useCases);
    }
}
