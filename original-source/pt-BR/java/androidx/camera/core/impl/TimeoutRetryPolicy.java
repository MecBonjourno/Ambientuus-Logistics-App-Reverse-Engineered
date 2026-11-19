package androidx.camera.core.impl;

import androidx.camera.core.RetryPolicy;
import androidx.core.util.Preconditions;

/* carregado de: classes.dex */
public final class TimeoutRetryPolicy implements RetryPolicy {
    private final RetryPolicy mDelegatePolicy;
    private final long mTimeoutInMillis;

    public TimeoutRetryPolicy(long timeoutInMillis, RetryPolicy delegatePolicy) {
        Preconditions.checkArgument(timeoutInMillis >= 0, "Timeout must be non-negative.");
        this.mTimeoutInMillis = timeoutInMillis;
        this.mDelegatePolicy = delegatePolicy;
    }

    @Override // androidx.camera.core.RetryPolicy
    public RetryPolicy.RetryConfig onRetryDecisionRequested(RetryPolicy.ExecutionState executionState) {
        RetryPolicy.RetryConfig retryConfig = this.mDelegatePolicy.onRetryDecisionRequested(executionState);
        return (getTimeoutInMillis() <= 0 || executionState.getExecutedTimeInMillis() < getTimeoutInMillis() - retryConfig.getRetryDelayInMillis()) ? retryConfig : RetryPolicy.RetryConfig.NOT_RETRY;
    }

    @Override // androidx.camera.core.RetryPolicy
    public long getTimeoutInMillis() {
        return this.mTimeoutInMillis;
    }
}
