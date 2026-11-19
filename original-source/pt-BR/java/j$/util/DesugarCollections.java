package j$.util;

import j$.util.Collection;
import j$.util.DesugarCollections;
import j$.util.Iterator;
import j$.util.List;
import j$.util.Map;
import j$.util.Spliterator;
import j$.util.function.BiFunction$CC;
import j$.util.function.Consumer$CC;
import j$.util.function.Function$CC;
import j$.util.stream.Stream;
import j$.util.stream.StreamSupport;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.lang.reflect.Array;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.ListIterator;
import java.util.Map;
import java.util.RandomAccess;
import java.util.SortedMap;
import java.util.function.BiConsumer;
import java.util.function.BiFunction;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.IntFunction;
import java.util.function.Predicate;
import java.util.function.UnaryOperator;
import java.util.stream.Stream;

/* carregado de: classes15.dex */
public class DesugarCollections {
    private DesugarCollections() {
    }

    public static <T> java.util.Collection<T> unmodifiableCollection(java.util.Collection<? extends T> c) {
        return new UnmodifiableCollection(c);
    }

    static class UnmodifiableCollection<E> implements java.util.Collection<E>, Serializable, Collection<E> {
        private static final long serialVersionUID = 1820017752578914078L;
        final java.util.Collection<? extends E> c;

        @Override // java.util.Collection
        public /* sintético */ Stream parallelStream() {
            return Stream.Wrapper.convert(parallelStream());
        }

        @Override // java.util.Collection, java.lang.Iterable
        public /* sintético */ java.util.Spliterator spliterator() {
            return Spliterator.Wrapper.convert(spliterator());
        }

        @Override // java.util.Collection
        public /* sintético */ java.util.stream.Stream stream() {
            return Stream.Wrapper.convert(stream());
        }

