package j$.util.stream;

import j$.util.ConversionRuntimeException;
import j$.util.function.Function$CC;
import j$.util.stream.DoubleStream;
import j$.util.stream.IntStream;
import j$.util.stream.LongStream;
import j$.util.stream.Stream;
import java.util.function.DoubleFunction;
import java.util.function.Function;
import java.util.function.IntFunction;
import java.util.function.LongFunction;

/* carregado de: classes15.dex */
public class FlatMapApiFlips {
    public static Function<?, ?> flipFunctionReturningStream(Function<?, ?> function) {
        return new FunctionStreamWrapper(function);
    }

    public static IntFunction<?> flipFunctionReturningStream(IntFunction<?> intFunction) {
        return new IntFunctionStreamWrapper(intFunction);
    }

    public static DoubleFunction<?> flipFunctionReturningStream(DoubleFunction<?> doubleFunction) {
        return new DoubleFunctionStreamWrapper(doubleFunction);
    }

    public static LongFunction<?> flipFunctionReturningStream(LongFunction<?> longFunction) {
        return new LongFunctionStreamWrapper(longFunction);
    }

    public static class FunctionStreamWrapper<T, R> implements Function<T, R> {
        public Function<T, R> function;

        @Override // java.util.function.Function
        public /* sintético */ Function andThen(Function function) {
            return Function$CC.$default$andThen(this, function);
        }

        @Override // java.util.function.Function
        public /* sintético */ Function compose(Function function) {
            return Function$CC.$default$compose(this, function);
        }

        public FunctionStreamWrapper(Function<T, R> function) {
            this.function = function;
        }

        private R flipStream(R r) {
            if (r == null) {
                return null;
            }
            if (r instanceof Stream) {
                return (R) Stream.Wrapper.convert((Stream) r);
            }
            if (r instanceof java.util.stream.Stream) {
                return (R) Stream.VivifiedWrapper.convert((java.util.stream.Stream) r);
            }
            if (r instanceof IntStream) {
                return (R) IntStream.Wrapper.convert((IntStream) r);
            }
            if (r instanceof java.util.stream.IntStream) {
                return (R) IntStream.VivifiedWrapper.convert((java.util.stream.IntStream) r);
            }
            if (r instanceof DoubleStream) {
                return (R) DoubleStream.Wrapper.convert((DoubleStream) r);
            }
            if (r instanceof java.util.stream.DoubleStream) {
                return (R) DoubleStream.VivifiedWrapper.convert((java.util.stream.DoubleStream) r);
            }
            if (r instanceof LongStream) {
                return (R) LongStream.Wrapper.convert((LongStream) r);
            }
            if (r instanceof java.util.stream.LongStream) {
                return (R) LongStream.VivifiedWrapper.convert((java.util.stream.LongStream) r);
            }
            throw ConversionRuntimeException.exception("java.util.stream.*Stream", r.getClass());
        }

        @Override // java.util.function.Function
        public R apply(T t) {
            return flipStream(this.function.apply(t));
        }
    }

    public static class IntFunctionStreamWrapper<R> implements IntFunction<R> {
        public IntFunction<R> function;

        public IntFunctionStreamWrapper(IntFunction<R> intFunction) {
            this.function = intFunction;
        }

        private R flipStream(R r) {
            if (r == null) {
                return null;
            }
            if (r instanceof IntStream) {
                return (R) IntStream.Wrapper.convert((IntStream) r);
            }
            if (r instanceof java.util.stream.IntStream) {
                return (R) IntStream.VivifiedWrapper.convert((java.util.stream.IntStream) r);
            }
            throw ConversionRuntimeException.exception("java.util.stream.IntStream", r.getClass());
        }

        @Override // java.util.function.IntFunction
        public R apply(int i) {
            return flipStream(this.function.apply(i));
        }
    }

    public static class DoubleFunctionStreamWrapper<R> implements DoubleFunction<R> {
        public DoubleFunction<R> function;

        public DoubleFunctionStreamWrapper(DoubleFunction<R> doubleFunction) {
            this.function = doubleFunction;
        }

        private R flipStream(R r) {
            if (r == null) {
                return null;
            }
            if (r instanceof DoubleStream) {
                return (R) DoubleStream.Wrapper.convert((DoubleStream) r);
            }
            if (r instanceof java.util.stream.DoubleStream) {
                return (R) DoubleStream.VivifiedWrapper.convert((java.util.stream.DoubleStream) r);
            }
            throw ConversionRuntimeException.exception("java.util.stream.DoubleStream", r.getClass());
        }

        @Override // java.util.function.DoubleFunction
        public R apply(double d) {
            return flipStream(this.function.apply(d));
        }
    }

    public static class LongFunctionStreamWrapper<R> implements LongFunction<R> {
        public LongFunction<R> function;

        public LongFunctionStreamWrapper(LongFunction<R> longFunction) {
            this.function = longFunction;
        }

        private R flipStream(R r) {
            if (r == null) {
                return null;
            }
            if (r instanceof LongStream) {
                return (R) LongStream.Wrapper.convert((LongStream) r);
            }
            if (r instanceof java.util.stream.LongStream) {
                return (R) LongStream.VivifiedWrapper.convert((java.util.stream.LongStream) r);
            }
            throw ConversionRuntimeException.exception("java.util.stream.LongStream", r.getClass());
        }

        @Override // java.util.function.LongFunction
        public R apply(long j) {
            return flipStream(this.function.apply(j));
        }
    }
}
