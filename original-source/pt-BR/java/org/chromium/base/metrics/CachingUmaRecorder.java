package org.chromium.base.metrics;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.locks.ReentrantReadWriteLock;
import org.chromium.base.Callback;
import org.chromium.base.Log;
import org.chromium.build.BuildConfig;

/* carregado de: classes17.dex */
final class CachingUmaRecorder implements UmaRecorder {
    static final /* sintético */ boolean $assertionsDisabled = false;
    private static final int MAX_HISTOGRAM_COUNT = 256;
    static final int MAX_USER_ACTION_COUNT = 256;
    private static final String TAG = "CachingUmaRecorder";
    private UmaRecorder mDelegate;
    private int mDroppedUserActionCount;
    private List<Callback<String>> mUserActionCallbacksForTesting;
    private final ReentrantReadWriteLock mRwLock = new ReentrantReadWriteLock(false);
    private Map<String, Histogram> mHistogramByName = new HashMap();
    private AtomicInteger mDroppedHistogramSampleCount = new AtomicInteger();
    private List<UserAction> mUserActions = new ArrayList();

    CachingUmaRecorder() {
    }

    static class Histogram {
        static final /* sintético */ boolean $assertionsDisabled = false;
        static final int MAX_SAMPLE_COUNT = 256;
        private final int mMax;
        private final int mMin;
        private final String mName;
        private final int mNumBuckets;
        private final List<Integer> mSamples;
        private final int mType;

        @Retention(RetentionPolicy.SOURCE)
        @interface Type {
            public static final int BOOLEAN = 1;
            public static final int EXPONENTIAL = 2;
            public static final int LINEAR = 3;
            public static final int SPARSE = 4;
        }

        Histogram(int type, String name, int min, int max, int numBuckets) {
            if (type != 2 && type != 3 && (min != 0 || max != 0 || numBuckets != 0)) {
                throw new AssertionError("Histogram type " + type + " must have no min/max/buckets set");
            }
            this.mType = type;
            this.mName = name;
            this.mMin = min;
            this.mMax = max;
            this.mNumBuckets = numBuckets;
            this.mSamples = new ArrayList(1);
        }

        synchronized boolean addSample(int type, String name, int sample, int min, int max, int numBuckets) {
            if (this.mType != type) {
                throw new AssertionError();
            }
            if (!this.mName.equals(name)) {
                throw new AssertionError();
            }
            if (this.mMin != min) {
                throw new AssertionError();
            }
            if (this.mMax != max) {
                throw new AssertionError();
            }
            if (this.mNumBuckets != numBuckets) {
                throw new AssertionError();
            }
            if (this.mSamples.size() >= 256) {
                throw new AssertionError("Histogram exceeded sample cache size limit");
            }
            this.mSamples.add(Integer.valueOf(sample));
            return true;
        }

        synchronized int flushTo(UmaRecorder recorder) {
            int count;
            switch (this.mType) {
                case 1:
                    for (int i = 0; i < this.mSamples.size(); i++) {
                        int sample = this.mSamples.get(i).intValue();
                        recorder.recordBooleanHistogram(this.mName, sample != 0);
                    }
                    break;
                case 2:
                    for (int i2 = 0; i2 < this.mSamples.size(); i2++) {
                        int sample2 = this.mSamples.get(i2).intValue();
                        recorder.recordExponentialHistogram(this.mName, sample2, this.mMin, this.mMax, this.mNumBuckets);
                    }
                    break;
                case 3:
                    int i3 = 0;
                    while (i3 < this.mSamples.size()) {
                        int sample3 = this.mSamples.get(i3).intValue();
                        UmaRecorder recorder2 = recorder;
                        recorder2.recordLinearHistogram(this.mName, sample3, this.mMin, this.mMax, this.mNumBuckets);
                        i3++;
                        recorder = recorder2;
                    }
                    break;
                case 4:
                    for (int i4 = 0; i4 < this.mSamples.size(); i4++) {
                        int sample4 = this.mSamples.get(i4).intValue();
                        recorder.recordSparseHistogram(this.mName, sample4);
                    }
                    break;
                default:
                    throw new AssertionError("Unknown histogram type " + this.mType);
            }
            count = this.mSamples.size();
            this.mSamples.clear();
            return count;
        }
    }

    private static class UserAction {
        private final long mElapsedRealtimeMillis;
        private final String mName;

        UserAction(String name, long elapsedRealtimeMillis) {
            this.mName = name;
            this.mElapsedRealtimeMillis = elapsedRealtimeMillis;
        }

        void flushTo(UmaRecorder recorder) {
            recorder.recordUserAction(this.mName, this.mElapsedRealtimeMillis);
        }
    }

