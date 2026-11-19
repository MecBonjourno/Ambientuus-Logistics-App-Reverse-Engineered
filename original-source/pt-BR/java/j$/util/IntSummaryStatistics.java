package j$.util;

import androidx.camera.video.AudioStats;
import j$.util.function.IntConsumer$CC;
import java.util.function.IntConsumer;

/* carregado de: classes15.dex */
public class IntSummaryStatistics implements IntConsumer {
    private long count;
    private int max;
    private int min;
    private long sum;

    @Override // java.util.function.IntConsumer
    public /* sintético */ IntConsumer andThen(IntConsumer intConsumer) {
        return IntConsumer$CC.$default$andThen(this, intConsumer);
    }

    public IntSummaryStatistics() {
        this.min = Integer.MAX_VALUE;
        this.max = Integer.MIN_VALUE;
    }

    public IntSummaryStatistics(long count, int min, int max, long sum) {
        this.min = Integer.MAX_VALUE;
        this.max = Integer.MIN_VALUE;
        if (count < 0) {
            throw new IllegalArgumentException("Negative count value");
        }
        if (count > 0) {
            if (min > max) {
                throw new IllegalArgumentException("Minimum greater than maximum");
            }
            this.count = count;
            this.sum = sum;
            this.min = min;
            this.max = max;
        }
    }

    @Override // java.util.function.IntConsumer
    public void accept(int value) {
        this.count++;
        this.sum += value;
        this.min = Math.min(this.min, value);
        this.max = Math.max(this.max, value);
    }

    public void combine(IntSummaryStatistics other) {
        this.count += other.count;
        this.sum += other.sum;
        this.min = Math.min(this.min, other.min);
        this.max = Math.max(this.max, other.max);
    }

    public final long getCount() {
        return this.count;
    }

    public final long getSum() {
        return this.sum;
    }

    public final int getMin() {
        return this.min;
    }

    public final int getMax() {
        return this.max;
    }

    public final double getAverage() {
        return getCount() > 0 ? getSum() / getCount() : AudioStats.AUDIO_AMPLITUDE_NONE;
    }

    public String toString() {
        return String.format("%s{count=%d, sum=%d, min=%d, average=%f, max=%d}", getClass().getSimpleName(), Long.valueOf(getCount()), Long.valueOf(getSum()), Integer.valueOf(getMin()), Double.valueOf(getAverage()), Integer.valueOf(getMax()));
    }
}
