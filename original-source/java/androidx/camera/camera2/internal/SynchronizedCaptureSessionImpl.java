package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CaptureRequest;
import android.os.Handler;
import android.view.Surface;
import androidx.camera.camera2.internal.compat.params.SessionConfigurationCompat;
import androidx.camera.camera2.internal.compat.quirk.CaptureSessionStuckQuirk;
import androidx.camera.camera2.internal.compat.quirk.IncorrectCaptureStateQuirk;
import androidx.camera.camera2.internal.compat.workaround.ForceCloseCaptureSession;
import androidx.camera.camera2.internal.compat.workaround.ForceCloseDeferrableSurface;
import androidx.camera.camera2.internal.compat.workaround.RequestMonitor;
import androidx.camera.camera2.internal.compat.workaround.SessionResetPolicy;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.Quirks;
import androidx.camera.core.impl.utils.futures.AsyncFunction;
import androidx.camera.core.impl.utils.futures.FutureChain;
import androidx.camera.core.impl.utils.futures.Futures;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes.dex */
class SynchronizedCaptureSessionImpl extends SynchronizedCaptureSessionBaseImpl {
    private static final String TAG = "SyncCaptureSessionImpl";
    private final ForceCloseDeferrableSurface mCloseSurfaceQuirk;
    private final AtomicBoolean mClosed;
    private List<DeferrableSurface> mDeferrableSurfaces;
    private final ForceCloseCaptureSession mForceCloseSessionQuirk;
    private final Object mObjectLock;
    ListenableFuture<List<Void>> mOpenSessionBlockerFuture;
    private final RequestMonitor mRequestMonitor;
    private final ScheduledExecutorService mScheduledExecutorService;
    private final SessionResetPolicy mSessionResetPolicy;

