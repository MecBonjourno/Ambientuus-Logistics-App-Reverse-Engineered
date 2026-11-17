package androidx.camera.camera2.internal.compat;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CaptureFailure;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.TotalCaptureResult;
import android.os.Build;
import android.os.Handler;
import android.view.Surface;
import androidx.camera.camera2.internal.compat.ApiCompat;
import androidx.camera.camera2.internal.compat.CameraCaptureSessionCompat;
import androidx.camera.core.impl.utils.MainThreadAsyncHandler;
import java.util.List;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public final class CameraCaptureSessionCompat {
    private final CameraCaptureSessionCompatImpl mImpl;

    interface CameraCaptureSessionCompatImpl {
        int captureBurstRequests(List<CaptureRequest> list, Executor executor, CameraCaptureSession.CaptureCallback captureCallback) throws CameraAccessException;

        int captureSingleRequest(CaptureRequest captureRequest, Executor executor, CameraCaptureSession.CaptureCallback captureCallback) throws CameraAccessException;

        int setRepeatingBurstRequests(List<CaptureRequest> list, Executor executor, CameraCaptureSession.CaptureCallback captureCallback) throws CameraAccessException;

        int setSingleRepeatingRequest(CaptureRequest captureRequest, Executor executor, CameraCaptureSession.CaptureCallback captureCallback) throws CameraAccessException;

        CameraCaptureSession unwrap();
    }

    private CameraCaptureSessionCompat(CameraCaptureSession captureSession, Handler compatHandler) {
        if (Build.VERSION.SDK_INT >= 28) {
            this.mImpl = new CameraCaptureSessionCompatApi28Impl(captureSession);
        } else {
            this.mImpl = CameraCaptureSessionCompatBaseImpl.create(captureSession, compatHandler);
        }
    }

    public static CameraCaptureSessionCompat toCameraCaptureSessionCompat(CameraCaptureSession captureSession) {
        return toCameraCaptureSessionCompat(captureSession, MainThreadAsyncHandler.getInstance());
    }

    public static CameraCaptureSessionCompat toCameraCaptureSessionCompat(CameraCaptureSession captureSession, Handler compatHandler) {
        return new CameraCaptureSessionCompat(captureSession, compatHandler);
    }

    public CameraCaptureSession toCameraCaptureSession() {
        return this.mImpl.unwrap();
    }

    public int captureBurstRequests(List<CaptureRequest> requests, Executor executor, CameraCaptureSession.CaptureCallback listener) throws CameraAccessException {
        return this.mImpl.captureBurstRequests(requests, executor, listener);
    }

    public int captureSingleRequest(CaptureRequest request, Executor executor, CameraCaptureSession.CaptureCallback listener) throws CameraAccessException {
        return this.mImpl.captureSingleRequest(request, executor, listener);
    }

    public int setRepeatingBurstRequests(List<CaptureRequest> requests, Executor executor, CameraCaptureSession.CaptureCallback listener) throws CameraAccessException {
        return this.mImpl.setRepeatingBurstRequests(requests, executor, listener);
    }

    public int setSingleRepeatingRequest(CaptureRequest request, Executor executor, CameraCaptureSession.CaptureCallback listener) throws CameraAccessException {
        return this.mImpl.setSingleRepeatingRequest(request, executor, listener);
    }

    static final class CaptureCallbackExecutorWrapper extends CameraCaptureSession.CaptureCallback {
        private final Executor mExecutor;
        final CameraCaptureSession.CaptureCallback mWrappedCallback;

        CaptureCallbackExecutorWrapper(Executor executor, CameraCaptureSession.CaptureCallback wrappedCallback) {
            this.mExecutor = executor;
            this.mWrappedCallback = wrappedCallback;
        }

        /* renamed from: lambda$onCaptureStarted$0$androidx-camera-camera2-internal-compat-CameraCaptureSessionCompat$CaptureCallbackExecutorWrapper, reason: not valid java name */
        /* synthetic */ void m114x20bcad62(CameraCaptureSession session, CaptureRequest request, long timestamp, long frameNumber) {
            this.mWrappedCallback.onCaptureStarted(session, request, timestamp, frameNumber);
        }

        @Override // android.hardware.camera2.CameraCaptureSession.CaptureCallback
        public void onCaptureStarted(final CameraCaptureSession session, final CaptureRequest request, final long timestamp, final long frameNumber) {
            this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.compat.CameraCaptureSessionCompat$CaptureCallbackExecutorWrapper$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    CameraCaptureSessionCompat.CaptureCallbackExecutorWrapper.this.m114x20bcad62(session, request, timestamp, frameNumber);
                }
            });
        }

        @Override // android.hardware.camera2.CameraCaptureSession.CaptureCallback
        public void onCaptureProgressed(final CameraCaptureSession session, final CaptureRequest request, final CaptureResult partialResult) {
            this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.compat.CameraCaptureSessionCompat$CaptureCallbackExecutorWrapper$$ExternalSyntheticLambda2
                @Override // java.lang.Runnable
                public final void run() {
                    CameraCaptureSessionCompat.CaptureCallbackExecutorWrapper.this.m111x235a7742(session, request, partialResult);
                }
            });
        }

        /* renamed from: lambda$onCaptureProgressed$1$androidx-camera-camera2-internal-compat-CameraCaptureSessionCompat$CaptureCallbackExecutorWrapper, reason: not valid java name */
        /* synthetic */ void m111x235a7742(CameraCaptureSession session, CaptureRequest request, CaptureResult partialResult) {
            this.mWrappedCallback.onCaptureProgressed(session, request, partialResult);
        }

        /* renamed from: lambda$onCaptureCompleted$2$androidx-camera-camera2-internal-compat-CameraCaptureSessionCompat$CaptureCallbackExecutorWrapper, reason: not valid java name */
        /* synthetic */ void m109x5547c82e(CameraCaptureSession session, CaptureRequest request, TotalCaptureResult result) {
            this.mWrappedCallback.onCaptureCompleted(session, request, result);
        }

        @Override // android.hardware.camera2.CameraCaptureSession.CaptureCallback
        public void onCaptureCompleted(final CameraCaptureSession session, final CaptureRequest request, final TotalCaptureResult result) {
            this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.compat.CameraCaptureSessionCompat$CaptureCallbackExecutorWrapper$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    CameraCaptureSessionCompat.CaptureCallbackExecutorWrapper.this.m109x5547c82e(session, request, result);
                }
            });
        }

        /* renamed from: lambda$onCaptureFailed$3$androidx-camera-camera2-internal-compat-CameraCaptureSessionCompat$CaptureCallbackExecutorWrapper, reason: not valid java name */
        /* synthetic */ void m110x9eff7bf5(CameraCaptureSession session, CaptureRequest request, CaptureFailure failure) {
            this.mWrappedCallback.onCaptureFailed(session, request, failure);
        }

        @Override // android.hardware.camera2.CameraCaptureSession.CaptureCallback
        public void onCaptureFailed(final CameraCaptureSession session, final CaptureRequest request, final CaptureFailure failure) {
            this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.compat.CameraCaptureSessionCompat$CaptureCallbackExecutorWrapper$$ExternalSyntheticLambda4
                @Override // java.lang.Runnable
                public final void run() {
                    CameraCaptureSessionCompat.CaptureCallbackExecutorWrapper.this.m110x9eff7bf5(session, request, failure);
                }
            });
        }

        /* renamed from: lambda$onCaptureSequenceCompleted$4$androidx-camera-camera2-internal-compat-CameraCaptureSessionCompat$CaptureCallbackExecutorWrapper, reason: not valid java name */
        /* synthetic */ void m113xdc32676f(CameraCaptureSession session, int sequenceId, long frameNumber) {
            this.mWrappedCallback.onCaptureSequenceCompleted(session, sequenceId, frameNumber);
        }

        @Override // android.hardware.camera2.CameraCaptureSession.CaptureCallback
        public void onCaptureSequenceCompleted(final CameraCaptureSession session, final int sequenceId, final long frameNumber) {
            this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.compat.CameraCaptureSessionCompat$CaptureCallbackExecutorWrapper$$ExternalSyntheticLambda3
                @Override // java.lang.Runnable
                public final void run() {
                    CameraCaptureSessionCompat.CaptureCallbackExecutorWrapper.this.m113xdc32676f(session, sequenceId, frameNumber);
                }
            });
        }

        /* renamed from: lambda$onCaptureSequenceAborted$5$androidx-camera-camera2-internal-compat-CameraCaptureSessionCompat$CaptureCallbackExecutorWrapper, reason: not valid java name */
        /* synthetic */ void m112x678e3bf4(CameraCaptureSession session, int sequenceId) {
            this.mWrappedCallback.onCaptureSequenceAborted(session, sequenceId);
        }

        @Override // android.hardware.camera2.CameraCaptureSession.CaptureCallback
        public void onCaptureSequenceAborted(final CameraCaptureSession session, final int sequenceId) {
            this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.compat.CameraCaptureSessionCompat$CaptureCallbackExecutorWrapper$$ExternalSyntheticLambda6
                @Override // java.lang.Runnable
                public final void run() {
                    CameraCaptureSessionCompat.CaptureCallbackExecutorWrapper.this.m112x678e3bf4(session, sequenceId);
                }
            });
        }

        @Override // android.hardware.camera2.CameraCaptureSession.CaptureCallback
        public void onCaptureBufferLost(final CameraCaptureSession session, final CaptureRequest request, final Surface target, final long frameNumber) {
            this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.compat.CameraCaptureSessionCompat$CaptureCallbackExecutorWrapper$$ExternalSyntheticLambda5
                @Override // java.lang.Runnable
                public final void run() {
                    CameraCaptureSessionCompat.CaptureCallbackExecutorWrapper.this.m108x7355e9ff(session, request, target, frameNumber);
                }
            });
        }

        /* renamed from: lambda$onCaptureBufferLost$6$androidx-camera-camera2-internal-compat-CameraCaptureSessionCompat$CaptureCallbackExecutorWrapper, reason: not valid java name */
        /* synthetic */ void m108x7355e9ff(CameraCaptureSession session, CaptureRequest request, Surface target, long frameNumber) {
            ApiCompat.Api24Impl.onCaptureBufferLost(this.mWrappedCallback, session, request, target, frameNumber);
        }
    }

    static final class StateCallbackExecutorWrapper extends CameraCaptureSession.StateCallback {
        private final Executor mExecutor;
        final CameraCaptureSession.StateCallback mWrappedCallback;

        StateCallbackExecutorWrapper(Executor executor, CameraCaptureSession.StateCallback wrappedCallback) {
            this.mExecutor = executor;
            this.mWrappedCallback = wrappedCallback;
        }

        /* renamed from: lambda$onConfigured$0$androidx-camera-camera2-internal-compat-CameraCaptureSessionCompat$StateCallbackExecutorWrapper, reason: not valid java name */
        /* synthetic */ void m119x7737ac1a(CameraCaptureSession session) {
            this.mWrappedCallback.onConfigured(session);
        }

        @Override // android.hardware.camera2.CameraCaptureSession.StateCallback
        public void onConfigured(final CameraCaptureSession session) {
            this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.compat.CameraCaptureSessionCompat$StateCallbackExecutorWrapper$$ExternalSyntheticLambda4
                @Override // java.lang.Runnable
                public final void run() {
                    CameraCaptureSessionCompat.StateCallbackExecutorWrapper.this.m119x7737ac1a(session);
                }
            });
        }

        /* renamed from: lambda$onConfigureFailed$1$androidx-camera-camera2-internal-compat-CameraCaptureSessionCompat$StateCallbackExecutorWrapper, reason: not valid java name */
        /* synthetic */ void m118x3ead74e8(CameraCaptureSession session) {
            this.mWrappedCallback.onConfigureFailed(session);
        }

        @Override // android.hardware.camera2.CameraCaptureSession.StateCallback
        public void onConfigureFailed(final CameraCaptureSession session) {
            this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.compat.CameraCaptureSessionCompat$StateCallbackExecutorWrapper$$ExternalSyntheticLambda6
                @Override // java.lang.Runnable
                public final void run() {
                    CameraCaptureSessionCompat.StateCallbackExecutorWrapper.this.m118x3ead74e8(session);
                }
            });
        }

        /* renamed from: lambda$onReady$2$androidx-camera-camera2-internal-compat-CameraCaptureSessionCompat$StateCallbackExecutorWrapper, reason: not valid java name */
        /* synthetic */ void m120xb90000c9(CameraCaptureSession session) {
            this.mWrappedCallback.onReady(session);
        }

        @Override // android.hardware.camera2.CameraCaptureSession.StateCallback
        public void onReady(final CameraCaptureSession session) {
            this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.compat.CameraCaptureSessionCompat$StateCallbackExecutorWrapper$$ExternalSyntheticLambda5
                @Override // java.lang.Runnable
                public final void run() {
                    CameraCaptureSessionCompat.StateCallbackExecutorWrapper.this.m120xb90000c9(session);
                }
            });
        }

        /* renamed from: lambda$onActive$3$androidx-camera-camera2-internal-compat-CameraCaptureSessionCompat$StateCallbackExecutorWrapper, reason: not valid java name */
        /* synthetic */ void m115x7248b8e5(CameraCaptureSession session) {
            this.mWrappedCallback.onActive(session);
        }

        @Override // android.hardware.camera2.CameraCaptureSession.StateCallback
        public void onActive(final CameraCaptureSession session) {
            this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.compat.CameraCaptureSessionCompat$StateCallbackExecutorWrapper$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    CameraCaptureSessionCompat.StateCallbackExecutorWrapper.this.m115x7248b8e5(session);
                }
            });
        }

        @Override // android.hardware.camera2.CameraCaptureSession.StateCallback
        public void onCaptureQueueEmpty(final CameraCaptureSession session) {
            this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.compat.CameraCaptureSessionCompat$StateCallbackExecutorWrapper$$ExternalSyntheticLambda3
                @Override // java.lang.Runnable
                public final void run() {
                    CameraCaptureSessionCompat.StateCallbackExecutorWrapper.this.m116xe6e3b40a(session);
                }
            });
        }

        /* renamed from: lambda$onCaptureQueueEmpty$4$androidx-camera-camera2-internal-compat-CameraCaptureSessionCompat$StateCallbackExecutorWrapper, reason: not valid java name */
        /* synthetic */ void m116xe6e3b40a(CameraCaptureSession session) {
            ApiCompat.Api26Impl.onCaptureQueueEmpty(this.mWrappedCallback, session);
        }

        /* renamed from: lambda$onClosed$5$androidx-camera-camera2-internal-compat-CameraCaptureSessionCompat$StateCallbackExecutorWrapper, reason: not valid java name */
        /* synthetic */ void m117xb3a739cd(CameraCaptureSession session) {
            this.mWrappedCallback.onClosed(session);
        }

        @Override // android.hardware.camera2.CameraCaptureSession.StateCallback
        public void onClosed(final CameraCaptureSession session) {
            this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.compat.CameraCaptureSessionCompat$StateCallbackExecutorWrapper$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    CameraCaptureSessionCompat.StateCallbackExecutorWrapper.this.m117xb3a739cd(session);
                }
            });
        }

        /* renamed from: lambda$onSurfacePrepared$6$androidx-camera-camera2-internal-compat-CameraCaptureSessionCompat$StateCallbackExecutorWrapper, reason: not valid java name */
        /* synthetic */ void m121x442ef874(CameraCaptureSession session, Surface surface) {
            ApiCompat.Api23Impl.onSurfacePrepared(this.mWrappedCallback, session, surface);
        }

        @Override // android.hardware.camera2.CameraCaptureSession.StateCallback
        public void onSurfacePrepared(final CameraCaptureSession session, final Surface surface) {
            this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.compat.CameraCaptureSessionCompat$StateCallbackExecutorWrapper$$ExternalSyntheticLambda2
                @Override // java.lang.Runnable
                public final void run() {
                    CameraCaptureSessionCompat.StateCallbackExecutorWrapper.this.m121x442ef874(session, surface);
                }
            });
        }
    }
}
