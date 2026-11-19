package androidx.camera.camera2.internal;

import android.graphics.Rect;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.TotalCaptureResult;
import android.os.Build;
import android.os.Looper;
import android.util.Range;
import androidx.camera.camera2.impl.Camera2ImplConfig;
import androidx.camera.camera2.internal.Camera2CameraControlImpl;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.core.CameraControl;
import androidx.camera.core.Logger;
import androidx.camera.core.ZoomState;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.core.internal.ImmutableZoomState;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.concurrent.Executor;

/* carregado de: classes.dex */
final class ZoomControl {
    public static final float DEFAULT_ZOOM_RATIO = 1.0f;
    private static final String TAG = "ZoomControl";
    private final Camera2CameraControlImpl mCamera2CameraControlImpl;
    private final ZoomStateImpl mCurrentZoomState;
    private final Executor mExecutor;
    final ZoomImpl mZoomImpl;
    private final MutableLiveData<ZoomState> mZoomStateLiveData;
    private boolean mIsActive = false;
    private Camera2CameraControlImpl.CaptureResultListener mCaptureResultListener = new Camera2CameraControlImpl.CaptureResultListener() { // da classe: androidx.camera.camera2.internal.ZoomControl.1
        @Override // androidx.camera.camera2.internal.Camera2CameraControlImpl.CaptureResultListener
        public boolean onCaptureResult(TotalCaptureResult captureResult) {
            ZoomControl.this.mZoomImpl.onCaptureResult(captureResult);
            return false;
        }
    };

    interface ZoomImpl {
        void addRequestOption(Camera2ImplConfig.Builder builder);

        Rect getCropSensorRegion();

        float getMaxZoom();

        float getMinZoom();

        void onCaptureResult(TotalCaptureResult totalCaptureResult);

        void resetZoom();

        void setZoomRatio(float f, CallbackToFutureAdapter.Completer<Void> completer);
    }

    ZoomControl(Camera2CameraControlImpl camera2CameraControlImpl, CameraCharacteristicsCompat cameraCharacteristics, Executor executor) {
        this.mCamera2CameraControlImpl = camera2CameraControlImpl;
        this.mExecutor = executor;
        this.mZoomImpl = createZoomImpl(cameraCharacteristics);
        this.mCurrentZoomState = new ZoomStateImpl(this.mZoomImpl.getMaxZoom(), this.mZoomImpl.getMinZoom());
        this.mCurrentZoomState.setZoomRatio(1.0f);
        this.mZoomStateLiveData = new MutableLiveData<>(ImmutableZoomState.create(this.mCurrentZoomState));
        camera2CameraControlImpl.addCaptureResultListener(this.mCaptureResultListener);
    }

    static ZoomState getDefaultZoomState(CameraCharacteristicsCompat cameraCharacteristics) {
        ZoomImpl zoomImpl = createZoomImpl(cameraCharacteristics);
        ZoomStateImpl zoomState = new ZoomStateImpl(zoomImpl.getMaxZoom(), zoomImpl.getMinZoom());
        zoomState.setZoomRatio(1.0f);
        return ImmutableZoomState.create(zoomState);
    }

    private static ZoomImpl createZoomImpl(CameraCharacteristicsCompat cameraCharacteristics) {
        if (isAndroidRZoomSupported(cameraCharacteristics)) {
            return new AndroidRZoomImpl(cameraCharacteristics);
        }
        return new CropRegionZoomImpl(cameraCharacteristics);
    }

    static boolean isAndroidRZoomSupported(CameraCharacteristicsCompat cameraCharacteristics) {
        return Build.VERSION.SDK_INT >= 30 && getZoomRatioRange(cameraCharacteristics) != null;
    }

    private static Range<Float> getZoomRatioRange(CameraCharacteristicsCompat cameraCharacteristics) {
        try {
            return (Range) cameraCharacteristics.get(CameraCharacteristics.CONTROL_ZOOM_RATIO_RANGE);
        } catch (AssertionError e) {
            Logger.w(TAG, "AssertionError, fail to get camera characteristic.", e);
            return null;
        }
    }

