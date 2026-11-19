package androidx.camera.camera2.internal;

import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.TotalCaptureResult;
import android.os.Build;
import androidx.camera.camera2.internal.Camera2CameraControlImpl;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.camera2.internal.compat.workaround.FlashAvailabilityChecker;
import androidx.camera.core.CameraControl;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import com.google.common.util.concurrent.ListenableFuture;
import j$.util.Objects;
import java.util.concurrent.Executor;

/* carregado de: classes.dex */
final class TorchControl {
    static final int DEFAULT_TORCH_STATE = 0;
    static final int OFF = 0;
    static final int ON = 1;
    private static final String TAG = "TorchControl";
    static final int USED_AS_FLASH = 2;
    private final Camera2CameraControlImpl mCamera2CameraControlImpl;
    private int mDefaultTorchStrength;
    CallbackToFutureAdapter.Completer<Void> mEnableTorchCompleter;
    private final Executor mExecutor;
    private final boolean mHasFlashUnit;
    private boolean mIsActive;
    private boolean mIsTorchStrengthSupported;
    boolean mTargetTorchEnabled;
    private int mTargetTorchStrength;
    private final MutableLiveData<Integer> mTorchState;
    private final MutableLiveData<Integer> mTorchStrength;
    private CallbackToFutureAdapter.Completer<Void> mTorchStrengthCompleter;

    TorchControl(Camera2CameraControlImpl camera2CameraControlImpl, CameraCharacteristicsCompat cameraCharacteristics, Executor executor) {
        int i;
        this.mCamera2CameraControlImpl = camera2CameraControlImpl;
        this.mExecutor = executor;
        Objects.requireNonNull(cameraCharacteristics);
        this.mHasFlashUnit = FlashAvailabilityChecker.isFlashAvailable(new Camera2CameraInfoImpl$$ExternalSyntheticLambda0(cameraCharacteristics));
        this.mIsTorchStrengthSupported = cameraCharacteristics.isTorchStrengthLevelSupported();
        if (this.mHasFlashUnit && this.mIsTorchStrengthSupported) {
            i = cameraCharacteristics.getDefaultTorchStrengthLevel();
        } else {
            i = 0;
        }
        this.mDefaultTorchStrength = i;
        this.mTargetTorchStrength = this.mDefaultTorchStrength;
        this.mTorchState = new MutableLiveData<>(0);
        this.mTorchStrength = new MutableLiveData<>(Integer.valueOf(this.mDefaultTorchStrength));
        Camera2CameraControlImpl.CaptureResultListener captureResultListener = new Camera2CameraControlImpl.CaptureResultListener() { // da classe: androidx.camera.camera2.internal.TorchControl$$ExternalSyntheticLambda4
            @Override // androidx.camera.camera2.internal.Camera2CameraControlImpl.CaptureResultListener
            public final boolean onCaptureResult(TotalCaptureResult totalCaptureResult) {
                return TorchControl.this.m99lambda$new$0$androidxcameracamera2internalTorchControl(totalCaptureResult);
            }
        };
        this.mCamera2CameraControlImpl.addCaptureResultListener(captureResultListener);
    }

    /* renomeado de: lambda$new$0$androidx-camera-camera2-internal-TorchControl, motivo: nome Java inválido */
    /* sintético */ boolean m99lambda$new$0$androidxcameracamera2internalTorchControl(TotalCaptureResult captureResult) {
        Integer torchStrength;
        if (this.mEnableTorchCompleter != null) {
            CaptureRequest captureRequest = captureResult.getRequest();
            Integer flashMode = (Integer) captureRequest.get(CaptureRequest.FLASH_MODE);
            boolean torchEnabled = flashMode != null && flashMode.intValue() == 2;
            if (torchEnabled == this.mTargetTorchEnabled) {
                this.mEnableTorchCompleter.set(null);
                this.mEnableTorchCompleter = null;
            }
        }
        if (this.mIsTorchStrengthSupported && Build.VERSION.SDK_INT >= 35 && this.mTorchStrengthCompleter != null && (torchStrength = (Integer) captureResult.get(CaptureResult.FLASH_STRENGTH_LEVEL)) != null && torchStrength.intValue() == this.mTargetTorchStrength) {
            this.mTorchStrengthCompleter.set(null);
            this.mTorchStrengthCompleter = null;
        }
        return false;
    }

    void setActive(boolean isActive) {
        if (this.mIsActive == isActive) {
            return;
        }
        this.mIsActive = isActive;
        if (!isActive) {
            if (this.mTargetTorchEnabled) {
                this.mTargetTorchEnabled = false;
                this.mTargetTorchStrength = this.mDefaultTorchStrength;
                this.mCamera2CameraControlImpl.enableTorchInternal(0);
                setTorchState(0);
                setLiveDataValue(this.mTorchStrength, Integer.valueOf(this.mDefaultTorchStrength));
            }
            if (this.mEnableTorchCompleter != null) {
                this.mEnableTorchCompleter.setException(new CameraControl.OperationCanceledException("Camera is not active."));
                this.mEnableTorchCompleter = null;
            }
            if (this.mTorchStrengthCompleter != null) {
                this.mTorchStrengthCompleter.setException(new CameraControl.OperationCanceledException("Camera is not active."));
                this.mTorchStrengthCompleter = null;
            }
        }
    }

