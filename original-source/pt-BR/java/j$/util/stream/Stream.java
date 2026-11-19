package j$.util.stream;

import j$.util.DesugarArrays;
import j$.util.Objects;
import j$.util.Optional;
import j$.util.OptionalConversions;
import j$.util.Spliterator;
import j$.util.Spliterators;
import j$.util.stream.BaseStream;
import j$.util.stream.Collector;
import j$.util.stream.DoubleStream;
import j$.util.stream.IntStream;
import j$.util.stream.LongStream;
import j$.util.stream.StreamSpliterators;
import j$.util.stream.Streams;
import j$.util.stream.WhileOps;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.function.BiConsumer;
import java.util.function.BiFunction;
import java.util.function.BinaryOperator;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.IntFunction;
import java.util.function.Predicate;
import java.util.function.Supplier;
import java.util.function.ToDoubleFunction;
import java.util.function.ToIntFunction;
import java.util.function.ToLongFunction;
import java.util.function.UnaryOperator;

/* carregado de: classes15.dex */
public interface Stream<T> extends BaseStream<T, Stream<T>> {

    /* compiled from: D8$$SyntheticClass */
    public final /* sintético */ class VivifiedWrapper implements Stream {
        public final /* sintético */ java.util.stream.Stream wrappedValue;

        private /* sintético */ VivifiedWrapper(java.util.stream.Stream stream) {
            this.wrappedValue = stream;
        }

        public static /* sintético */ Stream convert(java.util.stream.Stream stream) {
            if (stream == null) {
                return null;
            }
            return stream instanceof Wrapper ? Stream.this : new VivifiedWrapper(stream);
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ boolean allMatch(Predicate predicate) {
            return this.wrappedValue.allMatch(predicate);
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ boolean anyMatch(Predicate predicate) {
            return this.wrappedValue.anyMatch(predicate);
        }

        @Override // j$.util.stream.BaseStream, java.lang.AutoCloseable
        public /* sintético */ void close() {
            this.wrappedValue.close();
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ Object collect(Collector collector) {
            return this.wrappedValue.collect(Collector.Wrapper.convert(collector));
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ Object collect(Supplier supplier, BiConsumer biConsumer, BiConsumer biConsumer2) {
            return this.wrappedValue.collect(supplier, biConsumer, biConsumer2);
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ long count() {
            return this.wrappedValue.count();
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ Stream distinct() {
            return convert(this.wrappedValue.distinct());
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ Stream dropWhile(Predicate predicate) {
            return convert(this.wrappedValue.dropWhile(predicate));
        }

        public /* sintético */ boolean equals(Object obj) {
            java.util.stream.Stream stream = this.wrappedValue;
            if (obj instanceof VivifiedWrapper) {
                obj = ((VivifiedWrapper) obj).wrappedValue;
            }
            return stream.equals(obj);
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ Stream filter(Predicate predicate) {
            return convert(this.wrappedValue.filter(predicate));
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ Optional findAny() {
            return OptionalConversions.convert(this.wrappedValue.findAny());
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ Optional findFirst() {
            return OptionalConversions.convert(this.wrappedValue.findFirst());
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ Stream flatMap(Function function) {
            return convert(this.wrappedValue.flatMap(FlatMapApiFlips.flipFunctionReturningStream((Function<?, ?>) function)));
        }

        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        @Override // j$.util.stream.Stream
        public /* sintético */ DoubleStream flatMapToDouble(Function function) {
            return DoubleStream.VivifiedWrapper.convert(this.wrappedValue.flatMapToDouble(FlatMapApiFlips.flipFunctionReturningStream((Function<?, ?>) function)));
        }

        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        @Override // j$.util.stream.Stream
        public /* sintético */ IntStream flatMapToInt(Function function) {
            return IntStream.VivifiedWrapper.convert(this.wrappedValue.flatMapToInt(FlatMapApiFlips.flipFunctionReturningStream((Function<?, ?>) function)));
        }

        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        @Override // j$.util.stream.Stream
        public /* sintético */ LongStream flatMapToLong(Function function) {
            return LongStream.VivifiedWrapper.convert(this.wrappedValue.flatMapToLong(FlatMapApiFlips.flipFunctionReturningStream((Function<?, ?>) function)));
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ void forEach(Consumer consumer) {
            this.wrappedValue.forEach(consumer);
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ void forEachOrdered(Consumer consumer) {
            this.wrappedValue.forEachOrdered(consumer);
        }

        public /* sintético */ int hashCode() {
            return this.wrappedValue.hashCode();
        }

        @Override // j$.util.stream.BaseStream
        public /* sintético */ boolean isParallel() {
            return this.wrappedValue.isParallel();
        }

        @Override // j$.util.stream.BaseStream
        public /* sintético */ Iterator iterator() {
            return this.wrappedValue.iterator();
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ Stream limit(long j) {
            return convert(this.wrappedValue.limit(j));
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ Stream map(Function function) {
            return convert(this.wrappedValue.map(function));
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ DoubleStream mapToDouble(ToDoubleFunction toDoubleFunction) {
            return DoubleStream.VivifiedWrapper.convert(this.wrappedValue.mapToDouble(toDoubleFunction));
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ IntStream mapToInt(ToIntFunction toIntFunction) {
            return IntStream.VivifiedWrapper.convert(this.wrappedValue.mapToInt(toIntFunction));
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ LongStream mapToLong(ToLongFunction toLongFunction) {
            return LongStream.VivifiedWrapper.convert(this.wrappedValue.mapToLong(toLongFunction));
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ Optional max(Comparator comparator) {
            return OptionalConversions.convert(this.wrappedValue.max(comparator));
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ Optional min(Comparator comparator) {
            return OptionalConversions.convert(this.wrappedValue.min(comparator));
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ boolean noneMatch(Predicate predicate) {
            return this.wrappedValue.noneMatch(predicate);
        }

        @Override // j$.util.stream.BaseStream
        public /* sintético */ BaseStream onClose(Runnable runnable) {
            return BaseStream.VivifiedWrapper.convert(this.wrappedValue.onClose(runnable));
        }

        @Override // j$.util.stream.BaseStream
        public /* sintético */ BaseStream parallel() {
            return BaseStream.VivifiedWrapper.convert(this.wrappedValue.parallel());
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ Stream peek(Consumer consumer) {
            return convert(this.wrappedValue.peek(consumer));
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ Optional reduce(BinaryOperator binaryOperator) {
            return OptionalConversions.convert(this.wrappedValue.reduce(binaryOperator));
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ Object reduce(Object obj, BiFunction biFunction, BinaryOperator binaryOperator) {
            return this.wrappedValue.reduce(obj, biFunction, binaryOperator);
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ Object reduce(Object obj, BinaryOperator binaryOperator) {
            return this.wrappedValue.reduce(obj, binaryOperator);
        }

        @Override // j$.util.stream.BaseStream
        public /* sintético */ BaseStream sequential() {
            return BaseStream.VivifiedWrapper.convert(this.wrappedValue.sequential());
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ Stream skip(long j) {
            return convert(this.wrappedValue.skip(j));
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ Stream sorted() {
            return convert(this.wrappedValue.sorted());
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ Stream sorted(Comparator comparator) {
            return convert(this.wrappedValue.sorted(comparator));
        }

        @Override // j$.util.stream.BaseStream
        public /* sintético */ Spliterator spliterator() {
            return Spliterator.VivifiedWrapper.convert(this.wrappedValue.spliterator());
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ Stream takeWhile(Predicate predicate) {
            return convert(this.wrappedValue.takeWhile(predicate));
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ Object[] toArray() {
            return this.wrappedValue.toArray();
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ Object[] toArray(IntFunction intFunction) {
            return this.wrappedValue.toArray(intFunction);
        }

        @Override // j$.util.stream.Stream
        public /* sintético */ List toList() {
            return this.wrappedValue.toList();
        }

        @Override // j$.util.stream.BaseStream
        public /* sintético */ BaseStream unordered() {
            return BaseStream.VivifiedWrapper.convert(this.wrappedValue.unordered());
        }
    }

    /* compiled from: D8$$SyntheticClass */
    public final /* sintético */ class Wrapper implements java.util.stream.Stream {
        private /* sintético */ Wrapper() {
        }

        public static /* sintético */ java.util.stream.Stream convert(Stream stream) {
            if (stream == null) {
                return null;
            }
            return stream instanceof VivifiedWrapper ? ((VivifiedWrapper) stream).wrappedValue : new Wrapper();
        }

        @Override // java.util.stream.Stream
        public /* sintético */ boolean allMatch(Predicate predicate) {
            return Stream.this.allMatch(predicate);
        }

        @Override // java.util.stream.Stream
        public /* sintético */ boolean anyMatch(Predicate predicate) {
            return Stream.this.anyMatch(predicate);
        }

        @Override // java.util.stream.BaseStream, java.lang.AutoCloseable
        public /* sintético */ void close() {
            Stream.this.close();
        }

        @Override // java.util.stream.Stream
        public /* sintético */ Object collect(Supplier supplier, BiConsumer biConsumer, BiConsumer biConsumer2) {
            return Stream.this.collect(supplier, biConsumer, biConsumer2);
        }

        @Override // java.util.stream.Stream
        public /* sintético */ Object collect(java.util.stream.Collector collector) {
            return Stream.this.collect(Collector.VivifiedWrapper.convert(collector));
        }

        @Override // java.util.stream.Stream
        public /* sintético */ long count() {
            return Stream.this.count();
        }

        @Override // java.util.stream.Stream
        public /* sintético */ java.util.stream.Stream distinct() {
            return convert(Stream.this.distinct());
        }

        @Override // java.util.stream.Stream
        public /* sintético */ java.util.stream.Stream dropWhile(Predicate predicate) {
            return convert(Stream.this.dropWhile(predicate));
        }

        public /* sintético */ boolean equals(Object obj) {
            Stream stream = Stream.this;
            if (obj instanceof Wrapper) {
                obj = Stream.this;
            }
            return stream.equals(obj);
        }

        @Override // java.util.stream.Stream
        public /* sintético */ java.util.stream.Stream filter(Predicate predicate) {
            return convert(Stream.this.filter(predicate));
        }

        @Override // java.util.stream.Stream
        public /* sintético */ java.util.Optional findAny() {
            return OptionalConversions.convert(Stream.this.findAny());
        }

        @Override // java.util.stream.Stream
        public /* sintético */ java.util.Optional findFirst() {
            return OptionalConversions.convert(Stream.this.findFirst());
        }

        @Override // java.util.stream.Stream
        public /* sintético */ java.util.stream.Stream flatMap(Function function) {
            return convert(Stream.this.flatMap(FlatMapApiFlips.flipFunctionReturningStream((Function<?, ?>) function)));
        }

        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        @Override // java.util.stream.Stream
        public /* sintético */ java.util.stream.DoubleStream flatMapToDouble(Function function) {
            return DoubleStream.Wrapper.convert(Stream.this.flatMapToDouble(FlatMapApiFlips.flipFunctionReturningStream((Function<?, ?>) function)));
        }

        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        @Override // java.util.stream.Stream
        public /* sintético */ java.util.stream.IntStream flatMapToInt(Function function) {
            return IntStream.Wrapper.convert(Stream.this.flatMapToInt(FlatMapApiFlips.flipFunctionReturningStream((Function<?, ?>) function)));
        }

        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        @Override // java.util.stream.Stream
        public /* sintético */ java.util.stream.LongStream flatMapToLong(Function function) {
            return LongStream.Wrapper.convert(Stream.this.flatMapToLong(FlatMapApiFlips.flipFunctionReturningStream((Function<?, ?>) function)));
        }

        @Override // java.util.stream.Stream
        public /* sintético */ void forEach(Consumer consumer) {
            Stream.this.forEach(consumer);
        }

        @Override // java.util.stream.Stream
        public /* sintético */ void forEachOrdered(Consumer consumer) {
            Stream.this.forEachOrdered(consumer);
        }

        public /* sintético */ int hashCode() {
            return Stream.this.hashCode();
        }

        @Override // java.util.stream.BaseStream
        public /* sintético */ boolean isParallel() {
            return Stream.this.isParallel();
        }

        @Override // java.util.stream.BaseStream
        public /* sintético */ Iterator iterator() {
            return Stream.this.iterator();
        }

        @Override // java.util.stream.Stream
        public /* sintético */ java.util.stream.Stream limit(long j) {
            return convert(Stream.this.limit(j));
        }

        @Override // java.util.stream.Stream
        public /* sintético */ java.util.stream.Stream map(Function function) {
            return convert(Stream.this.map(function));
        }

        @Override // java.util.stream.Stream
        public /* sintético */ java.util.stream.DoubleStream mapToDouble(ToDoubleFunction toDoubleFunction) {
            return DoubleStream.Wrapper.convert(Stream.this.mapToDouble(toDoubleFunction));
        }

        @Override // java.util.stream.Stream
        public /* sintético */ java.util.stream.IntStream mapToInt(ToIntFunction toIntFunction) {
            return IntStream.Wrapper.convert(Stream.this.mapToInt(toIntFunction));
        }

        @Override // java.util.stream.Stream
        public /* sintético */ java.util.stream.LongStream mapToLong(ToLongFunction toLongFunction) {
            return LongStream.Wrapper.convert(Stream.this.mapToLong(toLongFunction));
        }

        @Override // java.util.stream.Stream
        public /* sintético */ java.util.Optional max(Comparator comparator) {
            return OptionalConversions.convert(Stream.this.max(comparator));
        }

        @Override // java.util.stream.Stream
        public /* sintético */ java.util.Optional min(Comparator comparator) {
            return OptionalConversions.convert(Stream.this.min(comparator));
        }

        @Override // java.util.stream.Stream
        public /* sintético */ boolean noneMatch(Predicate predicate) {
            return Stream.this.noneMatch(predicate);
        }

        @Override // java.util.stream.BaseStream
        public /* sintético */ java.util.stream.BaseStream onClose(Runnable runnable) {
            return BaseStream.Wrapper.convert(Stream.this.onClose(runnable));
        }

        @Override // java.util.stream.BaseStream
        public /* sintético */ java.util.stream.BaseStream parallel() {
            return BaseStream.Wrapper.convert(Stream.this.parallel());
        }

        @Override // java.util.stream.Stream
        public /* sintético */ java.util.stream.Stream peek(Consumer consumer) {
            return convert(Stream.this.peek(consumer));
        }

        @Override // java.util.stream.Stream
        public /* sintético */ Object reduce(Object obj, BiFunction biFunction, BinaryOperator binaryOperator) {
            return Stream.this.reduce(obj, biFunction, binaryOperator);
        }

        @Override // java.util.stream.Stream
        public /* sintético */ Object reduce(Object obj, BinaryOperator binaryOperator) {
            return Stream.this.reduce(obj, binaryOperator);
        }

        @Override // java.util.stream.Stream
        public /* sintético */ java.util.Optional reduce(BinaryOperator binaryOperator) {
            return OptionalConversions.convert(Stream.this.reduce(binaryOperator));
        }

        @Override // java.util.stream.BaseStream
        public /* sintético */ java.util.stream.BaseStream sequential() {
            return BaseStream.Wrapper.convert(Stream.this.sequential());
        }

        @Override // java.util.stream.Stream
        public /* sintético */ java.util.stream.Stream skip(long j) {
            return convert(Stream.this.skip(j));
        }

        @Override // java.util.stream.Stream
        public /* sintético */ java.util.stream.Stream sorted() {
            return convert(Stream.this.sorted());
        }

        @Override // java.util.stream.Stream
        public /* sintético */ java.util.stream.Stream sorted(Comparator comparator) {
            return convert(Stream.this.sorted(comparator));
        }

        @Override // java.util.stream.BaseStream
        public /* sintético */ java.util.Spliterator spliterator() {
            return Spliterator.Wrapper.convert(Stream.this.spliterator());
        }

        @Override // java.util.stream.Stream
        public /* sintético */ java.util.stream.Stream takeWhile(Predicate predicate) {
            return convert(Stream.this.takeWhile(predicate));
        }

        @Override // java.util.stream.Stream
        public /* sintético */ Object[] toArray() {
            return Stream.this.toArray();
        }

        @Override // java.util.stream.Stream
        public /* sintético */ Object[] toArray(IntFunction intFunction) {
            return Stream.this.toArray(intFunction);
        }

        @Override // java.util.stream.Stream
        public /* sintético */ List toList() {
            return Stream.this.toList();
        }

        @Override // java.util.stream.BaseStream
        public /* sintético */ java.util.stream.BaseStream unordered() {
            return BaseStream.Wrapper.convert(Stream.this.unordered());
        }
    }

    boolean allMatch(Predicate<? super T> predicate);

    boolean anyMatch(Predicate<? super T> predicate);

    <R, A> R collect(Collector<? super T, A, R> collector);

    <R> R collect(Supplier<R> supplier, BiConsumer<R, ? super T> biConsumer, BiConsumer<R, R> biConsumer2);

    long count();

    Stream<T> distinct();

    Stream<T> dropWhile(Predicate<? super T> predicate);

    Stream<T> filter(Predicate<? super T> predicate);

    Optional<T> findAny();

    Optional<T> findFirst();

    <R> Stream<R> flatMap(Function<? super T, ? extends Stream<? extends R>> function);

    DoubleStream flatMapToDouble(Function<? super T, ? extends DoubleStream> function);

    IntStream flatMapToInt(Function<? super T, ? extends IntStream> function);

    LongStream flatMapToLong(Function<? super T, ? extends LongStream> function);

    void forEach(Consumer<? super T> consumer);

    void forEachOrdered(Consumer<? super T> consumer);

    Stream<T> limit(long j);

    <R> Stream<R> map(Function<? super T, ? extends R> function);

    DoubleStream mapToDouble(ToDoubleFunction<? super T> toDoubleFunction);

    IntStream mapToInt(ToIntFunction<? super T> toIntFunction);

    LongStream mapToLong(ToLongFunction<? super T> toLongFunction);

    Optional<T> max(Comparator<? super T> comparator);

    Optional<T> min(Comparator<? super T> comparator);

    boolean noneMatch(Predicate<? super T> predicate);

    Stream<T> peek(Consumer<? super T> consumer);

    Optional<T> reduce(BinaryOperator<T> binaryOperator);

    <U> U reduce(U u, BiFunction<U, ? super T, U> biFunction, BinaryOperator<U> binaryOperator);

    T reduce(T t, BinaryOperator<T> binaryOperator);

    Stream<T> skip(long j);

    Stream<T> sorted();

    Stream<T> sorted(Comparator<? super T> comparator);

    Stream<T> takeWhile(Predicate<? super T> predicate);

    Object[] toArray();

    <A> A[] toArray(IntFunction<A[]> intFunction);

    List<T> toList();

    /* renomeado de: j$.util.stream.Stream$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        public static Stream $default$takeWhile(Stream _this, Predicate predicate) {
            Objects.requireNonNull(predicate);
            return StreamSupport.stream(new WhileOps.UnorderedWhileSpliterator.OfRef.Taking(_this.spliterator(), true, predicate), _this.isParallel()).onClose(new Stream$$ExternalSyntheticLambda0(_this));
        }

        public static Stream $default$dropWhile(Stream _this, Predicate predicate) {
            Objects.requireNonNull(predicate);
            return StreamSupport.stream(new WhileOps.UnorderedWhileSpliterator.OfRef.Dropping(_this.spliterator(), true, predicate), _this.isParallel()).onClose(new Stream$$ExternalSyntheticLambda0(_this));
        }

        public static <T> Builder<T> builder() {
            return new Streams.StreamBuilderImpl();
        }

        public static <T> Stream<T> empty() {
            return StreamSupport.stream(Spliterators.emptySpliterator(), false);
        }

        public static <T> Stream<T> of(T t) {
            return StreamSupport.stream(new Streams.StreamBuilderImpl(t), false);
        }

        public static <T> Stream<T> ofNullable(T t) {
            return t == null ? empty() : StreamSupport.stream(new Streams.StreamBuilderImpl(t), false);
        }

        public static <T> Stream<T> of(T... values) {
            return DesugarArrays.stream(values);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<T> */
        public static <T> Stream<T> iterate(final T seed, final UnaryOperator<T> f) {
            Objects.requireNonNull(f);
            return StreamSupport.stream(new Spliterators.AbstractSpliterator<T>(Long.MAX_VALUE, 1040) { // da classe: j$.util.stream.Stream.1
                T prev;
                boolean started;

                @Override // j$.util.Spliterator
                public boolean tryAdvance(Consumer<? super T> consumer) {
                    T t;
                    Objects.requireNonNull(consumer);
                    if (this.started) {
                        t = f.apply(this.prev);
                    } else {
                        t = (T) seed;
                        this.started = true;
                    }
                    this.prev = t;
                    consumer.accept(t);
                    return true;
                }
            }, false);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<T> */
        public static <T> Stream<T> iterate(final T seed, final Predicate<? super T> hasNext, final UnaryOperator<T> next) {
            Objects.requireNonNull(next);
            Objects.requireNonNull(hasNext);
            return StreamSupport.stream(new Spliterators.AbstractSpliterator<T>(Long.MAX_VALUE, 1040) { // da classe: j$.util.stream.Stream.2
                boolean finished;
                T prev;
                boolean started;

                @Override // j$.util.Spliterator
                public boolean tryAdvance(Consumer<? super T> consumer) {
                    T t;
                    Objects.requireNonNull(consumer);
                    if (this.finished) {
                        return false;
                    }
                    if (this.started) {
                        t = next.apply(this.prev);
                    } else {
                        t = (T) seed;
                        this.started = true;
                    }
                    if (!hasNext.test(t)) {
                        this.prev = null;
                        this.finished = true;
                        return false;
                    }
                    this.prev = t;
                    consumer.accept(t);
                    return true;
                }

                /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
                @Override // j$.util.Spliterators.AbstractSpliterator, j$.util.Spliterator
                public void forEachRemaining(Consumer<? super T> action) {
                    Objects.requireNonNull(action);
                    if (this.finished) {
                        return;
                    }
                    this.finished = true;
                    Object apply = this.started ? next.apply(this.prev) : seed;
                    this.prev = null;
                    while (hasNext.test(apply)) {
                        action.accept(apply);
                        apply = next.apply(apply);
                    }
                }
            }, false);
        }

        public static <T> Stream<T> generate(Supplier<? extends T> s) {
            Objects.requireNonNull(s);
            return StreamSupport.stream(new StreamSpliterators.InfiniteSupplyingSpliterator.OfRef(Long.MAX_VALUE, s), false);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<T> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Stream != java.util.stream.Stream<? extends T> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Stream != java.util.stream.Stream<T> */
        public static <T> Stream<T> concat(Stream<? extends T> stream, Stream<? extends T> stream2) {
            Objects.requireNonNull(stream);
            Objects.requireNonNull(stream2);
            return StreamSupport.stream(new Streams.ConcatSpliterator.OfRef(stream.spliterator(), stream2.spliterator()), stream.isParallel() || stream2.isParallel()).onClose(Streams.composedClose(stream, stream2));
        }
    }

    public interface Builder<T> extends Consumer<T> {
        @Override // java.util.function.Consumer
        void accept(T t);

        Builder<T> add(T t);

        Stream<T> build();

        /* renomeado de: j$.util.stream.Stream$Builder$-CC, motivo: nome de classe inválido */
        public final /* sintético */ class CC {
            public static Builder $default$add(Builder _this, Object obj) {
                _this.accept(obj);
                return _this;
            }
        }
    }
}
