package j$.util.stream;

import j$.util.Objects;
import j$.util.Spliterator;
import j$.util.function.Consumer$CC;
import j$.util.function.DoubleConsumer$CC;
import j$.util.function.IntConsumer$CC;
import j$.util.function.LongConsumer$CC;
import j$.util.stream.MatchOps;
import j$.util.stream.Sink;
import java.util.function.Consumer;
import java.util.function.DoubleConsumer;
import java.util.function.DoublePredicate;
import java.util.function.IntConsumer;
import java.util.function.IntPredicate;
import java.util.function.LongConsumer;
import java.util.function.LongPredicate;
import java.util.function.Predicate;
import java.util.function.Supplier;

/* carregado de: classes15.dex */
final class MatchOps {
    private MatchOps() {
    }

    enum MatchKind {
        ANY(true, true),
        ALL(false, false),
        NONE(true, false);

        private final boolean shortCircuitResult;
        private final boolean stopOnPredicateMatches;

        MatchKind(boolean stopOnPredicateMatches, boolean shortCircuitResult) {
            this.stopOnPredicateMatches = stopOnPredicateMatches;
            this.shortCircuitResult = shortCircuitResult;
        }
    }

    public static <T> TerminalOp<T, Boolean> makeRef(final Predicate<? super T> predicate, final MatchKind matchKind) {
        Objects.requireNonNull(predicate);
        Objects.requireNonNull(matchKind);
        return new MatchOp(StreamShape.REFERENCE, matchKind, new Supplier() { // da classe: j$.util.stream.MatchOps$$ExternalSyntheticLambda3
            @Override // java.util.function.Supplier
            public final Object get() {
                return MatchOps.lambda$makeRef$0(MatchOps.MatchKind.this, predicate);
            }
        });
    }

    static /* sintético */ BooleanTerminalSink lambda$makeRef$0(MatchKind matchKind, Predicate predicate) {
        return new BooleanTerminalSink<T>(predicate) { // da classe: j$.util.stream.MatchOps.1MatchSink
            final /* sintético */ Predicate val$predicate;

            /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
            {
                super(MatchKind.this);
                this.val$predicate = predicate;
            }

            @Override // java.util.function.Consumer
            public void accept(T t) {
                if (!this.stop && this.val$predicate.test(t) == MatchKind.this.stopOnPredicateMatches) {
                    this.stop = true;
                    this.value = MatchKind.this.shortCircuitResult;
                }
            }
        };
    }

    public static TerminalOp<Integer, Boolean> makeInt(final IntPredicate predicate, final MatchKind matchKind) {
        Objects.requireNonNull(predicate);
        Objects.requireNonNull(matchKind);
        return new MatchOp(StreamShape.INT_VALUE, matchKind, new Supplier() { // da classe: j$.util.stream.MatchOps$$ExternalSyntheticLambda1
            @Override // java.util.function.Supplier
            public final Object get() {
                return MatchOps.lambda$makeInt$1(MatchOps.MatchKind.this, predicate);
            }
        });
    }

    /* renomeado de: j$.util.stream.MatchOps$2MatchSink, motivo: nome de classe inválido */
    class C2MatchSink extends BooleanTerminalSink<Integer> implements Sink.OfInt {
        final /* sintético */ MatchKind val$matchKind;
        final /* sintético */ IntPredicate val$predicate;

        @Override // j$.util.stream.Sink.OfInt
        public /* sintético */ void accept(Integer num) {
            Sink.OfInt.CC.$default$accept((Sink.OfInt) this, num);
        }

        @Override // java.util.function.Consumer
        public /* bridge */ /* sintético */ void accept(Object obj) {
            Sink.OfInt.CC.$default$accept(this, obj);
        }

        @Override // java.util.function.IntConsumer
        public /* sintético */ IntConsumer andThen(IntConsumer intConsumer) {
            return IntConsumer$CC.$default$andThen(this, intConsumer);
        }

        /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
        C2MatchSink(MatchKind matchKind, IntPredicate intPredicate) {
            super(matchKind);
            this.val$matchKind = matchKind;
            this.val$predicate = intPredicate;
        }

        @Override // j$.util.stream.MatchOps.BooleanTerminalSink, j$.util.stream.Sink
        public void accept(int t) {
            if (!this.stop && this.val$predicate.test(t) == this.val$matchKind.stopOnPredicateMatches) {
                this.stop = true;
                this.value = this.val$matchKind.shortCircuitResult;
            }
        }
    }

    static /* sintético */ BooleanTerminalSink lambda$makeInt$1(MatchKind matchKind, IntPredicate predicate) {
        return new C2MatchSink(matchKind, predicate);
    }

    public static TerminalOp<Long, Boolean> makeLong(final LongPredicate predicate, final MatchKind matchKind) {
        Objects.requireNonNull(predicate);
        Objects.requireNonNull(matchKind);
        return new MatchOp(StreamShape.LONG_VALUE, matchKind, new Supplier() { // da classe: j$.util.stream.MatchOps$$ExternalSyntheticLambda0
            @Override // java.util.function.Supplier
            public final Object get() {
                return MatchOps.lambda$makeLong$2(MatchOps.MatchKind.this, predicate);
            }
        });
    }

