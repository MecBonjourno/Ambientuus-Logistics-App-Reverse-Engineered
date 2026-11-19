package j$.util;

import j$.util.Spliterators;

/* carregado de: classes15.dex */
public interface SortedSet<E> extends Set<E> {

    /* compiled from: D8$$SyntheticClass */
    /* renomeado de: j$.util.SortedSet$-EL, motivo: nome de classe inválido */
    public final /* sintético */ class EL {
        public static /* sintético */ Spliterator spliterator(java.util.SortedSet sortedSet) {
            return sortedSet instanceof SortedSet ? ((SortedSet) sortedSet).spliterator() : CC.$default$spliterator(sortedSet);
        }
    }

    @Override // j$.util.Set, j$.util.Collection, java.lang.Iterable, j$.lang.Iterable
    Spliterator<E> spliterator();

    /* renomeado de: j$.util.SortedSet$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        public static Spliterator $default$spliterator(final java.util.SortedSet _this) {
            return new Spliterators.IteratorSpliterator<E>(_this, 21) { // da classe: j$.util.SortedSet.1
                @Override // j$.util.Spliterators.IteratorSpliterator, j$.util.Spliterator
                public java.util.Comparator<? super E> getComparator() {
                    return _this.comparator();
                }
            };
        }
    }
}
