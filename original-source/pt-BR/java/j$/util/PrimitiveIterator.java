package j$.util;

import java.util.PrimitiveIterator;
import java.util.function.Consumer;
import java.util.function.DoubleConsumer;
import java.util.function.IntConsumer;
import java.util.function.LongConsumer;

/* carregado de: classes15.dex */
public interface PrimitiveIterator<T, T_CONS> extends java.util.Iterator<T> {
    void forEachRemaining(T_CONS t_cons);

    public interface OfInt extends PrimitiveIterator<Integer, IntConsumer> {

        /* compiled from: D8$$SyntheticClass */
        public final /* sintético */ class VivifiedWrapper implements OfInt, Iterator {
            public final /* sintético */ PrimitiveIterator.OfInt wrappedValue;

            private /* sintético */ VivifiedWrapper(PrimitiveIterator.OfInt ofInt) {
                this.wrappedValue = ofInt;
            }

            public static /* sintético */ OfInt convert(PrimitiveIterator.OfInt ofInt) {
                if (ofInt == null) {
                    return null;
                }
                return ofInt instanceof Wrapper ? OfInt.this : new VivifiedWrapper(ofInt);
            }

            public /* sintético */ boolean equals(Object obj) {
                PrimitiveIterator.OfInt ofInt = this.wrappedValue;
                if (obj instanceof VivifiedWrapper) {
                    obj = ((VivifiedWrapper) obj).wrappedValue;
                }
                return ofInt.equals(obj);
            }

            @Override // j$.util.PrimitiveIterator
            public /* sintético */ void forEachRemaining(IntConsumer intConsumer) {
                this.wrappedValue.forEachRemaining((PrimitiveIterator.OfInt) intConsumer);
            }

            @Override // j$.util.PrimitiveIterator.OfInt, java.util.Iterator
            public /* sintético */ void forEachRemaining(Consumer consumer) {
                this.wrappedValue.forEachRemaining((Consumer<? super Integer>) consumer);
            }

            @Override // j$.util.PrimitiveIterator.OfInt
            /* renomeado de: forEachRemaining, motivo: evitar colisão após correção de tipos em outro método */
            public /* sintético */ void forEachRemaining2(IntConsumer intConsumer) {
                this.wrappedValue.forEachRemaining(intConsumer);
            }

            @Override // java.util.Iterator
            public /* sintético */ boolean hasNext() {
                return this.wrappedValue.hasNext();
            }

            public /* sintético */ int hashCode() {
                return this.wrappedValue.hashCode();
            }

            @Override // j$.util.PrimitiveIterator.OfInt, java.util.Iterator
            public /* sintético */ Integer next() {
                return this.wrappedValue.next();
            }

            @Override // java.util.Iterator
            public /* sintético */ Object next() {
                return this.wrappedValue.next();
            }

            @Override // j$.util.PrimitiveIterator.OfInt
            public /* sintético */ int nextInt() {
                return this.wrappedValue.nextInt();
            }

            @Override // java.util.Iterator
            public /* sintético */ void remove() {
                this.wrappedValue.remove();
            }
        }

