package j$.util.function;

import j$.util.Objects;
import java.util.function.BiConsumer;

/* renomeado de: j$.util.function.BiConsumer$-CC, motivo: nome de classe inválido */
/* carregado de: classes15.dex */
public final /* sintético */ class BiConsumer$CC {
    public static BiConsumer $default$andThen(final BiConsumer _this, final BiConsumer biConsumer) {
        Objects.requireNonNull(biConsumer);
        return new BiConsumer() { // da classe: j$.util.function.BiConsumer$$ExternalSyntheticLambda0
            @Override // java.util.function.BiConsumer
            public final void accept(Object obj, Object obj2) {
                BiConsumer$CC.$private$lambda$andThen$0(BiConsumer.this, biConsumer, obj, obj2);
            }

            @Override // java.util.function.BiConsumer
            public /* sintético */ BiConsumer andThen(BiConsumer biConsumer2) {
                return BiConsumer$CC.$default$andThen(this, biConsumer2);
            }
        };
    }

    public static /* sintético */ void $private$lambda$andThen$0(BiConsumer _this, BiConsumer after, Object l, Object r) {
        _this.accept(l, r);
        after.accept(l, r);
    }
}
