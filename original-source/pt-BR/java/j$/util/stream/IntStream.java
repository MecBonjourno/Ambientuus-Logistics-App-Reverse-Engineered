package j$.util.stream;

import j$.util.DesugarArrays;
import j$.util.IntSummaryStatistics;
import j$.util.IntSummaryStatisticsConversions;
import j$.util.Objects;
import j$.util.OptionalConversions;
import j$.util.OptionalDouble;
import j$.util.OptionalInt;
import j$.util.PrimitiveIterator;
import j$.util.Spliterator;
import j$.util.Spliterators;
import j$.util.stream.BaseStream;
import j$.util.stream.DoubleStream;
import j$.util.stream.LongStream;
import j$.util.stream.Stream;
import j$.util.stream.StreamSpliterators;
import j$.util.stream.Streams;
import j$.util.stream.WhileOps;
import java.util.Iterator;
import java.util.function.BiConsumer;
import java.util.function.IntBinaryOperator;
import java.util.function.IntConsumer;
import java.util.function.IntFunction;
import java.util.function.IntPredicate;
import java.util.function.IntSupplier;
import java.util.function.IntToDoubleFunction;
import java.util.function.IntToLongFunction;
import java.util.function.IntUnaryOperator;
import java.util.function.ObjIntConsumer;
import java.util.function.Supplier;

/* carregado de: classes15.dex */
public interface IntStream extends BaseStream<Integer, IntStream> {

