package j$.util.function;

import j$.util.Objects;
import java.util.function.IntConsumer;

/* renomeado de: j$.util.function.IntConsumer$-CC, motivo: nome de classe inválido */
/* carregado de: classes15.dex */
public final /* sintético */ class IntConsumer$CC {
    public static IntConsumer $default$andThen(final IntConsumer _this, final IntConsumer after) {
        Objects.requireNonNull(after);
        return new IntConsumer() { // da classe: j$.util.function.IntConsumer$$ExternalSyntheticLambda0
            @Override // java.util.function.IntConsumer
            public final void accept(int i) {
                IntConsumer$CC.$private$lambda$andThen$0(IntConsumer.this, after, i);
            }

            @Override // java.util.function.IntConsumer
            public /* sintético */ IntConsumer andThen(IntConsumer intConsumer) {
                return IntConsumer$CC.$default$andThen(this, intConsumer);
            }
        };
    }

    public static /* sintético */ void $private$lambda$andThen$0(IntConsumer _this, IntConsumer after, int t) {
        _this.accept(t);
        after.accept(t);
    }
}
