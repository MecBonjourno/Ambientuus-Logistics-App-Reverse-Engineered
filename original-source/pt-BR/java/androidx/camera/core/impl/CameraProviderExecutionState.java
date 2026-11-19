package androidx.camera.core.impl;

import android.os.SystemClock;
import androidx.camera.core.CameraUnavailableException;
import androidx.camera.core.InitializationException;
import androidx.camera.core.RetryPolicy;
import androidx.camera.core.impl.CameraValidator;

/* carregado de: classes.dex */
public final class CameraProviderExecutionState implements RetryPolicy.ExecutionState {
    private final int mAttemptCount;
    private final Throwable mCause;
    private final int mStatus;
    private final long mTaskExecutedTimeInMillis;

    public CameraProviderExecutionState(long taskStartTimeInMillis, int attemptCount, Throwable throwable) {
        this.mTaskExecutedTimeInMillis = SystemClock.elapsedRealtime() - taskStartTimeInMillis;
        this.mAttemptCount = attemptCount;
        if (throwable instanceof CameraValidator.CameraIdListIncorrectException) {
            this.mStatus = 2;
            this.mCause = throwable;
            return;
        }
        if (throwable instanceof InitializationException) {
            Throwable cause = throwable.getCause();
            this.mCause = cause != null ? cause : throwable;
            if (this.mCause instanceof CameraUnavailableException) {
                this.mStatus = 2;
                return;
            } else if (this.mCause instanceof IllegalArgumentException) {
                this.mStatus = 1;
                return;
            } else {
                this.mStatus = 0;
                return;
            }
        }
        this.mStatus = 0;
        this.mCause = throwable;
    }

    @Override // androidx.camera.core.RetryPolicy.ExecutionState
    public int getStatus() {
        return this.mStatus;
    }

    @Override // androidx.camera.core.RetryPolicy.ExecutionState
    public Throwable getCause() {
        return this.mCause;
    }

    @Override // androidx.camera.core.RetryPolicy.ExecutionState
    public long getExecutedTimeInMillis() {
        return this.mTaskExecutedTimeInMillis;
    }

    @Override // androidx.camera.core.RetryPolicy.ExecutionState
    public int getNumOfAttempts() {
        return this.mAttemptCount;
    }
}