    /* renomeado de: j$.util.stream.MatchOps$3MatchSink, motivo: nome de classe inválido */
    class C3MatchSink extends BooleanTerminalSink<Long> implements Sink.OfLong {
        final /* sintético */ MatchKind val$matchKind;
        final /* sintético */ LongPredicate val$predicate;

        @Override // j$.util.stream.Sink.OfLong
        public /* sintético */ void accept(Long l) {
            Sink.OfLong.CC.$default$accept((Sink.OfLong) this, l);
        }

        @Override // java.util.function.Consumer
        public /* bridge */ /* sintético */ void accept(Object obj) {
            Sink.OfLong.CC.$default$accept(this, obj);
        }

        @Override // java.util.function.LongConsumer
        public /* sintético */ LongConsumer andThen(LongConsumer longConsumer) {
            return LongConsumer$CC.$default$andThen(this, longConsumer);
        }

        /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
        C3MatchSink(MatchKind matchKind, LongPredicate longPredicate) {
            super(matchKind);
            this.val$matchKind = matchKind;
            this.val$predicate = longPredicate;
        }

        @Override // j$.util.stream.MatchOps.BooleanTerminalSink, j$.util.stream.Sink
        public void accept(long t) {
            if (!this.stop && this.val$predicate.test(t) == this.val$matchKind.stopOnPredicateMatches) {
                this.stop = true;
                this.value = this.val$matchKind.shortCircuitResult;
            }
        }
    }

    static /* sintético */ BooleanTerminalSink lambda$makeLong$2(MatchKind matchKind, LongPredicate predicate) {
        return new C3MatchSink(matchKind, predicate);
    }

    public static TerminalOp<Double, Boolean> makeDouble(final DoublePredicate predicate, final MatchKind matchKind) {
        Objects.requireNonNull(predicate);
        Objects.requireNonNull(matchKind);
        return new MatchOp(StreamShape.DOUBLE_VALUE, matchKind, new Supplier() { // da classe: j$.util.stream.MatchOps$$ExternalSyntheticLambda2
            @Override // java.util.function.Supplier
            public final Object get() {
                return MatchOps.lambda$makeDouble$3(MatchOps.MatchKind.this, predicate);
            }
        });
    }

    /* renomeado de: j$.util.stream.MatchOps$4MatchSink, motivo: nome de classe inválido */
    class C4MatchSink extends BooleanTerminalSink<Double> implements Sink.OfDouble {
        final /* sintético */ MatchKind val$matchKind;
        final /* sintético */ DoublePredicate val$predicate;

        @Override // j$.util.stream.Sink.OfDouble
        public /* sintético */ void accept(Double d) {
            Sink.OfDouble.CC.$default$accept((Sink.OfDouble) this, d);
        }

        @Override // java.util.function.Consumer
        public /* bridge */ /* sintético */ void accept(Object obj) {
            Sink.OfDouble.CC.$default$accept(this, obj);
        }

        @Override // java.util.function.DoubleConsumer
        public /* sintético */ DoubleConsumer andThen(DoubleConsumer doubleConsumer) {
            return DoubleConsumer$CC.$default$andThen(this, doubleConsumer);
        }

        /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
        C4MatchSink(MatchKind matchKind, DoublePredicate doublePredicate) {
            super(matchKind);
            this.val$matchKind = matchKind;
            this.val$predicate = doublePredicate;
        }

        @Override // j$.util.stream.MatchOps.BooleanTerminalSink, j$.util.stream.Sink, java.util.function.DoubleConsumer
        public void accept(double t) {
            if (!this.stop && this.val$predicate.test(t) == this.val$matchKind.stopOnPredicateMatches) {
                this.stop = true;
                this.value = this.val$matchKind.shortCircuitResult;
            }
        }
    }

    static /* sintético */ BooleanTerminalSink lambda$makeDouble$3(MatchKind matchKind, DoublePredicate predicate) {
        return new C4MatchSink(matchKind, predicate);
    }

