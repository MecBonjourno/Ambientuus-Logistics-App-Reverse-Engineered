package j$.util;

import j$.util.Spliterators;

/* loaded from: classes15.dex */
public interface SortedSet<E> extends Set<E> {

    /* compiled from: D8$$SyntheticClass */
    /* renamed from: j$.util.SortedSet$-EL, reason: invalid class name */
    public final /* synthetic */ class EL {
        public static /* synthetic */ Spliterator spliterator(java.util.SortedSet sortedSet) {
            return sortedSet instanceof SortedSet ? ((SortedSet) sortedSet).spliterator() : CC.$default$spliterator(sortedSet);
        }
    }

    @Override // j$.util.Set, j$.util.Collection, java.lang.Iterable, j$.lang.Iterable
    Spliterator<E> spliterator();

    /* renamed from: j$.util.SortedSet$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        public static Spliterator $default$spliterator(final java.util.SortedSet _this) {
            return new Spliterators.IteratorSpliterator<E>(_this, 21) { // from class: j$.util.SortedSet.1
                @Override // j$.util.Spliterators.IteratorSpliterator, j$.util.Spliterator
                public java.util.Comparator<? super E> getComparator() {
                    return _this.comparator();
                }
            };
        }
    }
}
