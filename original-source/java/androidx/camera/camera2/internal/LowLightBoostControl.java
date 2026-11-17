package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.TotalCaptureResult;
import android.os.Build;
import androidx.camera.camera2.internal.Camera2CameraControlImpl;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.core.CameraControl;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes.dex */
final class LowLightBoostControl {
    static final int DEFAULT_LLB_STATE = -1;
    private static final String TAG = "LowLightBoostControl";
    private final Camera2CameraControlImpl mCamera2CameraControlImpl;
    CallbackToFutureAdapter.Completer<Void> mEnableLlbCompleter;
    private final Executor mExecutor;
    private boolean mIsActive;
    private final boolean mIsLowLightBoostSupported;
    boolean mTargetLlbEnabled;
    private final AtomicInteger mLowLightBoostStateAtomic = new AtomicInteger(-1);
    private final Object mLock = new Object();
    private boolean mLowLightBoostDisabledByUseCaseSessionConfig = false;
    private final MutableLiveData<Integer> mLowLightBoostState = new MutableLiveData<>(-1);
    final Camera2CameraControlImpl.CaptureResultListener mCaptureResultListener = new Camera2CameraControlImpl.CaptureResultListener() { // from class: androidx.camera.camera2.internal.LowLightBoostControl$$ExternalSyntheticLambda0
        @Override // androidx.camera.camera2.internal.Camera2CameraControlImpl.CaptureResultListener
        public final boolean onCaptureResult(TotalCaptureResult totalCaptureResult) {
            return LowLightBoostControl.this.m81x7947e373(totalCaptureResult);
        }
    };

    LowLightBoostControl(Camera2CameraControlImpl camera2CameraControlImpl, CameraCharacteristicsCompat cameraCharacteristics, Executor executor) {
        this.mCamera2CameraControlImpl = camera2CameraControlImpl;
        this.mExecutor = executor;
        this.mIsLowLightBoostSupported = checkLowLightBoostAvailability(cameraCharacteristics);
        if (this.mIsLowLightBoostSupported) {
            this.mCamera2CameraControlImpl.addCaptureResultListener(this.mCaptureResultListener);
        }
    }

    /* renamed from: lambda$new$0$androidx-camera-camera2-internal-LowLightBoostControl, reason: not valid java name */
    /* synthetic */ boolean m81x7947e373(TotalCaptureResult captureResult) {
        Integer currentState;
        if (this.mEnableLlbCompleter != null) {
            CaptureRequest captureRequest = captureResult.getRequest();
            Integer aeMode = (Integer) captureRequest.get(CaptureRequest.CONTROL_AE_MODE);
            if (aeMode == null) {
                return false;
            }
            boolean llbEnabled = aeMode.intValue() == 6;
            if (llbEnabled != this.mTargetLlbEnabled) {
                return false;
            }
            this.mEnableLlbCompleter.set(null);
            this.mEnableLlbCompleter = null;
        }
        if (Build.VERSION.SDK_INT >= 35 && this.mTargetLlbEnabled && (currentState = (Integer) captureResult.get(CaptureResult.CONTROL_LOW_LIGHT_BOOST_STATE)) != null) {
            setLiveDataValue(this.mLowLightBoostState, currentState.intValue());
        }
        return false;
    }

    void setActive(boolean isActive) {
        if (this.mIsActive == isActive) {
            return;
        }
        this.mIsActive = isActive;
        if (!isActive) {
            if (this.mTargetLlbEnabled) {
                this.mTargetLlbEnabled = false;
                this.mCamera2CameraControlImpl.enableLowLightBoostInternal(false);
                setLiveDataValue(this.mLowLightBoostState, -1);
            }
            if (this.mEnableLlbCompleter != null) {
                this.mEnableLlbCompleter.setException(new CameraControl.OperationCanceledException("Camera is not active."));
                this.mEnableLlbCompleter = null;
            }
        }
    }

