package j$.util.stream;

import j$.util.DesugarArrays;
import j$.util.LongSummaryStatistics;
import j$.util.LongSummaryStatisticsConversions;
import j$.util.Objects;
import j$.util.OptionalConversions;
import j$.util.OptionalDouble;
import j$.util.OptionalLong;
import j$.util.PrimitiveIterator;
import j$.util.Spliterator;
import j$.util.Spliterators;
import j$.util.stream.BaseStream;
import j$.util.stream.DoubleStream;
import j$.util.stream.IntStream;
import j$.util.stream.Stream;
import j$.util.stream.StreamSpliterators;
import j$.util.stream.Streams;
import j$.util.stream.WhileOps;
import java.util.Iterator;
import java.util.function.BiConsumer;
import java.util.function.LongBinaryOperator;
import java.util.function.LongConsumer;
import java.util.function.LongFunction;
import java.util.function.LongPredicate;
import java.util.function.LongSupplier;
import java.util.function.LongToDoubleFunction;
import java.util.function.LongToIntFunction;
import java.util.function.LongUnaryOperator;
import java.util.function.ObjLongConsumer;
import java.util.function.Supplier;

/* carregado de: classes15.dex */
public interface LongStream extends BaseStream<Long, LongStream> {

    /* compiled from: D8$$SyntheticClass */
    public final /* sintético */ class VivifiedWrapper implements LongStream {
        public final /* sintético */ java.util.stream.LongStream wrappedValue;

        private /* sintético */ VivifiedWrapper(java.util.stream.LongStream longStream) {
            this.wrappedValue = longStream;
        }

        public static /* sintético */ LongStream convert(java.util.stream.LongStream longStream) {
            if (longStream == null) {
                return null;
            }
            return longStream instanceof Wrapper ? LongStream.this : new VivifiedWrapper(longStream);
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ boolean allMatch(LongPredicate longPredicate) {
            return this.wrappedValue.allMatch(longPredicate);
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ boolean anyMatch(LongPredicate longPredicate) {
            return this.wrappedValue.anyMatch(longPredicate);
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ DoubleStream asDoubleStream() {
            return DoubleStream.VivifiedWrapper.convert(this.wrappedValue.asDoubleStream());
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ OptionalDouble average() {
            return OptionalConversions.convert(this.wrappedValue.average());
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ Stream boxed() {
            return Stream.VivifiedWrapper.convert(this.wrappedValue.boxed());
        }

        @Override // j$.util.stream.BaseStream, java.lang.AutoCloseable
        public /* sintético */ void close() {
            this.wrappedValue.close();
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ Object collect(Supplier supplier, ObjLongConsumer objLongConsumer, BiConsumer biConsumer) {
            return this.wrappedValue.collect(supplier, objLongConsumer, biConsumer);
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ long count() {
            return this.wrappedValue.count();
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ LongStream distinct() {
            return convert(this.wrappedValue.distinct());
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ LongStream dropWhile(LongPredicate longPredicate) {
            return convert(this.wrappedValue.dropWhile(longPredicate));
        }

        public /* sintético */ boolean equals(Object obj) {
            java.util.stream.LongStream longStream = this.wrappedValue;
            if (obj instanceof VivifiedWrapper) {
                obj = ((VivifiedWrapper) obj).wrappedValue;
            }
            return longStream.equals(obj);
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ LongStream filter(LongPredicate longPredicate) {
            return convert(this.wrappedValue.filter(longPredicate));
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ OptionalLong findAny() {
            return OptionalConversions.convert(this.wrappedValue.findAny());
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ OptionalLong findFirst() {
            return OptionalConversions.convert(this.wrappedValue.findFirst());
        }

        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        @Override // j$.util.stream.LongStream
        public /* sintético */ LongStream flatMap(LongFunction longFunction) {
            return convert(this.wrappedValue.flatMap(FlatMapApiFlips.flipFunctionReturningStream((LongFunction<?>) longFunction)));
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ void forEach(LongConsumer longConsumer) {
            this.wrappedValue.forEach(longConsumer);
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ void forEachOrdered(LongConsumer longConsumer) {
            this.wrappedValue.forEachOrdered(longConsumer);
        }

        public /* sintético */ int hashCode() {
            return this.wrappedValue.hashCode();
        }

        @Override // j$.util.stream.BaseStream
        public /* sintético */ boolean isParallel() {
            return this.wrappedValue.isParallel();
        }

        /* JADX WARN: falha na inferência de tipo para: r0v1, types: [java.util.PrimitiveIterator$OfLong] */
        @Override // j$.util.stream.LongStream, j$.util.stream.BaseStream
        /* renomeado de: iterator */
        public /* sintético */ Iterator<Long> iterator2() {
            return PrimitiveIterator.OfLong.VivifiedWrapper.convert(this.wrappedValue.iterator());
        }

        @Override // j$.util.stream.BaseStream
        /* renomeado de: iterator, motivo: evitar colisão após correção de tipos em outro método */
        public /* sintético */ Iterator<Long> iterator2() {
            return this.wrappedValue.iterator();
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ LongStream limit(long j) {
            return convert(this.wrappedValue.limit(j));
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ LongStream map(LongUnaryOperator longUnaryOperator) {
            return convert(this.wrappedValue.map(longUnaryOperator));
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ DoubleStream mapToDouble(LongToDoubleFunction longToDoubleFunction) {
            return DoubleStream.VivifiedWrapper.convert(this.wrappedValue.mapToDouble(longToDoubleFunction));
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ IntStream mapToInt(LongToIntFunction longToIntFunction) {
            return IntStream.VivifiedWrapper.convert(this.wrappedValue.mapToInt(longToIntFunction));
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ Stream mapToObj(LongFunction longFunction) {
            return Stream.VivifiedWrapper.convert(this.wrappedValue.mapToObj(longFunction));
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ OptionalLong max() {
            return OptionalConversions.convert(this.wrappedValue.max());
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ OptionalLong min() {
            return OptionalConversions.convert(this.wrappedValue.min());
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ boolean noneMatch(LongPredicate longPredicate) {
            return this.wrappedValue.noneMatch(longPredicate);
        }

        /* JADX WARN: falha na inferência de tipo para: r2v2, types: [j$.util.stream.BaseStream, j$.util.stream.LongStream] */
        @Override // j$.util.stream.BaseStream
        public /* sintético */ LongStream onClose(Runnable runnable) {
            return BaseStream.VivifiedWrapper.convert(this.wrappedValue.onClose(runnable));
        }

        /* JADX WARN: falha na inferência de tipo para: r0v2, types: [j$.util.stream.BaseStream, j$.util.stream.LongStream] */
        @Override // j$.util.stream.BaseStream
        public /* sintético */ LongStream parallel() {
            return BaseStream.VivifiedWrapper.convert(this.wrappedValue.parallel());
        }

        @Override // j$.util.stream.LongStream, j$.util.stream.BaseStream
        /* renomeado de: parallel, motivo: evitar colisão após correção de tipos em outro método */
        public /* sintético */ LongStream parallel2() {
            return convert(this.wrappedValue.parallel());
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ LongStream peek(LongConsumer longConsumer) {
            return convert(this.wrappedValue.peek(longConsumer));
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ long reduce(long j, LongBinaryOperator longBinaryOperator) {
            return this.wrappedValue.reduce(j, longBinaryOperator);
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ OptionalLong reduce(LongBinaryOperator longBinaryOperator) {
            return OptionalConversions.convert(this.wrappedValue.reduce(longBinaryOperator));
        }

        /* JADX WARN: falha na inferência de tipo para: r0v2, types: [j$.util.stream.BaseStream, j$.util.stream.LongStream] */
        @Override // j$.util.stream.BaseStream
        public /* sintético */ LongStream sequential() {
            return BaseStream.VivifiedWrapper.convert(this.wrappedValue.sequential());
        }

        @Override // j$.util.stream.LongStream, j$.util.stream.BaseStream
        /* renomeado de: sequential, motivo: evitar colisão após correção de tipos em outro método */
        public /* sintético */ LongStream sequential2() {
            return convert(this.wrappedValue.sequential());
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ LongStream skip(long j) {
            return convert(this.wrappedValue.skip(j));
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ LongStream sorted() {
            return convert(this.wrappedValue.sorted());
        }

        /* JADX WARN: falha na inferência de tipo para: r0v1, types: [java.util.Spliterator$OfLong] */
        @Override // j$.util.stream.LongStream, j$.util.stream.BaseStream
        /* renomeado de: spliterator */
        public /* sintético */ Spliterator<Long> spliterator2() {
            return Spliterator.OfLong.VivifiedWrapper.convert(this.wrappedValue.spliterator());
        }

        @Override // j$.util.stream.BaseStream
        /* renomeado de: spliterator, motivo: evitar colisão após correção de tipos em outro método */
        public /* sintético */ Spliterator<Long> spliterator2() {
            return Spliterator.VivifiedWrapper.convert(this.wrappedValue.spliterator());
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ long sum() {
            return this.wrappedValue.sum();
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ LongSummaryStatistics summaryStatistics() {
            return LongSummaryStatisticsConversions.convert(this.wrappedValue.summaryStatistics());
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ LongStream takeWhile(LongPredicate longPredicate) {
            return convert(this.wrappedValue.takeWhile(longPredicate));
        }

        @Override // j$.util.stream.LongStream
        public /* sintético */ long[] toArray() {
            return this.wrappedValue.toArray();
        }

        /* JADX WARN: falha na inferência de tipo para: r0v2, types: [j$.util.stream.BaseStream, j$.util.stream.LongStream] */
        @Override // j$.util.stream.BaseStream
        public /* sintético */ LongStream unordered() {
            return BaseStream.VivifiedWrapper.convert(this.wrappedValue.unordered());
        }
    }

    /* compiled from: D8$$SyntheticClass */
    public final /* sintético */ class Wrapper implements java.util.stream.LongStream {
        private /* sintético */ Wrapper() {
        }

        public static /* sintético */ java.util.stream.LongStream convert(LongStream longStream) {
            if (longStream == null) {
                return null;
            }
            return longStream instanceof VivifiedWrapper ? ((VivifiedWrapper) longStream).wrappedValue : longStream.new Wrapper();
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ boolean allMatch(LongPredicate longPredicate) {
            return LongStream.this.allMatch(longPredicate);
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ boolean anyMatch(LongPredicate longPredicate) {
            return LongStream.this.anyMatch(longPredicate);
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ java.util.stream.DoubleStream asDoubleStream() {
            return DoubleStream.Wrapper.convert(LongStream.this.asDoubleStream());
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ java.util.OptionalDouble average() {
            return OptionalConversions.convert(LongStream.this.average());
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ java.util.stream.Stream boxed() {
            return Stream.Wrapper.convert(LongStream.this.boxed());
        }

        @Override // java.util.stream.BaseStream, java.lang.AutoCloseable
        public /* sintético */ void close() {
            LongStream.this.close();
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ Object collect(Supplier supplier, ObjLongConsumer objLongConsumer, BiConsumer biConsumer) {
            return LongStream.this.collect(supplier, objLongConsumer, biConsumer);
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ long count() {
            return LongStream.this.count();
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ java.util.stream.LongStream distinct() {
            return convert(LongStream.this.distinct());
        }

        public /* sintético */ java.util.stream.LongStream dropWhile(LongPredicate longPredicate) {
            return convert(LongStream.this.dropWhile(longPredicate));
        }

        public /* sintético */ boolean equals(Object obj) {
            LongStream longStream = LongStream.this;
            if (obj instanceof Wrapper) {
                obj = LongStream.this;
            }
            return longStream.equals(obj);
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ java.util.stream.LongStream filter(LongPredicate longPredicate) {
            return convert(LongStream.this.filter(longPredicate));
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ java.util.OptionalLong findAny() {
            return OptionalConversions.convert(LongStream.this.findAny());
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ java.util.OptionalLong findFirst() {
            return OptionalConversions.convert(LongStream.this.findFirst());
        }

        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        @Override // java.util.stream.LongStream
        public /* sintético */ java.util.stream.LongStream flatMap(LongFunction longFunction) {
            return convert(LongStream.this.flatMap(FlatMapApiFlips.flipFunctionReturningStream((LongFunction<?>) longFunction)));
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ void forEach(LongConsumer longConsumer) {
            LongStream.this.forEach(longConsumer);
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ void forEachOrdered(LongConsumer longConsumer) {
            LongStream.this.forEachOrdered(longConsumer);
        }

        public /* sintético */ int hashCode() {
            return LongStream.this.hashCode();
        }

        @Override // java.util.stream.BaseStream
        public /* sintético */ boolean isParallel() {
            return LongStream.this.isParallel();
        }

        @Override // java.util.stream.LongStream, java.util.stream.BaseStream
        public /* sintético */ Iterator<Long> iterator() {
            return LongStream.this.iterator2();
        }

        /* JADX WARN: falha na inferência de tipo para: r0v1, types: [j$.util.PrimitiveIterator$OfLong] */
        @Override // java.util.stream.LongStream, java.util.stream.BaseStream
        /* renomeado de: iterator, motivo: evitar colisão após correção de tipos em outro método */
        public /* sintético */ Iterator<Long> iterator2() {
            return PrimitiveIterator.OfLong.Wrapper.convert(LongStream.this.iterator2());
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ java.util.stream.LongStream limit(long j) {
            return convert(LongStream.this.limit(j));
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ java.util.stream.LongStream map(LongUnaryOperator longUnaryOperator) {
            return convert(LongStream.this.map(longUnaryOperator));
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ java.util.stream.DoubleStream mapToDouble(LongToDoubleFunction longToDoubleFunction) {
            return DoubleStream.Wrapper.convert(LongStream.this.mapToDouble(longToDoubleFunction));
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ java.util.stream.IntStream mapToInt(LongToIntFunction longToIntFunction) {
            return IntStream.Wrapper.convert(LongStream.this.mapToInt(longToIntFunction));
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ java.util.stream.Stream mapToObj(LongFunction longFunction) {
            return Stream.Wrapper.convert(LongStream.this.mapToObj(longFunction));
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ java.util.OptionalLong max() {
            return OptionalConversions.convert(LongStream.this.max());
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ java.util.OptionalLong min() {
            return OptionalConversions.convert(LongStream.this.min());
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ boolean noneMatch(LongPredicate longPredicate) {
            return LongStream.this.noneMatch(longPredicate);
        }

        /* JADX WARN: falha na inferência de tipo para: r2v2, types: [java.util.stream.BaseStream, java.util.stream.LongStream] */
        @Override // java.util.stream.BaseStream
        public /* sintético */ java.util.stream.LongStream onClose(Runnable runnable) {
            return BaseStream.Wrapper.convert(LongStream.this.onClose(runnable));
        }

        /* JADX WARN: falha na inferência de tipo para: r0v2, types: [java.util.stream.BaseStream, java.util.stream.LongStream] */
        @Override // java.util.stream.LongStream, java.util.stream.BaseStream
        public /* sintético */ java.util.stream.LongStream parallel() {
            return BaseStream.Wrapper.convert(LongStream.this.parallel());
        }

        @Override // java.util.stream.LongStream, java.util.stream.BaseStream
        /* renomeado de: parallel, motivo: evitar colisão após correção de tipos em outro método */
        public /* sintético */ java.util.stream.LongStream parallel2() {
            return convert(LongStream.this.parallel());
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ java.util.stream.LongStream peek(LongConsumer longConsumer) {
            return convert(LongStream.this.peek(longConsumer));
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ long reduce(long j, LongBinaryOperator longBinaryOperator) {
            return LongStream.this.reduce(j, longBinaryOperator);
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ java.util.OptionalLong reduce(LongBinaryOperator longBinaryOperator) {
            return OptionalConversions.convert(LongStream.this.reduce(longBinaryOperator));
        }

        /* JADX WARN: falha na inferência de tipo para: r0v2, types: [java.util.stream.BaseStream, java.util.stream.LongStream] */
        @Override // java.util.stream.LongStream, java.util.stream.BaseStream
        public /* sintético */ java.util.stream.LongStream sequential() {
            return BaseStream.Wrapper.convert(LongStream.this.sequential());
        }

        @Override // java.util.stream.LongStream, java.util.stream.BaseStream
        /* renomeado de: sequential, motivo: evitar colisão após correção de tipos em outro método */
        public /* sintético */ java.util.stream.LongStream sequential2() {
            return convert(LongStream.this.sequential());
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ java.util.stream.LongStream skip(long j) {
            return convert(LongStream.this.skip(j));
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ java.util.stream.LongStream sorted() {
            return convert(LongStream.this.sorted());
        }

        /* JADX WARN: falha na inferência de tipo para: r0v1, types: [j$.util.Spliterator$OfLong] */
        @Override // java.util.stream.LongStream, java.util.stream.BaseStream
        public /* sintético */ java.util.Spliterator<Long> spliterator() {
            return Spliterator.OfLong.Wrapper.convert(LongStream.this.spliterator2());
        }

        @Override // java.util.stream.LongStream, java.util.stream.BaseStream
        /* renomeado de: spliterator, motivo: evitar colisão após correção de tipos em outro método */
        public /* sintético */ java.util.Spliterator<Long> spliterator2() {
            return Spliterator.Wrapper.convert(LongStream.this.spliterator2());
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ long sum() {
            return LongStream.this.sum();
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ java.util.LongSummaryStatistics summaryStatistics() {
            return LongSummaryStatisticsConversions.convert(LongStream.this.summaryStatistics());
        }

        public /* sintético */ java.util.stream.LongStream takeWhile(LongPredicate longPredicate) {
            return convert(LongStream.this.takeWhile(longPredicate));
        }

        @Override // java.util.stream.LongStream
        public /* sintético */ long[] toArray() {
            return LongStream.this.toArray();
        }

        /* JADX WARN: falha na inferência de tipo para: r0v2, types: [java.util.stream.BaseStream, java.util.stream.LongStream] */
        @Override // java.util.stream.BaseStream
        public /* sintético */ java.util.stream.LongStream unordered() {
            return BaseStream.Wrapper.convert(LongStream.this.unordered());
        }
    }

    boolean allMatch(LongPredicate longPredicate);

    boolean anyMatch(LongPredicate longPredicate);

    DoubleStream asDoubleStream();

    OptionalDouble average();

    Stream<Long> boxed();

    <R> R collect(Supplier<R> supplier, ObjLongConsumer<R> objLongConsumer, BiConsumer<R, R> biConsumer);

    long count();

    LongStream distinct();

    LongStream dropWhile(LongPredicate longPredicate);

    LongStream filter(LongPredicate longPredicate);

    OptionalLong findAny();

    OptionalLong findFirst();

    LongStream flatMap(LongFunction<? extends LongStream> longFunction);

    void forEach(LongConsumer longConsumer);

    void forEachOrdered(LongConsumer longConsumer);

    @Override // j$.util.stream.BaseStream
    /* renomeado de: iterator */
    Iterator<Long> iterator2();

    LongStream limit(long j);

    LongStream map(LongUnaryOperator longUnaryOperator);

    DoubleStream mapToDouble(LongToDoubleFunction longToDoubleFunction);

    IntStream mapToInt(LongToIntFunction longToIntFunction);

    <U> Stream<U> mapToObj(LongFunction<? extends U> longFunction);

    OptionalLong max();

    OptionalLong min();

    boolean noneMatch(LongPredicate longPredicate);

    @Override // j$.util.stream.BaseStream
    LongStream parallel();

    LongStream peek(LongConsumer longConsumer);

    long reduce(long j, LongBinaryOperator longBinaryOperator);

    OptionalLong reduce(LongBinaryOperator longBinaryOperator);

    @Override // j$.util.stream.BaseStream
    LongStream sequential();

    LongStream skip(long j);

    LongStream sorted();

    @Override // j$.util.stream.BaseStream
    /* renomeado de: spliterator */
    Spliterator<Long> spliterator2();

    long sum();

    LongSummaryStatistics summaryStatistics();

    LongStream takeWhile(LongPredicate longPredicate);

    long[] toArray();

    /* renomeado de: j$.util.stream.LongStream$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        /* JADX WARN: falha na inferência de tipo para: r1v0, types: [j$.util.Spliterator$OfLong] */
        public static LongStream $default$takeWhile(LongStream _this, LongPredicate predicate) {
            Objects.requireNonNull(predicate);
            return StreamSupport.longStream(new WhileOps.UnorderedWhileSpliterator.OfLong.Taking(_this.spliterator2(), true, predicate), _this.isParallel()).onClose(new LongStream$$ExternalSyntheticLambda1(_this));
        }

        /* JADX WARN: falha na inferência de tipo para: r1v0, types: [j$.util.Spliterator$OfLong] */
        public static LongStream $default$dropWhile(LongStream _this, LongPredicate predicate) {
            Objects.requireNonNull(predicate);
            return StreamSupport.longStream(new WhileOps.UnorderedWhileSpliterator.OfLong.Dropping(_this.spliterator2(), true, predicate), _this.isParallel()).onClose(new LongStream$$ExternalSyntheticLambda1(_this));
        }

        public static Builder builder() {
            return new Streams.LongStreamBuilderImpl();
        }

        public static LongStream empty() {
            return StreamSupport.longStream(Spliterators.emptyLongSpliterator(), false);
        }

        public static LongStream of(long t) {
            return StreamSupport.longStream(new Streams.LongStreamBuilderImpl(t), false);
        }

        public static LongStream of(long... values) {
            return DesugarArrays.stream(values);
        }

        public static LongStream iterate(final long seed, final LongUnaryOperator f) {
            Objects.requireNonNull(f);
            Spliterator.OfLong spliterator = new Spliterators.AbstractLongSpliterator(Long.MAX_VALUE, 1296) { // da classe: j$.util.stream.LongStream.1
                long prev;
                boolean started;

                @Override // j$.util.Spliterators.AbstractLongSpliterator, j$.util.Spliterator.OfPrimitive
                public boolean tryAdvance(LongConsumer action) {
                    long t;
                    Objects.requireNonNull(action);
                    if (this.started) {
                        t = f.applyAsLong(this.prev);
                    } else {
                        t = seed;
                        this.started = true;
                    }
                    this.prev = t;
                    action.accept(t);
                    return true;
                }
            };
            return StreamSupport.longStream(spliterator, false);
        }

        public static LongStream iterate(final long seed, final LongPredicate hasNext, final LongUnaryOperator next) {
            Objects.requireNonNull(next);
            Objects.requireNonNull(hasNext);
            Spliterator.OfLong spliterator = new Spliterators.AbstractLongSpliterator(Long.MAX_VALUE, 1296) { // da classe: j$.util.stream.LongStream.2
                boolean finished;
                long prev;
                boolean started;

                @Override // j$.util.Spliterators.AbstractLongSpliterator, j$.util.Spliterator.OfPrimitive
                public boolean tryAdvance(LongConsumer action) {
                    long t;
                    Objects.requireNonNull(action);
                    if (this.finished) {
                        return false;
                    }
                    if (this.started) {
                        t = next.applyAsLong(this.prev);
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

                @Override // j$.util.Spliterators.AbstractLongSpliterator, j$.util.Spliterator.OfPrimitive
                public void forEachRemaining(LongConsumer action) {
                    Objects.requireNonNull(action);
                    if (this.finished) {
                        return;
                    }
                    this.finished = true;
                    long t = this.started ? next.applyAsLong(this.prev) : seed;
                    while (hasNext.test(t)) {
                        action.accept(t);
                        t = next.applyAsLong(t);
                    }
                }
            };
            return StreamSupport.longStream(spliterator, false);
        }

        public static LongStream generate(LongSupplier s) {
            Objects.requireNonNull(s);
            return StreamSupport.longStream(new StreamSpliterators.InfiniteSupplyingSpliterator.OfLong(Long.MAX_VALUE, s), false);
        }

        public static LongStream range(long startInclusive, long endExclusive) {
            if (startInclusive >= endExclusive) {
                return empty();
            }
            if (endExclusive - startInclusive < 0) {
                long m = LongStream$$ExternalSyntheticBackport0.m(endExclusive - startInclusive, 2L) + startInclusive + 1;
                return concat(range(startInclusive, m), range(m, endExclusive));
            }
            return StreamSupport.longStream(new Streams.RangeLongSpliterator(startInclusive, endExclusive, false), false);
        }

        public static LongStream rangeClosed(long startInclusive, long endInclusive) {
            if (startInclusive > endInclusive) {
                return empty();
            }
            if ((endInclusive - startInclusive) + 1 <= 0) {
                long m = LongStream$$ExternalSyntheticBackport0.m(endInclusive - startInclusive, 2L) + startInclusive + 1;
                return concat(range(startInclusive, m), rangeClosed(m, endInclusive));
            }
            return StreamSupport.longStream(new Streams.RangeLongSpliterator(startInclusive, endInclusive, true), false);
        }

        /* JADX WARN: falha na inferência de tipo para: r1v0, types: [j$.util.Spliterator$OfLong] */
        /* JADX WARN: falha na inferência de tipo para: r2v0, types: [j$.util.Spliterator$OfLong] */
        public static LongStream concat(LongStream a, LongStream b) {
            Objects.requireNonNull(a);
            Objects.requireNonNull(b);
            Spliterator.OfLong split = new Streams.ConcatSpliterator.OfLong(a.spliterator2(), b.spliterator2());
            LongStream stream = StreamSupport.longStream(split, a.isParallel() || b.isParallel());
            return stream.onClose(Streams.composedClose(a, b));
        }
    }

    public interface Builder extends LongConsumer {
        @Override // java.util.function.LongConsumer
        void accept(long j);

        Builder add(long j);

        LongStream build();

        /* renomeado de: j$.util.stream.LongStream$Builder$-CC, motivo: nome de classe inválido */
        public final /* sintético */ class CC {
            public static Builder $default$add(Builder _this, long t) {
                _this.accept(t);
                return _this;
            }
        }
    }
}
