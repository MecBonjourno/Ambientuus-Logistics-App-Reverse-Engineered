package j$.util;

import java.util.Spliterator;
import java.util.function.Consumer;
import java.util.function.DoubleConsumer;
import java.util.function.IntConsumer;
import java.util.function.LongConsumer;

/* carregado de: classes15.dex */
public interface Spliterator<T> {
    public static final int CONCURRENT = 4096;
    public static final int DISTINCT = 1;
    public static final int IMMUTABLE = 1024;
    public static final int NONNULL = 256;
    public static final int ORDERED = 16;
    public static final int SIZED = 64;
    public static final int SORTED = 4;
    public static final int SUBSIZED = 16384;

    /* compiled from: D8$$SyntheticClass */
    public final /* sintético */ class VivifiedWrapper implements Spliterator {
        public final /* sintético */ java.util.Spliterator wrappedValue;

        private /* sintético */ VivifiedWrapper(java.util.Spliterator spliterator) {
            this.wrappedValue = spliterator;
        }

        public static /* sintético */ Spliterator convert(java.util.Spliterator spliterator) {
            if (spliterator == null) {
                return null;
            }
            return spliterator instanceof Wrapper ? Spliterator.this : spliterator instanceof Spliterator.OfPrimitive ? OfPrimitive.VivifiedWrapper.convert((Spliterator.OfPrimitive) spliterator) : new VivifiedWrapper(spliterator);
        }

        @Override // j$.util.Spliterator
        public /* sintético */ int characteristics() {
            return this.wrappedValue.characteristics();
        }

        public /* sintético */ boolean equals(Object obj) {
            java.util.Spliterator spliterator = this.wrappedValue;
            if (obj instanceof VivifiedWrapper) {
                obj = ((VivifiedWrapper) obj).wrappedValue;
            }
            return spliterator.equals(obj);
        }

        @Override // j$.util.Spliterator
        public /* sintético */ long estimateSize() {
            return this.wrappedValue.estimateSize();
        }

        @Override // j$.util.Spliterator
        public /* sintético */ void forEachRemaining(Consumer consumer) {
            this.wrappedValue.forEachRemaining(consumer);
        }

        @Override // j$.util.Spliterator
        public /* sintético */ java.util.Comparator getComparator() {
            return this.wrappedValue.getComparator();
        }

        @Override // j$.util.Spliterator
        public /* sintético */ long getExactSizeIfKnown() {
            return this.wrappedValue.getExactSizeIfKnown();
        }

        @Override // j$.util.Spliterator
        public /* sintético */ boolean hasCharacteristics(int i) {
            return this.wrappedValue.hasCharacteristics(i);
        }

        public /* sintético */ int hashCode() {
            return this.wrappedValue.hashCode();
        }

        @Override // j$.util.Spliterator
        public /* sintético */ boolean tryAdvance(Consumer consumer) {
            return this.wrappedValue.tryAdvance(consumer);
        }

        @Override // j$.util.Spliterator
        public /* sintético */ Spliterator trySplit() {
            return convert(this.wrappedValue.trySplit());
        }
    }

    /* compiled from: D8$$SyntheticClass */
    public final /* sintético */ class Wrapper implements java.util.Spliterator {
        private /* sintético */ Wrapper() {
        }

        public static /* sintético */ java.util.Spliterator convert(Spliterator spliterator) {
            if (spliterator == null) {
                return null;
            }
            return spliterator instanceof VivifiedWrapper ? ((VivifiedWrapper) spliterator).wrappedValue : spliterator instanceof OfPrimitive ? OfPrimitive.Wrapper.convert((OfPrimitive) spliterator) : new Wrapper();
        }

        @Override // java.util.Spliterator
        public /* sintético */ int characteristics() {
            return Spliterator.this.characteristics();
        }

        public /* sintético */ boolean equals(Object obj) {
            Spliterator spliterator = Spliterator.this;
            if (obj instanceof Wrapper) {
                obj = Spliterator.this;
            }
            return spliterator.equals(obj);
        }

        @Override // java.util.Spliterator
        public /* sintético */ long estimateSize() {
            return Spliterator.this.estimateSize();
        }

        @Override // java.util.Spliterator
        public /* sintético */ void forEachRemaining(Consumer consumer) {
            Spliterator.this.forEachRemaining(consumer);
        }

        @Override // java.util.Spliterator
        public /* sintético */ java.util.Comparator getComparator() {
            return Spliterator.this.getComparator();
        }

        @Override // java.util.Spliterator
        public /* sintético */ long getExactSizeIfKnown() {
            return Spliterator.this.getExactSizeIfKnown();
        }

        @Override // java.util.Spliterator
        public /* sintético */ boolean hasCharacteristics(int i) {
            return Spliterator.this.hasCharacteristics(i);
        }

        public /* sintético */ int hashCode() {
            return Spliterator.this.hashCode();
        }

        @Override // java.util.Spliterator
        public /* sintético */ boolean tryAdvance(Consumer consumer) {
            return Spliterator.this.tryAdvance(consumer);
        }

        @Override // java.util.Spliterator
        public /* sintético */ java.util.Spliterator trySplit() {
            return convert(Spliterator.this.trySplit());
        }
    }

    int characteristics();

    long estimateSize();

    void forEachRemaining(Consumer<? super T> consumer);

