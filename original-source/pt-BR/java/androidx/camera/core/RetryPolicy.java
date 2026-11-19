package androidx.camera.core;

import androidx.camera.core.RetryPolicy;
import androidx.camera.core.impl.CameraProviderInitRetryPolicy;
import androidx.camera.core.impl.RetryPolicyInternal;
import androidx.camera.core.impl.TimeoutRetryPolicy;
import androidx.core.util.Preconditions;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/* carregado de: classes.dex */
public interface RetryPolicy {
    public static final long DEFAULT_RETRY_TIMEOUT_IN_MILLIS = 6000;
    public static final RetryPolicy NEVER = new RetryPolicy() { // da classe: androidx.camera.core.RetryPolicy$$ExternalSyntheticLambda0
        @Override // androidx.camera.core.RetryPolicy
        public /* sintético */ long getTimeoutInMillis() {
            return RetryPolicy.CC.$default$getTimeoutInMillis(this);
        }

        @Override // androidx.camera.core.RetryPolicy
        public final RetryPolicy.RetryConfig onRetryDecisionRequested(RetryPolicy.ExecutionState executionState) {
            RetryPolicy.RetryConfig retryConfig;
            retryConfig = RetryPolicy.RetryConfig.NOT_RETRY;
            return retryConfig;
        }
    };
    public static final RetryPolicy DEFAULT = new CameraProviderInitRetryPolicy.Legacy(CC.getDefaultRetryTimeoutInMillis());
    public static final RetryPolicy RETRY_UNAVAILABLE_CAMERA = new CameraProviderInitRetryPolicy(CC.getDefaultRetryTimeoutInMillis());

    public interface ExecutionState {
        public static final int STATUS_CAMERA_UNAVAILABLE = 2;
        public static final int STATUS_CONFIGURATION_FAIL = 1;
        public static final int STATUS_UNKNOWN_ERROR = 0;

        @Retention(RetentionPolicy.SOURCE)
        public @interface Status {
        }

        Throwable getCause();

        long getExecutedTimeInMillis();

        int getNumOfAttempts();

        int getStatus();
    }

    long getTimeoutInMillis();

    RetryConfig onRetryDecisionRequested(ExecutionState executionState);

    /* renomeado de: androidx.camera.core.RetryPolicy$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        static {
            long j = RetryPolicy.DEFAULT_RETRY_TIMEOUT_IN_MILLIS;
        }

        public static long getDefaultRetryTimeoutInMillis() {
            return RetryPolicy.DEFAULT_RETRY_TIMEOUT_IN_MILLIS;
        }

        public static long $default$getTimeoutInMillis(RetryPolicy _this) {
            return 0L;
        }
    }

    public static final class Builder {
        private final RetryPolicy mBasePolicy;
        private long mTimeoutInMillis;

        public Builder(RetryPolicy basePolicy) {
            this.mBasePolicy = basePolicy;
            this.mTimeoutInMillis = basePolicy.getTimeoutInMillis();
        }

        public Builder setTimeoutInMillis(long timeoutInMillis) {
            this.mTimeoutInMillis = timeoutInMillis;
            return this;
        }

        public RetryPolicy build() {
            if (this.mBasePolicy instanceof RetryPolicyInternal) {
                return ((RetryPolicyInternal) this.mBasePolicy).copy(this.mTimeoutInMillis);
            }
            return new TimeoutRetryPolicy(this.mTimeoutInMillis, this.mBasePolicy);
        }
    }

    public static final class RetryConfig {
        private static final long DEFAULT_DELAY_MILLIS = 500;
        private final boolean mCompleteWithoutFailure;
        private final long mDelayInMillis;
        private final boolean mShouldRetry;
        public static final RetryConfig NOT_RETRY = new RetryConfig(false, 0);
        public static final RetryConfig DEFAULT_DELAY_RETRY = new RetryConfig(true);
        private static final long MINI_DELAY_MILLIS = 100;
        public static final RetryConfig MINI_DELAY_RETRY = new RetryConfig(true, MINI_DELAY_MILLIS);
        public static RetryConfig COMPLETE_WITHOUT_FAILURE = new RetryConfig(false, 0L, true);

        public static long getDefaultRetryDelayInMillis() {
            return DEFAULT_DELAY_MILLIS;
        }

        private RetryConfig(boolean shouldRetry) {
            this(shouldRetry, getDefaultRetryDelayInMillis());
        }

        private RetryConfig(boolean shouldRetry, long delayInMillis) {
            this(shouldRetry, delayInMillis, false);
        }

        private RetryConfig(boolean shouldRetry, long delayInMillis, boolean completeWithoutFailure) {
            this.mShouldRetry = shouldRetry;
            this.mDelayInMillis = delayInMillis;
            if (completeWithoutFailure) {
                Preconditions.checkArgument(!shouldRetry, "shouldRetry must be false when completeWithoutFailure is set to true");
            }
            this.mCompleteWithoutFailure = completeWithoutFailure;
        }

        public boolean shouldRetry() {
            return this.mShouldRetry;
        }

        public long getRetryDelayInMillis() {
            return this.mDelayInMillis;
        }

        public boolean shouldCompleteWithoutFailure() {
            return this.mCompleteWithoutFailure;
        }

        public static final class Builder {
            private boolean mShouldRetry = true;
            private long mTimeoutInMillis = RetryConfig.getDefaultRetryDelayInMillis();

            public Builder setShouldRetry(boolean shouldRetry) {
                this.mShouldRetry = shouldRetry;
                return this;
            }

            public Builder setRetryDelayInMillis(long timeoutInMillis) {
                this.mTimeoutInMillis = timeoutInMillis;
                return this;
            }

            public RetryConfig build() {
                return new RetryConfig(this.mShouldRetry, this.mTimeoutInMillis);
            }
        }
    }
}
