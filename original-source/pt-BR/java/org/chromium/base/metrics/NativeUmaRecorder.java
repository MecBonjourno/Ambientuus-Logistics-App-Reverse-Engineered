package org.chromium.base.metrics;

import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.chromium.base.Callback;
import org.chromium.base.TimeUtils;
import org.chromium.base.annotations.JNINamespace;
import org.chromium.build.annotations.MainDex;

@JNINamespace("base::android")
@MainDex
/* carregado de: classes17.dex */
final class NativeUmaRecorder implements UmaRecorder {
    static final /* sintético */ boolean $assertionsDisabled = false;
    private final Map<String, Long> mNativeHints = DesugarCollections.synchronizedMap(new HashMap());
    private Map<Callback<String>, Long> mUserActionTestingCallbackNativePtrs;

    public interface Natives {
        long addActionCallbackForTesting(Callback<String> callback);

        long createHistogramSnapshotForTesting();

        void destroyHistogramSnapshotForTesting(long j);

        long[] getHistogramSamplesForTesting(String str);

        int getHistogramTotalCountForTesting(String str, long j);

        int getHistogramValueCountForTesting(String str, int i, long j);

        long recordBooleanHistogram(String str, long j, boolean z);

        long recordExponentialHistogram(String str, long j, int i, int i2, int i3, int i4);

        long recordLinearHistogram(String str, long j, int i, int i2, int i3, int i4);

        long recordSparseHistogram(String str, long j, int i);

        void recordUserAction(String str, long j);

        void removeActionCallbackForTesting(long j);
    }

    NativeUmaRecorder() {
    }

    @Override // org.chromium.base.metrics.UmaRecorder
    public void recordBooleanHistogram(String name, boolean sample) {
        long oldHint = getNativeHint(name);
        long newHint = NativeUmaRecorderJni.get().recordBooleanHistogram(name, oldHint, sample);
        maybeUpdateNativeHint(name, oldHint, newHint);
    }

    @Override // org.chromium.base.metrics.UmaRecorder
    public void recordExponentialHistogram(String name, int sample, int min, int max, int numBuckets) {
        long oldHint = getNativeHint(name);
        long newHint = NativeUmaRecorderJni.get().recordExponentialHistogram(name, oldHint, sample, min, max, numBuckets);
        maybeUpdateNativeHint(name, oldHint, newHint);
    }

    @Override // org.chromium.base.metrics.UmaRecorder
    public void recordLinearHistogram(String name, int sample, int min, int max, int numBuckets) {
        long oldHint = getNativeHint(name);
        long newHint = NativeUmaRecorderJni.get().recordLinearHistogram(name, oldHint, sample, min, max, numBuckets);
        maybeUpdateNativeHint(name, oldHint, newHint);
    }

    @Override // org.chromium.base.metrics.UmaRecorder
    public void recordSparseHistogram(String name, int sample) {
        long oldHint = getNativeHint(name);
        long newHint = NativeUmaRecorderJni.get().recordSparseHistogram(name, oldHint, sample);
        maybeUpdateNativeHint(name, oldHint, newHint);
    }

    @Override // org.chromium.base.metrics.UmaRecorder
    public void recordUserAction(String name, long elapsedRealtimeMillis) {
        long millisSinceEvent = TimeUtils.elapsedRealtimeMillis() - elapsedRealtimeMillis;
        NativeUmaRecorderJni.get().recordUserAction(name, millisSinceEvent);
    }

    @Override // org.chromium.base.metrics.UmaRecorder
    public int getHistogramValueCountForTesting(String name, int sample) {
        return NativeUmaRecorderJni.get().getHistogramValueCountForTesting(name, sample, 0L);
    }

    @Override // org.chromium.base.metrics.UmaRecorder
    public int getHistogramTotalCountForTesting(String name) {
        return NativeUmaRecorderJni.get().getHistogramTotalCountForTesting(name, 0L);
    }

    @Override // org.chromium.base.metrics.UmaRecorder
    public List<HistogramBucket> getHistogramSamplesForTesting(String name) {
        long[] samplesArray = NativeUmaRecorderJni.get().getHistogramSamplesForTesting(name);
        List<HistogramBucket> buckets = new ArrayList<>(samplesArray.length);
        for (int i = 0; i < samplesArray.length; i += 3) {
            int min = (int) samplesArray[i];
            long max = samplesArray[i + 1];
            int count = (int) samplesArray[i + 2];
            buckets.add(new HistogramBucket(min, max, count));
        }
        return buckets;
    }

    @Override // org.chromium.base.metrics.UmaRecorder
    public void addUserActionCallbackForTesting(Callback<String> callback) {
        long ptr = NativeUmaRecorderJni.get().addActionCallbackForTesting(callback);
        if (this.mUserActionTestingCallbackNativePtrs == null) {
            this.mUserActionTestingCallbackNativePtrs = DesugarCollections.synchronizedMap(new HashMap());
        }
        this.mUserActionTestingCallbackNativePtrs.put(callback, Long.valueOf(ptr));
    }

    @Override // org.chromium.base.metrics.UmaRecorder
    public void removeUserActionCallbackForTesting(Callback<String> callback) {
        if (this.mUserActionTestingCallbackNativePtrs == null) {
            throw new AssertionError("Attempting to remove a user action callback without previously registering any.");
        }
        Long ptr = this.mUserActionTestingCallbackNativePtrs.remove(callback);
        if (ptr == null) {
            throw new AssertionError("Attempting to remove a user action callback that was never previously registered.");
        }
        NativeUmaRecorderJni.get().removeActionCallbackForTesting(ptr.longValue());
    }

    private long getNativeHint(String name) {
        Long hint = this.mNativeHints.get(name);
        if (hint == null) {
            return 0L;
        }
        return hint.longValue();
    }

    private void maybeUpdateNativeHint(String name, long oldHint, long newHint) {
        if (oldHint != newHint) {
            this.mNativeHints.put(name, Long.valueOf(newHint));
        }
    }
}
