package j$.util.stream;

import j$.util.Objects;
import j$.util.Spliterator;
import j$.util.function.Consumer$CC;
import j$.util.function.DoubleConsumer$CC;
import j$.util.function.IntConsumer$CC;
import j$.util.function.LongConsumer$CC;
import j$.util.stream.DoubleStream;
import j$.util.stream.IntStream;
import j$.util.stream.LongStream;
import j$.util.stream.SpinedBuffer;
import j$.util.stream.Stream;
import java.util.Comparator;
import java.util.function.Consumer;
import java.util.function.DoubleConsumer;
import java.util.function.IntConsumer;
import java.util.function.LongConsumer;

/* carregado de: classes15.dex */
final class Streams {
    private Streams() {
        throw new Error("no instances");
    }

    static final class RangeIntSpliterator implements Spliterator.OfInt {
        private static final int BALANCED_SPLIT_THRESHOLD = 16777216;
        private static final int RIGHT_BALANCED_SPLIT_RATIO = 8;
        private int from;
        private int last;
        private final int upTo;

        @Override // j$.util.Spliterator.OfInt, j$.util.Spliterator
        public /* sintético */ void forEachRemaining(Consumer consumer) {
            Spliterator.OfInt.CC.$default$forEachRemaining((Spliterator.OfInt) this, consumer);
        }

        @Override // j$.util.Spliterator
        public /* sintético */ long getExactSizeIfKnown() {
            return Spliterator.CC.$default$getExactSizeIfKnown(this);
        }

        @Override // j$.util.Spliterator
        public /* sintético */ boolean hasCharacteristics(int i) {
            return Spliterator.CC.$default$hasCharacteristics(this, i);
        }

        @Override // j$.util.Spliterator.OfInt, j$.util.Spliterator
        public /* sintético */ boolean tryAdvance(Consumer consumer) {
            return Spliterator.OfInt.CC.$default$tryAdvance((Spliterator.OfInt) this, consumer);
        }

        RangeIntSpliterator(int i, int i2, boolean z) {
            this(i, i2, z ? 1 : 0);
        }

        private RangeIntSpliterator(int from, int upTo, int last) {
            this.from = from;
            this.upTo = upTo;
            this.last = last;
        }

        @Override // j$.util.Spliterator.OfPrimitive
        public boolean tryAdvance(IntConsumer consumer) {
            Objects.requireNonNull(consumer);
            int i = this.from;
            if (i < this.upTo) {
                this.from++;
                consumer.accept(i);
                return true;
            }
            if (this.last <= 0) {
                return false;
            }
            this.last = 0;
            consumer.accept(i);
            return true;
        }

        @Override // j$.util.Spliterator.OfPrimitive
        public void forEachRemaining(IntConsumer consumer) {
            Objects.requireNonNull(consumer);
            int i = this.from;
            int hUpTo = this.upTo;
            int hLast = this.last;
            this.from = this.upTo;
            this.last = 0;
            while (i < hUpTo) {
                consumer.accept(i);
                i++;
            }
            if (hLast > 0) {
                consumer.accept(i);
            }
        }

        @Override // j$.util.Spliterator
        public long estimateSize() {
            return (this.upTo - this.from) + this.last;
        }

        @Override // j$.util.Spliterator
        public int characteristics() {
            return 17749;
        }

        @Override // j$.util.Spliterator
        public Comparator<? super Integer> getComparator() {
            return null;
        }

        @Override // j$.util.Spliterator
        public Spliterator.OfInt trySplit() {
            long size = estimateSize();
            if (size <= 1) {
                return null;
            }
            int i = this.from;
            int splitPoint = this.from + splitPoint(size);
            this.from = splitPoint;
            return new RangeIntSpliterator(i, splitPoint, 0);
        }

        private int splitPoint(long size) {
            int d = size < 16777216 ? 2 : 8;
            return (int) (size / d);
        }
    }

    static final class RangeLongSpliterator implements Spliterator.OfLong {
        static final /* sintético */ boolean $assertionsDisabled = false;
        private static final long BALANCED_SPLIT_THRESHOLD = 16777216;
        private static final long RIGHT_BALANCED_SPLIT_RATIO = 8;
        private long from;
        private int last;
        private final long upTo;