    java.util.Comparator<? super T> getComparator();

    long getExactSizeIfKnown();

    boolean hasCharacteristics(int i);

    boolean tryAdvance(Consumer<? super T> consumer);

    Spliterator<T> trySplit();

    /* renomeado de: j$.util.Spliterator$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        public static void $default$forEachRemaining(Spliterator _this, Consumer consumer) {
            while (_this.tryAdvance(consumer)) {
            }
        }

        public static long $default$getExactSizeIfKnown(Spliterator _this) {
            if ((_this.characteristics() & 64) == 0) {
                return -1L;
            }
            return _this.estimateSize();
        }

        public static boolean $default$hasCharacteristics(Spliterator _this, int characteristics) {
            return (_this.characteristics() & characteristics) == characteristics;
        }

        public static java.util.Comparator $default$getComparator(Spliterator _this) {
            throw new IllegalStateException();
        }
    }

    public interface OfPrimitive<T, T_CONS, T_SPLITR extends OfPrimitive<T, T_CONS, T_SPLITR>> extends Spliterator<T> {

        /* compiled from: D8$$SyntheticClass */
        public final /* sintético */ class VivifiedWrapper implements OfPrimitive {
            public final /* sintético */ Spliterator.OfPrimitive wrappedValue;

            private /* sintético */ VivifiedWrapper(Spliterator.OfPrimitive ofPrimitive) {
                this.wrappedValue = ofPrimitive;
            }

            public static /* sintético */ OfPrimitive convert(Spliterator.OfPrimitive ofPrimitive) {
                if (ofPrimitive == null) {
                    return null;
                }
                return ofPrimitive instanceof Wrapper ? OfPrimitive.this : ofPrimitive instanceof Spliterator.OfDouble ? OfDouble.VivifiedWrapper.convert((Spliterator.OfDouble) ofPrimitive) : ofPrimitive instanceof Spliterator.OfInt ? OfInt.VivifiedWrapper.convert((Spliterator.OfInt) ofPrimitive) : ofPrimitive instanceof Spliterator.OfLong ? OfLong.VivifiedWrapper.convert((Spliterator.OfLong) ofPrimitive) : new VivifiedWrapper(ofPrimitive);
            }

            @Override // j$.util.Spliterator
            public /* sintético */ int characteristics() {
                return this.wrappedValue.characteristics();
            }

            public /* sintético */ boolean equals(Object obj) {
                Spliterator.OfPrimitive ofPrimitive = this.wrappedValue;
                if (obj instanceof VivifiedWrapper) {
                    obj = ((VivifiedWrapper) obj).wrappedValue;
                }
                return ofPrimitive.equals(obj);
            }

            @Override // j$.util.Spliterator
            public /* sintético */ long estimateSize() {
                return this.wrappedValue.estimateSize();
            }

            @Override // j$.util.Spliterator.OfPrimitive
            public /* sintético */ void forEachRemaining(Object obj) {
                this.wrappedValue.forEachRemaining((Spliterator.OfPrimitive) obj);
            }

            @Override // j$.util.Spliterator
            public /* sintético */ void forEachRemaining(Consumer consumer) {
                this.wrappedValue.forEachRemaining(consumer);
            }

            @Override // j$.util.Spliterator
            public /* sintético */ java.util.Comparator getComparator() {
                return this.wrappedValue.getComparator();
            }

            @Override // j$.util.Spliterator
            public /* sintético */ long getExactSizeIfKnown() {
                return this.wrappedValue.getExactSizeIfKnown();
            }

            @Override // j$.util.Spliterator
            public /* sintético */ boolean hasCharacteristics(int i) {
                return this.wrappedValue.hasCharacteristics(i);
            }

            public /* sintético */ int hashCode() {
                return this.wrappedValue.hashCode();
            }

            @Override // j$.util.Spliterator.OfPrimitive
            public /* sintético */ boolean tryAdvance(Object obj) {
                return this.wrappedValue.tryAdvance((Spliterator.OfPrimitive) obj);
            }

            @Override // j$.util.Spliterator
            public /* sintético */ boolean tryAdvance(Consumer consumer) {
                return this.wrappedValue.tryAdvance(consumer);
            }

            @Override // j$.util.Spliterator.OfPrimitive, j$.util.Spliterator
            public /* sintético */ OfPrimitive trySplit() {
                return convert(this.wrappedValue.trySplit());
            }

            @Override // j$.util.Spliterator
            public /* sintético */ Spliterator trySplit() {
                return VivifiedWrapper.convert(this.wrappedValue.trySplit());
            }
        }

