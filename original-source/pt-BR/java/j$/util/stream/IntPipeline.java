package j$.util.stream;

import j$.util.IntSummaryStatistics;
import j$.util.Objects;
import j$.util.OptionalDouble;
import j$.util.OptionalInt;
import j$.util.Spliterator;
import j$.util.Spliterators;
import j$.util.function.BiConsumer$CC;
import j$.util.function.BiFunction$CC;
import j$.util.stream.DoublePipeline;
import j$.util.stream.LongPipeline;
import j$.util.stream.MatchOps;
import j$.util.stream.Node;
import j$.util.stream.ReferencePipeline;
import j$.util.stream.Sink;
import j$.util.stream.StreamSpliterators;
import java.util.Iterator;
import java.util.function.BiConsumer;
import java.util.function.BiFunction;
import java.util.function.BinaryOperator;
import java.util.function.Function;
import java.util.function.IntBinaryOperator;
import java.util.function.IntConsumer;
import java.util.function.IntFunction;
import java.util.function.IntPredicate;
import java.util.function.IntToDoubleFunction;
import java.util.function.IntToLongFunction;
import java.util.function.IntUnaryOperator;
import java.util.function.ObjIntConsumer;
import java.util.function.Supplier;
import java.util.function.ToIntFunction;

/* carregado de: classes15.dex */
abstract class IntPipeline<E_IN> extends AbstractPipeline<E_IN, Integer, IntStream> implements IntStream {
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.AbstractPipeline, j$.util.stream.BaseStream
    public /* bridge */ /* sintético */ IntStream parallel() {
        return (IntStream) super.parallel();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.AbstractPipeline, j$.util.stream.BaseStream
    public /* bridge */ /* sintético */ IntStream sequential() {
        return (IntStream) super.sequential();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    IntPipeline(Supplier<? extends Spliterator<Integer>> supplier, int sourceFlags, boolean parallel) {
        super(supplier, sourceFlags, parallel);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<java.lang.Integer> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    IntPipeline(Spliterator<Integer> spliterator, int sourceFlags, boolean parallel) {
        super(spliterator, sourceFlags, parallel);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.AbstractPipeline != java.util.stream.AbstractPipeline<?, E_IN, ?> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    IntPipeline(AbstractPipeline<?, E_IN, ?> abstractPipeline, int opFlags) {
        super(abstractPipeline, opFlags);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<java.lang.Integer> */
    private static IntConsumer adapt(Sink<Integer> sink) {
        if (sink instanceof IntConsumer) {
            return (IntConsumer) sink;
        }
        if (Tripwire.ENABLED) {
            Tripwire.trip(AbstractPipeline.class, "using IntStream.adapt(Sink<Integer> s)");
        }
        Objects.requireNonNull(sink);
        return new IntPipeline$$ExternalSyntheticLambda10(sink);
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<java.lang.Integer> */
    public static Spliterator.OfInt adapt(Spliterator<Integer> spliterator) {
        if (spliterator instanceof Spliterator.OfInt) {
            return (Spliterator.OfInt) spliterator;
        }
        if (Tripwire.ENABLED) {
            Tripwire.trip(AbstractPipeline.class, "using IntStream.adapt(Spliterator<Integer> s)");
        }
        throw new UnsupportedOperationException("IntStream.adapt(Spliterator<Integer> s)");
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.AbstractPipeline
    final StreamShape getOutputShape() {
        return StreamShape.INT_VALUE;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.PipelineHelper != java.util.stream.PipelineHelper<java.lang.Integer> */
    @Override // j$.util.stream.AbstractPipeline
    final <P_IN> Node<Integer> evaluateToNode(PipelineHelper<Integer> pipelineHelper, Spliterator<P_IN> spliterator, boolean flattenTree, IntFunction<Integer[]> generator) {
        return Nodes.collectInt(pipelineHelper, spliterator, flattenTree);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.PipelineHelper != java.util.stream.PipelineHelper<java.lang.Integer> */
    @Override // j$.util.stream.AbstractPipeline
    final <P_IN> Spliterator<Integer> wrap(PipelineHelper<Integer> pipelineHelper, Supplier<Spliterator<P_IN>> supplier, boolean isParallel) {
        return new StreamSpliterators.IntWrappingSpliterator(pipelineHelper, supplier, isParallel);
    }

    /* JADX INFO: modificadores de acesso alterados de: package-private */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.AbstractPipeline
    /* renomeado de: lazySpliterator */
    public final Spliterator<Integer> lazySpliterator2(Supplier<? extends Spliterator<Integer>> supplier) {
        return new StreamSpliterators.DelegatingSpliterator.OfInt(supplier);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<java.lang.Integer> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<java.lang.Integer> */
    @Override // j$.util.stream.AbstractPipeline
    final boolean forEachWithCancel(Spliterator<Integer> spliterator, Sink<Integer> sink) {
        boolean cancelled;
        Spliterator.OfInt spl = adapt(spliterator);
        IntConsumer adaptedSink = adapt(sink);
        do {
            cancelled = sink.cancellationRequested();
            if (cancelled) {
                break;
            }
        } while (spl.tryAdvance(adaptedSink));
        return cancelled;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.AbstractPipeline, j$.util.stream.PipelineHelper
    final Node.Builder<Integer> makeNodeBuilder(long exactSizeIfKnown, IntFunction<Integer[]> generator) {
        return Nodes.intBuilder(exactSizeIfKnown);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    private <U> Stream<U> mapToObj(final IntFunction<? extends U> mapper, int opFlags) {
        return new ReferencePipeline.StatelessOp<Integer, U>(this, StreamShape.INT_VALUE, opFlags) { // da classe: j$.util.stream.IntPipeline.1
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<U> */
            @Override // j$.util.stream.AbstractPipeline
            Sink<Integer> opWrapSink(int flags, Sink<U> sink) {
                return new Sink.ChainedInt<U>(sink) { // da classe: j$.util.stream.IntPipeline.1.1
                    @Override // j$.util.stream.Sink.OfInt, j$.util.stream.Sink
                    public void accept(int t) {
                        this.downstream.accept(mapper.apply(t));
                    }
                };
            }
        };
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    /* JADX WARN: falha na inferência de tipo para: r0v0, types: [j$.util.Spliterator$OfInt] */
    @Override // j$.util.stream.BaseStream
    /* renomeado de: iterator */
    public final Iterator<Integer> iterator2() {
        return Spliterators.iterator((Spliterator.OfInt) spliterator2());
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.AbstractPipeline, j$.util.stream.BaseStream
    /* renomeado de: spliterator */
    public final Spliterator<Integer> spliterator2() {
        return adapt((Spliterator<Integer>) super.spliterator2());
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final LongStream asLongStream() {
        return new LongPipeline.StatelessOp<Integer>(this, StreamShape.INT_VALUE, 0) { // da classe: j$.util.stream.IntPipeline.2
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<java.lang.Long> */
            @Override // j$.util.stream.AbstractPipeline
            Sink<Integer> opWrapSink(int flags, Sink<Long> sink) {
                return new Sink.ChainedInt<Long>(sink) { // da classe: j$.util.stream.IntPipeline.2.1
                    @Override // j$.util.stream.Sink.OfInt, j$.util.stream.Sink
                    public void accept(int t) {
                        this.downstream.accept(t);
                    }
                };
            }
        };
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final DoubleStream asDoubleStream() {
        return new DoublePipeline.StatelessOp<Integer>(this, StreamShape.INT_VALUE, 0) { // da classe: j$.util.stream.IntPipeline.3
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<java.lang.Double> */
            @Override // j$.util.stream.AbstractPipeline
            Sink<Integer> opWrapSink(int flags, Sink<Double> sink) {
                return new Sink.ChainedInt<Double>(sink) { // da classe: j$.util.stream.IntPipeline.3.1
                    @Override // j$.util.stream.Sink.OfInt, j$.util.stream.Sink
                    public void accept(int t) {
                        this.downstream.accept(t);
                    }
                };
            }
        };
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final Stream<Integer> boxed() {
        return mapToObj(new IntFunction() { // da classe: j$.util.stream.IntPipeline$$ExternalSyntheticLambda12
            @Override // java.util.function.IntFunction
            public final Object apply(int i) {
                return Integer.valueOf(i);
            }
        }, 0);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final IntStream map(final IntUnaryOperator mapper) {
        Objects.requireNonNull(mapper);
        return new StatelessOp<Integer>(this, StreamShape.INT_VALUE, StreamOpFlag.NOT_SORTED | StreamOpFlag.NOT_DISTINCT) { // da classe: j$.util.stream.IntPipeline.4
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<java.lang.Integer> */
            @Override // j$.util.stream.AbstractPipeline
            Sink<Integer> opWrapSink(int flags, Sink<Integer> sink) {
                return new Sink.ChainedInt<Integer>(sink) { // da classe: j$.util.stream.IntPipeline.4.1
                    @Override // j$.util.stream.Sink.OfInt, j$.util.stream.Sink
                    public void accept(int t) {
                        this.downstream.accept(mapper.applyAsInt(t));
                    }
                };
            }
        };
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final <U> Stream<U> mapToObj(IntFunction<? extends U> mapper) {
        Objects.requireNonNull(mapper);
        return mapToObj(mapper, StreamOpFlag.NOT_SORTED | StreamOpFlag.NOT_DISTINCT);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final LongStream mapToLong(final IntToLongFunction mapper) {
        Objects.requireNonNull(mapper);
        return new LongPipeline.StatelessOp<Integer>(this, StreamShape.INT_VALUE, StreamOpFlag.NOT_SORTED | StreamOpFlag.NOT_DISTINCT) { // da classe: j$.util.stream.IntPipeline.5
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<java.lang.Long> */
            @Override // j$.util.stream.AbstractPipeline
            Sink<Integer> opWrapSink(int flags, Sink<Long> sink) {
                return new Sink.ChainedInt<Long>(sink) { // da classe: j$.util.stream.IntPipeline.5.1
                    @Override // j$.util.stream.Sink.OfInt, j$.util.stream.Sink
                    public void accept(int t) {
                        this.downstream.accept(mapper.applyAsLong(t));
                    }
                };
            }
        };
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final DoubleStream mapToDouble(final IntToDoubleFunction mapper) {
        Objects.requireNonNull(mapper);
        return new DoublePipeline.StatelessOp<Integer>(this, StreamShape.INT_VALUE, StreamOpFlag.NOT_SORTED | StreamOpFlag.NOT_DISTINCT) { // da classe: j$.util.stream.IntPipeline.6
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<java.lang.Double> */
            @Override // j$.util.stream.AbstractPipeline
            Sink<Integer> opWrapSink(int flags, Sink<Double> sink) {
                return new Sink.ChainedInt<Double>(sink) { // da classe: j$.util.stream.IntPipeline.6.1
                    @Override // j$.util.stream.Sink.OfInt, j$.util.stream.Sink
                    public void accept(int t) {
                        this.downstream.accept(mapper.applyAsDouble(t));
                    }
                };
            }
        };
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final IntStream flatMap(final IntFunction<? extends IntStream> intFunction) {
        Objects.requireNonNull(intFunction);
        return new StatelessOp<Integer>(this, StreamShape.INT_VALUE, StreamOpFlag.NOT_SORTED | StreamOpFlag.NOT_DISTINCT | StreamOpFlag.NOT_SIZED) { // da classe: j$.util.stream.IntPipeline.7
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<java.lang.Integer> */
            @Override // j$.util.stream.AbstractPipeline
            Sink<Integer> opWrapSink(int flags, Sink<Integer> sink) {
                return new Sink.ChainedInt<Integer>(sink) { // da classe: j$.util.stream.IntPipeline.7.1
                    boolean cancellationRequestedCalled;
                    IntConsumer downstreamAsInt;

                    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<? super java.lang.Integer> */
                    {
                        Sink<? super E_OUT> sink2 = this.downstream;
                        Objects.requireNonNull(sink2);
                        this.downstreamAsInt = new IntPipeline$$ExternalSyntheticLambda10(sink2);
                    }

                    @Override // j$.util.stream.Sink.ChainedInt, j$.util.stream.Sink
                    public void begin(long size) {
                        this.downstream.begin(-1L);
                    }

                    /* JADX WARN: falha na inferência de tipo para: r1v3, types: [j$.util.Spliterator$OfInt] */
                    @Override // j$.util.stream.Sink.OfInt, j$.util.stream.Sink
                    public void accept(int t) {
                        IntStream result = (IntStream) intFunction.apply(t);
                        if (result != null) {
                            try {
                                if (!this.cancellationRequestedCalled) {
                                    result.sequential().forEach(this.downstreamAsInt);
                                } else {
                                    ?? spliterator2 = result.sequential().spliterator2();
                                    while (!this.downstream.cancellationRequested() && spliterator2.tryAdvance(this.downstreamAsInt)) {
                                    }
                                }
                            } catch (Throwable th) {
                                if (result != null) {
                                    try {
                                        result.close();
                                    } catch (Throwable th2) {
                                        th.addSuppressed(th2);
                                    }
                                }
                                throw th;
                            }
                        }
                        if (result != null) {
                            result.close();
                        }
                    }

                    @Override // j$.util.stream.Sink.ChainedInt, j$.util.stream.Sink
                    public boolean cancellationRequested() {
                        this.cancellationRequestedCalled = true;
                        return this.downstream.cancellationRequested();
                    }
                };
            }
        };
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.BaseStream
    public IntStream unordered() {
        if (!isOrdered()) {
            return this;
        }
        return new StatelessOp<Integer>(this, StreamShape.INT_VALUE, StreamOpFlag.NOT_ORDERED) { // da classe: j$.util.stream.IntPipeline.8
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<java.lang.Integer> */
            @Override // j$.util.stream.AbstractPipeline
            Sink<Integer> opWrapSink(int flags, Sink<Integer> sink) {
                return sink;
            }
        };
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final IntStream filter(final IntPredicate predicate) {
        Objects.requireNonNull(predicate);
        return new StatelessOp<Integer>(this, StreamShape.INT_VALUE, StreamOpFlag.NOT_SIZED) { // da classe: j$.util.stream.IntPipeline.9
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<java.lang.Integer> */
            @Override // j$.util.stream.AbstractPipeline
            Sink<Integer> opWrapSink(int flags, Sink<Integer> sink) {
                return new Sink.ChainedInt<Integer>(sink) { // da classe: j$.util.stream.IntPipeline.9.1
                    @Override // j$.util.stream.Sink.ChainedInt, j$.util.stream.Sink
                    public void begin(long size) {
                        this.downstream.begin(-1L);
                    }

                    @Override // j$.util.stream.Sink.OfInt, j$.util.stream.Sink
                    public void accept(int t) {
                        if (predicate.test(t)) {
                            this.downstream.accept(t);
                        }
                    }
                };
            }
        };
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final IntStream peek(final IntConsumer action) {
        Objects.requireNonNull(action);
        return new StatelessOp<Integer>(this, StreamShape.INT_VALUE, 0) { // da classe: j$.util.stream.IntPipeline.10
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<java.lang.Integer> */
            @Override // j$.util.stream.AbstractPipeline
            Sink<Integer> opWrapSink(int flags, Sink<Integer> sink) {
                return new Sink.ChainedInt<Integer>(sink) { // da classe: j$.util.stream.IntPipeline.10.1
                    @Override // j$.util.stream.Sink.OfInt, j$.util.stream.Sink
                    public void accept(int t) {
                        action.accept(t);
                        this.downstream.accept(t);
                    }
                };
            }
        };
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final IntStream limit(long maxSize) {
        if (maxSize < 0) {
            throw new IllegalArgumentException(Long.toString(maxSize));
        }
        return SliceOps.makeInt(this, 0L, maxSize);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final IntStream skip(long n) {
        if (n < 0) {
            throw new IllegalArgumentException(Long.toString(n));
        }
        if (n == 0) {
            return this;
        }
        return SliceOps.makeInt(this, n, -1L);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final IntStream takeWhile(IntPredicate predicate) {
        return WhileOps.makeTakeWhileInt(this, predicate);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final IntStream dropWhile(IntPredicate predicate) {
        return WhileOps.makeDropWhileInt(this, predicate);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final IntStream sorted() {
        return SortedOps.makeInt(this);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final IntStream distinct() {
        return boxed().distinct().mapToInt(new ToIntFunction() { // da classe: j$.util.stream.IntPipeline$$ExternalSyntheticLambda11
            @Override // java.util.function.ToIntFunction
            public final int applyAsInt(Object obj) {
                int intValue;
                intValue = ((Integer) obj).intValue();
                return intValue;
            }
        });
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public void forEach(IntConsumer action) {
        evaluate(ForEachOps.makeInt(action, false));
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public void forEachOrdered(IntConsumer action) {
        evaluate(ForEachOps.makeInt(action, true));
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final int sum() {
        return reduce(0, new IntBinaryOperator() { // da classe: j$.util.stream.IntPipeline$$ExternalSyntheticLambda5
            @Override // java.util.function.IntBinaryOperator
            public final int applyAsInt(int i, int i2) {
                return i + i2;
            }
        });
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final OptionalInt min() {
        return reduce(new IntBinaryOperator() { // da classe: j$.util.stream.IntPipeline$$ExternalSyntheticLambda1
            @Override // java.util.function.IntBinaryOperator
            public final int applyAsInt(int i, int i2) {
                return Math.min(i, i2);
            }
        });
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final OptionalInt max() {
        return reduce(new IntBinaryOperator() { // da classe: j$.util.stream.IntPipeline$$ExternalSyntheticLambda6
            @Override // java.util.function.IntBinaryOperator
            public final int applyAsInt(int i, int i2) {
                return Math.max(i, i2);
            }
        });
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final long count() {
        return ((Long) evaluate(ReduceOps.makeIntCounting())).longValue();
    }

    static /* sintético */ long[] lambda$average$1() {
        return new long[2];
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final OptionalDouble average() {
        long[] avg = (long[]) collect(new Supplier() { // da classe: j$.util.stream.IntPipeline$$ExternalSyntheticLambda7
            @Override // java.util.function.Supplier
            public final Object get() {
                return IntPipeline.lambda$average$1();
            }
        }, new ObjIntConsumer() { // da classe: j$.util.stream.IntPipeline$$ExternalSyntheticLambda8
            @Override // java.util.function.ObjIntConsumer
            public final void accept(Object obj, int i) {
                IntPipeline.lambda$average$2((long[]) obj, i);
            }
        }, new BiConsumer() { // da classe: j$.util.stream.IntPipeline$$ExternalSyntheticLambda9
            @Override // java.util.function.BiConsumer
            public final void accept(Object obj, Object obj2) {
                IntPipeline.lambda$average$3((long[]) obj, (long[]) obj2);
            }

            @Override // java.util.function.BiConsumer
            public /* sintético */ BiConsumer andThen(BiConsumer biConsumer) {
                return BiConsumer$CC.$default$andThen(this, biConsumer);
            }
        });
        if (avg[0] > 0) {
            return OptionalDouble.of(avg[1] / avg[0]);
        }
        return OptionalDouble.empty();
    }

    static /* sintético */ void lambda$average$2(long[] ll, int i) {
        ll[0] = ll[0] + 1;
        ll[1] = ll[1] + i;
    }

    static /* sintético */ void lambda$average$3(long[] ll, long[] rr) {
        ll[0] = ll[0] + rr[0];
        ll[1] = ll[1] + rr[1];
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final IntSummaryStatistics summaryStatistics() {
        return (IntSummaryStatistics) collect(new Collectors$$ExternalSyntheticLambda27(), new ObjIntConsumer() { // da classe: j$.util.stream.IntPipeline$$ExternalSyntheticLambda2
            @Override // java.util.function.ObjIntConsumer
            public final void accept(Object obj, int i) {
                ((IntSummaryStatistics) obj).accept(i);
            }
        }, new BiConsumer() { // da classe: j$.util.stream.IntPipeline$$ExternalSyntheticLambda3
            @Override // java.util.function.BiConsumer
            public final void accept(Object obj, Object obj2) {
                ((IntSummaryStatistics) obj).combine((IntSummaryStatistics) obj2);
            }

            @Override // java.util.function.BiConsumer
            public /* sintético */ BiConsumer andThen(BiConsumer biConsumer) {
                return BiConsumer$CC.$default$andThen(this, biConsumer);
            }
        });
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final int reduce(int identity, IntBinaryOperator op) {
        return ((Integer) evaluate(ReduceOps.makeInt(identity, op))).intValue();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final OptionalInt reduce(IntBinaryOperator op) {
        return (OptionalInt) evaluate(ReduceOps.makeInt(op));
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final <R> R collect(Supplier<R> supplier, ObjIntConsumer<R> objIntConsumer, final BiConsumer<R, R> biConsumer) {
        Objects.requireNonNull(biConsumer);
        return (R) evaluate(ReduceOps.makeInt(supplier, objIntConsumer, new BinaryOperator() { // da classe: j$.util.stream.IntPipeline$$ExternalSyntheticLambda4
            @Override // java.util.function.BiFunction
            public /* sintético */ BiFunction andThen(Function function) {
                return BiFunction$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.BiFunction
            public final Object apply(Object obj, Object obj2) {
                return IntPipeline.lambda$collect$4(BiConsumer.this, obj, obj2);
            }
        }));
    }

    static /* sintético */ Object lambda$collect$4(BiConsumer combiner, Object left, Object right) {
        combiner.accept(left, right);
        return left;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final boolean anyMatch(IntPredicate predicate) {
        return ((Boolean) evaluate(MatchOps.makeInt(predicate, MatchOps.MatchKind.ANY))).booleanValue();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final boolean allMatch(IntPredicate predicate) {
        return ((Boolean) evaluate(MatchOps.makeInt(predicate, MatchOps.MatchKind.ALL))).booleanValue();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final boolean noneMatch(IntPredicate predicate) {
        return ((Boolean) evaluate(MatchOps.makeInt(predicate, MatchOps.MatchKind.NONE))).booleanValue();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final OptionalInt findFirst() {
        return (OptionalInt) evaluate(FindOps.makeInt(true));
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final OptionalInt findAny() {
        return (OptionalInt) evaluate(FindOps.makeInt(false));
    }

    static /* sintético */ Integer[] lambda$toArray$5(int x$0) {
        return new Integer[x$0];
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline != java.util.stream.IntPipeline<E_IN> */
    @Override // j$.util.stream.IntStream
    public final int[] toArray() {
        return Nodes.flattenInt((Node.OfInt) evaluateToArrayNode(new IntFunction() { // da classe: j$.util.stream.IntPipeline$$ExternalSyntheticLambda0
            @Override // java.util.function.IntFunction
            public final Object apply(int i) {
                return IntPipeline.lambda$toArray$5(i);
            }
        })).asPrimitiveArray();
    }

    static class Head<E_IN> extends IntPipeline<E_IN> {
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$Head != java.util.stream.IntPipeline$Head<E_IN> */
        @Override // j$.util.stream.IntPipeline, j$.util.stream.BaseStream
        /* renomeado de: iterator */
        public /* bridge */ /* sintético */ Iterator<Integer> iterator2() {
            return super.iterator2();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$Head != java.util.stream.IntPipeline$Head<E_IN> */
        @Override // j$.util.stream.IntPipeline, j$.util.stream.AbstractPipeline
        /* renomeado de: lazySpliterator */
        /* bridge */ /* sintético */ Spliterator<Integer> lazySpliterator2(Supplier<? extends Spliterator<Integer>> supplier) {
            return super.lazySpliterator2(supplier);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$Head != java.util.stream.IntPipeline$Head<E_IN> */
        @Override // j$.util.stream.IntPipeline, j$.util.stream.AbstractPipeline, j$.util.stream.BaseStream
        public /* bridge */ /* sintético */ IntStream parallel() {
            return (IntStream) super.parallel();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$Head != java.util.stream.IntPipeline$Head<E_IN> */
        @Override // j$.util.stream.IntPipeline, j$.util.stream.AbstractPipeline, j$.util.stream.BaseStream
        public /* bridge */ /* sintético */ IntStream sequential() {
            return (IntStream) super.sequential();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$Head != java.util.stream.IntPipeline$Head<E_IN> */
        @Override // j$.util.stream.IntPipeline, j$.util.stream.AbstractPipeline, j$.util.stream.BaseStream
        /* renomeado de: spliterator */
        public /* bridge */ /* sintético */ Spliterator<Integer> spliterator2() {
            return super.spliterator2();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$Head != java.util.stream.IntPipeline$Head<E_IN> */
        @Override // j$.util.stream.IntPipeline, j$.util.stream.BaseStream
        public /* bridge */ /* sintético */ IntStream unordered() {
            return super.unordered();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$Head != java.util.stream.IntPipeline$Head<E_IN> */
        Head(Supplier<? extends Spliterator<Integer>> supplier, int sourceFlags, boolean parallel) {
            super(supplier, sourceFlags, parallel);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<java.lang.Integer> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$Head != java.util.stream.IntPipeline$Head<E_IN> */
        Head(Spliterator<Integer> spliterator, int sourceFlags, boolean parallel) {
            super(spliterator, sourceFlags, parallel);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$Head != java.util.stream.IntPipeline$Head<E_IN> */
        @Override // j$.util.stream.AbstractPipeline
        final boolean opIsStateful() {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$Head != java.util.stream.IntPipeline$Head<E_IN> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<java.lang.Integer> */
        @Override // j$.util.stream.AbstractPipeline
        final Sink<E_IN> opWrapSink(int flags, Sink<Integer> sink) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$Head != java.util.stream.IntPipeline$Head<E_IN> */
        @Override // j$.util.stream.IntPipeline, j$.util.stream.IntStream
        public void forEach(IntConsumer action) {
            if (!isParallel()) {
                IntPipeline.adapt(sourceStageSpliterator()).forEachRemaining(action);
            } else {
                super.forEach(action);
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$Head != java.util.stream.IntPipeline$Head<E_IN> */
        @Override // j$.util.stream.IntPipeline, j$.util.stream.IntStream
        public void forEachOrdered(IntConsumer action) {
            if (!isParallel()) {
                IntPipeline.adapt(sourceStageSpliterator()).forEachRemaining(action);
            } else {
                super.forEachOrdered(action);
            }
        }
    }

    static abstract class StatelessOp<E_IN> extends IntPipeline<E_IN> {
        static final /* sintético */ boolean $assertionsDisabled = false;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$StatelessOp != java.util.stream.IntPipeline$StatelessOp<E_IN> */
        @Override // j$.util.stream.IntPipeline, j$.util.stream.BaseStream
        /* renomeado de: iterator */
        public /* bridge */ /* sintético */ Iterator<Integer> iterator2() {
            return super.iterator2();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$StatelessOp != java.util.stream.IntPipeline$StatelessOp<E_IN> */
        @Override // j$.util.stream.IntPipeline, j$.util.stream.AbstractPipeline
        /* renomeado de: lazySpliterator */
        /* bridge */ /* sintético */ Spliterator<Integer> lazySpliterator2(Supplier<? extends Spliterator<Integer>> supplier) {
            return super.lazySpliterator2(supplier);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$StatelessOp != java.util.stream.IntPipeline$StatelessOp<E_IN> */
        @Override // j$.util.stream.IntPipeline, j$.util.stream.AbstractPipeline, j$.util.stream.BaseStream
        public /* bridge */ /* sintético */ IntStream parallel() {
            return (IntStream) super.parallel();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$StatelessOp != java.util.stream.IntPipeline$StatelessOp<E_IN> */
        @Override // j$.util.stream.IntPipeline, j$.util.stream.AbstractPipeline, j$.util.stream.BaseStream
        public /* bridge */ /* sintético */ IntStream sequential() {
            return (IntStream) super.sequential();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$StatelessOp != java.util.stream.IntPipeline$StatelessOp<E_IN> */
        @Override // j$.util.stream.IntPipeline, j$.util.stream.AbstractPipeline, j$.util.stream.BaseStream
        /* renomeado de: spliterator */
        public /* bridge */ /* sintético */ Spliterator<Integer> spliterator2() {
            return super.spliterator2();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$StatelessOp != java.util.stream.IntPipeline$StatelessOp<E_IN> */
        @Override // j$.util.stream.IntPipeline, j$.util.stream.BaseStream
        public /* bridge */ /* sintético */ IntStream unordered() {
            return super.unordered();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.AbstractPipeline != java.util.stream.AbstractPipeline<?, E_IN, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$StatelessOp != java.util.stream.IntPipeline$StatelessOp<E_IN> */
        StatelessOp(AbstractPipeline<?, E_IN, ?> abstractPipeline, StreamShape inputShape, int opFlags) {
            super(abstractPipeline, opFlags);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$StatelessOp != java.util.stream.IntPipeline$StatelessOp<E_IN> */
        @Override // j$.util.stream.AbstractPipeline
        final boolean opIsStateful() {
            return false;
        }
    }

    static abstract class StatefulOp<E_IN> extends IntPipeline<E_IN> {
        static final /* sintético */ boolean $assertionsDisabled = false;

        @Override // j$.util.stream.AbstractPipeline
        abstract <P_IN> Node<Integer> opEvaluateParallel(PipelineHelper<Integer> pipelineHelper, Spliterator<P_IN> spliterator, IntFunction<Integer[]> intFunction);

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$StatefulOp != java.util.stream.IntPipeline$StatefulOp<E_IN> */
        @Override // j$.util.stream.IntPipeline, j$.util.stream.BaseStream
        /* renomeado de: iterator */
        public /* bridge */ /* sintético */ Iterator<Integer> iterator2() {
            return super.iterator2();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$StatefulOp != java.util.stream.IntPipeline$StatefulOp<E_IN> */
        @Override // j$.util.stream.IntPipeline, j$.util.stream.AbstractPipeline
        /* renomeado de: lazySpliterator */
        /* bridge */ /* sintético */ Spliterator<Integer> lazySpliterator2(Supplier<? extends Spliterator<Integer>> supplier) {
            return super.lazySpliterator2(supplier);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$StatefulOp != java.util.stream.IntPipeline$StatefulOp<E_IN> */
        @Override // j$.util.stream.IntPipeline, j$.util.stream.AbstractPipeline, j$.util.stream.BaseStream
        public /* bridge */ /* sintético */ IntStream parallel() {
            return (IntStream) super.parallel();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$StatefulOp != java.util.stream.IntPipeline$StatefulOp<E_IN> */
        @Override // j$.util.stream.IntPipeline, j$.util.stream.AbstractPipeline, j$.util.stream.BaseStream
        public /* bridge */ /* sintético */ IntStream sequential() {
            return (IntStream) super.sequential();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$StatefulOp != java.util.stream.IntPipeline$StatefulOp<E_IN> */
        @Override // j$.util.stream.IntPipeline, j$.util.stream.AbstractPipeline, j$.util.stream.BaseStream
        /* renomeado de: spliterator */
        public /* bridge */ /* sintético */ Spliterator<Integer> spliterator2() {
            return super.spliterator2();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$StatefulOp != java.util.stream.IntPipeline$StatefulOp<E_IN> */
        @Override // j$.util.stream.IntPipeline, j$.util.stream.BaseStream
        public /* bridge */ /* sintético */ IntStream unordered() {
            return super.unordered();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.AbstractPipeline != java.util.stream.AbstractPipeline<?, E_IN, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$StatefulOp != java.util.stream.IntPipeline$StatefulOp<E_IN> */
        StatefulOp(AbstractPipeline<?, E_IN, ?> abstractPipeline, StreamShape inputShape, int opFlags) {
            super(abstractPipeline, opFlags);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.IntPipeline$StatefulOp != java.util.stream.IntPipeline$StatefulOp<E_IN> */
        @Override // j$.util.stream.AbstractPipeline
        final boolean opIsStateful() {
            return true;
        }
    }
}
