package j$.util.function;

import j$.util.Objects;
import java.util.function.Function;

/* renomeado de: j$.util.function.Function$-CC, motivo: nome de classe inválido */
/* carregado de: classes15.dex */
public final /* sintético */ class Function$CC {
    public static Function $default$compose(final Function _this, final Function function) {
        Objects.requireNonNull(function);
        return new Function() { // da classe: j$.util.function.Function$$ExternalSyntheticLambda2
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function2) {
                return Function$CC.$default$andThen(this, function2);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Object apply;
                apply = Function.this.apply(function.apply(obj));
                return apply;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function2) {
                return Function$CC.$default$compose(this, function2);
            }
        };
    }

    public static Function $default$andThen(final Function _this, final Function function) {
        Objects.requireNonNull(function);
        return new Function() { // da classe: j$.util.function.Function$$ExternalSyntheticLambda1
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function2) {
                return Function$CC.$default$andThen(this, function2);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                Object apply;
                apply = function.apply(Function.this.apply(obj));
                return apply;
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function2) {
                return Function$CC.$default$compose(this, function2);
            }
        };
    }

    public static <T> Function<T, T> identity() {
        return new Function() { // da classe: j$.util.function.Function$$ExternalSyntheticLambda0
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return Function$CC.lambda$identity$2(obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        };
    }

    public static /* sintético */ Object lambda$identity$2(Object t) {
        return t;
    }
}
