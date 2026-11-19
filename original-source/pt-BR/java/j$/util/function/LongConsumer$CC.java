package j$.util.function;

import j$.util.Objects;
import java.util.function.LongConsumer;

/* renomeado de: j$.util.function.LongConsumer$-CC, motivo: nome de classe inválido */
/* carregado de: classes15.dex */
public final /* sintético */ class LongConsumer$CC {
    public static LongConsumer $default$andThen(final LongConsumer _this, final LongConsumer after) {
        Objects.requireNonNull(after);
        return new LongConsumer() { // da classe: j$.util.function.LongConsumer$$ExternalSyntheticLambda0
            @Override // java.util.function.LongConsumer
            public final void accept(long j) {
                LongConsumer$CC.$private$lambda$andThen$0(LongConsumer.this, after, j);
            }

            @Override // java.util.function.LongConsumer
            public /* sintético */ LongConsumer andThen(LongConsumer longConsumer) {
                return LongConsumer$CC.$default$andThen(this, longConsumer);
            }
        };
    }

    public static /* sintético */ void $private$lambda$andThen$0(LongConsumer _this, LongConsumer after, long t) {
        _this.accept(t);
        after.accept(t);
    }
}
