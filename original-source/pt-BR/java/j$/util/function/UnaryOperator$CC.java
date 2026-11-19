package j$.util.function;

import java.util.function.Function;
import java.util.function.UnaryOperator;

/* renomeado de: j$.util.function.UnaryOperator$-CC, motivo: nome de classe inválido */
/* carregado de: classes15.dex */
public final /* sintético */ class UnaryOperator$CC {
    public static <T> UnaryOperator<T> identity() {
        return new UnaryOperator() { // da classe: j$.util.function.UnaryOperator$$ExternalSyntheticLambda0
            @Override // java.util.function.Function
            public /* sintético */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return UnaryOperator$CC.lambda$identity$0(obj);
            }

            @Override // java.util.function.Function
            public /* sintético */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        };
    }

    public static /* sintético */ Object lambda$identity$0(Object t) {
        return t;
    }
}