    /* compiled from: D8$$SyntheticClass */
    public final /* sintético */ class VivifiedWrapper implements IntStream {
        public final /* sintético */ java.util.stream.IntStream wrappedValue;

        private /* sintético */ VivifiedWrapper(java.util.stream.IntStream intStream) {
            this.wrappedValue = intStream;
        }

        public static /* sintético */ IntStream convert(java.util.stream.IntStream intStream) {
            if (intStream == null) {
                return null;
            }
            return intStream instanceof Wrapper ? IntStream.this : new VivifiedWrapper(intStream);
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ boolean allMatch(IntPredicate intPredicate) {
            return this.wrappedValue.allMatch(intPredicate);
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ boolean anyMatch(IntPredicate intPredicate) {
            return this.wrappedValue.anyMatch(intPredicate);
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ DoubleStream asDoubleStream() {
            return DoubleStream.VivifiedWrapper.convert(this.wrappedValue.asDoubleStream());
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ LongStream asLongStream() {
            return LongStream.VivifiedWrapper.convert(this.wrappedValue.asLongStream());
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ OptionalDouble average() {
            return OptionalConversions.convert(this.wrappedValue.average());
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ Stream boxed() {
            return Stream.VivifiedWrapper.convert(this.wrappedValue.boxed());
        }

        @Override // j$.util.stream.BaseStream, java.lang.AutoCloseable
        public /* sintético */ void close() {
            this.wrappedValue.close();
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ Object collect(Supplier supplier, ObjIntConsumer objIntConsumer, BiConsumer biConsumer) {
            return this.wrappedValue.collect(supplier, objIntConsumer, biConsumer);
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ long count() {
            return this.wrappedValue.count();
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ IntStream distinct() {
            return convert(this.wrappedValue.distinct());
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ IntStream dropWhile(IntPredicate intPredicate) {
            return convert(this.wrappedValue.dropWhile(intPredicate));
        }

        public /* sintético */ boolean equals(Object obj) {
            java.util.stream.IntStream intStream = this.wrappedValue;
            if (obj instanceof VivifiedWrapper) {
                obj = ((VivifiedWrapper) obj).wrappedValue;
            }
            return intStream.equals(obj);
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ IntStream filter(IntPredicate intPredicate) {
            return convert(this.wrappedValue.filter(intPredicate));
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ OptionalInt findAny() {
            return OptionalConversions.convert(this.wrappedValue.findAny());
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ OptionalInt findFirst() {
            return OptionalConversions.convert(this.wrappedValue.findFirst());
        }

        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        @Override // j$.util.stream.IntStream
        public /* sintético */ IntStream flatMap(IntFunction intFunction) {
            return convert(this.wrappedValue.flatMap(FlatMapApiFlips.flipFunctionReturningStream((IntFunction<?>) intFunction)));
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ void forEach(IntConsumer intConsumer) {
            this.wrappedValue.forEach(intConsumer);
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ void forEachOrdered(IntConsumer intConsumer) {
            this.wrappedValue.forEachOrdered(intConsumer);
        }

        public /* sintético */ int hashCode() {
            return this.wrappedValue.hashCode();
        }

        @Override // j$.util.stream.BaseStream
        public /* sintético */ boolean isParallel() {
            return this.wrappedValue.isParallel();
        }

        /* JADX WARN: falha na inferência de tipo para: r0v1, types: [java.util.PrimitiveIterator$OfInt] */
        @Override // j$.util.stream.IntStream, j$.util.stream.BaseStream
        public /* sintético */ Iterator<Integer> iterator() {
            return PrimitiveIterator.OfInt.VivifiedWrapper.convert(this.wrappedValue.iterator());
        }

        @Override // j$.util.stream.BaseStream
        /* renomeado de: iterator, motivo: evitar colisão após correção de tipos em outro método */
        public /* sintético */ Iterator<Integer> iterator2() {
            return this.wrappedValue.iterator();
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ IntStream limit(long j) {
            return convert(this.wrappedValue.limit(j));
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ IntStream map(IntUnaryOperator intUnaryOperator) {
            return convert(this.wrappedValue.map(intUnaryOperator));
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ DoubleStream mapToDouble(IntToDoubleFunction intToDoubleFunction) {
            return DoubleStream.VivifiedWrapper.convert(this.wrappedValue.mapToDouble(intToDoubleFunction));
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ LongStream mapToLong(IntToLongFunction intToLongFunction) {
            return LongStream.VivifiedWrapper.convert(this.wrappedValue.mapToLong(intToLongFunction));
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ Stream mapToObj(IntFunction intFunction) {
            return Stream.VivifiedWrapper.convert(this.wrappedValue.mapToObj(intFunction));
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ OptionalInt max() {
            return OptionalConversions.convert(this.wrappedValue.max());
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ OptionalInt min() {
            return OptionalConversions.convert(this.wrappedValue.min());
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ boolean noneMatch(IntPredicate intPredicate) {
            return this.wrappedValue.noneMatch(intPredicate);
        }

        /* JADX WARN: falha na inferência de tipo para: r2v2, types: [j$.util.stream.BaseStream, j$.util.stream.IntStream] */
        @Override // j$.util.stream.BaseStream
        public /* sintético */ IntStream onClose(Runnable runnable) {
            return BaseStream.VivifiedWrapper.convert(this.wrappedValue.onClose(runnable));
        }

        /* JADX WARN: falha na inferência de tipo para: r0v2, types: [j$.util.stream.BaseStream, j$.util.stream.IntStream] */
        @Override // j$.util.stream.BaseStream
        public /* sintético */ IntStream parallel() {
            return BaseStream.VivifiedWrapper.convert(this.wrappedValue.parallel());
        }

        @Override // j$.util.stream.IntStream, j$.util.stream.BaseStream
        /* renomeado de: parallel, motivo: evitar colisão após correção de tipos em outro método */
        public /* sintético */ IntStream parallel2() {
            return convert(this.wrappedValue.parallel());
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ IntStream peek(IntConsumer intConsumer) {
            return convert(this.wrappedValue.peek(intConsumer));
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ int reduce(int i, IntBinaryOperator intBinaryOperator) {
            return this.wrappedValue.reduce(i, intBinaryOperator);
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ OptionalInt reduce(IntBinaryOperator intBinaryOperator) {
            return OptionalConversions.convert(this.wrappedValue.reduce(intBinaryOperator));
        }

        /* JADX WARN: falha na inferência de tipo para: r0v2, types: [j$.util.stream.BaseStream, j$.util.stream.IntStream] */
        @Override // j$.util.stream.BaseStream
        public /* sintético */ IntStream sequential() {
            return BaseStream.VivifiedWrapper.convert(this.wrappedValue.sequential());
        }

        @Override // j$.util.stream.IntStream, j$.util.stream.BaseStream
        /* renomeado de: sequential, motivo: evitar colisão após correção de tipos em outro método */
        public /* sintético */ IntStream sequential2() {
            return convert(this.wrappedValue.sequential());
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ IntStream skip(long j) {
            return convert(this.wrappedValue.skip(j));
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ IntStream sorted() {
            return convert(this.wrappedValue.sorted());
        }

        /* JADX WARN: falha na inferência de tipo para: r0v1, types: [java.util.Spliterator$OfInt] */
        @Override // j$.util.stream.IntStream, j$.util.stream.BaseStream
        public /* sintético */ Spliterator<Integer> spliterator() {
            return Spliterator.OfInt.VivifiedWrapper.convert(this.wrappedValue.spliterator());
        }

        @Override // j$.util.stream.BaseStream
        /* renomeado de: spliterator, motivo: evitar colisão após correção de tipos em outro método */
        public /* sintético */ Spliterator<Integer> spliterator2() {
            return Spliterator.VivifiedWrapper.convert(this.wrappedValue.spliterator());
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ int sum() {
            return this.wrappedValue.sum();
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ IntSummaryStatistics summaryStatistics() {
            return IntSummaryStatisticsConversions.convert(this.wrappedValue.summaryStatistics());
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ IntStream takeWhile(IntPredicate intPredicate) {
            return convert(this.wrappedValue.takeWhile(intPredicate));
        }

        @Override // j$.util.stream.IntStream
        public /* sintético */ int[] toArray() {
            return this.wrappedValue.toArray();
        }

        /* JADX WARN: falha na inferência de tipo para: r0v2, types: [j$.util.stream.BaseStream, j$.util.stream.IntStream] */
        @Override // j$.util.stream.BaseStream
        public /* sintético */ IntStream unordered() {
            return BaseStream.VivifiedWrapper.convert(this.wrappedValue.unordered());
        }
    }

    /* compiled from: D8$$SyntheticClass */
    public final /* sintético */ class Wrapper implements java.util.stream.IntStream {
        private /* sintético */ Wrapper() {
        }

        public static /* sintético */ java.util.stream.IntStream convert(IntStream intStream) {
            if (intStream == null) {
                return null;
            }
            return intStream instanceof VivifiedWrapper ? ((VivifiedWrapper) intStream).wrappedValue : intStream.new Wrapper();
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ boolean allMatch(IntPredicate intPredicate) {
            return IntStream.this.allMatch(intPredicate);
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ boolean anyMatch(IntPredicate intPredicate) {
            return IntStream.this.anyMatch(intPredicate);
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ java.util.stream.DoubleStream asDoubleStream() {
            return DoubleStream.Wrapper.convert(IntStream.this.asDoubleStream());
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ java.util.stream.LongStream asLongStream() {
            return LongStream.Wrapper.convert(IntStream.this.asLongStream());
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ java.util.OptionalDouble average() {
            return OptionalConversions.convert(IntStream.this.average());
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ java.util.stream.Stream boxed() {
            return Stream.Wrapper.convert(IntStream.this.boxed());
        }

        @Override // java.util.stream.BaseStream, java.lang.AutoCloseable
        public /* sintético */ void close() {
            IntStream.this.close();
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ Object collect(Supplier supplier, ObjIntConsumer objIntConsumer, BiConsumer biConsumer) {
            return IntStream.this.collect(supplier, objIntConsumer, biConsumer);
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ long count() {
            return IntStream.this.count();
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ java.util.stream.IntStream distinct() {
            return convert(IntStream.this.distinct());
        }

        public /* sintético */ java.util.stream.IntStream dropWhile(IntPredicate intPredicate) {
            return convert(IntStream.this.dropWhile(intPredicate));
        }

        public /* sintético */ boolean equals(Object obj) {
            IntStream intStream = IntStream.this;
            if (obj instanceof Wrapper) {
                obj = IntStream.this;
            }
            return intStream.equals(obj);
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ java.util.stream.IntStream filter(IntPredicate intPredicate) {
            return convert(IntStream.this.filter(intPredicate));
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ java.util.OptionalInt findAny() {
            return OptionalConversions.convert(IntStream.this.findAny());
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ java.util.OptionalInt findFirst() {
            return OptionalConversions.convert(IntStream.this.findFirst());
        }

        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        @Override // java.util.stream.IntStream
        public /* sintético */ java.util.stream.IntStream flatMap(IntFunction intFunction) {
            return convert(IntStream.this.flatMap(FlatMapApiFlips.flipFunctionReturningStream((IntFunction<?>) intFunction)));
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ void forEach(IntConsumer intConsumer) {
            IntStream.this.forEach(intConsumer);
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ void forEachOrdered(IntConsumer intConsumer) {
            IntStream.this.forEachOrdered(intConsumer);
        }

        public /* sintético */ int hashCode() {
            return IntStream.this.hashCode();
        }

        @Override // java.util.stream.BaseStream
        public /* sintético */ boolean isParallel() {
            return IntStream.this.isParallel();
        }

        @Override // java.util.stream.IntStream, java.util.stream.BaseStream
        public /* sintético */ Iterator<Integer> iterator() {
            return IntStream.this.iterator();
        }

        /* JADX WARN: falha na inferência de tipo para: r0v1, types: [j$.util.PrimitiveIterator$OfInt] */
        @Override // java.util.stream.IntStream, java.util.stream.BaseStream
        /* renomeado de: iterator, motivo: evitar colisão após correção de tipos em outro método */
        public /* sintético */ Iterator<Integer> iterator2() {
            return PrimitiveIterator.OfInt.Wrapper.convert(IntStream.this.iterator());
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ java.util.stream.IntStream limit(long j) {
            return convert(IntStream.this.limit(j));
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ java.util.stream.IntStream map(IntUnaryOperator intUnaryOperator) {
            return convert(IntStream.this.map(intUnaryOperator));
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ java.util.stream.DoubleStream mapToDouble(IntToDoubleFunction intToDoubleFunction) {
            return DoubleStream.Wrapper.convert(IntStream.this.mapToDouble(intToDoubleFunction));
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ java.util.stream.LongStream mapToLong(IntToLongFunction intToLongFunction) {
            return LongStream.Wrapper.convert(IntStream.this.mapToLong(intToLongFunction));
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ java.util.stream.Stream mapToObj(IntFunction intFunction) {
            return Stream.Wrapper.convert(IntStream.this.mapToObj(intFunction));
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ java.util.OptionalInt max() {
            return OptionalConversions.convert(IntStream.this.max());
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ java.util.OptionalInt min() {
            return OptionalConversions.convert(IntStream.this.min());
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ boolean noneMatch(IntPredicate intPredicate) {
            return IntStream.this.noneMatch(intPredicate);
        }

        /* JADX WARN: falha na inferência de tipo para: r2v2, types: [java.util.stream.BaseStream, java.util.stream.IntStream] */
        @Override // java.util.stream.BaseStream
        public /* sintético */ java.util.stream.IntStream onClose(Runnable runnable) {
            return BaseStream.Wrapper.convert(IntStream.this.onClose(runnable));
        }

        /* JADX WARN: falha na inferência de tipo para: r0v2, types: [java.util.stream.BaseStream, java.util.stream.IntStream] */
        @Override // java.util.stream.IntStream, java.util.stream.BaseStream
        public /* sintético */ java.util.stream.IntStream parallel() {
            return BaseStream.Wrapper.convert(IntStream.this.parallel());
        }

        @Override // java.util.stream.IntStream, java.util.stream.BaseStream
        /* renomeado de: parallel, motivo: evitar colisão após correção de tipos em outro método */
        public /* sintético */ java.util.stream.IntStream parallel2() {
            return convert(IntStream.this.parallel());
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ java.util.stream.IntStream peek(IntConsumer intConsumer) {
            return convert(IntStream.this.peek(intConsumer));
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ int reduce(int i, IntBinaryOperator intBinaryOperator) {
            return IntStream.this.reduce(i, intBinaryOperator);
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ java.util.OptionalInt reduce(IntBinaryOperator intBinaryOperator) {
            return OptionalConversions.convert(IntStream.this.reduce(intBinaryOperator));
        }

        /* JADX WARN: falha na inferência de tipo para: r0v2, types: [java.util.stream.BaseStream, java.util.stream.IntStream] */
        @Override // java.util.stream.IntStream, java.util.stream.BaseStream
        public /* sintético */ java.util.stream.IntStream sequential() {
            return BaseStream.Wrapper.convert(IntStream.this.sequential());
        }

        @Override // java.util.stream.IntStream, java.util.stream.BaseStream
        /* renomeado de: sequential, motivo: evitar colisão após correção de tipos em outro método */
        public /* sintético */ java.util.stream.IntStream sequential2() {
            return convert(IntStream.this.sequential());
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ java.util.stream.IntStream skip(long j) {
            return convert(IntStream.this.skip(j));
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ java.util.stream.IntStream sorted() {
            return convert(IntStream.this.sorted());
        }

        /* JADX WARN: falha na inferência de tipo para: r0v1, types: [j$.util.Spliterator$OfInt] */
        @Override // java.util.stream.IntStream, java.util.stream.BaseStream
        public /* sintético */ java.util.Spliterator<Integer> spliterator() {
            return Spliterator.OfInt.Wrapper.convert(IntStream.this.spliterator());
        }

        @Override // java.util.stream.IntStream, java.util.stream.BaseStream
        /* renomeado de: spliterator, motivo: evitar colisão após correção de tipos em outro método */
        public /* sintético */ java.util.Spliterator<Integer> spliterator2() {
            return Spliterator.Wrapper.convert(IntStream.this.spliterator());
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ int sum() {
            return IntStream.this.sum();
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ java.util.IntSummaryStatistics summaryStatistics() {
            return IntSummaryStatisticsConversions.convert(IntStream.this.summaryStatistics());
        }

        public /* sintético */ java.util.stream.IntStream takeWhile(IntPredicate intPredicate) {
            return convert(IntStream.this.takeWhile(intPredicate));
        }

        @Override // java.util.stream.IntStream
        public /* sintético */ int[] toArray() {
            return IntStream.this.toArray();
        }

        /* JADX WARN: falha na inferência de tipo para: r0v2, types: [java.util.stream.BaseStream, java.util.stream.IntStream] */
        @Override // java.util.stream.BaseStream
        public /* sintético */ java.util.stream.IntStream unordered() {
            return BaseStream.Wrapper.convert(IntStream.this.unordered());
        }
    }

    boolean allMatch(IntPredicate intPredicate);

    boolean anyMatch(IntPredicate intPredicate);

    DoubleStream asDoubleStream();

    LongStream asLongStream();

    OptionalDouble average();

    Stream<Integer> boxed();

    <R> R collect(Supplier<R> supplier, ObjIntConsumer<R> objIntConsumer, BiConsumer<R, R> biConsumer);

    long count();

    IntStream distinct();

    IntStream dropWhile(IntPredicate intPredicate);

    IntStream filter(IntPredicate intPredicate);

    OptionalInt findAny();

    OptionalInt findFirst();

    IntStream flatMap(IntFunction<? extends IntStream> intFunction);

    void forEach(IntConsumer intConsumer);

    void forEachOrdered(IntConsumer intConsumer);

    @Override // j$.util.stream.BaseStream
    Iterator<Integer> iterator();

    IntStream limit(long j);

    IntStream map(IntUnaryOperator intUnaryOperator);

    DoubleStream mapToDouble(IntToDoubleFunction intToDoubleFunction);

    LongStream mapToLong(IntToLongFunction intToLongFunction);

    <U> Stream<U> mapToObj(IntFunction<? extends U> intFunction);

    OptionalInt max();

    OptionalInt min();

    boolean noneMatch(IntPredicate intPredicate);

    @Override // j$.util.stream.BaseStream
    IntStream parallel();

    IntStream peek(IntConsumer intConsumer);

    int reduce(int i, IntBinaryOperator intBinaryOperator);

    OptionalInt reduce(IntBinaryOperator intBinaryOperator);

    @Override // j$.util.stream.BaseStream
    IntStream sequential();

    IntStream skip(long j);

    IntStream sorted();

    @Override // j$.util.stream.BaseStream
    Spliterator<Integer> spliterator();

    int sum();

    IntSummaryStatistics summaryStatistics();

    IntStream takeWhile(IntPredicate intPredicate);

    int[] toArray();

    /* renomeado de: j$.util.stream.IntStream$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        /* JADX WARN: falha na inferência de tipo para: r1v0, types: [j$.util.Spliterator$OfInt] */
        public static IntStream $default$takeWhile(IntStream _this, IntPredicate predicate) {
            Objects.requireNonNull(predicate);
            return StreamSupport.intStream(new WhileOps.UnorderedWhileSpliterator.OfInt.Taking(_this.spliterator(), true, predicate), _this.isParallel()).onClose(new IntStream$$ExternalSyntheticLambda0(_this));
        }

        /* JADX WARN: falha na inferência de tipo para: r1v0, types: [j$.util.Spliterator$OfInt] */
        public static IntStream $default$dropWhile(IntStream _this, IntPredicate predicate) {
            Objects.requireNonNull(predicate);
            return StreamSupport.intStream(new WhileOps.UnorderedWhileSpliterator.OfInt.Dropping(_this.spliterator(), true, predicate), _this.isParallel()).onClose(new IntStream$$ExternalSyntheticLambda0(_this));
        }

        public static Builder builder() {
            return new Streams.IntStreamBuilderImpl();
        }

        public static IntStream empty() {
            return StreamSupport.intStream(Spliterators.emptyIntSpliterator(), false);
        }

        public static IntStream of(int t) {
            return StreamSupport.intStream(new Streams.IntStreamBuilderImpl(t), false);
        }

        public static IntStream of(int... values) {
            return DesugarArrays.stream(values);
        }

        public static IntStream iterate(final int seed, final IntUnaryOperator f) {
            Objects.requireNonNull(f);
            Spliterator.OfInt spliterator = new Spliterators.AbstractIntSpliterator(Long.MAX_VALUE, 1296) { // da classe: j$.util.stream.IntStream.1
                int prev;
                boolean started;

                @Override // j$.util.Spliterators.AbstractIntSpliterator, j$.util.Spliterator.OfPrimitive
                public boolean tryAdvance(IntConsumer action) {
                    int t;
                    Objects.requireNonNull(action);
                    if (this.started) {
                        t = f.applyAsInt(this.prev);
                    } else {
                        t = seed;
                        this.started = true;
                    }
                    this.prev = t;
                    action.accept(t);
                    return true;
                }
            };
            return StreamSupport.intStream(spliterator, false);
        }

        public static IntStream iterate(final int seed, final IntPredicate hasNext, final IntUnaryOperator next) {
            Objects.requireNonNull(next);
            Objects.requireNonNull(hasNext);
            Spliterator.OfInt spliterator = new Spliterators.AbstractIntSpliterator(Long.MAX_VALUE, 1296) { // da classe: j$.util.stream.IntStream.2
                boolean finished;
                int prev;
                boolean started;

                @Override // j$.util.Spliterators.AbstractIntSpliterator, j$.util.Spliterator.OfPrimitive
                public boolean tryAdvance(IntConsumer action) {
                    int t;
                    Objects.requireNonNull(action);
                    if (this.finished) {
                        return false;
                    }
                    if (this.started) {
                        t = next.applyAsInt(this.prev);
                    } else {
                        t = seed;
                        this.started = true;
                    }
                    if (!hasNext.test(t)) {
                        this.finished = true;
                        return false;
                    }
                    this.prev = t;
                    action.accept(t);
                    return true;
                }

                @Override // j$.util.Spliterators.AbstractIntSpliterator, j$.util.Spliterator.OfPrimitive
                public void forEachRemaining(IntConsumer action) {
                    Objects.requireNonNull(action);
                    if (this.finished) {
                        return;
                    }
                    this.finished = true;
                    int t = this.started ? next.applyAsInt(this.prev) : seed;
                    while (hasNext.test(t)) {
                        action.accept(t);
                        t = next.applyAsInt(t);
                    }
                }
            };
            return StreamSupport.intStream(spliterator, false);
        }

        public static IntStream generate(IntSupplier s) {
            Objects.requireNonNull(s);
            return StreamSupport.intStream(new StreamSpliterators.InfiniteSupplyingSpliterator.OfInt(Long.MAX_VALUE, s), false);
        }

        public static IntStream range(int startInclusive, int endExclusive) {
            if (startInclusive >= endExclusive) {
                return empty();
            }
            return StreamSupport.intStream(new Streams.RangeIntSpliterator(startInclusive, endExclusive, false), false);
        }

        public static IntStream rangeClosed(int startInclusive, int endInclusive) {
            if (startInclusive > endInclusive) {
                return empty();
            }
            return StreamSupport.intStream(new Streams.RangeIntSpliterator(startInclusive, endInclusive, true), false);
        }

        /* JADX WARN: falha na inferência de tipo para: r1v0, types: [j$.util.Spliterator$OfInt] */
        /* JADX WARN: falha na inferência de tipo para: r2v0, types: [j$.util.Spliterator$OfInt] */
        public static IntStream concat(IntStream a, IntStream b) {
            Objects.requireNonNull(a);
            Objects.requireNonNull(b);
            Spliterator.OfInt split = new Streams.ConcatSpliterator.OfInt(a.spliterator(), b.spliterator());
            IntStream stream = StreamSupport.intStream(split, a.isParallel() || b.isParallel());
            return stream.onClose(Streams.composedClose(a, b));
        }
    }

    public interface Builder extends IntConsumer {
        @Override // java.util.function.IntConsumer
        void accept(int i);

        Builder add(int i);

        IntStream build();

        /* renomeado de: j$.util.stream.IntStream$Builder$-CC, motivo: nome de classe inválido */
        public final /* sintético */ class CC {
            public static Builder $default$add(Builder _this, int t) {
                _this.accept(t);
                return _this;
            }
        }
    }
}
