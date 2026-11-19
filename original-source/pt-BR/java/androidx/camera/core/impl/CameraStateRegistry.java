package androidx.camera.core.impl;

import androidx.camera.core.Camera;
import androidx.camera.core.Logger;
import androidx.camera.core.concurrent.CameraCoordinator;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.CameraStateRegistry;
import androidx.core.util.Preconditions;
import androidx.tracing.Trace;
import j$.util.Objects;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;

/* carregado de: classes.dex */
public final class CameraStateRegistry implements CameraCoordinator.ConcurrentCameraModeListener {
    private static final int MAX_ALLOWED_CONCURRENT_CAMERAS_IN_CONCURRENT_MODE = 2;
    private static final int MAX_ALLOWED_CONCURRENT_CAMERAS_IN_SINGLE_MODE = 1;
    private static final String TAG = "CameraStateRegistry";
    private int mAvailableCameras;
    private final CameraCoordinator mCameraCoordinator;
    private int mMaxAllowedOpenedCameras;
    private final StringBuilder mDebugString = new StringBuilder();
    private final Object mLock = new Object();
    private final Map<Camera, CameraRegistration> mCameraStates = new HashMap();

    public interface OnConfigureAvailableListener {
        void onConfigureAvailable();
    }

    public interface OnOpenAvailableListener {
        void onOpenAvailable();
    }

    public CameraStateRegistry(CameraCoordinator cameraCoordinator, int maxAllowedOpenedCameras) {
        this.mMaxAllowedOpenedCameras = maxAllowedOpenedCameras;
        synchronized (this.mLock) {
            this.mCameraCoordinator = cameraCoordinator;
            this.mAvailableCameras = this.mMaxAllowedOpenedCameras;
        }
    }

    public void registerCamera(Camera camera, Executor notifyExecutor, OnConfigureAvailableListener onConfigureAvailableListener, OnOpenAvailableListener onOpenAvailableListener) {
        synchronized (this.mLock) {
            Preconditions.checkState(!this.mCameraStates.containsKey(camera), "Camera is already registered: " + camera);
            this.mCameraStates.put(camera, new CameraRegistration(null, notifyExecutor, onConfigureAvailableListener, onOpenAvailableListener));
        }
    }

    public boolean tryOpenCamera(Camera camera) {
        boolean success;
        synchronized (this.mLock) {
            CameraRegistration registration = (CameraRegistration) Preconditions.checkNotNull(this.mCameraStates.get(camera), "Camera must first be registered with registerCamera()");
            success = false;
            if (Logger.isDebugEnabled(TAG)) {
                this.mDebugString.setLength(0);
                this.mDebugString.append(String.format(Locale.US, "tryOpenCamera(%s) [Available Cameras: %d, Already Open: %b (Previous state: %s)]", camera, Integer.valueOf(this.mAvailableCameras), Boolean.valueOf(isOpen(registration.getState())), registration.getState()));
            }
            if (this.mAvailableCameras > 0 || isOpen(registration.getState())) {
                registration.setState(CameraInternal.State.OPENING);
                traceState(camera, CameraInternal.State.OPENING);
                success = true;
            }
            if (Logger.isDebugEnabled(TAG)) {
                this.mDebugString.append(String.format(Locale.US, " --> %s", success ? "SUCCESS" : "FAIL"));
                Logger.d(TAG, this.mDebugString.toString());
            }
            if (success) {
                recalculateAvailableCameras();
            }
        }
        return success;
    }