        /* compiled from: D8$$SyntheticClass */
        public final /* sintético */ class Wrapper implements Spliterator.OfPrimitive {
            private /* sintético */ Wrapper() {
            }

            public static /* sintético */ Spliterator.OfPrimitive convert(OfPrimitive ofPrimitive) {
                if (ofPrimitive == null) {
                    return null;
                }
                return ofPrimitive instanceof VivifiedWrapper ? ((VivifiedWrapper) ofPrimitive).wrappedValue : ofPrimitive instanceof OfDouble ? OfDouble.Wrapper.convert((OfDouble) ofPrimitive) : ofPrimitive instanceof OfInt ? OfInt.Wrapper.convert((OfInt) ofPrimitive) : ofPrimitive instanceof OfLong ? OfLong.Wrapper.convert((OfLong) ofPrimitive) : new Wrapper();
            }

            @Override // java.util.Spliterator
            public /* sintético */ int characteristics() {
                return OfPrimitive.this.characteristics();
            }

            public /* sintético */ boolean equals(Object obj) {
                OfPrimitive ofPrimitive = OfPrimitive.this;
                if (obj instanceof Wrapper) {
                    obj = OfPrimitive.this;
                }
                return ofPrimitive.equals(obj);
            }

            @Override // java.util.Spliterator
            public /* sintético */ long estimateSize() {
                return OfPrimitive.this.estimateSize();
            }

            @Override // java.util.Spliterator.OfPrimitive
            public /* sintético */ void forEachRemaining(Object obj) {
                OfPrimitive.this.forEachRemaining((OfPrimitive) obj);
            }

            @Override // java.util.Spliterator
            public /* sintético */ void forEachRemaining(Consumer consumer) {
                OfPrimitive.this.forEachRemaining(consumer);
            }

            @Override // java.util.Spliterator
            public /* sintético */ java.util.Comparator getComparator() {
                return OfPrimitive.this.getComparator();
            }

            @Override // java.util.Spliterator
            public /* sintético */ long getExactSizeIfKnown() {
                return OfPrimitive.this.getExactSizeIfKnown();
            }

            @Override // java.util.Spliterator
            public /* sintético */ boolean hasCharacteristics(int i) {
                return OfPrimitive.this.hasCharacteristics(i);
            }

            public /* sintético */ int hashCode() {
                return OfPrimitive.this.hashCode();
            }

            @Override // java.util.Spliterator.OfPrimitive
            public /* sintético */ boolean tryAdvance(Object obj) {
                return OfPrimitive.this.tryAdvance((OfPrimitive) obj);
            }

            @Override // java.util.Spliterator
            public /* sintético */ boolean tryAdvance(Consumer consumer) {
                return OfPrimitive.this.tryAdvance(consumer);
            }

            @Override // java.util.Spliterator.OfPrimitive, java.util.Spliterator
            public /* sintético */ Spliterator.OfPrimitive trySplit() {
                return convert(OfPrimitive.this.trySplit());
            }

            @Override // java.util.Spliterator.OfPrimitive, java.util.Spliterator
            public /* sintético */ java.util.Spliterator trySplit() {
                return Wrapper.convert(OfPrimitive.this.trySplit());
            }
        }

        void forEachRemaining(T_CONS t_cons);

        boolean tryAdvance(T_CONS t_cons);

        @Override // j$.util.Spliterator
        T_SPLITR trySplit();