        @Override // j$.util.Spliterator.OfLong, j$.util.Spliterator
        public /* sintético */ void forEachRemaining(Consumer consumer) {
            Spliterator.OfLong.CC.$default$forEachRemaining((Spliterator.OfLong) this, consumer);
        }

        @Override // j$.util.Spliterator
        public /* sintético */ long getExactSizeIfKnown() {
            return Spliterator.CC.$default$getExactSizeIfKnown(this);
        }

        @Override // j$.util.Spliterator
        public /* sintético */ boolean hasCharacteristics(int i) {
            return Spliterator.CC.$default$hasCharacteristics(this, i);
        }

        @Override // j$.util.Spliterator.OfLong, j$.util.Spliterator
        public /* sintético */ boolean tryAdvance(Consumer consumer) {
            return Spliterator.OfLong.CC.$default$tryAdvance((Spliterator.OfLong) this, consumer);
        }

        RangeLongSpliterator(long j, long j2, boolean z) {
            this(j, j2, z ? 1 : 0);
        }

        private RangeLongSpliterator(long from, long upTo, int last) {
            this.from = from;
            this.upTo = upTo;
            this.last = last;
        }

        @Override // j$.util.Spliterator.OfPrimitive
        public boolean tryAdvance(LongConsumer consumer) {
            Objects.requireNonNull(consumer);
            long i = this.from;
            if (i < this.upTo) {
                this.from++;
                consumer.accept(i);
                return true;
            }
            if (this.last <= 0) {
                return false;
            }
            this.last = 0;
            consumer.accept(i);
            return true;
        }

        @Override // j$.util.Spliterator.OfPrimitive
        public void forEachRemaining(LongConsumer consumer) {
            Objects.requireNonNull(consumer);
            long i = this.from;
            long hUpTo = this.upTo;
            int hLast = this.last;
            this.from = this.upTo;
            this.last = 0;
            while (i < hUpTo) {
                consumer.accept(i);
                i = 1 + i;
            }
            if (hLast > 0) {
                consumer.accept(i);
            }
        }

        @Override // j$.util.Spliterator
        public long estimateSize() {
            return (this.upTo - this.from) + this.last;
        }

        @Override // j$.util.Spliterator
        public int characteristics() {
            return 17749;
        }

        @Override // j$.util.Spliterator
        public Comparator<? super Long> getComparator() {
            return null;
        }

        @Override // j$.util.Spliterator
        public Spliterator.OfLong trySplit() {
            long size = estimateSize();
            if (size <= 1) {
                return null;
            }
            long j = this.from;
            long splitPoint = this.from + splitPoint(size);
            this.from = splitPoint;
            return new RangeLongSpliterator(j, splitPoint, 0);
        }

        private long splitPoint(long size) {
            long d = size < BALANCED_SPLIT_THRESHOLD ? 2L : 8L;
            return size / d;
        }
    }

    private static abstract class AbstractStreamBuilderImpl<T, S extends Spliterator<T>> implements Spliterator<T> {
        int count;

        @Override // j$.util.Spliterator
        public /* sintético */ void forEachRemaining(Consumer consumer) {
            Spliterator.CC.$default$forEachRemaining(this, consumer);
        }

        @Override // j$.util.Spliterator
        public /* sintético */ Comparator getComparator() {
            return Spliterator.CC.$default$getComparator(this);
        }

        @Override // j$.util.Spliterator
        public /* sintético */ long getExactSizeIfKnown() {
            return Spliterator.CC.$default$getExactSizeIfKnown(this);
        }

