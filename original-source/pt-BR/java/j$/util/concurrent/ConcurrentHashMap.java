package j$.util.concurrent;

import j$.sun.misc.DesugarUnsafe;
import j$.util.Collection;
import j$.util.Spliterator;
import j$.util.stream.Stream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.ObjectStreamField;
import java.io.Serializable;
import java.lang.reflect.Array;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.AbstractMap;
import java.util.Arrays;
import java.util.Collection;
import java.util.Comparator;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;
import java.util.concurrent.CountedCompleter;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.locks.LockSupport;
import java.util.concurrent.locks.ReentrantLock;
import java.util.function.BiConsumer;
import java.util.function.BiFunction;
import java.util.function.Consumer;
import java.util.function.DoubleBinaryOperator;
import java.util.function.Function;
import java.util.function.IntBinaryOperator;
import java.util.function.IntFunction;
import java.util.function.LongBinaryOperator;
import java.util.function.Predicate;
import java.util.function.ToDoubleBiFunction;
import java.util.function.ToDoubleFunction;
import java.util.function.ToIntBiFunction;
import java.util.function.ToIntFunction;
import java.util.function.ToLongBiFunction;
import java.util.function.ToLongFunction;

/* carregado de: classes15.dex */
public class ConcurrentHashMap<K, V> extends AbstractMap<K, V> implements java.util.concurrent.ConcurrentMap<K, V>, Serializable, ConcurrentMap<K, V> {
    private static final int ASHIFT;
    private static final int DEFAULT_CAPACITY = 16;
    private static final int DEFAULT_CONCURRENCY_LEVEL = 16;
    static final int HASH_BITS = Integer.MAX_VALUE;
    private static final float LOAD_FACTOR = 0.75f;
    private static final int MAXIMUM_CAPACITY = 1073741824;
    static final int MAX_ARRAY_SIZE = 2147483639;
    private static final int MAX_RESIZERS = 65535;
    private static final int MIN_TRANSFER_STRIDE = 16;
    static final int MIN_TREEIFY_CAPACITY = 64;
    static final int MOVED = -1;
    static final int RESERVED = -3;
    private static final int RESIZE_STAMP_BITS = 16;
    private static final int RESIZE_STAMP_SHIFT = 16;
    static final int TREEBIN = -2;
    static final int TREEIFY_THRESHOLD = 8;
    static final int UNTREEIFY_THRESHOLD = 6;
    private static final long serialVersionUID = 7249069246763182397L;
    private volatile transient long baseCount;
    private volatile transient int cellsBusy;
    private volatile transient CounterCell[] counterCells;
    private transient EntrySetView<K, V> entrySet;
    private transient KeySetView<K, V> keySet;
    private volatile transient Node<K, V>[] nextTable;
    private volatile transient int sizeCtl;
    volatile transient Node<K, V>[] table;
    private volatile transient int transferIndex;
    private transient ValuesView<K, V> values;
    static final int NCPU = Runtime.getRuntime().availableProcessors();
    private static final ObjectStreamField[] serialPersistentFields = {new ObjectStreamField("segments", Segment[].class), new ObjectStreamField("segmentMask", Integer.TYPE), new ObjectStreamField("segmentShift", Integer.TYPE)};
    private static final DesugarUnsafe U = DesugarUnsafe.getUnsafe();
    private static final long SIZECTL = U.objectFieldOffset(ConcurrentHashMap.class, "sizeCtl");
    private static final long TRANSFERINDEX = U.objectFieldOffset(ConcurrentHashMap.class, "transferIndex");
    private static final long BASECOUNT = U.objectFieldOffset(ConcurrentHashMap.class, "baseCount");
    private static final long CELLSBUSY = U.objectFieldOffset(ConcurrentHashMap.class, "cellsBusy");
    private static final long CELLVALUE = U.objectFieldOffset(CounterCell.class, "value");
    private static final int ABASE = U.arrayBaseOffset(Node[].class);

    static {
        int scale = U.arrayIndexScale(Node[].class);
        if (((scale - 1) & scale) != 0) {
            throw new ExceptionInInitializerError("array index scale not a power of two");
        }
        ASHIFT = 31 - Integer.numberOfLeadingZeros(scale);
    }