        /* compiled from: D8$$SyntheticClass */
        public final /* sintético */ class Wrapper implements PrimitiveIterator.OfInt {
            private /* sintético */ Wrapper() {
            }

            public static /* sintético */ PrimitiveIterator.OfInt convert(OfInt ofInt) {
                if (ofInt == null) {
                    return null;
                }
                return ofInt instanceof VivifiedWrapper ? ((VivifiedWrapper) ofInt).wrappedValue : ofInt.new Wrapper();
            }

            public /* sintético */ boolean equals(Object obj) {
                OfInt ofInt = OfInt.this;
                if (obj instanceof Wrapper) {
                    obj = OfInt.this;
                }
                return ofInt.equals(obj);
            }

            @Override // java.util.PrimitiveIterator
            public /* sintético */ void forEachRemaining(IntConsumer intConsumer) {
                OfInt.this.forEachRemaining((OfInt) intConsumer);
            }

            @Override // java.util.PrimitiveIterator.OfInt, java.util.Iterator
            public /* sintético */ void forEachRemaining(Consumer consumer) {
                OfInt.this.forEachRemaining((Consumer<? super Integer>) consumer);
            }

            @Override // java.util.PrimitiveIterator.OfInt
            /* renomeado de: forEachRemaining, motivo: evitar colisão após correção de tipos em outro método */
            public /* sintético */ void forEachRemaining2(IntConsumer intConsumer) {
                OfInt.this.forEachRemaining(intConsumer);
            }

            @Override // java.util.Iterator
            public /* sintético */ boolean hasNext() {
                return OfInt.this.hasNext();
            }

            public /* sintético */ int hashCode() {
                return OfInt.this.hashCode();
            }

            @Override // java.util.PrimitiveIterator.OfInt, java.util.Iterator
            public /* sintético */ Integer next() {
                return OfInt.this.next();
            }

            @Override // java.util.PrimitiveIterator.OfInt, java.util.Iterator
            public /* sintético */ Object next() {
                return OfInt.this.next();
            }

            @Override // java.util.PrimitiveIterator.OfInt
            public /* sintético */ int nextInt() {
                return OfInt.this.nextInt();
            }

            @Override // java.util.Iterator
            public /* sintético */ void remove() {
                OfInt.this.remove();
            }
        }

        @Override // java.util.Iterator
        void forEachRemaining(Consumer<? super Integer> consumer);

        void forEachRemaining(IntConsumer intConsumer);

        @Override // java.util.Iterator
        Integer next();

        int nextInt();

        /* renomeado de: j$.util.PrimitiveIterator$OfInt$-CC, motivo: nome de classe inválido */
        public final /* sintético */ class CC {
            public static void $default$forEachRemaining(OfInt _this, IntConsumer action) {
                Objects.requireNonNull(action);
                while (_this.hasNext()) {
                    action.accept(_this.nextInt());
                }
            }

            public static Integer $default$next(OfInt _this) {
                if (Tripwire.ENABLED) {
                    Tripwire.trip(_this.getClass(), "{0} calling PrimitiveIterator.OfInt.nextInt()");
                }
                return Integer.valueOf(_this.nextInt());
            }

            public static void $default$forEachRemaining(OfInt _this, Consumer consumer) {
                if (consumer instanceof IntConsumer) {
                    _this.forEachRemaining((IntConsumer) consumer);
                    return;
                }
                Objects.requireNonNull(consumer);
                if (Tripwire.ENABLED) {
                    Tripwire.trip(_this.getClass(), "{0} calling PrimitiveIterator.OfInt.forEachRemainingInt(action::accept)");
                }
                Objects.requireNonNull(consumer);
                _this.forEachRemaining((IntConsumer) new PrimitiveIterator$OfInt$$ExternalSyntheticLambda0(consumer));
            }
        }
    }

    public interface OfLong extends PrimitiveIterator<Long, LongConsumer> {

