package j$.util;

import j$.time.Duration$DurationUnits$$ExternalSyntheticBackport0;
import j$.time.temporal.WeekFields$ComputedDayOfField$$ExternalSyntheticBackport0;
import j$.util.Collection;
import j$.util.List;
import j$.util.Map;
import j$.util.Set;
import j$.util.Spliterator;
import j$.util.stream.Stream;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.util.AbstractCollection;
import java.util.AbstractMap;
import java.util.AbstractSet;
import java.util.ListIterator;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.RandomAccess;
import java.util.function.BiConsumer;
import java.util.function.BiFunction;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.IntFunction;
import java.util.function.Predicate;
import java.util.function.UnaryOperator;

/* carregado de: classes15.dex */
class ImmutableCollections {
    static final int EXPAND_FACTOR = 2;
    static final int SALT;

    static {
        long nt = System.nanoTime();
        SALT = (int) ((nt >>> 32) ^ nt);
    }

    private ImmutableCollections() {
    }

    static UnsupportedOperationException uoe() {
        return new UnsupportedOperationException();
    }

    static abstract class AbstractImmutableCollection<E> extends AbstractCollection<E> implements Collection<E> {
        @Override // java.lang.Iterable, j$.util.Collection, j$.lang.Iterable
        public /* sintético */ void forEach(Consumer consumer) {
            Collection.CC.$default$forEach(this, consumer);
        }

        @Override // java.util.Collection, j$.util.Collection
        public /* sintético */ Stream parallelStream() {
            return Collection.CC.$default$parallelStream(this);
        }

        @Override // java.util.Collection
        public /* sintético */ java.util.stream.Stream parallelStream() {
            return Stream.Wrapper.convert(parallelStream());
        }

        @Override // java.util.Collection, java.lang.Iterable, j$.util.Collection, j$.lang.Iterable
        public /* sintético */ Spliterator spliterator() {
            return Collection.CC.$default$spliterator(this);
        }

        @Override // java.util.Collection, java.lang.Iterable
        public /* sintético */ java.util.Spliterator spliterator() {
            return Spliterator.Wrapper.convert(spliterator());
        }

        @Override // java.util.Collection, j$.util.Collection
        public /* sintético */ Stream stream() {
            return Collection.CC.$default$stream(this);
        }

        @Override // java.util.Collection
        public /* sintético */ java.util.stream.Stream stream() {
            return Stream.Wrapper.convert(stream());
        }

