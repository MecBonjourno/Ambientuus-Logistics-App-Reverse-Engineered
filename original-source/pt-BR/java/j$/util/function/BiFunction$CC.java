package j$.util.function;

import j$.util.Objects;
import java.util.function.BiFunction;
import java.util.function.Function;

/* renomeado de: j$.util.function.BiFunction$-CC, motivo: nome de classe inválido */
/* carregado de: classes15.dex */
public final /* sintético */ class BiFunction$CC {
    public static BiFunction $default$andThen(final BiFunction _this, final Function function) {
        Objects.requireNonNull(function);
        return new BiFunction() { // da classe: j$.util.function.BiFunction$$ExternalSyntheticLambda0
            @Override // java.util.function.BiFunction
            public /* sintético */ BiFunction andThen(Function function2) {
                return BiFunction$CC.$default$andThen(this, function2);
            }

            @Override // java.util.function.BiFunction
            public final Object apply(Object obj, Object obj2) {
                Object apply;
                apply = function.apply(BiFunction.this.apply(obj, obj2));
                return apply;
            }
        };
    }
}
