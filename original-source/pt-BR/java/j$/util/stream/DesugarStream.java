package j$.util.stream;

import j$.util.Objects;
import j$.util.Spliterators;
import java.util.function.Consumer;
import java.util.function.Predicate;
import java.util.function.UnaryOperator;

/* carregado de: classes15.dex */
public final class DesugarStream {
    private DesugarStream() {
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<T> */
    public static <T> Stream<T> iterate(final T seed, final Predicate<? super T> hasNext, final UnaryOperator<T> next) {
        Objects.requireNonNull(next);
        Objects.requireNonNull(hasNext);
        return StreamSupport.stream(new Spliterators.AbstractSpliterator<T>(Long.MAX_VALUE, 1040) { // da classe: j$.util.stream.DesugarStream.1
            boolean finished;
            T prev;
            boolean started;

            @Override // j$.util.Spliterator
            public boolean tryAdvance(Consumer<? super T> consumer) {
                T t;
                Objects.requireNonNull(consumer);
                if (this.finished) {
                    return false;
                }
                if (this.started) {
                    t = next.apply(this.prev);
                } else {
                    t = (T) seed;
                    this.started = true;
                }
                if (!hasNext.test(t)) {
                    this.prev = null;
                    this.finished = true;
                    return false;
                }
                this.prev = t;
                consumer.accept(t);
                return true;
            }

            /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
            @Override // j$.util.Spliterators.AbstractSpliterator, j$.util.Spliterator
            public void forEachRemaining(Consumer<? super T> action) {
                Objects.requireNonNull(action);
                if (this.finished) {
                    return;
                }
                this.finished = true;
                Object apply = this.started ? next.apply(this.prev) : seed;
                this.prev = null;
                while (hasNext.test(apply)) {
                    action.accept(apply);
                    apply = next.apply(apply);
                }
            }
        }, false);
    }
}