        @Override // java.util.Collection, j$.util.Collection
        public /* sintético */ Object[] toArray(IntFunction intFunction) {
            return Collection.CC.$default$toArray(this, intFunction);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableCollection != java.util.DesugarCollections$UnmodifiableCollection<E> */
        UnmodifiableCollection(java.util.Collection<? extends E> c) {
            if (c == null) {
                throw new NullPointerException();
            }
            this.c = c;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableCollection != java.util.DesugarCollections$UnmodifiableCollection<E> */
        @Override // java.util.Collection
        public int size() {
            return this.c.size();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableCollection != java.util.DesugarCollections$UnmodifiableCollection<E> */
        @Override // java.util.Collection
        public boolean isEmpty() {
            return this.c.isEmpty();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableCollection != java.util.DesugarCollections$UnmodifiableCollection<E> */
        @Override // java.util.Collection
        public boolean contains(Object o) {
            return this.c.contains(o);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableCollection != java.util.DesugarCollections$UnmodifiableCollection<E> */
        @Override // java.util.Collection
        public Object[] toArray() {
            return this.c.toArray();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableCollection != java.util.DesugarCollections$UnmodifiableCollection<E> */
        @Override // java.util.Collection
        public <T> T[] toArray(T[] tArr) {
            return (T[]) this.c.toArray(tArr);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableCollection != java.util.DesugarCollections$UnmodifiableCollection<E> */
        public String toString() {
            return this.c.toString();
        }

        /* renomeado de: j$.util.DesugarCollections$UnmodifiableCollection$1, motivo: nome de classe inválido */
        class AnonymousClass1 implements java.util.Iterator<E>, Iterator<E> {
            private final java.util.Iterator<? extends E> i;

            AnonymousClass1() {
                this.i = UnmodifiableCollection.this.c.iterator();
            }

            @Override // java.util.Iterator
            public boolean hasNext() {
                return this.i.hasNext();
            }

            @Override // java.util.Iterator
            public E next() {
                return this.i.next();
            }

            @Override // java.util.Iterator
            public void remove() {
                throw new UnsupportedOperationException();
            }

            @Override // java.util.Iterator, j$.util.Iterator
            public void forEachRemaining(Consumer<? super E> action) {
                Iterator.EL.forEachRemaining(this.i, action);
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableCollection != java.util.DesugarCollections$UnmodifiableCollection<E> */
        @Override // java.util.Collection, java.lang.Iterable
        public java.util.Iterator<E> iterator() {
            return new AnonymousClass1();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableCollection != java.util.DesugarCollections$UnmodifiableCollection<E> */
        @Override // java.util.Collection
        public boolean add(E e) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableCollection != java.util.DesugarCollections$UnmodifiableCollection<E> */
        @Override // java.util.Collection
        public boolean remove(Object o) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableCollection != java.util.DesugarCollections$UnmodifiableCollection<E> */
        @Override // java.util.Collection
        public boolean containsAll(java.util.Collection<?> coll) {
            return this.c.containsAll(coll);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableCollection != java.util.DesugarCollections$UnmodifiableCollection<E> */
        @Override // java.util.Collection
        public boolean addAll(java.util.Collection<? extends E> coll) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableCollection != java.util.DesugarCollections$UnmodifiableCollection<E> */
        @Override // java.util.Collection
        public boolean removeAll(java.util.Collection<?> coll) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableCollection != java.util.DesugarCollections$UnmodifiableCollection<E> */
        @Override // java.util.Collection
        public boolean retainAll(java.util.Collection<?> coll) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableCollection != java.util.DesugarCollections$UnmodifiableCollection<E> */
        @Override // java.util.Collection
        public void clear() {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableCollection != java.util.DesugarCollections$UnmodifiableCollection<E> */
        @Override // java.lang.Iterable, j$.util.Collection, j$.lang.Iterable
        public void forEach(Consumer<? super E> action) {
            Collection.EL.forEach(this.c, action);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableCollection != java.util.DesugarCollections$UnmodifiableCollection<E> */
        @Override // java.util.Collection, j$.util.Collection
        public boolean removeIf(Predicate<? super E> filter) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableCollection != java.util.DesugarCollections$UnmodifiableCollection<E> */
        @Override // java.util.Collection, java.lang.Iterable, j$.util.Collection, j$.lang.Iterable
        public Spliterator<E> spliterator() {
            return Collection.EL.spliterator(this.c);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableCollection != java.util.DesugarCollections$UnmodifiableCollection<E> */
        @Override // java.util.Collection, j$.util.Collection
        public j$.util.stream.Stream<E> stream() {
            return Collection.EL.stream(this.c);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableCollection != java.util.DesugarCollections$UnmodifiableCollection<E> */
        @Override // java.util.Collection, j$.util.Collection
        public j$.util.stream.Stream<E> parallelStream() {
            return Collection.EL.parallelStream(this.c);
        }
    }

    public static <T> java.util.Set<T> unmodifiableSet(java.util.Set<? extends T> s) {
        return new UnmodifiableSet(s);
    }

    static class UnmodifiableSet<E> extends UnmodifiableCollection<E> implements java.util.Set<E>, Serializable, Set<E> {
        private static final long serialVersionUID = -9215047833775013803L;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableSet != java.util.DesugarCollections$UnmodifiableSet<E> */
        UnmodifiableSet(java.util.Set<? extends E> s) {
            super(s);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableSet != java.util.DesugarCollections$UnmodifiableSet<E> */
        @Override // java.util.Collection, java.util.Set
        public boolean equals(Object o) {
            return o == this || this.c.equals(o);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableSet != java.util.DesugarCollections$UnmodifiableSet<E> */
        @Override // java.util.Collection, java.util.Set
        public int hashCode() {
            return this.c.hashCode();
        }
    }

    public static <T> java.util.SortedSet<T> unmodifiableSortedSet(java.util.SortedSet<T> s) {
        return new UnmodifiableSortedSet(s);
    }

    static class UnmodifiableSortedSet<E> extends UnmodifiableSet<E> implements java.util.SortedSet<E>, Serializable, SortedSet<E> {
        private static final long serialVersionUID = -4929149591599911165L;
        private final java.util.SortedSet<E> ss;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableSortedSet != java.util.DesugarCollections$UnmodifiableSortedSet<E> */
        UnmodifiableSortedSet(java.util.SortedSet<E> s) {
            super(s);
            this.ss = s;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableSortedSet != java.util.DesugarCollections$UnmodifiableSortedSet<E> */
        @Override // java.util.SortedSet
        public java.util.Comparator<? super E> comparator() {
            return this.ss.comparator();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableSortedSet != java.util.DesugarCollections$UnmodifiableSortedSet<E> */
        @Override // java.util.SortedSet
        public java.util.SortedSet<E> subSet(E fromElement, E toElement) {
            return new UnmodifiableSortedSet(this.ss.subSet(fromElement, toElement));
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableSortedSet != java.util.DesugarCollections$UnmodifiableSortedSet<E> */
        @Override // java.util.SortedSet
        public java.util.SortedSet<E> headSet(E toElement) {
            return new UnmodifiableSortedSet(this.ss.headSet(toElement));
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableSortedSet != java.util.DesugarCollections$UnmodifiableSortedSet<E> */
        @Override // java.util.SortedSet
        public java.util.SortedSet<E> tailSet(E fromElement) {
            return new UnmodifiableSortedSet(this.ss.tailSet(fromElement));
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableSortedSet != java.util.DesugarCollections$UnmodifiableSortedSet<E> */
        @Override // java.util.SortedSet
        public E first() {
            return this.ss.first();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableSortedSet != java.util.DesugarCollections$UnmodifiableSortedSet<E> */
        @Override // java.util.SortedSet
        public E last() {
            return this.ss.last();
        }
    }

    public static <T> java.util.List<T> unmodifiableList(java.util.List<? extends T> list) {
        if (list instanceof RandomAccess) {
            return new UnmodifiableRandomAccessList(list);
        }
        return new UnmodifiableList(list);
    }

    static class UnmodifiableList<E> extends UnmodifiableCollection<E> implements java.util.List<E>, List<E> {
        private static final long serialVersionUID = -283967356065247728L;
        final java.util.List<? extends E> list;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableList != java.util.DesugarCollections$UnmodifiableList<E> */
        UnmodifiableList(java.util.List<? extends E> list) {
            super(list);
            this.list = list;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableList != java.util.DesugarCollections$UnmodifiableList<E> */
        @Override // java.util.Collection, java.util.List
        public boolean equals(Object o) {
            return o == this || this.list.equals(o);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableList != java.util.DesugarCollections$UnmodifiableList<E> */
        @Override // java.util.Collection, java.util.List
        public int hashCode() {
            return this.list.hashCode();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableList != java.util.DesugarCollections$UnmodifiableList<E> */
        @Override // java.util.List
        public E get(int index) {
            return this.list.get(index);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableList != java.util.DesugarCollections$UnmodifiableList<E> */
        @Override // java.util.List
        public E set(int index, E element) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableList != java.util.DesugarCollections$UnmodifiableList<E> */
        @Override // java.util.List
        public void add(int index, E element) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableList != java.util.DesugarCollections$UnmodifiableList<E> */
        @Override // java.util.List
        public E remove(int index) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableList != java.util.DesugarCollections$UnmodifiableList<E> */
        @Override // java.util.List
        public int indexOf(Object o) {
            return this.list.indexOf(o);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableList != java.util.DesugarCollections$UnmodifiableList<E> */
        @Override // java.util.List
        public int lastIndexOf(Object o) {
            return this.list.lastIndexOf(o);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableList != java.util.DesugarCollections$UnmodifiableList<E> */
        @Override // java.util.List
        public boolean addAll(int index, java.util.Collection<? extends E> c) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableList != java.util.DesugarCollections$UnmodifiableList<E> */
        @Override // java.util.List, j$.util.List
        public void replaceAll(UnaryOperator<E> operator) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableList != java.util.DesugarCollections$UnmodifiableList<E> */
        @Override // java.util.List, j$.util.List
        public void sort(java.util.Comparator<? super E> c) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableList != java.util.DesugarCollections$UnmodifiableList<E> */
        @Override // java.util.List
        public ListIterator<E> listIterator() {
            return listIterator(0);
        }

        /* renomeado de: j$.util.DesugarCollections$UnmodifiableList$1, motivo: nome de classe inválido */
        class AnonymousClass1 implements ListIterator<E>, Iterator<E> {
            private final ListIterator<? extends E> i;
            final /* sintético */ int val$index;

            AnonymousClass1(int i) {
                this.val$index = i;
                this.i = UnmodifiableList.this.list.listIterator(this.val$index);
            }

            @Override // java.util.ListIterator, java.util.Iterator
            public boolean hasNext() {
                return this.i.hasNext();
            }

            @Override // java.util.ListIterator, java.util.Iterator
            public E next() {
                return this.i.next();
            }

            @Override // java.util.ListIterator
            public boolean hasPrevious() {
                return this.i.hasPrevious();
            }

            @Override // java.util.ListIterator
            public E previous() {
                return this.i.previous();
            }

            @Override // java.util.ListIterator
            public int nextIndex() {
                return this.i.nextIndex();
            }

            @Override // java.util.ListIterator
            public int previousIndex() {
                return this.i.previousIndex();
            }

            @Override // java.util.ListIterator, java.util.Iterator
            public void remove() {
                throw new UnsupportedOperationException();
            }

            @Override // java.util.ListIterator
            public void set(E e) {
                throw new UnsupportedOperationException();
            }

            @Override // java.util.ListIterator
            public void add(E e) {
                throw new UnsupportedOperationException();
            }

            @Override // java.util.Iterator, j$.util.Iterator
            public void forEachRemaining(Consumer<? super E> action) {
                Iterator.EL.forEachRemaining(this.i, action);
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableList != java.util.DesugarCollections$UnmodifiableList<E> */
        @Override // java.util.List
        public ListIterator<E> listIterator(int index) {
            return new AnonymousClass1(index);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableList != java.util.DesugarCollections$UnmodifiableList<E> */
        @Override // java.util.List
        public java.util.List<E> subList(int fromIndex, int toIndex) {
            return new UnmodifiableList(this.list.subList(fromIndex, toIndex));
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableList != java.util.DesugarCollections$UnmodifiableList<E> */
        private Object readResolve() {
            return this.list instanceof RandomAccess ? new UnmodifiableRandomAccessList(this.list) : this;
        }
    }

    static class UnmodifiableRandomAccessList<E> extends UnmodifiableList<E> implements RandomAccess {
        private static final long serialVersionUID = -2542308836966382001L;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableRandomAccessList != java.util.DesugarCollections$UnmodifiableRandomAccessList<E> */
        UnmodifiableRandomAccessList(java.util.List<? extends E> list) {
            super(list);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableRandomAccessList != java.util.DesugarCollections$UnmodifiableRandomAccessList<E> */
        @Override // j$.util.DesugarCollections.UnmodifiableList, java.util.List
        public java.util.List<E> subList(int fromIndex, int toIndex) {
            return new UnmodifiableRandomAccessList(this.list.subList(fromIndex, toIndex));
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableRandomAccessList != java.util.DesugarCollections$UnmodifiableRandomAccessList<E> */
        private Object writeReplace() {
            return new UnmodifiableList(this.list);
        }
    }

    public static <K, V> java.util.Map<K, V> unmodifiableMap(java.util.Map<? extends K, ? extends V> m) {
        return new UnmodifiableMap(m);
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    static class UnmodifiableMap<K, V> implements java.util.Map<K, V>, Serializable, Map<K, V> {
        private static final long serialVersionUID = -1034234728574286014L;
        private transient java.util.Set<Map.Entry<K, V>> entrySet;
        private transient java.util.Set<K> keySet;
        private final java.util.Map<? extends K, ? extends V> m;
        private transient java.util.Collection<V> values;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap != java.util.DesugarCollections$UnmodifiableMap<K, V> */
        UnmodifiableMap(java.util.Map<? extends K, ? extends V> m) {
            if (m == null) {
                throw new NullPointerException();
            }
            this.m = m;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap != java.util.DesugarCollections$UnmodifiableMap<K, V> */
        @Override // java.util.Map
        public int size() {
            return this.m.size();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap != java.util.DesugarCollections$UnmodifiableMap<K, V> */
        @Override // java.util.Map
        public boolean isEmpty() {
            return this.m.isEmpty();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap != java.util.DesugarCollections$UnmodifiableMap<K, V> */
        @Override // java.util.Map
        public boolean containsKey(Object key) {
            return this.m.containsKey(key);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap != java.util.DesugarCollections$UnmodifiableMap<K, V> */
        @Override // java.util.Map
        public boolean containsValue(Object val) {
            return this.m.containsValue(val);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap != java.util.DesugarCollections$UnmodifiableMap<K, V> */
        @Override // java.util.Map
        public V get(Object key) {
            return this.m.get(key);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap != java.util.DesugarCollections$UnmodifiableMap<K, V> */
        @Override // java.util.Map
        public V put(K key, V value) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap != java.util.DesugarCollections$UnmodifiableMap<K, V> */
        @Override // java.util.Map
        public V remove(Object key) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap != java.util.DesugarCollections$UnmodifiableMap<K, V> */
        @Override // java.util.Map
        public void putAll(java.util.Map<? extends K, ? extends V> m) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap != java.util.DesugarCollections$UnmodifiableMap<K, V> */
        @Override // java.util.Map
        public void clear() {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap != java.util.DesugarCollections$UnmodifiableMap<K, V> */
        @Override // java.util.Map
        public java.util.Set<K> keySet() {
            if (this.keySet == null) {
                this.keySet = DesugarCollections.unmodifiableSet(this.m.keySet());
            }
            return this.keySet;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap != java.util.DesugarCollections$UnmodifiableMap<K, V> */
        @Override // java.util.Map
        public java.util.Set<Map.Entry<K, V>> entrySet() {
            if (this.entrySet == null) {
                this.entrySet = new UnmodifiableEntrySet(this.m.entrySet());
            }
            return this.entrySet;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap != java.util.DesugarCollections$UnmodifiableMap<K, V> */
        @Override // java.util.Map
        public java.util.Collection<V> values() {
            if (this.values == null) {
                this.values = DesugarCollections.unmodifiableCollection(this.m.values());
            }
            return this.values;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap != java.util.DesugarCollections$UnmodifiableMap<K, V> */
        @Override // java.util.Map
        public boolean equals(Object o) {
            return o == this || this.m.equals(o);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap != java.util.DesugarCollections$UnmodifiableMap<K, V> */
        @Override // java.util.Map
        public int hashCode() {
            return this.m.hashCode();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap != java.util.DesugarCollections$UnmodifiableMap<K, V> */
        public String toString() {
            return this.m.toString();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap != java.util.DesugarCollections$UnmodifiableMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public V getOrDefault(Object obj, V v) {
            return (V) Map.EL.getOrDefault(this.m, obj, v);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap != java.util.DesugarCollections$UnmodifiableMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public void forEach(BiConsumer<? super K, ? super V> action) {
            Map.EL.forEach(this.m, action);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap != java.util.DesugarCollections$UnmodifiableMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public void replaceAll(BiFunction<? super K, ? super V, ? extends V> function) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap != java.util.DesugarCollections$UnmodifiableMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public V putIfAbsent(K key, V value) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap != java.util.DesugarCollections$UnmodifiableMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public boolean remove(Object key, Object value) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap != java.util.DesugarCollections$UnmodifiableMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public boolean replace(K key, V oldValue, V newValue) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap != java.util.DesugarCollections$UnmodifiableMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public V replace(K key, V value) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap != java.util.DesugarCollections$UnmodifiableMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public V computeIfAbsent(K key, Function<? super K, ? extends V> mappingFunction) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap != java.util.DesugarCollections$UnmodifiableMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public V computeIfPresent(K key, BiFunction<? super K, ? super V, ? extends V> remappingFunction) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap != java.util.DesugarCollections$UnmodifiableMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public V compute(K key, BiFunction<? super K, ? super V, ? extends V> remappingFunction) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap != java.util.DesugarCollections$UnmodifiableMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public V merge(K key, V value, BiFunction<? super V, ? super V, ? extends V> remappingFunction) {
            throw new UnsupportedOperationException();
        }

        static class UnmodifiableEntrySet<K, V> extends UnmodifiableSet<Map.Entry<K, V>> {
            private static final long serialVersionUID = 7854390611657943733L;

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet != java.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet<K, V> */
            UnmodifiableEntrySet(java.util.Set<? extends Map.Entry<? extends K, ? extends V>> s) {
                super(s);
            }

            static <K, V> Consumer<Map.Entry<? extends K, ? extends V>> entryConsumer(final Consumer<? super Map.Entry<K, V>> action) {
                return new Consumer() { // da classe: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$$ExternalSyntheticLambda0
                    @Override // java.util.function.Consumer
                    public final void accept(Object obj) {
                        Consumer.this.accept(new DesugarCollections.UnmodifiableMap.UnmodifiableEntrySet.UnmodifiableEntry((Map.Entry) obj));
                    }

                    @Override // java.util.function.Consumer
                    public /* sintético */ Consumer andThen(Consumer consumer) {
                        return Consumer$CC.$default$andThen(this, consumer);
                    }
                };
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet != java.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet<K, V> */
            @Override // j$.util.DesugarCollections.UnmodifiableCollection, java.lang.Iterable, j$.util.Collection, j$.lang.Iterable
            public void forEach(Consumer<? super Map.Entry<K, V>> action) {
                Objects.requireNonNull(action);
                Collection.EL.forEach(this.c, entryConsumer(action));
            }

            static final class UnmodifiableEntrySetSpliterator<K, V> implements Spliterator<Map.Entry<K, V>> {
                final Spliterator<Map.Entry<K, V>> s;

                /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntrySetSpliterator != java.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntrySetSpliterator<K, V> */
                /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<java.util.Map$Entry<K, V>> */
                UnmodifiableEntrySetSpliterator(Spliterator<Map.Entry<K, V>> spliterator) {
                    this.s = spliterator;
                }

                /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntrySetSpliterator != java.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntrySetSpliterator<K, V> */
                @Override // j$.util.Spliterator
                public boolean tryAdvance(Consumer<? super Map.Entry<K, V>> action) {
                    Objects.requireNonNull(action);
                    return this.s.tryAdvance(UnmodifiableEntrySet.entryConsumer(action));
                }

                /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntrySetSpliterator != java.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntrySetSpliterator<K, V> */
                @Override // j$.util.Spliterator
                public void forEachRemaining(Consumer<? super Map.Entry<K, V>> action) {
                    Objects.requireNonNull(action);
                    this.s.forEachRemaining(UnmodifiableEntrySet.entryConsumer(action));
                }

                /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntrySetSpliterator != java.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntrySetSpliterator<K, V> */
                /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<java.util.Map$Entry<K, V>> */
                @Override // j$.util.Spliterator
                public Spliterator<Map.Entry<K, V>> trySplit() {
                    Spliterator<Map.Entry<K, V>> trySplit = this.s.trySplit();
                    if (trySplit == null) {
                        return null;
                    }
                    return new UnmodifiableEntrySetSpliterator(trySplit);
                }

                /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntrySetSpliterator != java.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntrySetSpliterator<K, V> */
                @Override // j$.util.Spliterator
                public long estimateSize() {
                    return this.s.estimateSize();
                }

                /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntrySetSpliterator != java.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntrySetSpliterator<K, V> */
                @Override // j$.util.Spliterator
                public long getExactSizeIfKnown() {
                    return this.s.getExactSizeIfKnown();
                }

                /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntrySetSpliterator != java.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntrySetSpliterator<K, V> */
                @Override // j$.util.Spliterator
                public int characteristics() {
                    return this.s.characteristics();
                }

                /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntrySetSpliterator != java.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntrySetSpliterator<K, V> */
                @Override // j$.util.Spliterator
                public boolean hasCharacteristics(int characteristics) {
                    return this.s.hasCharacteristics(characteristics);
                }

                /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntrySetSpliterator != java.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntrySetSpliterator<K, V> */
                @Override // j$.util.Spliterator
                public java.util.Comparator<? super Map.Entry<K, V>> getComparator() {
                    return this.s.getComparator();
                }
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet != java.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet<K, V> */
            @Override // j$.util.DesugarCollections.UnmodifiableCollection, java.util.Collection, java.lang.Iterable, j$.util.Collection, j$.lang.Iterable
            public Spliterator<Map.Entry<K, V>> spliterator() {
                return new UnmodifiableEntrySetSpliterator(Collection.EL.spliterator(this.c));
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet != java.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet<K, V> */
            @Override // j$.util.DesugarCollections.UnmodifiableCollection, java.util.Collection, j$.util.Collection
            public j$.util.stream.Stream<Map.Entry<K, V>> stream() {
                return StreamSupport.stream(spliterator(), false);
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet != java.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet<K, V> */
            @Override // j$.util.DesugarCollections.UnmodifiableCollection, java.util.Collection, j$.util.Collection
            public j$.util.stream.Stream<Map.Entry<K, V>> parallelStream() {
                return StreamSupport.stream(spliterator(), true);
            }

            /* renomeado de: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$1, motivo: nome de classe inválido */
            class AnonymousClass1 implements java.util.Iterator<Map.Entry<K, V>>, Iterator<Map.Entry<K, V>> {
                private final java.util.Iterator<? extends Map.Entry<? extends K, ? extends V>> i;

                AnonymousClass1() {
                    this.i = UnmodifiableEntrySet.this.c.iterator();
                }

                @Override // java.util.Iterator
                public boolean hasNext() {
                    return this.i.hasNext();
                }

                @Override // java.util.Iterator
                public Map.Entry<K, V> next() {
                    return new UnmodifiableEntry(this.i.next());
                }

                @Override // java.util.Iterator
                public void remove() {
                    throw new UnsupportedOperationException();
                }

                @Override // java.util.Iterator, j$.util.Iterator
                public void forEachRemaining(Consumer<? super Map.Entry<K, V>> action) {
                    Iterator.EL.forEachRemaining(this.i, UnmodifiableEntrySet.entryConsumer(action));
                }
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet != java.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet<K, V> */
            @Override // j$.util.DesugarCollections.UnmodifiableCollection, java.util.Collection, java.lang.Iterable
            public java.util.Iterator<Map.Entry<K, V>> iterator() {
                return new AnonymousClass1();
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet != java.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet<K, V> */
            @Override // j$.util.DesugarCollections.UnmodifiableCollection, java.util.Collection
            public Object[] toArray() {
                Object[] a = this.c.toArray();
                for (int i = 0; i < a.length; i++) {
                    a[i] = new UnmodifiableEntry((Map.Entry) a[i]);
                }
                return a;
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet != java.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet<K, V> */
            /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
            @Override // j$.util.DesugarCollections.UnmodifiableCollection, java.util.Collection
            public <T> T[] toArray(T[] tArr) {
                T[] tArr2 = (T[]) this.c.toArray(tArr.length == 0 ? tArr : Arrays.copyOf(tArr, 0));
                for (int i = 0; i < tArr2.length; i++) {
                    tArr2[i] = new UnmodifiableEntry((Map.Entry) tArr2[i]);
                }
                if (tArr2.length > tArr.length) {
                    return tArr2;
                }
                System.arraycopy(tArr2, 0, tArr, 0, tArr2.length);
                if (tArr.length > tArr2.length) {
                    tArr[tArr2.length] = null;
                }
                return tArr;
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet != java.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet<K, V> */
            @Override // j$.util.DesugarCollections.UnmodifiableCollection, java.util.Collection
            public boolean contains(Object o) {
                if (!(o instanceof Map.Entry)) {
                    return false;
                }
                return this.c.contains(new UnmodifiableEntry((Map.Entry) o));
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet != java.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet<K, V> */
            @Override // j$.util.DesugarCollections.UnmodifiableCollection, java.util.Collection
            public boolean containsAll(java.util.Collection<?> coll) {
                for (Object e : coll) {
                    if (!contains(e)) {
                        return false;
                    }
                }
                return true;
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet != java.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet<K, V> */
            @Override // j$.util.DesugarCollections.UnmodifiableSet, java.util.Collection, java.util.Set
            public boolean equals(Object o) {
                if (o == this) {
                    return true;
                }
                if (!(o instanceof java.util.Set)) {
                    return false;
                }
                java.util.Set<?> s = (java.util.Set) o;
                if (s.size() != this.c.size()) {
                    return false;
                }
                return containsAll(s);
            }

            /* JADX INFO: modificadores de acesso alterados de: private */
            static class UnmodifiableEntry<K, V> implements Map.Entry<K, V> {
                private Map.Entry<? extends K, ? extends V> e;

                /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntry != java.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntry<K, V> */
                UnmodifiableEntry(Map.Entry<? extends K, ? extends V> e) {
                    this.e = (Map.Entry) Objects.requireNonNull(e);
                }

                /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntry != java.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntry<K, V> */
                @Override // java.util.Map.Entry
                public K getKey() {
                    return this.e.getKey();
                }

                /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntry != java.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntry<K, V> */
                @Override // java.util.Map.Entry
                public V getValue() {
                    return this.e.getValue();
                }

                /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntry != java.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntry<K, V> */
                @Override // java.util.Map.Entry
                public V setValue(V value) {
                    throw new UnsupportedOperationException();
                }

                /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntry != java.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntry<K, V> */
                @Override // java.util.Map.Entry
                public int hashCode() {
                    return this.e.hashCode();
                }

                /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntry != java.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntry<K, V> */
                @Override // java.util.Map.Entry
                public boolean equals(Object o) {
                    if (this == o) {
                        return true;
                    }
                    if (!(o instanceof Map.Entry)) {
                        return false;
                    }
                    Map.Entry<?, ?> t = (Map.Entry) o;
                    return DesugarCollections.eq(this.e.getKey(), t.getKey()) && DesugarCollections.eq(this.e.getValue(), t.getValue());
                }

                /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntry != java.util.DesugarCollections$UnmodifiableMap$UnmodifiableEntrySet$UnmodifiableEntry<K, V> */
                public String toString() {
                    return this.e.toString();
                }
            }
        }
    }

    public static <K, V> SortedMap<K, V> unmodifiableSortedMap(SortedMap<K, ? extends V> m) {
        return new UnmodifiableSortedMap(m);
    }

    static class UnmodifiableSortedMap<K, V> extends UnmodifiableMap<K, V> implements SortedMap<K, V>, Serializable, Map<K, V> {
        private static final long serialVersionUID = -8806743815996713206L;
        private final SortedMap<K, ? extends V> sm;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableSortedMap != java.util.DesugarCollections$UnmodifiableSortedMap<K, V> */
        UnmodifiableSortedMap(SortedMap<K, ? extends V> m) {
            super(m);
            this.sm = m;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableSortedMap != java.util.DesugarCollections$UnmodifiableSortedMap<K, V> */
        @Override // java.util.SortedMap
        public java.util.Comparator<? super K> comparator() {
            return this.sm.comparator();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableSortedMap != java.util.DesugarCollections$UnmodifiableSortedMap<K, V> */
        @Override // java.util.SortedMap
        public SortedMap<K, V> subMap(K fromKey, K toKey) {
            return new UnmodifiableSortedMap(this.sm.subMap(fromKey, toKey));
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableSortedMap != java.util.DesugarCollections$UnmodifiableSortedMap<K, V> */
        @Override // java.util.SortedMap
        public SortedMap<K, V> headMap(K toKey) {
            return new UnmodifiableSortedMap(this.sm.headMap(toKey));
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableSortedMap != java.util.DesugarCollections$UnmodifiableSortedMap<K, V> */
        @Override // java.util.SortedMap
        public SortedMap<K, V> tailMap(K fromKey) {
            return new UnmodifiableSortedMap(this.sm.tailMap(fromKey));
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableSortedMap != java.util.DesugarCollections$UnmodifiableSortedMap<K, V> */
        @Override // java.util.SortedMap
        public K firstKey() {
            return this.sm.firstKey();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$UnmodifiableSortedMap != java.util.DesugarCollections$UnmodifiableSortedMap<K, V> */
        @Override // java.util.SortedMap
        public K lastKey() {
            return this.sm.lastKey();
        }
    }

    public static <T> java.util.Collection<T> bridge_synchronizedCollection(java.util.Collection<T> c, Object mutex) {
        return synchronizedCollection(c, mutex);
    }

    public static <T> java.util.Set<T> bridge_synchronizedSet(java.util.Set<T> s, Object mutex) {
        return synchronizedSet(s, mutex);
    }

    public static <T> java.util.List<T> bridge_synchronizedList(java.util.List<T> l, Object mutex) {
        return synchronizedList(l, mutex);
    }

    public static <T> java.util.Collection<T> synchronizedCollection(java.util.Collection<T> c) {
        return new SynchronizedCollection(c);
    }

    static <T> java.util.Collection<T> synchronizedCollection(java.util.Collection<T> c, Object mutex) {
        return new SynchronizedCollection(c, mutex);
    }

    static class SynchronizedCollection<E> implements java.util.Collection<E>, Serializable, Collection<E> {
        private static final long serialVersionUID = 3053995032091335093L;
        final java.util.Collection<E> c;
        final Object mutex;

        @Override // java.util.Collection
        public /* sintético */ java.util.stream.Stream parallelStream() {
            return Stream.Wrapper.convert(parallelStream());
        }

        @Override // java.util.Collection, java.lang.Iterable
        public /* sintético */ java.util.Spliterator spliterator() {
            return Spliterator.Wrapper.convert(spliterator());
        }

        @Override // java.util.Collection
        public /* sintético */ java.util.stream.Stream stream() {
            return Stream.Wrapper.convert(stream());
        }

        @Override // java.util.Collection, j$.util.Collection
        public /* sintético */ Object[] toArray(IntFunction intFunction) {
            return Collection.CC.$default$toArray(this, intFunction);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedCollection != java.util.DesugarCollections$SynchronizedCollection<E> */
        SynchronizedCollection(java.util.Collection<E> c) {
            this.c = (java.util.Collection) Objects.requireNonNull(c);
            this.mutex = this;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedCollection != java.util.DesugarCollections$SynchronizedCollection<E> */
        SynchronizedCollection(java.util.Collection<E> c, Object mutex) {
            this.c = (java.util.Collection) Objects.requireNonNull(c);
            this.mutex = Objects.requireNonNull(mutex);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedCollection != java.util.DesugarCollections$SynchronizedCollection<E> */
        @Override // java.util.Collection
        public int size() {
            int size;
            synchronized (this.mutex) {
                size = this.c.size();
            }
            return size;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedCollection != java.util.DesugarCollections$SynchronizedCollection<E> */
        @Override // java.util.Collection
        public boolean isEmpty() {
            boolean isEmpty;
            synchronized (this.mutex) {
                isEmpty = this.c.isEmpty();
            }
            return isEmpty;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedCollection != java.util.DesugarCollections$SynchronizedCollection<E> */
        @Override // java.util.Collection
        public boolean contains(Object o) {
            boolean contains;
            synchronized (this.mutex) {
                contains = this.c.contains(o);
            }
            return contains;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedCollection != java.util.DesugarCollections$SynchronizedCollection<E> */
        @Override // java.util.Collection
        public Object[] toArray() {
            Object[] array;
            synchronized (this.mutex) {
                array = this.c.toArray();
            }
            return array;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedCollection != java.util.DesugarCollections$SynchronizedCollection<E> */
        @Override // java.util.Collection
        public <T> T[] toArray(T[] tArr) {
            T[] tArr2;
            synchronized (this.mutex) {
                tArr2 = (T[]) this.c.toArray(tArr);
            }
            return tArr2;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedCollection != java.util.DesugarCollections$SynchronizedCollection<E> */
        @Override // java.util.Collection, java.lang.Iterable
        public java.util.Iterator<E> iterator() {
            return this.c.iterator();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedCollection != java.util.DesugarCollections$SynchronizedCollection<E> */
        @Override // java.util.Collection
        public boolean add(E e) {
            boolean add;
            synchronized (this.mutex) {
                add = this.c.add(e);
            }
            return add;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedCollection != java.util.DesugarCollections$SynchronizedCollection<E> */
        @Override // java.util.Collection
        public boolean remove(Object o) {
            boolean remove;
            synchronized (this.mutex) {
                remove = this.c.remove(o);
            }
            return remove;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedCollection != java.util.DesugarCollections$SynchronizedCollection<E> */
        @Override // java.util.Collection
        public boolean containsAll(java.util.Collection<?> coll) {
            boolean containsAll;
            synchronized (this.mutex) {
                containsAll = this.c.containsAll(coll);
            }
            return containsAll;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedCollection != java.util.DesugarCollections$SynchronizedCollection<E> */
        @Override // java.util.Collection
        public boolean addAll(java.util.Collection<? extends E> coll) {
            boolean addAll;
            synchronized (this.mutex) {
                addAll = this.c.addAll(coll);
            }
            return addAll;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedCollection != java.util.DesugarCollections$SynchronizedCollection<E> */
        @Override // java.util.Collection
        public boolean removeAll(java.util.Collection<?> coll) {
            boolean removeAll;
            synchronized (this.mutex) {
                removeAll = this.c.removeAll(coll);
            }
            return removeAll;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedCollection != java.util.DesugarCollections$SynchronizedCollection<E> */
        @Override // java.util.Collection
        public boolean retainAll(java.util.Collection<?> coll) {
            boolean retainAll;
            synchronized (this.mutex) {
                retainAll = this.c.retainAll(coll);
            }
            return retainAll;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedCollection != java.util.DesugarCollections$SynchronizedCollection<E> */
        @Override // java.util.Collection
        public void clear() {
            synchronized (this.mutex) {
                this.c.clear();
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedCollection != java.util.DesugarCollections$SynchronizedCollection<E> */
        public String toString() {
            String obj;
            synchronized (this.mutex) {
                obj = this.c.toString();
            }
            return obj;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedCollection != java.util.DesugarCollections$SynchronizedCollection<E> */
        @Override // java.lang.Iterable, j$.util.Collection, j$.lang.Iterable
        public void forEach(Consumer<? super E> consumer) {
            synchronized (this.mutex) {
                Collection.EL.forEach(this.c, consumer);
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedCollection != java.util.DesugarCollections$SynchronizedCollection<E> */
        @Override // java.util.Collection, j$.util.Collection
        public boolean removeIf(Predicate<? super E> filter) {
            boolean removeIf;
            synchronized (this.mutex) {
                removeIf = Collection.EL.removeIf(this.c, filter);
            }
            return removeIf;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedCollection != java.util.DesugarCollections$SynchronizedCollection<E> */
        @Override // java.util.Collection, java.lang.Iterable, j$.util.Collection, j$.lang.Iterable
        public Spliterator<E> spliterator() {
            return Collection.EL.spliterator(this.c);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedCollection != java.util.DesugarCollections$SynchronizedCollection<E> */
        @Override // java.util.Collection, j$.util.Collection
        public j$.util.stream.Stream<E> stream() {
            return Collection.EL.stream(this.c);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedCollection != java.util.DesugarCollections$SynchronizedCollection<E> */
        @Override // java.util.Collection, j$.util.Collection
        public j$.util.stream.Stream<E> parallelStream() {
            return Collection.EL.parallelStream(this.c);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedCollection != java.util.DesugarCollections$SynchronizedCollection<E> */
        private void writeObject(ObjectOutputStream s) {
            synchronized (this.mutex) {
                s.defaultWriteObject();
            }
        }
    }

    public static <T> java.util.Set<T> synchronizedSet(java.util.Set<T> s) {
        return new SynchronizedSet(s);
    }

    static <T> java.util.Set<T> synchronizedSet(java.util.Set<T> s, Object mutex) {
        return new SynchronizedSet(s, mutex);
    }

    static class SynchronizedSet<E> extends SynchronizedCollection<E> implements java.util.Set<E>, Set<E> {
        private static final long serialVersionUID = 487447009682186044L;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedSet != java.util.DesugarCollections$SynchronizedSet<E> */
        SynchronizedSet(java.util.Set<E> s) {
            super(s);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedSet != java.util.DesugarCollections$SynchronizedSet<E> */
        SynchronizedSet(java.util.Set<E> s, Object mutex) {
            super(s, mutex);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedSet != java.util.DesugarCollections$SynchronizedSet<E> */
        @Override // java.util.Collection, java.util.Set
        public boolean equals(Object o) {
            boolean equals;
            if (this == o) {
                return true;
            }
            synchronized (this.mutex) {
                equals = this.c.equals(o);
            }
            return equals;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedSet != java.util.DesugarCollections$SynchronizedSet<E> */
        @Override // java.util.Collection, java.util.Set
        public int hashCode() {
            int hashCode;
            synchronized (this.mutex) {
                hashCode = this.c.hashCode();
            }
            return hashCode;
        }
    }

    public static <T> java.util.SortedSet<T> synchronizedSortedSet(java.util.SortedSet<T> s) {
        return new SynchronizedSortedSet(s);
    }

    static class SynchronizedSortedSet<E> extends SynchronizedSet<E> implements java.util.SortedSet<E>, SortedSet<E> {
        private static final long serialVersionUID = 8695801310862127406L;
        private final java.util.SortedSet<E> ss;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedSortedSet != java.util.DesugarCollections$SynchronizedSortedSet<E> */
        SynchronizedSortedSet(java.util.SortedSet<E> s) {
            super(s);
            this.ss = s;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedSortedSet != java.util.DesugarCollections$SynchronizedSortedSet<E> */
        SynchronizedSortedSet(java.util.SortedSet<E> s, Object mutex) {
            super(s, mutex);
            this.ss = s;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedSortedSet != java.util.DesugarCollections$SynchronizedSortedSet<E> */
        @Override // java.util.SortedSet
        public java.util.Comparator<? super E> comparator() {
            java.util.Comparator<? super E> comparator;
            synchronized (this.mutex) {
                comparator = this.ss.comparator();
            }
            return comparator;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedSortedSet != java.util.DesugarCollections$SynchronizedSortedSet<E> */
        @Override // java.util.SortedSet
        public java.util.SortedSet<E> subSet(E fromElement, E toElement) {
            SynchronizedSortedSet synchronizedSortedSet;
            synchronized (this.mutex) {
                synchronizedSortedSet = new SynchronizedSortedSet(this.ss.subSet(fromElement, toElement), this.mutex);
            }
            return synchronizedSortedSet;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedSortedSet != java.util.DesugarCollections$SynchronizedSortedSet<E> */
        @Override // java.util.SortedSet
        public java.util.SortedSet<E> headSet(E toElement) {
            SynchronizedSortedSet synchronizedSortedSet;
            synchronized (this.mutex) {
                synchronizedSortedSet = new SynchronizedSortedSet(this.ss.headSet(toElement), this.mutex);
            }
            return synchronizedSortedSet;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedSortedSet != java.util.DesugarCollections$SynchronizedSortedSet<E> */
        @Override // java.util.SortedSet
        public java.util.SortedSet<E> tailSet(E fromElement) {
            SynchronizedSortedSet synchronizedSortedSet;
            synchronized (this.mutex) {
                synchronizedSortedSet = new SynchronizedSortedSet(this.ss.tailSet(fromElement), this.mutex);
            }
            return synchronizedSortedSet;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedSortedSet != java.util.DesugarCollections$SynchronizedSortedSet<E> */
        @Override // java.util.SortedSet
        public E first() {
            E first;
            synchronized (this.mutex) {
                first = this.ss.first();
            }
            return first;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedSortedSet != java.util.DesugarCollections$SynchronizedSortedSet<E> */
        @Override // java.util.SortedSet
        public E last() {
            E last;
            synchronized (this.mutex) {
                last = this.ss.last();
            }
            return last;
        }
    }

    public static <T> java.util.List<T> synchronizedList(java.util.List<T> list) {
        if (list instanceof RandomAccess) {
            return new SynchronizedRandomAccessList(list);
        }
        return new SynchronizedList(list);
    }

    static <T> java.util.List<T> synchronizedList(java.util.List<T> list, Object mutex) {
        if (list instanceof RandomAccess) {
            return new SynchronizedRandomAccessList(list, mutex);
        }
        return new SynchronizedList(list, mutex);
    }

    static class SynchronizedList<E> extends SynchronizedCollection<E> implements java.util.List<E>, List<E> {
        private static final long serialVersionUID = -7754090372962971524L;
        final java.util.List<E> list;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedList != java.util.DesugarCollections$SynchronizedList<E> */
        SynchronizedList(java.util.List<E> list) {
            super(list);
            this.list = list;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedList != java.util.DesugarCollections$SynchronizedList<E> */
        SynchronizedList(java.util.List<E> list, Object mutex) {
            super(list, mutex);
            this.list = list;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedList != java.util.DesugarCollections$SynchronizedList<E> */
        @Override // java.util.Collection, java.util.List
        public boolean equals(Object o) {
            boolean equals;
            if (this == o) {
                return true;
            }
            synchronized (this.mutex) {
                equals = this.list.equals(o);
            }
            return equals;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedList != java.util.DesugarCollections$SynchronizedList<E> */
        @Override // java.util.Collection, java.util.List
        public int hashCode() {
            int hashCode;
            synchronized (this.mutex) {
                hashCode = this.list.hashCode();
            }
            return hashCode;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedList != java.util.DesugarCollections$SynchronizedList<E> */
        @Override // java.util.List
        public E get(int index) {
            E e;
            synchronized (this.mutex) {
                e = this.list.get(index);
            }
            return e;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedList != java.util.DesugarCollections$SynchronizedList<E> */
        @Override // java.util.List
        public E set(int index, E element) {
            E e;
            synchronized (this.mutex) {
                e = this.list.set(index, element);
            }
            return e;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedList != java.util.DesugarCollections$SynchronizedList<E> */
        @Override // java.util.List
        public void add(int index, E element) {
            synchronized (this.mutex) {
                this.list.add(index, element);
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedList != java.util.DesugarCollections$SynchronizedList<E> */
        @Override // java.util.List
        public E remove(int index) {
            E remove;
            synchronized (this.mutex) {
                remove = this.list.remove(index);
            }
            return remove;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedList != java.util.DesugarCollections$SynchronizedList<E> */
        @Override // java.util.List
        public int indexOf(Object o) {
            int indexOf;
            synchronized (this.mutex) {
                indexOf = this.list.indexOf(o);
            }
            return indexOf;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedList != java.util.DesugarCollections$SynchronizedList<E> */
        @Override // java.util.List
        public int lastIndexOf(Object o) {
            int lastIndexOf;
            synchronized (this.mutex) {
                lastIndexOf = this.list.lastIndexOf(o);
            }
            return lastIndexOf;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedList != java.util.DesugarCollections$SynchronizedList<E> */
        @Override // java.util.List
        public boolean addAll(int index, java.util.Collection<? extends E> c) {
            boolean addAll;
            synchronized (this.mutex) {
                addAll = this.list.addAll(index, c);
            }
            return addAll;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedList != java.util.DesugarCollections$SynchronizedList<E> */
        @Override // java.util.List
        public ListIterator<E> listIterator() {
            return this.list.listIterator();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedList != java.util.DesugarCollections$SynchronizedList<E> */
        @Override // java.util.List
        public ListIterator<E> listIterator(int index) {
            return this.list.listIterator(index);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedList != java.util.DesugarCollections$SynchronizedList<E> */
        @Override // java.util.List
        public java.util.List<E> subList(int fromIndex, int toIndex) {
            SynchronizedList synchronizedList;
            synchronized (this.mutex) {
                synchronizedList = new SynchronizedList(this.list.subList(fromIndex, toIndex), this.mutex);
            }
            return synchronizedList;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedList != java.util.DesugarCollections$SynchronizedList<E> */
        @Override // java.util.List, j$.util.List
        public void replaceAll(UnaryOperator<E> operator) {
            synchronized (this.mutex) {
                List.EL.replaceAll(this.list, operator);
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedList != java.util.DesugarCollections$SynchronizedList<E> */
        @Override // java.util.List, j$.util.List
        public void sort(java.util.Comparator<? super E> c) {
            synchronized (this.mutex) {
                List.EL.sort(this.list, c);
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedList != java.util.DesugarCollections$SynchronizedList<E> */
        private Object readResolve() {
            return this.list instanceof RandomAccess ? new SynchronizedRandomAccessList(this.list) : this;
        }
    }

    static class SynchronizedRandomAccessList<E> extends SynchronizedList<E> implements RandomAccess {
        private static final long serialVersionUID = 1530674583602358482L;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedRandomAccessList != java.util.DesugarCollections$SynchronizedRandomAccessList<E> */
        SynchronizedRandomAccessList(java.util.List<E> list) {
            super(list);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedRandomAccessList != java.util.DesugarCollections$SynchronizedRandomAccessList<E> */
        SynchronizedRandomAccessList(java.util.List<E> list, Object mutex) {
            super(list, mutex);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedRandomAccessList != java.util.DesugarCollections$SynchronizedRandomAccessList<E> */
        @Override // j$.util.DesugarCollections.SynchronizedList, java.util.List
        public java.util.List<E> subList(int fromIndex, int toIndex) {
            SynchronizedRandomAccessList synchronizedRandomAccessList;
            synchronized (this.mutex) {
                synchronizedRandomAccessList = new SynchronizedRandomAccessList(this.list.subList(fromIndex, toIndex), this.mutex);
            }
            return synchronizedRandomAccessList;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedRandomAccessList != java.util.DesugarCollections$SynchronizedRandomAccessList<E> */
        private Object writeReplace() {
            return new SynchronizedList(this.list);
        }
    }

    public static <K, V> java.util.Map<K, V> synchronizedMap(java.util.Map<K, V> m) {
        return new SynchronizedMap(m);
    }

    private static class SynchronizedMap<K, V> implements java.util.Map<K, V>, Serializable, Map<K, V> {
        private static final long serialVersionUID = 1978198479659022715L;
        private transient java.util.Set<Map.Entry<K, V>> entrySet;
        private transient java.util.Set<K> keySet;
        private final java.util.Map<K, V> m;
        final Object mutex;
        private transient java.util.Collection<V> values;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        SynchronizedMap(java.util.Map<K, V> m) {
            this.m = (java.util.Map) Objects.requireNonNull(m);
            this.mutex = this;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        SynchronizedMap(java.util.Map<K, V> m, Object mutex) {
            this.m = m;
            this.mutex = mutex;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        @Override // java.util.Map
        public int size() {
            int size;
            synchronized (this.mutex) {
                size = this.m.size();
            }
            return size;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        @Override // java.util.Map
        public boolean isEmpty() {
            boolean isEmpty;
            synchronized (this.mutex) {
                isEmpty = this.m.isEmpty();
            }
            return isEmpty;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        @Override // java.util.Map
        public boolean containsKey(Object key) {
            boolean containsKey;
            synchronized (this.mutex) {
                containsKey = this.m.containsKey(key);
            }
            return containsKey;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        @Override // java.util.Map
        public boolean containsValue(Object value) {
            boolean containsValue;
            synchronized (this.mutex) {
                containsValue = this.m.containsValue(value);
            }
            return containsValue;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        @Override // java.util.Map
        public V get(Object key) {
            V v;
            synchronized (this.mutex) {
                v = this.m.get(key);
            }
            return v;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        @Override // java.util.Map
        public V put(K key, V value) {
            V put;
            synchronized (this.mutex) {
                put = this.m.put(key, value);
            }
            return put;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        @Override // java.util.Map
        public V remove(Object key) {
            V remove;
            synchronized (this.mutex) {
                remove = this.m.remove(key);
            }
            return remove;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        @Override // java.util.Map
        public void putAll(java.util.Map<? extends K, ? extends V> map) {
            synchronized (this.mutex) {
                this.m.putAll(map);
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        @Override // java.util.Map
        public void clear() {
            synchronized (this.mutex) {
                this.m.clear();
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        @Override // java.util.Map
        public java.util.Set<K> keySet() {
            java.util.Set<K> set;
            synchronized (this.mutex) {
                if (this.keySet == null) {
                    this.keySet = new SynchronizedSet(this.m.keySet(), this.mutex);
                }
                set = this.keySet;
            }
            return set;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        @Override // java.util.Map
        public java.util.Set<Map.Entry<K, V>> entrySet() {
            java.util.Set<Map.Entry<K, V>> set;
            synchronized (this.mutex) {
                if (this.entrySet == null) {
                    this.entrySet = new SynchronizedSet(this.m.entrySet(), this.mutex);
                }
                set = this.entrySet;
            }
            return set;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        @Override // java.util.Map
        public java.util.Collection<V> values() {
            java.util.Collection<V> collection;
            synchronized (this.mutex) {
                if (this.values == null) {
                    this.values = new SynchronizedCollection(this.m.values(), this.mutex);
                }
                collection = this.values;
            }
            return collection;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        @Override // java.util.Map
        public boolean equals(Object o) {
            boolean equals;
            if (this == o) {
                return true;
            }
            synchronized (this.mutex) {
                equals = this.m.equals(o);
            }
            return equals;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        @Override // java.util.Map
        public int hashCode() {
            int hashCode;
            synchronized (this.mutex) {
                hashCode = this.m.hashCode();
            }
            return hashCode;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        public String toString() {
            String obj;
            synchronized (this.mutex) {
                obj = this.m.toString();
            }
            return obj;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public V getOrDefault(Object obj, V v) {
            V v2;
            synchronized (this.mutex) {
                v2 = (V) Map.EL.getOrDefault(this.m, obj, v);
            }
            return v2;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public void forEach(BiConsumer<? super K, ? super V> action) {
            synchronized (this.mutex) {
                Map.EL.forEach(this.m, action);
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public void replaceAll(BiFunction<? super K, ? super V, ? extends V> function) {
            synchronized (this.mutex) {
                Map.EL.replaceAll(this.m, function);
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public V putIfAbsent(K k, V v) {
            V v2;
            synchronized (this.mutex) {
                v2 = (V) Map.EL.putIfAbsent(this.m, k, v);
            }
            return v2;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public boolean remove(Object key, Object value) {
            boolean remove;
            synchronized (this.mutex) {
                remove = Map.EL.remove(this.m, key, value);
            }
            return remove;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public boolean replace(K key, V oldValue, V newValue) {
            boolean replace;
            synchronized (this.mutex) {
                replace = Map.EL.replace(this.m, key, oldValue, newValue);
            }
            return replace;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public V replace(K k, V v) {
            V v2;
            synchronized (this.mutex) {
                v2 = (V) Map.EL.replace(this.m, k, v);
            }
            return v2;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public V computeIfAbsent(K k, Function<? super K, ? extends V> function) {
            V v;
            synchronized (this.mutex) {
                v = (V) Map.EL.computeIfAbsent(this.m, k, function);
            }
            return v;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public V computeIfPresent(K k, BiFunction<? super K, ? super V, ? extends V> biFunction) {
            V v;
            synchronized (this.mutex) {
                v = (V) Map.EL.computeIfPresent(this.m, k, biFunction);
            }
            return v;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public V compute(K k, BiFunction<? super K, ? super V, ? extends V> biFunction) {
            V v;
            synchronized (this.mutex) {
                v = (V) Map.EL.compute(this.m, k, biFunction);
            }
            return v;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public V merge(K k, V v, BiFunction<? super V, ? super V, ? extends V> biFunction) {
            V v2;
            synchronized (this.mutex) {
                v2 = (V) Map.EL.merge(this.m, k, v, biFunction);
            }
            return v2;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedMap != java.util.DesugarCollections$SynchronizedMap<K, V> */
        private void writeObject(ObjectOutputStream s) {
            synchronized (this.mutex) {
                s.defaultWriteObject();
            }
        }
    }

    public static <K, V> SortedMap<K, V> synchronizedSortedMap(SortedMap<K, V> m) {
        return new SynchronizedSortedMap(m);
    }

    static class SynchronizedSortedMap<K, V> extends SynchronizedMap<K, V> implements SortedMap<K, V>, Map<K, V> {
        private static final long serialVersionUID = -8798146769416483793L;
        private final SortedMap<K, V> sm;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedSortedMap != java.util.DesugarCollections$SynchronizedSortedMap<K, V> */
        SynchronizedSortedMap(SortedMap<K, V> m) {
            super(m);
            this.sm = m;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedSortedMap != java.util.DesugarCollections$SynchronizedSortedMap<K, V> */
        SynchronizedSortedMap(SortedMap<K, V> m, Object mutex) {
            super(m, mutex);
            this.sm = m;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedSortedMap != java.util.DesugarCollections$SynchronizedSortedMap<K, V> */
        @Override // java.util.SortedMap
        public java.util.Comparator<? super K> comparator() {
            java.util.Comparator<? super K> comparator;
            synchronized (this.mutex) {
                comparator = this.sm.comparator();
            }
            return comparator;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedSortedMap != java.util.DesugarCollections$SynchronizedSortedMap<K, V> */
        @Override // java.util.SortedMap
        public SortedMap<K, V> subMap(K fromKey, K toKey) {
            SynchronizedSortedMap synchronizedSortedMap;
            synchronized (this.mutex) {
                synchronizedSortedMap = new SynchronizedSortedMap(this.sm.subMap(fromKey, toKey), this.mutex);
            }
            return synchronizedSortedMap;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedSortedMap != java.util.DesugarCollections$SynchronizedSortedMap<K, V> */
        @Override // java.util.SortedMap
        public SortedMap<K, V> headMap(K toKey) {
            SynchronizedSortedMap synchronizedSortedMap;
            synchronized (this.mutex) {
                synchronizedSortedMap = new SynchronizedSortedMap(this.sm.headMap(toKey), this.mutex);
            }
            return synchronizedSortedMap;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedSortedMap != java.util.DesugarCollections$SynchronizedSortedMap<K, V> */
        @Override // java.util.SortedMap
        public SortedMap<K, V> tailMap(K fromKey) {
            SynchronizedSortedMap synchronizedSortedMap;
            synchronized (this.mutex) {
                synchronizedSortedMap = new SynchronizedSortedMap(this.sm.tailMap(fromKey), this.mutex);
            }
            return synchronizedSortedMap;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedSortedMap != java.util.DesugarCollections$SynchronizedSortedMap<K, V> */
        @Override // java.util.SortedMap
        public K firstKey() {
            K firstKey;
            synchronized (this.mutex) {
                firstKey = this.sm.firstKey();
            }
            return firstKey;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$SynchronizedSortedMap != java.util.DesugarCollections$SynchronizedSortedMap<K, V> */
        @Override // java.util.SortedMap
        public K lastKey() {
            K lastKey;
            synchronized (this.mutex) {
                lastKey = this.sm.lastKey();
            }
            return lastKey;
        }
    }

    public static <E> java.util.Collection<E> checkedCollection(java.util.Collection<E> c, Class<E> type) {
        return new CheckedCollection(c, type);
    }

    static <T> T[] zeroLengthArray(Class<T> cls) {
        return (T[]) ((Object[]) Array.newInstance((Class<?>) cls, 0));
    }

    static class CheckedCollection<E> implements java.util.Collection<E>, Serializable, Collection<E> {
        private static final long serialVersionUID = 1578914078182001775L;
        final java.util.Collection<E> c;
        final Class<E> type;
        private E[] zeroLengthElementArray;

        @Override // java.util.Collection
        public /* sintético */ java.util.stream.Stream parallelStream() {
            return Stream.Wrapper.convert(parallelStream());
        }

        @Override // java.util.Collection, java.lang.Iterable
        public /* sintético */ java.util.Spliterator spliterator() {
            return Spliterator.Wrapper.convert(spliterator());
        }

        @Override // java.util.Collection
        public /* sintético */ java.util.stream.Stream stream() {
            return Stream.Wrapper.convert(stream());
        }

        @Override // java.util.Collection, j$.util.Collection
        public /* sintético */ Object[] toArray(IntFunction intFunction) {
            return Collection.CC.$default$toArray(this, intFunction);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedCollection != java.util.DesugarCollections$CheckedCollection<E> */
        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        E typeCheck(Object obj) {
            if (obj != 0 && !this.type.isInstance(obj)) {
                throw new ClassCastException(badElementMsg(obj));
            }
            return obj;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedCollection != java.util.DesugarCollections$CheckedCollection<E> */
        private String badElementMsg(Object o) {
            return "Attempt to insert " + o.getClass() + " element into collection with element type " + this.type;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedCollection != java.util.DesugarCollections$CheckedCollection<E> */
        CheckedCollection(java.util.Collection<E> c, Class<E> type) {
            this.c = (java.util.Collection) Objects.requireNonNull(c, "c");
            this.type = (Class) Objects.requireNonNull(type, "type");
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedCollection != java.util.DesugarCollections$CheckedCollection<E> */
        @Override // java.util.Collection
        public int size() {
            return this.c.size();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedCollection != java.util.DesugarCollections$CheckedCollection<E> */
        @Override // java.util.Collection
        public boolean isEmpty() {
            return this.c.isEmpty();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedCollection != java.util.DesugarCollections$CheckedCollection<E> */
        @Override // java.util.Collection
        public boolean contains(Object o) {
            return this.c.contains(o);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedCollection != java.util.DesugarCollections$CheckedCollection<E> */
        @Override // java.util.Collection
        public Object[] toArray() {
            return this.c.toArray();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedCollection != java.util.DesugarCollections$CheckedCollection<E> */
        @Override // java.util.Collection
        public <T> T[] toArray(T[] tArr) {
            return (T[]) this.c.toArray(tArr);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedCollection != java.util.DesugarCollections$CheckedCollection<E> */
        public String toString() {
            return this.c.toString();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedCollection != java.util.DesugarCollections$CheckedCollection<E> */
        @Override // java.util.Collection
        public boolean remove(Object o) {
            return this.c.remove(o);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedCollection != java.util.DesugarCollections$CheckedCollection<E> */
        @Override // java.util.Collection
        public void clear() {
            this.c.clear();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedCollection != java.util.DesugarCollections$CheckedCollection<E> */
        @Override // java.util.Collection
        public boolean containsAll(java.util.Collection<?> coll) {
            return this.c.containsAll(coll);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedCollection != java.util.DesugarCollections$CheckedCollection<E> */
        @Override // java.util.Collection
        public boolean removeAll(java.util.Collection<?> coll) {
            return this.c.removeAll(coll);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedCollection != java.util.DesugarCollections$CheckedCollection<E> */
        @Override // java.util.Collection
        public boolean retainAll(java.util.Collection<?> coll) {
            return this.c.retainAll(coll);
        }

        /* renomeado de: j$.util.DesugarCollections$CheckedCollection$1, motivo: nome de classe inválido */
        class AnonymousClass1 implements java.util.Iterator<E>, Iterator<E> {
            final /* sintético */ java.util.Iterator val$it;

            AnonymousClass1(java.util.Iterator it) {
                this.val$it = it;
            }

            @Override // java.util.Iterator
            public boolean hasNext() {
                return this.val$it.hasNext();
            }

            @Override // java.util.Iterator
            public E next() {
                return (E) this.val$it.next();
            }

            @Override // java.util.Iterator
            public void remove() {
                this.val$it.remove();
            }

            @Override // java.util.Iterator, j$.util.Iterator
            public void forEachRemaining(Consumer<? super E> action) {
                Iterator.EL.forEachRemaining(this.val$it, action);
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedCollection != java.util.DesugarCollections$CheckedCollection<E> */
        @Override // java.util.Collection, java.lang.Iterable
        public java.util.Iterator<E> iterator() {
            java.util.Iterator<E> it = this.c.iterator();
            return new AnonymousClass1(it);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedCollection != java.util.DesugarCollections$CheckedCollection<E> */
        @Override // java.util.Collection
        public boolean add(E e) {
            return this.c.add(typeCheck(e));
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedCollection != java.util.DesugarCollections$CheckedCollection<E> */
        private E[] zeroLengthElementArray() {
            if (this.zeroLengthElementArray != null) {
                return this.zeroLengthElementArray;
            }
            E[] eArr = (E[]) DesugarCollections.zeroLengthArray(this.type);
            this.zeroLengthElementArray = eArr;
            return eArr;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedCollection != java.util.DesugarCollections$CheckedCollection<E> */
        java.util.Collection<E> checkedCopyOf(java.util.Collection<? extends E> coll) {
            Object[] a;
            try {
                E[] z = zeroLengthElementArray();
                a = coll.toArray(z);
                if (a.getClass() != z.getClass()) {
                    a = Arrays.copyOf(a, a.length, z.getClass());
                }
            } catch (ArrayStoreException e) {
                a = (Object[]) coll.toArray().clone();
                for (Object o : a) {
                    typeCheck(o);
                }
            }
            return Arrays.asList(a);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedCollection != java.util.DesugarCollections$CheckedCollection<E> */
        @Override // java.util.Collection
        public boolean addAll(java.util.Collection<? extends E> coll) {
            return this.c.addAll(checkedCopyOf(coll));
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedCollection != java.util.DesugarCollections$CheckedCollection<E> */
        @Override // java.lang.Iterable, j$.util.Collection, j$.lang.Iterable
        public void forEach(Consumer<? super E> action) {
            Collection.EL.forEach(this.c, action);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedCollection != java.util.DesugarCollections$CheckedCollection<E> */
        @Override // java.util.Collection, j$.util.Collection
        public boolean removeIf(Predicate<? super E> filter) {
            return Collection.EL.removeIf(this.c, filter);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedCollection != java.util.DesugarCollections$CheckedCollection<E> */
        @Override // java.util.Collection, java.lang.Iterable, j$.util.Collection, j$.lang.Iterable
        public Spliterator<E> spliterator() {
            return Collection.EL.spliterator(this.c);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedCollection != java.util.DesugarCollections$CheckedCollection<E> */
        @Override // java.util.Collection, j$.util.Collection
        public j$.util.stream.Stream<E> stream() {
            return Collection.EL.stream(this.c);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedCollection != java.util.DesugarCollections$CheckedCollection<E> */
        @Override // java.util.Collection, j$.util.Collection
        public j$.util.stream.Stream<E> parallelStream() {
            return Collection.EL.parallelStream(this.c);
        }
    }

    public static <E> java.util.Set<E> checkedSet(java.util.Set<E> s, Class<E> type) {
        return new CheckedSet(s, type);
    }

    static class CheckedSet<E> extends CheckedCollection<E> implements java.util.Set<E>, Serializable, Set<E> {
        private static final long serialVersionUID = 4694047833775013803L;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedSet != java.util.DesugarCollections$CheckedSet<E> */
        CheckedSet(java.util.Set<E> s, Class<E> elementType) {
            super(s, elementType);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedSet != java.util.DesugarCollections$CheckedSet<E> */
        @Override // java.util.Collection, java.util.Set
        public boolean equals(Object o) {
            return o == this || this.c.equals(o);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedSet != java.util.DesugarCollections$CheckedSet<E> */
        @Override // java.util.Collection, java.util.Set
        public int hashCode() {
            return this.c.hashCode();
        }
    }

    public static <E> java.util.SortedSet<E> checkedSortedSet(java.util.SortedSet<E> s, Class<E> type) {
        return new CheckedSortedSet(s, type);
    }

    static class CheckedSortedSet<E> extends CheckedSet<E> implements java.util.SortedSet<E>, Serializable, SortedSet<E> {
        private static final long serialVersionUID = 1599911165492914959L;
        private final java.util.SortedSet<E> ss;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedSortedSet != java.util.DesugarCollections$CheckedSortedSet<E> */
        CheckedSortedSet(java.util.SortedSet<E> s, Class<E> type) {
            super(s, type);
            this.ss = s;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedSortedSet != java.util.DesugarCollections$CheckedSortedSet<E> */
        @Override // java.util.SortedSet
        public java.util.Comparator<? super E> comparator() {
            return this.ss.comparator();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedSortedSet != java.util.DesugarCollections$CheckedSortedSet<E> */
        @Override // java.util.SortedSet
        public E first() {
            return this.ss.first();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedSortedSet != java.util.DesugarCollections$CheckedSortedSet<E> */
        @Override // java.util.SortedSet
        public E last() {
            return this.ss.last();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedSortedSet != java.util.DesugarCollections$CheckedSortedSet<E> */
        @Override // java.util.SortedSet
        public java.util.SortedSet<E> subSet(E fromElement, E toElement) {
            return DesugarCollections.checkedSortedSet(this.ss.subSet(fromElement, toElement), this.type);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedSortedSet != java.util.DesugarCollections$CheckedSortedSet<E> */
        @Override // java.util.SortedSet
        public java.util.SortedSet<E> headSet(E toElement) {
            return DesugarCollections.checkedSortedSet(this.ss.headSet(toElement), this.type);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedSortedSet != java.util.DesugarCollections$CheckedSortedSet<E> */
        @Override // java.util.SortedSet
        public java.util.SortedSet<E> tailSet(E fromElement) {
            return DesugarCollections.checkedSortedSet(this.ss.tailSet(fromElement), this.type);
        }
    }

    public static <E> java.util.List<E> checkedList(java.util.List<E> list, Class<E> type) {
        if (list instanceof RandomAccess) {
            return new CheckedRandomAccessList(list, type);
        }
        return new CheckedList(list, type);
    }

    static class CheckedList<E> extends CheckedCollection<E> implements java.util.List<E>, List<E> {
        private static final long serialVersionUID = 65247728283967356L;
        final java.util.List<E> list;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedList != java.util.DesugarCollections$CheckedList<E> */
        CheckedList(java.util.List<E> list, Class<E> type) {
            super(list, type);
            this.list = list;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedList != java.util.DesugarCollections$CheckedList<E> */
        @Override // java.util.Collection, java.util.List
        public boolean equals(Object o) {
            return o == this || this.list.equals(o);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedList != java.util.DesugarCollections$CheckedList<E> */
        @Override // java.util.Collection, java.util.List
        public int hashCode() {
            return this.list.hashCode();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedList != java.util.DesugarCollections$CheckedList<E> */
        @Override // java.util.List
        public E get(int index) {
            return this.list.get(index);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedList != java.util.DesugarCollections$CheckedList<E> */
        @Override // java.util.List
        public E remove(int index) {
            return this.list.remove(index);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedList != java.util.DesugarCollections$CheckedList<E> */
        @Override // java.util.List
        public int indexOf(Object o) {
            return this.list.indexOf(o);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedList != java.util.DesugarCollections$CheckedList<E> */
        @Override // java.util.List
        public int lastIndexOf(Object o) {
            return this.list.lastIndexOf(o);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedList != java.util.DesugarCollections$CheckedList<E> */
        @Override // java.util.List
        public E set(int index, E element) {
            return this.list.set(index, typeCheck(element));
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedList != java.util.DesugarCollections$CheckedList<E> */
        @Override // java.util.List
        public void add(int index, E element) {
            this.list.add(index, typeCheck(element));
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedList != java.util.DesugarCollections$CheckedList<E> */
        @Override // java.util.List
        public boolean addAll(int index, java.util.Collection<? extends E> c) {
            return this.list.addAll(index, checkedCopyOf(c));
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedList != java.util.DesugarCollections$CheckedList<E> */
        @Override // java.util.List
        public ListIterator<E> listIterator() {
            return listIterator(0);
        }

        /* renomeado de: j$.util.DesugarCollections$CheckedList$1, motivo: nome de classe inválido */
        class AnonymousClass1 implements ListIterator<E>, Iterator<E> {
            final /* sintético */ ListIterator val$i;

            AnonymousClass1(ListIterator listIterator) {
                this.val$i = listIterator;
            }

            @Override // java.util.ListIterator, java.util.Iterator
            public boolean hasNext() {
                return this.val$i.hasNext();
            }

            @Override // java.util.ListIterator, java.util.Iterator
            public E next() {
                return (E) this.val$i.next();
            }

            @Override // java.util.ListIterator
            public boolean hasPrevious() {
                return this.val$i.hasPrevious();
            }

            @Override // java.util.ListIterator
            public E previous() {
                return (E) this.val$i.previous();
            }

            @Override // java.util.ListIterator
            public int nextIndex() {
                return this.val$i.nextIndex();
            }

            @Override // java.util.ListIterator
            public int previousIndex() {
                return this.val$i.previousIndex();
            }

            @Override // java.util.ListIterator, java.util.Iterator
            public void remove() {
                this.val$i.remove();
            }

            @Override // java.util.ListIterator
            public void set(E e) {
                this.val$i.set(CheckedList.this.typeCheck(e));
            }

            @Override // java.util.ListIterator
            public void add(E e) {
                this.val$i.add(CheckedList.this.typeCheck(e));
            }

            @Override // java.util.Iterator, j$.util.Iterator
            public void forEachRemaining(Consumer<? super E> action) {
                Iterator.EL.forEachRemaining(this.val$i, action);
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedList != java.util.DesugarCollections$CheckedList<E> */
        @Override // java.util.List
        public ListIterator<E> listIterator(int index) {
            ListIterator<E> i = this.list.listIterator(index);
            return new AnonymousClass1(i);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedList != java.util.DesugarCollections$CheckedList<E> */
        @Override // java.util.List
        public java.util.List<E> subList(int fromIndex, int toIndex) {
            return new CheckedList(this.list.subList(fromIndex, toIndex), this.type);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedList != java.util.DesugarCollections$CheckedList<E> */
        @Override // java.util.List, j$.util.List
        public void replaceAll(final UnaryOperator<E> operator) {
            Objects.requireNonNull(operator);
            List.EL.replaceAll(this.list, new UnaryOperator() { // da classe: j$.util.DesugarCollections$CheckedList$$ExternalSyntheticLambda0
                @Override // java.util.function.Function
                public /* sintético */ Function andThen(Function function) {
                    return Function$CC.$default$andThen(this, function);
                }

                @Override // java.util.function.Function
                public final Object apply(Object obj) {
                    return DesugarCollections.CheckedList.this.m835lambda$replaceAll$0$javautilDesugarCollections$CheckedList(operator, obj);
                }

                @Override // java.util.function.Function
                public /* sintético */ Function compose(Function function) {
                    return Function$CC.$default$compose(this, function);
                }
            });
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedList != java.util.DesugarCollections$CheckedList<E> */
        /* renomeado de: lambda$replaceAll$0$java-util-DesugarCollections$CheckedList, motivo: nome Java inválido */
        /* sintético */ Object m835lambda$replaceAll$0$javautilDesugarCollections$CheckedList(UnaryOperator operator, Object e) {
            return typeCheck(operator.apply(e));
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedList != java.util.DesugarCollections$CheckedList<E> */
        @Override // java.util.List, j$.util.List
        public void sort(java.util.Comparator<? super E> c) {
            List.EL.sort(this.list, c);
        }
    }

    static class CheckedRandomAccessList<E> extends CheckedList<E> implements RandomAccess {
        private static final long serialVersionUID = 1638200125423088369L;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedRandomAccessList != java.util.DesugarCollections$CheckedRandomAccessList<E> */
        CheckedRandomAccessList(java.util.List<E> list, Class<E> type) {
            super(list, type);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedRandomAccessList != java.util.DesugarCollections$CheckedRandomAccessList<E> */
        @Override // j$.util.DesugarCollections.CheckedList, java.util.List
        public java.util.List<E> subList(int fromIndex, int toIndex) {
            return new CheckedRandomAccessList(this.list.subList(fromIndex, toIndex), this.type);
        }
    }

    public static <K, V> java.util.Map<K, V> checkedMap(java.util.Map<K, V> m, Class<K> keyType, Class<V> valueType) {
        return new CheckedMap(m, keyType, valueType);
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    static class CheckedMap<K, V> implements java.util.Map<K, V>, Serializable, Map<K, V> {
        private static final long serialVersionUID = 5742860141034234728L;
        private transient java.util.Set<Map.Entry<K, V>> entrySet;
        final Class<K> keyType;
        private final java.util.Map<K, V> m;
        final Class<V> valueType;

        @Override // java.util.Map, j$.util.Map
        public /* sintético */ Object getOrDefault(Object obj, Object obj2) {
            return Map.CC.$default$getOrDefault(this, obj, obj2);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        private void typeCheck(Object key, Object value) {
            if (key != null && !this.keyType.isInstance(key)) {
                throw new ClassCastException(badKeyMsg(key));
            }
            if (value != null && !this.valueType.isInstance(value)) {
                throw new ClassCastException(badValueMsg(value));
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        private BiFunction<? super K, ? super V, ? extends V> typeCheck(final BiFunction<? super K, ? super V, ? extends V> func) {
            Objects.requireNonNull(func);
            return new BiFunction() { // da classe: j$.util.DesugarCollections$CheckedMap$$ExternalSyntheticLambda0
                @Override // java.util.function.BiFunction
                public /* sintético */ BiFunction andThen(Function function) {
                    return BiFunction$CC.$default$andThen(this, function);
                }

                @Override // java.util.function.BiFunction
                public final Object apply(Object obj, Object obj2) {
                    return DesugarCollections.CheckedMap.this.m838lambda$typeCheck$0$javautilDesugarCollections$CheckedMap(func, obj, obj2);
                }
            };
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        /* renomeado de: lambda$typeCheck$0$java-util-DesugarCollections$CheckedMap, motivo: nome Java inválido */
        /* sintético */ Object m838lambda$typeCheck$0$javautilDesugarCollections$CheckedMap(BiFunction func, Object k, Object v) {
            Object apply = func.apply(k, v);
            typeCheck(k, apply);
            return apply;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        private String badKeyMsg(Object key) {
            return "Attempt to insert " + key.getClass() + " key into map with key type " + this.keyType;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        private String badValueMsg(Object value) {
            return "Attempt to insert " + value.getClass() + " value into map with value type " + this.valueType;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        CheckedMap(java.util.Map<K, V> m, Class<K> keyType, Class<V> valueType) {
            this.m = (java.util.Map) Objects.requireNonNull(m);
            this.keyType = (Class) Objects.requireNonNull(keyType);
            this.valueType = (Class) Objects.requireNonNull(valueType);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        @Override // java.util.Map
        public int size() {
            return this.m.size();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        @Override // java.util.Map
        public boolean isEmpty() {
            return this.m.isEmpty();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        @Override // java.util.Map
        public boolean containsKey(Object key) {
            return this.m.containsKey(key);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        @Override // java.util.Map
        public boolean containsValue(Object v) {
            return this.m.containsValue(v);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        @Override // java.util.Map
        public V get(Object key) {
            return this.m.get(key);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        @Override // java.util.Map
        public V remove(Object key) {
            return this.m.remove(key);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        @Override // java.util.Map
        public void clear() {
            this.m.clear();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        @Override // java.util.Map
        public java.util.Set<K> keySet() {
            return this.m.keySet();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        @Override // java.util.Map
        public java.util.Collection<V> values() {
            return this.m.values();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        @Override // java.util.Map
        public boolean equals(Object o) {
            return o == this || this.m.equals(o);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        @Override // java.util.Map
        public int hashCode() {
            return this.m.hashCode();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        public String toString() {
            return this.m.toString();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        @Override // java.util.Map
        public V put(K key, V value) {
            typeCheck(key, value);
            return this.m.put(key, value);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        @Override // java.util.Map
        public void putAll(java.util.Map<? extends K, ? extends V> map) {
            Object[] array = map.entrySet().toArray();
            ArrayList<Map.Entry> arrayList = new ArrayList(array.length);
            for (Object obj : array) {
                Map.Entry entry = (Map.Entry) obj;
                Object key = entry.getKey();
                Object value = entry.getValue();
                typeCheck(key, value);
                arrayList.add(new AbstractMap.SimpleImmutableEntry(key, value));
            }
            for (Map.Entry entry2 : arrayList) {
                this.m.put(entry2.getKey(), entry2.getValue());
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        @Override // java.util.Map
        public java.util.Set<Map.Entry<K, V>> entrySet() {
            if (this.entrySet == null) {
                this.entrySet = new CheckedEntrySet(this.m.entrySet(), this.valueType);
            }
            return this.entrySet;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public void forEach(BiConsumer<? super K, ? super V> action) {
            Map.EL.forEach(this.m, action);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public void replaceAll(BiFunction<? super K, ? super V, ? extends V> function) {
            Map.EL.replaceAll(this.m, typeCheck(function));
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public V putIfAbsent(K k, V v) {
            typeCheck(k, v);
            return (V) Map.EL.putIfAbsent(this.m, k, v);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public boolean remove(Object key, Object value) {
            return Map.EL.remove(this.m, key, value);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public boolean replace(K key, V oldValue, V newValue) {
            typeCheck(key, newValue);
            return Map.EL.replace(this.m, key, oldValue, newValue);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public V replace(K k, V v) {
            typeCheck(k, v);
            return (V) Map.EL.replace(this.m, k, v);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public V computeIfAbsent(K k, final Function<? super K, ? extends V> function) {
            Objects.requireNonNull(function);
            return (V) Map.EL.computeIfAbsent(this.m, k, new Function() { // da classe: j$.util.DesugarCollections$CheckedMap$$ExternalSyntheticLambda2
                @Override // java.util.function.Function
                public /* sintético */ Function andThen(Function function2) {
                    return Function$CC.$default$andThen(this, function2);
                }

                @Override // java.util.function.Function
                public final Object apply(Object obj) {
                    return DesugarCollections.CheckedMap.this.m836lambda$computeIfAbsent$1$javautilDesugarCollections$CheckedMap(function, obj);
                }

                @Override // java.util.function.Function
                public /* sintético */ Function compose(Function function2) {
                    return Function$CC.$default$compose(this, function2);
                }
            });
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        /* renomeado de: lambda$computeIfAbsent$1$java-util-DesugarCollections$CheckedMap, motivo: nome Java inválido */
        /* sintético */ Object m836lambda$computeIfAbsent$1$javautilDesugarCollections$CheckedMap(Function mappingFunction, Object k) {
            Object apply = mappingFunction.apply(k);
            typeCheck(k, apply);
            return apply;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public V computeIfPresent(K k, BiFunction<? super K, ? super V, ? extends V> biFunction) {
            return (V) Map.EL.computeIfPresent(this.m, k, typeCheck(biFunction));
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public V compute(K k, BiFunction<? super K, ? super V, ? extends V> biFunction) {
            return (V) Map.EL.compute(this.m, k, typeCheck(biFunction));
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        @Override // java.util.Map, j$.util.Map
        public V merge(K k, V v, final BiFunction<? super V, ? super V, ? extends V> biFunction) {
            Objects.requireNonNull(biFunction);
            return (V) Map.EL.merge(this.m, k, v, new BiFunction() { // da classe: j$.util.DesugarCollections$CheckedMap$$ExternalSyntheticLambda1
                @Override // java.util.function.BiFunction
                public /* sintético */ BiFunction andThen(Function function) {
                    return BiFunction$CC.$default$andThen(this, function);
                }

                @Override // java.util.function.BiFunction
                public final Object apply(Object obj, Object obj2) {
                    return DesugarCollections.CheckedMap.this.m837lambda$merge$2$javautilDesugarCollections$CheckedMap(biFunction, obj, obj2);
                }
            });
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap != java.util.DesugarCollections$CheckedMap<K, V> */
        /* renomeado de: lambda$merge$2$java-util-DesugarCollections$CheckedMap, motivo: nome Java inválido */
        /* sintético */ Object m837lambda$merge$2$javautilDesugarCollections$CheckedMap(BiFunction remappingFunction, Object v1, Object v2) {
            Object apply = remappingFunction.apply(v1, v2);
            typeCheck(null, apply);
            return apply;
        }

        static class CheckedEntrySet<K, V> implements java.util.Set<Map.Entry<K, V>> {
            private final java.util.Set<Map.Entry<K, V>> s;
            private final Class<V> valueType;

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet != java.util.DesugarCollections$CheckedMap$CheckedEntrySet<K, V> */
            CheckedEntrySet(java.util.Set<Map.Entry<K, V>> s, Class<V> valueType) {
                this.s = s;
                this.valueType = valueType;
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet != java.util.DesugarCollections$CheckedMap$CheckedEntrySet<K, V> */
            @Override // java.util.Set, java.util.Collection
            public int size() {
                return this.s.size();
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet != java.util.DesugarCollections$CheckedMap$CheckedEntrySet<K, V> */
            @Override // java.util.Set, java.util.Collection
            public boolean isEmpty() {
                return this.s.isEmpty();
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet != java.util.DesugarCollections$CheckedMap$CheckedEntrySet<K, V> */
            public String toString() {
                return this.s.toString();
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet != java.util.DesugarCollections$CheckedMap$CheckedEntrySet<K, V> */
            @Override // java.util.Set, java.util.Collection
            public int hashCode() {
                return this.s.hashCode();
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet != java.util.DesugarCollections$CheckedMap$CheckedEntrySet<K, V> */
            @Override // java.util.Set, java.util.Collection
            public void clear() {
                this.s.clear();
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet != java.util.DesugarCollections$CheckedMap$CheckedEntrySet<K, V> */
            @Override // java.util.Set, java.util.Collection
            public boolean add(Map.Entry<K, V> e) {
                throw new UnsupportedOperationException();
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet != java.util.DesugarCollections$CheckedMap$CheckedEntrySet<K, V> */
            @Override // java.util.Set, java.util.Collection
            public boolean addAll(java.util.Collection<? extends Map.Entry<K, V>> coll) {
                throw new UnsupportedOperationException();
            }

            /* renomeado de: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet$1, motivo: nome de classe inválido */
            class AnonymousClass1 implements java.util.Iterator<Map.Entry<K, V>>, Iterator<Map.Entry<K, V>> {
                final /* sintético */ java.util.Iterator val$i;

                AnonymousClass1(java.util.Iterator it) {
                    this.val$i = it;
                }

                @Override // java.util.Iterator
                public boolean hasNext() {
                    return this.val$i.hasNext();
                }

                @Override // java.util.Iterator
                public void remove() {
                    this.val$i.remove();
                }

                @Override // java.util.Iterator
                public Map.Entry<K, V> next() {
                    return CheckedEntrySet.checkedEntry((Map.Entry) this.val$i.next(), CheckedEntrySet.this.valueType);
                }

                @Override // java.util.Iterator, j$.util.Iterator
                public void forEachRemaining(final Consumer<? super Map.Entry<K, V>> action) {
                    Iterator.EL.forEachRemaining(this.val$i, new Consumer() { // da classe: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet$1$$ExternalSyntheticLambda0
                        @Override // java.util.function.Consumer
                        public final void accept(Object obj) {
                            DesugarCollections.CheckedMap.CheckedEntrySet.AnonymousClass1.this.m840x88a167ca(action, (Map.Entry) obj);
                        }

                        @Override // java.util.function.Consumer
                        public /* sintético */ Consumer andThen(Consumer consumer) {
                            return Consumer$CC.$default$andThen(this, consumer);
                        }
                    });
                }

                /* renomeado de: lambda$forEachRemaining$0$java-util-DesugarCollections$CheckedMap$CheckedEntrySet$1, motivo: nome Java inválido */
                /* sintético */ void m840x88a167ca(Consumer action, Map.Entry e) {
                    action.accept(CheckedEntrySet.checkedEntry(e, CheckedEntrySet.this.valueType));
                }
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet != java.util.DesugarCollections$CheckedMap$CheckedEntrySet<K, V> */
            @Override // java.util.Set, java.util.Collection, java.lang.Iterable
            public java.util.Iterator<Map.Entry<K, V>> iterator() {
                java.util.Iterator<Map.Entry<K, V>> i = this.s.iterator();
                return new AnonymousClass1(i);
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet != java.util.DesugarCollections$CheckedMap$CheckedEntrySet<K, V> */
            @Override // java.util.Set, java.util.Collection
            public Object[] toArray() {
                Object[] source = this.s.toArray();
                Object[] dest = source.getClass() == Object[].class ? source : new Object[source.length];
                for (int i = 0; i < source.length; i++) {
                    dest[i] = checkedEntry((Map.Entry) source[i], this.valueType);
                }
                return dest;
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet != java.util.DesugarCollections$CheckedMap$CheckedEntrySet<K, V> */
            /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
            @Override // java.util.Set, java.util.Collection
            public <T> T[] toArray(T[] tArr) {
                T[] tArr2 = (T[]) this.s.toArray(tArr.length == 0 ? tArr : Arrays.copyOf(tArr, 0));
                for (int i = 0; i < tArr2.length; i++) {
                    tArr2[i] = checkedEntry((Map.Entry) tArr2[i], this.valueType);
                }
                if (tArr2.length > tArr.length) {
                    return tArr2;
                }
                System.arraycopy(tArr2, 0, tArr, 0, tArr2.length);
                if (tArr.length > tArr2.length) {
                    tArr[tArr2.length] = null;
                }
                return tArr;
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet != java.util.DesugarCollections$CheckedMap$CheckedEntrySet<K, V> */
            @Override // java.util.Set, java.util.Collection
            public boolean contains(Object o) {
                if (!(o instanceof Map.Entry)) {
                    return false;
                }
                Map.Entry<?, ?> e = (Map.Entry) o;
                return this.s.contains(e instanceof CheckedEntry ? e : checkedEntry(e, this.valueType));
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet != java.util.DesugarCollections$CheckedMap$CheckedEntrySet<K, V> */
            @Override // java.util.Set, java.util.Collection
            public boolean containsAll(java.util.Collection<?> c) {
                for (Object o : c) {
                    if (!contains(o)) {
                        return false;
                    }
                }
                return true;
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet != java.util.DesugarCollections$CheckedMap$CheckedEntrySet<K, V> */
            @Override // java.util.Set, java.util.Collection
            public boolean remove(Object o) {
                if (!(o instanceof Map.Entry)) {
                    return false;
                }
                return this.s.remove(new AbstractMap.SimpleImmutableEntry((Map.Entry) o));
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet != java.util.DesugarCollections$CheckedMap$CheckedEntrySet<K, V> */
            @Override // java.util.Set, java.util.Collection
            public boolean removeAll(java.util.Collection<?> c) {
                return batchRemove(c, false);
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet != java.util.DesugarCollections$CheckedMap$CheckedEntrySet<K, V> */
            @Override // java.util.Set, java.util.Collection
            public boolean retainAll(java.util.Collection<?> c) {
                return batchRemove(c, true);
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet != java.util.DesugarCollections$CheckedMap$CheckedEntrySet<K, V> */
            private boolean batchRemove(java.util.Collection<?> c, boolean complement) {
                Objects.requireNonNull(c);
                boolean modified = false;
                java.util.Iterator<Map.Entry<K, V>> it = iterator();
                while (it.hasNext()) {
                    if (c.contains(it.next()) != complement) {
                        it.remove();
                        modified = true;
                    }
                }
                return modified;
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet != java.util.DesugarCollections$CheckedMap$CheckedEntrySet<K, V> */
            @Override // java.util.Set, java.util.Collection
            public boolean equals(Object o) {
                if (o == this) {
                    return true;
                }
                if (!(o instanceof java.util.Set)) {
                    return false;
                }
                java.util.Set<?> that = (java.util.Set) o;
                return that.size() == this.s.size() && containsAll(that);
            }

            static <K, V, T> CheckedEntry<K, V, T> checkedEntry(Map.Entry<K, V> e, Class<T> valueType) {
                return new CheckedEntry<>(e, valueType);
            }

            private static class CheckedEntry<K, V, T> implements Map.Entry<K, V> {
                private final Map.Entry<K, V> e;
                private final Class<T> valueType;

                /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet$CheckedEntry != java.util.DesugarCollections$CheckedMap$CheckedEntrySet$CheckedEntry<K, V, T> */
                CheckedEntry(Map.Entry<K, V> e, Class<T> valueType) {
                    this.e = (Map.Entry) Objects.requireNonNull(e);
                    this.valueType = (Class) Objects.requireNonNull(valueType);
                }

                /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet$CheckedEntry != java.util.DesugarCollections$CheckedMap$CheckedEntrySet$CheckedEntry<K, V, T> */
                @Override // java.util.Map.Entry
                public K getKey() {
                    return this.e.getKey();
                }

                /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet$CheckedEntry != java.util.DesugarCollections$CheckedMap$CheckedEntrySet$CheckedEntry<K, V, T> */
                @Override // java.util.Map.Entry
                public V getValue() {
                    return this.e.getValue();
                }

                /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet$CheckedEntry != java.util.DesugarCollections$CheckedMap$CheckedEntrySet$CheckedEntry<K, V, T> */
                @Override // java.util.Map.Entry
                public int hashCode() {
                    return this.e.hashCode();
                }

                /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet$CheckedEntry != java.util.DesugarCollections$CheckedMap$CheckedEntrySet$CheckedEntry<K, V, T> */
                public String toString() {
                    return this.e.toString();
                }

                /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet$CheckedEntry != java.util.DesugarCollections$CheckedMap$CheckedEntrySet$CheckedEntry<K, V, T> */
                @Override // java.util.Map.Entry
                public V setValue(V value) {
                    if (value != null && !this.valueType.isInstance(value)) {
                        throw new ClassCastException(badValueMsg(value));
                    }
                    return this.e.setValue(value);
                }

                /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet$CheckedEntry != java.util.DesugarCollections$CheckedMap$CheckedEntrySet$CheckedEntry<K, V, T> */
                private String badValueMsg(Object value) {
                    return "Attempt to insert " + value.getClass() + " value into map with value type " + this.valueType;
                }

                /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedMap$CheckedEntrySet$CheckedEntry != java.util.DesugarCollections$CheckedMap$CheckedEntrySet$CheckedEntry<K, V, T> */
                @Override // java.util.Map.Entry
                public boolean equals(Object o) {
                    if (o == this) {
                        return true;
                    }
                    if (!(o instanceof Map.Entry)) {
                        return false;
                    }
                    return this.e.equals(new AbstractMap.SimpleImmutableEntry((Map.Entry) o));
                }
            }
        }
    }

    public static <K, V> SortedMap<K, V> checkedSortedMap(SortedMap<K, V> m, Class<K> keyType, Class<V> valueType) {
        return new CheckedSortedMap(m, keyType, valueType);
    }

    static class CheckedSortedMap<K, V> extends CheckedMap<K, V> implements SortedMap<K, V>, Serializable, Map<K, V> {
        private static final long serialVersionUID = 1599671320688067438L;
        private final SortedMap<K, V> sm;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedSortedMap != java.util.DesugarCollections$CheckedSortedMap<K, V> */
        CheckedSortedMap(SortedMap<K, V> m, Class<K> keyType, Class<V> valueType) {
            super(m, keyType, valueType);
            this.sm = m;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedSortedMap != java.util.DesugarCollections$CheckedSortedMap<K, V> */
        @Override // java.util.SortedMap
        public java.util.Comparator<? super K> comparator() {
            return this.sm.comparator();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedSortedMap != java.util.DesugarCollections$CheckedSortedMap<K, V> */
        @Override // java.util.SortedMap
        public K firstKey() {
            return this.sm.firstKey();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedSortedMap != java.util.DesugarCollections$CheckedSortedMap<K, V> */
        @Override // java.util.SortedMap
        public K lastKey() {
            return this.sm.lastKey();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedSortedMap != java.util.DesugarCollections$CheckedSortedMap<K, V> */
        @Override // java.util.SortedMap
        public SortedMap<K, V> subMap(K fromKey, K toKey) {
            return DesugarCollections.checkedSortedMap(this.sm.subMap(fromKey, toKey), this.keyType, this.valueType);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedSortedMap != java.util.DesugarCollections$CheckedSortedMap<K, V> */
        @Override // java.util.SortedMap
        public SortedMap<K, V> headMap(K toKey) {
            return DesugarCollections.checkedSortedMap(this.sm.headMap(toKey), this.keyType, this.valueType);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.DesugarCollections$CheckedSortedMap != java.util.DesugarCollections$CheckedSortedMap<K, V> */
        @Override // java.util.SortedMap
        public SortedMap<K, V> tailMap(K fromKey) {
            return DesugarCollections.checkedSortedMap(this.sm.tailMap(fromKey), this.keyType, this.valueType);
        }
    }

    static boolean eq(Object o1, Object o2) {
        return o1 == null ? o2 == null : o1.equals(o2);
    }
}
