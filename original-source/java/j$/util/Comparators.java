package j$.util;

import j$.util.Comparator;
import java.io.Serializable;
import java.util.function.Function;
import java.util.function.ToDoubleFunction;
import java.util.function.ToIntFunction;
import java.util.function.ToLongFunction;

/* loaded from: classes15.dex */
class Comparators {
    private Comparators() {
        throw new AssertionError("no instances");
    }

    enum NaturalOrderComparator implements java.util.Comparator<Comparable<Object>>, Comparator<Comparable<Object>> {
        INSTANCE;

        @Override // java.util.Comparator, j$.util.Comparator
        public /* synthetic */ java.util.Comparator thenComparing(java.util.Comparator comparator) {
            return Comparator.CC.$default$thenComparing(this, comparator);
        }

        @Override // java.util.Comparator, j$.util.Comparator
        public /* synthetic */ java.util.Comparator thenComparing(Function function) {
            return Comparator.CC.$default$thenComparing(this, function);
        }

        @Override // java.util.Comparator, j$.util.Comparator
        public /* synthetic */ java.util.Comparator thenComparing(Function function, java.util.Comparator comparator) {
            return Comparator.CC.$default$thenComparing(this, function, comparator);
        }

        @Override // java.util.Comparator, j$.util.Comparator
        public /* synthetic */ java.util.Comparator thenComparingDouble(ToDoubleFunction toDoubleFunction) {
            return Comparator.CC.$default$thenComparingDouble(this, toDoubleFunction);
        }

        @Override // java.util.Comparator, j$.util.Comparator
        public /* synthetic */ java.util.Comparator thenComparingInt(ToIntFunction toIntFunction) {
            return Comparator.CC.$default$thenComparingInt(this, toIntFunction);
        }

        @Override // java.util.Comparator, j$.util.Comparator
        public /* synthetic */ java.util.Comparator thenComparingLong(ToLongFunction toLongFunction) {
            return Comparator.CC.$default$thenComparingLong(this, toLongFunction);
        }

        @Override // java.util.Comparator
        public int compare(Comparable<Object> c1, Comparable<Object> c2) {
            return c1.compareTo(c2);
        }

        @Override // java.util.Comparator, j$.util.Comparator
        public java.util.Comparator<Comparable<Object>> reversed() {
            return Comparator.CC.reverseOrder();
        }
    }

    static final class NullComparator<T> implements java.util.Comparator<T>, Serializable, Comparator<T> {
        private static final long serialVersionUID = -7569533591570686392L;
        private final boolean nullFirst;
        private final java.util.Comparator<T> real;

        @Override // java.util.Comparator, j$.util.Comparator
        public /* synthetic */ java.util.Comparator thenComparing(Function function) {
            return Comparator.CC.$default$thenComparing(this, function);
        }

        @Override // java.util.Comparator, j$.util.Comparator
        public /* synthetic */ java.util.Comparator thenComparing(Function function, java.util.Comparator comparator) {
            return Comparator.CC.$default$thenComparing(this, function, comparator);
        }

        @Override // java.util.Comparator, j$.util.Comparator
        public /* synthetic */ java.util.Comparator thenComparingDouble(ToDoubleFunction toDoubleFunction) {
            return Comparator.CC.$default$thenComparingDouble(this, toDoubleFunction);
        }

        @Override // java.util.Comparator, j$.util.Comparator
        public /* synthetic */ java.util.Comparator thenComparingInt(ToIntFunction toIntFunction) {
            return Comparator.CC.$default$thenComparingInt(this, toIntFunction);
        }

        @Override // java.util.Comparator, j$.util.Comparator
        public /* synthetic */ java.util.Comparator thenComparingLong(ToLongFunction toLongFunction) {
            return Comparator.CC.$default$thenComparingLong(this, toLongFunction);
        }

        /* JADX WARN: Generic types in debug info not equals: j$.util.Comparators$NullComparator != java.util.Comparators$NullComparator<T> */
        /* JADX WARN: Multi-variable type inference failed */
        NullComparator(boolean nullFirst, java.util.Comparator<? super T> comparator) {
            this.nullFirst = nullFirst;
            this.real = comparator;
        }

        /* JADX WARN: Generic types in debug info not equals: j$.util.Comparators$NullComparator != java.util.Comparators$NullComparator<T> */
        @Override // java.util.Comparator
        public int compare(T a, T b) {
            if (a == null) {
                if (b == null) {
                    return 0;
                }
                return this.nullFirst ? -1 : 1;
            }
            if (b == null) {
                return this.nullFirst ? 1 : -1;
            }
            if (this.real == null) {
                return 0;
            }
            return this.real.compare(a, b);
        }

        /* JADX WARN: Generic types in debug info not equals: j$.util.Comparators$NullComparator != java.util.Comparators$NullComparator<T> */
        @Override // java.util.Comparator, j$.util.Comparator
        public java.util.Comparator<T> thenComparing(java.util.Comparator<? super T> other) {
            Objects.requireNonNull(other);
            return new NullComparator(this.nullFirst, this.real == null ? other : Comparator.EL.thenComparing(this.real, other));
        }

        /* JADX WARN: Generic types in debug info not equals: j$.util.Comparators$NullComparator != java.util.Comparators$NullComparator<T> */
        @Override // java.util.Comparator, j$.util.Comparator
        public java.util.Comparator<T> reversed() {
            return new NullComparator(!this.nullFirst, this.real == null ? null : Comparator.EL.reversed(this.real));
        }
    }
}