        @Override // j$.util.Spliterator
        public /* sintético */ boolean hasCharacteristics(int i) {
            return Spliterator.CC.$default$hasCharacteristics(this, i);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Streams$AbstractStreamBuilderImpl != java.util.stream.Streams$AbstractStreamBuilderImpl<T, S extends j$.util.Spliterator<T>> */
        private AbstractStreamBuilderImpl() {
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Streams$AbstractStreamBuilderImpl != java.util.stream.Streams$AbstractStreamBuilderImpl<T, S extends j$.util.Spliterator<T>> */
        @Override // j$.util.Spliterator
        public S trySplit() {
            return null;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Streams$AbstractStreamBuilderImpl != java.util.stream.Streams$AbstractStreamBuilderImpl<T, S extends j$.util.Spliterator<T>> */
        @Override // j$.util.Spliterator
        public long estimateSize() {
            return (-this.count) - 1;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Streams$AbstractStreamBuilderImpl != java.util.stream.Streams$AbstractStreamBuilderImpl<T, S extends j$.util.Spliterator<T>> */
        @Override // j$.util.Spliterator
        public int characteristics() {
            return 17488;
        }
    }

    static final class StreamBuilderImpl<T> extends AbstractStreamBuilderImpl<T, Spliterator<T>> implements Stream.Builder<T> {
        SpinedBuffer<T> buffer;
        T first;

        @Override // java.util.function.Consumer
        public /* sintético */ Consumer andThen(Consumer consumer) {
            return Consumer$CC.$default$andThen(this, consumer);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Streams$StreamBuilderImpl != java.util.stream.Streams$StreamBuilderImpl<T> */
        StreamBuilderImpl() {
            super();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Streams$StreamBuilderImpl != java.util.stream.Streams$StreamBuilderImpl<T> */
        StreamBuilderImpl(T t) {
            super();
            this.first = t;
            this.count = -2;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Streams$StreamBuilderImpl != java.util.stream.Streams$StreamBuilderImpl<T> */
        @Override // j$.util.stream.Stream.Builder, java.util.function.Consumer
        public void accept(T t) {
            if (this.count == 0) {
                this.first = t;
                this.count++;
            } else {
                if (this.count > 0) {
                    if (this.buffer == null) {
                        this.buffer = new SpinedBuffer<>();
                        this.buffer.accept(this.first);
                        this.count++;
                    }
                    this.buffer.accept(t);
                    return;
                }
                throw new IllegalStateException();
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Streams$StreamBuilderImpl != java.util.stream.Streams$StreamBuilderImpl<T> */
        @Override // j$.util.stream.Stream.Builder
        public Stream.Builder<T> add(T t) {
            accept(t);
            return this;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Streams$StreamBuilderImpl != java.util.stream.Streams$StreamBuilderImpl<T> */
        @Override // j$.util.stream.Stream.Builder
        public Stream<T> build() {
            int c = this.count;
            if (c >= 0) {
                this.count = (-this.count) - 1;
                return c < 2 ? StreamSupport.stream(this, false) : StreamSupport.stream(this.buffer.spliterator(), false);
            }
            throw new IllegalStateException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Streams$StreamBuilderImpl != java.util.stream.Streams$StreamBuilderImpl<T> */
        @Override // j$.util.Spliterator
        public boolean tryAdvance(Consumer<? super T> consumer) {
            Objects.requireNonNull(consumer);
            if (this.count == -2) {
                consumer.accept(this.first);
                this.count = -1;
                return true;
            }
            return false;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Streams$StreamBuilderImpl != java.util.stream.Streams$StreamBuilderImpl<T> */
        @Override // j$.util.stream.Streams.AbstractStreamBuilderImpl, j$.util.Spliterator
        public void forEachRemaining(Consumer<? super T> consumer) {
            Objects.requireNonNull(consumer);
            if (this.count == -2) {
                consumer.accept(this.first);
                this.count = -1;
            }
        }
    }

    static final class IntStreamBuilderImpl extends AbstractStreamBuilderImpl<Integer, Spliterator.OfInt> implements IntStream.Builder, Spliterator.OfInt {
        SpinedBuffer.OfInt buffer;
        int first;

        @Override // j$.util.stream.IntStream.Builder
        public /* sintético */ IntStream.Builder add(int i) {
            return IntStream.Builder.CC.$default$add(this, i);
        }

        @Override // java.util.function.IntConsumer
        public /* sintético */ IntConsumer andThen(IntConsumer intConsumer) {
            return IntConsumer$CC.$default$andThen(this, intConsumer);
        }

        @Override // j$.util.stream.Streams.AbstractStreamBuilderImpl, j$.util.Spliterator
        public /* sintético */ void forEachRemaining(Consumer consumer) {
            Spliterator.OfInt.CC.$default$forEachRemaining((Spliterator.OfInt) this, consumer);
        }

        @Override // j$.util.Spliterator
        public /* sintético */ boolean tryAdvance(Consumer consumer) {
            return Spliterator.OfInt.CC.$default$tryAdvance((Spliterator.OfInt) this, consumer);
        }

        @Override // j$.util.stream.Streams.AbstractStreamBuilderImpl, j$.util.Spliterator
        public /* bridge */ /* sintético */ Spliterator.OfInt trySplit() {
            return (Spliterator.OfInt) super.trySplit();
        }

        @Override // j$.util.stream.Streams.AbstractStreamBuilderImpl, j$.util.Spliterator
        public /* bridge */ /* sintético */ Spliterator.OfPrimitive trySplit() {
            return (Spliterator.OfPrimitive) super.trySplit();
        }

        IntStreamBuilderImpl() {
            super();
        }

        IntStreamBuilderImpl(int t) {
            super();
            this.first = t;
            this.count = -2;
        }

        @Override // j$.util.stream.IntStream.Builder, java.util.function.IntConsumer
        public void accept(int t) {
            if (this.count == 0) {
                this.first = t;
                this.count++;
            } else {
                if (this.count > 0) {
                    if (this.buffer == null) {
                        this.buffer = new SpinedBuffer.OfInt();
                        this.buffer.accept(this.first);
                        this.count++;
                    }
                    this.buffer.accept(t);
                    return;
                }
                throw new IllegalStateException();
            }
        }

        @Override // j$.util.stream.IntStream.Builder
        public IntStream build() {
            int c = this.count;
            if (c >= 0) {
                this.count = (-this.count) - 1;
                return c < 2 ? StreamSupport.intStream(this, false) : StreamSupport.intStream(this.buffer.spliterator(), false);
            }
            throw new IllegalStateException();
        }

        @Override // j$.util.Spliterator.OfPrimitive
        public boolean tryAdvance(IntConsumer action) {
            Objects.requireNonNull(action);
            if (this.count == -2) {
                action.accept(this.first);
                this.count = -1;
                return true;
            }
            return false;
        }

        @Override // j$.util.Spliterator.OfPrimitive
        public void forEachRemaining(IntConsumer action) {
            Objects.requireNonNull(action);
            if (this.count == -2) {
                action.accept(this.first);
                this.count = -1;
            }
        }
    }

    static final class LongStreamBuilderImpl extends AbstractStreamBuilderImpl<Long, Spliterator.OfLong> implements LongStream.Builder, Spliterator.OfLong {
        SpinedBuffer.OfLong buffer;
        long first;

        @Override // j$.util.stream.LongStream.Builder
        public /* sintético */ LongStream.Builder add(long j) {
            return LongStream.Builder.CC.$default$add(this, j);
        }

        @Override // java.util.function.LongConsumer
        public /* sintético */ LongConsumer andThen(LongConsumer longConsumer) {
            return LongConsumer$CC.$default$andThen(this, longConsumer);
        }

        @Override // j$.util.stream.Streams.AbstractStreamBuilderImpl, j$.util.Spliterator
        public /* sintético */ void forEachRemaining(Consumer consumer) {
            Spliterator.OfLong.CC.$default$forEachRemaining((Spliterator.OfLong) this, consumer);
        }

        @Override // j$.util.Spliterator
        public /* sintético */ boolean tryAdvance(Consumer consumer) {
            return Spliterator.OfLong.CC.$default$tryAdvance((Spliterator.OfLong) this, consumer);
        }

        @Override // j$.util.stream.Streams.AbstractStreamBuilderImpl, j$.util.Spliterator
        public /* bridge */ /* sintético */ Spliterator.OfLong trySplit() {
            return (Spliterator.OfLong) super.trySplit();
        }

        @Override // j$.util.stream.Streams.AbstractStreamBuilderImpl, j$.util.Spliterator
        public /* bridge */ /* sintético */ Spliterator.OfPrimitive trySplit() {
            return (Spliterator.OfPrimitive) super.trySplit();
        }

        LongStreamBuilderImpl() {
            super();
        }

        LongStreamBuilderImpl(long t) {
            super();
            this.first = t;
            this.count = -2;
        }

        @Override // j$.util.stream.LongStream.Builder, java.util.function.LongConsumer
        public void accept(long t) {
            if (this.count == 0) {
                this.first = t;
                this.count++;
            } else {
                if (this.count > 0) {
                    if (this.buffer == null) {
                        this.buffer = new SpinedBuffer.OfLong();
                        this.buffer.accept(this.first);
                        this.count++;
                    }
                    this.buffer.accept(t);
                    return;
                }
                throw new IllegalStateException();
            }
        }

        @Override // j$.util.stream.LongStream.Builder
        public LongStream build() {
            int c = this.count;
            if (c >= 0) {
                this.count = (-this.count) - 1;
                return c < 2 ? StreamSupport.longStream(this, false) : StreamSupport.longStream(this.buffer.spliterator(), false);
            }
            throw new IllegalStateException();
        }

        @Override // j$.util.Spliterator.OfPrimitive
        public boolean tryAdvance(LongConsumer action) {
            Objects.requireNonNull(action);
            if (this.count == -2) {
                action.accept(this.first);
                this.count = -1;
                return true;
            }
            return false;
        }

        @Override // j$.util.Spliterator.OfPrimitive
        public void forEachRemaining(LongConsumer action) {
            Objects.requireNonNull(action);
            if (this.count == -2) {
                action.accept(this.first);
                this.count = -1;
            }
        }
    }

    static final class DoubleStreamBuilderImpl extends AbstractStreamBuilderImpl<Double, Spliterator.OfDouble> implements DoubleStream.Builder, Spliterator.OfDouble {
        SpinedBuffer.OfDouble buffer;
        double first;

        @Override // j$.util.stream.DoubleStream.Builder
        public /* sintético */ DoubleStream.Builder add(double d) {
            return DoubleStream.Builder.CC.$default$add(this, d);
        }

        @Override // java.util.function.DoubleConsumer
        public /* sintético */ DoubleConsumer andThen(DoubleConsumer doubleConsumer) {
            return DoubleConsumer$CC.$default$andThen(this, doubleConsumer);
        }

        @Override // j$.util.stream.Streams.AbstractStreamBuilderImpl, j$.util.Spliterator
        public /* sintético */ void forEachRemaining(Consumer consumer) {
            Spliterator.OfDouble.CC.$default$forEachRemaining((Spliterator.OfDouble) this, consumer);
        }

        @Override // j$.util.Spliterator
        public /* sintético */ boolean tryAdvance(Consumer consumer) {
            return Spliterator.OfDouble.CC.$default$tryAdvance((Spliterator.OfDouble) this, consumer);
        }

        @Override // j$.util.stream.Streams.AbstractStreamBuilderImpl, j$.util.Spliterator
        public /* bridge */ /* sintético */ Spliterator.OfDouble trySplit() {
            return (Spliterator.OfDouble) super.trySplit();
        }

        @Override // j$.util.stream.Streams.AbstractStreamBuilderImpl, j$.util.Spliterator
        public /* bridge */ /* sintético */ Spliterator.OfPrimitive trySplit() {
            return (Spliterator.OfPrimitive) super.trySplit();
        }

        DoubleStreamBuilderImpl() {
            super();
        }

        DoubleStreamBuilderImpl(double t) {
            super();
            this.first = t;
            this.count = -2;
        }

        @Override // j$.util.stream.DoubleStream.Builder, java.util.function.DoubleConsumer
        public void accept(double t) {
            if (this.count == 0) {
                this.first = t;
                this.count++;
            } else {
                if (this.count > 0) {
                    if (this.buffer == null) {
                        this.buffer = new SpinedBuffer.OfDouble();
                        this.buffer.accept(this.first);
                        this.count++;
                    }
                    this.buffer.accept(t);
                    return;
                }
                throw new IllegalStateException();
            }
        }

        @Override // j$.util.stream.DoubleStream.Builder
        public DoubleStream build() {
            int c = this.count;
            if (c >= 0) {
                this.count = (-this.count) - 1;
                return c < 2 ? StreamSupport.doubleStream(this, false) : StreamSupport.doubleStream(this.buffer.spliterator(), false);
            }
            throw new IllegalStateException();
        }

        @Override // j$.util.Spliterator.OfPrimitive
        public boolean tryAdvance(DoubleConsumer action) {
            Objects.requireNonNull(action);
            if (this.count == -2) {
                action.accept(this.first);
                this.count = -1;
                return true;
            }
            return false;
        }

        @Override // j$.util.Spliterator.OfPrimitive
        public void forEachRemaining(DoubleConsumer action) {
            Objects.requireNonNull(action);
            if (this.count == -2) {
                action.accept(this.first);
                this.count = -1;
            }
        }
    }

    static abstract class ConcatSpliterator<T, T_SPLITR extends Spliterator<T>> implements Spliterator<T> {
        protected final T_SPLITR aSpliterator;
        protected final T_SPLITR bSpliterator;
        boolean beforeSplit = true;
        final boolean unsized;

        @Override // j$.util.Spliterator
        public /* sintético */ long getExactSizeIfKnown() {
            return Spliterator.CC.$default$getExactSizeIfKnown(this);
        }

        @Override // j$.util.Spliterator
        public /* sintético */ boolean hasCharacteristics(int i) {
            return Spliterator.CC.$default$hasCharacteristics(this, i);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Streams$ConcatSpliterator != java.util.stream.Streams$ConcatSpliterator<T, T_SPLITR extends j$.util.Spliterator<T>> */
        public ConcatSpliterator(T_SPLITR aSpliterator, T_SPLITR bSpliterator) {
            this.aSpliterator = aSpliterator;
            this.bSpliterator = bSpliterator;
            this.unsized = aSpliterator.estimateSize() + bSpliterator.estimateSize() < 0;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Streams$ConcatSpliterator != java.util.stream.Streams$ConcatSpliterator<T, T_SPLITR extends j$.util.Spliterator<T>> */
        @Override // j$.util.Spliterator
        public T_SPLITR trySplit() {
            T_SPLITR t_splitr = this.beforeSplit ? this.aSpliterator : (T_SPLITR) this.bSpliterator.trySplit();
            this.beforeSplit = false;
            return t_splitr;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Streams$ConcatSpliterator != java.util.stream.Streams$ConcatSpliterator<T, T_SPLITR extends j$.util.Spliterator<T>> */
        @Override // j$.util.Spliterator
        public boolean tryAdvance(Consumer<? super T> consumer) {
            if (this.beforeSplit) {
                boolean hasNext = this.aSpliterator.tryAdvance(consumer);
                if (!hasNext) {
                    this.beforeSplit = false;
                    return this.bSpliterator.tryAdvance(consumer);
                }
                return hasNext;
            }
            return this.bSpliterator.tryAdvance(consumer);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Streams$ConcatSpliterator != java.util.stream.Streams$ConcatSpliterator<T, T_SPLITR extends j$.util.Spliterator<T>> */
        @Override // j$.util.Spliterator
        public void forEachRemaining(Consumer<? super T> consumer) {
            if (this.beforeSplit) {
                this.aSpliterator.forEachRemaining(consumer);
            }
            this.bSpliterator.forEachRemaining(consumer);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Streams$ConcatSpliterator != java.util.stream.Streams$ConcatSpliterator<T, T_SPLITR extends j$.util.Spliterator<T>> */
        @Override // j$.util.Spliterator
        public long estimateSize() {
            if (this.beforeSplit) {
                long size = this.aSpliterator.estimateSize() + this.bSpliterator.estimateSize();
                if (size >= 0) {
                    return size;
                }
                return Long.MAX_VALUE;
            }
            return this.bSpliterator.estimateSize();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Streams$ConcatSpliterator != java.util.stream.Streams$ConcatSpliterator<T, T_SPLITR extends j$.util.Spliterator<T>> */
        @Override // j$.util.Spliterator
        public int characteristics() {
            if (this.beforeSplit) {
                return this.aSpliterator.characteristics() & this.bSpliterator.characteristics() & (~((this.unsized ? 16448 : 0) | 5));
            }
            return this.bSpliterator.characteristics();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Streams$ConcatSpliterator != java.util.stream.Streams$ConcatSpliterator<T, T_SPLITR extends j$.util.Spliterator<T>> */
        @Override // j$.util.Spliterator
        public Comparator<? super T> getComparator() {
            if (this.beforeSplit) {
                throw new IllegalStateException();
            }
            return this.bSpliterator.getComparator();
        }

        static class OfRef<T> extends ConcatSpliterator<T, Spliterator<T>> {
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<T> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Streams$ConcatSpliterator$OfRef != java.util.stream.Streams$ConcatSpliterator$OfRef<T> */
            OfRef(Spliterator<T> spliterator, Spliterator<T> spliterator2) {
                super(spliterator, spliterator2);
            }
        }

        private static abstract class OfPrimitive<T, T_CONS, T_SPLITR extends Spliterator.OfPrimitive<T, T_CONS, T_SPLITR>> extends ConcatSpliterator<T, T_SPLITR> implements Spliterator.OfPrimitive<T, T_CONS, T_SPLITR> {
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Streams$ConcatSpliterator$OfPrimitive != java.util.stream.Streams$ConcatSpliterator$OfPrimitive<T, T_CONS, T_SPLITR extends j$.util.Spliterator$OfPrimitive<T, T_CONS, T_SPLITR>> */
            @Override // j$.util.stream.Streams.ConcatSpliterator, j$.util.Spliterator
            public /* bridge */ /* sintético */ Spliterator.OfPrimitive trySplit() {
                return (Spliterator.OfPrimitive) super.trySplit();
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Streams$ConcatSpliterator$OfPrimitive != java.util.stream.Streams$ConcatSpliterator$OfPrimitive<T, T_CONS, T_SPLITR extends j$.util.Spliterator$OfPrimitive<T, T_CONS, T_SPLITR>> */
            private OfPrimitive(T_SPLITR aSpliterator, T_SPLITR bSpliterator) {
                super(aSpliterator, bSpliterator);
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Streams$ConcatSpliterator$OfPrimitive != java.util.stream.Streams$ConcatSpliterator$OfPrimitive<T, T_CONS, T_SPLITR extends j$.util.Spliterator$OfPrimitive<T, T_CONS, T_SPLITR>> */
            @Override // j$.util.Spliterator.OfPrimitive
            public boolean tryAdvance(T_CONS action) {
                if (this.beforeSplit) {
                    boolean hasNext = ((Spliterator.OfPrimitive) this.aSpliterator).tryAdvance((Spliterator.OfPrimitive) action);
                    if (!hasNext) {
                        this.beforeSplit = false;
                        return ((Spliterator.OfPrimitive) this.bSpliterator).tryAdvance((Spliterator.OfPrimitive) action);
                    }
                    return hasNext;
                }
                return ((Spliterator.OfPrimitive) this.bSpliterator).tryAdvance((Spliterator.OfPrimitive) action);
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Streams$ConcatSpliterator$OfPrimitive != java.util.stream.Streams$ConcatSpliterator$OfPrimitive<T, T_CONS, T_SPLITR extends j$.util.Spliterator$OfPrimitive<T, T_CONS, T_SPLITR>> */
            @Override // j$.util.Spliterator.OfPrimitive
            public void forEachRemaining(T_CONS action) {
                if (this.beforeSplit) {
                    ((Spliterator.OfPrimitive) this.aSpliterator).forEachRemaining((Spliterator.OfPrimitive) action);
                }
                ((Spliterator.OfPrimitive) this.bSpliterator).forEachRemaining((Spliterator.OfPrimitive) action);
            }
        }

        static class OfInt extends OfPrimitive<Integer, IntConsumer, Spliterator.OfInt> implements Spliterator.OfInt {
            @Override // j$.util.Spliterator.OfInt
            public /* bridge */ /* sintético */ void forEachRemaining(IntConsumer intConsumer) {
                super.forEachRemaining((OfInt) intConsumer);
            }

            @Override // j$.util.Spliterator.OfInt
            public /* bridge */ /* sintético */ boolean tryAdvance(IntConsumer intConsumer) {
                return super.tryAdvance((OfInt) intConsumer);
            }

            @Override // j$.util.stream.Streams.ConcatSpliterator.OfPrimitive, j$.util.stream.Streams.ConcatSpliterator, j$.util.Spliterator
            public /* bridge */ /* sintético */ Spliterator.OfInt trySplit() {
                return (Spliterator.OfInt) super.trySplit();
            }

            OfInt(Spliterator.OfInt aSpliterator, Spliterator.OfInt bSpliterator) {
                super(aSpliterator, bSpliterator);
            }
        }

        static class OfLong extends OfPrimitive<Long, LongConsumer, Spliterator.OfLong> implements Spliterator.OfLong {
            @Override // j$.util.Spliterator.OfLong
            public /* bridge */ /* sintético */ void forEachRemaining(LongConsumer longConsumer) {
                super.forEachRemaining((OfLong) longConsumer);
            }

            @Override // j$.util.Spliterator.OfLong
            public /* bridge */ /* sintético */ boolean tryAdvance(LongConsumer longConsumer) {
                return super.tryAdvance((OfLong) longConsumer);
            }

            @Override // j$.util.stream.Streams.ConcatSpliterator.OfPrimitive, j$.util.stream.Streams.ConcatSpliterator, j$.util.Spliterator
            public /* bridge */ /* sintético */ Spliterator.OfLong trySplit() {
                return (Spliterator.OfLong) super.trySplit();
            }

            OfLong(Spliterator.OfLong aSpliterator, Spliterator.OfLong bSpliterator) {
                super(aSpliterator, bSpliterator);
            }
        }

        static class OfDouble extends OfPrimitive<Double, DoubleConsumer, Spliterator.OfDouble> implements Spliterator.OfDouble {
            @Override // j$.util.Spliterator.OfDouble
            public /* bridge */ /* sintético */ void forEachRemaining(DoubleConsumer doubleConsumer) {
                super.forEachRemaining((OfDouble) doubleConsumer);
            }

            @Override // j$.util.Spliterator.OfDouble
            public /* bridge */ /* sintético */ boolean tryAdvance(DoubleConsumer doubleConsumer) {
                return super.tryAdvance((OfDouble) doubleConsumer);
            }

            @Override // j$.util.stream.Streams.ConcatSpliterator.OfPrimitive, j$.util.stream.Streams.ConcatSpliterator, j$.util.Spliterator
            public /* bridge */ /* sintético */ Spliterator.OfDouble trySplit() {
                return (Spliterator.OfDouble) super.trySplit();
            }

            OfDouble(Spliterator.OfDouble aSpliterator, Spliterator.OfDouble bSpliterator) {
                super(aSpliterator, bSpliterator);
            }
        }
    }

    static Runnable composeWithExceptions(final Runnable a, final Runnable b) {
        return new Runnable() { // da classe: j$.util.stream.Streams.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    a.run();
                    b.run();
                } catch (Throwable e1) {
                    try {
                        b.run();
                    } catch (Throwable e2) {
                        try {
                            e1.addSuppressed(e2);
                        } catch (Throwable th) {
                        }
                    }
                    throw e1;
                }
            }
        };
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.BaseStream != java.util.stream.BaseStream<?, ?> */
    static Runnable composedClose(final BaseStream<?, ?> baseStream, final BaseStream<?, ?> baseStream2) {
        return new Runnable() { // da classe: j$.util.stream.Streams.2
            @Override // java.lang.Runnable
            public void run() {
                try {
                    BaseStream.this.close();
                    baseStream2.close();
                } catch (Throwable e1) {
                    try {
                        baseStream2.close();
                    } catch (Throwable e2) {
                        try {
                            e1.addSuppressed(e2);
                        } catch (Throwable th) {
                        }
                    }
                    throw e1;
                }
            }
        };
    }
}
