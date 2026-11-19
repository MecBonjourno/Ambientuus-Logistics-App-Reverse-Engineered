package j$.util.stream;

import androidx.camera.video.AudioStats;
import j$.util.DoubleSummaryStatistics;
import j$.util.Objects;
import j$.util.OptionalDouble;
import j$.util.Spliterator;
import j$.util.Spliterators;
import j$.util.function.BiConsumer$CC;
import j$.util.function.BiFunction$CC;
import j$.util.stream.IntPipeline;
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
import java.util.function.DoubleBinaryOperator;
import java.util.function.DoubleConsumer;
import java.util.function.DoubleFunction;
import java.util.function.DoublePredicate;
import java.util.function.DoubleToIntFunction;
import java.util.function.DoubleToLongFunction;
import java.util.function.DoubleUnaryOperator;
import java.util.function.Function;
import java.util.function.IntFunction;
import java.util.function.ObjDoubleConsumer;
import java.util.function.Supplier;
import java.util.function.ToDoubleFunction;

/* carregado de: classes15.dex */
abstract class DoublePipeline<E_IN> extends AbstractPipeline<E_IN, Double, DoubleStream> implements DoubleStream {
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.AbstractPipeline, j$.util.stream.BaseStream
    public /* bridge */ /* sintético */ DoubleStream parallel() {
        return (DoubleStream) super.parallel();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.AbstractPipeline, j$.util.stream.BaseStream
    public /* bridge */ /* sintético */ DoubleStream sequential() {
        return (DoubleStream) super.sequential();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    DoublePipeline(Supplier<? extends Spliterator<Double>> supplier, int sourceFlags, boolean parallel) {
        super(supplier, sourceFlags, parallel);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<java.lang.Double> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    DoublePipeline(Spliterator<Double> spliterator, int sourceFlags, boolean parallel) {
        super(spliterator, sourceFlags, parallel);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.AbstractPipeline != java.util.stream.AbstractPipeline<?, E_IN, ?> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    DoublePipeline(AbstractPipeline<?, E_IN, ?> abstractPipeline, int opFlags) {
        super(abstractPipeline, opFlags);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<java.lang.Double> */
    private static DoubleConsumer adapt(Sink<Double> sink) {
        if (sink instanceof DoubleConsumer) {
            return (DoubleConsumer) sink;
        }
        if (Tripwire.ENABLED) {
            Tripwire.trip(AbstractPipeline.class, "using DoubleStream.adapt(Sink<Double> s)");
        }
        Objects.requireNonNull(sink);
        return new DoublePipeline$$ExternalSyntheticLambda0(sink);
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<java.lang.Double> */
    public static Spliterator.OfDouble adapt(Spliterator<Double> spliterator) {
        if (spliterator instanceof Spliterator.OfDouble) {
            return (Spliterator.OfDouble) spliterator;
        }
        if (Tripwire.ENABLED) {
            Tripwire.trip(AbstractPipeline.class, "using DoubleStream.adapt(Spliterator<Double> s)");
        }
        throw new UnsupportedOperationException("DoubleStream.adapt(Spliterator<Double> s)");
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.AbstractPipeline
    final StreamShape getOutputShape() {
        return StreamShape.DOUBLE_VALUE;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.PipelineHelper != java.util.stream.PipelineHelper<java.lang.Double> */
    @Override // j$.util.stream.AbstractPipeline
    final <P_IN> Node<Double> evaluateToNode(PipelineHelper<Double> pipelineHelper, Spliterator<P_IN> spliterator, boolean flattenTree, IntFunction<Double[]> generator) {
        return Nodes.collectDouble(pipelineHelper, spliterator, flattenTree);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.PipelineHelper != java.util.stream.PipelineHelper<java.lang.Double> */
    @Override // j$.util.stream.AbstractPipeline
    final <P_IN> Spliterator<Double> wrap(PipelineHelper<Double> pipelineHelper, Supplier<Spliterator<P_IN>> supplier, boolean isParallel) {
        return new StreamSpliterators.DoubleWrappingSpliterator(pipelineHelper, supplier, isParallel);
    }

    /* JADX INFO: modificadores de acesso alterados de: package-private */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.AbstractPipeline
    /* renomeado de: lazySpliterator, motivo: mesclado com método bridge [métodos inline] */
    public final Spliterator<Double> lazySpliterator2(Supplier<? extends Spliterator<Double>> supplier) {
        return new StreamSpliterators.DelegatingSpliterator.OfDouble(supplier);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<java.lang.Double> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<java.lang.Double> */
    @Override // j$.util.stream.AbstractPipeline
    final boolean forEachWithCancel(Spliterator<Double> spliterator, Sink<Double> sink) {
        boolean cancelled;
        Spliterator.OfDouble spl = adapt(spliterator);
        DoubleConsumer adaptedSink = adapt(sink);
        do {
            cancelled = sink.cancellationRequested();
            if (cancelled) {
                break;
            }
        } while (spl.tryAdvance(adaptedSink));
        return cancelled;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.AbstractPipeline, j$.util.stream.PipelineHelper
    final Node.Builder<Double> makeNodeBuilder(long exactSizeIfKnown, IntFunction<Double[]> generator) {
        return Nodes.doubleBuilder(exactSizeIfKnown);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    private <U> Stream<U> mapToObj(final DoubleFunction<? extends U> mapper, int opFlags) {
        return new ReferencePipeline.StatelessOp<Double, U>(this, StreamShape.DOUBLE_VALUE, opFlags) { // da classe: j$.util.stream.DoublePipeline.1
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<U> */
            @Override // j$.util.stream.AbstractPipeline
            Sink<Double> opWrapSink(int flags, Sink<U> sink) {
                return new Sink.ChainedDouble<U>(sink) { // da classe: j$.util.stream.DoublePipeline.1.1
                    @Override // j$.util.stream.Sink.OfDouble, j$.util.stream.Sink, java.util.function.DoubleConsumer
                    public void accept(double t) {
                        this.downstream.accept(mapper.apply(t));
                    }
                };
            }
        };
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    /* JADX WARN: falha na inferência de tipo para: r0v0, types: [j$.util.Spliterator$OfDouble] */
    @Override // j$.util.stream.BaseStream
    /* renomeado de: iterator, motivo: mesclado com método bridge [métodos inline] */
    public final Iterator<Double> iterator2() {
        return Spliterators.iterator((Spliterator.OfDouble) spliterator2());
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.AbstractPipeline, j$.util.stream.BaseStream
    /* renomeado de: spliterator, motivo: mesclado com método bridge [métodos inline] */
    public final Spliterator<Double> spliterator2() {
        return adapt((Spliterator<Double>) super.spliterator2());
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final Stream<Double> boxed() {
        return mapToObj(new DoubleFunction() { // da classe: j$.util.stream.DoublePipeline$$ExternalSyntheticLambda3
            @Override // java.util.function.DoubleFunction
            public final Object apply(double d) {
                return Double.valueOf(d);
            }
        }, 0);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final DoubleStream map(final DoubleUnaryOperator mapper) {
        Objects.requireNonNull(mapper);
        return new StatelessOp<Double>(this, StreamShape.DOUBLE_VALUE, StreamOpFlag.NOT_SORTED | StreamOpFlag.NOT_DISTINCT) { // da classe: j$.util.stream.DoublePipeline.2
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<java.lang.Double> */
            @Override // j$.util.stream.AbstractPipeline
            Sink<Double> opWrapSink(int flags, Sink<Double> sink) {
                return new Sink.ChainedDouble<Double>(sink) { // da classe: j$.util.stream.DoublePipeline.2.1
                    @Override // j$.util.stream.Sink.OfDouble, j$.util.stream.Sink, java.util.function.DoubleConsumer
                    public void accept(double t) {
                        this.downstream.accept(mapper.applyAsDouble(t));
                    }
                };
            }
        };
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final <U> Stream<U> mapToObj(DoubleFunction<? extends U> mapper) {
        Objects.requireNonNull(mapper);
        return mapToObj(mapper, StreamOpFlag.NOT_SORTED | StreamOpFlag.NOT_DISTINCT);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final IntStream mapToInt(final DoubleToIntFunction mapper) {
        Objects.requireNonNull(mapper);
        return new IntPipeline.StatelessOp<Double>(this, StreamShape.DOUBLE_VALUE, StreamOpFlag.NOT_SORTED | StreamOpFlag.NOT_DISTINCT) { // da classe: j$.util.stream.DoublePipeline.3
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<java.lang.Integer> */
            @Override // j$.util.stream.AbstractPipeline
            Sink<Double> opWrapSink(int flags, Sink<Integer> sink) {
                return new Sink.ChainedDouble<Integer>(sink) { // da classe: j$.util.stream.DoublePipeline.3.1
                    @Override // j$.util.stream.Sink.OfDouble, j$.util.stream.Sink, java.util.function.DoubleConsumer
                    public void accept(double t) {
                        this.downstream.accept(mapper.applyAsInt(t));
                    }
                };
            }
        };
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final LongStream mapToLong(final DoubleToLongFunction mapper) {
        Objects.requireNonNull(mapper);
        return new LongPipeline.StatelessOp<Double>(this, StreamShape.DOUBLE_VALUE, StreamOpFlag.NOT_SORTED | StreamOpFlag.NOT_DISTINCT) { // da classe: j$.util.stream.DoublePipeline.4
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<java.lang.Long> */
            @Override // j$.util.stream.AbstractPipeline
            Sink<Double> opWrapSink(int flags, Sink<Long> sink) {
                return new Sink.ChainedDouble<Long>(sink) { // da classe: j$.util.stream.DoublePipeline.4.1
                    @Override // j$.util.stream.Sink.OfDouble, j$.util.stream.Sink, java.util.function.DoubleConsumer
                    public void accept(double t) {
                        this.downstream.accept(mapper.applyAsLong(t));
                    }
                };
            }
        };
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final DoubleStream flatMap(final DoubleFunction<? extends DoubleStream> doubleFunction) {
        Objects.requireNonNull(doubleFunction);
        return new StatelessOp<Double>(this, StreamShape.DOUBLE_VALUE, StreamOpFlag.NOT_SORTED | StreamOpFlag.NOT_DISTINCT | StreamOpFlag.NOT_SIZED) { // da classe: j$.util.stream.DoublePipeline.5
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<java.lang.Double> */
            @Override // j$.util.stream.AbstractPipeline
            Sink<Double> opWrapSink(int flags, Sink<Double> sink) {
                return new Sink.ChainedDouble<Double>(sink) { // da classe: j$.util.stream.DoublePipeline.5.1
                    boolean cancellationRequestedCalled;
                    DoubleConsumer downstreamAsDouble;

                    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<? super java.lang.Double> */
                    {
                        Sink<? super E_OUT> sink2 = this.downstream;
                        Objects.requireNonNull(sink2);
                        this.downstreamAsDouble = new DoublePipeline$$ExternalSyntheticLambda0(sink2);
                    }

                    @Override // j$.util.stream.Sink.ChainedDouble, j$.util.stream.Sink
                    public void begin(long size) {
                        this.downstream.begin(-1L);
                    }

                    /* JADX WARN: falha na inferência de tipo para: r1v3, types: [j$.util.Spliterator$OfDouble] */
                    @Override // j$.util.stream.Sink.OfDouble, j$.util.stream.Sink, java.util.function.DoubleConsumer
                    public void accept(double t) {
                        DoubleStream result = (DoubleStream) doubleFunction.apply(t);
                        if (result != null) {
                            try {
                                if (!this.cancellationRequestedCalled) {
                                    result.sequential().forEach(this.downstreamAsDouble);
                                } else {
                                    ?? spliterator2 = result.sequential().spliterator2();
                                    while (!this.downstream.cancellationRequested() && spliterator2.tryAdvance(this.downstreamAsDouble)) {
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

                    @Override // j$.util.stream.Sink.ChainedDouble, j$.util.stream.Sink
                    public boolean cancellationRequested() {
                        this.cancellationRequestedCalled = true;
                        return this.downstream.cancellationRequested();
                    }
                };
            }
        };
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.BaseStream
    public DoubleStream unordered() {
        if (!isOrdered()) {
            return this;
        }
        return new StatelessOp<Double>(this, StreamShape.DOUBLE_VALUE, StreamOpFlag.NOT_ORDERED) { // da classe: j$.util.stream.DoublePipeline.6
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<java.lang.Double> */
            @Override // j$.util.stream.AbstractPipeline
            Sink<Double> opWrapSink(int flags, Sink<Double> sink) {
                return sink;
            }
        };
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final DoubleStream filter(final DoublePredicate predicate) {
        Objects.requireNonNull(predicate);
        return new StatelessOp<Double>(this, StreamShape.DOUBLE_VALUE, StreamOpFlag.NOT_SIZED) { // da classe: j$.util.stream.DoublePipeline.7
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<java.lang.Double> */
            @Override // j$.util.stream.AbstractPipeline
            Sink<Double> opWrapSink(int flags, Sink<Double> sink) {
                return new Sink.ChainedDouble<Double>(sink) { // da classe: j$.util.stream.DoublePipeline.7.1
                    @Override // j$.util.stream.Sink.ChainedDouble, j$.util.stream.Sink
                    public void begin(long size) {
                        this.downstream.begin(-1L);
                    }

                    @Override // j$.util.stream.Sink.OfDouble, j$.util.stream.Sink, java.util.function.DoubleConsumer
                    public void accept(double t) {
                        if (predicate.test(t)) {
                            this.downstream.accept(t);
                        }
                    }
                };
            }
        };
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final DoubleStream peek(final DoubleConsumer action) {
        Objects.requireNonNull(action);
        return new StatelessOp<Double>(this, StreamShape.DOUBLE_VALUE, 0) { // da classe: j$.util.stream.DoublePipeline.8
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<java.lang.Double> */
            @Override // j$.util.stream.AbstractPipeline
            Sink<Double> opWrapSink(int flags, Sink<Double> sink) {
                return new Sink.ChainedDouble<Double>(sink) { // da classe: j$.util.stream.DoublePipeline.8.1
                    @Override // j$.util.stream.Sink.OfDouble, j$.util.stream.Sink, java.util.function.DoubleConsumer
                    public void accept(double t) {
                        action.accept(t);
                        this.downstream.accept(t);
                    }
                };
            }
        };
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final DoubleStream limit(long maxSize) {
        if (maxSize < 0) {
            throw new IllegalArgumentException(Long.toString(maxSize));
        }
        return SliceOps.makeDouble(this, 0L, maxSize);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final DoubleStream skip(long n) {
        if (n < 0) {
            throw new IllegalArgumentException(Long.toString(n));
        }
        if (n == 0) {
            return this;
        }
        return SliceOps.makeDouble(this, n, -1L);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final DoubleStream takeWhile(DoublePredicate predicate) {
        return WhileOps.makeTakeWhileDouble(this, predicate);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final DoubleStream dropWhile(DoublePredicate predicate) {
        return WhileOps.makeDropWhileDouble(this, predicate);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final DoubleStream sorted() {
        return SortedOps.makeDouble(this);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final DoubleStream distinct() {
        return boxed().distinct().mapToDouble(new ToDoubleFunction() { // da classe: j$.util.stream.DoublePipeline$$ExternalSyntheticLambda4
            @Override // java.util.function.ToDoubleFunction
            public final double applyAsDouble(Object obj) {
                double doubleValue;
                doubleValue = ((Double) obj).doubleValue();
                return doubleValue;
            }
        });
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public void forEach(DoubleConsumer consumer) {
        evaluate(ForEachOps.makeDouble(consumer, false));
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public void forEachOrdered(DoubleConsumer consumer) {
        evaluate(ForEachOps.makeDouble(consumer, true));
    }

    static /* sintético */ double[] lambda$sum$1() {
        return new double[3];
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final double sum() {
        double[] summation = (double[]) collect(new Supplier() { // da classe: j$.util.stream.DoublePipeline$$ExternalSyntheticLambda8
            @Override // java.util.function.Supplier
            public final Object get() {
                return DoublePipeline.lambda$sum$1();
            }
        }, new ObjDoubleConsumer() { // da classe: j$.util.stream.DoublePipeline$$ExternalSyntheticLambda9
            @Override // java.util.function.ObjDoubleConsumer
            public final void accept(Object obj, double d) {
                DoublePipeline.lambda$sum$2((double[]) obj, d);
            }
        }, new BiConsumer() { // da classe: j$.util.stream.DoublePipeline$$ExternalSyntheticLambda10
            @Override // java.util.function.BiConsumer
            public final void accept(Object obj, Object obj2) {
                DoublePipeline.lambda$sum$3((double[]) obj, (double[]) obj2);
            }

            @Override // java.util.function.BiConsumer
            public /* sintético */ BiConsumer andThen(BiConsumer biConsumer) {
                return BiConsumer$CC.$default$andThen(this, biConsumer);
            }
        });
        return Collectors.computeFinalSum(summation);
    }

    static /* sintético */ void lambda$sum$2(double[] ll, double d) {
        Collectors.sumWithCompensation(ll, d);
        ll[2] = ll[2] + d;
    }

    static /* sintético */ void lambda$sum$3(double[] ll, double[] rr) {
        Collectors.sumWithCompensation(ll, rr[0]);
        Collectors.sumWithCompensation(ll, rr[1]);
        ll[2] = ll[2] + rr[2];
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final OptionalDouble min() {
        return reduce(new DoubleBinaryOperator() { // da classe: j$.util.stream.DoublePipeline$$ExternalSyntheticLambda11
            @Override // java.util.function.DoubleBinaryOperator
            public final double applyAsDouble(double d, double d2) {
                return Math.min(d, d2);
            }
        });
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final OptionalDouble max() {
        return reduce(new DoubleBinaryOperator() { // da classe: j$.util.stream.DoublePipeline$$ExternalSyntheticLambda7
            @Override // java.util.function.DoubleBinaryOperator
            public final double applyAsDouble(double d, double d2) {
                return Math.max(d, d2);
            }
        });
    }

    static /* sintético */ double[] lambda$average$4() {
        return new double[4];
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final OptionalDouble average() {
        double[] avg = (double[]) collect(new Supplier() { // da classe: j$.util.stream.DoublePipeline$$ExternalSyntheticLambda12
            @Override // java.util.function.Supplier
            public final Object get() {
                return DoublePipeline.lambda$average$4();
            }
        }, new ObjDoubleConsumer() { // da classe: j$.util.stream.DoublePipeline$$ExternalSyntheticLambda13
            @Override // java.util.function.ObjDoubleConsumer
            public final void accept(Object obj, double d) {
                DoublePipeline.lambda$average$5((double[]) obj, d);
            }
        }, new BiConsumer() { // da classe: j$.util.stream.DoublePipeline$$ExternalSyntheticLambda14
            @Override // java.util.function.BiConsumer
            public final void accept(Object obj, Object obj2) {
                DoublePipeline.lambda$average$6((double[]) obj, (double[]) obj2);
            }

            @Override // java.util.function.BiConsumer
            public /* sintético */ BiConsumer andThen(BiConsumer biConsumer) {
                return BiConsumer$CC.$default$andThen(this, biConsumer);
            }
        });
        if (avg[2] > AudioStats.AUDIO_AMPLITUDE_NONE) {
            return OptionalDouble.of(Collectors.computeFinalSum(avg) / avg[2]);
        }
        return OptionalDouble.empty();
    }

    static /* sintético */ void lambda$average$5(double[] ll, double d) {
        ll[2] = ll[2] + 1.0d;
        Collectors.sumWithCompensation(ll, d);
        ll[3] = ll[3] + d;
    }

    static /* sintético */ void lambda$average$6(double[] ll, double[] rr) {
        Collectors.sumWithCompensation(ll, rr[0]);
        Collectors.sumWithCompensation(ll, rr[1]);
        ll[2] = ll[2] + rr[2];
        ll[3] = ll[3] + rr[3];
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final long count() {
        return ((Long) evaluate(ReduceOps.makeDoubleCounting())).longValue();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final DoubleSummaryStatistics summaryStatistics() {
        return (DoubleSummaryStatistics) collect(new Collectors$$ExternalSyntheticLambda15(), new ObjDoubleConsumer() { // da classe: j$.util.stream.DoublePipeline$$ExternalSyntheticLambda1
            @Override // java.util.function.ObjDoubleConsumer
            public final void accept(Object obj, double d) {
                ((DoubleSummaryStatistics) obj).accept(d);
            }
        }, new BiConsumer() { // da classe: j$.util.stream.DoublePipeline$$ExternalSyntheticLambda2
            @Override // java.util.function.BiConsumer
            public final void accept(Object obj, Object obj2) {
                ((DoubleSummaryStatistics) obj).combine((DoubleSummaryStatistics) obj2);
            }

            @Override // java.util.function.BiConsumer
            public /* sintético */ BiConsumer andThen(BiConsumer biConsumer) {
                return BiConsumer$CC.$default$andThen(this, biConsumer);
            }
        });
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final double reduce(double identity, DoubleBinaryOperator op) {
        return ((Double) evaluate(ReduceOps.makeDouble(identity, op))).doubleValue();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final OptionalDouble reduce(DoubleBinaryOperator op) {
        return (OptionalDouble) evaluate(ReduceOps.makeDouble(op));
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final <R> R collect(Supplier<R> supplier, ObjDoubleConsumer<R> objDoubleConsumer, final BiConsumer<R, R> biConsumer) {
        Objects.requireNonNull(biConsumer);
        return (R) evaluate(ReduceOps.makeDouble(supplier, objDoubleConsumer, new BinaryOperator() { // da classe: j$.util.stream.DoublePipeline$$ExternalSyntheticLambda6
            @Override // java.util.function.BiFunction
            public /* sintético */ BiFunction andThen(Function function) {
                return BiFunction$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.BiFunction
            public final Object apply(Object obj, Object obj2) {
                return DoublePipeline.lambda$collect$7(BiConsumer.this, obj, obj2);
            }
        }));
    }

    static /* sintético */ Object lambda$collect$7(BiConsumer combiner, Object left, Object right) {
        combiner.accept(left, right);
        return left;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final boolean anyMatch(DoublePredicate predicate) {
        return ((Boolean) evaluate(MatchOps.makeDouble(predicate, MatchOps.MatchKind.ANY))).booleanValue();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final boolean allMatch(DoublePredicate predicate) {
        return ((Boolean) evaluate(MatchOps.makeDouble(predicate, MatchOps.MatchKind.ALL))).booleanValue();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final boolean noneMatch(DoublePredicate predicate) {
        return ((Boolean) evaluate(MatchOps.makeDouble(predicate, MatchOps.MatchKind.NONE))).booleanValue();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final OptionalDouble findFirst() {
        return (OptionalDouble) evaluate(FindOps.makeDouble(true));
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final OptionalDouble findAny() {
        return (OptionalDouble) evaluate(FindOps.makeDouble(false));
    }

    static /* sintético */ Double[] lambda$toArray$8(int x$0) {
        return new Double[x$0];
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline != java.util.stream.DoublePipeline<E_IN> */
    @Override // j$.util.stream.DoubleStream
    public final double[] toArray() {
        return Nodes.flattenDouble((Node.OfDouble) evaluateToArrayNode(new IntFunction() { // da classe: j$.util.stream.DoublePipeline$$ExternalSyntheticLambda5
            @Override // java.util.function.IntFunction
            public final Object apply(int i) {
                return DoublePipeline.lambda$toArray$8(i);
            }
        })).asPrimitiveArray();
    }

    static class Head<E_IN> extends DoublePipeline<E_IN> {
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$Head != java.util.stream.DoublePipeline$Head<E_IN> */
        @Override // j$.util.stream.DoublePipeline, j$.util.stream.BaseStream
        /* renomeado de: iterator */
        public /* bridge */ /* sintético */ Iterator<Double> iterator2() {
            return super.iterator2();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$Head != java.util.stream.DoublePipeline$Head<E_IN> */
        @Override // j$.util.stream.DoublePipeline, j$.util.stream.AbstractPipeline
        /* renomeado de: lazySpliterator */
        /* bridge */ /* sintético */ Spliterator<Double> lazySpliterator2(Supplier<? extends Spliterator<Double>> supplier) {
            return super.lazySpliterator2(supplier);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$Head != java.util.stream.DoublePipeline$Head<E_IN> */
        @Override // j$.util.stream.DoublePipeline, j$.util.stream.AbstractPipeline, j$.util.stream.BaseStream
        public /* bridge */ /* sintético */ DoubleStream parallel() {
            return (DoubleStream) super.parallel();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$Head != java.util.stream.DoublePipeline$Head<E_IN> */
        @Override // j$.util.stream.DoublePipeline, j$.util.stream.AbstractPipeline, j$.util.stream.BaseStream
        public /* bridge */ /* sintético */ DoubleStream sequential() {
            return (DoubleStream) super.sequential();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$Head != java.util.stream.DoublePipeline$Head<E_IN> */
        @Override // j$.util.stream.DoublePipeline, j$.util.stream.AbstractPipeline, j$.util.stream.BaseStream
        /* renomeado de: spliterator */
        public /* bridge */ /* sintético */ Spliterator<Double> spliterator2() {
            return super.spliterator2();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$Head != java.util.stream.DoublePipeline$Head<E_IN> */
        @Override // j$.util.stream.DoublePipeline, j$.util.stream.BaseStream
        public /* bridge */ /* sintético */ DoubleStream unordered() {
            return super.unordered();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$Head != java.util.stream.DoublePipeline$Head<E_IN> */
        Head(Supplier<? extends Spliterator<Double>> supplier, int sourceFlags, boolean parallel) {
            super(supplier, sourceFlags, parallel);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<java.lang.Double> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$Head != java.util.stream.DoublePipeline$Head<E_IN> */
        Head(Spliterator<Double> spliterator, int sourceFlags, boolean parallel) {
            super(spliterator, sourceFlags, parallel);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$Head != java.util.stream.DoublePipeline$Head<E_IN> */
        @Override // j$.util.stream.AbstractPipeline
        final boolean opIsStateful() {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$Head != java.util.stream.DoublePipeline$Head<E_IN> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Sink != java.util.stream.Sink<java.lang.Double> */
        @Override // j$.util.stream.AbstractPipeline
        final Sink<E_IN> opWrapSink(int flags, Sink<Double> sink) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$Head != java.util.stream.DoublePipeline$Head<E_IN> */
        @Override // j$.util.stream.DoublePipeline, j$.util.stream.DoubleStream
        public void forEach(DoubleConsumer consumer) {
            if (!isParallel()) {
                DoublePipeline.adapt(sourceStageSpliterator()).forEachRemaining(consumer);
            } else {
                super.forEach(consumer);
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$Head != java.util.stream.DoublePipeline$Head<E_IN> */
        @Override // j$.util.stream.DoublePipeline, j$.util.stream.DoubleStream
        public void forEachOrdered(DoubleConsumer consumer) {
            if (!isParallel()) {
                DoublePipeline.adapt(sourceStageSpliterator()).forEachRemaining(consumer);
            } else {
                super.forEachOrdered(consumer);
            }
        }
    }

    static abstract class StatelessOp<E_IN> extends DoublePipeline<E_IN> {
        static final /* sintético */ boolean $assertionsDisabled = false;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$StatelessOp != java.util.stream.DoublePipeline$StatelessOp<E_IN> */
        @Override // j$.util.stream.DoublePipeline, j$.util.stream.BaseStream
        /* renomeado de: iterator */
        public /* bridge */ /* sintético */ Iterator<Double> iterator2() {
            return super.iterator2();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$StatelessOp != java.util.stream.DoublePipeline$StatelessOp<E_IN> */
        @Override // j$.util.stream.DoublePipeline, j$.util.stream.AbstractPipeline
        /* renomeado de: lazySpliterator */
        /* bridge */ /* sintético */ Spliterator<Double> lazySpliterator2(Supplier<? extends Spliterator<Double>> supplier) {
            return super.lazySpliterator2(supplier);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$StatelessOp != java.util.stream.DoublePipeline$StatelessOp<E_IN> */
        @Override // j$.util.stream.DoublePipeline, j$.util.stream.AbstractPipeline, j$.util.stream.BaseStream
        public /* bridge */ /* sintético */ DoubleStream parallel() {
            return (DoubleStream) super.parallel();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$StatelessOp != java.util.stream.DoublePipeline$StatelessOp<E_IN> */
        @Override // j$.util.stream.DoublePipeline, j$.util.stream.AbstractPipeline, j$.util.stream.BaseStream
        public /* bridge */ /* sintético */ DoubleStream sequential() {
            return (DoubleStream) super.sequential();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$StatelessOp != java.util.stream.DoublePipeline$StatelessOp<E_IN> */
        @Override // j$.util.stream.DoublePipeline, j$.util.stream.AbstractPipeline, j$.util.stream.BaseStream
        /* renomeado de: spliterator */
        public /* bridge */ /* sintético */ Spliterator<Double> spliterator2() {
            return super.spliterator2();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$StatelessOp != java.util.stream.DoublePipeline$StatelessOp<E_IN> */
        @Override // j$.util.stream.DoublePipeline, j$.util.stream.BaseStream
        public /* bridge */ /* sintético */ DoubleStream unordered() {
            return super.unordered();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.AbstractPipeline != java.util.stream.AbstractPipeline<?, E_IN, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$StatelessOp != java.util.stream.DoublePipeline$StatelessOp<E_IN> */
        StatelessOp(AbstractPipeline<?, E_IN, ?> abstractPipeline, StreamShape inputShape, int opFlags) {
            super(abstractPipeline, opFlags);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$StatelessOp != java.util.stream.DoublePipeline$StatelessOp<E_IN> */
        @Override // j$.util.stream.AbstractPipeline
        final boolean opIsStateful() {
            return false;
        }
    }

    static abstract class StatefulOp<E_IN> extends DoublePipeline<E_IN> {
        static final /* sintético */ boolean $assertionsDisabled = false;

        @Override // j$.util.stream.AbstractPipeline
        abstract <P_IN> Node<Double> opEvaluateParallel(PipelineHelper<Double> pipelineHelper, Spliterator<P_IN> spliterator, IntFunction<Double[]> intFunction);

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$StatefulOp != java.util.stream.DoublePipeline$StatefulOp<E_IN> */
        @Override // j$.util.stream.DoublePipeline, j$.util.stream.BaseStream
        /* renomeado de: iterator */
        public /* bridge */ /* sintético */ Iterator<Double> iterator2() {
            return super.iterator2();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$StatefulOp != java.util.stream.DoublePipeline$StatefulOp<E_IN> */
        @Override // j$.util.stream.DoublePipeline, j$.util.stream.AbstractPipeline
        /* renomeado de: lazySpliterator */
        /* bridge */ /* sintético */ Spliterator<Double> lazySpliterator2(Supplier<? extends Spliterator<Double>> supplier) {
            return super.lazySpliterator2(supplier);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$StatefulOp != java.util.stream.DoublePipeline$StatefulOp<E_IN> */
        @Override // j$.util.stream.DoublePipeline, j$.util.stream.AbstractPipeline, j$.util.stream.BaseStream
        public /* bridge */ /* sintético */ DoubleStream parallel() {
            return (DoubleStream) super.parallel();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$StatefulOp != java.util.stream.DoublePipeline$StatefulOp<E_IN> */
        @Override // j$.util.stream.DoublePipeline, j$.util.stream.AbstractPipeline, j$.util.stream.BaseStream
        public /* bridge */ /* sintético */ DoubleStream sequential() {
            return (DoubleStream) super.sequential();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$StatefulOp != java.util.stream.DoublePipeline$StatefulOp<E_IN> */
        @Override // j$.util.stream.DoublePipeline, j$.util.stream.AbstractPipeline, j$.util.stream.BaseStream
        /* renomeado de: spliterator */
        public /* bridge */ /* sintético */ Spliterator<Double> spliterator2() {
            return super.spliterator2();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$StatefulOp != java.util.stream.DoublePipeline$StatefulOp<E_IN> */
        @Override // j$.util.stream.DoublePipeline, j$.util.stream.BaseStream
        public /* bridge */ /* sintético */ DoubleStream unordered() {
            return super.unordered();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.AbstractPipeline != java.util.stream.AbstractPipeline<?, E_IN, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$StatefulOp != java.util.stream.DoublePipeline$StatefulOp<E_IN> */
        StatefulOp(AbstractPipeline<?, E_IN, ?> abstractPipeline, StreamShape inputShape, int opFlags) {
            super(abstractPipeline, opFlags);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.DoublePipeline$StatefulOp != java.util.stream.DoublePipeline$StatefulOp<E_IN> */
        @Override // j$.util.stream.AbstractPipeline
        final boolean opIsStateful() {
            return true;
        }
    }
}
