package j$.lang;

import j$.util.Collection;
import j$.util.DesugarLinkedHashSet;
import j$.util.List;
import j$.util.Objects;
import j$.util.Set;
import j$.util.SortedSet;
import j$.util.Spliterator;
import j$.util.Spliterators;
import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.SortedSet;
import java.util.function.Consumer;

/* carregado de: classes15.dex */
public interface Iterable<T> {

    /* compiled from: D8$$SyntheticClass */
    /* renomeado de: j$.lang.Iterable$-EL, motivo: nome de classe inválido */
    public final /* sintético */ class EL {
        public static /* sintético */ void forEach(java.lang.Iterable iterable, Consumer consumer) {
            if (iterable instanceof Iterable) {
                ((Iterable) iterable).forEach(consumer);
            } else if (iterable instanceof Collection) {
                Collection.CC.$default$forEach((java.util.Collection) iterable, consumer);
            } else {
                CC.$default$forEach(iterable, consumer);
            }
        }

        public static /* sintético */ Spliterator spliterator(java.lang.Iterable iterable) {
            return iterable instanceof Iterable ? ((Iterable) iterable).spliterator() : iterable instanceof LinkedHashSet ? DesugarLinkedHashSet.spliterator((LinkedHashSet) iterable) : iterable instanceof SortedSet ? SortedSet.CC.$default$spliterator((java.util.SortedSet) iterable) : iterable instanceof Set ? Set.CC.$default$spliterator((java.util.Set) iterable) : iterable instanceof List ? List.CC.$default$spliterator((java.util.List) iterable) : iterable instanceof java.util.Collection ? Collection.CC.$default$spliterator((java.util.Collection) iterable) : CC.$default$spliterator(iterable);
        }
    }

    void forEach(Consumer<? super T> consumer);

    Spliterator<T> spliterator();

    /* renomeado de: j$.lang.Iterable$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        public static void $default$forEach(java.lang.Iterable _this, Consumer consumer) {
            Objects.requireNonNull(consumer);
            for (T t : _this) {
                consumer.accept(t);
            }
        }

        public static Spliterator $default$spliterator(java.lang.Iterable _this) {
            return Spliterators.spliteratorUnknownSize(_this.iterator(), 0);
        }
    }
}