        /* compiled from: D8$$SyntheticClass */
        public final /* sintético */ class VivifiedWrapper implements OfLong, Iterator {
            public final /* sintético */ PrimitiveIterator.OfLong wrappedValue;

            private /* sintético */ VivifiedWrapper(PrimitiveIterator.OfLong ofLong) {
                this.wrappedValue = ofLong;
            }

            public static /* sintético */ OfLong convert(PrimitiveIterator.OfLong ofLong) {
                if (ofLong == null) {
                    return null;
                }
                return ofLong instanceof Wrapper ? OfLong.this : new VivifiedWrapper(ofLong);
            }

            public /* sintético */ boolean equals(Object obj) {
                PrimitiveIterator.OfLong ofLong = this.wrappedValue;
                if (obj instanceof VivifiedWrapper) {
                    obj = ((VivifiedWrapper) obj).wrappedValue;
                }
                return ofLong.equals(obj);
            }

            @Override // j$.util.PrimitiveIterator
            public /* sintético */ void forEachRemaining(LongConsumer longConsumer) {
                this.wrappedValue.forEachRemaining((PrimitiveIterator.OfLong) longConsumer);
            }

            @Override // j$.util.PrimitiveIterator.OfLong, java.util.Iterator
            public /* sintético */ void forEachRemaining(Consumer consumer) {
                this.wrappedValue.forEachRemaining((Consumer<? super Long>) consumer);
            }

            @Override // j$.util.PrimitiveIterator.OfLong
            /* renomeado de: forEachRemaining, motivo: evitar colisão após correção de tipos em outro método */
            public /* sintético */ void forEachRemaining2(LongConsumer longConsumer) {
                this.wrappedValue.forEachRemaining(longConsumer);
            }

            @Override // java.util.Iterator
            public /* sintético */ boolean hasNext() {
                return this.wrappedValue.hasNext();
            }

            public /* sintético */ int hashCode() {
                return this.wrappedValue.hashCode();
            }

            @Override // j$.util.PrimitiveIterator.OfLong, java.util.Iterator
            public /* sintético */ Long next() {
                return this.wrappedValue.next();
            }

            @Override // java.util.Iterator
            public /* sintético */ Object next() {
                return this.wrappedValue.next();
            }

            @Override // j$.util.PrimitiveIterator.OfLong
            public /* sintético */ long nextLong() {
                return this.wrappedValue.nextLong();
            }

            @Override // java.util.Iterator
            public /* sintético */ void remove() {
                this.wrappedValue.remove();
            }
        }

        /* compiled from: D8$$SyntheticClass */
        public final /* sintético */ class Wrapper implements PrimitiveIterator.OfLong {
            private /* sintético */ Wrapper() {
            }

            public static /* sintético */ PrimitiveIterator.OfLong convert(OfLong ofLong) {
                if (ofLong == null) {
                    return null;
                }
                return ofLong instanceof VivifiedWrapper ? ((VivifiedWrapper) ofLong).wrappedValue : ofLong.new Wrapper();
            }

            public /* sintético */ boolean equals(Object obj) {
                OfLong ofLong = OfLong.this;
                if (obj instanceof Wrapper) {
                    obj = OfLong.this;
                }
                return ofLong.equals(obj);
            }

            @Override // java.util.PrimitiveIterator
            public /* sintético */ void forEachRemaining(LongConsumer longConsumer) {
                OfLong.this.forEachRemaining((OfLong) longConsumer);
            }

            @Override // java.util.PrimitiveIterator.OfLong, java.util.Iterator
            public /* sintético */ void forEachRemaining(Consumer consumer) {
                OfLong.this.forEachRemaining((Consumer<? super Long>) consumer);
            }

            @Override // java.util.PrimitiveIterator.OfLong
            /* renomeado de: forEachRemaining, motivo: evitar colisão após correção de tipos em outro método */
            public /* sintético */ void forEachRemaining2(LongConsumer longConsumer) {
                OfLong.this.forEachRemaining(longConsumer);
            }

            @Override // java.util.Iterator
            public /* sintético */ boolean hasNext() {
                return OfLong.this.hasNext();
            }

            public /* sintético */ int hashCode() {
                return OfLong.this.hashCode();
            }

            @Override // java.util.PrimitiveIterator.OfLong, java.util.Iterator
            public /* sintético */ Long next() {
                return OfLong.this.next();
            }

            @Override // java.util.PrimitiveIterator.OfLong, java.util.Iterator
            public /* sintético */ Object next() {
                return OfLong.this.next();
            }

            @Override // java.util.PrimitiveIterator.OfLong
            public /* sintético */ long nextLong() {
                return OfLong.this.nextLong();
            }

            @Override // java.util.Iterator
            public /* sintético */ void remove() {
                OfLong.this.remove();
            }
        }

        @Override // java.util.Iterator
        void forEachRemaining(Consumer<? super Long> consumer);

        void forEachRemaining(LongConsumer longConsumer);

        @Override // java.util.Iterator
        Long next();

