package j$.util.function;

import j$.util.Objects;
import java.util.function.DoubleConsumer;

/* renomeado de: j$.util.function.DoubleConsumer$-CC, motivo: nome de classe inválido */
/* carregado de: classes15.dex */
public final /* sintético */ class DoubleConsumer$CC {
    public static DoubleConsumer $default$andThen(final DoubleConsumer _this, final DoubleConsumer after) {
        Objects.requireNonNull(after);
        return new DoubleConsumer() { // da classe: j$.util.function.DoubleConsumer$$ExternalSyntheticLambda0
            @Override // java.util.function.DoubleConsumer
            public final void accept(double d) {
                DoubleConsumer$CC.$private$lambda$andThen$0(DoubleConsumer.this, after, d);
            }

            @Override // java.util.function.DoubleConsumer
            public /* sintético */ DoubleConsumer andThen(DoubleConsumer doubleConsumer) {
                return DoubleConsumer$CC.$default$andThen(this, doubleConsumer);
            }
        };
    }

    public static /* sintético */ void $private$lambda$andThen$0(DoubleConsumer _this, DoubleConsumer after, double t) {
        _this.accept(t);
        after.accept(t);
    }
}
