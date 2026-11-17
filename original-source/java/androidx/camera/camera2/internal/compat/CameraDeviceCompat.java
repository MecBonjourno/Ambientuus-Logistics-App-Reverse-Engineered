package androidx.camera.camera2.internal.compat;

import android.hardware.camera2.CameraDevice;
import android.os.Build;
import android.os.Handler;
import androidx.camera.camera2.internal.compat.CameraDeviceCompat;
import androidx.camera.camera2.internal.compat.params.SessionConfigurationCompat;
import androidx.camera.core.impl.utils.MainThreadAsyncHandler;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public final class CameraDeviceCompat {
    public static final int SESSION_OPERATION_MODE_CONSTRAINED_HIGH_SPEED = 1;
    public static final int SESSION_OPERATION_MODE_NORMAL = 0;
    private final CameraDeviceCompatImpl mImpl;

    interface CameraDeviceCompatImpl {
        void createCaptureSession(SessionConfigurationCompat sessionConfigurationCompat) throws CameraAccessExceptionCompat;

        CameraDevice unwrap();
    }

    private CameraDeviceCompat(CameraDevice cameraDevice, Handler compatHandler) {
        if (Build.VERSION.SDK_INT >= 28) {
            this.mImpl = new CameraDeviceCompatApi28Impl(cameraDevice);
        } else if (Build.VERSION.SDK_INT >= 24) {
            this.mImpl = CameraDeviceCompatApi24Impl.create(cameraDevice, compatHandler);
        } else {
            this.mImpl = CameraDeviceCompatApi23Impl.create(cameraDevice, compatHandler);
        }
    }

    public static CameraDeviceCompat toCameraDeviceCompat(CameraDevice captureSession) {
        return toCameraDeviceCompat(captureSession, MainThreadAsyncHandler.getInstance());
    }

    public static CameraDeviceCompat toCameraDeviceCompat(CameraDevice cameraDevice, Handler compatHandler) {
        return new CameraDeviceCompat(cameraDevice, compatHandler);
    }

    public CameraDevice toCameraDevice() {
        return this.mImpl.unwrap();
    }

    public void createCaptureSession(SessionConfigurationCompat config) throws CameraAccessExceptionCompat {
        this.mImpl.createCaptureSession(config);
    }

    static final class StateCallbackExecutorWrapper extends CameraDevice.StateCallback {
        private final Executor mExecutor;
        final CameraDevice.StateCallback mWrappedCallback;

        StateCallbackExecutorWrapper(Executor executor, CameraDevice.StateCallback wrappedCallback) {
            this.mExecutor = executor;
            this.mWrappedCallback = wrappedCallback;
        }

        /* renamed from: lambda$onOpened$0$androidx-camera-camera2-internal-compat-CameraDeviceCompat$StateCallbackExecutorWrapper, reason: not valid java name */
        /* synthetic */ void m125xbd558edf(CameraDevice camera) {
            this.mWrappedCallback.onOpened(camera);
        }

        @Override // android.hardware.camera2.CameraDevice.StateCallback
        public void onOpened(final CameraDevice camera) {
            this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.compat.CameraDeviceCompat$StateCallbackExecutorWrapper$$ExternalSyntheticLambda3
                @Override // java.lang.Runnable
                public final void run() {
                    CameraDeviceCompat.StateCallbackExecutorWrapper.this.m125xbd558edf(camera);
                }
            });
        }

        /* renamed from: lambda$onDisconnected$1$androidx-camera-camera2-internal-compat-CameraDeviceCompat$StateCallbackExecutorWrapper, reason: not valid java name */
        /* synthetic */ void m123xc1093a32(CameraDevice camera) {
            this.mWrappedCallback.onDisconnected(camera);
        }

        @Override // android.hardware.camera2.CameraDevice.StateCallback
        public void onDisconnected(final CameraDevice camera) {
            this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.compat.CameraDeviceCompat$StateCallbackExecutorWrapper$$ExternalSyntheticLambda2
                @Override // java.lang.Runnable
                public final void run() {
                    CameraDeviceCompat.StateCallbackExecutorWrapper.this.m123xc1093a32(camera);
                }
            });
        }

        /* renamed from: lambda$onError$2$androidx-camera-camera2-internal-compat-CameraDeviceCompat$StateCallbackExecutorWrapper, reason: not valid java name */
        /* synthetic */ void m124x48d74a48(CameraDevice camera, int error) {
            this.mWrappedCallback.onError(camera, error);
        }

        @Override // android.hardware.camera2.CameraDevice.StateCallback
        public void onError(final CameraDevice camera, final int error) {
            this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.compat.CameraDeviceCompat$StateCallbackExecutorWrapper$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    CameraDeviceCompat.StateCallbackExecutorWrapper.this.m124x48d74a48(camera, error);
                }
            });
        }

        /* renamed from: lambda$onClosed$3$androidx-camera-camera2-internal-compat-CameraDeviceCompat$StateCallbackExecutorWrapper, reason: not valid java name */
        /* synthetic */ void m122xeb195125(CameraDevice camera) {
            this.mWrappedCallback.onClosed(camera);
        }

        @Override // android.hardware.camera2.CameraDevice.StateCallback
        public void onClosed(final CameraDevice camera) {
            this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.compat.CameraDeviceCompat$StateCallbackExecutorWrapper$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    CameraDeviceCompat.StateCallbackExecutorWrapper.this.m122xeb195125(camera);
                }
            });
        }
    }
}
