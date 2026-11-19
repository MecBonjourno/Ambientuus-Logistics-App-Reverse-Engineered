package j$.util.stream;

import j$.util.Objects;
import j$.util.function.Consumer$CC;
import j$.util.function.DoubleConsumer$CC;
import j$.util.function.IntConsumer$CC;
import j$.util.function.LongConsumer$CC;
import java.util.function.Consumer;
import java.util.function.DoubleConsumer;
import java.util.function.IntConsumer;
import java.util.function.LongConsumer;

/* carregado de: classes15.dex */
interface Sink<T> extends Consumer<T> {
    void accept(double d);

    void accept(int i);

    void accept(long j);

    void begin(long j);

    boolean cancellationRequested();

    void end();

    /* renomeado de: j$.util.stream.Sink$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        public static void $default$begin(Sink _this, long size) {
        }

        public static void $default$end(Sink _this) {
        }

        public static boolean $default$cancellationRequested(Sink _this) {
            return false;
        }

        public static void $default$accept(Sink _this, int value) {
            throw new IllegalStateException("called wrong accept method");
        }

        public static void $default$accept(Sink _this, long value) {
            throw new IllegalStateException("called wrong accept method");
        }

        public static void $default$accept(Sink _this, double value) {
            throw new IllegalStateException("called wrong accept method");
        }
    }

    public interface OfInt extends Sink<Integer>, IntConsumer {
        @Override // j$.util.stream.Sink
        void accept(int i);

        void accept(Integer num);

        /* renomeado de: j$.util.stream.Sink$OfInt$-CC, motivo: nome de classe inválido */
        public final /* sintético */ class CC {
            public static /* bridge */ /* sintético */ void $default$accept(OfInt _this, Object obj) {
                _this.accept((Integer) obj);
            }

            public static void $default$accept(OfInt _this, Integer i) {
                if (Tripwire.ENABLED) {
                    Tripwire.trip(_this.getClass(), "{0} calling Sink.OfInt.accept(Integer)");
                }
                _this.accept(i.intValue());
            }
        }
    }

    public interface OfLong extends Sink<Long>, LongConsumer {
        @Override // j$.util.stream.Sink
        void accept(long j);

        void accept(Long l);

        /* renomeado de: j$.util.stream.Sink$OfLong$-CC, motivo: nome de classe inválido */
        public final /* sintético */ class CC {
            public static /* bridge */ /* sintético */ void $default$accept(OfLong _this, Object obj) {
                _this.accept((Long) obj);
            }

            public static void $default$accept(OfLong _this, Long i) {
                if (Tripwire.ENABLED) {
                    Tripwire.trip(_this.getClass(), "{0} calling Sink.OfLong.accept(Long)");
                }
                _this.accept(i.longValue());
            }
        }
    }

    public interface OfDouble extends Sink<Double>, DoubleConsumer {
        @Override // j$.util.stream.Sink, java.util.function.DoubleConsumer
        void accept(double d);

        void accept(Double d);

        /* renomeado de: j$.util.stream.Sink$OfDouble$-CC, motivo: nome de classe inválido */
        public final /* sintético */ class CC {
            public static /* bridge */ /* sintético */ void $default$accept(OfDouble _this, Object obj) {
                _this.accept((Double) obj);
            }

            public static void $default$accept(OfDouble _this, Double i) {
                if (Tripwire.ENABLED) {
                    Tripwire.trip(_this.getClass(), "{0} calling Sink.OfDouble.accept(Double)");
                }
                _this.accept(i.doubleValue());
            }
        }
    }

    public static abstract class ChainedReference<T, E_OUT> implements Sink<T> {
        protected final Sink<? super E_OUT> downstream;

        @Override // j$.util.stream.Sink, java.util.function.DoubleConsumer
        public /* sintético */ void accept(double d) {
            CC.$default$accept(this, d);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ void accept(int i) {
            CC.$default$accept((Sink) this, i);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ void accept(long j) {
            CC.$default$accept((Sink) this, j);
        }

        @Override // java.util.function.Consumer
        public /* sintético */ Consumer andThen(Consumer consumer) {
            return Consumer$CC.$default$andThen(this, consumer);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<? super E_OUT> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink$ChainedReference != java.util.stream.Sink$ChainedReference<T, E_OUT> */
        public ChainedReference(Sink<? super E_OUT> sink) {
            this.downstream = (Sink) Objects.requireNonNull(sink);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink$ChainedReference != java.util.stream.Sink$ChainedReference<T, E_OUT> */
        @Override // j$.util.stream.Sink
        public void begin(long size) {
            this.downstream.begin(size);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink$ChainedReference != java.util.stream.Sink$ChainedReference<T, E_OUT> */
        @Override // j$.util.stream.Sink
        public void end() {
            this.downstream.end();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink$ChainedReference != java.util.stream.Sink$ChainedReference<T, E_OUT> */
        @Override // j$.util.stream.Sink
        public boolean cancellationRequested() {
            return this.downstream.cancellationRequested();
        }
    }

    public static abstract class ChainedInt<E_OUT> implements OfInt {
        protected final Sink<? super E_OUT> downstream;

        @Override // j$.util.stream.Sink, java.util.function.DoubleConsumer
        public /* sintético */ void accept(double d) {
            CC.$default$accept(this, d);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ void accept(long j) {
            CC.$default$accept((Sink) this, j);
        }

        @Override // j$.util.stream.Sink.OfInt
        public /* sintético */ void accept(Integer num) {
            OfInt.CC.$default$accept((OfInt) this, num);
        }

        @Override // java.util.function.Consumer
        public /* bridge */ /* sintético */ void accept(Object obj) {
            OfInt.CC.$default$accept(this, obj);
        }

        @Override // java.util.function.Consumer
        public /* sintético */ Consumer andThen(Consumer consumer) {
            return Consumer$CC.$default$andThen(this, consumer);
        }

        @Override // java.util.function.IntConsumer
        public /* sintético */ IntConsumer andThen(IntConsumer intConsumer) {
            return IntConsumer$CC.$default$andThen(this, intConsumer);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<? super E_OUT> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink$ChainedInt != java.util.stream.Sink$ChainedInt<E_OUT> */
        public ChainedInt(Sink<? super E_OUT> sink) {
            this.downstream = (Sink) Objects.requireNonNull(sink);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink$ChainedInt != java.util.stream.Sink$ChainedInt<E_OUT> */
        @Override // j$.util.stream.Sink
        public void begin(long size) {
            this.downstream.begin(size);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink$ChainedInt != java.util.stream.Sink$ChainedInt<E_OUT> */
        @Override // j$.util.stream.Sink
        public void end() {
            this.downstream.end();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink$ChainedInt != java.util.stream.Sink$ChainedInt<E_OUT> */
        @Override // j$.util.stream.Sink
        public boolean cancellationRequested() {
            return this.downstream.cancellationRequested();
        }
    }

    public static abstract class ChainedLong<E_OUT> implements OfLong {
        protected final Sink<? super E_OUT> downstream;

        @Override // j$.util.stream.Sink, java.util.function.DoubleConsumer
        public /* sintético */ void accept(double d) {
            CC.$default$accept(this, d);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ void accept(int i) {
            CC.$default$accept((Sink) this, i);
        }

        @Override // j$.util.stream.Sink.OfLong
        public /* sintético */ void accept(Long l) {
            OfLong.CC.$default$accept((OfLong) this, l);
        }

        @Override // java.util.function.Consumer
        public /* bridge */ /* sintético */ void accept(Object obj) {
            OfLong.CC.$default$accept(this, obj);
        }

        @Override // java.util.function.Consumer
        public /* sintético */ Consumer andThen(Consumer consumer) {
            return Consumer$CC.$default$andThen(this, consumer);
        }

        @Override // java.util.function.LongConsumer
        public /* sintético */ LongConsumer andThen(LongConsumer longConsumer) {
            return LongConsumer$CC.$default$andThen(this, longConsumer);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<? super E_OUT> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink$ChainedLong != java.util.stream.Sink$ChainedLong<E_OUT> */
        public ChainedLong(Sink<? super E_OUT> sink) {
            this.downstream = (Sink) Objects.requireNonNull(sink);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink$ChainedLong != java.util.stream.Sink$ChainedLong<E_OUT> */
        @Override // j$.util.stream.Sink
        public void begin(long size) {
            this.downstream.begin(size);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink$ChainedLong != java.util.stream.Sink$ChainedLong<E_OUT> */
        @Override // j$.util.stream.Sink
        public void end() {
            this.downstream.end();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink$ChainedLong != java.util.stream.Sink$ChainedLong<E_OUT> */
        @Override // j$.util.stream.Sink
        public boolean cancellationRequested() {
            return this.downstream.cancellationRequested();
        }
    }

    public static abstract class ChainedDouble<E_OUT> implements OfDouble {
        protected final Sink<? super E_OUT> downstream;

        @Override // j$.util.stream.Sink
        public /* sintético */ void accept(int i) {
            CC.$default$accept((Sink) this, i);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ void accept(long j) {
            CC.$default$accept((Sink) this, j);
        }

        @Override // j$.util.stream.Sink.OfDouble
        public /* sintético */ void accept(Double d) {
            OfDouble.CC.$default$accept((OfDouble) this, d);
        }

        @Override // java.util.function.Consumer
        public /* bridge */ /* sintético */ void accept(Object obj) {
            OfDouble.CC.$default$accept(this, obj);
        }

        @Override // java.util.function.Consumer
        public /* sintético */ Consumer andThen(Consumer consumer) {
            return Consumer$CC.$default$andThen(this, consumer);
        }

        @Override // java.util.function.DoubleConsumer
        public /* sintético */ DoubleConsumer andThen(DoubleConsumer doubleConsumer) {
            return DoubleConsumer$CC.$default$andThen(this, doubleConsumer);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<? super E_OUT> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink$ChainedDouble != java.util.stream.Sink$ChainedDouble<E_OUT> */
        public ChainedDouble(Sink<? super E_OUT> sink) {
            this.downstream = (Sink) Objects.requireNonNull(sink);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink$ChainedDouble != java.util.stream.Sink$ChainedDouble<E_OUT> */
        @Override // j$.util.stream.Sink
        public void begin(long size) {
            this.downstream.begin(size);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink$ChainedDouble != java.util.stream.Sink$ChainedDouble<E_OUT> */
        @Override // j$.util.stream.Sink
        public void end() {
            this.downstream.end();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink$ChainedDouble != java.util.stream.Sink$ChainedDouble<E_OUT> */
        @Override // j$.util.stream.Sink
        public boolean cancellationRequested() {
            return this.downstream.cancellationRequested();
        }
    }
}