    SynchronizedCaptureSessionImpl(Quirks cameraQuirks, Quirks deviceQuirks, CaptureSessionRepository repository, Executor executor, ScheduledExecutorService scheduledExecutorService, Handler compatHandler) {
        super(repository, executor, scheduledExecutorService, compatHandler);
        this.mObjectLock = new Object();
        this.mClosed = new AtomicBoolean(false);
        this.mCloseSurfaceQuirk = new ForceCloseDeferrableSurface(cameraQuirks, deviceQuirks);
        this.mRequestMonitor = new RequestMonitor(cameraQuirks.contains(CaptureSessionStuckQuirk.class) || cameraQuirks.contains(IncorrectCaptureStateQuirk.class));
        this.mForceCloseSessionQuirk = new ForceCloseCaptureSession(deviceQuirks);
        this.mSessionResetPolicy = new SessionResetPolicy(deviceQuirks);
        this.mScheduledExecutorService = scheduledExecutorService;
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSessionBaseImpl, androidx.camera.camera2.internal.SynchronizedCaptureSession.Opener
    public ListenableFuture<Void> openCaptureSession(final CameraDevice cameraDevice, final SessionConfigurationCompat sessionConfigurationCompat, final List<DeferrableSurface> deferrableSurfaces) {
        ListenableFuture<Void> nonCancellationPropagating;
        synchronized (this.mObjectLock) {
            List<SynchronizedCaptureSession> configured = this.mCaptureSessionRepository.getCaptureSessions();
            List<ListenableFuture<Void>> futureList = new ArrayList<>();
            for (SynchronizedCaptureSession session : configured) {
                futureList.add(session.getOpeningBlocker());
            }
            this.mOpenSessionBlockerFuture = Futures.successfulAsList(futureList);
            nonCancellationPropagating = Futures.nonCancellationPropagating(FutureChain.from(this.mOpenSessionBlockerFuture).transformAsync(new AsyncFunction() { // from class: androidx.camera.camera2.internal.SynchronizedCaptureSessionImpl$$ExternalSyntheticLambda2
                @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
                public final ListenableFuture apply(Object obj) {
                    return SynchronizedCaptureSessionImpl.this.m96xe055f2f(cameraDevice, sessionConfigurationCompat, deferrableSurfaces, (List) obj);
                }
            }, getExecutor()));
        }
        return nonCancellationPropagating;
    }

    /* renamed from: lambda$openCaptureSession$0$androidx-camera-camera2-internal-SynchronizedCaptureSessionImpl, reason: not valid java name */
    /* synthetic */ ListenableFuture m96xe055f2f(CameraDevice cameraDevice, SessionConfigurationCompat sessionConfigurationCompat, List deferrableSurfaces, List v) throws Exception {
        if (this.mSessionResetPolicy.needAbortCapture()) {
            closeCreatedSession();
        }
        debugLog("start openCaptureSession");
        return super.openCaptureSession(cameraDevice, sessionConfigurationCompat, deferrableSurfaces);
    }

    private void closeCreatedSession() {
        List<SynchronizedCaptureSession> sessions = this.mCaptureSessionRepository.getCaptureSessions();
        for (SynchronizedCaptureSession session : sessions) {
            session.close();
        }
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSessionBaseImpl, androidx.camera.camera2.internal.SynchronizedCaptureSession
    public ListenableFuture<Void> getOpeningBlocker() {
        return Futures.makeTimeoutFuture(1500L, this.mScheduledExecutorService, this.mRequestMonitor.getRequestsProcessedFuture());
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSessionBaseImpl, androidx.camera.camera2.internal.SynchronizedCaptureSession.Opener
    public ListenableFuture<List<Surface>> startWithDeferrableSurface(List<DeferrableSurface> deferrableSurfaces, long timeout) {
        ListenableFuture<List<Surface>> startWithDeferrableSurface;
        synchronized (this.mObjectLock) {
            this.mDeferrableSurfaces = deferrableSurfaces;
            startWithDeferrableSurface = super.startWithDeferrableSurface(deferrableSurfaces, timeout);
        }
        return startWithDeferrableSurface;
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSessionBaseImpl, androidx.camera.camera2.internal.SynchronizedCaptureSession.Opener
    public boolean stop() {
        boolean stop;
        synchronized (this.mObjectLock) {
            if (isCameraCaptureSessionOpen()) {
                this.mCloseSurfaceQuirk.onSessionEnd(this.mDeferrableSurfaces);
            } else if (this.mOpenSessionBlockerFuture != null) {
                this.mOpenSessionBlockerFuture.cancel(true);
            }
            stop = super.stop();
        }
        return stop;
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSessionBaseImpl, androidx.camera.camera2.internal.SynchronizedCaptureSession
    public int setSingleRepeatingRequest(CaptureRequest request, CameraCaptureSession.CaptureCallback listener) throws CameraAccessException {
        return super.setSingleRepeatingRequest(request, this.mRequestMonitor.createMonitorListener(listener));
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSessionBaseImpl, androidx.camera.camera2.internal.SynchronizedCaptureSession
    public int captureBurstRequests(List<CaptureRequest> requests, CameraCaptureSession.CaptureCallback listener) throws CameraAccessException {
        return super.captureBurstRequests(requests, this.mRequestMonitor.createMonitorListener(listener));
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSessionBaseImpl, androidx.camera.camera2.internal.SynchronizedCaptureSession.StateCallback
    public void onConfigured(SynchronizedCaptureSession session) {
        debugLog("Session onConfigured()");
        this.mForceCloseSessionQuirk.onSessionConfigured(session, this.mCaptureSessionRepository.getCreatingCaptureSessions(), this.mCaptureSessionRepository.getCaptureSessions(), new ForceCloseCaptureSession.OnConfigured() { // from class: androidx.camera.camera2.internal.SynchronizedCaptureSessionImpl$$ExternalSyntheticLambda0
            @Override // androidx.camera.camera2.internal.compat.workaround.ForceCloseCaptureSession.OnConfigured
            public final void run(SynchronizedCaptureSession synchronizedCaptureSession) {
                SynchronizedCaptureSessionImpl.this.m95xa3e3cc53(synchronizedCaptureSession);
            }
        });
    }

    /* renamed from: lambda$onConfigured$1$androidx-camera-camera2-internal-SynchronizedCaptureSessionImpl, reason: not valid java name */
    /* synthetic */ void m95xa3e3cc53(SynchronizedCaptureSession x$0) {
        super.onConfigured(x$0);
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSessionBaseImpl, androidx.camera.camera2.internal.SynchronizedCaptureSession
    public void close() {
        if (!this.mClosed.compareAndSet(false, true)) {
            debugLog("close() has been called. Skip this invocation.");
            return;
        }
        if (this.mSessionResetPolicy.needAbortCapture()) {
            try {
                debugLog("Call abortCaptures() before closing session.");
                abortCaptures();
            } catch (Exception e) {
                debugLog("Exception when calling abortCaptures()" + e);
            }
        }
        debugLog("Session call close()");
        this.mRequestMonitor.getRequestsProcessedFuture().addListener(new Runnable() { // from class: androidx.camera.camera2.internal.SynchronizedCaptureSessionImpl$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                SynchronizedCaptureSessionImpl.this.m94xfa0843b5();
            }
        }, getExecutor());
    }

    /* renamed from: lambda$close$2$androidx-camera-camera2-internal-SynchronizedCaptureSessionImpl, reason: not valid java name */
    /* synthetic */ void m94xfa0843b5() {
        debugLog("Session call super.close()");
        super.close();
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSessionBaseImpl, androidx.camera.camera2.internal.SynchronizedCaptureSession.StateCallback
    public void onClosed(SynchronizedCaptureSession session) {
        synchronized (this.mObjectLock) {
            this.mCloseSurfaceQuirk.onSessionEnd(this.mDeferrableSurfaces);
        }
        debugLog("onClosed()");
        super.onClosed(session);
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSessionBaseImpl, androidx.camera.camera2.internal.SynchronizedCaptureSession
    public void finishClose() {
        super.finishClose();
        this.mRequestMonitor.stop();
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSessionBaseImpl, androidx.camera.camera2.internal.SynchronizedCaptureSession
    public void onCameraDeviceError(int error) {
        super.onCameraDeviceError(error);
        if (error == 5) {
            synchronized (this.mObjectLock) {
                if (isCameraCaptureSessionOpen() && this.mDeferrableSurfaces != null) {
                    debugLog("Close DeferrableSurfaces for CameraDevice error.");
                    for (DeferrableSurface deferrableSurface : this.mDeferrableSurfaces) {
                        deferrableSurface.close();
                    }
                }
            }
        }
    }

    void debugLog(String message) {
        Logger.d(TAG, "[" + this + "] " + message);
    }
}
