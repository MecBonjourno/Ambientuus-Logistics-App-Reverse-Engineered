package androidx.core.view;

import android.view.MotionEvent;

/* loaded from: classes.dex */
class VelocityTrackerFallback {
    private static final long ASSUME_POINTER_STOPPED_MS = 40;
    private static final int HISTORY_SIZE = 20;
    private static final long RANGE_MS = 100;
    private final float[] mMovements = new float[20];
    private final long[] mEventTimes = new long[20];
    private float mLastComputedVelocity = 0.0f;
    private int mDataPointsBufferSize = 0;
    private int mDataPointsBufferLastUsedIndex = 0;

    VelocityTrackerFallback() {
    }

    void addMovement(MotionEvent event) {
        long eventTime = event.getEventTime();
        if (this.mDataPointsBufferSize != 0 && eventTime - this.mEventTimes[this.mDataPointsBufferLastUsedIndex] > ASSUME_POINTER_STOPPED_MS) {
            clear();
        }
        this.mDataPointsBufferLastUsedIndex = (this.mDataPointsBufferLastUsedIndex + 1) % 20;
        if (this.mDataPointsBufferSize != 20) {
            this.mDataPointsBufferSize++;
        }
        this.mMovements[this.mDataPointsBufferLastUsedIndex] = event.getAxisValue(26);
        this.mEventTimes[this.mDataPointsBufferLastUsedIndex] = eventTime;
    }

    void computeCurrentVelocity(int units) {
        computeCurrentVelocity(units, Float.MAX_VALUE);
    }

    void computeCurrentVelocity(int units, float maxVelocity) {
        this.mLastComputedVelocity = getCurrentVelocity() * units;
        if (this.mLastComputedVelocity < (-Math.abs(maxVelocity))) {
            this.mLastComputedVelocity = -Math.abs(maxVelocity);
        } else if (this.mLastComputedVelocity > Math.abs(maxVelocity)) {
            this.mLastComputedVelocity = Math.abs(maxVelocity);
        }
    }

    float getAxisVelocity(int axis) {
        if (axis != 26) {
            return 0.0f;
        }
        return this.mLastComputedVelocity;
    }

    private void clear() {
        this.mDataPointsBufferSize = 0;
        this.mLastComputedVelocity = 0.0f;
    }

    private float getCurrentVelocity() {
        long lastEventTime;
        int i;
        if (this.mDataPointsBufferSize < 2) {
            return 0.0f;
        }
        int i2 = 1;
        int firstValidIndex = ((this.mDataPointsBufferLastUsedIndex + 20) - (this.mDataPointsBufferSize - 1)) % 20;
        long lastEventTime2 = this.mEventTimes[this.mDataPointsBufferLastUsedIndex];
        while (lastEventTime2 - this.mEventTimes[firstValidIndex] > RANGE_MS) {
            this.mDataPointsBufferSize--;
            firstValidIndex = (firstValidIndex + 1) % 20;
        }
        if (this.mDataPointsBufferSize < 2) {
            return 0.0f;
        }
        if (this.mDataPointsBufferSize == 2) {
            int lastIndex = (firstValidIndex + 1) % 20;
            if (this.mEventTimes[firstValidIndex] == this.mEventTimes[lastIndex]) {
                return 0.0f;
            }
            return this.mMovements[lastIndex] / (this.mEventTimes[lastIndex] - this.mEventTimes[firstValidIndex]);
        }
        float work = 0.0f;
        int numDataPointsProcessed = 0;
        int i3 = 0;
        while (i3 < this.mDataPointsBufferSize - i2) {
            int currentIndex = i3 + firstValidIndex;
            long eventTime = this.mEventTimes[currentIndex % 20];
            int nextIndex = (currentIndex + 1) % 20;
            if (this.mEventTimes[nextIndex] == eventTime) {
                lastEventTime = lastEventTime2;
                i = i2;
            } else {
                numDataPointsProcessed++;
                float vPrev = kineticEnergyToVelocity(work);
                float delta = this.mMovements[nextIndex];
                lastEventTime = lastEventTime2;
                float vCurr = delta / (this.mEventTimes[nextIndex] - eventTime);
                work += (vCurr - vPrev) * Math.abs(vCurr);
                i = 1;
                if (numDataPointsProcessed == 1) {
                    work *= 0.5f;
                }
            }
            i3++;
            i2 = i;
            lastEventTime2 = lastEventTime;
        }
        return kineticEnergyToVelocity(work);
    }

    private static float kineticEnergyToVelocity(float work) {
        return (work < 0.0f ? -1.0f : 1.0f) * ((float) Math.sqrt(Math.abs(work) * 2.0f));
    }
}