    ListenableFuture<Void> enableTorch(final boolean z) {
        if (!this.mHasFlashUnit) {
            Logger.d(TAG, "Unable to enableTorch due to there is no flash unit.");
            return Futures.immediateFailedFuture(new IllegalStateException("No flash unit"));
        }
        setTorchState(z ? 1 : 0);
        final int i = z ? 1 : 0;
        return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.camera2.internal.TorchControl$$ExternalSyntheticLambda1
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return TorchControl.this.m98x328afed3(i, z, completer);
            }
        });
    }

    /* renomeado de: lambda$enableTorch$2$androidx-camera-camera2-internal-TorchControl, motivo: nome Java inválido */
    /* sintético */ Object m98x328afed3(final int torchState, boolean enabled, final CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.TorchControl$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                TorchControl.this.m97xbd10d892(completer, torchState);
            }
        });
        return "enableTorch: " + enabled;
    }

    LiveData<Integer> getTorchState() {
        return this.mTorchState;
    }

    LiveData<Integer> getTorchStrengthLevel() {
        return this.mTorchStrength;
    }

    /* JADX INFO: modificadores de acesso alterados de: package-private */
    /* renomeado de: enableTorchInternal, motivo: mesclado com método bridge [métodos inline] */
    public void m97xbd10d892(CallbackToFutureAdapter.Completer<Void> completer, int torchState) {
        if (!this.mHasFlashUnit) {
            if (completer != null) {
                completer.setException(new IllegalStateException("No flash unit"));
                return;
            }
            return;
        }
        if (!this.mIsActive) {
            setTorchState(0);
            if (completer != null) {
                completer.setException(new CameraControl.OperationCanceledException("Camera is not active."));
                return;
            }
            return;
        }
        if (this.mCamera2CameraControlImpl.isLowLightBoostOn()) {
            if (completer != null) {
                completer.setException(new IllegalStateException("Torch can not be enabled when low-light boost is on!"));
            }
        } else {
            this.mTargetTorchEnabled = torchState != 0;
            this.mCamera2CameraControlImpl.enableTorchInternal(torchState);
            setTorchState(torchState);
            if (this.mEnableTorchCompleter != null) {
                this.mEnableTorchCompleter.setException(new CameraControl.OperationCanceledException("There is a new enableTorch being set"));
            }
            this.mEnableTorchCompleter = completer;
        }
    }

    ListenableFuture<Void> setTorchStrengthLevel(final int torchStrengthLevel) {
        if (!this.mIsTorchStrengthSupported) {
            return Futures.immediateFailedFuture(new UnsupportedOperationException("Setting torch strength is not supported on the device."));
        }
        setLiveDataValue(this.mTorchStrength, Integer.valueOf(torchStrengthLevel));
        return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.camera2.internal.TorchControl$$ExternalSyntheticLambda0
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return TorchControl.this.m101x92e8b885(torchStrengthLevel, completer);
            }
        });
    }

    /* renomeado de: lambda$setTorchStrengthLevel$4$androidx-camera-camera2-internal-TorchControl, motivo: nome Java inválido */
    /* sintético */ Object m101x92e8b885(final int torchStrengthLevel, final CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mExecutor.execute(new Runnable() { // da classe: androidx.camera.camera2.internal.TorchControl$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                TorchControl.this.m100x1d6e9244(completer, torchStrengthLevel);
            }
        });
        return "setTorchStrength: " + torchStrengthLevel;
    }

    /* JADX INFO: modificadores de acesso alterados de: package-private */
    /* renomeado de: setTorchStrengthLevelInternal, motivo: mesclado com método bridge [métodos inline] */
    public void m100x1d6e9244(CallbackToFutureAdapter.Completer<Void> completer, int torchStrengthLevel) {
        if (!this.mIsTorchStrengthSupported) {
            if (completer != null) {
                completer.setException(new UnsupportedOperationException("Setting torch strength is not supported on the device."));
            }
        } else {
            if (!this.mIsActive) {
                if (completer != null) {
                    completer.setException(new CameraControl.OperationCanceledException("Camera is not active."));
                    return;
                }
                return;
            }
            this.mTargetTorchStrength = torchStrengthLevel;
            this.mCamera2CameraControlImpl.setTorchStrengthLevelInternal(torchStrengthLevel);
            if (!this.mCamera2CameraControlImpl.isTorchOn() && completer != null) {
                completer.set(null);
                return;
            }
            if (this.mTorchStrengthCompleter != null) {
                this.mTorchStrengthCompleter.setException(new CameraControl.OperationCanceledException("There is a new torch strength being set."));
            }
            this.mTorchStrengthCompleter = completer;
        }
    }

    void forceUpdateTorchStateToOff() {
        if (!this.mTargetTorchEnabled) {
            return;
        }
        this.mTargetTorchEnabled = false;
        setTorchState(0);
    }

    private void setTorchState(int internalState) {
        int state;
        switch (internalState) {
            case 1:
                state = 1;
                break;
            default:
                state = 0;
                break;
        }
        setLiveDataValue(this.mTorchState, Integer.valueOf(state));
    }

    private <T> void setLiveDataValue(MutableLiveData<T> liveData, T value) {
        if (Threads.isMainThread()) {
            liveData.setValue(value);
        } else {
            liveData.postValue(value);
        }
    }
}
