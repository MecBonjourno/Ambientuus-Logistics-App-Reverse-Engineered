package j$.util.stream;

import j$.time.Duration$DurationUnits$$ExternalSyntheticBackport0;
import j$.time.ZoneId$$ExternalSyntheticBackport1;
import j$.util.CollSer$$ExternalSyntheticBackport0;
import j$.util.Objects;
import j$.util.function.BiConsumer$CC;
import j$.util.function.BiFunction$CC;
import j$.util.function.Consumer$CC;
import j$.util.function.Function$CC;
import j$.util.stream.Collector;
import java.util.Collections;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.BiConsumer;
import java.util.function.BiFunction;
import java.util.function.BinaryOperator;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.function.Supplier;

/* carregado de: classes15.dex */
public final class DesugarCollectors {
    static final Set<Collector.Characteristics> CH_NOID = Collections.emptySet();
    static final Set<Collector.Characteristics> CH_UNORDERED_NOID = Collections.unmodifiableSet(EnumSet.of(Collector.Characteristics.UNORDERED));

    private DesugarCollectors() {
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Collector != java.util.stream.Collector<? super T, A, R> */
    public static <T, A, R> Collector<T, ?, R> filtering(final Predicate<? super T> predicate, Collector<? super T, A, R> collector) {
        final BiConsumer<A, ? super T> downstreamAccumulator = collector.accumulator();
        return new CollectorImpl(collector.supplier(), new BiConsumer() { // da classe: j$.util.stream.DesugarCollectors$$ExternalSyntheticLambda8
            @Override // java.util.function.BiConsumer
            public final void accept(Object obj, Object obj2) {
                DesugarCollectors.lambda$filtering$0(Predicate.this, downstreamAccumulator, obj, obj2);
            }

            @Override // java.util.function.BiConsumer
            public /* sintético */ BiConsumer andThen(BiConsumer biConsumer) {
                return BiConsumer$CC.$default$andThen(this, biConsumer);
            }
        }, collector.combiner(), collector.finisher(), collector.characteristics());
    }

    static /* sintético */ void lambda$filtering$0(Predicate predicate, BiConsumer downstreamAccumulator, Object r, Object t) {
        if (predicate.test(t)) {
            downstreamAccumulator.accept(r, t);
        }
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Collector != java.util.stream.Collector<? super U, A, R> */
    public static <T, U, A, R> Collector<T, ?, R> flatMapping(final Function<? super T, ? extends Stream<? extends U>> function, Collector<? super U, A, R> collector) {
        final BiConsumer<A, ? super U> downstreamAccumulator = collector.accumulator();
        return new CollectorImpl(collector.supplier(), new BiConsumer() { // da classe: j$.util.stream.DesugarCollectors$$ExternalSyntheticLambda5
            @Override // java.util.function.BiConsumer
            public final void accept(Object obj, Object obj2) {
                DesugarCollectors.lambda$flatMapping$2(Function.this, downstreamAccumulator, obj, obj2);
            }

            @Override // java.util.function.BiConsumer
            public /* sintético */ BiConsumer andThen(BiConsumer biConsumer) {
                return BiConsumer$CC.$default$andThen(this, biConsumer);
            }
        }, collector.combiner(), collector.finisher(), collector.characteristics());
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Stream != java.util.stream.Stream<? extends U> */
    static /* sintético */ void lambda$flatMapping$2(Function mapper, final BiConsumer downstreamAccumulator, final Object r, Object t) {
        Stream stream = (Stream) mapper.apply(t);
        if (stream != null) {
            try {
                stream.sequential().forEach(new Consumer() { // da classe: j$.util.stream.DesugarCollectors$$ExternalSyntheticLambda4
                    @Override // java.util.function.Consumer
                    public final void accept(Object obj) {
                        BiConsumer.this.accept(r, obj);
                    }

                    @Override // java.util.function.Consumer
                    public /* sintético */ Consumer andThen(Consumer consumer) {
                        return Consumer$CC.$default$andThen(this, consumer);
                    }
                });
            } catch (Throwable th) {
                if (stream != null) {
                    try {
                        stream.close();
                    } catch (Throwable th2) {
                        th.addSuppressed(th2);
                    }
                }
                throw th;
            }
        }
        if (stream != null) {
            stream.close();
        }
    }

    public static <T> Collector<T, ?, List<T>> toUnmodifiableList() {
        return new CollectorImpl(new Collectors$$ExternalSyntheticLambda21(), new Collectors$$ExternalSyntheticLambda22(), new BinaryOperator() { // da classe: j$.util.stream.DesugarCollectors$$ExternalSyntheticLambda0
            @Override // java.util.function.BiFunction
            public /* sintético */ BiFunction andThen(Function function) {
                return BiFunction$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.BiFunction
            public final Object apply(Object obj, Object obj2) {
                return DesugarCollectors.lambda$toUnmodifiableList$3((List) obj, (List) obj2);
            }
        }, new Function() { // da classe: j$.util.stream.DesugarCollectors$$ExternalSyntheticLambda1
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                List m;
                m = Duration$DurationUnits$$ExternalSyntheticBackport0.m(((List) obj).toArray());
                return m;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, CH_NOID);
    }

    static /* sintético */ List lambda$toUnmodifiableList$3(List left, List right) {
        left.addAll(right);
        return left;
    }

    public static <T, K, U> Collector<T, ?, Map<K, U>> toUnmodifiableMap(Function<? super T, ? extends K> keyMapper, Function<? super T, ? extends U> valueMapper) {
        Objects.requireNonNull(keyMapper, "keyMapper");
        Objects.requireNonNull(valueMapper, "valueMapper");
        return Collectors.collectingAndThen(Collectors.toMap(keyMapper, valueMapper), new Function() { // da classe: j$.util.stream.DesugarCollectors$$ExternalSyntheticLambda6
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Map m;
                m = ZoneId$$ExternalSyntheticBackport1.m((Map.Entry[]) ((Map) obj).entrySet().toArray(new Map.Entry[0]));
                return m;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    public static <T, K, U> Collector<T, ?, Map<K, U>> toUnmodifiableMap(Function<? super T, ? extends K> keyMapper, Function<? super T, ? extends U> valueMapper, BinaryOperator<U> mergeFunction) {
        Objects.requireNonNull(keyMapper, "keyMapper");
        Objects.requireNonNull(valueMapper, "valueMapper");
        Objects.requireNonNull(mergeFunction, "mergeFunction");
        return Collectors.collectingAndThen(Collectors.toMap(keyMapper, valueMapper, mergeFunction, new Collectors$$ExternalSyntheticLambda73()), new Function() { // da classe: j$.util.stream.DesugarCollectors$$ExternalSyntheticLambda7
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Map m;
                m = ZoneId$$ExternalSyntheticBackport1.m((Map.Entry[]) ((HashMap) obj).entrySet().toArray(new Map.Entry[0]));
                return m;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    public static <T> Collector<T, ?, Set<T>> toUnmodifiableSet() {
        return new CollectorImpl(new Collectors$$ExternalSyntheticLambda43(), new Collectors$$ExternalSyntheticLambda44(), new BinaryOperator() { // da classe: j$.util.stream.DesugarCollectors$$ExternalSyntheticLambda2
            @Override // java.util.function.BiFunction
            public /* sintético */ BiFunction andThen(Function function) {
                return BiFunction$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.BiFunction
            public final Object apply(Object obj, Object obj2) {
                return DesugarCollectors.lambda$toUnmodifiableSet$7((Set) obj, (Set) obj2);
            }
        }, new Function() { // da classe: j$.util.stream.DesugarCollectors$$ExternalSyntheticLambda3
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Set m;
                m = CollSer$$ExternalSyntheticBackport0.m(((Set) obj).toArray());
                return m;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, CH_UNORDERED_NOID);
    }

    static /* sintético */ Set lambda$toUnmodifiableSet$7(Set left, Set right) {
        if (left.size() < right.size()) {
            right.addAll(left);
            return right;
        }
        left.addAll(right);
        return left;
    }

    static class CollectorImpl<T, A, R> implements Collector<T, A, R> {
        private final BiConsumer<A, T> accumulator;
        private final Set<Collector.Characteristics> characteristics;
        private final BinaryOperator<A> combiner;
        private final Function<A, R> finisher;
        private final Supplier<A> supplier;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DesugarCollectors$CollectorImpl != java.util.stream.DesugarCollectors$CollectorImpl<T, A, R> */
        CollectorImpl(Supplier<A> supplier, BiConsumer<A, T> accumulator, BinaryOperator<A> combiner, Function<A, R> finisher, Set<Collector.Characteristics> set) {
            this.supplier = supplier;
            this.accumulator = accumulator;
            this.combiner = combiner;
            this.finisher = finisher;
            this.characteristics = set;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DesugarCollectors$CollectorImpl != java.util.stream.DesugarCollectors$CollectorImpl<T, A, R> */
        CollectorImpl(Supplier<A> supplier, BiConsumer<A, T> accumulator, BinaryOperator<A> combiner, Set<Collector.Characteristics> set) {
            this(supplier, accumulator, combiner, DesugarCollectors.castingIdentity(), set);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DesugarCollectors$CollectorImpl != java.util.stream.DesugarCollectors$CollectorImpl<T, A, R> */
        @Override // j$.util.stream.Collector
        public BiConsumer<A, T> accumulator() {
            return this.accumulator;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DesugarCollectors$CollectorImpl != java.util.stream.DesugarCollectors$CollectorImpl<T, A, R> */
        @Override // j$.util.stream.Collector
        public Supplier<A> supplier() {
            return this.supplier;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DesugarCollectors$CollectorImpl != java.util.stream.DesugarCollectors$CollectorImpl<T, A, R> */
        @Override // j$.util.stream.Collector
        public BinaryOperator<A> combiner() {
            return this.combiner;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DesugarCollectors$CollectorImpl != java.util.stream.DesugarCollectors$CollectorImpl<T, A, R> */
        @Override // j$.util.stream.Collector
        public Function<A, R> finisher() {
            return this.finisher;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DesugarCollectors$CollectorImpl != java.util.stream.DesugarCollectors$CollectorImpl<T, A, R> */
        @Override // j$.util.stream.Collector
        public Set<Collector.Characteristics> characteristics() {
            return this.characteristics;
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static <I, R> Function<I, R> castingIdentity() {
        return new Function() { // da classe: j$.util.stream.DesugarCollectors$$ExternalSyntheticLambda9
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return DesugarCollectors.lambda$castingIdentity$9(obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        };
    }

    static /* sintético */ Object lambda$castingIdentity$9(Object i) {
        return i;
    }
}