        long nextLong();

        /* renomeado de: j$.util.PrimitiveIterator$OfLong$-CC, motivo: nome de classe inválido */
        public final /* sintético */ class CC {
            public static void $default$forEachRemaining(OfLong _this, LongConsumer action) {
                Objects.requireNonNull(action);
                while (_this.hasNext()) {
                    action.accept(_this.nextLong());
                }
            }

            public static Long $default$next(OfLong _this) {
                if (Tripwire.ENABLED) {
                    Tripwire.trip(_this.getClass(), "{0} calling PrimitiveIterator.OfLong.nextLong()");
                }
                return Long.valueOf(_this.nextLong());
            }

            public static void $default$forEachRemaining(OfLong _this, Consumer consumer) {
                if (consumer instanceof LongConsumer) {
                    _this.forEachRemaining((LongConsumer) consumer);
                    return;
                }
                Objects.requireNonNull(consumer);
                if (Tripwire.ENABLED) {
                    Tripwire.trip(_this.getClass(), "{0} calling PrimitiveIterator.OfLong.forEachRemainingLong(action::accept)");
                }
                Objects.requireNonNull(consumer);
                _this.forEachRemaining((LongConsumer) new PrimitiveIterator$OfLong$$ExternalSyntheticLambda0(consumer));
            }
        }
    }

    public interface OfDouble extends PrimitiveIterator<Double, DoubleConsumer> {

        /* compiled from: D8$$SyntheticClass */
        public final /* sintético */ class VivifiedWrapper implements OfDouble, Iterator {
            public final /* sintético */ PrimitiveIterator.OfDouble wrappedValue;

            private /* sintético */ VivifiedWrapper(PrimitiveIterator.OfDouble ofDouble) {
                this.wrappedValue = ofDouble;
            }

            public static /* sintético */ OfDouble convert(PrimitiveIterator.OfDouble ofDouble) {
                if (ofDouble == null) {
                    return null;
                }
                return ofDouble instanceof Wrapper ? OfDouble.this : new VivifiedWrapper(ofDouble);
            }

            public /* sintético */ boolean equals(Object obj) {
                PrimitiveIterator.OfDouble ofDouble = this.wrappedValue;
                if (obj instanceof VivifiedWrapper) {
                    obj = ((VivifiedWrapper) obj).wrappedValue;
                }
                return ofDouble.equals(obj);
            }

            @Override // j$.util.PrimitiveIterator
            public /* sintético */ void forEachRemaining(DoubleConsumer doubleConsumer) {
                this.wrappedValue.forEachRemaining((PrimitiveIterator.OfDouble) doubleConsumer);
            }

            @Override // j$.util.PrimitiveIterator.OfDouble, java.util.Iterator
            public /* sintético */ void forEachRemaining(Consumer consumer) {
                this.wrappedValue.forEachRemaining((Consumer<? super Double>) consumer);
            }

            @Override // j$.util.PrimitiveIterator.OfDouble
            /* renomeado de: forEachRemaining, motivo: evitar colisão após correção de tipos em outro método */
            public /* sintético */ void forEachRemaining2(DoubleConsumer doubleConsumer) {
                this.wrappedValue.forEachRemaining(doubleConsumer);
            }

            @Override // java.util.Iterator
            public /* sintético */ boolean hasNext() {
                return this.wrappedValue.hasNext();
            }

            public /* sintético */ int hashCode() {
                return this.wrappedValue.hashCode();
            }

            @Override // j$.util.PrimitiveIterator.OfDouble, java.util.Iterator
            public /* sintético */ Double next() {
                return this.wrappedValue.next();
            }

            @Override // java.util.Iterator
            public /* sintético */ Object next() {
                return this.wrappedValue.next();
            }

            @Override // j$.util.PrimitiveIterator.OfDouble
            public /* sintético */ double nextDouble() {
                return this.wrappedValue.nextDouble();
            }

            @Override // java.util.Iterator
            public /* sintético */ void remove() {
                this.wrappedValue.remove();
            }
        }

