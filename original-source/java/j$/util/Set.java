package j$.util;

import j$.util.ImmutableCollections;
import j$.util.SortedSet;
import java.util.HashSet;
import java.util.LinkedHashSet;

/* loaded from: classes15.dex */
public interface Set<E> extends Collection<E> {

    /* compiled from: D8$$SyntheticClass */
    /* renamed from: j$.util.Set$-EL, reason: invalid class name */
    public final /* synthetic */ class EL {
        public static /* synthetic */ Spliterator spliterator(java.util.Set set) {
            return set instanceof Set ? ((Set) set).spliterator() : set instanceof LinkedHashSet ? DesugarLinkedHashSet.spliterator((LinkedHashSet) set) : set instanceof java.util.SortedSet ? SortedSet.CC.$default$spliterator((java.util.SortedSet) set) : CC.$default$spliterator(set);
        }
    }

    @Override // j$.util.Collection, java.lang.Iterable, j$.lang.Iterable
    Spliterator<E> spliterator();

    /* renamed from: j$.util.Set$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        public static Spliterator $default$spliterator(java.util.Set _this) {
            return Spliterators.spliterator(_this, 1);
        }

        public static <E> java.util.Set<E> of() {
            return ImmutableCollections.emptySet();
        }

        public static <E> java.util.Set<E> of(E e1) {
            return new ImmutableCollections.Set12(e1);
        }

        public static <E> java.util.Set<E> of(E e1, E e2) {
            return new ImmutableCollections.Set12(e1, e2);
        }

        public static <E> java.util.Set<E> of(E e1, E e2, E e3) {
            return new ImmutableCollections.SetN(e1, e2, e3);
        }

        public static <E> java.util.Set<E> of(E e1, E e2, E e3, E e4) {
            return new ImmutableCollections.SetN(e1, e2, e3, e4);
        }

        public static <E> java.util.Set<E> of(E e1, E e2, E e3, E e4, E e5) {
            return new ImmutableCollections.SetN(e1, e2, e3, e4, e5);
        }

        public static <E> java.util.Set<E> of(E e1, E e2, E e3, E e4, E e5, E e6) {
            return new ImmutableCollections.SetN(e1, e2, e3, e4, e5, e6);
        }

        public static <E> java.util.Set<E> of(E e1, E e2, E e3, E e4, E e5, E e6, E e7) {
            return new ImmutableCollections.SetN(e1, e2, e3, e4, e5, e6, e7);
        }

        public static <E> java.util.Set<E> of(E e1, E e2, E e3, E e4, E e5, E e6, E e7, E e8) {
            return new ImmutableCollections.SetN(e1, e2, e3, e4, e5, e6, e7, e8);
        }

        public static <E> java.util.Set<E> of(E e1, E e2, E e3, E e4, E e5, E e6, E e7, E e8, E e9) {
            return new ImmutableCollections.SetN(e1, e2, e3, e4, e5, e6, e7, e8, e9);
        }

        public static <E> java.util.Set<E> of(E e1, E e2, E e3, E e4, E e5, E e6, E e7, E e8, E e9, E e10) {
            return new ImmutableCollections.SetN(e1, e2, e3, e4, e5, e6, e7, e8, e9, e10);
        }

        public static <E> java.util.Set<E> of(E... elements) {
            switch (elements.length) {
                case 0:
                    return ImmutableCollections.emptySet();
                case 1:
                    return new ImmutableCollections.Set12(elements[0]);
                case 2:
                    return new ImmutableCollections.Set12(elements[0], elements[1]);
                default:
                    return new ImmutableCollections.SetN(elements);
            }
        }

        public static <E> java.util.Set<E> copyOf(java.util.Collection<? extends E> coll) {
            if (coll instanceof ImmutableCollections.AbstractImmutableSet) {
                return (java.util.Set) coll;
            }
            return CollSer$$ExternalSyntheticBackport0.m(new HashSet(coll).toArray());
        }
    }
}
