package androidx.camera.camera2.interop;

import androidx.camera.camera2.impl.Camera2ImplConfig;
import androidx.camera.camera2.internal.Camera2CameraControlImpl;
import androidx.camera.camera2.interop.CaptureRequestOptions;
import androidx.camera.core.CameraControl;
import androidx.camera.core.impl.CameraControlInternal;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.concurrent.Executor;

/* carregado de: classes.dex */
public final class Camera2CameraControl {
    private final Camera2CameraControlImpl mCamera2CameraControlImpl;
    CallbackToFutureAdapter.Completer<Void> mCompleter;
    final Executor mExecutor;
    private boolean mIsActive = false;
    private boolean mPendingUpdate = false;
    final Object mLock = new Object();
    private Camera2ImplConfig.Builder mBuilder = new Camera2ImplConfig.Builder();

    public Camera2CameraControl(Camera2CameraControlImpl camera2CameraControlImpl, Executor executor) {
        this.mCamera2CameraControlImpl = camera2CameraControlImpl;
        this.mExecutor = executor;
    }

    public static Camera2CameraControl from(CameraControl cameraControl) {
        CameraControlInternal cameraControlImpl = ((CameraControlInternal) cameraControl).getImplementation();
        Preconditions.checkArgument(cameraControlImpl instanceof Camera2CameraControlImpl, "CameraControl doesn't contain Camera2 implementation.");
        return ((Camera2CameraControlImpl) cameraControlImpl).getCamera2CameraControl();
    }

    public ListenableFuture<Void> setCaptureRequestOptions(CaptureRequestOptions bundle) {
        clearCaptureRequestOptionsInternal();
        addCaptureRequestOptionsInternal(bundle);
        return Futures.nonCancellationPropagating(CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.camera2.interop.Camera2CameraControl$$ExternalSyntheticLambda5
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return Camera2CameraControl.this.m139x121854a6(completer);
            }
        }));
    }

    /* renomeado de: lambda$setCaptureRequestOptions$1$androidx-camera-camera2-interop-Camera2CameraControl, motivo: nome Java inválido */
    /* sintético */ Object m139x121854a6(final CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.interop.Camera2CameraControl$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraControl.this.m138xf7fcd607(completer);
            }
        });
        return "setCaptureRequestOptions";
    }

    public ListenableFuture<Void> addCaptureRequestOptions(CaptureRequestOptions bundle) {
        addCaptureRequestOptionsInternal(bundle);
        return Futures.nonCancellationPropagating(CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.camera2.interop.Camera2CameraControl$$ExternalSyntheticLambda1
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return Camera2CameraControl.this.m134x9f862fa3(completer);
            }
        }));
    }

    /* renomeado de: lambda$addCaptureRequestOptions$3$androidx-camera-camera2-interop-Camera2CameraControl, motivo: nome Java inválido */
    /* sintético */ Object m134x9f862fa3(final CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.interop.Camera2CameraControl$$ExternalSyntheticLambda7
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraControl.this.m133x856ab104(completer);
            }
        });
        return "addCaptureRequestOptions";
    }

    public CaptureRequestOptions getCaptureRequestOptions() {
        CaptureRequestOptions build;
        synchronized (this.mLock) {
            build = CaptureRequestOptions.Builder.from(this.mBuilder.build()).build();
        }
        return build;
    }

    public ListenableFuture<Void> clearCaptureRequestOptions() {
        clearCaptureRequestOptionsInternal();
        return Futures.nonCancellationPropagating(CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.camera2.interop.Camera2CameraControl$$ExternalSyntheticLambda6
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return Camera2CameraControl.this.m136x5f672bcd(completer);
            }
        }));
    }

    /* renomeado de: lambda$clearCaptureRequestOptions$5$androidx-camera-camera2-interop-Camera2CameraControl, motivo: nome Java inválido */
    /* sintético */ Object m136x5f672bcd(final CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.interop.Camera2CameraControl$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraControl.this.m135x454bad2e(completer);
            }
        });
        return "clearCaptureRequestOptions";
    }

    public Camera2ImplConfig getCamera2ImplConfig() {
        Camera2ImplConfig build;
        synchronized (this.mLock) {
            build = this.mBuilder.build();
        }
        return build;
    }

    public void applyOptionsToBuilder(Camera2ImplConfig.Builder builder) {
        synchronized (this.mLock) {
            builder.insertAllOptions(this.mBuilder.getMutableConfig(), Config.OptionPriority.ALWAYS_OVERRIDE);
        }
    }

    private void addCaptureRequestOptionsInternal(CaptureRequestOptions bundle) {
        synchronized (this.mLock) {
            this.mBuilder.insertAllOptions(bundle);
        }
    }

    private void clearCaptureRequestOptionsInternal() {
        synchronized (this.mLock) {
            this.mBuilder = new Camera2ImplConfig.Builder();
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    /* renomeado de: updateConfig, motivo: mesclado com método bridge [métodos inline] e mesclado com método bridge [métodos inline] e mesclado com método bridge [métodos inline] */
    public void m138xf7fcd607(CallbackToFutureAdapter.Completer<Void> completer) {
        this.mPendingUpdate = true;
        failInFlightUpdate(new CameraControl.OperationCanceledException("Camera2CameraControl was updated with new options."));
        this.mCompleter = completer;
        if (this.mIsActive) {
            updateSession();
        }
    }

    private void updateSession() {
        this.mCamera2CameraControlImpl.updateSessionConfigAsync().addListener(new Runnable() { // da classe: androidx.camera.camera2.interop.Camera2CameraControl$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraControl.this.completeInFlightUpdate();
            }
        }, this.mExecutor);
        this.mPendingUpdate = false;
    }

    public void setActive(final boolean isActive) {
        this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.interop.Camera2CameraControl$$ExternalSyntheticLambda4
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraControl.this.m137xdc333ae6(isActive);
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    /* renomeado de: setActiveInternal, motivo: mesclado com método bridge [métodos inline] */
    public void m137xdc333ae6(boolean isActive) {
        if (this.mIsActive == isActive) {
            return;
        }
        this.mIsActive = isActive;
        if (this.mIsActive) {
            if (this.mPendingUpdate) {
                updateSession();
                return;
            }
            return;
        }
        failInFlightUpdate(new CameraControl.OperationCanceledException("The camera control has became inactive."));
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public void completeInFlightUpdate() {
        if (this.mCompleter != null) {
            this.mCompleter.set(null);
            this.mCompleter = null;
        }
    }

    private void failInFlightUpdate(Exception exception) {
        if (this.mCompleter != null) {
            this.mCompleter.setException(exception != null ? exception : new Exception("Camera2CameraControl failed with unknown error."));
            this.mCompleter = null;
        }
    }
}
