package j$.util.stream;

import j$.util.Objects;
import j$.util.stream.Collectors;
import java.util.Collections;
import java.util.EnumSet;
import java.util.Set;
import java.util.function.BiConsumer;
import java.util.function.BinaryOperator;
import java.util.function.Function;
import java.util.function.Supplier;
import java.util.stream.Collector;

/* carregado de: classes15.dex */
public interface Collector<T, A, R> {

    public enum Characteristics {
        CONCURRENT,
        UNORDERED,
        IDENTITY_FINISH;

        /* compiled from: D8$$SyntheticClass */
        public final /* sintético */ class EnumConversion {
            public static /* sintético */ Characteristics convert(Collector.Characteristics characteristics) {
                if (characteristics == null) {
                    return null;
                }
                return characteristics == Collector.Characteristics.CONCURRENT ? Characteristics.CONCURRENT : characteristics == Collector.Characteristics.UNORDERED ? Characteristics.UNORDERED : Characteristics.IDENTITY_FINISH;
            }

            public static /* sintético */ Collector.Characteristics convert(Characteristics characteristics) {
                if (characteristics == null) {
                    return null;
                }
                return characteristics == Characteristics.CONCURRENT ? Collector.Characteristics.CONCURRENT : characteristics == Characteristics.UNORDERED ? Collector.Characteristics.UNORDERED : Collector.Characteristics.IDENTITY_FINISH;
            }
        }
    }

    /* compiled from: D8$$SyntheticClass */
    public final /* sintético */ class VivifiedWrapper implements Collector {
        public final /* sintético */ java.util.stream.Collector wrappedValue;

        private /* sintético */ VivifiedWrapper(java.util.stream.Collector collector) {
            this.wrappedValue = collector;
        }

        public static /* sintético */ Collector convert(java.util.stream.Collector collector) {
            if (collector == null) {
                return null;
            }
            return collector instanceof Wrapper ? Collector.this : new VivifiedWrapper(collector);
        }

        @Override // j$.util.stream.Collector
        public /* sintético */ BiConsumer accumulator() {
            return this.wrappedValue.accumulator();
        }

        @Override // j$.util.stream.Collector
        public /* sintético */ Set characteristics() {
            return StreamApiFlips.flipCharacteristicSet(this.wrappedValue.characteristics());
        }

        @Override // j$.util.stream.Collector
        public /* sintético */ BinaryOperator combiner() {
            return this.wrappedValue.combiner();
        }

        public /* sintético */ boolean equals(Object obj) {
            java.util.stream.Collector collector = this.wrappedValue;
            if (obj instanceof VivifiedWrapper) {
                obj = ((VivifiedWrapper) obj).wrappedValue;
            }
            return collector.equals(obj);
        }

        @Override // j$.util.stream.Collector
        public /* sintético */ Function finisher() {
            return this.wrappedValue.finisher();
        }

        public /* sintético */ int hashCode() {
            return this.wrappedValue.hashCode();
        }

        @Override // j$.util.stream.Collector
        public /* sintético */ Supplier supplier() {
            return this.wrappedValue.supplier();
        }
    }

    /* compiled from: D8$$SyntheticClass */
    public final /* sintético */ class Wrapper implements java.util.stream.Collector {
        private /* sintético */ Wrapper() {
        }

        public static /* sintético */ java.util.stream.Collector convert(Collector collector) {
            if (collector == null) {
                return null;
            }
            return collector instanceof VivifiedWrapper ? ((VivifiedWrapper) collector).wrappedValue : new Wrapper();
        }

        @Override // java.util.stream.Collector
        public /* sintético */ BiConsumer accumulator() {
            return Collector.this.accumulator();
        }

        @Override // java.util.stream.Collector
        public /* sintético */ Set characteristics() {
            return StreamApiFlips.flipCharacteristicSet(Collector.this.characteristics());
        }

        @Override // java.util.stream.Collector
        public /* sintético */ BinaryOperator combiner() {
            return Collector.this.combiner();
        }

        public /* sintético */ boolean equals(Object obj) {
            Collector collector = Collector.this;
            if (obj instanceof Wrapper) {
                obj = Collector.this;
            }
            return collector.equals(obj);
        }

        @Override // java.util.stream.Collector
        public /* sintético */ Function finisher() {
            return Collector.this.finisher();
        }

        public /* sintético */ int hashCode() {
            return Collector.this.hashCode();
        }

        @Override // java.util.stream.Collector
        public /* sintético */ Supplier supplier() {
            return Collector.this.supplier();
        }
    }

    BiConsumer<A, T> accumulator();

    Set<Characteristics> characteristics();

    BinaryOperator<A> combiner();

    Function<A, R> finisher();

    Supplier<A> supplier();

    /* renomeado de: j$.util.stream.Collector$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        public static <T, R> Collector<T, R, R> of(Supplier<R> supplier, BiConsumer<R, T> accumulator, BinaryOperator<R> combiner, Characteristics... characteristics) {
            Set<Characteristics> unmodifiableSet;
            Objects.requireNonNull(supplier);
            Objects.requireNonNull(accumulator);
            Objects.requireNonNull(combiner);
            Objects.requireNonNull(characteristics);
            if (characteristics.length == 0) {
                unmodifiableSet = Collectors.CH_ID;
            } else {
                unmodifiableSet = Collections.unmodifiableSet(EnumSet.of(Characteristics.IDENTITY_FINISH, characteristics));
            }
            return new Collectors.CollectorImpl(supplier, accumulator, combiner, unmodifiableSet);
        }

        public static <T, A, R> Collector<T, A, R> of(Supplier<A> supplier, BiConsumer<A, T> accumulator, BinaryOperator<A> combiner, Function<A, R> finisher, Characteristics... characteristics) {
            Set<Characteristics> set;
            Objects.requireNonNull(supplier);
            Objects.requireNonNull(accumulator);
            Objects.requireNonNull(combiner);
            Objects.requireNonNull(finisher);
            Objects.requireNonNull(characteristics);
            Set<Characteristics> set2 = Collectors.CH_NOID;
            if (characteristics.length <= 0) {
                set = set2;
            } else {
                Set<Collector.Characteristics> cs = EnumSet.noneOf(Characteristics.class);
                Collections.addAll(cs, characteristics);
                set = Collections.unmodifiableSet(cs);
            }
            return new Collectors.CollectorImpl(supplier, accumulator, combiner, finisher, set);
        }
    }
}
