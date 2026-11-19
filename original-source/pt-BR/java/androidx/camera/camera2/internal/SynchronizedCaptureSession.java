package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CaptureRequest;
import android.os.Handler;
import android.view.Surface;
import androidx.camera.camera2.internal.compat.CameraCaptureSessionCompat;
import androidx.camera.camera2.internal.compat.params.OutputConfigurationCompat;
import androidx.camera.camera2.internal.compat.params.SessionConfigurationCompat;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.Quirks;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;

/* carregado de: classes.dex */
public interface SynchronizedCaptureSession {

    public interface Opener {
        SessionConfigurationCompat createSessionConfigurationCompat(int i, List<OutputConfigurationCompat> list, StateCallback stateCallback);

        Executor getExecutor();

        ListenableFuture<Void> openCaptureSession(CameraDevice cameraDevice, SessionConfigurationCompat sessionConfigurationCompat, List<DeferrableSurface> list);

        ListenableFuture<List<Surface>> startWithDeferrableSurface(List<DeferrableSurface> list, long j);

        boolean stop();
    }

    void abortCaptures() throws CameraAccessException;

    int captureBurstRequests(List<CaptureRequest> list, CameraCaptureSession.CaptureCallback captureCallback) throws CameraAccessException;

    int captureBurstRequests(List<CaptureRequest> list, Executor executor, CameraCaptureSession.CaptureCallback captureCallback) throws CameraAccessException;

    int captureSingleRequest(CaptureRequest captureRequest, CameraCaptureSession.CaptureCallback captureCallback) throws CameraAccessException;

    int captureSingleRequest(CaptureRequest captureRequest, Executor executor, CameraCaptureSession.CaptureCallback captureCallback) throws CameraAccessException;

    void close();

    List<CaptureRequest> createHighSpeedRequestList(CaptureRequest captureRequest) throws CameraAccessException;

    void finishClose();

    CameraDevice getDevice();

    Surface getInputSurface();

    ListenableFuture<Void> getOpeningBlocker();

    StateCallback getStateCallback();

    void onCameraDeviceError(int i);

    int setRepeatingBurstRequests(List<CaptureRequest> list, CameraCaptureSession.CaptureCallback captureCallback) throws CameraAccessException;

    int setRepeatingBurstRequests(List<CaptureRequest> list, Executor executor, CameraCaptureSession.CaptureCallback captureCallback) throws CameraAccessException;

    int setSingleRepeatingRequest(CaptureRequest captureRequest, CameraCaptureSession.CaptureCallback captureCallback) throws CameraAccessException;

    int setSingleRepeatingRequest(CaptureRequest captureRequest, Executor executor, CameraCaptureSession.CaptureCallback captureCallback) throws CameraAccessException;

    void stopRepeating() throws CameraAccessException;

    CameraCaptureSessionCompat toCameraCaptureSessionCompat();

    public static abstract class StateCallback {
        void onReady(SynchronizedCaptureSession session) {
        }

        void onActive(SynchronizedCaptureSession session) {
        }

        void onCaptureQueueEmpty(SynchronizedCaptureSession session) {
        }

        void onSurfacePrepared(SynchronizedCaptureSession session, Surface surface) {
        }

        void onConfigured(SynchronizedCaptureSession session) {
        }

        public void onConfigureFailed(SynchronizedCaptureSession session) {
        }

        public void onClosed(SynchronizedCaptureSession session) {
        }

        void onSessionFinished(SynchronizedCaptureSession session) {
        }
    }

    public static class OpenerBuilder {
        private final Quirks mCameraQuirks;
        private final CaptureSessionRepository mCaptureSessionRepository;
        private final Handler mCompatHandler;
        private final Quirks mDeviceQuirks;
        private final Executor mExecutor;
        private final ScheduledExecutorService mScheduledExecutorService;

        OpenerBuilder(Executor executor, ScheduledExecutorService scheduledExecutorService, Handler compatHandler, CaptureSessionRepository captureSessionRepository, Quirks cameraQuirks, Quirks deviceQuirks) {
            this.mExecutor = executor;
            this.mScheduledExecutorService = scheduledExecutorService;
            this.mCompatHandler = compatHandler;
            this.mCaptureSessionRepository = captureSessionRepository;
            this.mCameraQuirks = cameraQuirks;
            this.mDeviceQuirks = deviceQuirks;
        }

        Opener build() {
            return new SynchronizedCaptureSessionImpl(this.mCameraQuirks, this.mDeviceQuirks, this.mCaptureSessionRepository, this.mExecutor, this.mScheduledExecutorService, this.mCompatHandler);
        }
    }
}