    /* JADX WARN: região duplicada removida para o bloco: B:29:0x0055 A[ADDED_TO_REGION] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean tryOpenCaptureSession(java.lang.String r10, java.lang.String r11) {
        /*
            r9 = this;
            java.lang.Object r0 = r9.mLock
            monitor-enter(r0)
            androidx.camera.core.concurrent.CameraCoordinator r1 = r9.mCameraCoordinator     // Catch: java.lang.Throwable -> L5b
            int r1 = r1.getCameraOperatingMode()     // Catch: java.lang.Throwable -> L5b
            r2 = 2
            r3 = 1
            if (r1 == r2) goto Lf
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L5b
            return r3
        Lf:
            androidx.camera.core.impl.CameraStateRegistry$CameraRegistration r1 = r9.getCameraRegistration(r10)     // Catch: java.lang.Throwable -> L5b
            r2 = 0
            if (r1 == 0) goto L1b
            androidx.camera.core.impl.CameraInternal$State r4 = r1.getState()     // Catch: java.lang.Throwable -> L5b
            goto L1c
        L1b:
            r4 = r2
        L1c:
            if (r11 == 0) goto L23
            androidx.camera.core.impl.CameraStateRegistry$CameraRegistration r5 = r9.getCameraRegistration(r11)     // Catch: java.lang.Throwable -> L5b
            goto L24
        L23:
            r5 = r2
        L24:
            if (r5 == 0) goto L2a
            androidx.camera.core.impl.CameraInternal$State r2 = r5.getState()     // Catch: java.lang.Throwable -> L5b
        L2a:
            androidx.camera.core.impl.CameraInternal$State r6 = androidx.camera.core.impl.CameraInternal.State.OPEN     // Catch: java.lang.Throwable -> L5b
            boolean r6 = r6.equals(r4)     // Catch: java.lang.Throwable -> L5b
            r7 = 0
            if (r6 != 0) goto L3e
            androidx.camera.core.impl.CameraInternal$State r6 = androidx.camera.core.impl.CameraInternal.State.CONFIGURED     // Catch: java.lang.Throwable -> L5b
            boolean r6 = r6.equals(r4)     // Catch: java.lang.Throwable -> L5b
            if (r6 == 0) goto L3c
            goto L3e
        L3c:
            r6 = r7
            goto L3f
        L3e:
            r6 = r3
        L3f:
            androidx.camera.core.impl.CameraInternal$State r8 = androidx.camera.core.impl.CameraInternal.State.OPEN     // Catch: java.lang.Throwable -> L5b
            boolean r8 = r8.equals(r2)     // Catch: java.lang.Throwable -> L5b
            if (r8 != 0) goto L52
            androidx.camera.core.impl.CameraInternal$State r8 = androidx.camera.core.impl.CameraInternal.State.CONFIGURED     // Catch: java.lang.Throwable -> L5b
            boolean r8 = r8.equals(r2)     // Catch: java.lang.Throwable -> L5b
            if (r8 == 0) goto L50
            goto L52
        L50:
            r8 = r7
            goto L53
        L52:
            r8 = r3
        L53:
            if (r6 == 0) goto L58
            if (r8 == 0) goto L58
            goto L59
        L58:
            r3 = r7
        L59:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L5b
            return r3
        L5b:
            r1 = move-exception
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L5b
            throw r1
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.core.impl.CameraStateRegistry.tryOpenCaptureSession(java.lang.String, java.lang.String):boolean");
    }

    public void markCameraState(Camera camera, CameraInternal.State state) {
        markCameraState(camera, state, true);
    }

    public void markCameraState(Camera camera, CameraInternal.State state, boolean notifyImmediately) {
        CameraInternal.State previousState;
        Map<Camera, CameraRegistration> camerasToNotifyOpen = null;
        CameraRegistration cameraToNotifyConfigure = null;
        synchronized (this.mLock) {
            int previousAvailableCameras = this.mAvailableCameras;
            if (state == CameraInternal.State.RELEASED) {
                previousState = unregisterCamera(camera);
            } else {
                previousState = updateAndVerifyState(camera, state);
            }
            if (previousState == state) {
                return;
            }
            if (this.mCameraCoordinator.getCameraOperatingMode() == 2 && state == CameraInternal.State.CONFIGURED) {
                String cameraId = ((CameraInfoInternal) camera.getCameraInfo()).getCameraId();
                String pairedCameraId = this.mCameraCoordinator.getPairedConcurrentCameraId(cameraId);
                if (pairedCameraId != null) {
                    cameraToNotifyConfigure = getCameraRegistration(pairedCameraId);
                }
            }
            if (previousAvailableCameras < 1 && this.mAvailableCameras > 0) {
                camerasToNotifyOpen = new HashMap<>();
                for (Map.Entry<Camera, CameraRegistration> entry : this.mCameraStates.entrySet()) {
                    if (entry.getValue().getState() == CameraInternal.State.PENDING_OPEN) {
                        camerasToNotifyOpen.put(entry.getKey(), entry.getValue());
                    }
                }
            } else if (state == CameraInternal.State.PENDING_OPEN && this.mAvailableCameras > 0) {
                camerasToNotifyOpen = new HashMap<>();
                camerasToNotifyOpen.put(camera, this.mCameraStates.get(camera));
            }
            if (camerasToNotifyOpen != null && !notifyImmediately) {
                camerasToNotifyOpen.remove(camera);
            }
            if (camerasToNotifyOpen != null) {
                for (CameraRegistration registration : camerasToNotifyOpen.values()) {
                    registration.notifyOnOpenAvailableListener();
                }
            }
            if (cameraToNotifyConfigure != null) {
                cameraToNotifyConfigure.notifyOnConfigureAvailableListener();
            }
        }
    }

    @Override // androidx.camera.core.concurrent.CameraCoordinator.ConcurrentCameraModeListener
    public void onCameraOperatingModeUpdated(int prevMode, int currMode) {
        int i;
        boolean isConcurrentCameraModeOn;
        synchronized (this.mLock) {
            boolean isConcurrentCameraModeOff = true;
            if (currMode == 2) {
                i = 2;
            } else {
                i = 1;
            }
            this.mMaxAllowedOpenedCameras = i;
            if (prevMode != 2 && currMode == 2) {
                isConcurrentCameraModeOn = true;
            } else {
                isConcurrentCameraModeOn = false;
            }
            if (prevMode != 2 || currMode == 2) {
                isConcurrentCameraModeOff = false;
            }
            if (isConcurrentCameraModeOn || isConcurrentCameraModeOff) {
                recalculateAvailableCameras();
            }
        }
    }

    private CameraInternal.State unregisterCamera(Camera camera) {
        CameraRegistration registration = this.mCameraStates.remove(camera);
        if (registration != null) {
            recalculateAvailableCameras();
            return registration.getState();
        }
        return null;
    }

    private CameraInternal.State updateAndVerifyState(Camera camera, CameraInternal.State state) {
        CameraInternal.State previousState = ((CameraRegistration) Preconditions.checkNotNull(this.mCameraStates.get(camera), "Cannot update state of camera which has not yet been registered. Register with CameraStateRegistry.registerCamera()")).setState(state);
        if (state == CameraInternal.State.OPENING) {
            Preconditions.checkState(isOpen(state) || previousState == CameraInternal.State.OPENING, "Cannot mark camera as opening until camera was successful at calling CameraStateRegistry.tryOpenCamera()");
        }
        if (previousState != state) {
            traceState(camera, state);
            recalculateAvailableCameras();
        }
        return previousState;
    }

    private static boolean isOpen(CameraInternal.State state) {
        return state != null && state.holdsCameraSlot();
    }

    private void recalculateAvailableCameras() {
        if (Logger.isDebugEnabled(TAG)) {
            this.mDebugString.setLength(0);
            this.mDebugString.append("Recalculating open cameras:\n");
            this.mDebugString.append(String.format(Locale.US, "%-45s%-22s\n", "Camera", "State"));
            this.mDebugString.append("-------------------------------------------------------------------\n");
        }
        int openCount = 0;
        for (Map.Entry<Camera, CameraRegistration> entry : this.mCameraStates.entrySet()) {
            if (Logger.isDebugEnabled(TAG)) {
                String stateString = entry.getValue().getState() != null ? entry.getValue().getState().toString() : "UNKNOWN";
                this.mDebugString.append(String.format(Locale.US, "%-45s%-22s\n", entry.getKey().toString(), stateString));
            }
            if (isOpen(entry.getValue().getState())) {
                openCount++;
            }
        }
        if (Logger.isDebugEnabled(TAG)) {
            this.mDebugString.append("-------------------------------------------------------------------\n");
            this.mDebugString.append(String.format(Locale.US, "Open count: %d (Max allowed: %d)", Integer.valueOf(openCount), Integer.valueOf(this.mMaxAllowedOpenedCameras)));
            Logger.d(TAG, this.mDebugString.toString());
        }
        this.mAvailableCameras = Math.max(this.mMaxAllowedOpenedCameras - openCount, 0);
    }

    public boolean isCameraClosing() {
        synchronized (this.mLock) {
            for (Map.Entry<Camera, CameraRegistration> entry : this.mCameraStates.entrySet()) {
                if (entry.getValue().getState() == CameraInternal.State.CLOSING) {
                    return true;
                }
            }
            return false;
        }
    }

    private CameraRegistration getCameraRegistration(String targetCameraId) {
        for (Camera camera : this.mCameraStates.keySet()) {
            String cameraId = ((CameraInfoInternal) camera.getCameraInfo()).getCameraId();
            if (targetCameraId.equals(cameraId)) {
                return this.mCameraStates.get(camera);
            }
        }
        return null;
    }

    private static class CameraRegistration {
        private final Executor mNotifyExecutor;
        private final OnConfigureAvailableListener mOnConfigureAvailableListener;
        private final OnOpenAvailableListener mOnOpenAvailableListener;
        private CameraInternal.State mState;

        CameraRegistration(CameraInternal.State initialState, Executor notifyExecutor, OnConfigureAvailableListener onConfigureAvailableListener, OnOpenAvailableListener onOpenAvailableListener) {
            this.mState = initialState;
            this.mNotifyExecutor = notifyExecutor;
            this.mOnConfigureAvailableListener = onConfigureAvailableListener;
            this.mOnOpenAvailableListener = onOpenAvailableListener;
        }

        CameraInternal.State setState(CameraInternal.State state) {
            CameraInternal.State previousState = this.mState;
            this.mState = state;
            return previousState;
        }

        CameraInternal.State getState() {
            return this.mState;
        }

        void notifyOnConfigureAvailableListener() {
            try {
                Executor executor = this.mNotifyExecutor;
                final OnConfigureAvailableListener onConfigureAvailableListener = this.mOnConfigureAvailableListener;
                Objects.requireNonNull(onConfigureAvailableListener);
                executor.execute(new Runnable() { // da classe: androidx.camera.core.impl.CameraStateRegistry$CameraRegistration$$ExternalSyntheticLambda1
                    @Override // java.lang.Runnable
                    public final void run() {
                        CameraStateRegistry.OnConfigureAvailableListener.this.onConfigureAvailable();
                    }
                });
            } catch (RejectedExecutionException e) {
                Logger.e(CameraStateRegistry.TAG, "Unable to notify camera to configure.", e);
            }
        }

        void notifyOnOpenAvailableListener() {
            try {
                Executor executor = this.mNotifyExecutor;
                final OnOpenAvailableListener onOpenAvailableListener = this.mOnOpenAvailableListener;
                Objects.requireNonNull(onOpenAvailableListener);
                executor.execute(new Runnable() { // da classe: androidx.camera.core.impl.CameraStateRegistry$CameraRegistration$$ExternalSyntheticLambda0
                    @Override // java.lang.Runnable
                    public final void run() {
                        CameraStateRegistry.OnOpenAvailableListener.this.onOpenAvailable();
                    }
                });
            } catch (RejectedExecutionException e) {
                Logger.e(CameraStateRegistry.TAG, "Unable to notify camera to open.", e);
            }
        }
    }

    private static void traceState(Camera camera, CameraInternal.State state) {
        if (Trace.isEnabled()) {
            String counterName = "CX:State[" + camera + "]";
            Trace.setCounter(counterName, state.ordinal());
        }
    }
}