    void setLowLightBoostDisabledByUseCaseSessionConfig(boolean disabled) {
        synchronized (this.mLock) {
            this.mLowLightBoostDisabledByUseCaseSessionConfig = disabled;
            if (this.mLowLightBoostDisabledByUseCaseSessionConfig) {
                if (this.mTargetLlbEnabled) {
                    this.mTargetLlbEnabled = false;
                    this.mCamera2CameraControlImpl.enableLowLightBoostInternal(false);
                    setLiveDataValue(this.mLowLightBoostState, -1);
                    if (this.mEnableLlbCompleter != null) {
                        this.mEnableLlbCompleter.setException(new IllegalStateException("Low-light boost is disabled when expected frame rate range exceeds 30 or HDR 10-bit is on."));
                        this.mEnableLlbCompleter = null;
                    }
                }
            }
        }
    }

    boolean isLowLightBoostDisabledByUseCaseSessionConfig() {
        boolean z;
        synchronized (this.mLock) {
            z = this.mLowLightBoostDisabledByUseCaseSessionConfig;
        }
        return z;
    }

    ListenableFuture<Void> enableLowLightBoost(final boolean enabled) {
        if (!this.mIsLowLightBoostSupported) {
            Logger.d(TAG, "Unable to enable low-light boost due to it is not supported.");
            return Futures.immediateFailedFuture(new IllegalStateException("Low-light boost is not supported"));
        }
        setLiveDataValue(this.mLowLightBoostState, enabled ? 0 : -1);
        return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.camera2.internal.LowLightBoostControl$$ExternalSyntheticLambda2
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return LowLightBoostControl.this.m80xca12e633(enabled, completer);
            }
        });
    }

    /* renamed from: lambda$enableLowLightBoost$2$androidx-camera-camera2-internal-LowLightBoostControl, reason: not valid java name */
    /* synthetic */ Object m80xca12e633(final boolean enabled, final CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.LowLightBoostControl$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                LowLightBoostControl.this.m79xa0be90f2(completer, enabled);
            }
        });
        return "enableLowLightBoost: " + enabled;
    }

    LiveData<Integer> getLowLightBoostState() {
        return this.mLowLightBoostState;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: enableLowLightBoostInternal, reason: merged with bridge method [inline-methods] */
    public void m79xa0be90f2(CallbackToFutureAdapter.Completer<Void> completer, boolean enabled) {
        synchronized (this.mLock) {
            if (this.mLowLightBoostDisabledByUseCaseSessionConfig) {
                setLiveDataValue(this.mLowLightBoostState, -1);
                if (completer != null) {
                    completer.setException(new IllegalStateException("Low-light boost is disabled when expected frame rate range exceeds 30 or HDR 10-bit is on."));
                }
            } else {
                if (!this.mIsActive) {
                    setLiveDataValue(this.mLowLightBoostState, -1);
                    if (completer != null) {
                        completer.setException(new CameraControl.OperationCanceledException("Camera is not active."));
                        return;
                    }
                    return;
                }
                this.mTargetLlbEnabled = enabled;
                this.mCamera2CameraControlImpl.enableLowLightBoostInternal(enabled);
                setLiveDataValue(this.mLowLightBoostState, enabled ? 0 : -1);
                if (this.mEnableLlbCompleter != null) {
                    this.mEnableLlbCompleter.setException(new CameraControl.OperationCanceledException("There is a new enableLowLightBoost being set"));
                }
                this.mEnableLlbCompleter = completer;
            }
        }
    }

    boolean isLowLightBoostSupported() {
        return this.mIsLowLightBoostSupported;
    }

    static boolean checkLowLightBoostAvailability(CameraCharacteristicsCompat cameraCharacteristics) {
        int[] availableAeModes;
        if (Build.VERSION.SDK_INT > 34 && (availableAeModes = (int[]) cameraCharacteristics.get(CameraCharacteristics.CONTROL_AE_AVAILABLE_MODES)) != null) {
            for (int availableAeMode : availableAeModes) {
                if (availableAeMode == 6) {
                    return true;
                }
            }
        }
        return false;
    }

    private void setLiveDataValue(MutableLiveData<Integer> liveData, int value) {
        if (this.mLowLightBoostStateAtomic.getAndSet(value) != value) {
            if (Threads.isMainThread()) {
                liveData.setValue(Integer.valueOf(value));
            } else {
                liveData.postValue(Integer.valueOf(value));
            }
        }
    }
}
