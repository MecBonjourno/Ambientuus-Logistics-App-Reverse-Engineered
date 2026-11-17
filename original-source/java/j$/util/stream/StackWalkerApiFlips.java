package j$.util.stream;

import j$.util.ConversionRuntimeException;
import j$.util.function.Function$CC;
import j$.util.stream.Stream;
import java.util.function.Function;

/* loaded from: classes15.dex */
public class StackWalkerApiFlips {
    public static Function<?, ?> flipFunctionStream(Function<?, ?> function) {
        return new FunctionStreamWrapper(function);
    }

    public static class FunctionStreamWrapper<T, R> implements Function<T, R> {
        public Function<T, R> function;

        @Override // java.util.function.Function
        public /* synthetic */ Function andThen(Function function) {
            return Function$CC.$default$andThen(this, function);
        }

        @Override // java.util.function.Function
        public /* synthetic */ Function compose(Function function) {
            return Function$CC.$default$compose(this, function);
        }

        public FunctionStreamWrapper(Function<T, R> function) {
            this.function = function;
        }

        private T flipStream(T t) {
            if (t == null) {
                return null;
            }
            if (t instanceof Stream) {
                return (T) Stream.Wrapper.convert((Stream) t);
            }
            if (t instanceof java.util.stream.Stream) {
                return (T) Stream.VivifiedWrapper.convert((java.util.stream.Stream) t);
            }
            throw ConversionRuntimeException.exception("java.util.stream.Stream", t.getClass());
        }

        @Override // java.util.function.Function
        public R apply(T t) {
            return this.function.apply(flipStream(t));
        }
    }
}