    public UmaRecorder setDelegate(UmaRecorder recorder) {
        Map<String, Histogram> histogramCache = null;
        int droppedHistogramSampleCount = 0;
        List<UserAction> userActionCache = null;
        int droppedUserActionCount = 0;
        this.mRwLock.writeLock().lock();
        try {
            UmaRecorder previous = this.mDelegate;
            this.mDelegate = recorder;
            if (BuildConfig.IS_FOR_TEST) {
                swapUserActionCallbacksForTesting(previous, recorder);
            }
            if (recorder == null) {
                return previous;
            }
            if (!this.mHistogramByName.isEmpty()) {
                histogramCache = this.mHistogramByName;
                this.mHistogramByName = new HashMap();
                droppedHistogramSampleCount = this.mDroppedHistogramSampleCount.getAndSet(0);
            }
            if (!this.mUserActions.isEmpty()) {
                userActionCache = this.mUserActions;
                this.mUserActions = new ArrayList();
                droppedUserActionCount = this.mDroppedUserActionCount;
                this.mDroppedUserActionCount = 0;
            }
            this.mRwLock.readLock().lock();
            if (histogramCache != null) {
                try {
                    flushHistogramsAlreadyLocked(histogramCache, droppedHistogramSampleCount);
                } catch (Throwable th) {
                    this.mRwLock.readLock().unlock();
                    throw th;
                }
            }
            if (userActionCache != null) {
                flushUserActionsAlreadyLocked(userActionCache, droppedUserActionCount);
            }
            this.mRwLock.readLock().unlock();
            return previous;
        } finally {
            this.mRwLock.writeLock().unlock();
        }
    }

    private void flushHistogramsAlreadyLocked(Map<String, Histogram> cache, int droppedHistogramSampleCount) {
        if (this.mDelegate == null) {
            throw new AssertionError("Unexpected: cache is flushed, but delegate is null");
        }
        if (this.mRwLock.getReadHoldCount() <= 0) {
            throw new AssertionError();
        }
        int flushedHistogramSampleCount = 0;
        int flushedHistogramCount = cache.size();
        for (Histogram histogram : cache.values()) {
            flushedHistogramSampleCount += histogram.flushTo(this.mDelegate);
        }
        Log.i(TAG, "Flushed %d samples from %d histograms, %d samples were dropped.", Integer.valueOf(flushedHistogramSampleCount), Integer.valueOf(flushedHistogramCount), Integer.valueOf(droppedHistogramSampleCount));
    }

    private void flushUserActionsAlreadyLocked(List<UserAction> cache, int droppedUserActionCount) {
        if (this.mDelegate == null) {
            throw new AssertionError("Unexpected: cache is flushed, but delegate is null");
        }
        if (this.mRwLock.getReadHoldCount() <= 0) {
            throw new AssertionError();
        }
        for (UserAction userAction : cache) {
            userAction.flushTo(this.mDelegate);
        }
        Log.i(TAG, "Flushed %d user action samples, %d samples were dropped.", Integer.valueOf(cache.size()), Integer.valueOf(droppedUserActionCount));
    }