    void addZoomOption(Camera2ImplConfig.Builder builder) {
        this.mZoomImpl.addRequestOption(builder);
    }

    Rect getCropSensorRegion() {
        return this.mZoomImpl.getCropSensorRegion();
    }

    void setActive(boolean isActive) {
        ZoomState zoomState;
        if (this.mIsActive == isActive) {
            return;
        }
        this.mIsActive = isActive;
        if (!this.mIsActive) {
            synchronized (this.mCurrentZoomState) {
                this.mCurrentZoomState.setZoomRatio(1.0f);
                zoomState = ImmutableZoomState.create(this.mCurrentZoomState);
            }
            updateLiveData(zoomState);
            this.mZoomImpl.resetZoom();
            this.mCamera2CameraControlImpl.updateSessionConfigSynchronous();
        }
    }

    ListenableFuture<Void> setZoomRatio(float ratio) {
        final ZoomState zoomState;
        synchronized (this.mCurrentZoomState) {
            try {
                this.mCurrentZoomState.setZoomRatio(ratio);
                zoomState = ImmutableZoomState.create(this.mCurrentZoomState);
            } catch (IllegalArgumentException e) {
                return Futures.immediateFailedFuture(e);
            }
        }
        updateLiveData(zoomState);
        return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.camera2.internal.ZoomControl$$ExternalSyntheticLambda0
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return ZoomControl.this.m106xc6d8bfa2(zoomState, completer);
            }
        });
    }

    /* renomeado de: lambda$setZoomRatio$1$androidx-camera-camera2-internal-ZoomControl, motivo: nome Java inválido */
    /* sintético */ Object m106xc6d8bfa2(final ZoomState zoomState, final CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.ZoomControl$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                ZoomControl.this.m105xd613203(completer, zoomState);
            }
        });
        return "setZoomRatio";
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    /* renomeado de: submitCameraZoomRatio, motivo: mesclado com método bridge [métodos inline] e mesclado com método bridge [métodos inline] */
    public void m105xd613203(CallbackToFutureAdapter.Completer<Void> completer, ZoomState zoomState) {
        ZoomState zoomState2;
        if (!this.mIsActive) {
            synchronized (this.mCurrentZoomState) {
                this.mCurrentZoomState.setZoomRatio(1.0f);
                zoomState2 = ImmutableZoomState.create(this.mCurrentZoomState);
            }
            updateLiveData(zoomState2);
            completer.setException(new CameraControl.OperationCanceledException("Camera is not active."));
            return;
        }
        this.mZoomImpl.setZoomRatio(zoomState.getZoomRatio(), completer);
        this.mCamera2CameraControlImpl.updateSessionConfigSynchronous();
    }

    ListenableFuture<Void> setLinearZoom(float linearZoom) {
        final ZoomState zoomState;
        synchronized (this.mCurrentZoomState) {
            try {
                this.mCurrentZoomState.setLinearZoom(linearZoom);
                zoomState = ImmutableZoomState.create(this.mCurrentZoomState);
            } catch (IllegalArgumentException e) {
                return Futures.immediateFailedFuture(e);
            }
        }
        updateLiveData(zoomState);
        return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.camera2.internal.ZoomControl$$ExternalSyntheticLambda3
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return ZoomControl.this.m104x9f268096(zoomState, completer);
            }
        });
    }

    /* renomeado de: lambda$setLinearZoom$3$androidx-camera-camera2-internal-ZoomControl, motivo: nome Java inválido */
    /* sintético */ Object m104x9f268096(final ZoomState zoomState, final CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.ZoomControl$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                ZoomControl.this.m103xe5aef2f7(completer, zoomState);
            }
        });
        return "setLinearZoom";
    }

    private void updateLiveData(ZoomState zoomState) {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            this.mZoomStateLiveData.setValue(zoomState);
        } else {
            this.mZoomStateLiveData.postValue(zoomState);
        }
    }

    LiveData<ZoomState> getZoomState() {
        return this.mZoomStateLiveData;
    }
}