        /* renomeado de: j$.util.Spliterator$OfPrimitive$-CC, motivo: nome de classe inválido */
        public final /* sintético */ class CC {
            public static void $default$forEachRemaining(OfPrimitive _this, Object obj) {
                while (_this.tryAdvance((OfPrimitive) obj)) {
                }
            }
        }
    }

    public interface OfInt extends OfPrimitive<Integer, IntConsumer, OfInt> {

        /* compiled from: D8$$SyntheticClass */
        public final /* sintético */ class VivifiedWrapper implements OfInt {
            public final /* sintético */ Spliterator.OfInt wrappedValue;

            private /* sintético */ VivifiedWrapper(Spliterator.OfInt ofInt) {
                this.wrappedValue = ofInt;
            }

            public static /* sintético */ OfInt convert(Spliterator.OfInt ofInt) {
                if (ofInt == null) {
                    return null;
                }
                return ofInt instanceof Wrapper ? OfInt.this : new VivifiedWrapper(ofInt);
            }

            @Override // j$.util.Spliterator
            public /* sintético */ int characteristics() {
                return this.wrappedValue.characteristics();
            }

            public /* sintético */ boolean equals(Object obj) {
                Spliterator.OfInt ofInt = this.wrappedValue;
                if (obj instanceof VivifiedWrapper) {
                    obj = ((VivifiedWrapper) obj).wrappedValue;
                }
                return ofInt.equals(obj);
            }

            @Override // j$.util.Spliterator
            public /* sintético */ long estimateSize() {
                return this.wrappedValue.estimateSize();
            }

            @Override // j$.util.Spliterator.OfPrimitive
            public /* sintético */ void forEachRemaining(IntConsumer intConsumer) {
                this.wrappedValue.forEachRemaining((Spliterator.OfInt) intConsumer);
            }

            @Override // j$.util.Spliterator.OfInt, j$.util.Spliterator
            public /* sintético */ void forEachRemaining(Consumer consumer) {
                this.wrappedValue.forEachRemaining((Consumer<? super Integer>) consumer);
            }

            @Override // j$.util.Spliterator.OfInt
            public /* sintético */ void forEachRemaining(IntConsumer intConsumer) {
                this.wrappedValue.forEachRemaining(intConsumer);
            }

            @Override // j$.util.Spliterator
            public /* sintético */ java.util.Comparator getComparator() {
                return this.wrappedValue.getComparator();
            }

            @Override // j$.util.Spliterator
            public /* sintético */ long getExactSizeIfKnown() {
                return this.wrappedValue.getExactSizeIfKnown();
            }

            @Override // j$.util.Spliterator
            public /* sintético */ boolean hasCharacteristics(int i) {
                return this.wrappedValue.hasCharacteristics(i);
            }

            public /* sintético */ int hashCode() {
                return this.wrappedValue.hashCode();
            }

            @Override // j$.util.Spliterator.OfPrimitive
            public /* sintético */ boolean tryAdvance(IntConsumer intConsumer) {
                return this.wrappedValue.tryAdvance((Spliterator.OfInt) intConsumer);
            }

            @Override // j$.util.Spliterator.OfInt, j$.util.Spliterator
            public /* sintético */ boolean tryAdvance(Consumer consumer) {
                return this.wrappedValue.tryAdvance((Consumer<? super Integer>) consumer);
            }

            @Override // j$.util.Spliterator.OfInt
            public /* sintético */ boolean tryAdvance(IntConsumer intConsumer) {
                return this.wrappedValue.tryAdvance(intConsumer);
            }

            @Override // j$.util.Spliterator.OfInt, j$.util.Spliterator.OfPrimitive, j$.util.Spliterator
            public /* sintético */ OfInt trySplit() {
                return convert(this.wrappedValue.trySplit());
            }

            @Override // j$.util.Spliterator.OfPrimitive, j$.util.Spliterator
            public /* sintético */ OfPrimitive trySplit() {
                return OfPrimitive.VivifiedWrapper.convert(this.wrappedValue.trySplit());
            }

            @Override // j$.util.Spliterator
            public /* sintético */ Spliterator trySplit() {
                return VivifiedWrapper.convert(this.wrappedValue.trySplit());
            }
        }

        /* compiled from: D8$$SyntheticClass */
        public final /* sintético */ class Wrapper implements Spliterator.OfInt {
            private /* sintético */ Wrapper() {
            }

            public static /* sintético */ Spliterator.OfInt convert(OfInt ofInt) {
                if (ofInt == null) {
                    return null;
                }
                return ofInt instanceof VivifiedWrapper ? ((VivifiedWrapper) ofInt).wrappedValue : ofInt.new Wrapper();
            }

            @Override // java.util.Spliterator
            public /* sintético */ int characteristics() {
                return OfInt.this.characteristics();
            }

            public /* sintético */ boolean equals(Object obj) {
                OfInt ofInt = OfInt.this;
                if (obj instanceof Wrapper) {
                    obj = OfInt.this;
                }
                return ofInt.equals(obj);
            }

            @Override // java.util.Spliterator
            public /* sintético */ long estimateSize() {
                return OfInt.this.estimateSize();
            }

            @Override // java.util.Spliterator.OfPrimitive
            public /* sintético */ void forEachRemaining(IntConsumer intConsumer) {
                OfInt.this.forEachRemaining((OfInt) intConsumer);
            }

            @Override // java.util.Spliterator.OfInt, java.util.Spliterator
            public /* sintético */ void forEachRemaining(Consumer consumer) {
                OfInt.this.forEachRemaining((Consumer<? super Integer>) consumer);
            }

            @Override // java.util.Spliterator.OfInt
            /* renomeado de: forEachRemaining, motivo: evitar colisão após correção de tipos em outro método */
            public /* sintético */ void forEachRemaining2(IntConsumer intConsumer) {
                OfInt.this.forEachRemaining(intConsumer);
            }

            @Override // java.util.Spliterator
            public /* sintético */ java.util.Comparator getComparator() {
                return OfInt.this.getComparator();
            }

            @Override // java.util.Spliterator
            public /* sintético */ long getExactSizeIfKnown() {
                return OfInt.this.getExactSizeIfKnown();
            }

            @Override // java.util.Spliterator
            public /* sintético */ boolean hasCharacteristics(int i) {
                return OfInt.this.hasCharacteristics(i);
            }

            public /* sintético */ int hashCode() {
                return OfInt.this.hashCode();
            }

            @Override // java.util.Spliterator.OfPrimitive
            public /* sintético */ boolean tryAdvance(IntConsumer intConsumer) {
                return OfInt.this.tryAdvance((OfInt) intConsumer);
            }

            @Override // java.util.Spliterator.OfInt, java.util.Spliterator
            public /* sintético */ boolean tryAdvance(Consumer consumer) {
                return OfInt.this.tryAdvance((Consumer<? super Integer>) consumer);
            }

            @Override // java.util.Spliterator.OfInt
            /* renomeado de: tryAdvance, motivo: evitar colisão após correção de tipos em outro método */
            public /* sintético */ boolean tryAdvance2(IntConsumer intConsumer) {
                return OfInt.this.tryAdvance(intConsumer);
            }

            @Override // java.util.Spliterator.OfInt, java.util.Spliterator.OfPrimitive, java.util.Spliterator
            public /* sintético */ Spliterator.OfInt trySplit() {
                return convert(OfInt.this.trySplit());
            }

            @Override // java.util.Spliterator.OfInt, java.util.Spliterator.OfPrimitive, java.util.Spliterator
            public /* sintético */ Spliterator.OfPrimitive trySplit() {
                return OfPrimitive.Wrapper.convert(OfInt.this.trySplit());
            }

            @Override // java.util.Spliterator.OfInt, java.util.Spliterator.OfPrimitive, java.util.Spliterator
            public /* sintético */ java.util.Spliterator trySplit() {
                return Wrapper.convert(OfInt.this.trySplit());
            }
        }

        @Override // j$.util.Spliterator
        void forEachRemaining(Consumer<? super Integer> consumer);

        void forEachRemaining(IntConsumer intConsumer);

        @Override // j$.util.Spliterator
        boolean tryAdvance(Consumer<? super Integer> consumer);

        boolean tryAdvance(IntConsumer intConsumer);

        @Override // j$.util.Spliterator.OfPrimitive, j$.util.Spliterator
        OfInt trySplit();

        /* renomeado de: j$.util.Spliterator$OfInt$-CC, motivo: nome de classe inválido */
        public final /* sintético */ class CC {
            public static void $default$forEachRemaining(OfInt _this, IntConsumer action) {
                while (_this.tryAdvance(action)) {
                }
            }

            public static boolean $default$tryAdvance(OfInt _this, Consumer consumer) {
                if (consumer instanceof IntConsumer) {
                    return _this.tryAdvance((IntConsumer) consumer);
                }
                if (Tripwire.ENABLED) {
                    Tripwire.trip(_this.getClass(), "{0} calling Spliterator.OfInt.tryAdvance((IntConsumer) action::accept)");
                }
                Objects.requireNonNull(consumer);
                return _this.tryAdvance((IntConsumer) new PrimitiveIterator$OfInt$$ExternalSyntheticLambda0(consumer));
            }

            public static void $default$forEachRemaining(OfInt _this, Consumer consumer) {
                if (consumer instanceof IntConsumer) {
                    _this.forEachRemaining((IntConsumer) consumer);
                    return;
                }
                if (Tripwire.ENABLED) {
                    Tripwire.trip(_this.getClass(), "{0} calling Spliterator.OfInt.forEachRemaining((IntConsumer) action::accept)");
                }
                Objects.requireNonNull(consumer);
                _this.forEachRemaining((IntConsumer) new PrimitiveIterator$OfInt$$ExternalSyntheticLambda0(consumer));
            }
        }
    }

    public interface OfLong extends OfPrimitive<Long, LongConsumer, OfLong> {

        /* compiled from: D8$$SyntheticClass */
        public final /* sintético */ class VivifiedWrapper implements OfLong {
            public final /* sintético */ Spliterator.OfLong wrappedValue;

            private /* sintético */ VivifiedWrapper(Spliterator.OfLong ofLong) {
                this.wrappedValue = ofLong;
            }

            public static /* sintético */ OfLong convert(Spliterator.OfLong ofLong) {
                if (ofLong == null) {
                    return null;
                }
                return ofLong instanceof Wrapper ? OfLong.this : new VivifiedWrapper(ofLong);
            }

            @Override // j$.util.Spliterator
            public /* sintético */ int characteristics() {
                return this.wrappedValue.characteristics();
            }

            public /* sintético */ boolean equals(Object obj) {
                Spliterator.OfLong ofLong = this.wrappedValue;
                if (obj instanceof VivifiedWrapper) {
                    obj = ((VivifiedWrapper) obj).wrappedValue;
                }
                return ofLong.equals(obj);
            }

            @Override // j$.util.Spliterator
            public /* sintético */ long estimateSize() {
                return this.wrappedValue.estimateSize();
            }

            @Override // j$.util.Spliterator.OfPrimitive
            public /* sintético */ void forEachRemaining(LongConsumer longConsumer) {
                this.wrappedValue.forEachRemaining((Spliterator.OfLong) longConsumer);
            }

            @Override // j$.util.Spliterator.OfLong, j$.util.Spliterator
            public /* sintético */ void forEachRemaining(Consumer consumer) {
                this.wrappedValue.forEachRemaining((Consumer<? super Long>) consumer);
            }

            @Override // j$.util.Spliterator.OfLong
            public /* sintético */ void forEachRemaining(LongConsumer longConsumer) {
                this.wrappedValue.forEachRemaining(longConsumer);
            }

            @Override // j$.util.Spliterator
            public /* sintético */ java.util.Comparator getComparator() {
                return this.wrappedValue.getComparator();
            }

            @Override // j$.util.Spliterator
            public /* sintético */ long getExactSizeIfKnown() {
                return this.wrappedValue.getExactSizeIfKnown();
            }

            @Override // j$.util.Spliterator
            public /* sintético */ boolean hasCharacteristics(int i) {
                return this.wrappedValue.hasCharacteristics(i);
            }

            public /* sintético */ int hashCode() {
                return this.wrappedValue.hashCode();
            }

            @Override // j$.util.Spliterator.OfPrimitive
            public /* sintético */ boolean tryAdvance(LongConsumer longConsumer) {
                return this.wrappedValue.tryAdvance((Spliterator.OfLong) longConsumer);
            }

            @Override // j$.util.Spliterator.OfLong, j$.util.Spliterator
            public /* sintético */ boolean tryAdvance(Consumer consumer) {
                return this.wrappedValue.tryAdvance((Consumer<? super Long>) consumer);
            }

            @Override // j$.util.Spliterator.OfLong
            public /* sintético */ boolean tryAdvance(LongConsumer longConsumer) {
                return this.wrappedValue.tryAdvance(longConsumer);
            }

            @Override // j$.util.Spliterator.OfLong, j$.util.Spliterator.OfPrimitive, j$.util.Spliterator
            public /* sintético */ OfLong trySplit() {
                return convert(this.wrappedValue.trySplit());
            }

            @Override // j$.util.Spliterator.OfPrimitive, j$.util.Spliterator
            public /* sintético */ OfPrimitive trySplit() {
                return OfPrimitive.VivifiedWrapper.convert(this.wrappedValue.trySplit());
            }

            @Override // j$.util.Spliterator
            public /* sintético */ Spliterator trySplit() {
                return VivifiedWrapper.convert(this.wrappedValue.trySplit());
            }
        }

        /* compiled from: D8$$SyntheticClass */
        public final /* sintético */ class Wrapper implements Spliterator.OfLong {
            private /* sintético */ Wrapper() {
            }

            public static /* sintético */ Spliterator.OfLong convert(OfLong ofLong) {
                if (ofLong == null) {
                    return null;
                }
                return ofLong instanceof VivifiedWrapper ? ((VivifiedWrapper) ofLong).wrappedValue : ofLong.new Wrapper();
            }

            @Override // java.util.Spliterator
            public /* sintético */ int characteristics() {
                return OfLong.this.characteristics();
            }

            public /* sintético */ boolean equals(Object obj) {
                OfLong ofLong = OfLong.this;
                if (obj instanceof Wrapper) {
                    obj = OfLong.this;
                }
                return ofLong.equals(obj);
            }

            @Override // java.util.Spliterator
            public /* sintético */ long estimateSize() {
                return OfLong.this.estimateSize();
            }

            @Override // java.util.Spliterator.OfPrimitive
            public /* sintético */ void forEachRemaining(LongConsumer longConsumer) {
                OfLong.this.forEachRemaining((OfLong) longConsumer);
            }

            @Override // java.util.Spliterator.OfLong, java.util.Spliterator
            public /* sintético */ void forEachRemaining(Consumer consumer) {
                OfLong.this.forEachRemaining((Consumer<? super Long>) consumer);
            }

            @Override // java.util.Spliterator.OfLong
            /* renomeado de: forEachRemaining, motivo: evitar colisão após correção de tipos em outro método */
            public /* sintético */ void forEachRemaining2(LongConsumer longConsumer) {
                OfLong.this.forEachRemaining(longConsumer);
            }

            @Override // java.util.Spliterator
            public /* sintético */ java.util.Comparator getComparator() {
                return OfLong.this.getComparator();
            }

            @Override // java.util.Spliterator
            public /* sintético */ long getExactSizeIfKnown() {
                return OfLong.this.getExactSizeIfKnown();
            }

            @Override // java.util.Spliterator
            public /* sintético */ boolean hasCharacteristics(int i) {
                return OfLong.this.hasCharacteristics(i);
            }

            public /* sintético */ int hashCode() {
                return OfLong.this.hashCode();
            }

            @Override // java.util.Spliterator.OfPrimitive
            public /* sintético */ boolean tryAdvance(LongConsumer longConsumer) {
                return OfLong.this.tryAdvance((OfLong) longConsumer);
            }

            @Override // java.util.Spliterator.OfLong, java.util.Spliterator
            public /* sintético */ boolean tryAdvance(Consumer consumer) {
                return OfLong.this.tryAdvance((Consumer<? super Long>) consumer);
            }

            @Override // java.util.Spliterator.OfLong
            /* renomeado de: tryAdvance, motivo: evitar colisão após correção de tipos em outro método */
            public /* sintético */ boolean tryAdvance2(LongConsumer longConsumer) {
                return OfLong.this.tryAdvance(longConsumer);
            }

            @Override // java.util.Spliterator.OfLong, java.util.Spliterator.OfPrimitive, java.util.Spliterator
            public /* sintético */ Spliterator.OfLong trySplit() {
                return convert(OfLong.this.trySplit());
            }

            @Override // java.util.Spliterator.OfLong, java.util.Spliterator.OfPrimitive, java.util.Spliterator
            public /* sintético */ Spliterator.OfPrimitive trySplit() {
                return OfPrimitive.Wrapper.convert(OfLong.this.trySplit());
            }

            @Override // java.util.Spliterator.OfLong, java.util.Spliterator.OfPrimitive, java.util.Spliterator
            public /* sintético */ java.util.Spliterator trySplit() {
                return Wrapper.convert(OfLong.this.trySplit());
            }
        }

        @Override // j$.util.Spliterator
        void forEachRemaining(Consumer<? super Long> consumer);

        void forEachRemaining(LongConsumer longConsumer);

        @Override // j$.util.Spliterator
        boolean tryAdvance(Consumer<? super Long> consumer);

        boolean tryAdvance(LongConsumer longConsumer);

        @Override // j$.util.Spliterator.OfPrimitive, j$.util.Spliterator
        OfLong trySplit();

        /* renomeado de: j$.util.Spliterator$OfLong$-CC, motivo: nome de classe inválido */
        public final /* sintético */ class CC {
            public static void $default$forEachRemaining(OfLong _this, LongConsumer action) {
                while (_this.tryAdvance(action)) {
                }
            }

            public static boolean $default$tryAdvance(OfLong _this, Consumer consumer) {
                if (consumer instanceof LongConsumer) {
                    return _this.tryAdvance((LongConsumer) consumer);
                }
                if (Tripwire.ENABLED) {
                    Tripwire.trip(_this.getClass(), "{0} calling Spliterator.OfLong.tryAdvance((LongConsumer) action::accept)");
                }
                Objects.requireNonNull(consumer);
                return _this.tryAdvance((LongConsumer) new PrimitiveIterator$OfLong$$ExternalSyntheticLambda0(consumer));
            }

            public static void $default$forEachRemaining(OfLong _this, Consumer consumer) {
                if (consumer instanceof LongConsumer) {
                    _this.forEachRemaining((LongConsumer) consumer);
                    return;
                }
                if (Tripwire.ENABLED) {
                    Tripwire.trip(_this.getClass(), "{0} calling Spliterator.OfLong.forEachRemaining((LongConsumer) action::accept)");
                }
                Objects.requireNonNull(consumer);
                _this.forEachRemaining((LongConsumer) new PrimitiveIterator$OfLong$$ExternalSyntheticLambda0(consumer));
            }
        }
    }

    public interface OfDouble extends OfPrimitive<Double, DoubleConsumer, OfDouble> {

        /* compiled from: D8$$SyntheticClass */
        public final /* sintético */ class VivifiedWrapper implements OfDouble {
            public final /* sintético */ Spliterator.OfDouble wrappedValue;

            private /* sintético */ VivifiedWrapper(Spliterator.OfDouble ofDouble) {
                this.wrappedValue = ofDouble;
            }

            public static /* sintético */ OfDouble convert(Spliterator.OfDouble ofDouble) {
                if (ofDouble == null) {
                    return null;
                }
                return ofDouble instanceof Wrapper ? OfDouble.this : new VivifiedWrapper(ofDouble);
            }

            @Override // j$.util.Spliterator
            public /* sintético */ int characteristics() {
                return this.wrappedValue.characteristics();
            }

            public /* sintético */ boolean equals(Object obj) {
                Spliterator.OfDouble ofDouble = this.wrappedValue;
                if (obj instanceof VivifiedWrapper) {
                    obj = ((VivifiedWrapper) obj).wrappedValue;
                }
                return ofDouble.equals(obj);
            }

            @Override // j$.util.Spliterator
            public /* sintético */ long estimateSize() {
                return this.wrappedValue.estimateSize();
            }

            @Override // j$.util.Spliterator.OfPrimitive
            public /* sintético */ void forEachRemaining(DoubleConsumer doubleConsumer) {
                this.wrappedValue.forEachRemaining((Spliterator.OfDouble) doubleConsumer);
            }

            @Override // j$.util.Spliterator.OfDouble, j$.util.Spliterator
            public /* sintético */ void forEachRemaining(Consumer consumer) {
                this.wrappedValue.forEachRemaining((Consumer<? super Double>) consumer);
            }

            @Override // j$.util.Spliterator.OfDouble
            public /* sintético */ void forEachRemaining(DoubleConsumer doubleConsumer) {
                this.wrappedValue.forEachRemaining(doubleConsumer);
            }

            @Override // j$.util.Spliterator
            public /* sintético */ java.util.Comparator getComparator() {
                return this.wrappedValue.getComparator();
            }

            @Override // j$.util.Spliterator
            public /* sintético */ long getExactSizeIfKnown() {
                return this.wrappedValue.getExactSizeIfKnown();
            }

            @Override // j$.util.Spliterator
            public /* sintético */ boolean hasCharacteristics(int i) {
                return this.wrappedValue.hasCharacteristics(i);
            }

            public /* sintético */ int hashCode() {
                return this.wrappedValue.hashCode();
            }

            @Override // j$.util.Spliterator.OfPrimitive
            public /* sintético */ boolean tryAdvance(DoubleConsumer doubleConsumer) {
                return this.wrappedValue.tryAdvance((Spliterator.OfDouble) doubleConsumer);
            }

            @Override // j$.util.Spliterator.OfDouble, j$.util.Spliterator
            public /* sintético */ boolean tryAdvance(Consumer consumer) {
                return this.wrappedValue.tryAdvance((Consumer<? super Double>) consumer);
            }

            @Override // j$.util.Spliterator.OfDouble
            public /* sintético */ boolean tryAdvance(DoubleConsumer doubleConsumer) {
                return this.wrappedValue.tryAdvance(doubleConsumer);
            }

            @Override // j$.util.Spliterator.OfDouble, j$.util.Spliterator.OfPrimitive, j$.util.Spliterator
            public /* sintético */ OfDouble trySplit() {
                return convert(this.wrappedValue.trySplit());
            }

            @Override // j$.util.Spliterator.OfPrimitive, j$.util.Spliterator
            public /* sintético */ OfPrimitive trySplit() {
                return OfPrimitive.VivifiedWrapper.convert(this.wrappedValue.trySplit());
            }

            @Override // j$.util.Spliterator
            public /* sintético */ Spliterator trySplit() {
                return VivifiedWrapper.convert(this.wrappedValue.trySplit());
            }
        }

        /* compiled from: D8$$SyntheticClass */
        public final /* sintético */ class Wrapper implements Spliterator.OfDouble {
            private /* sintético */ Wrapper() {
            }

            public static /* sintético */ Spliterator.OfDouble convert(OfDouble ofDouble) {
                if (ofDouble == null) {
                    return null;
                }
                return ofDouble instanceof VivifiedWrapper ? ((VivifiedWrapper) ofDouble).wrappedValue : ofDouble.new Wrapper();
            }

            @Override // java.util.Spliterator
            public /* sintético */ int characteristics() {
                return OfDouble.this.characteristics();
            }

            public /* sintético */ boolean equals(Object obj) {
                OfDouble ofDouble = OfDouble.this;
                if (obj instanceof Wrapper) {
                    obj = OfDouble.this;
                }
                return ofDouble.equals(obj);
            }

            @Override // java.util.Spliterator
            public /* sintético */ long estimateSize() {
                return OfDouble.this.estimateSize();
            }

            @Override // java.util.Spliterator.OfPrimitive
            public /* sintético */ void forEachRemaining(DoubleConsumer doubleConsumer) {
                OfDouble.this.forEachRemaining((OfDouble) doubleConsumer);
            }

            @Override // java.util.Spliterator.OfDouble, java.util.Spliterator
            public /* sintético */ void forEachRemaining(Consumer consumer) {
                OfDouble.this.forEachRemaining((Consumer<? super Double>) consumer);
            }

            @Override // java.util.Spliterator.OfDouble
            /* renomeado de: forEachRemaining, motivo: evitar colisão após correção de tipos em outro método */
            public /* sintético */ void forEachRemaining2(DoubleConsumer doubleConsumer) {
                OfDouble.this.forEachRemaining(doubleConsumer);
            }

            @Override // java.util.Spliterator
            public /* sintético */ java.util.Comparator getComparator() {
                return OfDouble.this.getComparator();
            }

            @Override // java.util.Spliterator
            public /* sintético */ long getExactSizeIfKnown() {
                return OfDouble.this.getExactSizeIfKnown();
            }

            @Override // java.util.Spliterator
            public /* sintético */ boolean hasCharacteristics(int i) {
                return OfDouble.this.hasCharacteristics(i);
            }

            public /* sintético */ int hashCode() {
                return OfDouble.this.hashCode();
            }

            @Override // java.util.Spliterator.OfPrimitive
            public /* sintético */ boolean tryAdvance(DoubleConsumer doubleConsumer) {
                return OfDouble.this.tryAdvance((OfDouble) doubleConsumer);
            }

            @Override // java.util.Spliterator.OfDouble, java.util.Spliterator
            public /* sintético */ boolean tryAdvance(Consumer consumer) {
                return OfDouble.this.tryAdvance((Consumer<? super Double>) consumer);
            }

            @Override // java.util.Spliterator.OfDouble
            /* renomeado de: tryAdvance, motivo: evitar colisão após correção de tipos em outro método */
            public /* sintético */ boolean tryAdvance2(DoubleConsumer doubleConsumer) {
                return OfDouble.this.tryAdvance(doubleConsumer);
            }

            @Override // java.util.Spliterator.OfDouble, java.util.Spliterator.OfPrimitive, java.util.Spliterator
            public /* sintético */ Spliterator.OfDouble trySplit() {
                return convert(OfDouble.this.trySplit());
            }

            @Override // java.util.Spliterator.OfDouble, java.util.Spliterator.OfPrimitive, java.util.Spliterator
            public /* sintético */ Spliterator.OfPrimitive trySplit() {
                return OfPrimitive.Wrapper.convert(OfDouble.this.trySplit());
            }

            @Override // java.util.Spliterator.OfDouble, java.util.Spliterator.OfPrimitive, java.util.Spliterator
            public /* sintético */ java.util.Spliterator trySplit() {
                return Wrapper.convert(OfDouble.this.trySplit());
            }
        }

        @Override // j$.util.Spliterator
        void forEachRemaining(Consumer<? super Double> consumer);

        void forEachRemaining(DoubleConsumer doubleConsumer);

        @Override // j$.util.Spliterator
        boolean tryAdvance(Consumer<? super Double> consumer);

        boolean tryAdvance(DoubleConsumer doubleConsumer);

        @Override // j$.util.Spliterator.OfPrimitive, j$.util.Spliterator
        OfDouble trySplit();

        /* renomeado de: j$.util.Spliterator$OfDouble$-CC, motivo: nome de classe inválido */
        public final /* sintético */ class CC {
            public static void $default$forEachRemaining(OfDouble _this, DoubleConsumer action) {
                while (_this.tryAdvance(action)) {
                }
            }

            public static boolean $default$tryAdvance(OfDouble _this, Consumer consumer) {
                if (consumer instanceof DoubleConsumer) {
                    return _this.tryAdvance((DoubleConsumer) consumer);
                }
                if (Tripwire.ENABLED) {
                    Tripwire.trip(_this.getClass(), "{0} calling Spliterator.OfDouble.tryAdvance((DoubleConsumer) action::accept)");
                }
                Objects.requireNonNull(consumer);
                return _this.tryAdvance((DoubleConsumer) new PrimitiveIterator$OfDouble$$ExternalSyntheticLambda0(consumer));
            }

            public static void $default$forEachRemaining(OfDouble _this, Consumer consumer) {
                if (consumer instanceof DoubleConsumer) {
                    _this.forEachRemaining((DoubleConsumer) consumer);
                    return;
                }
                if (Tripwire.ENABLED) {
                    Tripwire.trip(_this.getClass(), "{0} calling Spliterator.OfDouble.forEachRemaining((DoubleConsumer) action::accept)");
                }
                Objects.requireNonNull(consumer);
                _this.forEachRemaining((DoubleConsumer) new PrimitiveIterator$OfDouble$$ExternalSyntheticLambda0(consumer));
            }
        }
    }
}