    private static final class MatchOp<T> implements TerminalOp<T, Boolean> {
        private final StreamShape inputShape;
        final MatchKind matchKind;
        final Supplier<BooleanTerminalSink<T>> sinkSupplier;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.MatchOps$MatchOp != java.util.stream.MatchOps$MatchOp<T> */
        MatchOp(StreamShape shape, MatchKind matchKind, Supplier<BooleanTerminalSink<T>> supplier) {
            this.inputShape = shape;
            this.matchKind = matchKind;
            this.sinkSupplier = supplier;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.MatchOps$MatchOp != java.util.stream.MatchOps$MatchOp<T> */
        @Override // j$.util.stream.TerminalOp
        public int getOpFlags() {
            return StreamOpFlag.IS_SHORT_CIRCUIT | StreamOpFlag.NOT_ORDERED;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.MatchOps$MatchOp != java.util.stream.MatchOps$MatchOp<T> */
        @Override // j$.util.stream.TerminalOp
        public StreamShape inputShape() {
            return this.inputShape;
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<S> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.MatchOps$MatchOp != java.util.stream.MatchOps$MatchOp<T> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.PipelineHelper != java.util.stream.PipelineHelper<T> */
        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        @Override // j$.util.stream.TerminalOp
        public <S> Boolean evaluateSequential(PipelineHelper<T> pipelineHelper, Spliterator<S> spliterator) {
            return Boolean.valueOf(((BooleanTerminalSink) pipelineHelper.wrapAndCopyInto(this.sinkSupplier.get(), spliterator)).getAndClearState());
        }

        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<S> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.MatchOps$MatchOp != java.util.stream.MatchOps$MatchOp<T> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.PipelineHelper != java.util.stream.PipelineHelper<T> */
        @Override // j$.util.stream.TerminalOp
        public <S> Boolean evaluateParallel(PipelineHelper<T> pipelineHelper, Spliterator<S> spliterator) {
            return (Boolean) new MatchTask(this, pipelineHelper, spliterator).invoke();
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    static abstract class BooleanTerminalSink<T> implements Sink<T> {
        boolean stop;
        boolean value;

        @Override // j$.util.stream.Sink, java.util.function.DoubleConsumer
        public /* sintético */ void accept(double d) {
            Sink.CC.$default$accept(this, d);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ void accept(int i) {
            Sink.CC.$default$accept((Sink) this, i);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ void accept(long j) {
            Sink.CC.$default$accept((Sink) this, j);
        }

        @Override // java.util.function.Consumer
        public /* sintético */ Consumer andThen(Consumer consumer) {
            return Consumer$CC.$default$andThen(this, consumer);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ void begin(long j) {
            Sink.CC.$default$begin(this, j);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ void end() {
            Sink.CC.$default$end(this);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.MatchOps$BooleanTerminalSink != java.util.stream.MatchOps$BooleanTerminalSink<T> */
        BooleanTerminalSink(MatchKind matchKind) {
            this.value = !matchKind.shortCircuitResult;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.MatchOps$BooleanTerminalSink != java.util.stream.MatchOps$BooleanTerminalSink<T> */
        public boolean getAndClearState() {
            return this.value;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.MatchOps$BooleanTerminalSink != java.util.stream.MatchOps$BooleanTerminalSink<T> */
        @Override // j$.util.stream.Sink
        public boolean cancellationRequested() {
            return this.stop;
        }
    }

    private static final class MatchTask<P_IN, P_OUT> extends AbstractShortCircuitTask<P_IN, P_OUT, Boolean, MatchTask<P_IN, P_OUT>> {
        private final MatchOp<P_OUT> op;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.MatchOps$MatchOp != java.util.stream.MatchOps$MatchOp<P_OUT> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.MatchOps$MatchTask != java.util.stream.MatchOps$MatchTask<P_IN, P_OUT> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.PipelineHelper != java.util.stream.PipelineHelper<P_OUT> */
        MatchTask(MatchOp<P_OUT> matchOp, PipelineHelper<P_OUT> pipelineHelper, Spliterator<P_IN> spliterator) {
            super(pipelineHelper, spliterator);
            this.op = matchOp;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.MatchOps$MatchTask != java.util.stream.MatchOps$MatchTask<P_IN, P_OUT> */
        MatchTask(MatchTask<P_IN, P_OUT> matchTask, Spliterator<P_IN> spliterator) {
            super(matchTask, spliterator);
            this.op = matchTask.op;
        }

        /* JADX INFO: modificadores de acesso alterados de: protected */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.MatchOps$MatchTask != java.util.stream.MatchOps$MatchTask<P_IN, P_OUT> */
        @Override // j$.util.stream.AbstractTask
        public MatchTask<P_IN, P_OUT> makeChild(Spliterator<P_IN> spliterator) {
            return new MatchTask<>(this, spliterator);
        }

        /* JADX INFO: modificadores de acesso alterados de: protected */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.MatchOps$MatchTask != java.util.stream.MatchOps$MatchTask<P_IN, P_OUT> */
        @Override // j$.util.stream.AbstractTask
        public Boolean doLeaf() {
            boolean b = ((BooleanTerminalSink) this.helper.wrapAndCopyInto(this.op.sinkSupplier.get(), this.spliterator)).getAndClearState();
            if (b == this.op.matchKind.shortCircuitResult) {
                shortCircuit(Boolean.valueOf(b));
                return null;
            }
            return null;
        }

        /* JADX INFO: modificadores de acesso alterados de: protected */
        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.MatchOps$MatchTask != java.util.stream.MatchOps$MatchTask<P_IN, P_OUT> */
        @Override // j$.util.stream.AbstractShortCircuitTask
        public Boolean getEmptyResult() {
            return Boolean.valueOf(!this.op.matchKind.shortCircuitResult);
        }
    }
}