    private void cacheOrRecordHistogramSample(int type, String name, int sample, int min, int max, int numBuckets) {
        boolean tryAppendOrRecordSample = tryAppendOrRecordSample(type, name, sample, min, max, numBuckets);
        CachingUmaRecorder cachingUmaRecorder = this;
        if (tryAppendOrRecordSample) {
            return;
        }
        cachingUmaRecorder.mRwLock.writeLock().lock();
        try {
            if (cachingUmaRecorder.mDelegate == null) {
                try {
                    cacheHistogramSampleAlreadyWriteLocked(type, name, sample, min, max, numBuckets);
                    this.mRwLock.writeLock().unlock();
                    return;
                } catch (Throwable th) {
                    th = th;
                    cachingUmaRecorder = this;
                    cachingUmaRecorder.mRwLock.writeLock().unlock();
                    throw th;
                }
            }
            cachingUmaRecorder.mRwLock.readLock().lock();
            cachingUmaRecorder.mRwLock.writeLock().unlock();
            try {
                if (cachingUmaRecorder.mDelegate == null) {
                    throw new AssertionError();
                }
                try {
                    recordHistogramSampleAlreadyLocked(type, name, sample, min, max, numBuckets);
                    this.mRwLock.readLock().unlock();
                } catch (Throwable th2) {
                    th = th2;
                    cachingUmaRecorder = this;
                    cachingUmaRecorder.mRwLock.readLock().unlock();
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
            }
        } catch (Throwable th4) {
            th = th4;
        }
    }

    private boolean tryAppendOrRecordSample(int type, String name, int sample, int min, int max, int numBuckets) {
        CachingUmaRecorder cachingUmaRecorder;
        this.mRwLock.readLock().lock();
        try {
            if (this.mDelegate != null) {
                try {
                    recordHistogramSampleAlreadyLocked(type, name, sample, min, max, numBuckets);
                    this.mRwLock.readLock().unlock();
                    return true;
                } catch (Throwable th) {
                    th = th;
                    cachingUmaRecorder = this;
                }
            } else {
                cachingUmaRecorder = this;
                try {
                    Histogram histogram = cachingUmaRecorder.mHistogramByName.get(name);
                    if (histogram == null) {
                        cachingUmaRecorder.mRwLock.readLock().unlock();
                        return false;
                    }
                    try {
                        if (!histogram.addSample(type, name, sample, min, max, numBuckets)) {
                            try {
                                cachingUmaRecorder.mDroppedHistogramSampleCount.incrementAndGet();
                            } catch (Throwable th2) {
                                th = th2;
                            }
                        }
                        cachingUmaRecorder.mRwLock.readLock().unlock();
                        return true;
                    } catch (Throwable th3) {
                        th = th3;
                    }
                } catch (Throwable th4) {
                    th = th4;
                }
            }
        } catch (Throwable th5) {
            th = th5;
            cachingUmaRecorder = this;
        }
        cachingUmaRecorder.mRwLock.readLock().unlock();
        throw th;
    }

    private void cacheHistogramSampleAlreadyWriteLocked(int type, String name, int sample, int min, int max, int numBuckets) {
        Histogram histogram;
        if (!this.mRwLock.isWriteLockedByCurrentThread()) {
            throw new AssertionError();
        }
        Histogram histogram2 = this.mHistogramByName.get(name);
        if (histogram2 != null) {
            histogram = histogram2;
        } else {
            if (this.mHistogramByName.size() >= 256) {
                throw new AssertionError("Too many histograms in cache");
            }
            Histogram histogram3 = new Histogram(type, name, min, max, numBuckets);
            this.mHistogramByName.put(name, histogram3);
            histogram = histogram3;
        }
        if (!histogram.addSample(type, name, sample, min, max, numBuckets)) {
            this.mDroppedHistogramSampleCount.incrementAndGet();
        }
    }

    private void recordHistogramSampleAlreadyLocked(int type, String name, int sample, int min, int max, int numBuckets) {
        if (this.mRwLock.getReadHoldCount() <= 0) {
            throw new AssertionError();
        }
        if (this.mRwLock.isWriteLockedByCurrentThread()) {
            throw new AssertionError();
        }
        if (this.mDelegate == null) {
            throw new AssertionError("recordSampleAlreadyLocked called with no delegate to record to");
        }
        switch (type) {
            case 1:
                this.mDelegate.recordBooleanHistogram(name, sample != 0);
                return;
            case 2:
                this.mDelegate.recordExponentialHistogram(name, sample, min, max, numBuckets);
                return;
            case 3:
                this.mDelegate.recordLinearHistogram(name, sample, min, max, numBuckets);
                return;
            case 4:
                this.mDelegate.recordSparseHistogram(name, sample);
                return;
            default:
                throw new UnsupportedOperationException("Unknown histogram type " + type);
        }
    }

    @Override // org.chromium.base.metrics.UmaRecorder
    public void recordBooleanHistogram(String str, boolean z) {
        cacheOrRecordHistogramSample(1, str, z ? 1 : 0, 0, 0, 0);
    }

    @Override // org.chromium.base.metrics.UmaRecorder
    public void recordExponentialHistogram(String name, int sample, int min, int max, int numBuckets) {
        cacheOrRecordHistogramSample(2, name, sample, min, max, numBuckets);
    }

    @Override // org.chromium.base.metrics.UmaRecorder
    public void recordLinearHistogram(String name, int sample, int min, int max, int numBuckets) {
        cacheOrRecordHistogramSample(3, name, sample, min, max, numBuckets);
    }

    @Override // org.chromium.base.metrics.UmaRecorder
    public void recordSparseHistogram(String name, int sample) {
        cacheOrRecordHistogramSample(4, name, sample, 0, 0, 0);
    }

    @Override // org.chromium.base.metrics.UmaRecorder
    public void recordUserAction(String name, long elapsedRealtimeMillis) {
        this.mRwLock.readLock().lock();
        try {
            if (this.mDelegate != null) {
                this.mDelegate.recordUserAction(name, elapsedRealtimeMillis);
                return;
            }
            this.mRwLock.readLock().unlock();
            this.mRwLock.writeLock().lock();
            try {
                if (this.mDelegate == null) {
                    if (this.mUserActions.size() < 256) {
                        this.mUserActions.add(new UserAction(name, elapsedRealtimeMillis));
                        if (this.mUserActionCallbacksForTesting != null) {
                            for (int i = 0; i < this.mUserActionCallbacksForTesting.size(); i++) {
                                this.mUserActionCallbacksForTesting.get(i).onResult(name);
                            }
                        }
                        return;
                    }
                    throw new AssertionError("Too many user actions in cache");
                }
                this.mRwLock.readLock().lock();
                try {
                    if (this.mDelegate == null) {
                        throw new AssertionError();
                    }
                    this.mDelegate.recordUserAction(name, elapsedRealtimeMillis);
                } finally {
                }
            } finally {
                this.mRwLock.writeLock().unlock();
            }
        } finally {
        }
    }

    @Override // org.chromium.base.metrics.UmaRecorder
    public int getHistogramValueCountForTesting(String name, int sample) {
        this.mRwLock.readLock().lock();
        try {
            if (this.mDelegate != null) {
                return this.mDelegate.getHistogramValueCountForTesting(name, sample);
            }
            Histogram histogram = this.mHistogramByName.get(name);
            if (histogram == null) {
                this.mRwLock.readLock().unlock();
                return 0;
            }
            int sampleCount = 0;
            synchronized (histogram) {
                for (int i = 0; i < histogram.mSamples.size(); i++) {
                    if (((Integer) histogram.mSamples.get(i)).intValue() == sample) {
                        sampleCount++;
                    }
                }
            }
            return sampleCount;
        } finally {
            this.mRwLock.readLock().unlock();
        }
    }

    @Override // org.chromium.base.metrics.UmaRecorder
    public int getHistogramTotalCountForTesting(String name) {
        int size;
        this.mRwLock.readLock().lock();
        try {
            if (this.mDelegate != null) {
                return this.mDelegate.getHistogramTotalCountForTesting(name);
            }
            Histogram histogram = this.mHistogramByName.get(name);
            if (histogram == null) {
                this.mRwLock.readLock().unlock();
                return 0;
            }
            synchronized (histogram) {
                size = histogram.mSamples.size();
            }
            return size;
        } finally {
            this.mRwLock.readLock().unlock();
        }
    }

    @Override // org.chromium.base.metrics.UmaRecorder
    public List<HistogramBucket> getHistogramSamplesForTesting(String name) {
        Integer[] samplesCopy;
        this.mRwLock.readLock().lock();
        try {
            if (this.mDelegate != null) {
                return this.mDelegate.getHistogramSamplesForTesting(name);
            }
            Histogram histogram = this.mHistogramByName.get(name);
            if (histogram == null) {
                return Collections.emptyList();
            }
            synchronized (histogram) {
                samplesCopy = (Integer[]) histogram.mSamples.toArray(new Integer[0]);
            }
            Arrays.sort(samplesCopy);
            List<HistogramBucket> buckets = new ArrayList<>();
            int i = 0;
            while (i < samplesCopy.length) {
                int value = samplesCopy[i].intValue();
                int countInBucket = 0;
                do {
                    countInBucket++;
                    i++;
                    if (i < samplesCopy.length) {
                    }
                    buckets.add(new HistogramBucket(value, value + 1, countInBucket));
                } while (samplesCopy[i].intValue() == value);
                buckets.add(new HistogramBucket(value, value + 1, countInBucket));
            }
            return buckets;
        } finally {
            this.mRwLock.readLock().unlock();
        }
    }

    @Override // org.chromium.base.metrics.UmaRecorder
    public void addUserActionCallbackForTesting(Callback<String> callback) {
        this.mRwLock.writeLock().lock();
        try {
            if (this.mUserActionCallbacksForTesting == null) {
                this.mUserActionCallbacksForTesting = new ArrayList();
            }
            this.mUserActionCallbacksForTesting.add(callback);
            if (this.mDelegate != null) {
                this.mDelegate.addUserActionCallbackForTesting(callback);
            }
        } finally {
            this.mRwLock.writeLock().unlock();
        }
    }

    @Override // org.chromium.base.metrics.UmaRecorder
    public void removeUserActionCallbackForTesting(Callback<String> callback) {
        this.mRwLock.writeLock().lock();
        try {
            if (this.mUserActionCallbacksForTesting == null) {
                throw new AssertionError("Attempting to remove a user action callback without previously registering any.");
            }
            this.mUserActionCallbacksForTesting.remove(callback);
            if (this.mDelegate != null) {
                this.mDelegate.removeUserActionCallbackForTesting(callback);
            }
        } finally {
            this.mRwLock.writeLock().unlock();
        }
    }

    private void swapUserActionCallbacksForTesting(UmaRecorder previousRecorder, UmaRecorder newRecorder) {
        if (this.mUserActionCallbacksForTesting == null) {
            return;
        }
        for (int i = 0; i < this.mUserActionCallbacksForTesting.size(); i++) {
            if (previousRecorder != null) {
                previousRecorder.removeUserActionCallbackForTesting(this.mUserActionCallbacksForTesting.get(i));
            }
            if (newRecorder != null) {
                newRecorder.addUserActionCallbackForTesting(this.mUserActionCallbacksForTesting.get(i));
            }
        }
    }
}