    static class Node<K, V> implements Map.Entry<K, V> {
        final int hash;
        final K key;
        volatile Node<K, V> next;
        volatile V val;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        Node(int hash, K key, V val) {
            this.hash = hash;
            this.key = key;
            this.val = val;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        Node(int hash, K key, V val, Node<K, V> node) {
            this(hash, key, val);
            this.next = node;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // java.util.Map.Entry
        public final K getKey() {
            return this.key;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // java.util.Map.Entry
        public final V getValue() {
            return this.val;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // java.util.Map.Entry
        public final int hashCode() {
            return this.key.hashCode() ^ this.val.hashCode();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        public final String toString() {
            return Helpers.mapEntryToString(this.key, this.val);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // java.util.Map.Entry
        public final V setValue(V value) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // java.util.Map.Entry
        public final boolean equals(Object o) {
            Map.Entry<?, ?> e;
            Object k;
            Object v;
            Object u;
            return (o instanceof Map.Entry) && (k = (e = (Map.Entry) o).getKey()) != null && (v = e.getValue()) != null && (k == this.key || k.equals(this.key)) && (v == (u = this.val) || v.equals(u));
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        Node<K, V> find(int h, Object k) {
            Node<K, V> node;
            K ek;
            Node<K, V> node2 = this;
            if (k != null) {
                do {
                    if (node2.hash == h && ((ek = node2.key) == k || (ek != null && k.equals(ek)))) {
                        return node2;
                    }
                    node = node2.next;
                    node2 = node;
                } while (node != null);
                return null;
            }
            return null;
        }
    }

    static final int spread(int h) {
        return ((h >>> 16) ^ h) & Integer.MAX_VALUE;
    }

    private static final int tableSizeFor(int c) {
        int n = (-1) >>> Integer.numberOfLeadingZeros(c - 1);
        if (n < 0) {
            return 1;
        }
        if (n >= 1073741824) {
            return 1073741824;
        }
        return n + 1;
    }

    static Class<?> comparableClassFor(Object x) {
        Type[] as;
        if (x instanceof Comparable) {
            Class<?> c = x.getClass();
            if (c == String.class) {
                return c;
            }
            Type[] ts = c.getGenericInterfaces();
            if (ts != null) {
                for (Type t : ts) {
                    if (t instanceof ParameterizedType) {
                        ParameterizedType p = (ParameterizedType) t;
                        if (p.getRawType() == Comparable.class && (as = p.getActualTypeArguments()) != null && as.length == 1 && as[0] == c) {
                            return c;
                        }
                    }
                }
                return null;
            }
            return null;
        }
        return null;
    }

    static int compareComparables(Class<?> kc, Object k, Object x) {
        if (x == null || x.getClass() != kc) {
            return 0;
        }
        return ((Comparable) k).compareTo(x);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    static final <K, V> Node<K, V> tabAt(Node<K, V>[] nodeArr, int i) {
        return (Node) U.getObjectAcquire(nodeArr, (i << ASHIFT) + ABASE);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    static final <K, V> boolean casTabAt(Node<K, V>[] nodeArr, int i, Node<K, V> node, Node<K, V> node2) {
        return U.compareAndSetObject(nodeArr, (i << ASHIFT) + ABASE, node, node2);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    static final <K, V> void setTabAt(Node<K, V>[] nodeArr, int i, Node<K, V> node) {
        U.putObjectRelease(nodeArr, (i << ASHIFT) + ABASE, node);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public ConcurrentHashMap() {
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public ConcurrentHashMap(int initialCapacity) {
        this(initialCapacity, 0.75f, 1);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public ConcurrentHashMap(Map<? extends K, ? extends V> m) {
        this.sizeCtl = 16;
        putAll(m);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public ConcurrentHashMap(int initialCapacity, float loadFactor) {
        this(initialCapacity, loadFactor, 1);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public ConcurrentHashMap(int initialCapacity, float loadFactor, int concurrencyLevel) {
        if (loadFactor <= 0.0f || initialCapacity < 0 || concurrencyLevel <= 0) {
            throw new IllegalArgumentException();
        }
        long size = (long) (((initialCapacity < concurrencyLevel ? concurrencyLevel : initialCapacity) / loadFactor) + 1.0d);
        int cap = size >= 1073741824 ? 1073741824 : tableSizeFor((int) size);
        this.sizeCtl = cap;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    @Override // java.util.AbstractMap, java.util.Map
    public int size() {
        long n = sumCount();
        if (n < 0) {
            return 0;
        }
        if (n > 2147483647L) {
            return Integer.MAX_VALUE;
        }
        return (int) n;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    @Override // java.util.AbstractMap, java.util.Map
    public boolean isEmpty() {
        return sumCount() <= 0;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    @Override // java.util.AbstractMap, java.util.Map
    public V get(Object key) {
        int n;
        K ek;
        int h = spread(key.hashCode());
        Node<K, V>[] nodeArr = this.table;
        if (nodeArr != null && (n = nodeArr.length) > 0) {
            Node<K, V> tabAt = tabAt(nodeArr, (n - 1) & h);
            Node<K, V> node = tabAt;
            if (tabAt != null) {
                int eh = node.hash;
                if (eh == h) {
                    K ek2 = node.key;
                    if (ek2 == key || (ek2 != null && key.equals(ek2))) {
                        return node.val;
                    }
                } else if (eh < 0) {
                    Node<K, V> find = node.find(h, key);
                    if (find != null) {
                        return find.val;
                    }
                    return null;
                }
                while (true) {
                    Node<K, V> node2 = node.next;
                    node = node2;
                    if (node2 == null) {
                        break;
                    }
                    if (node.hash != h || ((ek = node.key) != key && (ek == null || !key.equals(ek)))) {
                    }
                }
                return node.val;
            }
        }
        return null;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    @Override // java.util.AbstractMap, java.util.Map
    public boolean containsKey(Object key) {
        return get(key) != null;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Traverser != java.util.concurrent.ConcurrentHashMap$Traverser<K, V> */
    @Override // java.util.AbstractMap, java.util.Map
    public boolean containsValue(Object value) {
        if (value == null) {
            throw new NullPointerException();
        }
        Node<K, V>[] nodeArr = this.table;
        if (nodeArr != null) {
            Traverser traverser = new Traverser(nodeArr, nodeArr.length, 0, nodeArr.length);
            while (true) {
                Node<K, V> advance = traverser.advance();
                if (advance == null) {
                    break;
                }
                V v = advance.val;
                if (v == value) {
                    return true;
                }
                if (v != null && value.equals(v)) {
                    return true;
                }
            }
        }
        return false;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    @Override // java.util.AbstractMap, java.util.Map
    public V put(K key, V value) {
        return putVal(key, value, false);
    }

    /* JADX WARN: Code restructure failed: missing block: B:78:0x00bb, code lost:
    
        addCount(1, r1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x00c0, code lost:
    
        return null;
     */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    final V putVal(K r13, V r14, boolean r15) {
        /*
            Method dump skipped, instructions count: 208
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: j$.util.concurrent.ConcurrentHashMap.putVal(java.lang.Object, java.lang.Object, boolean):java.lang.Object");
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    @Override // java.util.AbstractMap, java.util.Map
    public void putAll(Map<? extends K, ? extends V> m) {
        tryPresize(m.size());
        for (Map.Entry<? extends K, ? extends V> e : m.entrySet()) {
            putVal(e.getKey(), e.getValue(), false);
        }
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    @Override // java.util.AbstractMap, java.util.Map
    public V remove(Object key) {
        return replaceNode(key, null, null);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeBin != java.util.concurrent.ConcurrentHashMap$TreeBin<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeNode != java.util.concurrent.ConcurrentHashMap$TreeNode<K, V> */
    final V replaceNode(Object key, V value, Object cv) {
        int i;
        Node<K, V> tabAt;
        TreeNode<K, V> findTreeNode;
        Node<K, V> node;
        Object obj = key;
        int hash = spread(obj.hashCode());
        Node<K, V>[] nodeArr = this.table;
        while (nodeArr != null) {
            int n = nodeArr.length;
            if (n != 0 && (tabAt = tabAt(nodeArr, (i = (n - 1) & hash))) != null) {
                int fh = tabAt.hash;
                if (fh == -1) {
                    nodeArr = helpTransfer(nodeArr, tabAt);
                } else {
                    V oldVal = null;
                    boolean validated = false;
                    synchronized (tabAt) {
                        if (tabAt(nodeArr, i) == tabAt) {
                            if (fh >= 0) {
                                validated = true;
                                Node<K, V> node2 = tabAt;
                                Node<K, V> node3 = null;
                                do {
                                    if (node2.hash == hash) {
                                        K ek = node2.key;
                                        if (ek != obj) {
                                            if (ek != null && obj.equals(ek)) {
                                            }
                                        }
                                        V ev = node2.val;
                                        if (cv == null || cv == ev || (ev != null && cv.equals(ev))) {
                                            oldVal = ev;
                                            if (value != null) {
                                                node2.val = value;
                                            } else if (node3 != null) {
                                                node3.next = node2.next;
                                            } else {
                                                setTabAt(nodeArr, i, node2.next);
                                            }
                                        }
                                    }
                                    node3 = node2;
                                    node = node2.next;
                                    node2 = node;
                                } while (node != null);
                            } else if (tabAt instanceof TreeBin) {
                                validated = true;
                                TreeBin treeBin = (TreeBin) tabAt;
                                TreeNode<K, V> treeNode = treeBin.root;
                                if (treeNode != null && (findTreeNode = treeNode.findTreeNode(hash, obj, null)) != null) {
                                    V pv = findTreeNode.val;
                                    if (cv == null || cv == pv || (pv != null && cv.equals(pv))) {
                                        oldVal = pv;
                                        if (value != null) {
                                            findTreeNode.val = value;
                                        } else if (treeBin.removeTreeNode(findTreeNode)) {
                                            setTabAt(nodeArr, i, untreeify(treeBin.first));
                                        }
                                    }
                                }
                            } else if (tabAt instanceof ReservationNode) {
                                throw new IllegalStateException("Recursive update");
                            }
                        }
                    }
                    if (validated) {
                        if (oldVal != null) {
                            if (value == null) {
                                addCount(-1L, -1);
                            }
                            return oldVal;
                        }
                        return null;
                    }
                }
                obj = key;
            } else {
                return null;
            }
        }
        return null;
    }

    /*  JADX ERROR: JadxRuntimeException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Can't find top splitter block for handler:B:37:0x004c
        	at jadx.core.utils.BlockUtils.getTopSplitterForHandler(BlockUtils.java:1179)
        	at jadx.core.dex.visitors.regions.maker.ExcHandlersRegionMaker.collectHandlerRegions(ExcHandlersRegionMaker.java:53)
        	at jadx.core.dex.visitors.regions.maker.ExcHandlersRegionMaker.process(ExcHandlersRegionMaker.java:38)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:27)
        */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    @Override // java.util.AbstractMap, java.util.Map
    public void clear() {
        /*
            r10 = this;
            r0 = 0
            r2 = 0
            j$.util.concurrent.ConcurrentHashMap$Node<K, V>[] r3 = r10.table
        L5:
            r4 = -1
            if (r3 == 0) goto L4f
            int r5 = r3.length
            if (r2 >= r5) goto L4f
            j$.util.concurrent.ConcurrentHashMap$Node r5 = tabAt(r3, r2)
            if (r5 != 0) goto L14
            int r2 = r2 + 1
            goto L4b
        L14:
            int r6 = r5.hash
            r7 = r6
            if (r6 != r4) goto L1f
            j$.util.concurrent.ConcurrentHashMap$Node[] r3 = r10.helpTransfer(r3, r5)
            r2 = 0
            goto L4b
        L1f:
            monitor-enter(r5)
            j$.util.concurrent.ConcurrentHashMap$Node r4 = tabAt(r3, r2)     // Catch: java.lang.Throwable -> L4c
            if (r4 != r5) goto L4a
            r4 = 0
            if (r7 < 0) goto L2b
            r6 = r5
            goto L36
        L2b:
            boolean r6 = r5 instanceof j$.util.concurrent.ConcurrentHashMap.TreeBin     // Catch: java.lang.Throwable -> L4c
            if (r6 == 0) goto L35
            r6 = r5
            j$.util.concurrent.ConcurrentHashMap$TreeBin r6 = (j$.util.concurrent.ConcurrentHashMap.TreeBin) r6     // Catch: java.lang.Throwable -> L4c
            j$.util.concurrent.ConcurrentHashMap$TreeNode<K, V> r6 = r6.first     // Catch: java.lang.Throwable -> L4c
            goto L36
        L35:
            r6 = r4
        L36:
        L37:
            if (r6 == 0) goto L40
            r8 = 1
            long r0 = r0 - r8
            j$.util.concurrent.ConcurrentHashMap$Node<K, V> r8 = r6.next     // Catch: java.lang.Throwable -> L4c
            r6 = r8
            goto L37
        L40:
            int r8 = r2 + 1
            setTabAt(r3, r2, r4)     // Catch: java.lang.Throwable -> L47
            r2 = r8
            goto L4a
        L47:
            r4 = move-exception
            r2 = r8
            goto L4d
        L4a:
            monitor-exit(r5)     // Catch: java.lang.Throwable -> L4c
        L4b:
            goto L5
        L4c:
            r4 = move-exception
        L4d:
            monitor-exit(r5)     // Catch: java.lang.Throwable -> L4c
            throw r4
        L4f:
            r5 = 0
            int r5 = (r0 > r5 ? 1 : (r0 == r5 ? 0 : -1))
            if (r5 == 0) goto L58
            r10.addCount(r0, r4)
        L58:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: j$.util.concurrent.ConcurrentHashMap.clear():void");
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$KeySetView != java.util.concurrent.ConcurrentHashMap$KeySetView<K, V> */
    @Override // java.util.AbstractMap, java.util.Map
    public Set<K> keySet() {
        KeySetView<K, V> keySetView = this.keySet;
        if (keySetView != null) {
            return keySetView;
        }
        KeySetView<K, V> keySetView2 = new KeySetView<>(this, null);
        this.keySet = keySetView2;
        return keySetView2;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ValuesView != java.util.concurrent.ConcurrentHashMap$ValuesView<K, V> */
    @Override // java.util.AbstractMap, java.util.Map
    public Collection<V> values() {
        ValuesView<K, V> valuesView = this.values;
        if (valuesView != null) {
            return valuesView;
        }
        ValuesView<K, V> valuesView2 = new ValuesView<>(this);
        this.values = valuesView2;
        return valuesView2;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$EntrySetView != java.util.concurrent.ConcurrentHashMap$EntrySetView<K, V> */
    @Override // java.util.AbstractMap, java.util.Map
    public Set<Map.Entry<K, V>> entrySet() {
        EntrySetView<K, V> entrySetView = this.entrySet;
        if (entrySetView != null) {
            return entrySetView;
        }
        EntrySetView<K, V> entrySetView2 = new EntrySetView<>(this);
        this.entrySet = entrySetView2;
        return entrySetView2;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Traverser != java.util.concurrent.ConcurrentHashMap$Traverser<K, V> */
    @Override // java.util.AbstractMap, java.util.Map
    public int hashCode() {
        int h = 0;
        Node<K, V>[] nodeArr = this.table;
        if (nodeArr != null) {
            Traverser traverser = new Traverser(nodeArr, nodeArr.length, 0, nodeArr.length);
            while (true) {
                Node<K, V> advance = traverser.advance();
                if (advance == null) {
                    break;
                }
                h += advance.key.hashCode() ^ advance.val.hashCode();
            }
        }
        return h;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Traverser != java.util.concurrent.ConcurrentHashMap$Traverser<K, V> */
    @Override // java.util.AbstractMap
    public String toString() {
        Node<K, V>[] nodeArr = this.table;
        int f = nodeArr == null ? 0 : nodeArr.length;
        Traverser traverser = new Traverser(nodeArr, f, 0, f);
        StringBuilder sb = new StringBuilder();
        sb.append('{');
        Node<K, V> advance = traverser.advance();
        Node<K, V> node = advance;
        if (advance != null) {
            while (true) {
                K k = node.key;
                V v = node.val;
                sb.append(k == this ? "(this Map)" : k);
                sb.append('=');
                sb.append(v != this ? v : "(this Map)");
                Node<K, V> advance2 = traverser.advance();
                node = advance2;
                if (advance2 == null) {
                    break;
                }
                sb.append(',').append(' ');
            }
        }
        return sb.append('}').toString();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Traverser != java.util.concurrent.ConcurrentHashMap$Traverser<K, V> */
    @Override // java.util.AbstractMap, java.util.Map
    public boolean equals(Object o) {
        Object mv;
        Object v;
        if (o != this) {
            if (!(o instanceof Map)) {
                return false;
            }
            Map<?, ?> m = (Map) o;
            Node<K, V>[] nodeArr = this.table;
            int f = nodeArr == null ? 0 : nodeArr.length;
            Traverser traverser = new Traverser(nodeArr, f, 0, f);
            while (true) {
                Node<K, V> advance = traverser.advance();
                if (advance != null) {
                    V val = advance.val;
                    Object v2 = m.get(advance.key);
                    if (v2 == null || (v2 != val && !v2.equals(val))) {
                        break;
                    }
                } else {
                    for (Map.Entry<K, V> entry : m.entrySet()) {
                        Object mk = entry.getKey();
                        if (mk == null || (mv = entry.getValue()) == null || (v = get(mk)) == null || (mv != v && !mv.equals(v))) {
                            return false;
                        }
                    }
                    return true;
                }
            }
            return false;
        }
        return true;
    }

    static class Segment<K, V> extends ReentrantLock implements Serializable {
        private static final long serialVersionUID = 2249069246763182397L;
        final float loadFactor;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Segment != java.util.concurrent.ConcurrentHashMap$Segment<K, V> */
        Segment(float lf) {
            this.loadFactor = lf;
        }
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Segment[] != java.util.concurrent.ConcurrentHashMap$Segment<K, V>[] */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Traverser != java.util.concurrent.ConcurrentHashMap$Traverser<K, V> */
    private void writeObject(ObjectOutputStream s) {
        int sshift = 0;
        int ssize = 1;
        while (ssize < 16) {
            sshift++;
            ssize <<= 1;
        }
        int segmentShift = 32 - sshift;
        int segmentMask = ssize - 1;
        Segment[] segmentArr = new Segment[16];
        for (int i = 0; i < segmentArr.length; i++) {
            segmentArr[i] = new Segment(0.75f);
        }
        ObjectOutputStream.PutField streamFields = s.putFields();
        streamFields.put("segments", segmentArr);
        streamFields.put("segmentShift", segmentShift);
        streamFields.put("segmentMask", segmentMask);
        s.writeFields();
        Node<K, V>[] nodeArr = this.table;
        if (nodeArr != null) {
            Traverser traverser = new Traverser(nodeArr, nodeArr.length, 0, nodeArr.length);
            while (true) {
                Node<K, V> advance = traverser.advance();
                if (advance == null) {
                    break;
                }
                s.writeObject(advance.key);
                s.writeObject(advance.val);
            }
        }
        s.writeObject(null);
        s.writeObject(null);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeBin != java.util.concurrent.ConcurrentHashMap$TreeBin<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeNode != java.util.concurrent.ConcurrentHashMap$TreeNode<K, V> */
    private void readObject(ObjectInputStream s) {
        long j;
        long j2;
        Node<K, V> node;
        long size;
        boolean insertAtFront;
        long ts;
        K qk;
        this.sizeCtl = -1;
        s.defaultReadObject();
        long size2 = 0;
        Node<K, V> node2 = null;
        while (true) {
            Object readObject = s.readObject();
            Object readObject2 = s.readObject();
            j = 1;
            if (readObject == null || readObject2 == null) {
                break;
            }
            node2 = new Node<>(spread(readObject.hashCode()), readObject, readObject2, node2);
            size2++;
        }
        if (size2 == 0) {
            this.sizeCtl = 0;
            return;
        }
        long ts2 = (long) ((size2 / 0.75f) + 1.0d);
        int n = ts2 >= 1073741824 ? 1073741824 : tableSizeFor((int) ts2);
        Node<K, V>[] nodeArr = new Node[n];
        int mask = n - 1;
        long added = 0;
        while (node2 != null) {
            Node<K, V> node3 = node2.next;
            int h = node2.hash;
            int j3 = h & mask;
            Node<K, V> tabAt = tabAt(nodeArr, j3);
            if (tabAt == null) {
                ts = ts2;
                j2 = j;
                insertAtFront = true;
                node = tabAt;
                size = size2;
            } else {
                j2 = j;
                K k = node2.key;
                node = tabAt;
                size = size2;
                if (node.hash < 0) {
                    if (((TreeBin) node).putTreeVal(h, k, node2.val) == null) {
                        added += j2;
                    }
                    insertAtFront = false;
                    ts = ts2;
                } else {
                    int binCount = 0;
                    insertAtFront = true;
                    Node<K, V> node4 = node;
                    while (node4 != null) {
                        ts = ts2;
                        if (node4.hash == h && ((qk = node4.key) == k || (qk != null && k.equals(qk)))) {
                            insertAtFront = false;
                            break;
                        } else {
                            binCount++;
                            node4 = node4.next;
                            ts2 = ts;
                        }
                    }
                    ts = ts2;
                    if (insertAtFront && binCount >= 8) {
                        boolean insertAtFront2 = false;
                        added += j2;
                        node2.next = node;
                        TreeNode<K, V> treeNode = null;
                        Node<K, V> node5 = node2;
                        TreeNode<K, V> treeNode2 = null;
                        while (node5 != null) {
                            boolean insertAtFront3 = insertAtFront2;
                            TreeNode<K, V> treeNode3 = new TreeNode<>(node5.hash, node5.key, node5.val, null, null);
                            treeNode3.prev = treeNode2;
                            if (treeNode2 == null) {
                                treeNode = treeNode3;
                            } else {
                                treeNode2.next = treeNode3;
                            }
                            treeNode2 = treeNode3;
                            node5 = node5.next;
                            insertAtFront2 = insertAtFront3;
                        }
                        insertAtFront = insertAtFront2;
                        setTabAt(nodeArr, j3, new TreeBin(treeNode));
                    }
                }
            }
            if (insertAtFront) {
                added += j2;
                node2.next = node;
                setTabAt(nodeArr, j3, node2);
            }
            node2 = node3;
            size2 = size;
            j = j2;
            ts2 = ts;
        }
        this.table = nodeArr;
        this.sizeCtl = n - (n >>> 2);
        this.baseCount = added;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    @Override // java.util.Map, java.util.concurrent.ConcurrentMap, j$.util.Map
    public V putIfAbsent(K key, V value) {
        return putVal(key, value, true);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    @Override // java.util.Map, java.util.concurrent.ConcurrentMap, j$.util.Map
    public boolean remove(Object key, Object value) {
        if (key != null) {
            return (value == null || replaceNode(key, null, value) == null) ? false : true;
        }
        throw new NullPointerException();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    @Override // java.util.Map, java.util.concurrent.ConcurrentMap, j$.util.Map
    public boolean replace(K key, V oldValue, V newValue) {
        if (key == null || oldValue == null || newValue == null) {
            throw new NullPointerException();
        }
        return replaceNode(key, newValue, oldValue) != null;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    @Override // java.util.Map, java.util.concurrent.ConcurrentMap, j$.util.Map
    public V replace(K key, V value) {
        if (key == null || value == null) {
            throw new NullPointerException();
        }
        return replaceNode(key, value, null);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    @Override // java.util.Map, java.util.concurrent.ConcurrentMap, j$.util.concurrent.ConcurrentMap, j$.util.Map
    public V getOrDefault(Object key, V defaultValue) {
        V v = get(key);
        return v == null ? defaultValue : v;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Traverser != java.util.concurrent.ConcurrentHashMap$Traverser<K, V> */
    @Override // java.util.Map, java.util.concurrent.ConcurrentMap, j$.util.concurrent.ConcurrentMap, j$.util.Map
    public void forEach(BiConsumer<? super K, ? super V> biConsumer) {
        if (biConsumer == null) {
            throw new NullPointerException();
        }
        Node<K, V>[] nodeArr = this.table;
        if (nodeArr != null) {
            Traverser traverser = new Traverser(nodeArr, nodeArr.length, 0, nodeArr.length);
            while (true) {
                Node<K, V> advance = traverser.advance();
                if (advance != null) {
                    biConsumer.accept(advance.key, advance.val);
                } else {
                    return;
                }
            }
        }
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Traverser != java.util.concurrent.ConcurrentHashMap$Traverser<K, V> */
    @Override // java.util.Map, java.util.concurrent.ConcurrentMap, j$.util.concurrent.ConcurrentMap, j$.util.Map
    public void replaceAll(BiFunction<? super K, ? super V, ? extends V> biFunction) {
        V v;
        if (biFunction == null) {
            throw new NullPointerException();
        }
        Node<K, V>[] nodeArr = this.table;
        if (nodeArr != null) {
            Traverser traverser = new Traverser(nodeArr, nodeArr.length, 0, nodeArr.length);
            while (true) {
                Node<K, V> advance = traverser.advance();
                if (advance != null) {
                    V v2 = advance.val;
                    K k = advance.key;
                    do {
                        V apply = biFunction.apply(k, v2);
                        if (apply == null) {
                            throw new NullPointerException();
                        }
                        if (replaceNode(k, apply, v2) == null) {
                            v = get(k);
                            v2 = (Object) v;
                        }
                    } while (v != null);
                } else {
                    return;
                }
            }
        }
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Traverser != java.util.concurrent.ConcurrentHashMap$Traverser<K, V> */
    boolean removeEntryIf(Predicate<? super Map.Entry<K, V>> function) {
        if (function == null) {
            throw new NullPointerException();
        }
        boolean removed = false;
        Node<K, V>[] nodeArr = this.table;
        if (nodeArr != null) {
            Traverser traverser = new Traverser(nodeArr, nodeArr.length, 0, nodeArr.length);
            while (true) {
                Node<K, V> advance = traverser.advance();
                if (advance == null) {
                    break;
                }
                K k = advance.key;
                V v = advance.val;
                Map.Entry<K, V> e = new AbstractMap.SimpleImmutableEntry<>(k, v);
                if (function.test(e) && replaceNode(k, null, v) != null) {
                    removed = true;
                }
            }
        }
        return removed;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Traverser != java.util.concurrent.ConcurrentHashMap$Traverser<K, V> */
    boolean removeValueIf(Predicate<? super V> predicate) {
        if (predicate == null) {
            throw new NullPointerException();
        }
        boolean z = false;
        Node<K, V>[] nodeArr = this.table;
        if (nodeArr != null) {
            Traverser traverser = new Traverser(nodeArr, nodeArr.length, 0, nodeArr.length);
            while (true) {
                Node<K, V> advance = traverser.advance();
                if (advance == null) {
                    break;
                }
                K k = advance.key;
                V v = advance.val;
                if (predicate.test(v) && replaceNode(k, null, v) != null) {
                    z = true;
                }
            }
        }
        return z;
    }

    /* JADX WARN: Code restructure failed: missing block: B:84:0x00f9, code lost:
    
        if (r1 == null) goto L93;
     */
    /* JADX WARN: Code restructure failed: missing block: B:85:0x00fb, code lost:
    
        addCount(1, r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:86:0x0100, code lost:
    
        return r1;
     */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeBin != java.util.concurrent.ConcurrentHashMap$TreeBin<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeNode != java.util.concurrent.ConcurrentHashMap$TreeNode<K, V> */
    @Override // java.util.Map, java.util.concurrent.ConcurrentMap, j$.util.concurrent.ConcurrentMap, j$.util.Map
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public V computeIfAbsent(K r14, java.util.function.Function<? super K, ? extends V> r15) {
        /*
            Method dump skipped, instructions count: 272
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: j$.util.concurrent.ConcurrentHashMap.computeIfAbsent(java.lang.Object, java.util.function.Function):java.lang.Object");
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeBin != java.util.concurrent.ConcurrentHashMap$TreeBin<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeNode != java.util.concurrent.ConcurrentHashMap$TreeNode<K, V> */
    @Override // java.util.Map, java.util.concurrent.ConcurrentMap, j$.util.concurrent.ConcurrentMap, j$.util.Map
    public V computeIfPresent(K k, BiFunction<? super K, ? super V, ? extends V> biFunction) {
        TreeNode<K, V> findTreeNode;
        K k2;
        if (k == null || biFunction == null) {
            throw new NullPointerException();
        }
        int spread = spread(k.hashCode());
        V v = null;
        int i = 0;
        int i2 = 0;
        Node<K, V>[] nodeArr = this.table;
        while (true) {
            if (nodeArr != null) {
                int length = nodeArr.length;
                if (length != 0) {
                    int i3 = (length - 1) & spread;
                    Node<K, V> tabAt = tabAt(nodeArr, i3);
                    if (tabAt == null) {
                        break;
                    }
                    int i4 = tabAt.hash;
                    if (i4 == -1) {
                        nodeArr = helpTransfer(nodeArr, tabAt);
                    } else {
                        synchronized (tabAt) {
                            if (tabAt(nodeArr, i3) == tabAt) {
                                if (i4 >= 0) {
                                    i2 = 1;
                                    Node<K, V> node = tabAt;
                                    Node<K, V> node2 = null;
                                    while (true) {
                                        if (node.hash != spread || ((k2 = node.key) != k && (k2 == null || !k.equals(k2)))) {
                                            node2 = node;
                                            Node<K, V> node3 = node.next;
                                            node = node3;
                                            if (node3 == null) {
                                                break;
                                            }
                                            i2++;
                                        }
                                    }
                                    v = biFunction.apply(k, node.val);
                                    if (v != null) {
                                        node.val = v;
                                    } else {
                                        i = -1;
                                        Node<K, V> node4 = node.next;
                                        if (node2 != null) {
                                            node2.next = node4;
                                        } else {
                                            setTabAt(nodeArr, i3, node4);
                                        }
                                    }
                                } else if (tabAt instanceof TreeBin) {
                                    i2 = 2;
                                    TreeBin treeBin = (TreeBin) tabAt;
                                    TreeNode<K, V> treeNode = treeBin.root;
                                    if (treeNode != null && (findTreeNode = treeNode.findTreeNode(spread, k, null)) != null) {
                                        v = biFunction.apply(k, findTreeNode.val);
                                        if (v != null) {
                                            findTreeNode.val = v;
                                        } else {
                                            i = -1;
                                            if (treeBin.removeTreeNode(findTreeNode)) {
                                                setTabAt(nodeArr, i3, untreeify(treeBin.first));
                                            }
                                        }
                                    }
                                } else if (tabAt instanceof ReservationNode) {
                                    throw new IllegalStateException("Recursive update");
                                }
                            }
                        }
                        if (i2 != 0) {
                            break;
                        }
                    }
                }
            }
            nodeArr = initTable();
        }
        if (i != 0) {
            addCount(i, i2);
        }
        return v;
    }

    /* JADX WARN: Code restructure failed: missing block: B:77:0x00b6, code lost:
    
        r5 = r20.apply(r2, null);
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x00bb, code lost:
    
        if (r5 == null) goto L67;
     */
    /* JADX WARN: Code restructure failed: missing block: B:80:0x00bf, code lost:
    
        if (r0.next != null) goto L119;
     */
    /* JADX WARN: Code restructure failed: missing block: B:81:0x00c1, code lost:
    
        r6 = 1;
        r0.next = new j$.util.concurrent.ConcurrentHashMap.Node<>(r4, r2, r5);
     */
    /* JADX WARN: Code restructure failed: missing block: B:84:0x00d1, code lost:
    
        throw new java.lang.IllegalStateException("Recursive update");
     */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeBin != java.util.concurrent.ConcurrentHashMap$TreeBin<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeNode != java.util.concurrent.ConcurrentHashMap$TreeNode<K, V> */
    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // java.util.Map, java.util.concurrent.ConcurrentMap, j$.util.concurrent.ConcurrentMap, j$.util.Map
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public V compute(K r19, java.util.function.BiFunction<? super K, ? super V, ? extends V> r20) {
        /*
            Method dump skipped, instructions count: 327
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: j$.util.concurrent.ConcurrentHashMap.compute(java.lang.Object, java.util.function.BiFunction):java.lang.Object");
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeBin != java.util.concurrent.ConcurrentHashMap$TreeBin<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeNode != java.util.concurrent.ConcurrentHashMap$TreeNode<K, V> */
    /* JADX WARN: região duplicada removida para o bloco: B:58:0x0125 A[SYNTHETIC] */
    /* JADX WARN: região duplicada removida para o bloco: B:63:0x0144 A[SYNTHETIC] */
    /* JADX WARN: padrão de laço com múltiplas entradas não suportado (BACK_EDGE: B:59:? -> B:56:0x0139). Please report as a decompilation issue!!! */
    @Override // java.util.Map, java.util.concurrent.ConcurrentMap, j$.util.concurrent.ConcurrentMap, j$.util.Map
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public V merge(K r19, V r20, java.util.function.BiFunction<? super V, ? super V, ? extends V> r21) {
        /*
            Method dump skipped, instructions count: 334
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: j$.util.concurrent.ConcurrentHashMap.merge(java.lang.Object, java.lang.Object, java.util.function.BiFunction):java.lang.Object");
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public boolean contains(Object value) {
        return containsValue(value);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    public Enumeration<K> keys() {
        Node<K, V>[] nodeArr = this.table;
        int f = nodeArr == null ? 0 : nodeArr.length;
        return new KeyIterator(nodeArr, f, 0, f, this);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    public Enumeration<V> elements() {
        Node<K, V>[] nodeArr = this.table;
        int f = nodeArr == null ? 0 : nodeArr.length;
        return new ValueIterator(nodeArr, f, 0, f, this);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public long mappingCount() {
        long n = sumCount();
        if (n < 0) {
            return 0L;
        }
        return n;
    }

    public static <K> KeySetView<K, Boolean> newKeySet() {
        return new KeySetView<>(new ConcurrentHashMap(), Boolean.TRUE);
    }

    public static <K> KeySetView<K, Boolean> newKeySet(int initialCapacity) {
        return new KeySetView<>(new ConcurrentHashMap(initialCapacity), Boolean.TRUE);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public KeySetView<K, V> keySet(V mappedValue) {
        if (mappedValue == null) {
            throw new NullPointerException();
        }
        return new KeySetView<>(this, mappedValue);
    }

    static final class ForwardingNode<K, V> extends Node<K, V> {
        final Node<K, V>[] nextTable;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ForwardingNode != java.util.concurrent.ConcurrentHashMap$ForwardingNode<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        ForwardingNode(Node<K, V>[] nodeArr) {
            super(-1, null, null);
            this.nextTable = nodeArr;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ForwardingNode != java.util.concurrent.ConcurrentHashMap$ForwardingNode<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        @Override // j$.util.concurrent.ConcurrentHashMap.Node
        Node<K, V> find(int h, Object k) {
            int n;
            Node<K, V> node;
            K ek;
            Node<K, V>[] nodeArr = this.nextTable;
            while (k != null && nodeArr != null && (n = nodeArr.length) != 0) {
                Node<K, V> tabAt = ConcurrentHashMap.tabAt(nodeArr, (n - 1) & h);
                Node<K, V> node2 = tabAt;
                if (tabAt == null) {
                    break;
                }
                do {
                    int eh = node2.hash;
                    if (eh == h && ((ek = node2.key) == k || (ek != null && k.equals(ek)))) {
                        return node2;
                    }
                    if (eh < 0) {
                        if (node2 instanceof ForwardingNode) {
                            nodeArr = ((ForwardingNode) node2).nextTable;
                        } else {
                            return node2.find(h, k);
                        }
                    } else {
                        node = node2.next;
                        node2 = node;
                    }
                } while (node != null);
                return null;
            }
            return null;
        }
    }

    static final class ReservationNode<K, V> extends Node<K, V> {
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ReservationNode != java.util.concurrent.ConcurrentHashMap$ReservationNode<K, V> */
        ReservationNode() {
            super(-3, null, null);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ReservationNode != java.util.concurrent.ConcurrentHashMap$ReservationNode<K, V> */
        @Override // j$.util.concurrent.ConcurrentHashMap.Node
        Node<K, V> find(int h, Object k) {
            return null;
        }
    }

    static final int resizeStamp(int n) {
        return Integer.numberOfLeadingZeros(n) | 32768;
    }

    /* JADX WARN: Code restructure failed: missing block: B:7:0x003c, code lost:
    
        return r1;
     */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final j$.util.concurrent.ConcurrentHashMap.Node<K, V>[] initTable() {
        /*
            r8 = this;
        L1:
            j$.util.concurrent.ConcurrentHashMap$Node<K, V>[] r0 = r8.table
            r1 = r0
            if (r0 == 0) goto Lc
            int r0 = r1.length
            if (r0 != 0) goto La
            goto Lc
        La:
            r3 = r8
            goto L3c
        Lc:
            int r0 = r8.sizeCtl
            r6 = r0
            if (r0 >= 0) goto L15
            java.lang.Thread.yield()
            goto L1
        L15:
            j$.sun.misc.DesugarUnsafe r2 = j$.util.concurrent.ConcurrentHashMap.U
            long r4 = j$.util.concurrent.ConcurrentHashMap.SIZECTL
            r7 = -1
            r3 = r8
            boolean r0 = r2.compareAndSetInt(r3, r4, r6, r7)
            if (r0 == 0) goto L1
            j$.util.concurrent.ConcurrentHashMap$Node<K, V>[] r0 = r3.table     // Catch: java.lang.Throwable -> L3d
            r1 = r0
            if (r0 == 0) goto L29
            int r0 = r1.length     // Catch: java.lang.Throwable -> L3d
            if (r0 != 0) goto L38
        L29:
            if (r6 <= 0) goto L2d
            r0 = r6
            goto L2f
        L2d:
            r0 = 16
        L2f:
            j$.util.concurrent.ConcurrentHashMap$Node[] r2 = new j$.util.concurrent.ConcurrentHashMap.Node[r0]     // Catch: java.lang.Throwable -> L3d
            r1 = r2
            r3.table = r2     // Catch: java.lang.Throwable -> L3d
            int r4 = r0 >>> 2
            int r6 = r0 - r4
        L38:
            r3.sizeCtl = r6
        L3c:
            return r1
        L3d:
            r0 = move-exception
            r3.sizeCtl = r6
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: j$.util.concurrent.ConcurrentHashMap.initTable():j$.util.concurrent.ConcurrentHashMap$Node[]");
    }

    /* JADX WARN: Code restructure failed: missing block: B:38:?, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:4:0x0019, code lost:
    
        if (r0.compareAndSetLong(r22, r2, r4, r6) == false) goto L6;
     */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final void addCount(long r23, int r25) {
        /*
            r22 = this;
            r1 = r22
            r8 = r23
            r10 = r25
            j$.util.concurrent.ConcurrentHashMap$CounterCell[] r0 = r1.counterCells
            r11 = r0
            if (r0 != 0) goto L1b
            j$.sun.misc.DesugarUnsafe r0 = j$.util.concurrent.ConcurrentHashMap.U
            long r2 = j$.util.concurrent.ConcurrentHashMap.BASECOUNT
            long r4 = r1.baseCount
            r12 = r4
            long r6 = r12 + r8
            r14 = r6
            boolean r0 = r0.compareAndSetLong(r1, r2, r4, r6)
            if (r0 != 0) goto L4a
        L1b:
            r0 = 1
            if (r11 == 0) goto Lb0
            int r2 = r11.length
            r3 = 1
            int r2 = r2 - r3
            r4 = r2
            if (r2 < 0) goto Lb0
            int r2 = j$.util.concurrent.ThreadLocalRandom.getProbe()
            r2 = r2 & r4
            r2 = r11[r2]
            r13 = r2
            if (r2 == 0) goto Lb0
            j$.sun.misc.DesugarUnsafe r12 = j$.util.concurrent.ConcurrentHashMap.U
            long r14 = j$.util.concurrent.ConcurrentHashMap.CELLVALUE
            long r5 = r13.value
            r20 = r5
            long r18 = r20 + r8
            r16 = r5
            boolean r2 = r12.compareAndSetLong(r13, r14, r16, r18)
            r0 = r2
            if (r2 != 0) goto L43
            goto Lb0
        L43:
            if (r10 > r3) goto L46
            return
        L46:
            long r14 = r1.sumCount()
        L4a:
            if (r10 < 0) goto Laf
        L4c:
            int r4 = r1.sizeCtl
            r0 = r4
            long r2 = (long) r4
            int r2 = (r14 > r2 ? 1 : (r14 == r2 ? 0 : -1))
            if (r2 < 0) goto Lae
            j$.util.concurrent.ConcurrentHashMap$Node<K, V>[] r2 = r1.table
            r6 = r2
            if (r2 == 0) goto Lac
            int r2 = r6.length
            r7 = r2
            r3 = 1073741824(0x40000000, float:2.0)
            if (r2 >= r3) goto Laa
            int r12 = resizeStamp(r7)
            if (r0 >= 0) goto L92
            int r2 = r0 >>> 16
            if (r2 != r12) goto L90
            int r2 = r12 + 1
            if (r0 == r2) goto L90
            r2 = 65535(0xffff, float:9.1834E-41)
            int r2 = r2 + r12
            if (r0 == r2) goto L90
            j$.util.concurrent.ConcurrentHashMap$Node<K, V>[] r2 = r1.nextTable
            r13 = r2
            if (r2 == 0) goto L8e
            int r2 = r1.transferIndex
            if (r2 > 0) goto L7d
            goto Laf
        L7d:
            r4 = r0
            j$.sun.misc.DesugarUnsafe r0 = j$.util.concurrent.ConcurrentHashMap.U
            long r2 = j$.util.concurrent.ConcurrentHashMap.SIZECTL
            int r5 = r4 + 1
            boolean r0 = r0.compareAndSetInt(r1, r2, r4, r5)
            if (r0 == 0) goto La5
            r1.transfer(r6, r13)
            goto La5
        L8e:
            r4 = r0
            goto Laf
        L90:
            r4 = r0
            goto Laf
        L92:
            r4 = r0
            j$.sun.misc.DesugarUnsafe r0 = j$.util.concurrent.ConcurrentHashMap.U
            long r2 = j$.util.concurrent.ConcurrentHashMap.SIZECTL
            int r5 = r12 << 16
            int r5 = r5 + 2
            boolean r0 = r0.compareAndSetInt(r1, r2, r4, r5)
            if (r0 == 0) goto La5
            r0 = 0
            r1.transfer(r6, r0)
        La5:
            long r14 = r1.sumCount()
            goto L4c
        Laa:
            r4 = r0
            goto Laf
        Lac:
            r4 = r0
            goto Laf
        Lae:
            r4 = r0
        Laf:
            return
        Lb0:
            r1.fullAddCount(r8, r0)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: j$.util.concurrent.ConcurrentHashMap.addCount(long, int):void");
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    final Node<K, V>[] helpTransfer(Node<K, V>[] nodeArr, Node<K, V> node) {
        ConcurrentHashMap<K, V> concurrentHashMap;
        if (nodeArr == null || !(node instanceof ForwardingNode)) {
            concurrentHashMap = this;
        } else {
            Node<K, V>[] nodeArr2 = ((ForwardingNode) node).nextTable;
            if (nodeArr2 == null) {
                concurrentHashMap = this;
            } else {
                int rs = resizeStamp(nodeArr.length);
                while (nodeArr2 == this.nextTable && this.table == nodeArr) {
                    int sc = this.sizeCtl;
                    if (sc < 0) {
                        if ((sc >>> 16) == rs && sc != rs + 1 && sc != 65535 + rs) {
                            if (this.transferIndex <= 0) {
                                break;
                            }
                            if (U.compareAndSetInt(this, SIZECTL, sc, sc + 1)) {
                                transfer(nodeArr, nodeArr2);
                                break;
                            }
                        } else {
                            break;
                        }
                    } else {
                        break;
                    }
                }
                return nodeArr2;
            }
        }
        return concurrentHashMap.table;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    private final void tryPresize(int size) {
        ConcurrentHashMap<K, V> concurrentHashMap;
        int c = size >= 536870912 ? 1073741824 : tableSizeFor((size >>> 1) + size + 1);
        while (true) {
            int i = this.sizeCtl;
            int sc = i;
            if (i >= 0) {
                Node<K, V>[] nodeArr = this.table;
                if (nodeArr != null) {
                    int n = nodeArr.length;
                    if (n != 0) {
                        if (c > sc && n < 1073741824) {
                            if (nodeArr == this.table) {
                                int rs = resizeStamp(n);
                                if (U.compareAndSetInt(this, SIZECTL, sc, (rs << 16) + 2)) {
                                    transfer(nodeArr, null);
                                }
                            }
                        }
                        return;
                    }
                    concurrentHashMap = this;
                } else {
                    concurrentHashMap = this;
                }
                int n2 = sc > c ? sc : c;
                if (U.compareAndSetInt(concurrentHashMap, SIZECTL, sc, -1)) {
                    try {
                        if (concurrentHashMap.table == nodeArr) {
                            concurrentHashMap.table = new Node[n2];
                            sc = n2 - (n2 >>> 2);
                        }
                    } finally {
                        concurrentHashMap.sizeCtl = sc;
                    }
                } else {
                    continue;
                }
            } else {
                return;
            }
        }
    }

    /*  JADX ERROR: JadxRuntimeException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Can't find top splitter block for handler:B:65:0x022c
        	at jadx.core.utils.BlockUtils.getTopSplitterForHandler(BlockUtils.java:1179)
        	at jadx.core.dex.visitors.regions.maker.ExcHandlersRegionMaker.collectHandlerRegions(ExcHandlersRegionMaker.java:53)
        	at jadx.core.dex.visitors.regions.maker.ExcHandlersRegionMaker.process(ExcHandlersRegionMaker.java:38)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:27)
        */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ForwardingNode != java.util.concurrent.ConcurrentHashMap$ForwardingNode<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeBin != java.util.concurrent.ConcurrentHashMap$TreeBin<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeNode != java.util.concurrent.ConcurrentHashMap$TreeNode<K, V> */
    private final void transfer(j$.util.concurrent.ConcurrentHashMap.Node<K, V>[] r31, j$.util.concurrent.ConcurrentHashMap.Node<K, V>[] r32) {
        /*
            Method dump skipped, instructions count: 636
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: j$.util.concurrent.ConcurrentHashMap.transfer(j$.util.concurrent.ConcurrentHashMap$Node[], j$.util.concurrent.ConcurrentHashMap$Node[]):void");
    }

    static final class CounterCell {
        volatile long value;

        CounterCell(long x) {
            this.value = x;
        }
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    final long sumCount() {
        CounterCell[] cs = this.counterCells;
        long sum = this.baseCount;
        if (cs != null) {
            for (CounterCell c : cs) {
                if (c != null) {
                    sum += c.value;
                }
            }
        }
        return sum;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    private final void fullAddCount(long x, boolean wasUncontended) {
        boolean wasUncontended2;
        int n;
        int m;
        ConcurrentHashMap<K, V> concurrentHashMap = this;
        int probe = ThreadLocalRandom.getProbe();
        int h = probe;
        if (probe != 0) {
            wasUncontended2 = wasUncontended;
        } else {
            ThreadLocalRandom.localInit();
            h = ThreadLocalRandom.getProbe();
            wasUncontended2 = true;
        }
        boolean wasUncontended3 = wasUncontended2;
        int h2 = h;
        boolean collide = false;
        while (true) {
            CounterCell[] cs = concurrentHashMap.counterCells;
            if (cs != null && (n = cs.length) > 0) {
                CounterCell c = cs[(n - 1) & h2];
                if (c == null) {
                    if (concurrentHashMap.cellsBusy == 0) {
                        CounterCell r = new CounterCell(x);
                        if (concurrentHashMap.cellsBusy == 0 && U.compareAndSetInt(concurrentHashMap, CELLSBUSY, 0, 1)) {
                            boolean created = false;
                            try {
                                CounterCell[] rs = concurrentHashMap.counterCells;
                                if (rs != null && (m = rs.length) > 0) {
                                    int j = (m - 1) & h2;
                                    if (rs[j] == null) {
                                        rs[j] = r;
                                        created = true;
                                    }
                                }
                                if (created) {
                                    return;
                                }
                            } finally {
                            }
                        }
                    }
                    collide = false;
                    h2 = ThreadLocalRandom.advanceProbe(h2);
                } else {
                    if (!wasUncontended3) {
                        wasUncontended3 = true;
                    } else {
                        DesugarUnsafe desugarUnsafe = U;
                        long j2 = CELLVALUE;
                        long v = c.value;
                        if (!desugarUnsafe.compareAndSetLong(c, j2, v, v + x)) {
                            if (concurrentHashMap.counterCells != cs || n >= NCPU) {
                                collide = false;
                            } else if (!collide) {
                                collide = true;
                            } else if (concurrentHashMap.cellsBusy == 0 && U.compareAndSetInt(concurrentHashMap, CELLSBUSY, 0, 1)) {
                                try {
                                    if (concurrentHashMap.counterCells == cs) {
                                        concurrentHashMap.counterCells = (CounterCell[]) Arrays.copyOf(cs, n << 1);
                                    }
                                    concurrentHashMap.cellsBusy = 0;
                                    collide = false;
                                } finally {
                                }
                            }
                        } else {
                            return;
                        }
                    }
                    h2 = ThreadLocalRandom.advanceProbe(h2);
                }
            } else {
                int h3 = concurrentHashMap.cellsBusy;
                if (h3 == 0 && concurrentHashMap.counterCells == cs && U.compareAndSetInt(concurrentHashMap, CELLSBUSY, 0, 1)) {
                    boolean init = false;
                    try {
                        if (concurrentHashMap.counterCells == cs) {
                            CounterCell[] rs2 = new CounterCell[2];
                            rs2[h2 & 1] = new CounterCell(x);
                            concurrentHashMap.counterCells = rs2;
                            init = true;
                        }
                        if (init) {
                            return;
                        }
                    } finally {
                    }
                } else {
                    DesugarUnsafe desugarUnsafe2 = U;
                    long j3 = BASECOUNT;
                    long v2 = concurrentHashMap.baseCount;
                    if (desugarUnsafe2.compareAndSetLong(concurrentHashMap, j3, v2, v2 + x)) {
                        return;
                    }
                }
            }
            concurrentHashMap = this;
        }
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeNode != java.util.concurrent.ConcurrentHashMap$TreeNode<K, V> */
    private final void treeifyBin(Node<K, V>[] nodeArr, int index) {
        if (nodeArr != null) {
            int n = nodeArr.length;
            if (n < 64) {
                tryPresize(n << 1);
                return;
            }
            Node<K, V> tabAt = tabAt(nodeArr, index);
            if (tabAt != null && tabAt.hash >= 0) {
                synchronized (tabAt) {
                    if (tabAt(nodeArr, index) == tabAt) {
                        TreeNode<K, V> treeNode = null;
                        TreeNode<K, V> treeNode2 = null;
                        for (Node<K, V> node = tabAt; node != null; node = node.next) {
                            TreeNode<K, V> treeNode3 = new TreeNode<>(node.hash, node.key, node.val, null, null);
                            treeNode3.prev = treeNode2;
                            if (treeNode2 == null) {
                                treeNode = treeNode3;
                            } else {
                                treeNode2.next = treeNode3;
                            }
                            treeNode2 = treeNode3;
                        }
                        setTabAt(nodeArr, index, new TreeBin(treeNode));
                    }
                }
            }
        }
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
    static <K, V> Node<K, V> untreeify(Node<K, V> node) {
        Node<K, V> node2 = null;
        Node<K, V> node3 = null;
        for (Node<K, V> node4 = node; node4 != null; node4 = node4.next) {
            Node<K, V> node5 = new Node<>(node4.hash, node4.key, node4.val);
            if (node3 == null) {
                node2 = node5;
            } else {
                node3.next = node5;
            }
            node3 = node5;
        }
        return node2;
    }

    static final class TreeNode<K, V> extends Node<K, V> {
        TreeNode<K, V> left;
        TreeNode<K, V> parent;
        TreeNode<K, V> prev;
        boolean red;
        TreeNode<K, V> right;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeNode != java.util.concurrent.ConcurrentHashMap$TreeNode<K, V> */
        TreeNode(int hash, K key, V val, Node<K, V> node, TreeNode<K, V> treeNode) {
            super(hash, key, val, node);
            this.parent = treeNode;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeNode != java.util.concurrent.ConcurrentHashMap$TreeNode<K, V> */
        @Override // j$.util.concurrent.ConcurrentHashMap.Node
        Node<K, V> find(int h, Object k) {
            return findTreeNode(h, k, null);
        }

        /* JADX WARN: Code restructure failed: missing block: B:30:0x002f, code lost:
        
            if (r3 != null) goto L22;
         */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeNode != java.util.concurrent.ConcurrentHashMap$TreeNode<K, V> */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        final j$.util.concurrent.ConcurrentHashMap.TreeNode<K, V> findTreeNode(int r8, java.lang.Object r9, java.lang.Class<?> r10) {
            /*
                r7 = this;
                if (r9 == 0) goto L4c
                r0 = r7
            L3:
                j$.util.concurrent.ConcurrentHashMap$TreeNode<K, V> r1 = r0.left
                j$.util.concurrent.ConcurrentHashMap$TreeNode<K, V> r2 = r0.right
                int r3 = r0.hash
                r4 = r3
                if (r3 <= r8) goto Le
                r0 = r1
                goto L48
            Le:
                if (r4 >= r8) goto L12
                r0 = r2
                goto L48
            L12:
                K r3 = r0.key
                r5 = r3
                if (r3 == r9) goto L4b
                if (r5 == 0) goto L20
                boolean r3 = r9.equals(r5)
                if (r3 == 0) goto L20
                goto L4b
            L20:
                if (r1 != 0) goto L24
                r0 = r2
                goto L48
            L24:
                if (r2 != 0) goto L28
                r0 = r1
                goto L48
            L28:
                if (r10 != 0) goto L31
                java.lang.Class r3 = j$.util.concurrent.ConcurrentHashMap.comparableClassFor(r9)
                r10 = r3
                if (r3 == 0) goto L3f
            L31:
                int r3 = j$.util.concurrent.ConcurrentHashMap.compareComparables(r10, r9, r5)
                r6 = r3
                if (r3 == 0) goto L3f
                if (r6 >= 0) goto L3c
                r3 = r1
                goto L3d
            L3c:
                r3 = r2
            L3d:
                r0 = r3
                goto L48
            L3f:
                j$.util.concurrent.ConcurrentHashMap$TreeNode r3 = r2.findTreeNode(r8, r9, r10)
                r6 = r3
                if (r3 == 0) goto L47
                return r6
            L47:
                r0 = r1
            L48:
                if (r0 != 0) goto L3
                goto L4c
            L4b:
                return r0
            L4c:
                r0 = 0
                return r0
            */
            throw new UnsupportedOperationException("Method not decompiled: j$.util.concurrent.ConcurrentHashMap.TreeNode.findTreeNode(int, java.lang.Object, java.lang.Class):j$.util.concurrent.ConcurrentHashMap$TreeNode");
        }
    }

    static final class TreeBin<K, V> extends Node<K, V> {
        static final /* sintético */ boolean $assertionsDisabled = false;
        static final int READER = 4;
        static final int WAITER = 2;
        static final int WRITER = 1;
        volatile TreeNode<K, V> first;
        volatile int lockState;
        TreeNode<K, V> root;
        volatile Thread waiter;
        private static final DesugarUnsafe U = DesugarUnsafe.getUnsafe();
        private static final long LOCKSTATE = U.objectFieldOffset(TreeBin.class, "lockState");

        static int tieBreakOrder(Object a, Object b) {
            int d;
            if (a != null && b != null && (d = a.getClass().getName().compareTo(b.getClass().getName())) != 0) {
                return d;
            }
            int d2 = System.identityHashCode(a) <= System.identityHashCode(b) ? -1 : 1;
            return d2;
        }

        /* JADX WARN: Code restructure failed: missing block: B:30:0x0036, code lost:
        
            if (r9 != null) goto L16;
         */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeBin != java.util.concurrent.ConcurrentHashMap$TreeBin<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeNode != java.util.concurrent.ConcurrentHashMap$TreeNode<K, V> */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        TreeBin(j$.util.concurrent.ConcurrentHashMap.TreeNode<K, V> r14) {
            /*
                r13 = this;
                r0 = -2
                r1 = 0
                r13.<init>(r0, r1, r1)
                r13.first = r14
                r0 = 0
                r2 = r14
            L9:
                if (r2 == 0) goto L61
                j$.util.concurrent.ConcurrentHashMap$Node<K, V> r3 = r2.next
                j$.util.concurrent.ConcurrentHashMap$TreeNode r3 = (j$.util.concurrent.ConcurrentHashMap.TreeNode) r3
                r2.right = r1
                r2.left = r1
                if (r0 != 0) goto L1c
                r2.parent = r1
                r4 = 0
                r2.red = r4
                r0 = r2
                goto L5e
            L1c:
                K r4 = r2.key
                int r5 = r2.hash
                r6 = 0
                r7 = r0
            L22:
                K r8 = r7.key
                int r9 = r7.hash
                r10 = r9
                if (r9 <= r5) goto L2b
                r9 = -1
                goto L45
            L2b:
                if (r10 >= r5) goto L2f
                r9 = 1
                goto L45
            L2f:
                if (r6 != 0) goto L38
                java.lang.Class r9 = j$.util.concurrent.ConcurrentHashMap.comparableClassFor(r4)
                r6 = r9
                if (r9 == 0) goto L3f
            L38:
                int r9 = j$.util.concurrent.ConcurrentHashMap.compareComparables(r6, r4, r8)
                r11 = r9
                if (r9 != 0) goto L44
            L3f:
                int r9 = tieBreakOrder(r4, r8)
                goto L45
            L44:
                r9 = r11
            L45:
                r11 = r7
                if (r9 > 0) goto L4b
                j$.util.concurrent.ConcurrentHashMap$TreeNode<K, V> r12 = r7.left
                goto L4d
            L4b:
                j$.util.concurrent.ConcurrentHashMap$TreeNode<K, V> r12 = r7.right
            L4d:
                r7 = r12
                if (r12 != 0) goto L60
                r2.parent = r11
                if (r9 > 0) goto L57
                r11.left = r2
                goto L59
            L57:
                r11.right = r2
            L59:
                j$.util.concurrent.ConcurrentHashMap$TreeNode r0 = balanceInsertion(r0, r2)
            L5e:
                r2 = r3
                goto L9
            L60:
                goto L22
            L61:
                r13.root = r0
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: j$.util.concurrent.ConcurrentHashMap.TreeBin.<init>(j$.util.concurrent.ConcurrentHashMap$TreeNode):void");
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeBin != java.util.concurrent.ConcurrentHashMap$TreeBin<K, V> */
        private final void lockRoot() {
            if (!U.compareAndSetInt(this, LOCKSTATE, 0, 1)) {
                contendedLock();
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeBin != java.util.concurrent.ConcurrentHashMap$TreeBin<K, V> */
        private final void unlockRoot() {
            this.lockState = 0;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeBin != java.util.concurrent.ConcurrentHashMap$TreeBin<K, V> */
        private final void contendedLock() {
            boolean waiting = false;
            while (true) {
                int s = this.lockState;
                if ((s & (-3)) == 0) {
                    if (U.compareAndSetInt(this, LOCKSTATE, s, 1)) {
                        break;
                    }
                } else if ((s & 2) == 0) {
                    if (U.compareAndSetInt(this, LOCKSTATE, s, s | 2)) {
                        waiting = true;
                        this.waiter = Thread.currentThread();
                    }
                } else if (waiting) {
                    LockSupport.park(this);
                }
            }
            if (waiting) {
                this.waiter = null;
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeBin != java.util.concurrent.ConcurrentHashMap$TreeBin<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeNode != java.util.concurrent.ConcurrentHashMap$TreeNode<K, V> */
        @Override // j$.util.concurrent.ConcurrentHashMap.Node
        final Node<K, V> find(int h, Object k) {
            K ek;
            Thread w;
            TreeNode<K, V> treeNode = null;
            if (k != null) {
                Node<K, V> node = this.first;
                while (node != null) {
                    int s = this.lockState;
                    if ((s & 3) != 0) {
                        if (node.hash == h && ((ek = node.key) == k || (ek != null && k.equals(ek)))) {
                            return node;
                        }
                        node = node.next;
                    } else if (U.compareAndSetInt(this, LOCKSTATE, s, s + 4)) {
                        try {
                            TreeNode<K, V> treeNode2 = this.root;
                            if (treeNode2 != null) {
                                treeNode = treeNode2.findTreeNode(h, k, null);
                            }
                            return treeNode;
                        } finally {
                            if (U.getAndAddInt(this, LOCKSTATE, -4) == 6 && (w = this.waiter) != null) {
                                LockSupport.unpark(w);
                            }
                        }
                    }
                }
            }
            return null;
        }

        /* JADX WARN: Code restructure failed: missing block: B:45:0x0040, code lost:
        
            if (r1 != null) goto L19;
         */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeBin != java.util.concurrent.ConcurrentHashMap$TreeBin<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeNode != java.util.concurrent.ConcurrentHashMap$TreeNode<K, V> */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        final j$.util.concurrent.ConcurrentHashMap.TreeNode<K, V> putTreeVal(int r13, K r14, V r15) {
            /*
                Method dump skipped, instructions count: 186
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: j$.util.concurrent.ConcurrentHashMap.TreeBin.putTreeVal(int, java.lang.Object, java.lang.Object):j$.util.concurrent.ConcurrentHashMap$TreeNode");
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeBin != java.util.concurrent.ConcurrentHashMap$TreeBin<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeNode != java.util.concurrent.ConcurrentHashMap$TreeNode<K, V> */
        final boolean removeTreeNode(TreeNode<K, V> treeNode) {
            TreeNode<K, V> treeNode2;
            TreeNode<K, V> treeNode3;
            TreeNode<K, V> treeNode4;
            TreeNode<K, V> treeNode5 = (TreeNode) treeNode.next;
            TreeNode<K, V> treeNode6 = treeNode.prev;
            if (treeNode6 == null) {
                this.first = treeNode5;
            } else {
                treeNode6.next = treeNode5;
            }
            if (treeNode5 != null) {
                treeNode5.prev = treeNode6;
            }
            if (this.first == null) {
                this.root = null;
                return true;
            }
            TreeNode<K, V> treeNode7 = this.root;
            TreeNode<K, V> treeNode8 = treeNode7;
            if (treeNode7 == null || treeNode8.right == null || (treeNode2 = treeNode8.left) == null || treeNode2.left == null) {
                return true;
            }
            lockRoot();
            try {
                TreeNode<K, V> treeNode9 = treeNode.left;
                TreeNode<K, V> treeNode10 = treeNode.right;
                if (treeNode9 != null && treeNode10 != null) {
                    TreeNode<K, V> treeNode11 = treeNode10;
                    while (true) {
                        TreeNode<K, V> treeNode12 = treeNode11.left;
                        if (treeNode12 == null) {
                            break;
                        }
                        treeNode11 = treeNode12;
                    }
                    boolean c = treeNode11.red;
                    treeNode11.red = treeNode.red;
                    treeNode.red = c;
                    TreeNode<K, V> treeNode13 = treeNode11.right;
                    TreeNode<K, V> treeNode14 = treeNode.parent;
                    if (treeNode11 == treeNode10) {
                        treeNode.parent = treeNode11;
                        treeNode11.right = treeNode;
                    } else {
                        TreeNode<K, V> treeNode15 = treeNode11.parent;
                        treeNode.parent = treeNode15;
                        if (treeNode15 != null) {
                            if (treeNode11 == treeNode15.left) {
                                treeNode15.left = treeNode;
                            } else {
                                treeNode15.right = treeNode;
                            }
                        }
                        treeNode11.right = treeNode10;
                        if (treeNode10 != null) {
                            treeNode10.parent = treeNode11;
                        }
                    }
                    treeNode.left = null;
                    treeNode.right = treeNode13;
                    if (treeNode13 != null) {
                        treeNode13.parent = treeNode;
                    }
                    treeNode11.left = treeNode9;
                    if (treeNode9 != null) {
                        treeNode9.parent = treeNode11;
                    }
                    treeNode11.parent = treeNode14;
                    if (treeNode14 == null) {
                        treeNode8 = treeNode11;
                    } else if (treeNode == treeNode14.left) {
                        treeNode14.left = treeNode11;
                    } else {
                        treeNode14.right = treeNode11;
                    }
                    if (treeNode13 != null) {
                        treeNode3 = treeNode13;
                    } else {
                        treeNode3 = treeNode;
                    }
                } else if (treeNode9 != null) {
                    treeNode3 = treeNode9;
                } else if (treeNode10 != null) {
                    treeNode3 = treeNode10;
                } else {
                    treeNode3 = treeNode;
                }
                if (treeNode3 != treeNode) {
                    TreeNode<K, V> treeNode16 = treeNode.parent;
                    treeNode3.parent = treeNode16;
                    if (treeNode16 == null) {
                        treeNode8 = treeNode3;
                    } else if (treeNode == treeNode16.left) {
                        treeNode16.left = treeNode3;
                    } else {
                        treeNode16.right = treeNode3;
                    }
                    treeNode.parent = null;
                    treeNode.right = null;
                    treeNode.left = null;
                }
                this.root = treeNode.red ? treeNode8 : balanceDeletion(treeNode8, treeNode3);
                if (treeNode == treeNode3 && (treeNode4 = treeNode.parent) != null) {
                    if (treeNode == treeNode4.left) {
                        treeNode4.left = null;
                    } else if (treeNode == treeNode4.right) {
                        treeNode4.right = null;
                    }
                    treeNode.parent = null;
                }
                unlockRoot();
                return false;
            } catch (Throwable th) {
                unlockRoot();
                throw th;
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeNode != java.util.concurrent.ConcurrentHashMap$TreeNode<K, V> */
        static <K, V> TreeNode<K, V> rotateLeft(TreeNode<K, V> treeNode, TreeNode<K, V> treeNode2) {
            TreeNode<K, V> treeNode3;
            if (treeNode2 != null && (treeNode3 = treeNode2.right) != null) {
                TreeNode<K, V> treeNode4 = treeNode3.left;
                treeNode2.right = treeNode4;
                if (treeNode4 != null) {
                    treeNode4.parent = treeNode2;
                }
                TreeNode<K, V> treeNode5 = treeNode2.parent;
                treeNode3.parent = treeNode5;
                if (treeNode5 == null) {
                    treeNode = treeNode3;
                    treeNode3.red = false;
                } else if (treeNode5.left == treeNode2) {
                    treeNode5.left = treeNode3;
                } else {
                    treeNode5.right = treeNode3;
                }
                treeNode3.left = treeNode2;
                treeNode2.parent = treeNode3;
            }
            return treeNode;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeNode != java.util.concurrent.ConcurrentHashMap$TreeNode<K, V> */
        static <K, V> TreeNode<K, V> rotateRight(TreeNode<K, V> treeNode, TreeNode<K, V> treeNode2) {
            TreeNode<K, V> treeNode3;
            if (treeNode2 != null && (treeNode3 = treeNode2.left) != null) {
                TreeNode<K, V> treeNode4 = treeNode3.right;
                treeNode2.left = treeNode4;
                if (treeNode4 != null) {
                    treeNode4.parent = treeNode2;
                }
                TreeNode<K, V> treeNode5 = treeNode2.parent;
                treeNode3.parent = treeNode5;
                if (treeNode5 == null) {
                    treeNode = treeNode3;
                    treeNode3.red = false;
                } else if (treeNode5.right == treeNode2) {
                    treeNode5.right = treeNode3;
                } else {
                    treeNode5.left = treeNode3;
                }
                treeNode3.right = treeNode2;
                treeNode2.parent = treeNode3;
            }
            return treeNode;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeNode != java.util.concurrent.ConcurrentHashMap$TreeNode<K, V> */
        static <K, V> TreeNode<K, V> balanceInsertion(TreeNode<K, V> treeNode, TreeNode<K, V> treeNode2) {
            treeNode2.red = true;
            while (true) {
                TreeNode<K, V> treeNode3 = treeNode2.parent;
                TreeNode<K, V> treeNode4 = treeNode3;
                if (treeNode3 == null) {
                    treeNode2.red = false;
                    return treeNode2;
                }
                if (!treeNode4.red) {
                    break;
                }
                TreeNode<K, V> treeNode5 = treeNode4.parent;
                TreeNode<K, V> treeNode6 = treeNode5;
                if (treeNode5 == null) {
                    break;
                }
                TreeNode<K, V> treeNode7 = treeNode6.left;
                if (treeNode4 == treeNode7) {
                    TreeNode<K, V> treeNode8 = treeNode6.right;
                    if (treeNode8 != null && treeNode8.red) {
                        treeNode8.red = false;
                        treeNode4.red = false;
                        treeNode6.red = true;
                        treeNode2 = treeNode6;
                    } else {
                        if (treeNode2 == treeNode4.right) {
                            treeNode2 = treeNode4;
                            treeNode = rotateLeft(treeNode, treeNode4);
                            TreeNode<K, V> treeNode9 = treeNode2.parent;
                            treeNode4 = treeNode9;
                            treeNode6 = treeNode9 != null ? treeNode4.parent : null;
                        }
                        if (treeNode4 != null) {
                            treeNode4.red = false;
                            if (treeNode6 != null) {
                                treeNode6.red = true;
                                treeNode = rotateRight(treeNode, treeNode6);
                            }
                        }
                    }
                } else if (treeNode7 != null && treeNode7.red) {
                    treeNode7.red = false;
                    treeNode4.red = false;
                    treeNode6.red = true;
                    treeNode2 = treeNode6;
                } else {
                    if (treeNode2 == treeNode4.left) {
                        treeNode2 = treeNode4;
                        treeNode = rotateRight(treeNode, treeNode4);
                        TreeNode<K, V> treeNode10 = treeNode2.parent;
                        treeNode4 = treeNode10;
                        treeNode6 = treeNode10 != null ? treeNode4.parent : null;
                    }
                    if (treeNode4 != null) {
                        treeNode4.red = false;
                        if (treeNode6 != null) {
                            treeNode6.red = true;
                            treeNode = rotateLeft(treeNode, treeNode6);
                        }
                    }
                }
            }
            return treeNode;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeNode != java.util.concurrent.ConcurrentHashMap$TreeNode<K, V> */
        static <K, V> TreeNode<K, V> balanceDeletion(TreeNode<K, V> treeNode, TreeNode<K, V> treeNode2) {
            while (treeNode2 != null && treeNode2 != treeNode) {
                TreeNode<K, V> treeNode3 = treeNode2.parent;
                TreeNode<K, V> treeNode4 = treeNode3;
                if (treeNode3 == null) {
                    treeNode2.red = false;
                    return treeNode2;
                }
                if (treeNode2.red) {
                    treeNode2.red = false;
                    return treeNode;
                }
                TreeNode<K, V> treeNode5 = treeNode4.left;
                TreeNode<K, V> treeNode6 = treeNode5;
                if (treeNode5 == treeNode2) {
                    TreeNode<K, V> treeNode7 = treeNode4.right;
                    TreeNode<K, V> treeNode8 = treeNode7;
                    if (treeNode7 != null && treeNode8.red) {
                        treeNode8.red = false;
                        treeNode4.red = true;
                        treeNode = rotateLeft(treeNode, treeNode4);
                        TreeNode<K, V> treeNode9 = treeNode2.parent;
                        treeNode4 = treeNode9;
                        treeNode8 = treeNode9 == null ? null : treeNode4.right;
                    }
                    if (treeNode8 == null) {
                        treeNode2 = treeNode4;
                    } else {
                        TreeNode<K, V> treeNode10 = treeNode8.left;
                        TreeNode<K, V> treeNode11 = treeNode8.right;
                        if ((treeNode11 == null || !treeNode11.red) && (treeNode10 == null || !treeNode10.red)) {
                            treeNode8.red = true;
                            treeNode2 = treeNode4;
                        } else {
                            if (treeNode11 == null || !treeNode11.red) {
                                if (treeNode10 != null) {
                                    treeNode10.red = false;
                                }
                                treeNode8.red = true;
                                treeNode = rotateRight(treeNode, treeNode8);
                                TreeNode<K, V> treeNode12 = treeNode2.parent;
                                treeNode4 = treeNode12;
                                treeNode8 = treeNode12 != null ? treeNode4.right : null;
                            }
                            if (treeNode8 != null) {
                                treeNode8.red = treeNode4 == null ? false : treeNode4.red;
                                TreeNode<K, V> treeNode13 = treeNode8.right;
                                if (treeNode13 != null) {
                                    treeNode13.red = false;
                                }
                            }
                            if (treeNode4 != null) {
                                treeNode4.red = false;
                                treeNode = rotateLeft(treeNode, treeNode4);
                            }
                            treeNode2 = treeNode;
                        }
                    }
                } else {
                    if (treeNode6 != null && treeNode6.red) {
                        treeNode6.red = false;
                        treeNode4.red = true;
                        treeNode = rotateRight(treeNode, treeNode4);
                        TreeNode<K, V> treeNode14 = treeNode2.parent;
                        treeNode4 = treeNode14;
                        treeNode6 = treeNode14 == null ? null : treeNode4.left;
                    }
                    if (treeNode6 == null) {
                        treeNode2 = treeNode4;
                    } else {
                        TreeNode<K, V> treeNode15 = treeNode6.left;
                        TreeNode<K, V> treeNode16 = treeNode6.right;
                        if ((treeNode15 == null || !treeNode15.red) && (treeNode16 == null || !treeNode16.red)) {
                            treeNode6.red = true;
                            treeNode2 = treeNode4;
                        } else {
                            if (treeNode15 == null || !treeNode15.red) {
                                if (treeNode16 != null) {
                                    treeNode16.red = false;
                                }
                                treeNode6.red = true;
                                treeNode = rotateLeft(treeNode, treeNode6);
                                TreeNode<K, V> treeNode17 = treeNode2.parent;
                                treeNode4 = treeNode17;
                                treeNode6 = treeNode17 != null ? treeNode4.left : null;
                            }
                            if (treeNode6 != null) {
                                treeNode6.red = treeNode4 == null ? false : treeNode4.red;
                                TreeNode<K, V> treeNode18 = treeNode6.left;
                                if (treeNode18 != null) {
                                    treeNode18.red = false;
                                }
                            }
                            if (treeNode4 != null) {
                                treeNode4.red = false;
                                treeNode = rotateRight(treeNode, treeNode4);
                            }
                            treeNode2 = treeNode;
                        }
                    }
                }
            }
            return treeNode;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TreeNode != java.util.concurrent.ConcurrentHashMap$TreeNode<K, V> */
        static <K, V> boolean checkInvariants(TreeNode<K, V> treeNode) {
            TreeNode<K, V> treeNode2 = treeNode.parent;
            TreeNode<K, V> treeNode3 = treeNode.left;
            TreeNode<K, V> treeNode4 = treeNode.right;
            TreeNode<K, V> treeNode5 = treeNode.prev;
            TreeNode treeNode6 = (TreeNode) treeNode.next;
            if (treeNode5 != null && treeNode5.next != treeNode) {
                return false;
            }
            if (treeNode6 != null && treeNode6.prev != treeNode) {
                return false;
            }
            if (treeNode2 != null && treeNode != treeNode2.left && treeNode != treeNode2.right) {
                return false;
            }
            if (treeNode3 != null && (treeNode3.parent != treeNode || treeNode3.hash > treeNode.hash)) {
                return false;
            }
            if (treeNode4 != null && (treeNode4.parent != treeNode || treeNode4.hash < treeNode.hash)) {
                return false;
            }
            if (treeNode.red && treeNode3 != null && treeNode3.red && treeNode4 != null && treeNode4.red) {
                return false;
            }
            if (treeNode3 != null && !checkInvariants(treeNode3)) {
                return false;
            }
            if (treeNode4 != null && !checkInvariants(treeNode4)) {
                return false;
            }
            return true;
        }
    }

    static final class TableStack<K, V> {
        int index;
        int length;
        TableStack<K, V> next;
        Node<K, V>[] tab;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TableStack != java.util.concurrent.ConcurrentHashMap$TableStack<K, V> */
        TableStack() {
        }
    }

    static class Traverser<K, V> {
        int baseIndex;
        int baseLimit;
        final int baseSize;
        int index;
        Node<K, V> next = null;
        TableStack<K, V> spare;
        TableStack<K, V> stack;
        Node<K, V>[] tab;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Traverser != java.util.concurrent.ConcurrentHashMap$Traverser<K, V> */
        Traverser(Node<K, V>[] nodeArr, int size, int index, int limit) {
            this.tab = nodeArr;
            this.baseSize = size;
            this.index = index;
            this.baseIndex = index;
            this.baseLimit = limit;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Traverser != java.util.concurrent.ConcurrentHashMap$Traverser<K, V> */
        final Node<K, V> advance() {
            Node<K, V>[] nodeArr;
            int n;
            int i;
            Node<K, V> node = this.next;
            Node<K, V> node2 = node;
            if (node != null) {
                node2 = node2.next;
            }
            while (node2 == null) {
                if (this.baseIndex >= this.baseLimit || (nodeArr = this.tab) == null || (n = nodeArr.length) <= (i = this.index) || i < 0) {
                    this.next = null;
                    return null;
                }
                Node<K, V> tabAt = ConcurrentHashMap.tabAt(nodeArr, i);
                node2 = tabAt;
                if (tabAt != null && node2.hash < 0) {
                    if (node2 instanceof ForwardingNode) {
                        this.tab = ((ForwardingNode) node2).nextTable;
                        node2 = null;
                        pushState(nodeArr, i, n);
                    } else if (node2 instanceof TreeBin) {
                        node2 = ((TreeBin) node2).first;
                    } else {
                        node2 = null;
                    }
                }
                if (this.stack != null) {
                    recoverState(n);
                } else {
                    int i2 = this.baseSize + i;
                    this.index = i2;
                    if (i2 >= n) {
                        int i3 = this.baseIndex + 1;
                        this.baseIndex = i3;
                        this.index = i3;
                    }
                }
            }
            this.next = node2;
            return node2;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TableStack != java.util.concurrent.ConcurrentHashMap$TableStack<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Traverser != java.util.concurrent.ConcurrentHashMap$Traverser<K, V> */
        private void pushState(Node<K, V>[] nodeArr, int i, int n) {
            TableStack<K, V> tableStack = this.spare;
            if (tableStack != null) {
                this.spare = tableStack.next;
            } else {
                tableStack = new TableStack<>();
            }
            tableStack.tab = nodeArr;
            tableStack.length = n;
            tableStack.index = i;
            tableStack.next = this.stack;
            this.stack = tableStack;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TableStack != java.util.concurrent.ConcurrentHashMap$TableStack<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Traverser != java.util.concurrent.ConcurrentHashMap$Traverser<K, V> */
        private void recoverState(int n) {
            TableStack<K, V> tableStack;
            while (true) {
                tableStack = this.stack;
                if (tableStack == null) {
                    break;
                }
                int i = this.index;
                int len = tableStack.length;
                int i2 = i + len;
                this.index = i2;
                if (i2 < n) {
                    break;
                }
                n = len;
                this.index = tableStack.index;
                this.tab = tableStack.tab;
                tableStack.tab = null;
                TableStack<K, V> tableStack2 = tableStack.next;
                tableStack.next = this.spare;
                this.stack = tableStack2;
                this.spare = tableStack;
            }
            if (tableStack == null) {
                int i3 = this.index + this.baseSize;
                this.index = i3;
                if (i3 >= n) {
                    int i4 = this.baseIndex + 1;
                    this.baseIndex = i4;
                    this.index = i4;
                }
            }
        }
    }

    static class BaseIterator<K, V> extends Traverser<K, V> {
        Node<K, V> lastReturned;
        final ConcurrentHashMap<K, V> map;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BaseIterator != java.util.concurrent.ConcurrentHashMap$BaseIterator<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        BaseIterator(Node<K, V>[] nodeArr, int size, int index, int limit, ConcurrentHashMap<K, V> concurrentHashMap) {
            super(nodeArr, size, index, limit);
            this.map = concurrentHashMap;
            advance();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BaseIterator != java.util.concurrent.ConcurrentHashMap$BaseIterator<K, V> */
        public final boolean hasNext() {
            return this.next != null;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BaseIterator != java.util.concurrent.ConcurrentHashMap$BaseIterator<K, V> */
        public final boolean hasMoreElements() {
            return this.next != null;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BaseIterator != java.util.concurrent.ConcurrentHashMap$BaseIterator<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        public final void remove() {
            Node<K, V> node = this.lastReturned;
            if (node == null) {
                throw new IllegalStateException();
            }
            this.lastReturned = null;
            this.map.replaceNode(node.key, null, null);
        }
    }

    static final class KeyIterator<K, V> extends BaseIterator<K, V> implements Iterator<K>, Enumeration<K> {
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$KeyIterator != java.util.concurrent.ConcurrentHashMap$KeyIterator<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        KeyIterator(Node<K, V>[] nodeArr, int size, int index, int limit, ConcurrentHashMap<K, V> concurrentHashMap) {
            super(nodeArr, size, index, limit, concurrentHashMap);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$KeyIterator != java.util.concurrent.ConcurrentHashMap$KeyIterator<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // java.util.Iterator
        public final K next() {
            Node<K, V> node = this.next;
            if (node == null) {
                throw new NoSuchElementException();
            }
            K k = node.key;
            this.lastReturned = node;
            advance();
            return k;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$KeyIterator != java.util.concurrent.ConcurrentHashMap$KeyIterator<K, V> */
        @Override // java.util.Enumeration
        public final K nextElement() {
            return next();
        }
    }

    static final class ValueIterator<K, V> extends BaseIterator<K, V> implements Iterator<V>, Enumeration<V> {
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ValueIterator != java.util.concurrent.ConcurrentHashMap$ValueIterator<K, V> */
        ValueIterator(Node<K, V>[] nodeArr, int size, int index, int limit, ConcurrentHashMap<K, V> concurrentHashMap) {
            super(nodeArr, size, index, limit, concurrentHashMap);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ValueIterator != java.util.concurrent.ConcurrentHashMap$ValueIterator<K, V> */
        @Override // java.util.Iterator
        public final V next() {
            Node<K, V> node = this.next;
            if (node == null) {
                throw new NoSuchElementException();
            }
            V v = node.val;
            this.lastReturned = node;
            advance();
            return v;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ValueIterator != java.util.concurrent.ConcurrentHashMap$ValueIterator<K, V> */
        @Override // java.util.Enumeration
        public final V nextElement() {
            return next();
        }
    }

    static final class EntryIterator<K, V> extends BaseIterator<K, V> implements Iterator<Map.Entry<K, V>> {
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$EntryIterator != java.util.concurrent.ConcurrentHashMap$EntryIterator<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        EntryIterator(Node<K, V>[] nodeArr, int size, int index, int limit, ConcurrentHashMap<K, V> concurrentHashMap) {
            super(nodeArr, size, index, limit, concurrentHashMap);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$EntryIterator != java.util.concurrent.ConcurrentHashMap$EntryIterator<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // java.util.Iterator
        public final Map.Entry<K, V> next() {
            Node<K, V> node = this.next;
            if (node == null) {
                throw new NoSuchElementException();
            }
            K k = node.key;
            V v = node.val;
            this.lastReturned = node;
            advance();
            return new MapEntry(k, v, this.map);
        }
    }

    static final class MapEntry<K, V> implements Map.Entry<K, V> {
        final K key;
        final ConcurrentHashMap<K, V> map;
        V val;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapEntry != java.util.concurrent.ConcurrentHashMap$MapEntry<K, V> */
        MapEntry(K key, V val, ConcurrentHashMap<K, V> concurrentHashMap) {
            this.key = key;
            this.val = val;
            this.map = concurrentHashMap;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapEntry != java.util.concurrent.ConcurrentHashMap$MapEntry<K, V> */
        @Override // java.util.Map.Entry
        public K getKey() {
            return this.key;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapEntry != java.util.concurrent.ConcurrentHashMap$MapEntry<K, V> */
        @Override // java.util.Map.Entry
        public V getValue() {
            return this.val;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapEntry != java.util.concurrent.ConcurrentHashMap$MapEntry<K, V> */
        @Override // java.util.Map.Entry
        public int hashCode() {
            return this.key.hashCode() ^ this.val.hashCode();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapEntry != java.util.concurrent.ConcurrentHashMap$MapEntry<K, V> */
        public String toString() {
            return Helpers.mapEntryToString(this.key, this.val);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapEntry != java.util.concurrent.ConcurrentHashMap$MapEntry<K, V> */
        @Override // java.util.Map.Entry
        public boolean equals(Object o) {
            Map.Entry<?, ?> e;
            Object k;
            Object v;
            return (o instanceof Map.Entry) && (k = (e = (Map.Entry) o).getKey()) != null && (v = e.getValue()) != null && (k == this.key || k.equals(this.key)) && (v == this.val || v.equals(this.val));
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapEntry != java.util.concurrent.ConcurrentHashMap$MapEntry<K, V> */
        @Override // java.util.Map.Entry
        public V setValue(V value) {
            if (value == null) {
                throw new NullPointerException();
            }
            V v = this.val;
            this.val = value;
            this.map.put(this.key, value);
            return v;
        }
    }

    static final class KeySpliterator<K, V> extends Traverser<K, V> implements Spliterator<K> {
        long est;

        @Override // j$.util.Spliterator
        public /* sintético */ Comparator getComparator() {
            return Spliterator.CC.$default$getComparator(this);
        }

        @Override // j$.util.Spliterator
        public /* sintético */ long getExactSizeIfKnown() {
            return Spliterator.CC.$default$getExactSizeIfKnown(this);
        }

        @Override // j$.util.Spliterator
        public /* sintético */ boolean hasCharacteristics(int i) {
            return Spliterator.CC.$default$hasCharacteristics(this, i);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$KeySpliterator != java.util.concurrent.ConcurrentHashMap$KeySpliterator<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        KeySpliterator(Node<K, V>[] nodeArr, int size, int index, int limit, long est) {
            super(nodeArr, size, index, limit);
            this.est = est;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$KeySpliterator != java.util.concurrent.ConcurrentHashMap$KeySpliterator<K, V> */
        @Override // j$.util.Spliterator
        public KeySpliterator<K, V> trySplit() {
            int i = this.baseIndex;
            int f = this.baseLimit;
            int h = (i + f) >>> 1;
            if (h <= i) {
                return null;
            }
            Node<K, V>[] nodeArr = this.tab;
            int i2 = this.baseSize;
            this.baseLimit = h;
            long j = this.est >>> 1;
            this.est = j;
            return new KeySpliterator<>(nodeArr, i2, h, f, j);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$KeySpliterator != java.util.concurrent.ConcurrentHashMap$KeySpliterator<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // j$.util.Spliterator
        public void forEachRemaining(Consumer<? super K> consumer) {
            if (consumer == null) {
                throw new NullPointerException();
            }
            while (true) {
                Node<K, V> advance = advance();
                if (advance != null) {
                    consumer.accept(advance.key);
                } else {
                    return;
                }
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$KeySpliterator != java.util.concurrent.ConcurrentHashMap$KeySpliterator<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // j$.util.Spliterator
        public boolean tryAdvance(Consumer<? super K> consumer) {
            if (consumer == null) {
                throw new NullPointerException();
            }
            Node<K, V> advance = advance();
            if (advance == null) {
                return false;
            }
            consumer.accept(advance.key);
            return true;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$KeySpliterator != java.util.concurrent.ConcurrentHashMap$KeySpliterator<K, V> */
        @Override // j$.util.Spliterator
        public long estimateSize() {
            return this.est;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$KeySpliterator != java.util.concurrent.ConcurrentHashMap$KeySpliterator<K, V> */
        @Override // j$.util.Spliterator
        public int characteristics() {
            return 4353;
        }
    }

    static final class ValueSpliterator<K, V> extends Traverser<K, V> implements Spliterator<V> {
        long est;

        @Override // j$.util.Spliterator
        public /* sintético */ Comparator getComparator() {
            return Spliterator.CC.$default$getComparator(this);
        }

        @Override // j$.util.Spliterator
        public /* sintético */ long getExactSizeIfKnown() {
            return Spliterator.CC.$default$getExactSizeIfKnown(this);
        }

        @Override // j$.util.Spliterator
        public /* sintético */ boolean hasCharacteristics(int i) {
            return Spliterator.CC.$default$hasCharacteristics(this, i);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ValueSpliterator != java.util.concurrent.ConcurrentHashMap$ValueSpliterator<K, V> */
        ValueSpliterator(Node<K, V>[] nodeArr, int size, int index, int limit, long est) {
            super(nodeArr, size, index, limit);
            this.est = est;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ValueSpliterator != java.util.concurrent.ConcurrentHashMap$ValueSpliterator<K, V> */
        @Override // j$.util.Spliterator
        public ValueSpliterator<K, V> trySplit() {
            int i = this.baseIndex;
            int f = this.baseLimit;
            int h = (i + f) >>> 1;
            if (h <= i) {
                return null;
            }
            Node<K, V>[] nodeArr = this.tab;
            int i2 = this.baseSize;
            this.baseLimit = h;
            long j = this.est >>> 1;
            this.est = j;
            return new ValueSpliterator<>(nodeArr, i2, h, f, j);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ValueSpliterator != java.util.concurrent.ConcurrentHashMap$ValueSpliterator<K, V> */
        @Override // j$.util.Spliterator
        public void forEachRemaining(Consumer<? super V> consumer) {
            if (consumer == null) {
                throw new NullPointerException();
            }
            while (true) {
                Node<K, V> advance = advance();
                if (advance != null) {
                    consumer.accept(advance.val);
                } else {
                    return;
                }
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ValueSpliterator != java.util.concurrent.ConcurrentHashMap$ValueSpliterator<K, V> */
        @Override // j$.util.Spliterator
        public boolean tryAdvance(Consumer<? super V> consumer) {
            if (consumer == null) {
                throw new NullPointerException();
            }
            Node<K, V> advance = advance();
            if (advance == null) {
                return false;
            }
            consumer.accept(advance.val);
            return true;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ValueSpliterator != java.util.concurrent.ConcurrentHashMap$ValueSpliterator<K, V> */
        @Override // j$.util.Spliterator
        public long estimateSize() {
            return this.est;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ValueSpliterator != java.util.concurrent.ConcurrentHashMap$ValueSpliterator<K, V> */
        @Override // j$.util.Spliterator
        public int characteristics() {
            return 4352;
        }
    }

    static final class EntrySpliterator<K, V> extends Traverser<K, V> implements Spliterator<Map.Entry<K, V>> {
        long est;
        final ConcurrentHashMap<K, V> map;

        @Override // j$.util.Spliterator
        public /* sintético */ Comparator getComparator() {
            return Spliterator.CC.$default$getComparator(this);
        }

        @Override // j$.util.Spliterator
        public /* sintético */ long getExactSizeIfKnown() {
            return Spliterator.CC.$default$getExactSizeIfKnown(this);
        }

        @Override // j$.util.Spliterator
        public /* sintético */ boolean hasCharacteristics(int i) {
            return Spliterator.CC.$default$hasCharacteristics(this, i);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$EntrySpliterator != java.util.concurrent.ConcurrentHashMap$EntrySpliterator<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        EntrySpliterator(Node<K, V>[] nodeArr, int size, int index, int limit, long est, ConcurrentHashMap<K, V> concurrentHashMap) {
            super(nodeArr, size, index, limit);
            this.map = concurrentHashMap;
            this.est = est;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$EntrySpliterator != java.util.concurrent.ConcurrentHashMap$EntrySpliterator<K, V> */
        @Override // j$.util.Spliterator
        public EntrySpliterator<K, V> trySplit() {
            int i = this.baseIndex;
            int f = this.baseLimit;
            int h = (i + f) >>> 1;
            if (h <= i) {
                return null;
            }
            Node<K, V>[] nodeArr = this.tab;
            int i2 = this.baseSize;
            this.baseLimit = h;
            long j = this.est >>> 1;
            this.est = j;
            return new EntrySpliterator<>(nodeArr, i2, h, f, j, this.map);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$EntrySpliterator != java.util.concurrent.ConcurrentHashMap$EntrySpliterator<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // j$.util.Spliterator
        public void forEachRemaining(Consumer<? super Map.Entry<K, V>> action) {
            if (action == null) {
                throw new NullPointerException();
            }
            while (true) {
                Node<K, V> advance = advance();
                if (advance != null) {
                    action.accept(new MapEntry(advance.key, advance.val, this.map));
                } else {
                    return;
                }
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$EntrySpliterator != java.util.concurrent.ConcurrentHashMap$EntrySpliterator<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // j$.util.Spliterator
        public boolean tryAdvance(Consumer<? super Map.Entry<K, V>> action) {
            if (action == null) {
                throw new NullPointerException();
            }
            Node<K, V> advance = advance();
            if (advance == null) {
                return false;
            }
            action.accept(new MapEntry(advance.key, advance.val, this.map));
            return true;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$EntrySpliterator != java.util.concurrent.ConcurrentHashMap$EntrySpliterator<K, V> */
        @Override // j$.util.Spliterator
        public long estimateSize() {
            return this.est;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$EntrySpliterator != java.util.concurrent.ConcurrentHashMap$EntrySpliterator<K, V> */
        @Override // j$.util.Spliterator
        public int characteristics() {
            return 4353;
        }
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    final int batchFor(long b) {
        if (b == Long.MAX_VALUE) {
            return 0;
        }
        long n = sumCount();
        if (n <= 1 || n < b) {
            return 0;
        }
        int sp = ForkJoinPool.getCommonPoolParallelism() << 2;
        if (b > 0) {
            long n2 = n / b;
            if (n2 < sp) {
                return (int) n2;
            }
        }
        return sp;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public void forEach(long parallelismThreshold, BiConsumer<? super K, ? super V> action) {
        if (action == null) {
            throw new NullPointerException();
        }
        new ForEachMappingTask(null, batchFor(parallelismThreshold), 0, 0, this.table, action).invoke();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public <U> void forEach(long parallelismThreshold, BiFunction<? super K, ? super V, ? extends U> transformer, Consumer<? super U> action) {
        if (transformer == null || action == null) {
            throw new NullPointerException();
        }
        new ForEachTransformedMappingTask(null, batchFor(parallelismThreshold), 0, 0, this.table, transformer, action).invoke();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public <U> U search(long j, BiFunction<? super K, ? super V, ? extends U> biFunction) {
        if (biFunction != null) {
            return (U) new SearchMappingsTask(null, batchFor(j), 0, 0, this.table, biFunction, new AtomicReference()).invoke();
        }
        throw new NullPointerException();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public <U> U reduce(long j, BiFunction<? super K, ? super V, ? extends U> biFunction, BiFunction<? super U, ? super U, ? extends U> biFunction2) {
        if (biFunction == null || biFunction2 == null) {
            throw new NullPointerException();
        }
        return (U) new MapReduceMappingsTask(null, batchFor(j), 0, 0, this.table, null, biFunction, biFunction2).invoke();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public double reduceToDouble(long parallelismThreshold, ToDoubleBiFunction<? super K, ? super V> transformer, double basis, DoubleBinaryOperator reducer) {
        if (transformer == null || reducer == null) {
            throw new NullPointerException();
        }
        return ((Double) new MapReduceMappingsToDoubleTask(null, batchFor(parallelismThreshold), 0, 0, this.table, null, transformer, basis, reducer).invoke()).doubleValue();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public long reduceToLong(long parallelismThreshold, ToLongBiFunction<? super K, ? super V> transformer, long basis, LongBinaryOperator reducer) {
        if (transformer == null || reducer == null) {
            throw new NullPointerException();
        }
        return ((Long) new MapReduceMappingsToLongTask(null, batchFor(parallelismThreshold), 0, 0, this.table, null, transformer, basis, reducer).invoke()).longValue();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public int reduceToInt(long parallelismThreshold, ToIntBiFunction<? super K, ? super V> transformer, int basis, IntBinaryOperator reducer) {
        if (transformer == null || reducer == null) {
            throw new NullPointerException();
        }
        return ((Integer) new MapReduceMappingsToIntTask(null, batchFor(parallelismThreshold), 0, 0, this.table, null, transformer, basis, reducer).invoke()).intValue();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public void forEachKey(long parallelismThreshold, Consumer<? super K> action) {
        if (action == null) {
            throw new NullPointerException();
        }
        new ForEachKeyTask(null, batchFor(parallelismThreshold), 0, 0, this.table, action).invoke();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public <U> void forEachKey(long parallelismThreshold, Function<? super K, ? extends U> transformer, Consumer<? super U> action) {
        if (transformer == null || action == null) {
            throw new NullPointerException();
        }
        new ForEachTransformedKeyTask(null, batchFor(parallelismThreshold), 0, 0, this.table, transformer, action).invoke();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public <U> U searchKeys(long j, Function<? super K, ? extends U> function) {
        if (function != null) {
            return (U) new SearchKeysTask(null, batchFor(j), 0, 0, this.table, function, new AtomicReference()).invoke();
        }
        throw new NullPointerException();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public K reduceKeys(long j, BiFunction<? super K, ? super K, ? extends K> biFunction) {
        if (biFunction != null) {
            return (K) new ReduceKeysTask(null, batchFor(j), 0, 0, this.table, null, biFunction).invoke();
        }
        throw new NullPointerException();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public <U> U reduceKeys(long j, Function<? super K, ? extends U> function, BiFunction<? super U, ? super U, ? extends U> biFunction) {
        if (function == null || biFunction == null) {
            throw new NullPointerException();
        }
        return (U) new MapReduceKeysTask(null, batchFor(j), 0, 0, this.table, null, function, biFunction).invoke();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public double reduceKeysToDouble(long parallelismThreshold, ToDoubleFunction<? super K> transformer, double basis, DoubleBinaryOperator reducer) {
        if (transformer == null || reducer == null) {
            throw new NullPointerException();
        }
        return ((Double) new MapReduceKeysToDoubleTask(null, batchFor(parallelismThreshold), 0, 0, this.table, null, transformer, basis, reducer).invoke()).doubleValue();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public long reduceKeysToLong(long parallelismThreshold, ToLongFunction<? super K> transformer, long basis, LongBinaryOperator reducer) {
        if (transformer == null || reducer == null) {
            throw new NullPointerException();
        }
        return ((Long) new MapReduceKeysToLongTask(null, batchFor(parallelismThreshold), 0, 0, this.table, null, transformer, basis, reducer).invoke()).longValue();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public int reduceKeysToInt(long parallelismThreshold, ToIntFunction<? super K> transformer, int basis, IntBinaryOperator reducer) {
        if (transformer == null || reducer == null) {
            throw new NullPointerException();
        }
        return ((Integer) new MapReduceKeysToIntTask(null, batchFor(parallelismThreshold), 0, 0, this.table, null, transformer, basis, reducer).invoke()).intValue();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public void forEachValue(long parallelismThreshold, Consumer<? super V> action) {
        if (action == null) {
            throw new NullPointerException();
        }
        new ForEachValueTask(null, batchFor(parallelismThreshold), 0, 0, this.table, action).invoke();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public <U> void forEachValue(long parallelismThreshold, Function<? super V, ? extends U> transformer, Consumer<? super U> action) {
        if (transformer == null || action == null) {
            throw new NullPointerException();
        }
        new ForEachTransformedValueTask(null, batchFor(parallelismThreshold), 0, 0, this.table, transformer, action).invoke();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public <U> U searchValues(long j, Function<? super V, ? extends U> function) {
        if (function != null) {
            return (U) new SearchValuesTask(null, batchFor(j), 0, 0, this.table, function, new AtomicReference()).invoke();
        }
        throw new NullPointerException();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public V reduceValues(long j, BiFunction<? super V, ? super V, ? extends V> biFunction) {
        if (biFunction != null) {
            return (V) new ReduceValuesTask(null, batchFor(j), 0, 0, this.table, null, biFunction).invoke();
        }
        throw new NullPointerException();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public <U> U reduceValues(long j, Function<? super V, ? extends U> function, BiFunction<? super U, ? super U, ? extends U> biFunction) {
        if (function == null || biFunction == null) {
            throw new NullPointerException();
        }
        return (U) new MapReduceValuesTask(null, batchFor(j), 0, 0, this.table, null, function, biFunction).invoke();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public double reduceValuesToDouble(long parallelismThreshold, ToDoubleFunction<? super V> transformer, double basis, DoubleBinaryOperator reducer) {
        if (transformer == null || reducer == null) {
            throw new NullPointerException();
        }
        return ((Double) new MapReduceValuesToDoubleTask(null, batchFor(parallelismThreshold), 0, 0, this.table, null, transformer, basis, reducer).invoke()).doubleValue();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public long reduceValuesToLong(long parallelismThreshold, ToLongFunction<? super V> transformer, long basis, LongBinaryOperator reducer) {
        if (transformer == null || reducer == null) {
            throw new NullPointerException();
        }
        return ((Long) new MapReduceValuesToLongTask(null, batchFor(parallelismThreshold), 0, 0, this.table, null, transformer, basis, reducer).invoke()).longValue();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public int reduceValuesToInt(long parallelismThreshold, ToIntFunction<? super V> transformer, int basis, IntBinaryOperator reducer) {
        if (transformer == null || reducer == null) {
            throw new NullPointerException();
        }
        return ((Integer) new MapReduceValuesToIntTask(null, batchFor(parallelismThreshold), 0, 0, this.table, null, transformer, basis, reducer).invoke()).intValue();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public void forEachEntry(long parallelismThreshold, Consumer<? super Map.Entry<K, V>> action) {
        if (action == null) {
            throw new NullPointerException();
        }
        new ForEachEntryTask(null, batchFor(parallelismThreshold), 0, 0, this.table, action).invoke();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public <U> void forEachEntry(long parallelismThreshold, Function<Map.Entry<K, V>, ? extends U> transformer, Consumer<? super U> action) {
        if (transformer == null || action == null) {
            throw new NullPointerException();
        }
        new ForEachTransformedEntryTask(null, batchFor(parallelismThreshold), 0, 0, this.table, transformer, action).invoke();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public <U> U searchEntries(long j, Function<Map.Entry<K, V>, ? extends U> function) {
        if (function != null) {
            return (U) new SearchEntriesTask(null, batchFor(j), 0, 0, this.table, function, new AtomicReference()).invoke();
        }
        throw new NullPointerException();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public Map.Entry<K, V> reduceEntries(long parallelismThreshold, BiFunction<Map.Entry<K, V>, Map.Entry<K, V>, ? extends Map.Entry<K, V>> reducer) {
        if (reducer != null) {
            return (Map.Entry) new ReduceEntriesTask(null, batchFor(parallelismThreshold), 0, 0, this.table, null, reducer).invoke();
        }
        throw new NullPointerException();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public <U> U reduceEntries(long j, Function<Map.Entry<K, V>, ? extends U> function, BiFunction<? super U, ? super U, ? extends U> biFunction) {
        if (function == null || biFunction == null) {
            throw new NullPointerException();
        }
        return (U) new MapReduceEntriesTask(null, batchFor(j), 0, 0, this.table, null, function, biFunction).invoke();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public double reduceEntriesToDouble(long parallelismThreshold, ToDoubleFunction<Map.Entry<K, V>> transformer, double basis, DoubleBinaryOperator reducer) {
        if (transformer == null || reducer == null) {
            throw new NullPointerException();
        }
        return ((Double) new MapReduceEntriesToDoubleTask(null, batchFor(parallelismThreshold), 0, 0, this.table, null, transformer, basis, reducer).invoke()).doubleValue();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public long reduceEntriesToLong(long parallelismThreshold, ToLongFunction<Map.Entry<K, V>> transformer, long basis, LongBinaryOperator reducer) {
        if (transformer == null || reducer == null) {
            throw new NullPointerException();
        }
        return ((Long) new MapReduceEntriesToLongTask(null, batchFor(parallelismThreshold), 0, 0, this.table, null, transformer, basis, reducer).invoke()).longValue();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
    public int reduceEntriesToInt(long parallelismThreshold, ToIntFunction<Map.Entry<K, V>> transformer, int basis, IntBinaryOperator reducer) {
        if (transformer == null || reducer == null) {
            throw new NullPointerException();
        }
        return ((Integer) new MapReduceEntriesToIntTask(null, batchFor(parallelismThreshold), 0, 0, this.table, null, transformer, basis, reducer).invoke()).intValue();
    }

    static abstract class CollectionView<K, V, E> implements Collection<E>, Serializable {
        private static final String OOME_MSG = "Required array size too large";
        private static final long serialVersionUID = 7249069246763182397L;
        final ConcurrentHashMap<K, V> map;

        @Override // java.util.Collection
        public abstract boolean contains(Object obj);

        @Override // java.util.Collection, java.lang.Iterable
        public abstract Iterator<E> iterator();

        @Override // java.util.Collection
        public abstract boolean remove(Object obj);

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$CollectionView != java.util.concurrent.ConcurrentHashMap$CollectionView<K, V, E> */
        CollectionView(ConcurrentHashMap<K, V> concurrentHashMap) {
            this.map = concurrentHashMap;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$CollectionView != java.util.concurrent.ConcurrentHashMap$CollectionView<K, V, E> */
        public ConcurrentHashMap<K, V> getMap() {
            return this.map;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$CollectionView != java.util.concurrent.ConcurrentHashMap$CollectionView<K, V, E> */
        @Override // java.util.Collection
        public final void clear() {
            this.map.clear();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$CollectionView != java.util.concurrent.ConcurrentHashMap$CollectionView<K, V, E> */
        @Override // java.util.Collection
        public final int size() {
            return this.map.size();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$CollectionView != java.util.concurrent.ConcurrentHashMap$CollectionView<K, V, E> */
        @Override // java.util.Collection
        public final boolean isEmpty() {
            return this.map.isEmpty();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$CollectionView != java.util.concurrent.ConcurrentHashMap$CollectionView<K, V, E> */
        @Override // java.util.Collection
        public final Object[] toArray() {
            long sz = this.map.mappingCount();
            if (sz > 2147483639) {
                throw new OutOfMemoryError(OOME_MSG);
            }
            int n = (int) sz;
            Object[] r = new Object[n];
            int i = 0;
            Iterator<E> it = iterator();
            while (it.hasNext()) {
                E e = it.next();
                if (i == n) {
                    if (n >= ConcurrentHashMap.MAX_ARRAY_SIZE) {
                        throw new OutOfMemoryError(OOME_MSG);
                    }
                    if (n >= 1073741819) {
                        n = ConcurrentHashMap.MAX_ARRAY_SIZE;
                    } else {
                        n += (n >>> 1) + 1;
                    }
                    r = Arrays.copyOf(r, n);
                }
                r[i] = e;
                i++;
            }
            return i == n ? r : Arrays.copyOf(r, i);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$CollectionView != java.util.concurrent.ConcurrentHashMap$CollectionView<K, V, E> */
        @Override // java.util.Collection
        public final <T> T[] toArray(T[] tArr) {
            long mappingCount = this.map.mappingCount();
            if (mappingCount > 2147483639) {
                throw new OutOfMemoryError(OOME_MSG);
            }
            int i = (int) mappingCount;
            Object[] objArr = tArr.length >= i ? tArr : (Object[]) Array.newInstance(tArr.getClass().getComponentType(), i);
            int length = objArr.length;
            int i2 = 0;
            Iterator<E> it = iterator();
            while (it.hasNext()) {
                E next = it.next();
                if (i2 == length) {
                    if (length >= ConcurrentHashMap.MAX_ARRAY_SIZE) {
                        throw new OutOfMemoryError(OOME_MSG);
                    }
                    if (length >= 1073741819) {
                        length = ConcurrentHashMap.MAX_ARRAY_SIZE;
                    } else {
                        length += (length >>> 1) + 1;
                    }
                    objArr = (T[]) Arrays.copyOf(objArr, length);
                }
                objArr[i2] = next;
                i2++;
            }
            if (tArr != objArr || i2 >= length) {
                return i2 == length ? objArr : (T[]) Arrays.copyOf(objArr, i2);
            }
            objArr[i2] = null;
            return (T[]) objArr;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$CollectionView != java.util.concurrent.ConcurrentHashMap$CollectionView<K, V, E> */
        public final String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append('[');
            Iterator<E> it = iterator();
            if (it.hasNext()) {
                while (true) {
                    Object e = it.next();
                    sb.append(e == this ? "(this Collection)" : e);
                    if (!it.hasNext()) {
                        break;
                    }
                    sb.append(',').append(' ');
                }
            }
            return sb.append(']').toString();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$CollectionView != java.util.concurrent.ConcurrentHashMap$CollectionView<K, V, E> */
        @Override // java.util.Collection
        public final boolean containsAll(Collection<?> c) {
            if (c != this) {
                for (Object e : c) {
                    if (e == null || !contains(e)) {
                        return false;
                    }
                }
                return true;
            }
            return true;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$CollectionView != java.util.concurrent.ConcurrentHashMap$CollectionView<K, V, E> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        @Override // java.util.Collection
        public boolean removeAll(Collection<?> c) {
            if (c == null) {
                throw new NullPointerException();
            }
            boolean modified = false;
            Node<K, V>[] nodeArr = this.map.table;
            if (nodeArr == null) {
                return false;
            }
            if ((c instanceof Set) && c.size() > nodeArr.length) {
                Iterator<E> it = iterator();
                while (it.hasNext()) {
                    if (c.contains(it.next())) {
                        it.remove();
                        modified = true;
                    }
                }
            } else {
                for (Object e : c) {
                    modified |= remove(e);
                }
            }
            return modified;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$CollectionView != java.util.concurrent.ConcurrentHashMap$CollectionView<K, V, E> */
        @Override // java.util.Collection
        public final boolean retainAll(Collection<?> c) {
            if (c == null) {
                throw new NullPointerException();
            }
            boolean modified = false;
            Iterator<E> it = iterator();
            while (it.hasNext()) {
                if (!c.contains(it.next())) {
                    it.remove();
                    modified = true;
                }
            }
            return modified;
        }
    }

    public static class KeySetView<K, V> extends CollectionView<K, V, K> implements Set<K>, Serializable, j$.util.Set<K> {
        private static final long serialVersionUID = 7249069246763182397L;
        private final V value;

        @Override // java.util.Collection, j$.util.Collection
        public /* sintético */ Stream parallelStream() {
            return Collection.CC.$default$parallelStream(this);
        }

        @Override // java.util.Collection
        public /* sintético */ java.util.stream.Stream parallelStream() {
            return Stream.Wrapper.convert(parallelStream());
        }

        @Override // java.util.Collection, j$.util.Collection
        public /* sintético */ boolean removeIf(Predicate predicate) {
            return Collection.CC.$default$removeIf(this, predicate);
        }

        @Override // java.util.Collection, java.lang.Iterable, java.util.Set
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

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$KeySetView != java.util.concurrent.ConcurrentHashMap$KeySetView<K, V> */
        @Override // j$.util.concurrent.ConcurrentHashMap.CollectionView
        public /* bridge */ /* sintético */ ConcurrentHashMap getMap() {
            return super.getMap();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$KeySetView != java.util.concurrent.ConcurrentHashMap$KeySetView<K, V> */
        @Override // j$.util.concurrent.ConcurrentHashMap.CollectionView, java.util.Collection
        public /* bridge */ /* sintético */ boolean removeAll(java.util.Collection collection) {
            return super.removeAll(collection);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$KeySetView != java.util.concurrent.ConcurrentHashMap$KeySetView<K, V> */
        KeySetView(ConcurrentHashMap<K, V> concurrentHashMap, V value) {
            super(concurrentHashMap);
            this.value = value;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$KeySetView != java.util.concurrent.ConcurrentHashMap$KeySetView<K, V> */
        public V getMappedValue() {
            return this.value;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$KeySetView != java.util.concurrent.ConcurrentHashMap$KeySetView<K, V> */
        @Override // j$.util.concurrent.ConcurrentHashMap.CollectionView, java.util.Collection
        public boolean contains(Object o) {
            return this.map.containsKey(o);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$KeySetView != java.util.concurrent.ConcurrentHashMap$KeySetView<K, V> */
        @Override // j$.util.concurrent.ConcurrentHashMap.CollectionView, java.util.Collection
        public boolean remove(Object o) {
            return this.map.remove(o) != null;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$KeySetView != java.util.concurrent.ConcurrentHashMap$KeySetView<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        @Override // j$.util.concurrent.ConcurrentHashMap.CollectionView, java.util.Collection, java.lang.Iterable
        public Iterator<K> iterator() {
            ConcurrentHashMap<K, V> concurrentHashMap = this.map;
            Node<K, V>[] nodeArr = concurrentHashMap.table;
            int f = nodeArr == null ? 0 : nodeArr.length;
            return new KeyIterator(nodeArr, f, 0, f, concurrentHashMap);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$KeySetView != java.util.concurrent.ConcurrentHashMap$KeySetView<K, V> */
        @Override // java.util.Collection, java.util.Set
        public boolean add(K e) {
            V v = this.value;
            if (v != null) {
                return this.map.putVal(e, v, true) == null;
            }
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$KeySetView != java.util.concurrent.ConcurrentHashMap$KeySetView<K, V> */
        @Override // java.util.Collection, java.util.Set
        public boolean addAll(java.util.Collection<? extends K> c) {
            boolean added = false;
            V v = this.value;
            if (v == null) {
                throw new UnsupportedOperationException();
            }
            for (K e : c) {
                if (this.map.putVal(e, v, true) == null) {
                    added = true;
                }
            }
            return added;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$KeySetView != java.util.concurrent.ConcurrentHashMap$KeySetView<K, V> */
        @Override // java.util.Collection, java.util.Set
        public int hashCode() {
            int h = 0;
            Iterator<K> it = iterator();
            while (it.hasNext()) {
                K e = it.next();
                h += e.hashCode();
            }
            return h;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$KeySetView != java.util.concurrent.ConcurrentHashMap$KeySetView<K, V> */
        @Override // java.util.Collection, java.util.Set
        public boolean equals(Object o) {
            Set<?> c;
            return (o instanceof Set) && ((c = (Set) o) == this || (containsAll(c) && c.containsAll(this)));
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$KeySetView != java.util.concurrent.ConcurrentHashMap$KeySetView<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        @Override // java.util.Collection, java.lang.Iterable, java.util.Set, j$.util.Set, j$.util.Collection, j$.lang.Iterable
        public Spliterator<K> spliterator() {
            ConcurrentHashMap<K, V> concurrentHashMap = this.map;
            long n = concurrentHashMap.sumCount();
            Node<K, V>[] nodeArr = concurrentHashMap.table;
            int f = nodeArr == null ? 0 : nodeArr.length;
            return new KeySpliterator(nodeArr, f, 0, f, n < 0 ? 0L : n);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$KeySetView != java.util.concurrent.ConcurrentHashMap$KeySetView<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Traverser != java.util.concurrent.ConcurrentHashMap$Traverser<K, V> */
        @Override // java.lang.Iterable, j$.util.Collection, j$.lang.Iterable
        public void forEach(Consumer<? super K> consumer) {
            if (consumer == null) {
                throw new NullPointerException();
            }
            Node<K, V>[] nodeArr = this.map.table;
            if (nodeArr != null) {
                Traverser traverser = new Traverser(nodeArr, nodeArr.length, 0, nodeArr.length);
                while (true) {
                    Node<K, V> advance = traverser.advance();
                    if (advance != null) {
                        consumer.accept(advance.key);
                    } else {
                        return;
                    }
                }
            }
        }
    }

    static final class ValuesView<K, V> extends CollectionView<K, V, V> implements java.util.Collection<V>, Serializable, j$.util.Collection<V> {
        private static final long serialVersionUID = 2249069246763182397L;

        @Override // java.util.Collection, j$.util.Collection
        public /* sintético */ Stream parallelStream() {
            return Collection.CC.$default$parallelStream(this);
        }

        @Override // java.util.Collection
        public /* sintético */ java.util.stream.Stream parallelStream() {
            return Stream.Wrapper.convert(parallelStream());
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

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ValuesView != java.util.concurrent.ConcurrentHashMap$ValuesView<K, V> */
        ValuesView(ConcurrentHashMap<K, V> concurrentHashMap) {
            super(concurrentHashMap);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ValuesView != java.util.concurrent.ConcurrentHashMap$ValuesView<K, V> */
        @Override // j$.util.concurrent.ConcurrentHashMap.CollectionView, java.util.Collection
        public final boolean contains(Object o) {
            return this.map.containsValue(o);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ValuesView != java.util.concurrent.ConcurrentHashMap$ValuesView<K, V> */
        @Override // j$.util.concurrent.ConcurrentHashMap.CollectionView, java.util.Collection
        public final boolean remove(Object o) {
            if (o != null) {
                Iterator<V> it = iterator();
                while (it.hasNext()) {
                    if (o.equals(it.next())) {
                        it.remove();
                        return true;
                    }
                }
                return false;
            }
            return false;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ValuesView != java.util.concurrent.ConcurrentHashMap$ValuesView<K, V> */
        @Override // j$.util.concurrent.ConcurrentHashMap.CollectionView, java.util.Collection, java.lang.Iterable
        public final Iterator<V> iterator() {
            ConcurrentHashMap<K, V> concurrentHashMap = this.map;
            Node<K, V>[] nodeArr = concurrentHashMap.table;
            int f = nodeArr == null ? 0 : nodeArr.length;
            return new ValueIterator(nodeArr, f, 0, f, concurrentHashMap);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ValuesView != java.util.concurrent.ConcurrentHashMap$ValuesView<K, V> */
        @Override // java.util.Collection
        public final boolean add(V e) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ValuesView != java.util.concurrent.ConcurrentHashMap$ValuesView<K, V> */
        @Override // java.util.Collection
        public final boolean addAll(java.util.Collection<? extends V> c) {
            throw new UnsupportedOperationException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ValuesView != java.util.concurrent.ConcurrentHashMap$ValuesView<K, V> */
        @Override // j$.util.concurrent.ConcurrentHashMap.CollectionView, java.util.Collection
        public boolean removeAll(java.util.Collection<?> c) {
            if (c == null) {
                throw new NullPointerException();
            }
            boolean modified = false;
            Iterator<V> it = iterator();
            while (it.hasNext()) {
                if (c.contains(it.next())) {
                    it.remove();
                    modified = true;
                }
            }
            return modified;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ValuesView != java.util.concurrent.ConcurrentHashMap$ValuesView<K, V> */
        @Override // java.util.Collection, j$.util.Collection
        public boolean removeIf(Predicate<? super V> filter) {
            return this.map.removeValueIf(filter);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ValuesView != java.util.concurrent.ConcurrentHashMap$ValuesView<K, V> */
        @Override // java.util.Collection, java.lang.Iterable, j$.util.Collection, j$.lang.Iterable
        public Spliterator<V> spliterator() {
            ConcurrentHashMap<K, V> concurrentHashMap = this.map;
            long n = concurrentHashMap.sumCount();
            Node<K, V>[] nodeArr = concurrentHashMap.table;
            int f = nodeArr == null ? 0 : nodeArr.length;
            return new ValueSpliterator(nodeArr, f, 0, f, n < 0 ? 0L : n);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Traverser != java.util.concurrent.ConcurrentHashMap$Traverser<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ValuesView != java.util.concurrent.ConcurrentHashMap$ValuesView<K, V> */
        @Override // java.lang.Iterable, j$.util.Collection, j$.lang.Iterable
        public void forEach(Consumer<? super V> consumer) {
            if (consumer == null) {
                throw new NullPointerException();
            }
            Node<K, V>[] nodeArr = this.map.table;
            if (nodeArr != null) {
                Traverser traverser = new Traverser(nodeArr, nodeArr.length, 0, nodeArr.length);
                while (true) {
                    Node<K, V> advance = traverser.advance();
                    if (advance != null) {
                        consumer.accept(advance.val);
                    } else {
                        return;
                    }
                }
            }
        }
    }

    static final class EntrySetView<K, V> extends CollectionView<K, V, Map.Entry<K, V>> implements Set<Map.Entry<K, V>>, Serializable, j$.util.Set<Map.Entry<K, V>> {
        private static final long serialVersionUID = 2249069246763182397L;

        @Override // java.util.Collection, j$.util.Collection
        public /* sintético */ Stream parallelStream() {
            return Collection.CC.$default$parallelStream(this);
        }

        @Override // java.util.Collection
        public /* sintético */ java.util.stream.Stream parallelStream() {
            return Stream.Wrapper.convert(parallelStream());
        }

        @Override // java.util.Collection, java.lang.Iterable, java.util.Set
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

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$EntrySetView != java.util.concurrent.ConcurrentHashMap$EntrySetView<K, V> */
        EntrySetView(ConcurrentHashMap<K, V> concurrentHashMap) {
            super(concurrentHashMap);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$EntrySetView != java.util.concurrent.ConcurrentHashMap$EntrySetView<K, V> */
        @Override // j$.util.concurrent.ConcurrentHashMap.CollectionView, java.util.Collection
        public boolean contains(Object o) {
            Map.Entry<?, ?> e;
            Object k;
            Object r;
            Object v;
            return (!(o instanceof Map.Entry) || (k = (e = (Map.Entry) o).getKey()) == null || (r = this.map.get(k)) == null || (v = e.getValue()) == null || (v != r && !v.equals(r))) ? false : true;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$EntrySetView != java.util.concurrent.ConcurrentHashMap$EntrySetView<K, V> */
        @Override // j$.util.concurrent.ConcurrentHashMap.CollectionView, java.util.Collection
        public boolean remove(Object o) {
            Map.Entry<?, ?> e;
            Object k;
            Object v;
            return (o instanceof Map.Entry) && (k = (e = (Map.Entry) o).getKey()) != null && (v = e.getValue()) != null && this.map.remove(k, v);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$EntrySetView != java.util.concurrent.ConcurrentHashMap$EntrySetView<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        @Override // j$.util.concurrent.ConcurrentHashMap.CollectionView, java.util.Collection, java.lang.Iterable
        public Iterator<Map.Entry<K, V>> iterator() {
            ConcurrentHashMap<K, V> concurrentHashMap = this.map;
            Node<K, V>[] nodeArr = concurrentHashMap.table;
            int f = nodeArr == null ? 0 : nodeArr.length;
            return new EntryIterator(nodeArr, f, 0, f, concurrentHashMap);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$EntrySetView != java.util.concurrent.ConcurrentHashMap$EntrySetView<K, V> */
        @Override // java.util.Collection, java.util.Set
        public boolean add(Map.Entry<K, V> e) {
            return this.map.putVal(e.getKey(), e.getValue(), false) == null;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$EntrySetView != java.util.concurrent.ConcurrentHashMap$EntrySetView<K, V> */
        @Override // java.util.Collection, java.util.Set
        public boolean addAll(java.util.Collection<? extends Map.Entry<K, V>> c) {
            boolean added = false;
            for (Map.Entry<K, V> e : c) {
                if (add((Map.Entry) e)) {
                    added = true;
                }
            }
            return added;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$EntrySetView != java.util.concurrent.ConcurrentHashMap$EntrySetView<K, V> */
        @Override // java.util.Collection, j$.util.Collection
        public boolean removeIf(Predicate<? super Map.Entry<K, V>> filter) {
            return this.map.removeEntryIf(filter);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$EntrySetView != java.util.concurrent.ConcurrentHashMap$EntrySetView<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Traverser != java.util.concurrent.ConcurrentHashMap$Traverser<K, V> */
        @Override // java.util.Collection, java.util.Set
        public final int hashCode() {
            int h = 0;
            Node<K, V>[] nodeArr = this.map.table;
            if (nodeArr != null) {
                Traverser traverser = new Traverser(nodeArr, nodeArr.length, 0, nodeArr.length);
                while (true) {
                    Node<K, V> advance = traverser.advance();
                    if (advance == null) {
                        break;
                    }
                    h += advance.hashCode();
                }
            }
            return h;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$EntrySetView != java.util.concurrent.ConcurrentHashMap$EntrySetView<K, V> */
        @Override // java.util.Collection, java.util.Set
        public final boolean equals(Object o) {
            Set<?> c;
            return (o instanceof Set) && ((c = (Set) o) == this || (containsAll(c) && c.containsAll(this)));
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap != java.util.concurrent.ConcurrentHashMap<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$EntrySetView != java.util.concurrent.ConcurrentHashMap$EntrySetView<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        @Override // java.util.Collection, java.lang.Iterable, java.util.Set, j$.util.Set, j$.util.Collection, j$.lang.Iterable
        public Spliterator<Map.Entry<K, V>> spliterator() {
            ConcurrentHashMap<K, V> concurrentHashMap = this.map;
            long n = concurrentHashMap.sumCount();
            Node<K, V>[] nodeArr = concurrentHashMap.table;
            int f = nodeArr == null ? 0 : nodeArr.length;
            return new EntrySpliterator(nodeArr, f, 0, f, n < 0 ? 0L : n, concurrentHashMap);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$EntrySetView != java.util.concurrent.ConcurrentHashMap$EntrySetView<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Traverser != java.util.concurrent.ConcurrentHashMap$Traverser<K, V> */
        @Override // java.lang.Iterable, j$.util.Collection, j$.lang.Iterable
        public void forEach(Consumer<? super Map.Entry<K, V>> action) {
            if (action == null) {
                throw new NullPointerException();
            }
            Node<K, V>[] nodeArr = this.map.table;
            if (nodeArr != null) {
                Traverser traverser = new Traverser(nodeArr, nodeArr.length, 0, nodeArr.length);
                while (true) {
                    Node<K, V> advance = traverser.advance();
                    if (advance != null) {
                        action.accept(new MapEntry(advance.key, advance.val, this.map));
                    } else {
                        return;
                    }
                }
            }
        }
    }

    static abstract class BulkTask<K, V, R> extends CountedCompleter<R> {
        int baseIndex;
        int baseLimit;
        final int baseSize;
        int batch;
        int index;
        Node<K, V> next;
        TableStack<K, V> spare;
        TableStack<K, V> stack;
        Node<K, V>[] tab;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, R> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        BulkTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr) {
            super(bulkTask);
            this.batch = b;
            this.baseIndex = i;
            this.index = i;
            this.tab = nodeArr;
            if (nodeArr == null) {
                this.baseLimit = 0;
                this.baseSize = 0;
            } else if (bulkTask == null) {
                int length = nodeArr.length;
                this.baseLimit = length;
                this.baseSize = length;
            } else {
                this.baseLimit = f;
                this.baseSize = bulkTask.baseSize;
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, R> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        final Node<K, V> advance() {
            Node<K, V>[] nodeArr;
            int n;
            int i;
            Node<K, V> node = this.next;
            Node<K, V> node2 = node;
            if (node != null) {
                node2 = node2.next;
            }
            while (node2 == null) {
                if (this.baseIndex >= this.baseLimit || (nodeArr = this.tab) == null || (n = nodeArr.length) <= (i = this.index) || i < 0) {
                    this.next = null;
                    return null;
                }
                Node<K, V> tabAt = ConcurrentHashMap.tabAt(nodeArr, i);
                node2 = tabAt;
                if (tabAt != null && node2.hash < 0) {
                    if (node2 instanceof ForwardingNode) {
                        this.tab = ((ForwardingNode) node2).nextTable;
                        node2 = null;
                        pushState(nodeArr, i, n);
                    } else if (node2 instanceof TreeBin) {
                        node2 = ((TreeBin) node2).first;
                    } else {
                        node2 = null;
                    }
                }
                if (this.stack != null) {
                    recoverState(n);
                } else {
                    int i2 = this.baseSize + i;
                    this.index = i2;
                    if (i2 >= n) {
                        int i3 = this.baseIndex + 1;
                        this.baseIndex = i3;
                        this.index = i3;
                    }
                }
            }
            this.next = node2;
            return node2;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, R> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TableStack != java.util.concurrent.ConcurrentHashMap$TableStack<K, V> */
        private void pushState(Node<K, V>[] nodeArr, int i, int n) {
            TableStack<K, V> tableStack = this.spare;
            if (tableStack != null) {
                this.spare = tableStack.next;
            } else {
                tableStack = new TableStack<>();
            }
            tableStack.tab = nodeArr;
            tableStack.length = n;
            tableStack.index = i;
            tableStack.next = this.stack;
            this.stack = tableStack;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, R> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$TableStack != java.util.concurrent.ConcurrentHashMap$TableStack<K, V> */
        private void recoverState(int n) {
            TableStack<K, V> tableStack;
            while (true) {
                tableStack = this.stack;
                if (tableStack == null) {
                    break;
                }
                int i = this.index;
                int len = tableStack.length;
                int i2 = i + len;
                this.index = i2;
                if (i2 < n) {
                    break;
                }
                n = len;
                this.index = tableStack.index;
                this.tab = tableStack.tab;
                tableStack.tab = null;
                TableStack<K, V> tableStack2 = tableStack.next;
                tableStack.next = this.spare;
                this.stack = tableStack2;
                this.spare = tableStack;
            }
            if (tableStack == null) {
                int i3 = this.index + this.baseSize;
                this.index = i3;
                if (i3 >= n) {
                    int i4 = this.baseIndex + 1;
                    this.baseIndex = i4;
                    this.index = i4;
                }
            }
        }
    }

    static final class ForEachKeyTask<K, V> extends BulkTask<K, V, Void> {
        final Consumer<? super K> action;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ForEachKeyTask != java.util.concurrent.ConcurrentHashMap$ForEachKeyTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        ForEachKeyTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, Consumer<? super K> action) {
            super(bulkTask, b, i, f, nodeArr);
            this.action = action;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ForEachKeyTask != java.util.concurrent.ConcurrentHashMap$ForEachKeyTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            Consumer<? super K> consumer = this.action;
            if (consumer != null) {
                int i = this.baseIndex;
                while (this.batch > 0) {
                    int i2 = this.baseLimit;
                    int i3 = (i2 + i) >>> 1;
                    if (i3 <= i) {
                        break;
                    }
                    addToPendingCount(1);
                    int i4 = this.batch >>> 1;
                    this.batch = i4;
                    this.baseLimit = i3;
                    new ForEachKeyTask(this, i4, i3, i2, this.tab, consumer).fork();
                }
                while (true) {
                    Node<K, V> advance = advance();
                    if (advance != null) {
                        consumer.accept(advance.key);
                    } else {
                        propagateCompletion();
                        return;
                    }
                }
            }
        }
    }

    static final class ForEachValueTask<K, V> extends BulkTask<K, V, Void> {
        final Consumer<? super V> action;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ForEachValueTask != java.util.concurrent.ConcurrentHashMap$ForEachValueTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        ForEachValueTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, Consumer<? super V> action) {
            super(bulkTask, b, i, f, nodeArr);
            this.action = action;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ForEachValueTask != java.util.concurrent.ConcurrentHashMap$ForEachValueTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            Consumer<? super V> consumer = this.action;
            if (consumer != null) {
                int i = this.baseIndex;
                while (this.batch > 0) {
                    int i2 = this.baseLimit;
                    int i3 = (i2 + i) >>> 1;
                    if (i3 <= i) {
                        break;
                    }
                    addToPendingCount(1);
                    int i4 = this.batch >>> 1;
                    this.batch = i4;
                    this.baseLimit = i3;
                    new ForEachValueTask(this, i4, i3, i2, this.tab, consumer).fork();
                }
                while (true) {
                    Node<K, V> advance = advance();
                    if (advance != null) {
                        consumer.accept(advance.val);
                    } else {
                        propagateCompletion();
                        return;
                    }
                }
            }
        }
    }

    static final class ForEachEntryTask<K, V> extends BulkTask<K, V, Void> {
        final Consumer<? super Map.Entry<K, V>> action;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ForEachEntryTask != java.util.concurrent.ConcurrentHashMap$ForEachEntryTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        ForEachEntryTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, Consumer<? super Map.Entry<K, V>> action) {
            super(bulkTask, b, i, f, nodeArr);
            this.action = action;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ForEachEntryTask != java.util.concurrent.ConcurrentHashMap$ForEachEntryTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            Consumer<? super Map.Entry<K, V>> action = this.action;
            if (action != null) {
                int i = this.baseIndex;
                while (this.batch > 0) {
                    int f = this.baseLimit;
                    int h = (f + i) >>> 1;
                    if (h <= i) {
                        break;
                    }
                    addToPendingCount(1);
                    int i2 = this.batch >>> 1;
                    this.batch = i2;
                    this.baseLimit = h;
                    new ForEachEntryTask(this, i2, h, f, this.tab, action).fork();
                }
                while (true) {
                    Node<K, V> advance = advance();
                    if (advance != null) {
                        action.accept(advance);
                    } else {
                        propagateCompletion();
                        return;
                    }
                }
            }
        }
    }

    static final class ForEachMappingTask<K, V> extends BulkTask<K, V, Void> {
        final BiConsumer<? super K, ? super V> action;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ForEachMappingTask != java.util.concurrent.ConcurrentHashMap$ForEachMappingTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        ForEachMappingTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, BiConsumer<? super K, ? super V> action) {
            super(bulkTask, b, i, f, nodeArr);
            this.action = action;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ForEachMappingTask != java.util.concurrent.ConcurrentHashMap$ForEachMappingTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            BiConsumer<? super K, ? super V> biConsumer = this.action;
            if (biConsumer != null) {
                int i = this.baseIndex;
                while (this.batch > 0) {
                    int i2 = this.baseLimit;
                    int i3 = (i2 + i) >>> 1;
                    if (i3 <= i) {
                        break;
                    }
                    addToPendingCount(1);
                    int i4 = this.batch >>> 1;
                    this.batch = i4;
                    this.baseLimit = i3;
                    new ForEachMappingTask(this, i4, i3, i2, this.tab, biConsumer).fork();
                }
                while (true) {
                    Node<K, V> advance = advance();
                    if (advance != null) {
                        biConsumer.accept(advance.key, advance.val);
                    } else {
                        propagateCompletion();
                        return;
                    }
                }
            }
        }
    }

    static final class ForEachTransformedKeyTask<K, V, U> extends BulkTask<K, V, Void> {
        final Consumer<? super U> action;
        final Function<? super K, ? extends U> transformer;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ForEachTransformedKeyTask != java.util.concurrent.ConcurrentHashMap$ForEachTransformedKeyTask<K, V, U> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        ForEachTransformedKeyTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, Function<? super K, ? extends U> transformer, Consumer<? super U> action) {
            super(bulkTask, b, i, f, nodeArr);
            this.transformer = transformer;
            this.action = action;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ForEachTransformedKeyTask != java.util.concurrent.ConcurrentHashMap$ForEachTransformedKeyTask<K, V, U> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            Function<? super K, ? extends U> function = this.transformer;
            if (function == null) {
                return;
            }
            Consumer<? super U> consumer = this.action;
            if (consumer != null) {
                int i = this.baseIndex;
                while (this.batch > 0) {
                    int i2 = this.baseLimit;
                    int i3 = (i2 + i) >>> 1;
                    if (i3 <= i) {
                        break;
                    }
                    addToPendingCount(1);
                    int i4 = this.batch >>> 1;
                    this.batch = i4;
                    this.baseLimit = i3;
                    new ForEachTransformedKeyTask(this, i4, i3, i2, this.tab, function, consumer).fork();
                }
                while (true) {
                    Node<K, V> advance = advance();
                    if (advance != null) {
                        U apply = function.apply(advance.key);
                        if (apply != null) {
                            consumer.accept(apply);
                        }
                    } else {
                        propagateCompletion();
                        return;
                    }
                }
            }
        }
    }

    static final class ForEachTransformedValueTask<K, V, U> extends BulkTask<K, V, Void> {
        final Consumer<? super U> action;
        final Function<? super V, ? extends U> transformer;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ForEachTransformedValueTask != java.util.concurrent.ConcurrentHashMap$ForEachTransformedValueTask<K, V, U> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        ForEachTransformedValueTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, Function<? super V, ? extends U> transformer, Consumer<? super U> action) {
            super(bulkTask, b, i, f, nodeArr);
            this.transformer = transformer;
            this.action = action;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ForEachTransformedValueTask != java.util.concurrent.ConcurrentHashMap$ForEachTransformedValueTask<K, V, U> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            Function<? super V, ? extends U> function = this.transformer;
            if (function == null) {
                return;
            }
            Consumer<? super U> consumer = this.action;
            if (consumer != null) {
                int i = this.baseIndex;
                while (this.batch > 0) {
                    int i2 = this.baseLimit;
                    int i3 = (i2 + i) >>> 1;
                    if (i3 <= i) {
                        break;
                    }
                    addToPendingCount(1);
                    int i4 = this.batch >>> 1;
                    this.batch = i4;
                    this.baseLimit = i3;
                    new ForEachTransformedValueTask(this, i4, i3, i2, this.tab, function, consumer).fork();
                }
                while (true) {
                    Node<K, V> advance = advance();
                    if (advance != null) {
                        U apply = function.apply(advance.val);
                        if (apply != null) {
                            consumer.accept(apply);
                        }
                    } else {
                        propagateCompletion();
                        return;
                    }
                }
            }
        }
    }

    static final class ForEachTransformedEntryTask<K, V, U> extends BulkTask<K, V, Void> {
        final Consumer<? super U> action;
        final Function<Map.Entry<K, V>, ? extends U> transformer;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ForEachTransformedEntryTask != java.util.concurrent.ConcurrentHashMap$ForEachTransformedEntryTask<K, V, U> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        ForEachTransformedEntryTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, Function<Map.Entry<K, V>, ? extends U> transformer, Consumer<? super U> action) {
            super(bulkTask, b, i, f, nodeArr);
            this.transformer = transformer;
            this.action = action;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ForEachTransformedEntryTask != java.util.concurrent.ConcurrentHashMap$ForEachTransformedEntryTask<K, V, U> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            Function<Map.Entry<K, V>, ? extends U> function = this.transformer;
            if (function == null) {
                return;
            }
            Consumer<? super U> consumer = this.action;
            if (consumer != null) {
                int i = this.baseIndex;
                while (this.batch > 0) {
                    int i2 = this.baseLimit;
                    int i3 = (i2 + i) >>> 1;
                    if (i3 <= i) {
                        break;
                    }
                    addToPendingCount(1);
                    int i4 = this.batch >>> 1;
                    this.batch = i4;
                    this.baseLimit = i3;
                    new ForEachTransformedEntryTask(this, i4, i3, i2, this.tab, function, consumer).fork();
                }
                while (true) {
                    Node<K, V> advance = advance();
                    if (advance != null) {
                        U apply = function.apply(advance);
                        if (apply != null) {
                            consumer.accept(apply);
                        }
                    } else {
                        propagateCompletion();
                        return;
                    }
                }
            }
        }
    }

    static final class ForEachTransformedMappingTask<K, V, U> extends BulkTask<K, V, Void> {
        final Consumer<? super U> action;
        final BiFunction<? super K, ? super V, ? extends U> transformer;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ForEachTransformedMappingTask != java.util.concurrent.ConcurrentHashMap$ForEachTransformedMappingTask<K, V, U> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        ForEachTransformedMappingTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, BiFunction<? super K, ? super V, ? extends U> transformer, Consumer<? super U> action) {
            super(bulkTask, b, i, f, nodeArr);
            this.transformer = transformer;
            this.action = action;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ForEachTransformedMappingTask != java.util.concurrent.ConcurrentHashMap$ForEachTransformedMappingTask<K, V, U> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            BiFunction<? super K, ? super V, ? extends U> biFunction = this.transformer;
            if (biFunction == null) {
                return;
            }
            Consumer<? super U> consumer = this.action;
            if (consumer != null) {
                int i = this.baseIndex;
                while (this.batch > 0) {
                    int i2 = this.baseLimit;
                    int i3 = (i2 + i) >>> 1;
                    if (i3 <= i) {
                        break;
                    }
                    addToPendingCount(1);
                    int i4 = this.batch >>> 1;
                    this.batch = i4;
                    this.baseLimit = i3;
                    new ForEachTransformedMappingTask(this, i4, i3, i2, this.tab, biFunction, consumer).fork();
                }
                while (true) {
                    Node<K, V> advance = advance();
                    if (advance != null) {
                        U apply = biFunction.apply(advance.key, advance.val);
                        if (apply != null) {
                            consumer.accept(apply);
                        }
                    } else {
                        propagateCompletion();
                        return;
                    }
                }
            }
        }
    }

    static final class SearchKeysTask<K, V, U> extends BulkTask<K, V, U> {
        final AtomicReference<U> result;
        final Function<? super K, ? extends U> searchFunction;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$SearchKeysTask != java.util.concurrent.ConcurrentHashMap$SearchKeysTask<K, V, U> */
        SearchKeysTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, Function<? super K, ? extends U> searchFunction, AtomicReference<U> result) {
            super(bulkTask, b, i, f, nodeArr);
            this.searchFunction = searchFunction;
            this.result = result;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$SearchKeysTask != java.util.concurrent.ConcurrentHashMap$SearchKeysTask<K, V, U> */
        @Override // java.util.concurrent.CountedCompleter, java.util.concurrent.ForkJoinTask
        public final U getRawResult() {
            return this.result.get();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$SearchKeysTask != java.util.concurrent.ConcurrentHashMap$SearchKeysTask<K, V, U> */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            Function<? super K, ? extends U> function = this.searchFunction;
            if (function != null) {
                AtomicReference<U> atomicReference = this.result;
                if (atomicReference != null) {
                    int i = this.baseIndex;
                    while (this.batch > 0) {
                        int i2 = this.baseLimit;
                        int i3 = (i2 + i) >>> 1;
                        if (i3 <= i) {
                            break;
                        }
                        if (atomicReference.get() != null) {
                            return;
                        }
                        addToPendingCount(1);
                        int i4 = this.batch >>> 1;
                        this.batch = i4;
                        this.baseLimit = i3;
                        new SearchKeysTask(this, i4, i3, i2, this.tab, function, atomicReference).fork();
                    }
                    while (atomicReference.get() == null) {
                        Node<K, V> advance = advance();
                        if (advance == null) {
                            propagateCompletion();
                            return;
                        }
                        U apply = function.apply(advance.key);
                        if (apply != null) {
                            if (ConcurrentHashMap$SearchEntriesTask$$ExternalSyntheticBackportWithForwarding0.m(atomicReference, null, apply)) {
                                quietlyCompleteRoot();
                                return;
                            }
                            return;
                        }
                    }
                }
            }
        }
    }

    static final class SearchValuesTask<K, V, U> extends BulkTask<K, V, U> {
        final AtomicReference<U> result;
        final Function<? super V, ? extends U> searchFunction;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$SearchValuesTask != java.util.concurrent.ConcurrentHashMap$SearchValuesTask<K, V, U> */
        SearchValuesTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, Function<? super V, ? extends U> searchFunction, AtomicReference<U> result) {
            super(bulkTask, b, i, f, nodeArr);
            this.searchFunction = searchFunction;
            this.result = result;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$SearchValuesTask != java.util.concurrent.ConcurrentHashMap$SearchValuesTask<K, V, U> */
        @Override // java.util.concurrent.CountedCompleter, java.util.concurrent.ForkJoinTask
        public final U getRawResult() {
            return this.result.get();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$SearchValuesTask != java.util.concurrent.ConcurrentHashMap$SearchValuesTask<K, V, U> */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            Function<? super V, ? extends U> function = this.searchFunction;
            if (function != null) {
                AtomicReference<U> atomicReference = this.result;
                if (atomicReference != null) {
                    int i = this.baseIndex;
                    while (this.batch > 0) {
                        int i2 = this.baseLimit;
                        int i3 = (i2 + i) >>> 1;
                        if (i3 <= i) {
                            break;
                        }
                        if (atomicReference.get() != null) {
                            return;
                        }
                        addToPendingCount(1);
                        int i4 = this.batch >>> 1;
                        this.batch = i4;
                        this.baseLimit = i3;
                        new SearchValuesTask(this, i4, i3, i2, this.tab, function, atomicReference).fork();
                    }
                    while (atomicReference.get() == null) {
                        Node<K, V> advance = advance();
                        if (advance == null) {
                            propagateCompletion();
                            return;
                        }
                        U apply = function.apply(advance.val);
                        if (apply != null) {
                            if (ConcurrentHashMap$SearchEntriesTask$$ExternalSyntheticBackportWithForwarding0.m(atomicReference, null, apply)) {
                                quietlyCompleteRoot();
                                return;
                            }
                            return;
                        }
                    }
                }
            }
        }
    }

    static final class SearchEntriesTask<K, V, U> extends BulkTask<K, V, U> {
        final AtomicReference<U> result;
        final Function<Map.Entry<K, V>, ? extends U> searchFunction;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$SearchEntriesTask != java.util.concurrent.ConcurrentHashMap$SearchEntriesTask<K, V, U> */
        SearchEntriesTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, Function<Map.Entry<K, V>, ? extends U> searchFunction, AtomicReference<U> result) {
            super(bulkTask, b, i, f, nodeArr);
            this.searchFunction = searchFunction;
            this.result = result;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$SearchEntriesTask != java.util.concurrent.ConcurrentHashMap$SearchEntriesTask<K, V, U> */
        @Override // java.util.concurrent.CountedCompleter, java.util.concurrent.ForkJoinTask
        public final U getRawResult() {
            return this.result.get();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$SearchEntriesTask != java.util.concurrent.ConcurrentHashMap$SearchEntriesTask<K, V, U> */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            Function<Map.Entry<K, V>, ? extends U> searchFunction = this.searchFunction;
            if (searchFunction != null) {
                AtomicReference<U> result = this.result;
                if (result != null) {
                    int i = this.baseIndex;
                    while (this.batch > 0) {
                        int f = this.baseLimit;
                        int h = (f + i) >>> 1;
                        if (h <= i) {
                            break;
                        }
                        if (result.get() != null) {
                            return;
                        }
                        addToPendingCount(1);
                        int i2 = this.batch >>> 1;
                        this.batch = i2;
                        this.baseLimit = h;
                        new SearchEntriesTask(this, i2, h, f, this.tab, searchFunction, result).fork();
                    }
                    while (result.get() == null) {
                        Node<K, V> advance = advance();
                        if (advance == null) {
                            propagateCompletion();
                            return;
                        }
                        U u = searchFunction.apply(advance);
                        if (u != null) {
                            if (ConcurrentHashMap$SearchEntriesTask$$ExternalSyntheticBackportWithForwarding0.m(result, null, u)) {
                                quietlyCompleteRoot();
                                return;
                            }
                            return;
                        }
                    }
                }
            }
        }
    }

    static final class SearchMappingsTask<K, V, U> extends BulkTask<K, V, U> {
        final AtomicReference<U> result;
        final BiFunction<? super K, ? super V, ? extends U> searchFunction;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$SearchMappingsTask != java.util.concurrent.ConcurrentHashMap$SearchMappingsTask<K, V, U> */
        SearchMappingsTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, BiFunction<? super K, ? super V, ? extends U> searchFunction, AtomicReference<U> result) {
            super(bulkTask, b, i, f, nodeArr);
            this.searchFunction = searchFunction;
            this.result = result;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$SearchMappingsTask != java.util.concurrent.ConcurrentHashMap$SearchMappingsTask<K, V, U> */
        @Override // java.util.concurrent.CountedCompleter, java.util.concurrent.ForkJoinTask
        public final U getRawResult() {
            return this.result.get();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$SearchMappingsTask != java.util.concurrent.ConcurrentHashMap$SearchMappingsTask<K, V, U> */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            BiFunction<? super K, ? super V, ? extends U> biFunction = this.searchFunction;
            if (biFunction != null) {
                AtomicReference<U> atomicReference = this.result;
                if (atomicReference != null) {
                    int i = this.baseIndex;
                    while (this.batch > 0) {
                        int i2 = this.baseLimit;
                        int i3 = (i2 + i) >>> 1;
                        if (i3 <= i) {
                            break;
                        }
                        if (atomicReference.get() != null) {
                            return;
                        }
                        addToPendingCount(1);
                        int i4 = this.batch >>> 1;
                        this.batch = i4;
                        this.baseLimit = i3;
                        new SearchMappingsTask(this, i4, i3, i2, this.tab, biFunction, atomicReference).fork();
                    }
                    while (atomicReference.get() == null) {
                        Node<K, V> advance = advance();
                        if (advance == null) {
                            propagateCompletion();
                            return;
                        }
                        U apply = biFunction.apply(advance.key, advance.val);
                        if (apply != null) {
                            if (ConcurrentHashMap$SearchEntriesTask$$ExternalSyntheticBackportWithForwarding0.m(atomicReference, null, apply)) {
                                quietlyCompleteRoot();
                                return;
                            }
                            return;
                        }
                    }
                }
            }
        }
    }

    static final class ReduceKeysTask<K, V> extends BulkTask<K, V, K> {
        ReduceKeysTask<K, V> nextRight;
        final BiFunction<? super K, ? super K, ? extends K> reducer;
        K result;
        ReduceKeysTask<K, V> rights;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ReduceKeysTask != java.util.concurrent.ConcurrentHashMap$ReduceKeysTask<K, V> */
        ReduceKeysTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, ReduceKeysTask<K, V> reduceKeysTask, BiFunction<? super K, ? super K, ? extends K> reducer) {
            super(bulkTask, b, i, f, nodeArr);
            this.nextRight = reduceKeysTask;
            this.reducer = reducer;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ReduceKeysTask != java.util.concurrent.ConcurrentHashMap$ReduceKeysTask<K, V> */
        @Override // java.util.concurrent.CountedCompleter, java.util.concurrent.ForkJoinTask
        public final K getRawResult() {
            return this.result;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ReduceKeysTask != java.util.concurrent.ConcurrentHashMap$ReduceKeysTask<K, V> */
        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        /* JADX WARN: falha na inferência de tipo para: r5v0, types: [K, java.lang.Object] */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            ReduceKeysTask<K, V> reduceKeysTask;
            BiFunction<? super K, ? super K, ? extends K> biFunction = this.reducer;
            if (biFunction != null) {
                int i = this.baseIndex;
                while (true) {
                    if (this.batch <= 0) {
                        reduceKeysTask = this;
                        break;
                    }
                    int i2 = this.baseLimit;
                    int i3 = (i2 + i) >>> 1;
                    if (i3 <= i) {
                        reduceKeysTask = this;
                        break;
                    }
                    addToPendingCount(1);
                    int i4 = this.batch >>> 1;
                    this.batch = i4;
                    this.baseLimit = i3;
                    ReduceKeysTask<K, V> reduceKeysTask2 = new ReduceKeysTask<>(this, i4, i3, i2, this.tab, this.rights, biFunction);
                    this.rights = reduceKeysTask2;
                    reduceKeysTask2.fork();
                }
                Object obj = (K) null;
                while (true) {
                    Node<K, V> advance = advance();
                    if (advance == null) {
                        break;
                    }
                    Object obj2 = (K) advance.key;
                    obj = (K) (obj == null ? obj2 : obj2 == null ? obj : biFunction.apply(obj, obj2));
                }
                reduceKeysTask.result = (K) obj;
                for (CountedCompleter<?> firstComplete = firstComplete(); firstComplete != null; firstComplete = firstComplete.nextComplete()) {
                    ReduceKeysTask reduceKeysTask3 = (ReduceKeysTask) firstComplete;
                    ReduceKeysTask<K, V> reduceKeysTask4 = reduceKeysTask3.rights;
                    while (reduceKeysTask4 != null) {
                        K k = reduceKeysTask4.result;
                        if (k != 0) {
                            Object obj3 = (K) reduceKeysTask3.result;
                            reduceKeysTask3.result = obj3 == null ? k : biFunction.apply(obj3, k);
                        }
                        ReduceKeysTask<K, V> reduceKeysTask5 = reduceKeysTask4.nextRight;
                        reduceKeysTask3.rights = reduceKeysTask5;
                        reduceKeysTask4 = reduceKeysTask5;
                    }
                }
            }
        }
    }

    static final class ReduceValuesTask<K, V> extends BulkTask<K, V, V> {
        ReduceValuesTask<K, V> nextRight;
        final BiFunction<? super V, ? super V, ? extends V> reducer;
        V result;
        ReduceValuesTask<K, V> rights;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ReduceValuesTask != java.util.concurrent.ConcurrentHashMap$ReduceValuesTask<K, V> */
        ReduceValuesTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, ReduceValuesTask<K, V> reduceValuesTask, BiFunction<? super V, ? super V, ? extends V> reducer) {
            super(bulkTask, b, i, f, nodeArr);
            this.nextRight = reduceValuesTask;
            this.reducer = reducer;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ReduceValuesTask != java.util.concurrent.ConcurrentHashMap$ReduceValuesTask<K, V> */
        @Override // java.util.concurrent.CountedCompleter, java.util.concurrent.ForkJoinTask
        public final V getRawResult() {
            return this.result;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ReduceValuesTask != java.util.concurrent.ConcurrentHashMap$ReduceValuesTask<K, V> */
        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        /* JADX WARN: falha na inferência de tipo para: r5v0, types: [V, java.lang.Object] */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            ReduceValuesTask<K, V> reduceValuesTask;
            BiFunction<? super V, ? super V, ? extends V> biFunction = this.reducer;
            if (biFunction != null) {
                int i = this.baseIndex;
                while (true) {
                    if (this.batch <= 0) {
                        reduceValuesTask = this;
                        break;
                    }
                    int i2 = this.baseLimit;
                    int i3 = (i2 + i) >>> 1;
                    if (i3 <= i) {
                        reduceValuesTask = this;
                        break;
                    }
                    addToPendingCount(1);
                    int i4 = this.batch >>> 1;
                    this.batch = i4;
                    this.baseLimit = i3;
                    ReduceValuesTask<K, V> reduceValuesTask2 = new ReduceValuesTask<>(this, i4, i3, i2, this.tab, this.rights, biFunction);
                    this.rights = reduceValuesTask2;
                    reduceValuesTask2.fork();
                }
                Object obj = (V) null;
                while (true) {
                    Node<K, V> advance = advance();
                    if (advance == null) {
                        break;
                    }
                    Object obj2 = (V) advance.val;
                    obj = (V) (obj == null ? obj2 : biFunction.apply(obj, obj2));
                }
                reduceValuesTask.result = (V) obj;
                for (CountedCompleter<?> firstComplete = firstComplete(); firstComplete != null; firstComplete = firstComplete.nextComplete()) {
                    ReduceValuesTask reduceValuesTask3 = (ReduceValuesTask) firstComplete;
                    ReduceValuesTask<K, V> reduceValuesTask4 = reduceValuesTask3.rights;
                    while (reduceValuesTask4 != null) {
                        V v = reduceValuesTask4.result;
                        if (v != 0) {
                            Object obj3 = (V) reduceValuesTask3.result;
                            reduceValuesTask3.result = obj3 == null ? v : biFunction.apply(obj3, v);
                        }
                        ReduceValuesTask<K, V> reduceValuesTask5 = reduceValuesTask4.nextRight;
                        reduceValuesTask3.rights = reduceValuesTask5;
                        reduceValuesTask4 = reduceValuesTask5;
                    }
                }
            }
        }
    }

    static final class ReduceEntriesTask<K, V> extends BulkTask<K, V, Map.Entry<K, V>> {
        ReduceEntriesTask<K, V> nextRight;
        final BiFunction<Map.Entry<K, V>, Map.Entry<K, V>, ? extends Map.Entry<K, V>> reducer;
        Map.Entry<K, V> result;
        ReduceEntriesTask<K, V> rights;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ReduceEntriesTask != java.util.concurrent.ConcurrentHashMap$ReduceEntriesTask<K, V> */
        ReduceEntriesTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, ReduceEntriesTask<K, V> reduceEntriesTask, BiFunction<Map.Entry<K, V>, Map.Entry<K, V>, ? extends Map.Entry<K, V>> reducer) {
            super(bulkTask, b, i, f, nodeArr);
            this.nextRight = reduceEntriesTask;
            this.reducer = reducer;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ReduceEntriesTask != java.util.concurrent.ConcurrentHashMap$ReduceEntriesTask<K, V> */
        @Override // java.util.concurrent.CountedCompleter, java.util.concurrent.ForkJoinTask
        public final Map.Entry<K, V> getRawResult() {
            return this.result;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$ReduceEntriesTask != java.util.concurrent.ConcurrentHashMap$ReduceEntriesTask<K, V> */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            ReduceEntriesTask<K, V> reduceEntriesTask;
            BiFunction<Map.Entry<K, V>, Map.Entry<K, V>, ? extends Map.Entry<K, V>> reducer = this.reducer;
            if (reducer != null) {
                int i = this.baseIndex;
                while (true) {
                    if (this.batch <= 0) {
                        reduceEntriesTask = this;
                        break;
                    }
                    int f = this.baseLimit;
                    int h = (f + i) >>> 1;
                    if (h <= i) {
                        reduceEntriesTask = this;
                        break;
                    }
                    addToPendingCount(1);
                    int i2 = this.batch >>> 1;
                    this.batch = i2;
                    this.baseLimit = h;
                    ReduceEntriesTask<K, V> reduceEntriesTask2 = new ReduceEntriesTask<>(this, i2, h, f, this.tab, this.rights, reducer);
                    this.rights = reduceEntriesTask2;
                    reduceEntriesTask2.fork();
                }
                Map.Entry<K, V> r = null;
                while (true) {
                    Node<K, V> advance = advance();
                    if (advance == null) {
                        break;
                    } else {
                        r = r == null ? advance : reducer.apply(r, advance);
                    }
                }
                reduceEntriesTask.result = r;
                for (CountedCompleter<?> c = firstComplete(); c != null; c = c.nextComplete()) {
                    ReduceEntriesTask reduceEntriesTask3 = (ReduceEntriesTask) c;
                    ReduceEntriesTask<K, V> reduceEntriesTask4 = reduceEntriesTask3.rights;
                    while (reduceEntriesTask4 != null) {
                        Map.Entry<K, V> sr = reduceEntriesTask4.result;
                        if (sr != null) {
                            Map.Entry<K, V> tr = reduceEntriesTask3.result;
                            reduceEntriesTask3.result = tr == null ? sr : reducer.apply(tr, sr);
                        }
                        ReduceEntriesTask<K, V> reduceEntriesTask5 = reduceEntriesTask4.nextRight;
                        reduceEntriesTask3.rights = reduceEntriesTask5;
                        reduceEntriesTask4 = reduceEntriesTask5;
                    }
                }
            }
        }
    }

    static final class MapReduceKeysTask<K, V, U> extends BulkTask<K, V, U> {
        MapReduceKeysTask<K, V, U> nextRight;
        final BiFunction<? super U, ? super U, ? extends U> reducer;
        U result;
        MapReduceKeysTask<K, V, U> rights;
        final Function<? super K, ? extends U> transformer;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceKeysTask != java.util.concurrent.ConcurrentHashMap$MapReduceKeysTask<K, V, U> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        MapReduceKeysTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, MapReduceKeysTask<K, V, U> mapReduceKeysTask, Function<? super K, ? extends U> transformer, BiFunction<? super U, ? super U, ? extends U> reducer) {
            super(bulkTask, b, i, f, nodeArr);
            this.nextRight = mapReduceKeysTask;
            this.transformer = transformer;
            this.reducer = reducer;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceKeysTask != java.util.concurrent.ConcurrentHashMap$MapReduceKeysTask<K, V, U> */
        @Override // java.util.concurrent.CountedCompleter, java.util.concurrent.ForkJoinTask
        public final U getRawResult() {
            return this.result;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceKeysTask != java.util.concurrent.ConcurrentHashMap$MapReduceKeysTask<K, V, U> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        /* JADX WARN: falha na inferência de tipo para: r5v0, types: [U, java.lang.Object] */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            MapReduceKeysTask<K, V, U> mapReduceKeysTask;
            Function<? super K, ? extends U> function = this.transformer;
            if (function != null) {
                BiFunction<? super U, ? super U, ? extends U> biFunction = this.reducer;
                if (biFunction != null) {
                    int i = this.baseIndex;
                    while (true) {
                        if (this.batch <= 0) {
                            mapReduceKeysTask = this;
                            break;
                        }
                        int i2 = this.baseLimit;
                        int i3 = (i2 + i) >>> 1;
                        if (i3 <= i) {
                            mapReduceKeysTask = this;
                            break;
                        }
                        addToPendingCount(1);
                        int i4 = this.batch >>> 1;
                        this.batch = i4;
                        this.baseLimit = i3;
                        MapReduceKeysTask<K, V, U> mapReduceKeysTask2 = new MapReduceKeysTask<>(this, i4, i3, i2, this.tab, this.rights, function, biFunction);
                        this.rights = mapReduceKeysTask2;
                        mapReduceKeysTask2.fork();
                    }
                    Object obj = (U) null;
                    while (true) {
                        Node<K, V> advance = advance();
                        if (advance == null) {
                            break;
                        }
                        Object obj2 = (U) function.apply((K) advance.key);
                        if (obj2 != null) {
                            obj = (U) (obj == null ? obj2 : biFunction.apply(obj, obj2));
                        }
                    }
                    mapReduceKeysTask.result = (U) obj;
                    for (CountedCompleter<?> firstComplete = firstComplete(); firstComplete != null; firstComplete = firstComplete.nextComplete()) {
                        MapReduceKeysTask mapReduceKeysTask3 = (MapReduceKeysTask) firstComplete;
                        MapReduceKeysTask<K, V, U> mapReduceKeysTask4 = mapReduceKeysTask3.rights;
                        while (mapReduceKeysTask4 != null) {
                            U u = mapReduceKeysTask4.result;
                            if (u != 0) {
                                Object obj3 = (U) mapReduceKeysTask3.result;
                                mapReduceKeysTask3.result = obj3 == null ? u : biFunction.apply(obj3, u);
                            }
                            MapReduceKeysTask<K, V, U> mapReduceKeysTask5 = mapReduceKeysTask4.nextRight;
                            mapReduceKeysTask3.rights = mapReduceKeysTask5;
                            mapReduceKeysTask4 = mapReduceKeysTask5;
                        }
                    }
                }
            }
        }
    }

    static final class MapReduceValuesTask<K, V, U> extends BulkTask<K, V, U> {
        MapReduceValuesTask<K, V, U> nextRight;
        final BiFunction<? super U, ? super U, ? extends U> reducer;
        U result;
        MapReduceValuesTask<K, V, U> rights;
        final Function<? super V, ? extends U> transformer;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceValuesTask != java.util.concurrent.ConcurrentHashMap$MapReduceValuesTask<K, V, U> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        MapReduceValuesTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, MapReduceValuesTask<K, V, U> mapReduceValuesTask, Function<? super V, ? extends U> transformer, BiFunction<? super U, ? super U, ? extends U> reducer) {
            super(bulkTask, b, i, f, nodeArr);
            this.nextRight = mapReduceValuesTask;
            this.transformer = transformer;
            this.reducer = reducer;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceValuesTask != java.util.concurrent.ConcurrentHashMap$MapReduceValuesTask<K, V, U> */
        @Override // java.util.concurrent.CountedCompleter, java.util.concurrent.ForkJoinTask
        public final U getRawResult() {
            return this.result;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceValuesTask != java.util.concurrent.ConcurrentHashMap$MapReduceValuesTask<K, V, U> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        /* JADX WARN: falha na inferência de tipo para: r5v0, types: [U, java.lang.Object] */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            MapReduceValuesTask<K, V, U> mapReduceValuesTask;
            Function<? super V, ? extends U> function = this.transformer;
            if (function != null) {
                BiFunction<? super U, ? super U, ? extends U> biFunction = this.reducer;
                if (biFunction != null) {
                    int i = this.baseIndex;
                    while (true) {
                        if (this.batch <= 0) {
                            mapReduceValuesTask = this;
                            break;
                        }
                        int i2 = this.baseLimit;
                        int i3 = (i2 + i) >>> 1;
                        if (i3 <= i) {
                            mapReduceValuesTask = this;
                            break;
                        }
                        addToPendingCount(1);
                        int i4 = this.batch >>> 1;
                        this.batch = i4;
                        this.baseLimit = i3;
                        MapReduceValuesTask<K, V, U> mapReduceValuesTask2 = new MapReduceValuesTask<>(this, i4, i3, i2, this.tab, this.rights, function, biFunction);
                        this.rights = mapReduceValuesTask2;
                        mapReduceValuesTask2.fork();
                    }
                    Object obj = (U) null;
                    while (true) {
                        Node<K, V> advance = advance();
                        if (advance == null) {
                            break;
                        }
                        Object obj2 = (U) function.apply((V) advance.val);
                        if (obj2 != null) {
                            obj = (U) (obj == null ? obj2 : biFunction.apply(obj, obj2));
                        }
                    }
                    mapReduceValuesTask.result = (U) obj;
                    for (CountedCompleter<?> firstComplete = firstComplete(); firstComplete != null; firstComplete = firstComplete.nextComplete()) {
                        MapReduceValuesTask mapReduceValuesTask3 = (MapReduceValuesTask) firstComplete;
                        MapReduceValuesTask<K, V, U> mapReduceValuesTask4 = mapReduceValuesTask3.rights;
                        while (mapReduceValuesTask4 != null) {
                            U u = mapReduceValuesTask4.result;
                            if (u != 0) {
                                Object obj3 = (U) mapReduceValuesTask3.result;
                                mapReduceValuesTask3.result = obj3 == null ? u : biFunction.apply(obj3, u);
                            }
                            MapReduceValuesTask<K, V, U> mapReduceValuesTask5 = mapReduceValuesTask4.nextRight;
                            mapReduceValuesTask3.rights = mapReduceValuesTask5;
                            mapReduceValuesTask4 = mapReduceValuesTask5;
                        }
                    }
                }
            }
        }
    }

    static final class MapReduceEntriesTask<K, V, U> extends BulkTask<K, V, U> {
        MapReduceEntriesTask<K, V, U> nextRight;
        final BiFunction<? super U, ? super U, ? extends U> reducer;
        U result;
        MapReduceEntriesTask<K, V, U> rights;
        final Function<Map.Entry<K, V>, ? extends U> transformer;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceEntriesTask != java.util.concurrent.ConcurrentHashMap$MapReduceEntriesTask<K, V, U> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        MapReduceEntriesTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, MapReduceEntriesTask<K, V, U> mapReduceEntriesTask, Function<Map.Entry<K, V>, ? extends U> transformer, BiFunction<? super U, ? super U, ? extends U> reducer) {
            super(bulkTask, b, i, f, nodeArr);
            this.nextRight = mapReduceEntriesTask;
            this.transformer = transformer;
            this.reducer = reducer;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceEntriesTask != java.util.concurrent.ConcurrentHashMap$MapReduceEntriesTask<K, V, U> */
        @Override // java.util.concurrent.CountedCompleter, java.util.concurrent.ForkJoinTask
        public final U getRawResult() {
            return this.result;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceEntriesTask != java.util.concurrent.ConcurrentHashMap$MapReduceEntriesTask<K, V, U> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        /* JADX WARN: falha na inferência de tipo para: r5v0, types: [U, java.lang.Object] */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            MapReduceEntriesTask<K, V, U> mapReduceEntriesTask;
            Function<Map.Entry<K, V>, ? extends U> function = this.transformer;
            if (function != null) {
                BiFunction<? super U, ? super U, ? extends U> biFunction = this.reducer;
                if (biFunction != null) {
                    int i = this.baseIndex;
                    while (true) {
                        if (this.batch <= 0) {
                            mapReduceEntriesTask = this;
                            break;
                        }
                        int i2 = this.baseLimit;
                        int i3 = (i2 + i) >>> 1;
                        if (i3 <= i) {
                            mapReduceEntriesTask = this;
                            break;
                        }
                        addToPendingCount(1);
                        int i4 = this.batch >>> 1;
                        this.batch = i4;
                        this.baseLimit = i3;
                        MapReduceEntriesTask<K, V, U> mapReduceEntriesTask2 = new MapReduceEntriesTask<>(this, i4, i3, i2, this.tab, this.rights, function, biFunction);
                        this.rights = mapReduceEntriesTask2;
                        mapReduceEntriesTask2.fork();
                    }
                    Object obj = (U) null;
                    while (true) {
                        Node<K, V> advance = advance();
                        if (advance == null) {
                            break;
                        }
                        Object obj2 = (U) function.apply(advance);
                        if (obj2 != null) {
                            obj = (U) (obj == null ? obj2 : biFunction.apply(obj, obj2));
                        }
                    }
                    mapReduceEntriesTask.result = (U) obj;
                    for (CountedCompleter<?> firstComplete = firstComplete(); firstComplete != null; firstComplete = firstComplete.nextComplete()) {
                        MapReduceEntriesTask mapReduceEntriesTask3 = (MapReduceEntriesTask) firstComplete;
                        MapReduceEntriesTask<K, V, U> mapReduceEntriesTask4 = mapReduceEntriesTask3.rights;
                        while (mapReduceEntriesTask4 != null) {
                            U u = mapReduceEntriesTask4.result;
                            if (u != 0) {
                                Object obj3 = (U) mapReduceEntriesTask3.result;
                                mapReduceEntriesTask3.result = obj3 == null ? u : biFunction.apply(obj3, u);
                            }
                            MapReduceEntriesTask<K, V, U> mapReduceEntriesTask5 = mapReduceEntriesTask4.nextRight;
                            mapReduceEntriesTask3.rights = mapReduceEntriesTask5;
                            mapReduceEntriesTask4 = mapReduceEntriesTask5;
                        }
                    }
                }
            }
        }
    }

    static final class MapReduceMappingsTask<K, V, U> extends BulkTask<K, V, U> {
        MapReduceMappingsTask<K, V, U> nextRight;
        final BiFunction<? super U, ? super U, ? extends U> reducer;
        U result;
        MapReduceMappingsTask<K, V, U> rights;
        final BiFunction<? super K, ? super V, ? extends U> transformer;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceMappingsTask != java.util.concurrent.ConcurrentHashMap$MapReduceMappingsTask<K, V, U> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        MapReduceMappingsTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, MapReduceMappingsTask<K, V, U> mapReduceMappingsTask, BiFunction<? super K, ? super V, ? extends U> transformer, BiFunction<? super U, ? super U, ? extends U> reducer) {
            super(bulkTask, b, i, f, nodeArr);
            this.nextRight = mapReduceMappingsTask;
            this.transformer = transformer;
            this.reducer = reducer;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceMappingsTask != java.util.concurrent.ConcurrentHashMap$MapReduceMappingsTask<K, V, U> */
        @Override // java.util.concurrent.CountedCompleter, java.util.concurrent.ForkJoinTask
        public final U getRawResult() {
            return this.result;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceMappingsTask != java.util.concurrent.ConcurrentHashMap$MapReduceMappingsTask<K, V, U> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        /* JADX WARN: falha na inferência de tipo para: r5v0, types: [U, java.lang.Object] */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            MapReduceMappingsTask<K, V, U> mapReduceMappingsTask;
            BiFunction<? super K, ? super V, ? extends U> biFunction = this.transformer;
            if (biFunction != null) {
                BiFunction<? super U, ? super U, ? extends U> biFunction2 = this.reducer;
                if (biFunction2 != null) {
                    int i = this.baseIndex;
                    while (true) {
                        if (this.batch <= 0) {
                            mapReduceMappingsTask = this;
                            break;
                        }
                        int i2 = this.baseLimit;
                        int i3 = (i2 + i) >>> 1;
                        if (i3 <= i) {
                            mapReduceMappingsTask = this;
                            break;
                        }
                        addToPendingCount(1);
                        int i4 = this.batch >>> 1;
                        this.batch = i4;
                        this.baseLimit = i3;
                        MapReduceMappingsTask<K, V, U> mapReduceMappingsTask2 = new MapReduceMappingsTask<>(this, i4, i3, i2, this.tab, this.rights, biFunction, biFunction2);
                        this.rights = mapReduceMappingsTask2;
                        mapReduceMappingsTask2.fork();
                    }
                    Object obj = (U) null;
                    while (true) {
                        Node<K, V> advance = advance();
                        if (advance == null) {
                            break;
                        }
                        Object obj2 = (U) biFunction.apply((K) advance.key, (V) advance.val);
                        if (obj2 != null) {
                            obj = (U) (obj == null ? obj2 : biFunction2.apply(obj, obj2));
                        }
                    }
                    mapReduceMappingsTask.result = (U) obj;
                    for (CountedCompleter<?> firstComplete = firstComplete(); firstComplete != null; firstComplete = firstComplete.nextComplete()) {
                        MapReduceMappingsTask mapReduceMappingsTask3 = (MapReduceMappingsTask) firstComplete;
                        MapReduceMappingsTask<K, V, U> mapReduceMappingsTask4 = mapReduceMappingsTask3.rights;
                        while (mapReduceMappingsTask4 != null) {
                            U u = mapReduceMappingsTask4.result;
                            if (u != 0) {
                                Object obj3 = (U) mapReduceMappingsTask3.result;
                                mapReduceMappingsTask3.result = obj3 == null ? u : biFunction2.apply(obj3, u);
                            }
                            MapReduceMappingsTask<K, V, U> mapReduceMappingsTask5 = mapReduceMappingsTask4.nextRight;
                            mapReduceMappingsTask3.rights = mapReduceMappingsTask5;
                            mapReduceMappingsTask4 = mapReduceMappingsTask5;
                        }
                    }
                }
            }
        }
    }

    static final class MapReduceKeysToDoubleTask<K, V> extends BulkTask<K, V, Double> {
        final double basis;
        MapReduceKeysToDoubleTask<K, V> nextRight;
        final DoubleBinaryOperator reducer;
        double result;
        MapReduceKeysToDoubleTask<K, V> rights;
        final ToDoubleFunction<? super K> transformer;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceKeysToDoubleTask != java.util.concurrent.ConcurrentHashMap$MapReduceKeysToDoubleTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        MapReduceKeysToDoubleTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, MapReduceKeysToDoubleTask<K, V> mapReduceKeysToDoubleTask, ToDoubleFunction<? super K> transformer, double basis, DoubleBinaryOperator reducer) {
            super(bulkTask, b, i, f, nodeArr);
            this.nextRight = mapReduceKeysToDoubleTask;
            this.transformer = transformer;
            this.basis = basis;
            this.reducer = reducer;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceKeysToDoubleTask != java.util.concurrent.ConcurrentHashMap$MapReduceKeysToDoubleTask<K, V> */
        @Override // java.util.concurrent.CountedCompleter, java.util.concurrent.ForkJoinTask
        public final Double getRawResult() {
            return Double.valueOf(this.result);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceKeysToDoubleTask != java.util.concurrent.ConcurrentHashMap$MapReduceKeysToDoubleTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            MapReduceKeysToDoubleTask<K, V> mapReduceKeysToDoubleTask;
            ToDoubleFunction<? super K> toDoubleFunction = this.transformer;
            if (toDoubleFunction != null) {
                DoubleBinaryOperator doubleBinaryOperator = this.reducer;
                if (doubleBinaryOperator != null) {
                    double d = this.basis;
                    int i = this.baseIndex;
                    while (true) {
                        if (this.batch <= 0) {
                            mapReduceKeysToDoubleTask = this;
                            break;
                        }
                        int i2 = this.baseLimit;
                        int i3 = (i2 + i) >>> 1;
                        if (i3 <= i) {
                            mapReduceKeysToDoubleTask = this;
                            break;
                        }
                        addToPendingCount(1);
                        int i4 = this.batch >>> 1;
                        this.batch = i4;
                        this.baseLimit = i3;
                        MapReduceKeysToDoubleTask<K, V> mapReduceKeysToDoubleTask2 = new MapReduceKeysToDoubleTask<>(this, i4, i3, i2, this.tab, this.rights, toDoubleFunction, d, doubleBinaryOperator);
                        this.rights = mapReduceKeysToDoubleTask2;
                        mapReduceKeysToDoubleTask2.fork();
                    }
                    while (true) {
                        Node<K, V> advance = advance();
                        if (advance == null) {
                            break;
                        } else {
                            d = doubleBinaryOperator.applyAsDouble(d, toDoubleFunction.applyAsDouble(advance.key));
                        }
                    }
                    mapReduceKeysToDoubleTask.result = d;
                    for (CountedCompleter<?> firstComplete = firstComplete(); firstComplete != null; firstComplete = firstComplete.nextComplete()) {
                        MapReduceKeysToDoubleTask mapReduceKeysToDoubleTask3 = (MapReduceKeysToDoubleTask) firstComplete;
                        MapReduceKeysToDoubleTask<K, V> mapReduceKeysToDoubleTask4 = mapReduceKeysToDoubleTask3.rights;
                        while (mapReduceKeysToDoubleTask4 != null) {
                            mapReduceKeysToDoubleTask3.result = doubleBinaryOperator.applyAsDouble(mapReduceKeysToDoubleTask3.result, mapReduceKeysToDoubleTask4.result);
                            MapReduceKeysToDoubleTask<K, V> mapReduceKeysToDoubleTask5 = mapReduceKeysToDoubleTask4.nextRight;
                            mapReduceKeysToDoubleTask3.rights = mapReduceKeysToDoubleTask5;
                            mapReduceKeysToDoubleTask4 = mapReduceKeysToDoubleTask5;
                        }
                    }
                }
            }
        }
    }

    static final class MapReduceValuesToDoubleTask<K, V> extends BulkTask<K, V, Double> {
        final double basis;
        MapReduceValuesToDoubleTask<K, V> nextRight;
        final DoubleBinaryOperator reducer;
        double result;
        MapReduceValuesToDoubleTask<K, V> rights;
        final ToDoubleFunction<? super V> transformer;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceValuesToDoubleTask != java.util.concurrent.ConcurrentHashMap$MapReduceValuesToDoubleTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        MapReduceValuesToDoubleTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, MapReduceValuesToDoubleTask<K, V> mapReduceValuesToDoubleTask, ToDoubleFunction<? super V> transformer, double basis, DoubleBinaryOperator reducer) {
            super(bulkTask, b, i, f, nodeArr);
            this.nextRight = mapReduceValuesToDoubleTask;
            this.transformer = transformer;
            this.basis = basis;
            this.reducer = reducer;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceValuesToDoubleTask != java.util.concurrent.ConcurrentHashMap$MapReduceValuesToDoubleTask<K, V> */
        @Override // java.util.concurrent.CountedCompleter, java.util.concurrent.ForkJoinTask
        public final Double getRawResult() {
            return Double.valueOf(this.result);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceValuesToDoubleTask != java.util.concurrent.ConcurrentHashMap$MapReduceValuesToDoubleTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            MapReduceValuesToDoubleTask<K, V> mapReduceValuesToDoubleTask;
            ToDoubleFunction<? super V> toDoubleFunction = this.transformer;
            if (toDoubleFunction != null) {
                DoubleBinaryOperator doubleBinaryOperator = this.reducer;
                if (doubleBinaryOperator != null) {
                    double d = this.basis;
                    int i = this.baseIndex;
                    while (true) {
                        if (this.batch <= 0) {
                            mapReduceValuesToDoubleTask = this;
                            break;
                        }
                        int i2 = this.baseLimit;
                        int i3 = (i2 + i) >>> 1;
                        if (i3 <= i) {
                            mapReduceValuesToDoubleTask = this;
                            break;
                        }
                        addToPendingCount(1);
                        int i4 = this.batch >>> 1;
                        this.batch = i4;
                        this.baseLimit = i3;
                        MapReduceValuesToDoubleTask<K, V> mapReduceValuesToDoubleTask2 = new MapReduceValuesToDoubleTask<>(this, i4, i3, i2, this.tab, this.rights, toDoubleFunction, d, doubleBinaryOperator);
                        this.rights = mapReduceValuesToDoubleTask2;
                        mapReduceValuesToDoubleTask2.fork();
                    }
                    while (true) {
                        Node<K, V> advance = advance();
                        if (advance == null) {
                            break;
                        } else {
                            d = doubleBinaryOperator.applyAsDouble(d, toDoubleFunction.applyAsDouble(advance.val));
                        }
                    }
                    mapReduceValuesToDoubleTask.result = d;
                    for (CountedCompleter<?> firstComplete = firstComplete(); firstComplete != null; firstComplete = firstComplete.nextComplete()) {
                        MapReduceValuesToDoubleTask mapReduceValuesToDoubleTask3 = (MapReduceValuesToDoubleTask) firstComplete;
                        MapReduceValuesToDoubleTask<K, V> mapReduceValuesToDoubleTask4 = mapReduceValuesToDoubleTask3.rights;
                        while (mapReduceValuesToDoubleTask4 != null) {
                            mapReduceValuesToDoubleTask3.result = doubleBinaryOperator.applyAsDouble(mapReduceValuesToDoubleTask3.result, mapReduceValuesToDoubleTask4.result);
                            MapReduceValuesToDoubleTask<K, V> mapReduceValuesToDoubleTask5 = mapReduceValuesToDoubleTask4.nextRight;
                            mapReduceValuesToDoubleTask3.rights = mapReduceValuesToDoubleTask5;
                            mapReduceValuesToDoubleTask4 = mapReduceValuesToDoubleTask5;
                        }
                    }
                }
            }
        }
    }

    static final class MapReduceEntriesToDoubleTask<K, V> extends BulkTask<K, V, Double> {
        final double basis;
        MapReduceEntriesToDoubleTask<K, V> nextRight;
        final DoubleBinaryOperator reducer;
        double result;
        MapReduceEntriesToDoubleTask<K, V> rights;
        final ToDoubleFunction<Map.Entry<K, V>> transformer;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceEntriesToDoubleTask != java.util.concurrent.ConcurrentHashMap$MapReduceEntriesToDoubleTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        MapReduceEntriesToDoubleTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, MapReduceEntriesToDoubleTask<K, V> mapReduceEntriesToDoubleTask, ToDoubleFunction<Map.Entry<K, V>> transformer, double basis, DoubleBinaryOperator reducer) {
            super(bulkTask, b, i, f, nodeArr);
            this.nextRight = mapReduceEntriesToDoubleTask;
            this.transformer = transformer;
            this.basis = basis;
            this.reducer = reducer;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceEntriesToDoubleTask != java.util.concurrent.ConcurrentHashMap$MapReduceEntriesToDoubleTask<K, V> */
        @Override // java.util.concurrent.CountedCompleter, java.util.concurrent.ForkJoinTask
        public final Double getRawResult() {
            return Double.valueOf(this.result);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceEntriesToDoubleTask != java.util.concurrent.ConcurrentHashMap$MapReduceEntriesToDoubleTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            MapReduceEntriesToDoubleTask<K, V> mapReduceEntriesToDoubleTask;
            ToDoubleFunction<Map.Entry<K, V>> transformer = this.transformer;
            if (transformer != null) {
                DoubleBinaryOperator reducer = this.reducer;
                if (reducer != null) {
                    double r = this.basis;
                    int i = this.baseIndex;
                    while (true) {
                        if (this.batch <= 0) {
                            mapReduceEntriesToDoubleTask = this;
                            break;
                        }
                        int f = this.baseLimit;
                        int h = (f + i) >>> 1;
                        if (h <= i) {
                            mapReduceEntriesToDoubleTask = this;
                            break;
                        }
                        addToPendingCount(1);
                        int i2 = this.batch >>> 1;
                        this.batch = i2;
                        this.baseLimit = h;
                        MapReduceEntriesToDoubleTask<K, V> mapReduceEntriesToDoubleTask2 = new MapReduceEntriesToDoubleTask<>(this, i2, h, f, this.tab, this.rights, transformer, r, reducer);
                        this.rights = mapReduceEntriesToDoubleTask2;
                        mapReduceEntriesToDoubleTask2.fork();
                    }
                    while (true) {
                        Node<K, V> advance = advance();
                        if (advance == null) {
                            break;
                        } else {
                            r = reducer.applyAsDouble(r, transformer.applyAsDouble(advance));
                        }
                    }
                    mapReduceEntriesToDoubleTask.result = r;
                    for (CountedCompleter<?> c = firstComplete(); c != null; c = c.nextComplete()) {
                        MapReduceEntriesToDoubleTask mapReduceEntriesToDoubleTask3 = (MapReduceEntriesToDoubleTask) c;
                        MapReduceEntriesToDoubleTask<K, V> mapReduceEntriesToDoubleTask4 = mapReduceEntriesToDoubleTask3.rights;
                        while (mapReduceEntriesToDoubleTask4 != null) {
                            mapReduceEntriesToDoubleTask3.result = reducer.applyAsDouble(mapReduceEntriesToDoubleTask3.result, mapReduceEntriesToDoubleTask4.result);
                            MapReduceEntriesToDoubleTask<K, V> mapReduceEntriesToDoubleTask5 = mapReduceEntriesToDoubleTask4.nextRight;
                            mapReduceEntriesToDoubleTask3.rights = mapReduceEntriesToDoubleTask5;
                            mapReduceEntriesToDoubleTask4 = mapReduceEntriesToDoubleTask5;
                        }
                    }
                }
            }
        }
    }

    static final class MapReduceMappingsToDoubleTask<K, V> extends BulkTask<K, V, Double> {
        final double basis;
        MapReduceMappingsToDoubleTask<K, V> nextRight;
        final DoubleBinaryOperator reducer;
        double result;
        MapReduceMappingsToDoubleTask<K, V> rights;
        final ToDoubleBiFunction<? super K, ? super V> transformer;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceMappingsToDoubleTask != java.util.concurrent.ConcurrentHashMap$MapReduceMappingsToDoubleTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        MapReduceMappingsToDoubleTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, MapReduceMappingsToDoubleTask<K, V> mapReduceMappingsToDoubleTask, ToDoubleBiFunction<? super K, ? super V> transformer, double basis, DoubleBinaryOperator reducer) {
            super(bulkTask, b, i, f, nodeArr);
            this.nextRight = mapReduceMappingsToDoubleTask;
            this.transformer = transformer;
            this.basis = basis;
            this.reducer = reducer;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceMappingsToDoubleTask != java.util.concurrent.ConcurrentHashMap$MapReduceMappingsToDoubleTask<K, V> */
        @Override // java.util.concurrent.CountedCompleter, java.util.concurrent.ForkJoinTask
        public final Double getRawResult() {
            return Double.valueOf(this.result);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceMappingsToDoubleTask != java.util.concurrent.ConcurrentHashMap$MapReduceMappingsToDoubleTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            MapReduceMappingsToDoubleTask<K, V> mapReduceMappingsToDoubleTask;
            ToDoubleBiFunction<? super K, ? super V> toDoubleBiFunction = this.transformer;
            if (toDoubleBiFunction != null) {
                DoubleBinaryOperator doubleBinaryOperator = this.reducer;
                if (doubleBinaryOperator != null) {
                    double d = this.basis;
                    int i = this.baseIndex;
                    while (true) {
                        if (this.batch <= 0) {
                            mapReduceMappingsToDoubleTask = this;
                            break;
                        }
                        int i2 = this.baseLimit;
                        int i3 = (i2 + i) >>> 1;
                        if (i3 <= i) {
                            mapReduceMappingsToDoubleTask = this;
                            break;
                        }
                        addToPendingCount(1);
                        int i4 = this.batch >>> 1;
                        this.batch = i4;
                        this.baseLimit = i3;
                        MapReduceMappingsToDoubleTask<K, V> mapReduceMappingsToDoubleTask2 = new MapReduceMappingsToDoubleTask<>(this, i4, i3, i2, this.tab, this.rights, toDoubleBiFunction, d, doubleBinaryOperator);
                        this.rights = mapReduceMappingsToDoubleTask2;
                        mapReduceMappingsToDoubleTask2.fork();
                    }
                    while (true) {
                        Node<K, V> advance = advance();
                        if (advance == null) {
                            break;
                        } else {
                            d = doubleBinaryOperator.applyAsDouble(d, toDoubleBiFunction.applyAsDouble(advance.key, advance.val));
                        }
                    }
                    mapReduceMappingsToDoubleTask.result = d;
                    for (CountedCompleter<?> firstComplete = firstComplete(); firstComplete != null; firstComplete = firstComplete.nextComplete()) {
                        MapReduceMappingsToDoubleTask mapReduceMappingsToDoubleTask3 = (MapReduceMappingsToDoubleTask) firstComplete;
                        MapReduceMappingsToDoubleTask<K, V> mapReduceMappingsToDoubleTask4 = mapReduceMappingsToDoubleTask3.rights;
                        while (mapReduceMappingsToDoubleTask4 != null) {
                            mapReduceMappingsToDoubleTask3.result = doubleBinaryOperator.applyAsDouble(mapReduceMappingsToDoubleTask3.result, mapReduceMappingsToDoubleTask4.result);
                            MapReduceMappingsToDoubleTask<K, V> mapReduceMappingsToDoubleTask5 = mapReduceMappingsToDoubleTask4.nextRight;
                            mapReduceMappingsToDoubleTask3.rights = mapReduceMappingsToDoubleTask5;
                            mapReduceMappingsToDoubleTask4 = mapReduceMappingsToDoubleTask5;
                        }
                    }
                }
            }
        }
    }

    static final class MapReduceKeysToLongTask<K, V> extends BulkTask<K, V, Long> {
        final long basis;
        MapReduceKeysToLongTask<K, V> nextRight;
        final LongBinaryOperator reducer;
        long result;
        MapReduceKeysToLongTask<K, V> rights;
        final ToLongFunction<? super K> transformer;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceKeysToLongTask != java.util.concurrent.ConcurrentHashMap$MapReduceKeysToLongTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        MapReduceKeysToLongTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, MapReduceKeysToLongTask<K, V> mapReduceKeysToLongTask, ToLongFunction<? super K> transformer, long basis, LongBinaryOperator reducer) {
            super(bulkTask, b, i, f, nodeArr);
            this.nextRight = mapReduceKeysToLongTask;
            this.transformer = transformer;
            this.basis = basis;
            this.reducer = reducer;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceKeysToLongTask != java.util.concurrent.ConcurrentHashMap$MapReduceKeysToLongTask<K, V> */
        @Override // java.util.concurrent.CountedCompleter, java.util.concurrent.ForkJoinTask
        public final Long getRawResult() {
            return Long.valueOf(this.result);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceKeysToLongTask != java.util.concurrent.ConcurrentHashMap$MapReduceKeysToLongTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            MapReduceKeysToLongTask<K, V> mapReduceKeysToLongTask;
            ToLongFunction<? super K> toLongFunction = this.transformer;
            if (toLongFunction != null) {
                LongBinaryOperator longBinaryOperator = this.reducer;
                if (longBinaryOperator != null) {
                    long j = this.basis;
                    int i = this.baseIndex;
                    while (true) {
                        if (this.batch <= 0) {
                            mapReduceKeysToLongTask = this;
                            break;
                        }
                        int i2 = this.baseLimit;
                        int i3 = (i2 + i) >>> 1;
                        if (i3 <= i) {
                            mapReduceKeysToLongTask = this;
                            break;
                        }
                        addToPendingCount(1);
                        int i4 = this.batch >>> 1;
                        this.batch = i4;
                        this.baseLimit = i3;
                        MapReduceKeysToLongTask<K, V> mapReduceKeysToLongTask2 = new MapReduceKeysToLongTask<>(this, i4, i3, i2, this.tab, this.rights, toLongFunction, j, longBinaryOperator);
                        this.rights = mapReduceKeysToLongTask2;
                        mapReduceKeysToLongTask2.fork();
                    }
                    while (true) {
                        Node<K, V> advance = advance();
                        if (advance == null) {
                            break;
                        } else {
                            j = longBinaryOperator.applyAsLong(j, toLongFunction.applyAsLong(advance.key));
                        }
                    }
                    mapReduceKeysToLongTask.result = j;
                    for (CountedCompleter<?> firstComplete = firstComplete(); firstComplete != null; firstComplete = firstComplete.nextComplete()) {
                        MapReduceKeysToLongTask mapReduceKeysToLongTask3 = (MapReduceKeysToLongTask) firstComplete;
                        MapReduceKeysToLongTask<K, V> mapReduceKeysToLongTask4 = mapReduceKeysToLongTask3.rights;
                        while (mapReduceKeysToLongTask4 != null) {
                            mapReduceKeysToLongTask3.result = longBinaryOperator.applyAsLong(mapReduceKeysToLongTask3.result, mapReduceKeysToLongTask4.result);
                            MapReduceKeysToLongTask<K, V> mapReduceKeysToLongTask5 = mapReduceKeysToLongTask4.nextRight;
                            mapReduceKeysToLongTask3.rights = mapReduceKeysToLongTask5;
                            mapReduceKeysToLongTask4 = mapReduceKeysToLongTask5;
                        }
                    }
                }
            }
        }
    }

    static final class MapReduceValuesToLongTask<K, V> extends BulkTask<K, V, Long> {
        final long basis;
        MapReduceValuesToLongTask<K, V> nextRight;
        final LongBinaryOperator reducer;
        long result;
        MapReduceValuesToLongTask<K, V> rights;
        final ToLongFunction<? super V> transformer;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceValuesToLongTask != java.util.concurrent.ConcurrentHashMap$MapReduceValuesToLongTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        MapReduceValuesToLongTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, MapReduceValuesToLongTask<K, V> mapReduceValuesToLongTask, ToLongFunction<? super V> transformer, long basis, LongBinaryOperator reducer) {
            super(bulkTask, b, i, f, nodeArr);
            this.nextRight = mapReduceValuesToLongTask;
            this.transformer = transformer;
            this.basis = basis;
            this.reducer = reducer;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceValuesToLongTask != java.util.concurrent.ConcurrentHashMap$MapReduceValuesToLongTask<K, V> */
        @Override // java.util.concurrent.CountedCompleter, java.util.concurrent.ForkJoinTask
        public final Long getRawResult() {
            return Long.valueOf(this.result);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceValuesToLongTask != java.util.concurrent.ConcurrentHashMap$MapReduceValuesToLongTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            MapReduceValuesToLongTask<K, V> mapReduceValuesToLongTask;
            ToLongFunction<? super V> toLongFunction = this.transformer;
            if (toLongFunction != null) {
                LongBinaryOperator longBinaryOperator = this.reducer;
                if (longBinaryOperator != null) {
                    long j = this.basis;
                    int i = this.baseIndex;
                    while (true) {
                        if (this.batch <= 0) {
                            mapReduceValuesToLongTask = this;
                            break;
                        }
                        int i2 = this.baseLimit;
                        int i3 = (i2 + i) >>> 1;
                        if (i3 <= i) {
                            mapReduceValuesToLongTask = this;
                            break;
                        }
                        addToPendingCount(1);
                        int i4 = this.batch >>> 1;
                        this.batch = i4;
                        this.baseLimit = i3;
                        MapReduceValuesToLongTask<K, V> mapReduceValuesToLongTask2 = new MapReduceValuesToLongTask<>(this, i4, i3, i2, this.tab, this.rights, toLongFunction, j, longBinaryOperator);
                        this.rights = mapReduceValuesToLongTask2;
                        mapReduceValuesToLongTask2.fork();
                    }
                    while (true) {
                        Node<K, V> advance = advance();
                        if (advance == null) {
                            break;
                        } else {
                            j = longBinaryOperator.applyAsLong(j, toLongFunction.applyAsLong(advance.val));
                        }
                    }
                    mapReduceValuesToLongTask.result = j;
                    for (CountedCompleter<?> firstComplete = firstComplete(); firstComplete != null; firstComplete = firstComplete.nextComplete()) {
                        MapReduceValuesToLongTask mapReduceValuesToLongTask3 = (MapReduceValuesToLongTask) firstComplete;
                        MapReduceValuesToLongTask<K, V> mapReduceValuesToLongTask4 = mapReduceValuesToLongTask3.rights;
                        while (mapReduceValuesToLongTask4 != null) {
                            mapReduceValuesToLongTask3.result = longBinaryOperator.applyAsLong(mapReduceValuesToLongTask3.result, mapReduceValuesToLongTask4.result);
                            MapReduceValuesToLongTask<K, V> mapReduceValuesToLongTask5 = mapReduceValuesToLongTask4.nextRight;
                            mapReduceValuesToLongTask3.rights = mapReduceValuesToLongTask5;
                            mapReduceValuesToLongTask4 = mapReduceValuesToLongTask5;
                        }
                    }
                }
            }
        }
    }

    static final class MapReduceEntriesToLongTask<K, V> extends BulkTask<K, V, Long> {
        final long basis;
        MapReduceEntriesToLongTask<K, V> nextRight;
        final LongBinaryOperator reducer;
        long result;
        MapReduceEntriesToLongTask<K, V> rights;
        final ToLongFunction<Map.Entry<K, V>> transformer;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceEntriesToLongTask != java.util.concurrent.ConcurrentHashMap$MapReduceEntriesToLongTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        MapReduceEntriesToLongTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, MapReduceEntriesToLongTask<K, V> mapReduceEntriesToLongTask, ToLongFunction<Map.Entry<K, V>> transformer, long basis, LongBinaryOperator reducer) {
            super(bulkTask, b, i, f, nodeArr);
            this.nextRight = mapReduceEntriesToLongTask;
            this.transformer = transformer;
            this.basis = basis;
            this.reducer = reducer;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceEntriesToLongTask != java.util.concurrent.ConcurrentHashMap$MapReduceEntriesToLongTask<K, V> */
        @Override // java.util.concurrent.CountedCompleter, java.util.concurrent.ForkJoinTask
        public final Long getRawResult() {
            return Long.valueOf(this.result);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceEntriesToLongTask != java.util.concurrent.ConcurrentHashMap$MapReduceEntriesToLongTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            MapReduceEntriesToLongTask<K, V> mapReduceEntriesToLongTask;
            ToLongFunction<Map.Entry<K, V>> transformer = this.transformer;
            if (transformer != null) {
                LongBinaryOperator reducer = this.reducer;
                if (reducer != null) {
                    long r = this.basis;
                    int i = this.baseIndex;
                    while (true) {
                        if (this.batch <= 0) {
                            mapReduceEntriesToLongTask = this;
                            break;
                        }
                        int f = this.baseLimit;
                        int h = (f + i) >>> 1;
                        if (h <= i) {
                            mapReduceEntriesToLongTask = this;
                            break;
                        }
                        addToPendingCount(1);
                        int i2 = this.batch >>> 1;
                        this.batch = i2;
                        this.baseLimit = h;
                        MapReduceEntriesToLongTask<K, V> mapReduceEntriesToLongTask2 = new MapReduceEntriesToLongTask<>(this, i2, h, f, this.tab, this.rights, transformer, r, reducer);
                        this.rights = mapReduceEntriesToLongTask2;
                        mapReduceEntriesToLongTask2.fork();
                    }
                    while (true) {
                        Node<K, V> advance = advance();
                        if (advance == null) {
                            break;
                        } else {
                            r = reducer.applyAsLong(r, transformer.applyAsLong(advance));
                        }
                    }
                    mapReduceEntriesToLongTask.result = r;
                    for (CountedCompleter<?> c = firstComplete(); c != null; c = c.nextComplete()) {
                        MapReduceEntriesToLongTask mapReduceEntriesToLongTask3 = (MapReduceEntriesToLongTask) c;
                        MapReduceEntriesToLongTask<K, V> mapReduceEntriesToLongTask4 = mapReduceEntriesToLongTask3.rights;
                        while (mapReduceEntriesToLongTask4 != null) {
                            mapReduceEntriesToLongTask3.result = reducer.applyAsLong(mapReduceEntriesToLongTask3.result, mapReduceEntriesToLongTask4.result);
                            MapReduceEntriesToLongTask<K, V> mapReduceEntriesToLongTask5 = mapReduceEntriesToLongTask4.nextRight;
                            mapReduceEntriesToLongTask3.rights = mapReduceEntriesToLongTask5;
                            mapReduceEntriesToLongTask4 = mapReduceEntriesToLongTask5;
                        }
                    }
                }
            }
        }
    }

    static final class MapReduceMappingsToLongTask<K, V> extends BulkTask<K, V, Long> {
        final long basis;
        MapReduceMappingsToLongTask<K, V> nextRight;
        final LongBinaryOperator reducer;
        long result;
        MapReduceMappingsToLongTask<K, V> rights;
        final ToLongBiFunction<? super K, ? super V> transformer;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceMappingsToLongTask != java.util.concurrent.ConcurrentHashMap$MapReduceMappingsToLongTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        MapReduceMappingsToLongTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, MapReduceMappingsToLongTask<K, V> mapReduceMappingsToLongTask, ToLongBiFunction<? super K, ? super V> transformer, long basis, LongBinaryOperator reducer) {
            super(bulkTask, b, i, f, nodeArr);
            this.nextRight = mapReduceMappingsToLongTask;
            this.transformer = transformer;
            this.basis = basis;
            this.reducer = reducer;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceMappingsToLongTask != java.util.concurrent.ConcurrentHashMap$MapReduceMappingsToLongTask<K, V> */
        @Override // java.util.concurrent.CountedCompleter, java.util.concurrent.ForkJoinTask
        public final Long getRawResult() {
            return Long.valueOf(this.result);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceMappingsToLongTask != java.util.concurrent.ConcurrentHashMap$MapReduceMappingsToLongTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            MapReduceMappingsToLongTask<K, V> mapReduceMappingsToLongTask;
            ToLongBiFunction<? super K, ? super V> toLongBiFunction = this.transformer;
            if (toLongBiFunction != null) {
                LongBinaryOperator longBinaryOperator = this.reducer;
                if (longBinaryOperator != null) {
                    long j = this.basis;
                    int i = this.baseIndex;
                    while (true) {
                        if (this.batch <= 0) {
                            mapReduceMappingsToLongTask = this;
                            break;
                        }
                        int i2 = this.baseLimit;
                        int i3 = (i2 + i) >>> 1;
                        if (i3 <= i) {
                            mapReduceMappingsToLongTask = this;
                            break;
                        }
                        addToPendingCount(1);
                        int i4 = this.batch >>> 1;
                        this.batch = i4;
                        this.baseLimit = i3;
                        MapReduceMappingsToLongTask<K, V> mapReduceMappingsToLongTask2 = new MapReduceMappingsToLongTask<>(this, i4, i3, i2, this.tab, this.rights, toLongBiFunction, j, longBinaryOperator);
                        this.rights = mapReduceMappingsToLongTask2;
                        mapReduceMappingsToLongTask2.fork();
                    }
                    while (true) {
                        Node<K, V> advance = advance();
                        if (advance == null) {
                            break;
                        } else {
                            j = longBinaryOperator.applyAsLong(j, toLongBiFunction.applyAsLong(advance.key, advance.val));
                        }
                    }
                    mapReduceMappingsToLongTask.result = j;
                    for (CountedCompleter<?> firstComplete = firstComplete(); firstComplete != null; firstComplete = firstComplete.nextComplete()) {
                        MapReduceMappingsToLongTask mapReduceMappingsToLongTask3 = (MapReduceMappingsToLongTask) firstComplete;
                        MapReduceMappingsToLongTask<K, V> mapReduceMappingsToLongTask4 = mapReduceMappingsToLongTask3.rights;
                        while (mapReduceMappingsToLongTask4 != null) {
                            mapReduceMappingsToLongTask3.result = longBinaryOperator.applyAsLong(mapReduceMappingsToLongTask3.result, mapReduceMappingsToLongTask4.result);
                            MapReduceMappingsToLongTask<K, V> mapReduceMappingsToLongTask5 = mapReduceMappingsToLongTask4.nextRight;
                            mapReduceMappingsToLongTask3.rights = mapReduceMappingsToLongTask5;
                            mapReduceMappingsToLongTask4 = mapReduceMappingsToLongTask5;
                        }
                    }
                }
            }
        }
    }

    static final class MapReduceKeysToIntTask<K, V> extends BulkTask<K, V, Integer> {
        final int basis;
        MapReduceKeysToIntTask<K, V> nextRight;
        final IntBinaryOperator reducer;
        int result;
        MapReduceKeysToIntTask<K, V> rights;
        final ToIntFunction<? super K> transformer;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceKeysToIntTask != java.util.concurrent.ConcurrentHashMap$MapReduceKeysToIntTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        MapReduceKeysToIntTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, MapReduceKeysToIntTask<K, V> mapReduceKeysToIntTask, ToIntFunction<? super K> transformer, int basis, IntBinaryOperator reducer) {
            super(bulkTask, b, i, f, nodeArr);
            this.nextRight = mapReduceKeysToIntTask;
            this.transformer = transformer;
            this.basis = basis;
            this.reducer = reducer;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceKeysToIntTask != java.util.concurrent.ConcurrentHashMap$MapReduceKeysToIntTask<K, V> */
        @Override // java.util.concurrent.CountedCompleter, java.util.concurrent.ForkJoinTask
        public final Integer getRawResult() {
            return Integer.valueOf(this.result);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceKeysToIntTask != java.util.concurrent.ConcurrentHashMap$MapReduceKeysToIntTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            MapReduceKeysToIntTask<K, V> mapReduceKeysToIntTask;
            ToIntFunction<? super K> toIntFunction = this.transformer;
            if (toIntFunction != null) {
                IntBinaryOperator intBinaryOperator = this.reducer;
                if (intBinaryOperator != null) {
                    int i = this.basis;
                    int i2 = this.baseIndex;
                    while (true) {
                        if (this.batch <= 0) {
                            mapReduceKeysToIntTask = this;
                            break;
                        }
                        int i3 = this.baseLimit;
                        int i4 = (i3 + i2) >>> 1;
                        if (i4 <= i2) {
                            mapReduceKeysToIntTask = this;
                            break;
                        }
                        addToPendingCount(1);
                        int i5 = this.batch >>> 1;
                        this.batch = i5;
                        this.baseLimit = i4;
                        MapReduceKeysToIntTask<K, V> mapReduceKeysToIntTask2 = new MapReduceKeysToIntTask<>(this, i5, i4, i3, this.tab, this.rights, toIntFunction, i, intBinaryOperator);
                        this.rights = mapReduceKeysToIntTask2;
                        mapReduceKeysToIntTask2.fork();
                    }
                    while (true) {
                        Node<K, V> advance = advance();
                        if (advance == null) {
                            break;
                        } else {
                            i = intBinaryOperator.applyAsInt(i, toIntFunction.applyAsInt(advance.key));
                        }
                    }
                    mapReduceKeysToIntTask.result = i;
                    for (CountedCompleter<?> firstComplete = firstComplete(); firstComplete != null; firstComplete = firstComplete.nextComplete()) {
                        MapReduceKeysToIntTask mapReduceKeysToIntTask3 = (MapReduceKeysToIntTask) firstComplete;
                        MapReduceKeysToIntTask<K, V> mapReduceKeysToIntTask4 = mapReduceKeysToIntTask3.rights;
                        while (mapReduceKeysToIntTask4 != null) {
                            mapReduceKeysToIntTask3.result = intBinaryOperator.applyAsInt(mapReduceKeysToIntTask3.result, mapReduceKeysToIntTask4.result);
                            MapReduceKeysToIntTask<K, V> mapReduceKeysToIntTask5 = mapReduceKeysToIntTask4.nextRight;
                            mapReduceKeysToIntTask3.rights = mapReduceKeysToIntTask5;
                            mapReduceKeysToIntTask4 = mapReduceKeysToIntTask5;
                        }
                    }
                }
            }
        }
    }

    static final class MapReduceValuesToIntTask<K, V> extends BulkTask<K, V, Integer> {
        final int basis;
        MapReduceValuesToIntTask<K, V> nextRight;
        final IntBinaryOperator reducer;
        int result;
        MapReduceValuesToIntTask<K, V> rights;
        final ToIntFunction<? super V> transformer;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceValuesToIntTask != java.util.concurrent.ConcurrentHashMap$MapReduceValuesToIntTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        MapReduceValuesToIntTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, MapReduceValuesToIntTask<K, V> mapReduceValuesToIntTask, ToIntFunction<? super V> transformer, int basis, IntBinaryOperator reducer) {
            super(bulkTask, b, i, f, nodeArr);
            this.nextRight = mapReduceValuesToIntTask;
            this.transformer = transformer;
            this.basis = basis;
            this.reducer = reducer;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceValuesToIntTask != java.util.concurrent.ConcurrentHashMap$MapReduceValuesToIntTask<K, V> */
        @Override // java.util.concurrent.CountedCompleter, java.util.concurrent.ForkJoinTask
        public final Integer getRawResult() {
            return Integer.valueOf(this.result);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceValuesToIntTask != java.util.concurrent.ConcurrentHashMap$MapReduceValuesToIntTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            MapReduceValuesToIntTask<K, V> mapReduceValuesToIntTask;
            ToIntFunction<? super V> toIntFunction = this.transformer;
            if (toIntFunction != null) {
                IntBinaryOperator intBinaryOperator = this.reducer;
                if (intBinaryOperator != null) {
                    int i = this.basis;
                    int i2 = this.baseIndex;
                    while (true) {
                        if (this.batch <= 0) {
                            mapReduceValuesToIntTask = this;
                            break;
                        }
                        int i3 = this.baseLimit;
                        int i4 = (i3 + i2) >>> 1;
                        if (i4 <= i2) {
                            mapReduceValuesToIntTask = this;
                            break;
                        }
                        addToPendingCount(1);
                        int i5 = this.batch >>> 1;
                        this.batch = i5;
                        this.baseLimit = i4;
                        MapReduceValuesToIntTask<K, V> mapReduceValuesToIntTask2 = new MapReduceValuesToIntTask<>(this, i5, i4, i3, this.tab, this.rights, toIntFunction, i, intBinaryOperator);
                        this.rights = mapReduceValuesToIntTask2;
                        mapReduceValuesToIntTask2.fork();
                    }
                    while (true) {
                        Node<K, V> advance = advance();
                        if (advance == null) {
                            break;
                        } else {
                            i = intBinaryOperator.applyAsInt(i, toIntFunction.applyAsInt(advance.val));
                        }
                    }
                    mapReduceValuesToIntTask.result = i;
                    for (CountedCompleter<?> firstComplete = firstComplete(); firstComplete != null; firstComplete = firstComplete.nextComplete()) {
                        MapReduceValuesToIntTask mapReduceValuesToIntTask3 = (MapReduceValuesToIntTask) firstComplete;
                        MapReduceValuesToIntTask<K, V> mapReduceValuesToIntTask4 = mapReduceValuesToIntTask3.rights;
                        while (mapReduceValuesToIntTask4 != null) {
                            mapReduceValuesToIntTask3.result = intBinaryOperator.applyAsInt(mapReduceValuesToIntTask3.result, mapReduceValuesToIntTask4.result);
                            MapReduceValuesToIntTask<K, V> mapReduceValuesToIntTask5 = mapReduceValuesToIntTask4.nextRight;
                            mapReduceValuesToIntTask3.rights = mapReduceValuesToIntTask5;
                            mapReduceValuesToIntTask4 = mapReduceValuesToIntTask5;
                        }
                    }
                }
            }
        }
    }

    static final class MapReduceEntriesToIntTask<K, V> extends BulkTask<K, V, Integer> {
        final int basis;
        MapReduceEntriesToIntTask<K, V> nextRight;
        final IntBinaryOperator reducer;
        int result;
        MapReduceEntriesToIntTask<K, V> rights;
        final ToIntFunction<Map.Entry<K, V>> transformer;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceEntriesToIntTask != java.util.concurrent.ConcurrentHashMap$MapReduceEntriesToIntTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        MapReduceEntriesToIntTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, MapReduceEntriesToIntTask<K, V> mapReduceEntriesToIntTask, ToIntFunction<Map.Entry<K, V>> transformer, int basis, IntBinaryOperator reducer) {
            super(bulkTask, b, i, f, nodeArr);
            this.nextRight = mapReduceEntriesToIntTask;
            this.transformer = transformer;
            this.basis = basis;
            this.reducer = reducer;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceEntriesToIntTask != java.util.concurrent.ConcurrentHashMap$MapReduceEntriesToIntTask<K, V> */
        @Override // java.util.concurrent.CountedCompleter, java.util.concurrent.ForkJoinTask
        public final Integer getRawResult() {
            return Integer.valueOf(this.result);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceEntriesToIntTask != java.util.concurrent.ConcurrentHashMap$MapReduceEntriesToIntTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            MapReduceEntriesToIntTask<K, V> mapReduceEntriesToIntTask;
            ToIntFunction<Map.Entry<K, V>> transformer = this.transformer;
            if (transformer != null) {
                IntBinaryOperator reducer = this.reducer;
                if (reducer != null) {
                    int r = this.basis;
                    int i = this.baseIndex;
                    while (true) {
                        if (this.batch <= 0) {
                            mapReduceEntriesToIntTask = this;
                            break;
                        }
                        int f = this.baseLimit;
                        int h = (f + i) >>> 1;
                        if (h <= i) {
                            mapReduceEntriesToIntTask = this;
                            break;
                        }
                        addToPendingCount(1);
                        int i2 = this.batch >>> 1;
                        this.batch = i2;
                        this.baseLimit = h;
                        MapReduceEntriesToIntTask<K, V> mapReduceEntriesToIntTask2 = new MapReduceEntriesToIntTask<>(this, i2, h, f, this.tab, this.rights, transformer, r, reducer);
                        this.rights = mapReduceEntriesToIntTask2;
                        mapReduceEntriesToIntTask2.fork();
                    }
                    while (true) {
                        Node<K, V> advance = advance();
                        if (advance == null) {
                            break;
                        } else {
                            r = reducer.applyAsInt(r, transformer.applyAsInt(advance));
                        }
                    }
                    mapReduceEntriesToIntTask.result = r;
                    for (CountedCompleter<?> c = firstComplete(); c != null; c = c.nextComplete()) {
                        MapReduceEntriesToIntTask mapReduceEntriesToIntTask3 = (MapReduceEntriesToIntTask) c;
                        MapReduceEntriesToIntTask<K, V> mapReduceEntriesToIntTask4 = mapReduceEntriesToIntTask3.rights;
                        while (mapReduceEntriesToIntTask4 != null) {
                            mapReduceEntriesToIntTask3.result = reducer.applyAsInt(mapReduceEntriesToIntTask3.result, mapReduceEntriesToIntTask4.result);
                            MapReduceEntriesToIntTask<K, V> mapReduceEntriesToIntTask5 = mapReduceEntriesToIntTask4.nextRight;
                            mapReduceEntriesToIntTask3.rights = mapReduceEntriesToIntTask5;
                            mapReduceEntriesToIntTask4 = mapReduceEntriesToIntTask5;
                        }
                    }
                }
            }
        }
    }

    static final class MapReduceMappingsToIntTask<K, V> extends BulkTask<K, V, Integer> {
        final int basis;
        MapReduceMappingsToIntTask<K, V> nextRight;
        final IntBinaryOperator reducer;
        int result;
        MapReduceMappingsToIntTask<K, V> rights;
        final ToIntBiFunction<? super K, ? super V> transformer;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$BulkTask != java.util.concurrent.ConcurrentHashMap$BulkTask<K, V, ?> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceMappingsToIntTask != java.util.concurrent.ConcurrentHashMap$MapReduceMappingsToIntTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node[] != java.util.concurrent.ConcurrentHashMap$Node<K, V>[] */
        MapReduceMappingsToIntTask(BulkTask<K, V, ?> bulkTask, int b, int i, int f, Node<K, V>[] nodeArr, MapReduceMappingsToIntTask<K, V> mapReduceMappingsToIntTask, ToIntBiFunction<? super K, ? super V> transformer, int basis, IntBinaryOperator reducer) {
            super(bulkTask, b, i, f, nodeArr);
            this.nextRight = mapReduceMappingsToIntTask;
            this.transformer = transformer;
            this.basis = basis;
            this.reducer = reducer;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceMappingsToIntTask != java.util.concurrent.ConcurrentHashMap$MapReduceMappingsToIntTask<K, V> */
        @Override // java.util.concurrent.CountedCompleter, java.util.concurrent.ForkJoinTask
        public final Integer getRawResult() {
            return Integer.valueOf(this.result);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$MapReduceMappingsToIntTask != java.util.concurrent.ConcurrentHashMap$MapReduceMappingsToIntTask<K, V> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.concurrent.ConcurrentHashMap$Node != java.util.concurrent.ConcurrentHashMap$Node<K, V> */
        @Override // java.util.concurrent.CountedCompleter
        public final void compute() {
            MapReduceMappingsToIntTask<K, V> mapReduceMappingsToIntTask;
            ToIntBiFunction<? super K, ? super V> toIntBiFunction = this.transformer;
            if (toIntBiFunction != null) {
                IntBinaryOperator intBinaryOperator = this.reducer;
                if (intBinaryOperator != null) {
                    int i = this.basis;
                    int i2 = this.baseIndex;
                    while (true) {
                        if (this.batch <= 0) {
                            mapReduceMappingsToIntTask = this;
                            break;
                        }
                        int i3 = this.baseLimit;
                        int i4 = (i3 + i2) >>> 1;
                        if (i4 <= i2) {
                            mapReduceMappingsToIntTask = this;
                            break;
                        }
                        addToPendingCount(1);
                        int i5 = this.batch >>> 1;
                        this.batch = i5;
                        this.baseLimit = i4;
                        MapReduceMappingsToIntTask<K, V> mapReduceMappingsToIntTask2 = new MapReduceMappingsToIntTask<>(this, i5, i4, i3, this.tab, this.rights, toIntBiFunction, i, intBinaryOperator);
                        this.rights = mapReduceMappingsToIntTask2;
                        mapReduceMappingsToIntTask2.fork();
                    }
                    while (true) {
                        Node<K, V> advance = advance();
                        if (advance == null) {
                            break;
                        } else {
                            i = intBinaryOperator.applyAsInt(i, toIntBiFunction.applyAsInt(advance.key, advance.val));
                        }
                    }
                    mapReduceMappingsToIntTask.result = i;
                    for (CountedCompleter<?> firstComplete = firstComplete(); firstComplete != null; firstComplete = firstComplete.nextComplete()) {
                        MapReduceMappingsToIntTask mapReduceMappingsToIntTask3 = (MapReduceMappingsToIntTask) firstComplete;
                        MapReduceMappingsToIntTask<K, V> mapReduceMappingsToIntTask4 = mapReduceMappingsToIntTask3.rights;
                        while (mapReduceMappingsToIntTask4 != null) {
                            mapReduceMappingsToIntTask3.result = intBinaryOperator.applyAsInt(mapReduceMappingsToIntTask3.result, mapReduceMappingsToIntTask4.result);
                            MapReduceMappingsToIntTask<K, V> mapReduceMappingsToIntTask5 = mapReduceMappingsToIntTask4.nextRight;
                            mapReduceMappingsToIntTask3.rights = mapReduceMappingsToIntTask5;
                            mapReduceMappingsToIntTask4 = mapReduceMappingsToIntTask5;
                        }
                    }
                }
            }
        }
    }
}