        @Override // java.util.Collection, j$.util.Collection
        public /* sintético */ Object[] toArray(IntFunction intFunction) {
            return Collection.CC.$default$toArray(this, intFunction);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableCollection != java.util.ImmutableCollections$AbstractImmutableCollection<E> */
        AbstractImmutableCollection() {
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableCollection != java.util.ImmutableCollections$AbstractImmutableCollection<E> */
        @Override // java.util.AbstractCollection, java.util.Collection
        public boolean add(E e) {
            throw ImmutableCollections.uoe();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableCollection != java.util.ImmutableCollections$AbstractImmutableCollection<E> */
        @Override // java.util.AbstractCollection, java.util.Collection
        public boolean addAll(java.util.Collection<? extends E> c) {
            throw ImmutableCollections.uoe();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableCollection != java.util.ImmutableCollections$AbstractImmutableCollection<E> */
        @Override // java.util.AbstractCollection, java.util.Collection
        public void clear() {
            throw ImmutableCollections.uoe();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableCollection != java.util.ImmutableCollections$AbstractImmutableCollection<E> */
        @Override // java.util.AbstractCollection, java.util.Collection
        public boolean remove(Object o) {
            throw ImmutableCollections.uoe();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableCollection != java.util.ImmutableCollections$AbstractImmutableCollection<E> */
        @Override // java.util.AbstractCollection, java.util.Collection
        public boolean removeAll(java.util.Collection<?> c) {
            throw ImmutableCollections.uoe();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableCollection != java.util.ImmutableCollections$AbstractImmutableCollection<E> */
        @Override // java.util.Collection, j$.util.Collection
        public boolean removeIf(Predicate<? super E> filter) {
            throw ImmutableCollections.uoe();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableCollection != java.util.ImmutableCollections$AbstractImmutableCollection<E> */
        @Override // java.util.AbstractCollection, java.util.Collection
        public boolean retainAll(java.util.Collection<?> c) {
            throw ImmutableCollections.uoe();
        }
    }

    static <E> java.util.List<E> listCopy(java.util.Collection<? extends E> coll) {
        if ((coll instanceof AbstractImmutableList) && coll.getClass() != SubList.class) {
            return (java.util.List) coll;
        }
        return Duration$DurationUnits$$ExternalSyntheticBackport0.m(coll.toArray());
    }

    static <E> java.util.List<E> emptyList() {
        return (java.util.List<E>) ListN.EMPTY_LIST;
    }

    static abstract class AbstractImmutableList<E> extends AbstractImmutableCollection<E> implements java.util.List<E>, RandomAccess, List<E> {
        @Override // j$.util.ImmutableCollections.AbstractImmutableCollection, java.util.Collection, java.lang.Iterable, j$.util.Collection, j$.lang.Iterable
        public /* sintético */ Spliterator spliterator() {
            return List.CC.$default$spliterator(this);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableList != java.util.ImmutableCollections$AbstractImmutableList<E> */
        AbstractImmutableList() {
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableList != java.util.ImmutableCollections$AbstractImmutableList<E> */
        @Override // java.util.List
        public void add(int index, E element) {
            throw ImmutableCollections.uoe();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableList != java.util.ImmutableCollections$AbstractImmutableList<E> */
        @Override // java.util.List
        public boolean addAll(int index, java.util.Collection<? extends E> c) {
            throw ImmutableCollections.uoe();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableList != java.util.ImmutableCollections$AbstractImmutableList<E> */
        @Override // java.util.List
        public E remove(int index) {
            throw ImmutableCollections.uoe();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableList != java.util.ImmutableCollections$AbstractImmutableList<E> */
        @Override // java.util.List, j$.util.List
        public void replaceAll(UnaryOperator<E> operator) {
            throw ImmutableCollections.uoe();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableList != java.util.ImmutableCollections$AbstractImmutableList<E> */
        @Override // java.util.List
        public E set(int index, E element) {
            throw ImmutableCollections.uoe();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableList != java.util.ImmutableCollections$AbstractImmutableList<E> */
        @Override // java.util.List, j$.util.List
        public void sort(java.util.Comparator<? super E> c) {
            throw ImmutableCollections.uoe();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableList != java.util.ImmutableCollections$AbstractImmutableList<E> */
        @Override // java.util.List
        public java.util.List<E> subList(int fromIndex, int toIndex) {
            int size = size();
            subListRangeCheck(fromIndex, toIndex, size);
            return SubList.fromList(this, fromIndex, toIndex);
        }

        static void subListRangeCheck(int fromIndex, int toIndex, int size) {
            if (fromIndex < 0) {
                throw new IndexOutOfBoundsException("fromIndex = " + fromIndex);
            }
            if (toIndex > size) {
                throw new IndexOutOfBoundsException("toIndex = " + toIndex);
            }
            if (fromIndex > toIndex) {
                throw new IllegalArgumentException("fromIndex(" + fromIndex + ") > toIndex(" + toIndex + ")");
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableList != java.util.ImmutableCollections$AbstractImmutableList<E> */
        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.List
        public java.util.Iterator<E> iterator() {
            return new ListItr(this, size());
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableList != java.util.ImmutableCollections$AbstractImmutableList<E> */
        @Override // java.util.List
        public ListIterator<E> listIterator() {
            return listIterator(0);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableList != java.util.ImmutableCollections$AbstractImmutableList<E> */
        @Override // java.util.List
        public ListIterator<E> listIterator(int index) {
            int size = size();
            if (index < 0 || index > size) {
                throw outOfBounds(index);
            }
            return new ListItr(this, size, index);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableList != java.util.ImmutableCollections$AbstractImmutableList<E> */
        @Override // java.util.Collection, java.util.List
        public boolean equals(Object o) {
            if (o == this) {
                return true;
            }
            if (!(o instanceof java.util.List)) {
                return false;
            }
            java.util.Iterator<E> it = ((java.util.List) o).iterator();
            int s = size();
            for (int i = 0; i < s; i++) {
                if (!it.hasNext() || !get(i).equals(it.next())) {
                    return false;
                }
            }
            return true ^ it.hasNext();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableList != java.util.ImmutableCollections$AbstractImmutableList<E> */
        @Override // java.util.List
        public int indexOf(Object o) {
            Objects.requireNonNull(o);
            int s = size();
            for (int i = 0; i < s; i++) {
                if (o.equals(get(i))) {
                    return i;
                }
            }
            return -1;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableList != java.util.ImmutableCollections$AbstractImmutableList<E> */
        @Override // java.util.List
        public int lastIndexOf(Object o) {
            Objects.requireNonNull(o);
            for (int i = size() - 1; i >= 0; i--) {
                if (o.equals(get(i))) {
                    return i;
                }
            }
            return -1;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableList != java.util.ImmutableCollections$AbstractImmutableList<E> */
        @Override // java.util.Collection, java.util.List
        public int hashCode() {
            int hash = 1;
            int s = size();
            for (int i = 0; i < s; i++) {
                hash = (hash * 31) + get(i).hashCode();
            }
            return hash;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableList != java.util.ImmutableCollections$AbstractImmutableList<E> */
        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public boolean contains(Object o) {
            return indexOf(o) >= 0;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableList != java.util.ImmutableCollections$AbstractImmutableList<E> */
        IndexOutOfBoundsException outOfBounds(int index) {
            return new IndexOutOfBoundsException("Index: " + index + " Size: " + size());
        }
    }

    static final class ListItr<E> implements ListIterator<E> {
        private int cursor;
        private final boolean isListIterator;
        private final java.util.List<E> list;
        private final int size;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$ListItr != java.util.ImmutableCollections$ListItr<E> */
        ListItr(java.util.List<E> list, int size) {
            this.list = list;
            this.size = size;
            this.cursor = 0;
            this.isListIterator = false;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$ListItr != java.util.ImmutableCollections$ListItr<E> */
        ListItr(java.util.List<E> list, int size, int index) {
            this.list = list;
            this.size = size;
            this.cursor = index;
            this.isListIterator = true;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$ListItr != java.util.ImmutableCollections$ListItr<E> */
        @Override // java.util.ListIterator, java.util.Iterator
        public boolean hasNext() {
            return this.cursor != this.size;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$ListItr != java.util.ImmutableCollections$ListItr<E> */
        @Override // java.util.ListIterator, java.util.Iterator
        public E next() {
            try {
                int i = this.cursor;
                E next = this.list.get(i);
                this.cursor = i + 1;
                return next;
            } catch (IndexOutOfBoundsException e) {
                throw new NoSuchElementException();
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$ListItr != java.util.ImmutableCollections$ListItr<E> */
        @Override // java.util.ListIterator, java.util.Iterator
        public void remove() {
            throw ImmutableCollections.uoe();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$ListItr != java.util.ImmutableCollections$ListItr<E> */
        @Override // java.util.ListIterator
        public boolean hasPrevious() {
            if (this.isListIterator) {
                return this.cursor != 0;
            }
            throw ImmutableCollections.uoe();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$ListItr != java.util.ImmutableCollections$ListItr<E> */
        @Override // java.util.ListIterator
        public E previous() {
            if (!this.isListIterator) {
                throw ImmutableCollections.uoe();
            }
            try {
                int i = this.cursor - 1;
                E previous = this.list.get(i);
                this.cursor = i;
                return previous;
            } catch (IndexOutOfBoundsException e) {
                throw new NoSuchElementException();
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$ListItr != java.util.ImmutableCollections$ListItr<E> */
        @Override // java.util.ListIterator
        public int nextIndex() {
            if (!this.isListIterator) {
                throw ImmutableCollections.uoe();
            }
            return this.cursor;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$ListItr != java.util.ImmutableCollections$ListItr<E> */
        @Override // java.util.ListIterator
        public int previousIndex() {
            if (!this.isListIterator) {
                throw ImmutableCollections.uoe();
            }
            return this.cursor - 1;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$ListItr != java.util.ImmutableCollections$ListItr<E> */
        @Override // java.util.ListIterator
        public void set(E e) {
            throw ImmutableCollections.uoe();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$ListItr != java.util.ImmutableCollections$ListItr<E> */
        @Override // java.util.ListIterator
        public void add(E e) {
            throw ImmutableCollections.uoe();
        }
    }

    static final class SubList<E> extends AbstractImmutableList<E> implements RandomAccess {
        private final int offset;
        private final java.util.List<E> root;
        private final int size;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$SubList != java.util.ImmutableCollections$SubList<E> */
        private SubList(java.util.List<E> root, int offset, int size) {
            this.root = root;
            this.offset = offset;
            this.size = size;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$SubList != java.util.ImmutableCollections$SubList<E> */
        static <E> SubList<E> fromSubList(SubList<E> subList, int fromIndex, int toIndex) {
            return new SubList<>(((SubList) subList).root, ((SubList) subList).offset + fromIndex, toIndex - fromIndex);
        }

        static <E> SubList<E> fromList(java.util.List<E> list, int fromIndex, int toIndex) {
            return new SubList<>(list, fromIndex, toIndex - fromIndex);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$SubList != java.util.ImmutableCollections$SubList<E> */
        @Override // java.util.List
        public E get(int index) {
            Objects.checkIndex(index, this.size);
            return this.root.get(this.offset + index);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$SubList != java.util.ImmutableCollections$SubList<E> */
        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public int size() {
            return this.size;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$SubList != java.util.ImmutableCollections$SubList<E> */
        @Override // j$.util.ImmutableCollections.AbstractImmutableList, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.List
        public java.util.Iterator<E> iterator() {
            return new ListItr(this, size());
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$SubList != java.util.ImmutableCollections$SubList<E> */
        @Override // j$.util.ImmutableCollections.AbstractImmutableList, java.util.List
        public ListIterator<E> listIterator(int index) {
            rangeCheck(index);
            return new ListItr(this, size(), index);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$SubList != java.util.ImmutableCollections$SubList<E> */
        @Override // j$.util.ImmutableCollections.AbstractImmutableList, java.util.List
        public java.util.List<E> subList(int fromIndex, int toIndex) {
            subListRangeCheck(fromIndex, toIndex, this.size);
            return fromSubList(this, fromIndex, toIndex);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$SubList != java.util.ImmutableCollections$SubList<E> */
        private void rangeCheck(int index) {
            if (index < 0 || index > this.size) {
                throw outOfBounds(index);
            }
        }
    }

    static final class List12<E> extends AbstractImmutableList<E> implements Serializable {
        private final E e0;
        private final E e1;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$List12 != java.util.ImmutableCollections$List12<E> */
        List12(E e) {
            this.e0 = (E) Objects.requireNonNull(e);
            this.e1 = null;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$List12 != java.util.ImmutableCollections$List12<E> */
        List12(E e, E e2) {
            this.e0 = (E) Objects.requireNonNull(e);
            this.e1 = (E) Objects.requireNonNull(e2);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$List12 != java.util.ImmutableCollections$List12<E> */
        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public int size() {
            return this.e1 != null ? 2 : 1;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$List12 != java.util.ImmutableCollections$List12<E> */
        @Override // java.util.List
        public E get(int index) {
            if (index == 0) {
                return this.e0;
            }
            if (index == 1 && this.e1 != null) {
                return this.e1;
            }
            throw outOfBounds(index);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$List12 != java.util.ImmutableCollections$List12<E> */
        private void readObject(ObjectInputStream in) {
            throw new InvalidObjectException("not serial proxy");
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$List12 != java.util.ImmutableCollections$List12<E> */
        private Object writeReplace() {
            if (this.e1 == null) {
                return new CollSer(1, this.e0);
            }
            return new CollSer(1, this.e0, this.e1);
        }
    }

    static final class ListN<E> extends AbstractImmutableList<E> implements Serializable {
        static java.util.List<?> EMPTY_LIST;
        private final E[] elements;

        static {
            if (EMPTY_LIST == null) {
                EMPTY_LIST = new ListN(new Object[0]);
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$ListN != java.util.ImmutableCollections$ListN<E> */
        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        ListN(E... eArr) {
            E[] eArr2 = (E[]) new Object[eArr.length];
            for (int i = 0; i < eArr.length; i++) {
                eArr2[i] = Objects.requireNonNull(eArr[i]);
            }
            this.elements = eArr2;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$ListN != java.util.ImmutableCollections$ListN<E> */
        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public boolean isEmpty() {
            return size() == 0;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$ListN != java.util.ImmutableCollections$ListN<E> */
        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public int size() {
            return this.elements.length;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$ListN != java.util.ImmutableCollections$ListN<E> */
        @Override // java.util.List
        public E get(int index) {
            return this.elements[index];
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$ListN != java.util.ImmutableCollections$ListN<E> */
        private void readObject(ObjectInputStream in) {
            throw new InvalidObjectException("not serial proxy");
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$ListN != java.util.ImmutableCollections$ListN<E> */
        private Object writeReplace() {
            return new CollSer(1, this.elements);
        }
    }

    static abstract class AbstractImmutableSet<E> extends AbstractImmutableCollection<E> implements java.util.Set<E>, Set<E> {
        @Override // java.util.Collection, java.util.Set
        public abstract int hashCode();

        @Override // j$.util.ImmutableCollections.AbstractImmutableCollection, java.util.Collection, java.lang.Iterable, j$.util.Collection, j$.lang.Iterable
        public /* sintético */ Spliterator spliterator() {
            return Set.CC.$default$spliterator(this);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableSet != java.util.ImmutableCollections$AbstractImmutableSet<E> */
        AbstractImmutableSet() {
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableSet != java.util.ImmutableCollections$AbstractImmutableSet<E> */
        @Override // java.util.Collection, java.util.Set
        public boolean equals(Object o) {
            if (o == this) {
                return true;
            }
            if (!(o instanceof java.util.Set)) {
                return false;
            }
            java.util.Collection<?> c = (java.util.Collection) o;
            if (c.size() != size()) {
                return false;
            }
            for (Object e : c) {
                if (e == null || !contains(e)) {
                    return false;
                }
            }
            return true;
        }
    }

    static <E> java.util.Set<E> emptySet() {
        return (java.util.Set<E>) SetN.EMPTY_SET;
    }

    static final class Set12<E> extends AbstractImmutableSet<E> implements Serializable {
        final E e0;
        final E e1;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$Set12 != java.util.ImmutableCollections$Set12<E> */
        Set12(E e) {
            this.e0 = (E) Objects.requireNonNull(e);
            this.e1 = null;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$Set12 != java.util.ImmutableCollections$Set12<E> */
        Set12(E e0, E e1) {
            if (e0.equals(Objects.requireNonNull(e1))) {
                throw new IllegalArgumentException("duplicate element: " + e0);
            }
            this.e0 = e0;
            this.e1 = e1;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$Set12 != java.util.ImmutableCollections$Set12<E> */
        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public int size() {
            return this.e1 == null ? 1 : 2;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$Set12 != java.util.ImmutableCollections$Set12<E> */
        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean contains(Object o) {
            return o.equals(this.e0) || o.equals(this.e1);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$Set12 != java.util.ImmutableCollections$Set12<E> */
        @Override // j$.util.ImmutableCollections.AbstractImmutableSet, java.util.Collection, java.util.Set
        public int hashCode() {
            return this.e0.hashCode() + (this.e1 == null ? 0 : this.e1.hashCode());
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$Set12 != java.util.ImmutableCollections$Set12<E> */
        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
        public java.util.Iterator<E> iterator() {
            return new java.util.Iterator<E>() { // da classe: j$.util.ImmutableCollections.Set12.1
                private int idx;

                {
                    this.idx = Set12.this.size();
                }

                @Override // java.util.Iterator
                public boolean hasNext() {
                    return this.idx > 0;
                }

                @Override // java.util.Iterator
                public E next() {
                    if (this.idx == 1) {
                        this.idx = 0;
                        return (ImmutableCollections.SALT >= 0 || Set12.this.e1 == null) ? Set12.this.e0 : Set12.this.e1;
                    }
                    if (this.idx == 2) {
                        this.idx = 1;
                        return ImmutableCollections.SALT >= 0 ? Set12.this.e1 : Set12.this.e0;
                    }
                    throw new NoSuchElementException();
                }
            };
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$Set12 != java.util.ImmutableCollections$Set12<E> */
        private void readObject(ObjectInputStream in) {
            throw new InvalidObjectException("not serial proxy");
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$Set12 != java.util.ImmutableCollections$Set12<E> */
        private Object writeReplace() {
            if (this.e1 == null) {
                return new CollSer(2, this.e0);
            }
            return new CollSer(2, this.e0, this.e1);
        }
    }

    static final class SetN<E> extends AbstractImmutableSet<E> implements Serializable {
        static java.util.Set<?> EMPTY_SET;
        final E[] elements;
        final int size;

        static {
            if (EMPTY_SET == null) {
                EMPTY_SET = new SetN(new Object[0]);
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$SetN != java.util.ImmutableCollections$SetN<E> */
        SetN(E... eArr) {
            this.size = eArr.length;
            this.elements = (E[]) new Object[eArr.length * 2];
            for (E e : eArr) {
                int probe = probe(e);
                if (probe >= 0) {
                    throw new IllegalArgumentException("duplicate element: " + e);
                }
                this.elements[-(probe + 1)] = e;
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$SetN != java.util.ImmutableCollections$SetN<E> */
        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public int size() {
            return this.size;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$SetN != java.util.ImmutableCollections$SetN<E> */
        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean contains(Object o) {
            Objects.requireNonNull(o);
            return this.size > 0 && probe(o) >= 0;
        }

        private final class SetNIterator implements java.util.Iterator<E> {
            private int idx;
            private int remaining;

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$SetN$SetNIterator != java.util.ImmutableCollections$SetN<E>$SetNIterator */
            SetNIterator() {
                this.remaining = SetN.this.size();
                if (this.remaining > 0) {
                    this.idx = WeekFields$ComputedDayOfField$$ExternalSyntheticBackport0.m(ImmutableCollections.SALT, SetN.this.elements.length);
                }
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$SetN$SetNIterator != java.util.ImmutableCollections$SetN<E>$SetNIterator */
            @Override // java.util.Iterator
            public boolean hasNext() {
                return this.remaining > 0;
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$SetN$SetNIterator != java.util.ImmutableCollections$SetN<E>$SetNIterator */
            private int nextIndex() {
                int idx;
                int idx2 = this.idx;
                if (ImmutableCollections.SALT >= 0) {
                    idx = idx2 + 1;
                    if (idx >= SetN.this.elements.length) {
                        idx = 0;
                    }
                } else {
                    idx = idx2 - 1;
                    if (idx < 0) {
                        idx = SetN.this.elements.length - 1;
                    }
                }
                this.idx = idx;
                return idx;
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$SetN$SetNIterator != java.util.ImmutableCollections$SetN<E>$SetNIterator */
            @Override // java.util.Iterator
            public E next() {
                E element;
                if (hasNext()) {
                    do {
                        element = SetN.this.elements[nextIndex()];
                    } while (element == null);
                    this.remaining--;
                    return element;
                }
                throw new NoSuchElementException();
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$SetN != java.util.ImmutableCollections$SetN<E> */
        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
        public java.util.Iterator<E> iterator() {
            return new SetNIterator();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$SetN != java.util.ImmutableCollections$SetN<E> */
        @Override // j$.util.ImmutableCollections.AbstractImmutableSet, java.util.Collection, java.util.Set
        public int hashCode() {
            int h = 0;
            for (E e : this.elements) {
                if (e != null) {
                    h += e.hashCode();
                }
            }
            return h;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$SetN != java.util.ImmutableCollections$SetN<E> */
        private int probe(Object pe) {
            int idx = WeekFields$ComputedDayOfField$$ExternalSyntheticBackport0.m(pe.hashCode(), this.elements.length);
            while (true) {
                E ee = this.elements[idx];
                if (ee == null) {
                    return (-idx) - 1;
                }
                if (pe.equals(ee)) {
                    return idx;
                }
                idx++;
                if (idx == this.elements.length) {
                    idx = 0;
                }
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$SetN != java.util.ImmutableCollections$SetN<E> */
        private void readObject(ObjectInputStream in) {
            throw new InvalidObjectException("not serial proxy");
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$SetN != java.util.ImmutableCollections$SetN<E> */
        private Object writeReplace() {
            Object[] array = new Object[this.size];
            int dest = 0;
            for (Object o : this.elements) {
                if (o != null) {
                    array[dest] = o;
                    dest++;
                }
            }
            return new CollSer(2, array);
        }
    }

    static <K, V> java.util.Map<K, V> emptyMap() {
        return (java.util.Map<K, V>) MapN.EMPTY_MAP;
    }

    static abstract class AbstractImmutableMap<K, V> extends AbstractMap<K, V> implements Serializable, Map<K, V> {
        @Override // java.util.Map, j$.util.Map
        public /* sintético */ void forEach(BiConsumer biConsumer) {
            Map.CC.$default$forEach(this, biConsumer);
        }

        @Override // java.util.Map, j$.util.Map
        public /* sintético */ Object getOrDefault(Object obj, Object obj2) {
            return Map.CC.$default$getOrDefault(this, obj, obj2);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableMap != java.util.ImmutableCollections$AbstractImmutableMap<K, V> */
        AbstractImmutableMap() {
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableMap != java.util.ImmutableCollections$AbstractImmutableMap<K, V> */
        @Override // java.util.AbstractMap, java.util.Map
        public void clear() {
            throw ImmutableCollections.uoe();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableMap != java.util.ImmutableCollections$AbstractImmutableMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public V compute(K key, BiFunction<? super K, ? super V, ? extends V> rf) {
            throw ImmutableCollections.uoe();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableMap != java.util.ImmutableCollections$AbstractImmutableMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public V computeIfAbsent(K key, Function<? super K, ? extends V> mf) {
            throw ImmutableCollections.uoe();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableMap != java.util.ImmutableCollections$AbstractImmutableMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public V computeIfPresent(K key, BiFunction<? super K, ? super V, ? extends V> rf) {
            throw ImmutableCollections.uoe();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableMap != java.util.ImmutableCollections$AbstractImmutableMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public V merge(K key, V value, BiFunction<? super V, ? super V, ? extends V> rf) {
            throw ImmutableCollections.uoe();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableMap != java.util.ImmutableCollections$AbstractImmutableMap<K, V> */
        @Override // java.util.AbstractMap, java.util.Map
        public V put(K key, V value) {
            throw ImmutableCollections.uoe();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableMap != java.util.ImmutableCollections$AbstractImmutableMap<K, V> */
        @Override // java.util.AbstractMap, java.util.Map
        public void putAll(java.util.Map<? extends K, ? extends V> m) {
            throw ImmutableCollections.uoe();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableMap != java.util.ImmutableCollections$AbstractImmutableMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public V putIfAbsent(K key, V value) {
            throw ImmutableCollections.uoe();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableMap != java.util.ImmutableCollections$AbstractImmutableMap<K, V> */
        @Override // java.util.AbstractMap, java.util.Map
        public V remove(Object key) {
            throw ImmutableCollections.uoe();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableMap != java.util.ImmutableCollections$AbstractImmutableMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public boolean remove(Object key, Object value) {
            throw ImmutableCollections.uoe();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableMap != java.util.ImmutableCollections$AbstractImmutableMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public V replace(K key, V value) {
            throw ImmutableCollections.uoe();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableMap != java.util.ImmutableCollections$AbstractImmutableMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public boolean replace(K key, V oldValue, V newValue) {
            throw ImmutableCollections.uoe();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$AbstractImmutableMap != java.util.ImmutableCollections$AbstractImmutableMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public void replaceAll(BiFunction<? super K, ? super V, ? extends V> f) {
            throw ImmutableCollections.uoe();
        }
    }

    static final class Map1<K, V> extends AbstractImmutableMap<K, V> {
        private final K k0;
        private final V v0;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$Map1 != java.util.ImmutableCollections$Map1<K, V> */
        Map1(K k, V v) {
            this.k0 = (K) Objects.requireNonNull(k);
            this.v0 = (V) Objects.requireNonNull(v);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$Map1 != java.util.ImmutableCollections$Map1<K, V> */
        @Override // java.util.AbstractMap, java.util.Map
        public java.util.Set<Map.Entry<K, V>> entrySet() {
            java.util.Set<Map.Entry<K, V>> m;
            m = CollSer$$ExternalSyntheticBackport0.m(new Object[]{new KeyValueHolder(this.k0, this.v0)});
            return m;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$Map1 != java.util.ImmutableCollections$Map1<K, V> */
        @Override // java.util.AbstractMap, java.util.Map
        public V get(Object o) {
            if (o.equals(this.k0)) {
                return this.v0;
            }
            return null;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$Map1 != java.util.ImmutableCollections$Map1<K, V> */
        @Override // java.util.AbstractMap, java.util.Map
        public boolean containsKey(Object o) {
            return o.equals(this.k0);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$Map1 != java.util.ImmutableCollections$Map1<K, V> */
        @Override // java.util.AbstractMap, java.util.Map
        public boolean containsValue(Object o) {
            return o.equals(this.v0);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$Map1 != java.util.ImmutableCollections$Map1<K, V> */
        private void readObject(ObjectInputStream in) {
            throw new InvalidObjectException("not serial proxy");
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$Map1 != java.util.ImmutableCollections$Map1<K, V> */
        private Object writeReplace() {
            return new CollSer(3, this.k0, this.v0);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$Map1 != java.util.ImmutableCollections$Map1<K, V> */
        @Override // java.util.AbstractMap, java.util.Map
        public int hashCode() {
            return this.k0.hashCode() ^ this.v0.hashCode();
        }
    }

    static final class MapN<K, V> extends AbstractImmutableMap<K, V> {
        static java.util.Map<?, ?> EMPTY_MAP;
        final int size;
        final Object[] table;

        static {
            if (EMPTY_MAP == null) {
                EMPTY_MAP = new MapN(new Object[0]);
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$MapN != java.util.ImmutableCollections$MapN<K, V> */
        MapN(Object... input) {
            if ((input.length & 1) != 0) {
                throw new InternalError("length is odd");
            }
            this.size = input.length >> 1;
            int len = input.length * 2;
            this.table = new Object[(len + 1) & (-2)];
            for (int i = 0; i < input.length; i += 2) {
                Object requireNonNull = Objects.requireNonNull(input[i]);
                Object requireNonNull2 = Objects.requireNonNull(input[i + 1]);
                int idx = probe(requireNonNull);
                if (idx >= 0) {
                    throw new IllegalArgumentException("duplicate key: " + requireNonNull);
                }
                int dest = -(idx + 1);
                this.table[dest] = requireNonNull;
                this.table[dest + 1] = requireNonNull2;
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$MapN != java.util.ImmutableCollections$MapN<K, V> */
        @Override // java.util.AbstractMap, java.util.Map
        public boolean containsKey(Object o) {
            Objects.requireNonNull(o);
            return this.size > 0 && probe(o) >= 0;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$MapN != java.util.ImmutableCollections$MapN<K, V> */
        @Override // java.util.AbstractMap, java.util.Map
        public boolean containsValue(Object o) {
            Objects.requireNonNull(o);
            for (int i = 1; i < this.table.length; i += 2) {
                Object v = this.table[i];
                if (v != null && o.equals(v)) {
                    return true;
                }
            }
            return false;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$MapN != java.util.ImmutableCollections$MapN<K, V> */
        @Override // java.util.AbstractMap, java.util.Map
        public int hashCode() {
            int hash = 0;
            for (int i = 0; i < this.table.length; i += 2) {
                Object k = this.table[i];
                if (k != null) {
                    hash += k.hashCode() ^ this.table[i + 1].hashCode();
                }
            }
            return hash;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$MapN != java.util.ImmutableCollections$MapN<K, V> */
        @Override // java.util.AbstractMap, java.util.Map
        public V get(Object obj) {
            if (this.size == 0) {
                Objects.requireNonNull(obj);
                return null;
            }
            int probe = probe(obj);
            if (probe >= 0) {
                return (V) this.table[probe + 1];
            }
            return null;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$MapN != java.util.ImmutableCollections$MapN<K, V> */
        @Override // java.util.AbstractMap, java.util.Map
        public int size() {
            return this.size;
        }

        class MapNIterator implements java.util.Iterator<Map.Entry<K, V>> {
            private int idx;
            private int remaining;

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$MapN$MapNIterator != java.util.ImmutableCollections$MapN<K, V>$MapNIterator */
            MapNIterator() {
                this.remaining = MapN.this.size();
                if (this.remaining > 0) {
                    this.idx = WeekFields$ComputedDayOfField$$ExternalSyntheticBackport0.m(ImmutableCollections.SALT, MapN.this.table.length >> 1) << 1;
                }
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$MapN$MapNIterator != java.util.ImmutableCollections$MapN<K, V>$MapNIterator */
            @Override // java.util.Iterator
            public boolean hasNext() {
                return this.remaining > 0;
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$MapN$MapNIterator != java.util.ImmutableCollections$MapN<K, V>$MapNIterator */
            private int nextIndex() {
                int idx;
                int idx2 = this.idx;
                if (ImmutableCollections.SALT >= 0) {
                    idx = idx2 + 2;
                    if (idx >= MapN.this.table.length) {
                        idx = 0;
                    }
                } else {
                    idx = idx2 - 2;
                    if (idx < 0) {
                        idx = MapN.this.table.length - 2;
                    }
                }
                this.idx = idx;
                return idx;
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$MapN$MapNIterator != java.util.ImmutableCollections$MapN<K, V>$MapNIterator */
            @Override // java.util.Iterator
            public Map.Entry<K, V> next() {
                if (hasNext()) {
                    while (MapN.this.table[nextIndex()] == null) {
                    }
                    Map.Entry<K, V> e = new KeyValueHolder<>(MapN.this.table[this.idx], MapN.this.table[this.idx + 1]);
                    this.remaining--;
                    return e;
                }
                throw new NoSuchElementException();
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$MapN != java.util.ImmutableCollections$MapN<K, V> */
        @Override // java.util.AbstractMap, java.util.Map
        public java.util.Set<Map.Entry<K, V>> entrySet() {
            return new AbstractSet<Map.Entry<K, V>>() { // da classe: j$.util.ImmutableCollections.MapN.1
                @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
                public int size() {
                    return MapN.this.size;
                }

                @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
                public java.util.Iterator<Map.Entry<K, V>> iterator() {
                    return new MapNIterator();
                }
            };
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$MapN != java.util.ImmutableCollections$MapN<K, V> */
        private int probe(Object pk) {
            int idx = WeekFields$ComputedDayOfField$$ExternalSyntheticBackport0.m(pk.hashCode(), this.table.length >> 1) << 1;
            while (true) {
                Object obj = this.table[idx];
                if (obj == null) {
                    return (-idx) - 1;
                }
                if (pk.equals(obj)) {
                    return idx;
                }
                idx += 2;
                if (idx == this.table.length) {
                    idx = 0;
                }
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$MapN != java.util.ImmutableCollections$MapN<K, V> */
        private void readObject(ObjectInputStream in) {
            throw new InvalidObjectException("not serial proxy");
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.ImmutableCollections$MapN != java.util.ImmutableCollections$MapN<K, V> */
        private Object writeReplace() {
            Object[] array = new Object[this.size * 2];
            int len = this.table.length;
            int dest = 0;
            for (int i = 0; i < len; i += 2) {
                if (this.table[i] != null) {
                    int dest2 = dest + 1;
                    array[dest] = this.table[i];
                    dest = dest2 + 1;
                    array[dest2] = this.table[i + 1];
                }
            }
            return new CollSer(3, array);
        }
    }
}