        /* compiled from: D8$$SyntheticClass */
        public final /* sintético */ class Wrapper implements PrimitiveIterator.OfDouble {
            private /* sintético */ Wrapper() {
            }

            public static /* sintético */ PrimitiveIterator.OfDouble convert(OfDouble ofDouble) {
                if (ofDouble == null) {
                    return null;
                }
                return ofDouble instanceof VivifiedWrapper ? ((VivifiedWrapper) ofDouble).wrappedValue : ofDouble.new Wrapper();
            }

            public /* sintético */ boolean equals(Object obj) {
                OfDouble ofDouble = OfDouble.this;
                if (obj instanceof Wrapper) {
                    obj = OfDouble.this;
                }
                return ofDouble.equals(obj);
            }

            @Override // java.util.PrimitiveIterator
            public /* sintético */ void forEachRemaining(DoubleConsumer doubleConsumer) {
                OfDouble.this.forEachRemaining((OfDouble) doubleConsumer);
            }

            @Override // java.util.PrimitiveIterator.OfDouble, java.util.Iterator
            public /* sintético */ void forEachRemaining(Consumer consumer) {
                OfDouble.this.forEachRemaining((Consumer<? super Double>) consumer);
            }

            @Override // java.util.PrimitiveIterator.OfDouble
            /* renomeado de: forEachRemaining, motivo: evitar colisão após correção de tipos em outro método */
            public /* sintético */ void forEachRemaining2(DoubleConsumer doubleConsumer) {
                OfDouble.this.forEachRemaining(doubleConsumer);
            }

            @Override // java.util.Iterator
            public /* sintético */ boolean hasNext() {
                return OfDouble.this.hasNext();
            }

            public /* sintético */ int hashCode() {
                return OfDouble.this.hashCode();
            }

            @Override // java.util.PrimitiveIterator.OfDouble, java.util.Iterator
            public /* sintético */ Double next() {
                return OfDouble.this.next();
            }

            @Override // java.util.PrimitiveIterator.OfDouble, java.util.Iterator
            public /* sintético */ Object next() {
                return OfDouble.this.next();
            }

            @Override // java.util.PrimitiveIterator.OfDouble
            public /* sintético */ double nextDouble() {
                return OfDouble.this.nextDouble();
            }

            @Override // java.util.Iterator
            public /* sintético */ void remove() {
                OfDouble.this.remove();
            }
        }

        @Override // java.util.Iterator
        void forEachRemaining(Consumer<? super Double> consumer);

        void forEachRemaining(DoubleConsumer doubleConsumer);

        @Override // java.util.Iterator
        Double next();

        double nextDouble();

        /* renomeado de: j$.util.PrimitiveIterator$OfDouble$-CC, motivo: nome de classe inválido */
        public final /* sintético */ class CC {
            public static void $default$forEachRemaining(OfDouble _this, DoubleConsumer action) {
                Objects.requireNonNull(action);
                while (_this.hasNext()) {
                    action.accept(_this.nextDouble());
                }
            }

            public static Double $default$next(OfDouble _this) {
                if (Tripwire.ENABLED) {
                    Tripwire.trip(_this.getClass(), "{0} calling PrimitiveIterator.OfDouble.nextLong()");
                }
                return Double.valueOf(_this.nextDouble());
            }

            public static void $default$forEachRemaining(OfDouble _this, Consumer consumer) {
                if (consumer instanceof DoubleConsumer) {
                    _this.forEachRemaining((DoubleConsumer) consumer);
                    return;
                }
                Objects.requireNonNull(consumer);
                if (Tripwire.ENABLED) {
                    Tripwire.trip(_this.getClass(), "{0} calling PrimitiveIterator.OfDouble.forEachRemainingDouble(action::accept)");
                }
                Objects.requireNonNull(consumer);
                _this.forEachRemaining((DoubleConsumer) new PrimitiveIterator$OfDouble$$ExternalSyntheticLambda0(consumer));
            }
        }
    }
}
