package com.google.api.client.util;

import androidx.camera.video.AudioStats;
import java.io.IOException;
import org.chromium.base.TimeUtils;

/* carregado de: classes16.dex */
public class ExponentialBackOff implements BackOff {
    public static final int DEFAULT_INITIAL_INTERVAL_MILLIS = 500;
    public static final int DEFAULT_MAX_ELAPSED_TIME_MILLIS = 900000;
    public static final int DEFAULT_MAX_INTERVAL_MILLIS = 60000;
    public static final double DEFAULT_MULTIPLIER = 1.5d;
    public static final double DEFAULT_RANDOMIZATION_FACTOR = 0.5d;
    private int currentIntervalMillis;
    private final int initialIntervalMillis;
    private final int maxElapsedTimeMillis;
    private final int maxIntervalMillis;
    private final double multiplier;
    private final NanoClock nanoClock;
    private final double randomizationFactor;
    long startTimeNanos;

    public ExponentialBackOff() {
        this(new Builder());
    }

    protected ExponentialBackOff(Builder builder) {
        this.initialIntervalMillis = builder.initialIntervalMillis;
        this.randomizationFactor = builder.randomizationFactor;
        this.multiplier = builder.multiplier;
        this.maxIntervalMillis = builder.maxIntervalMillis;
        this.maxElapsedTimeMillis = builder.maxElapsedTimeMillis;
        this.nanoClock = builder.nanoClock;
        Preconditions.checkArgument(this.initialIntervalMillis > 0);
        Preconditions.checkArgument(AudioStats.AUDIO_AMPLITUDE_NONE <= this.randomizationFactor && this.randomizationFactor < 1.0d);
        Preconditions.checkArgument(this.multiplier >= 1.0d);
        Preconditions.checkArgument(this.maxIntervalMillis >= this.initialIntervalMillis);
        Preconditions.checkArgument(this.maxElapsedTimeMillis > 0);
        reset();
    }

    @Override // com.google.api.client.util.BackOff
    public final void reset() {
        this.currentIntervalMillis = this.initialIntervalMillis;
        this.startTimeNanos = this.nanoClock.nanoTime();
    }

    @Override // com.google.api.client.util.BackOff
    public long nextBackOffMillis() throws IOException {
        if (getElapsedTimeMillis() > this.maxElapsedTimeMillis) {
            return -1L;
        }
        int randomizedInterval = getRandomValueFromInterval(this.randomizationFactor, Math.random(), this.currentIntervalMillis);
        incrementCurrentInterval();
        return randomizedInterval;
    }

    static int getRandomValueFromInterval(double randomizationFactor, double random, int currentIntervalMillis) {
        double delta = currentIntervalMillis * randomizationFactor;
        double minInterval = currentIntervalMillis - delta;
        double maxInterval = currentIntervalMillis + delta;
        int randomValue = (int) ((((maxInterval - minInterval) + 1.0d) * random) + minInterval);
        return randomValue;
    }

    public final int getInitialIntervalMillis() {
        return this.initialIntervalMillis;
    }

    public final double getRandomizationFactor() {
        return this.randomizationFactor;
    }

    public final int getCurrentIntervalMillis() {
        return this.currentIntervalMillis;
    }

    public final double getMultiplier() {
        return this.multiplier;
    }

    public final int getMaxIntervalMillis() {
        return this.maxIntervalMillis;
    }

    public final int getMaxElapsedTimeMillis() {
        return this.maxElapsedTimeMillis;
    }

    public final long getElapsedTimeMillis() {
        return (this.nanoClock.nanoTime() - this.startTimeNanos) / TimeUtils.NANOSECONDS_PER_MILLISECOND;
    }

    private void incrementCurrentInterval() {
        if (this.currentIntervalMillis >= this.maxIntervalMillis / this.multiplier) {
            this.currentIntervalMillis = this.maxIntervalMillis;
        } else {
            this.currentIntervalMillis = (int) (this.currentIntervalMillis * this.multiplier);
        }
    }

    public static class Builder {
        int initialIntervalMillis = 500;
        double randomizationFactor = 0.5d;
        double multiplier = 1.5d;
        int maxIntervalMillis = 60000;
        int maxElapsedTimeMillis = 900000;
        NanoClock nanoClock = NanoClock.SYSTEM;

        public ExponentialBackOff build() {
            return new ExponentialBackOff(this);
        }

        public final int getInitialIntervalMillis() {
            return this.initialIntervalMillis;
        }

        public Builder setInitialIntervalMillis(int initialIntervalMillis) {
            this.initialIntervalMillis = initialIntervalMillis;
            return this;
        }

        public final double getRandomizationFactor() {
            return this.randomizationFactor;
        }

        public Builder setRandomizationFactor(double randomizationFactor) {
            this.randomizationFactor = randomizationFactor;
            return this;
        }

        public final double getMultiplier() {
            return this.multiplier;
        }

        public Builder setMultiplier(double multiplier) {
            this.multiplier = multiplier;
            return this;
        }

        public final int getMaxIntervalMillis() {
            return this.maxIntervalMillis;
        }

        public Builder setMaxIntervalMillis(int maxIntervalMillis) {
            this.maxIntervalMillis = maxIntervalMillis;
            return this;
        }

        public final int getMaxElapsedTimeMillis() {
            return this.maxElapsedTimeMillis;
        }

        public Builder setMaxElapsedTimeMillis(int maxElapsedTimeMillis) {
            this.maxElapsedTimeMillis = maxElapsedTimeMillis;
            return this;
        }

        public final NanoClock getNanoClock() {
            return this.nanoClock;
        }

        public Builder setNanoClock(NanoClock nanoClock) {
            this.nanoClock = (NanoClock) Preconditions.checkNotNull(nanoClock);
            return this;
        }
    }
}
