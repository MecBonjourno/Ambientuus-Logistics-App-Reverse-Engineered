package j$.util;

import java.util.function.Consumer;

/* carregado de: classes15.dex */
public interface Iterator<E> {

    /* compiled from: D8$$SyntheticClass */
    /* renomeado de: j$.util.Iterator$-EL, motivo: nome de classe inválido */
    public final /* sintético */ class EL {
        public static /* sintético */ void forEachRemaining(java.util.Iterator it, Consumer consumer) {
            if (it instanceof Iterator) {
                ((Iterator) it).forEachRemaining(consumer);
            } else {
                CC.$default$forEachRemaining(it, consumer);
            }
        }
    }

    void forEachRemaining(Consumer<? super E> consumer);

    /* renomeado de: j$.util.Iterator$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        public static void $default$remove(java.util.Iterator _this) {
            throw new UnsupportedOperationException("remove");
        }

        public static void $default$forEachRemaining(java.util.Iterator _this, Consumer consumer) {
            Objects.requireNonNull(consumer);
            while (_this.hasNext()) {
                consumer.accept(_this.next());
            }
        }
    }
}
