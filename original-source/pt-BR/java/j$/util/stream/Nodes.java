package j$.util.stream;

import j$.util.Collection;
import j$.util.DesugarArrays;
import j$.util.Objects;
import j$.util.Spliterator;
import j$.util.Spliterators;
import j$.util.function.BiFunction$CC;
import j$.util.function.Consumer$CC;
import j$.util.function.DoubleConsumer$CC;
import j$.util.function.IntConsumer$CC;
import j$.util.function.LongConsumer$CC;
import j$.util.stream.Node;
import j$.util.stream.Nodes;
import j$.util.stream.Sink;
import j$.util.stream.SpinedBuffer;
import java.util.ArrayDeque;
import java.util.Arrays;
import java.util.Collection;
import java.util.Comparator;
import java.util.Deque;
import java.util.concurrent.CountedCompleter;
import java.util.function.BiFunction;
import java.util.function.BinaryOperator;
import java.util.function.Consumer;
import java.util.function.DoubleConsumer;
import java.util.function.Function;
import java.util.function.IntConsumer;
import java.util.function.IntFunction;
import java.util.function.LongConsumer;
import java.util.function.LongFunction;

/* carregado de: classes15.dex */
final class Nodes {
    static final String BAD_SIZE = "Stream size exceeds max array size";
    static final long MAX_ARRAY_SIZE = 2147483639;
    private static final Node EMPTY_NODE = new EmptyNode.OfRef();
    private static final Node.OfInt EMPTY_INT_NODE = new EmptyNode.OfInt();
    private static final Node.OfLong EMPTY_LONG_NODE = new EmptyNode.OfLong();
    private static final Node.OfDouble EMPTY_DOUBLE_NODE = new EmptyNode.OfDouble();
    private static final int[] EMPTY_INT_ARRAY = new int[0];
    private static final long[] EMPTY_LONG_ARRAY = new long[0];
    private static final double[] EMPTY_DOUBLE_ARRAY = new double[0];

    private Nodes() {
        throw new Error("no instances");
    }

    static <T> IntFunction<T[]> castingArray() {
        return new IntFunction() { // da classe: j$.util.stream.Nodes$$ExternalSyntheticLambda0
            @Override // java.util.function.IntFunction
            public final Object apply(int i) {
                return Nodes.lambda$castingArray$0(i);
            }
        };
    }

    static /* sintético */ Object[] lambda$castingArray$0(int size) {
        return new Object[size];
    }

    static <T> Node<T> emptyNode(StreamShape shape) {
        switch (shape) {
            case REFERENCE:
                return EMPTY_NODE;
            case INT_VALUE:
                return EMPTY_INT_NODE;
            case LONG_VALUE:
                return EMPTY_LONG_NODE;
            case DOUBLE_VALUE:
                return EMPTY_DOUBLE_NODE;
            default:
                throw new IllegalStateException("Unknown shape " + shape);
        }
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Node != java.util.stream.Node<T> */
    static <T> Node<T> conc(StreamShape shape, Node<T> node, Node<T> node2) {
        switch (shape) {
            case REFERENCE:
                return new ConcNode(node, node2);
            case INT_VALUE:
                return new ConcNode.OfInt((Node.OfInt) node, (Node.OfInt) node2);
            case LONG_VALUE:
                return new ConcNode.OfLong((Node.OfLong) node, (Node.OfLong) node2);
            case DOUBLE_VALUE:
                return new ConcNode.OfDouble((Node.OfDouble) node, (Node.OfDouble) node2);
            default:
                throw new IllegalStateException("Unknown shape " + shape);
        }
    }

    static <T> Node<T> node(T[] array) {
        return new ArrayNode(array);
    }

    static <T> Node<T> node(Collection<T> c) {
        return new CollectionNode(c);
    }

    /* JADX INFO: modificadores de acesso alterados de: package-private */
    public static <T> Node.Builder<T> builder(long exactSizeIfKnown, IntFunction<T[]> generator) {
        if (exactSizeIfKnown >= 0 && exactSizeIfKnown < MAX_ARRAY_SIZE) {
            return new FixedNodeBuilder(exactSizeIfKnown, generator);
        }
        return builder();
    }

    static <T> Node.Builder<T> builder() {
        return new SpinedNodeBuilder();
    }

    static Node.OfInt node(int[] array) {
        return new IntArrayNode(array);
    }

    static Node.Builder.OfInt intBuilder(long exactSizeIfKnown) {
        if (exactSizeIfKnown >= 0 && exactSizeIfKnown < MAX_ARRAY_SIZE) {
            return new IntFixedNodeBuilder(exactSizeIfKnown);
        }
        return intBuilder();
    }

    static Node.Builder.OfInt intBuilder() {
        return new IntSpinedNodeBuilder();
    }

    static Node.OfLong node(long[] array) {
        return new LongArrayNode(array);
    }

    static Node.Builder.OfLong longBuilder(long exactSizeIfKnown) {
        if (exactSizeIfKnown >= 0 && exactSizeIfKnown < MAX_ARRAY_SIZE) {
            return new LongFixedNodeBuilder(exactSizeIfKnown);
        }
        return longBuilder();
    }

    static Node.Builder.OfLong longBuilder() {
        return new LongSpinedNodeBuilder();
    }

    static Node.OfDouble node(double[] array) {
        return new DoubleArrayNode(array);
    }

    static Node.Builder.OfDouble doubleBuilder(long exactSizeIfKnown) {
        if (exactSizeIfKnown >= 0 && exactSizeIfKnown < MAX_ARRAY_SIZE) {
            return new DoubleFixedNodeBuilder(exactSizeIfKnown);
        }
        return doubleBuilder();
    }

    static Node.Builder.OfDouble doubleBuilder() {
        return new DoubleSpinedNodeBuilder();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Node != java.util.stream.Node<P_OUT> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.PipelineHelper != java.util.stream.PipelineHelper<P_OUT> */
    public static <P_IN, P_OUT> Node<P_OUT> collect(PipelineHelper<P_OUT> pipelineHelper, Spliterator<P_IN> spliterator, boolean flattenTree, IntFunction<P_OUT[]> generator) {
        long size = pipelineHelper.exactOutputSizeIfKnown(spliterator);
        if (size < 0 || !spliterator.hasCharacteristics(16384)) {
            Node<P_OUT> node = (Node) new CollectorTask.OfRef(pipelineHelper, generator, spliterator).invoke();
            return flattenTree ? flatten(node, generator) : node;
        }
        if (size >= MAX_ARRAY_SIZE) {
            throw new IllegalArgumentException(BAD_SIZE);
        }
        P_OUT[] array = generator.apply((int) size);
        new SizedCollectorTask.OfRef(spliterator, pipelineHelper, array).invoke();
        return node(array);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.PipelineHelper != java.util.stream.PipelineHelper<java.lang.Integer> */
    public static <P_IN> Node.OfInt collectInt(PipelineHelper<Integer> pipelineHelper, Spliterator<P_IN> spliterator, boolean flattenTree) {
        long size = pipelineHelper.exactOutputSizeIfKnown(spliterator);
        if (size < 0 || !spliterator.hasCharacteristics(16384)) {
            Node.OfInt node = (Node.OfInt) new CollectorTask.OfInt(pipelineHelper, spliterator).invoke();
            return flattenTree ? flattenInt(node) : node;
        }
        if (size >= MAX_ARRAY_SIZE) {
            throw new IllegalArgumentException(BAD_SIZE);
        }
        int[] array = new int[(int) size];
        new SizedCollectorTask.OfInt(spliterator, pipelineHelper, array).invoke();
        return node(array);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.PipelineHelper != java.util.stream.PipelineHelper<java.lang.Long> */
    public static <P_IN> Node.OfLong collectLong(PipelineHelper<Long> pipelineHelper, Spliterator<P_IN> spliterator, boolean flattenTree) {
        long size = pipelineHelper.exactOutputSizeIfKnown(spliterator);
        if (size < 0 || !spliterator.hasCharacteristics(16384)) {
            Node.OfLong node = (Node.OfLong) new CollectorTask.OfLong(pipelineHelper, spliterator).invoke();
            return flattenTree ? flattenLong(node) : node;
        }
        if (size >= MAX_ARRAY_SIZE) {
            throw new IllegalArgumentException(BAD_SIZE);
        }
        long[] array = new long[(int) size];
        new SizedCollectorTask.OfLong(spliterator, pipelineHelper, array).invoke();
        return node(array);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.PipelineHelper != java.util.stream.PipelineHelper<java.lang.Double> */
    public static <P_IN> Node.OfDouble collectDouble(PipelineHelper<Double> pipelineHelper, Spliterator<P_IN> spliterator, boolean flattenTree) {
        long size = pipelineHelper.exactOutputSizeIfKnown(spliterator);
        if (size < 0 || !spliterator.hasCharacteristics(16384)) {
            Node.OfDouble node = (Node.OfDouble) new CollectorTask.OfDouble(pipelineHelper, spliterator).invoke();
            return flattenTree ? flattenDouble(node) : node;
        }
        if (size >= MAX_ARRAY_SIZE) {
            throw new IllegalArgumentException(BAD_SIZE);
        }
        double[] array = new double[(int) size];
        new SizedCollectorTask.OfDouble(spliterator, pipelineHelper, array).invoke();
        return node(array);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Node != java.util.stream.Node<T> */
    public static <T> Node<T> flatten(Node<T> node, IntFunction<T[]> generator) {
        if (node.getChildCount() > 0) {
            long size = node.count();
            if (size >= MAX_ARRAY_SIZE) {
                throw new IllegalArgumentException(BAD_SIZE);
            }
            T[] array = generator.apply((int) size);
            new ToArrayTask.OfRef(node, array, 0).invoke();
            return node(array);
        }
        return node;
    }

    public static Node.OfInt flattenInt(Node.OfInt node) {
        if (node.getChildCount() > 0) {
            long size = node.count();
            if (size >= MAX_ARRAY_SIZE) {
                throw new IllegalArgumentException(BAD_SIZE);
            }
            int[] array = new int[(int) size];
            new ToArrayTask.OfInt(node, array, 0).invoke();
            return node(array);
        }
        return node;
    }

    public static Node.OfLong flattenLong(Node.OfLong node) {
        if (node.getChildCount() > 0) {
            long size = node.count();
            if (size >= MAX_ARRAY_SIZE) {
                throw new IllegalArgumentException(BAD_SIZE);
            }
            long[] array = new long[(int) size];
            new ToArrayTask.OfLong(node, array, 0).invoke();
            return node(array);
        }
        return node;
    }

    public static Node.OfDouble flattenDouble(Node.OfDouble node) {
        if (node.getChildCount() > 0) {
            long size = node.count();
            if (size >= MAX_ARRAY_SIZE) {
                throw new IllegalArgumentException(BAD_SIZE);
            }
            double[] array = new double[(int) size];
            new ToArrayTask.OfDouble(node, array, 0).invoke();
            return node(array);
        }
        return node;
    }

    private static abstract class EmptyNode<T, T_ARR, T_CONS> implements Node<T> {
        @Override // j$.util.stream.Node
        public /* sintético */ Node getChild(int i) {
            return Node.CC.$default$getChild(this, i);
        }

        @Override // j$.util.stream.Node
        public /* sintético */ int getChildCount() {
            return Node.CC.$default$getChildCount(this);
        }

        @Override // j$.util.stream.Node
        public /* sintético */ StreamShape getShape() {
            StreamShape streamShape;
            streamShape = StreamShape.REFERENCE;
            return streamShape;
        }

        @Override // j$.util.stream.Node
        public /* sintético */ Node truncate(long j, long j2, IntFunction intFunction) {
            return Node.CC.$default$truncate(this, j, j2, intFunction);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$EmptyNode != java.util.stream.Nodes$EmptyNode<T, T_ARR, T_CONS> */
        EmptyNode() {
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$EmptyNode != java.util.stream.Nodes$EmptyNode<T, T_ARR, T_CONS> */
        @Override // j$.util.stream.Node
        public T[] asArray(IntFunction<T[]> generator) {
            return generator.apply(0);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$EmptyNode != java.util.stream.Nodes$EmptyNode<T, T_ARR, T_CONS> */
        public void copyInto(T_ARR array, int offset) {
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$EmptyNode != java.util.stream.Nodes$EmptyNode<T, T_ARR, T_CONS> */
        @Override // j$.util.stream.Node
        public long count() {
            return 0L;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$EmptyNode != java.util.stream.Nodes$EmptyNode<T, T_ARR, T_CONS> */
        public void forEach(T_CONS consumer) {
        }

        private static class OfRef<T> extends EmptyNode<T, T[], Consumer<? super T>> {
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$EmptyNode$OfRef != java.util.stream.Nodes$EmptyNode$OfRef<T> */
            @Override // j$.util.stream.Node
            public /* bridge */ /* sintético */ void copyInto(Object[] objArr, int i) {
                super.copyInto((OfRef<T>) objArr, i);
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$EmptyNode$OfRef != java.util.stream.Nodes$EmptyNode$OfRef<T> */
            @Override // j$.util.stream.Node
            public /* bridge */ /* sintético */ void forEach(Consumer consumer) {
                super.forEach((OfRef<T>) consumer);
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$EmptyNode$OfRef != java.util.stream.Nodes$EmptyNode$OfRef<T> */
            private OfRef() {
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$EmptyNode$OfRef != java.util.stream.Nodes$EmptyNode$OfRef<T> */
            @Override // j$.util.stream.Node
            public Spliterator<T> spliterator() {
                return Spliterators.emptySpliterator();
            }
        }

        private static final class OfInt extends EmptyNode<Integer, int[], IntConsumer> implements Node.OfInt {
            @Override // j$.util.stream.Node.OfInt
            public /* sintético */ void copyInto(Integer[] numArr, int i) {
                Node.OfInt.CC.$default$copyInto((Node.OfInt) this, numArr, i);
            }

            @Override // j$.util.stream.Node
            public /* bridge */ /* sintético */ void copyInto(Object[] objArr, int i) {
                copyInto((Integer[]) objArr, i);
            }

            @Override // j$.util.stream.Node
            public /* sintético */ void forEach(Consumer consumer) {
                Node.OfInt.CC.$default$forEach(this, consumer);
            }

            @Override // j$.util.stream.Nodes.EmptyNode, j$.util.stream.Node
            public /* sintético */ Node.OfPrimitive getChild(int i) {
                return Node.OfPrimitive.CC.$default$getChild((Node.OfPrimitive) this, i);
            }

            @Override // j$.util.stream.Nodes.EmptyNode, j$.util.stream.Node
            public /* bridge */ /* sintético */ Node getChild(int i) {
                Node child;
                child = getChild(i);
                return child;
            }

            @Override // j$.util.stream.Nodes.EmptyNode, j$.util.stream.Node
            public /* sintético */ StreamShape getShape() {
                StreamShape streamShape;
                streamShape = StreamShape.INT_VALUE;
                return streamShape;
            }

            /* JADX WARN: falha na inferência de tipo para: r1v1, types: [int[], java.lang.Object] */
            @Override // j$.util.stream.Node.OfPrimitive
            public /* bridge */ /* sintético */ int[] newArray(int i) {
                ?? newArray;
                newArray = newArray(i);
                return newArray;
            }

            @Override // j$.util.stream.Node.OfInt, j$.util.stream.Node.OfPrimitive
            /* renomeado de: newArray, motivo: evitar colisão após correção de tipos em outro método */
            public /* sintético */ int[] newArray2(int i) {
                return Node.OfInt.CC.m858$default$newArray((Node.OfInt) this, i);
            }

            @Override // j$.util.stream.Nodes.EmptyNode, j$.util.stream.Node
            public /* sintético */ Node.OfInt truncate(long j, long j2, IntFunction intFunction) {
                return Node.OfInt.CC.$default$truncate((Node.OfInt) this, j, j2, intFunction);
            }

            @Override // j$.util.stream.Nodes.EmptyNode, j$.util.stream.Node
            public /* bridge */ /* sintético */ Node.OfPrimitive truncate(long j, long j2, IntFunction intFunction) {
                Node.OfPrimitive truncate;
                truncate = truncate(j, j2, (IntFunction<Integer[]>) intFunction);
                return truncate;
            }

            @Override // j$.util.stream.Nodes.EmptyNode, j$.util.stream.Node
            public /* bridge */ /* sintético */ Node truncate(long j, long j2, IntFunction intFunction) {
                Node truncate;
                truncate = truncate(j, j2, (IntFunction<Integer[]>) intFunction);
                return truncate;
            }

            OfInt() {
            }

            @Override // j$.util.stream.Node
            public Spliterator.OfInt spliterator() {
                return Spliterators.emptyIntSpliterator();
            }

            @Override // j$.util.stream.Node.OfPrimitive
            public int[] asPrimitiveArray() {
                return Nodes.EMPTY_INT_ARRAY;
            }
        }

        private static final class OfLong extends EmptyNode<Long, long[], LongConsumer> implements Node.OfLong {
            @Override // j$.util.stream.Node.OfLong
            public /* sintético */ void copyInto(Long[] lArr, int i) {
                Node.OfLong.CC.$default$copyInto((Node.OfLong) this, lArr, i);
            }

            @Override // j$.util.stream.Node
            public /* bridge */ /* sintético */ void copyInto(Object[] objArr, int i) {
                copyInto((Long[]) objArr, i);
            }

            @Override // j$.util.stream.Node
            public /* sintético */ void forEach(Consumer consumer) {
                Node.OfLong.CC.$default$forEach(this, consumer);
            }

            @Override // j$.util.stream.Nodes.EmptyNode, j$.util.stream.Node
            public /* sintético */ Node.OfPrimitive getChild(int i) {
                return Node.OfPrimitive.CC.$default$getChild((Node.OfPrimitive) this, i);
            }

            @Override // j$.util.stream.Nodes.EmptyNode, j$.util.stream.Node
            public /* bridge */ /* sintético */ Node getChild(int i) {
                Node child;
                child = getChild(i);
                return child;
            }

            @Override // j$.util.stream.Nodes.EmptyNode, j$.util.stream.Node
            public /* sintético */ StreamShape getShape() {
                StreamShape streamShape;
                streamShape = StreamShape.LONG_VALUE;
                return streamShape;
            }

            /* JADX WARN: falha na inferência de tipo para: r1v1, types: [java.lang.Object, long[]] */
            @Override // j$.util.stream.Node.OfPrimitive
            public /* bridge */ /* sintético */ long[] newArray(int i) {
                ?? newArray;
                newArray = newArray(i);
                return newArray;
            }

            @Override // j$.util.stream.Node.OfLong, j$.util.stream.Node.OfPrimitive
            /* renomeado de: newArray, motivo: evitar colisão após correção de tipos em outro método */
            public /* sintético */ long[] newArray2(int i) {
                return Node.OfLong.CC.m861$default$newArray((Node.OfLong) this, i);
            }

            @Override // j$.util.stream.Nodes.EmptyNode, j$.util.stream.Node
            public /* sintético */ Node.OfLong truncate(long j, long j2, IntFunction intFunction) {
                return Node.OfLong.CC.$default$truncate((Node.OfLong) this, j, j2, intFunction);
            }

            @Override // j$.util.stream.Nodes.EmptyNode, j$.util.stream.Node
            public /* bridge */ /* sintético */ Node.OfPrimitive truncate(long j, long j2, IntFunction intFunction) {
                Node.OfPrimitive truncate;
                truncate = truncate(j, j2, (IntFunction<Long[]>) intFunction);
                return truncate;
            }

            @Override // j$.util.stream.Nodes.EmptyNode, j$.util.stream.Node
            public /* bridge */ /* sintético */ Node truncate(long j, long j2, IntFunction intFunction) {
                Node truncate;
                truncate = truncate(j, j2, (IntFunction<Long[]>) intFunction);
                return truncate;
            }

            OfLong() {
            }

            @Override // j$.util.stream.Node
            public Spliterator.OfLong spliterator() {
                return Spliterators.emptyLongSpliterator();
            }

            @Override // j$.util.stream.Node.OfPrimitive
            public long[] asPrimitiveArray() {
                return Nodes.EMPTY_LONG_ARRAY;
            }
        }

        private static final class OfDouble extends EmptyNode<Double, double[], DoubleConsumer> implements Node.OfDouble {
            @Override // j$.util.stream.Node.OfDouble
            public /* sintético */ void copyInto(Double[] dArr, int i) {
                Node.OfDouble.CC.$default$copyInto((Node.OfDouble) this, dArr, i);
            }

            @Override // j$.util.stream.Node
            public /* bridge */ /* sintético */ void copyInto(Object[] objArr, int i) {
                copyInto((Double[]) objArr, i);
            }

            @Override // j$.util.stream.Node
            public /* sintético */ void forEach(Consumer consumer) {
                Node.OfDouble.CC.$default$forEach(this, consumer);
            }

            @Override // j$.util.stream.Nodes.EmptyNode, j$.util.stream.Node
            public /* sintético */ Node.OfPrimitive getChild(int i) {
                return Node.OfPrimitive.CC.$default$getChild((Node.OfPrimitive) this, i);
            }

            @Override // j$.util.stream.Nodes.EmptyNode, j$.util.stream.Node
            public /* bridge */ /* sintético */ Node getChild(int i) {
                Node child;
                child = getChild(i);
                return child;
            }

            @Override // j$.util.stream.Nodes.EmptyNode, j$.util.stream.Node
            public /* sintético */ StreamShape getShape() {
                StreamShape streamShape;
                streamShape = StreamShape.DOUBLE_VALUE;
                return streamShape;
            }

            /* JADX WARN: falha na inferência de tipo para: r1v1, types: [double[], java.lang.Object] */
            @Override // j$.util.stream.Node.OfPrimitive
            public /* bridge */ /* sintético */ double[] newArray(int i) {
                ?? newArray;
                newArray = newArray(i);
                return newArray;
            }

            @Override // j$.util.stream.Node.OfDouble, j$.util.stream.Node.OfPrimitive
            /* renomeado de: newArray, motivo: evitar colisão após correção de tipos em outro método */
            public /* sintético */ double[] newArray2(int i) {
                return Node.OfDouble.CC.m855$default$newArray((Node.OfDouble) this, i);
            }

            @Override // j$.util.stream.Nodes.EmptyNode, j$.util.stream.Node
            public /* sintético */ Node.OfDouble truncate(long j, long j2, IntFunction intFunction) {
                return Node.OfDouble.CC.$default$truncate((Node.OfDouble) this, j, j2, intFunction);
            }

            @Override // j$.util.stream.Nodes.EmptyNode, j$.util.stream.Node
            public /* bridge */ /* sintético */ Node.OfPrimitive truncate(long j, long j2, IntFunction intFunction) {
                Node.OfPrimitive truncate;
                truncate = truncate(j, j2, (IntFunction<Double[]>) intFunction);
                return truncate;
            }

            @Override // j$.util.stream.Nodes.EmptyNode, j$.util.stream.Node
            public /* bridge */ /* sintético */ Node truncate(long j, long j2, IntFunction intFunction) {
                Node truncate;
                truncate = truncate(j, j2, (IntFunction<Double[]>) intFunction);
                return truncate;
            }

            OfDouble() {
            }

            @Override // j$.util.stream.Node
            public Spliterator.OfDouble spliterator() {
                return Spliterators.emptyDoubleSpliterator();
            }

            @Override // j$.util.stream.Node.OfPrimitive
            public double[] asPrimitiveArray() {
                return Nodes.EMPTY_DOUBLE_ARRAY;
            }
        }
    }

    private static class ArrayNode<T> implements Node<T> {
        final T[] array;
        int curSize;

        @Override // j$.util.stream.Node
        public /* sintético */ Node getChild(int i) {
            return Node.CC.$default$getChild(this, i);
        }

        @Override // j$.util.stream.Node
        public /* sintético */ int getChildCount() {
            return Node.CC.$default$getChildCount(this);
        }

        @Override // j$.util.stream.Node
        public /* sintético */ StreamShape getShape() {
            StreamShape streamShape;
            streamShape = StreamShape.REFERENCE;
            return streamShape;
        }

        @Override // j$.util.stream.Node
        public /* sintético */ Node truncate(long j, long j2, IntFunction intFunction) {
            return Node.CC.$default$truncate(this, j, j2, intFunction);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ArrayNode != java.util.stream.Nodes$ArrayNode<T> */
        ArrayNode(long size, IntFunction<T[]> generator) {
            if (size >= Nodes.MAX_ARRAY_SIZE) {
                throw new IllegalArgumentException(Nodes.BAD_SIZE);
            }
            this.array = generator.apply((int) size);
            this.curSize = 0;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ArrayNode != java.util.stream.Nodes$ArrayNode<T> */
        ArrayNode(T[] array) {
            this.array = array;
            this.curSize = array.length;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ArrayNode != java.util.stream.Nodes$ArrayNode<T> */
        @Override // j$.util.stream.Node
        public Spliterator<T> spliterator() {
            return DesugarArrays.spliterator(this.array, 0, this.curSize);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ArrayNode != java.util.stream.Nodes$ArrayNode<T> */
        @Override // j$.util.stream.Node
        public void copyInto(T[] dest, int destOffset) {
            System.arraycopy(this.array, 0, dest, destOffset, this.curSize);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ArrayNode != java.util.stream.Nodes$ArrayNode<T> */
        @Override // j$.util.stream.Node
        public T[] asArray(IntFunction<T[]> generator) {
            if (this.array.length == this.curSize) {
                return this.array;
            }
            throw new IllegalStateException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ArrayNode != java.util.stream.Nodes$ArrayNode<T> */
        @Override // j$.util.stream.Node
        public long count() {
            return this.curSize;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ArrayNode != java.util.stream.Nodes$ArrayNode<T> */
        @Override // j$.util.stream.Node
        public void forEach(Consumer<? super T> consumer) {
            for (int i = 0; i < this.curSize; i++) {
                consumer.accept(this.array[i]);
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ArrayNode != java.util.stream.Nodes$ArrayNode<T> */
        public String toString() {
            return String.format("ArrayNode[%d][%s]", Integer.valueOf(this.array.length - this.curSize), Arrays.toString(this.array));
        }
    }

    private static final class CollectionNode<T> implements Node<T> {
        private final Collection<T> c;

        @Override // j$.util.stream.Node
        public /* sintético */ Node getChild(int i) {
            return Node.CC.$default$getChild(this, i);
        }

        @Override // j$.util.stream.Node
        public /* sintético */ int getChildCount() {
            return Node.CC.$default$getChildCount(this);
        }

        @Override // j$.util.stream.Node
        public /* sintético */ StreamShape getShape() {
            StreamShape streamShape;
            streamShape = StreamShape.REFERENCE;
            return streamShape;
        }

        @Override // j$.util.stream.Node
        public /* sintético */ Node truncate(long j, long j2, IntFunction intFunction) {
            return Node.CC.$default$truncate(this, j, j2, intFunction);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$CollectionNode != java.util.stream.Nodes$CollectionNode<T> */
        CollectionNode(Collection<T> c) {
            this.c = c;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$CollectionNode != java.util.stream.Nodes$CollectionNode<T> */
        @Override // j$.util.stream.Node
        public Spliterator<T> spliterator() {
            return Collection.EL.stream(this.c).spliterator2();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$CollectionNode != java.util.stream.Nodes$CollectionNode<T> */
        @Override // j$.util.stream.Node
        public void copyInto(T[] array, int offset) {
            for (T t : this.c) {
                array[offset] = t;
                offset++;
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$CollectionNode != java.util.stream.Nodes$CollectionNode<T> */
        @Override // j$.util.stream.Node
        public T[] asArray(IntFunction<T[]> intFunction) {
            return (T[]) this.c.toArray(intFunction.apply(this.c.size()));
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$CollectionNode != java.util.stream.Nodes$CollectionNode<T> */
        @Override // j$.util.stream.Node
        public long count() {
            return this.c.size();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$CollectionNode != java.util.stream.Nodes$CollectionNode<T> */
        @Override // j$.util.stream.Node
        public void forEach(Consumer<? super T> consumer) {
            Collection.EL.forEach(this.c, consumer);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$CollectionNode != java.util.stream.Nodes$CollectionNode<T> */
        public String toString() {
            return String.format("CollectionNode[%d][%s]", Integer.valueOf(this.c.size()), this.c);
        }
    }

    private static abstract class AbstractConcNode<T, T_NODE extends Node<T>> implements Node<T> {
        protected final T_NODE left;
        protected final T_NODE right;
        private final long size;

        @Override // j$.util.stream.Node
        public /* sintético */ StreamShape getShape() {
            StreamShape streamShape;
            streamShape = StreamShape.REFERENCE;
            return streamShape;
        }

        @Override // j$.util.stream.Node
        public /* sintético */ Node truncate(long j, long j2, IntFunction intFunction) {
            return Node.CC.$default$truncate(this, j, j2, intFunction);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$AbstractConcNode != java.util.stream.Nodes$AbstractConcNode<T, T_NODE extends j$.util.stream.Node<T>> */
        AbstractConcNode(T_NODE left, T_NODE right) {
            this.left = left;
            this.right = right;
            this.size = left.count() + right.count();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$AbstractConcNode != java.util.stream.Nodes$AbstractConcNode<T, T_NODE extends j$.util.stream.Node<T>> */
        @Override // j$.util.stream.Node
        public int getChildCount() {
            return 2;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$AbstractConcNode != java.util.stream.Nodes$AbstractConcNode<T, T_NODE extends j$.util.stream.Node<T>> */
        @Override // j$.util.stream.Node
        public T_NODE getChild(int i) {
            if (i == 0) {
                return this.left;
            }
            if (i == 1) {
                return this.right;
            }
            throw new IndexOutOfBoundsException();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$AbstractConcNode != java.util.stream.Nodes$AbstractConcNode<T, T_NODE extends j$.util.stream.Node<T>> */
        @Override // j$.util.stream.Node
        public long count() {
            return this.size;
        }
    }

    static final class ConcNode<T> extends AbstractConcNode<T, Node<T>> implements Node<T> {
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Node != java.util.stream.Node<T> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ConcNode != java.util.stream.Nodes$ConcNode<T> */
        ConcNode(Node<T> node, Node<T> node2) {
            super(node, node2);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ConcNode != java.util.stream.Nodes$ConcNode<T> */
        @Override // j$.util.stream.Node
        public Spliterator<T> spliterator() {
            return new InternalNodeSpliterator.OfRef(this);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ConcNode != java.util.stream.Nodes$ConcNode<T> */
        @Override // j$.util.stream.Node
        public void copyInto(T[] array, int offset) {
            Objects.requireNonNull(array);
            this.left.copyInto(array, offset);
            this.right.copyInto(array, ((int) this.left.count()) + offset);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ConcNode != java.util.stream.Nodes$ConcNode<T> */
        @Override // j$.util.stream.Node
        public T[] asArray(IntFunction<T[]> generator) {
            long size = count();
            if (size >= Nodes.MAX_ARRAY_SIZE) {
                throw new IllegalArgumentException(Nodes.BAD_SIZE);
            }
            T[] array = generator.apply((int) size);
            copyInto(array, 0);
            return array;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ConcNode != java.util.stream.Nodes$ConcNode<T> */
        @Override // j$.util.stream.Node
        public void forEach(Consumer<? super T> consumer) {
            this.left.forEach(consumer);
            this.right.forEach(consumer);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ConcNode != java.util.stream.Nodes$ConcNode<T> */
        @Override // j$.util.stream.Nodes.AbstractConcNode, j$.util.stream.Node
        public Node<T> truncate(long from, long to, IntFunction<T[]> generator) {
            if (from == 0 && to == count()) {
                return this;
            }
            long leftCount = this.left.count();
            if (from >= leftCount) {
                return this.right.truncate(from - leftCount, to - leftCount, generator);
            }
            if (to <= leftCount) {
                return this.left.truncate(from, to, generator);
            }
            return Nodes.conc(getShape(), this.left.truncate(from, leftCount, generator), this.right.truncate(0L, to - leftCount, generator));
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ConcNode != java.util.stream.Nodes$ConcNode<T> */
        public String toString() {
            return count() < 32 ? String.format("ConcNode[%s.%s]", this.left, this.right) : String.format("ConcNode[size=%d]", Long.valueOf(count()));
        }

        private static abstract class OfPrimitive<E, T_CONS, T_ARR, T_SPLITR extends Spliterator.OfPrimitive<E, T_CONS, T_SPLITR>, T_NODE extends Node.OfPrimitive<E, T_CONS, T_ARR, T_SPLITR, T_NODE>> extends AbstractConcNode<E, T_NODE> implements Node.OfPrimitive<E, T_CONS, T_ARR, T_SPLITR, T_NODE> {
            @Override // j$.util.stream.Node
            public /* sintético */ Object[] asArray(IntFunction intFunction) {
                return Node.OfPrimitive.CC.$default$asArray(this, intFunction);
            }

            @Override // j$.util.stream.Node
            public /* bridge */ /* sintético */ Spliterator spliterator() {
                Spliterator spliterator;
                spliterator = spliterator();
                return spliterator;
            }

            @Override // j$.util.stream.Nodes.AbstractConcNode, j$.util.stream.Node
            public /* bridge */ /* sintético */ Node truncate(long j, long j2, IntFunction intFunction) {
                Node truncate;
                truncate = truncate(j, j2, intFunction);
                return truncate;
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ConcNode$OfPrimitive != java.util.stream.Nodes$ConcNode$OfPrimitive<E, T_CONS, T_ARR, T_SPLITR extends j$.util.Spliterator$OfPrimitive<E, T_CONS, T_SPLITR>, T_NODE extends j$.util.stream.Node$OfPrimitive<E, T_CONS, T_ARR, T_SPLITR, T_NODE>> */
            @Override // j$.util.stream.Nodes.AbstractConcNode, j$.util.stream.Node
            public /* bridge */ /* sintético */ Node.OfPrimitive getChild(int i) {
                return (Node.OfPrimitive) super.getChild(i);
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ConcNode$OfPrimitive != java.util.stream.Nodes$ConcNode$OfPrimitive<E, T_CONS, T_ARR, T_SPLITR extends j$.util.Spliterator$OfPrimitive<E, T_CONS, T_SPLITR>, T_NODE extends j$.util.stream.Node$OfPrimitive<E, T_CONS, T_ARR, T_SPLITR, T_NODE>> */
            OfPrimitive(T_NODE left, T_NODE right) {
                super(left, right);
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ConcNode$OfPrimitive != java.util.stream.Nodes$ConcNode$OfPrimitive<E, T_CONS, T_ARR, T_SPLITR extends j$.util.Spliterator$OfPrimitive<E, T_CONS, T_SPLITR>, T_NODE extends j$.util.stream.Node$OfPrimitive<E, T_CONS, T_ARR, T_SPLITR, T_NODE>> */
            @Override // j$.util.stream.Node.OfPrimitive
            public void forEach(T_CONS consumer) {
                ((Node.OfPrimitive) this.left).forEach((Node.OfPrimitive) consumer);
                ((Node.OfPrimitive) this.right).forEach((Node.OfPrimitive) consumer);
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ConcNode$OfPrimitive != java.util.stream.Nodes$ConcNode$OfPrimitive<E, T_CONS, T_ARR, T_SPLITR extends j$.util.Spliterator$OfPrimitive<E, T_CONS, T_SPLITR>, T_NODE extends j$.util.stream.Node$OfPrimitive<E, T_CONS, T_ARR, T_SPLITR, T_NODE>> */
            @Override // j$.util.stream.Node.OfPrimitive
            public void copyInto(T_ARR array, int offset) {
                ((Node.OfPrimitive) this.left).copyInto((Node.OfPrimitive) array, offset);
                ((Node.OfPrimitive) this.right).copyInto((Node.OfPrimitive) array, ((int) ((Node.OfPrimitive) this.left).count()) + offset);
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ConcNode$OfPrimitive != java.util.stream.Nodes$ConcNode$OfPrimitive<E, T_CONS, T_ARR, T_SPLITR extends j$.util.Spliterator$OfPrimitive<E, T_CONS, T_SPLITR>, T_NODE extends j$.util.stream.Node$OfPrimitive<E, T_CONS, T_ARR, T_SPLITR, T_NODE>> */
            @Override // j$.util.stream.Node.OfPrimitive
            public T_ARR asPrimitiveArray() {
                long size = count();
                if (size >= Nodes.MAX_ARRAY_SIZE) {
                    throw new IllegalArgumentException(Nodes.BAD_SIZE);
                }
                T_ARR array = newArray((int) size);
                copyInto((OfPrimitive<E, T_CONS, T_ARR, T_SPLITR, T_NODE>) array, 0);
                return array;
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ConcNode$OfPrimitive != java.util.stream.Nodes$ConcNode$OfPrimitive<E, T_CONS, T_ARR, T_SPLITR extends j$.util.Spliterator$OfPrimitive<E, T_CONS, T_SPLITR>, T_NODE extends j$.util.stream.Node$OfPrimitive<E, T_CONS, T_ARR, T_SPLITR, T_NODE>> */
            public String toString() {
                return count() < 32 ? String.format("%s[%s.%s]", getClass().getName(), this.left, this.right) : String.format("%s[size=%d]", getClass().getName(), Long.valueOf(count()));
            }
        }

        static final class OfInt extends OfPrimitive<Integer, IntConsumer, int[], Spliterator.OfInt, Node.OfInt> implements Node.OfInt {
            @Override // j$.util.stream.Node.OfInt
            public /* sintético */ void copyInto(Integer[] numArr, int i) {
                Node.OfInt.CC.$default$copyInto((Node.OfInt) this, numArr, i);
            }

            @Override // j$.util.stream.Node
            public /* bridge */ /* sintético */ void copyInto(Object[] objArr, int i) {
                copyInto((Integer[]) objArr, i);
            }

            @Override // j$.util.stream.Node
            public /* sintético */ void forEach(Consumer consumer) {
                Node.OfInt.CC.$default$forEach(this, consumer);
            }

            @Override // j$.util.stream.Nodes.AbstractConcNode, j$.util.stream.Node
            public /* sintético */ StreamShape getShape() {
                StreamShape streamShape;
                streamShape = StreamShape.INT_VALUE;
                return streamShape;
            }

            /* JADX WARN: falha na inferência de tipo para: r1v1, types: [int[], java.lang.Object] */
            @Override // j$.util.stream.Node.OfPrimitive
            public /* bridge */ /* sintético */ int[] newArray(int i) {
                ?? newArray;
                newArray = newArray(i);
                return newArray;
            }

            @Override // j$.util.stream.Node.OfPrimitive
            /* renomeado de: newArray, motivo: evitar colisão após correção de tipos em outro método */
            public /* sintético */ int[] newArray2(int i) {
                return Node.OfInt.CC.m858$default$newArray((Node.OfInt) this, i);
            }

            @Override // j$.util.stream.Nodes.ConcNode.OfPrimitive, j$.util.stream.Nodes.AbstractConcNode, j$.util.stream.Node
            public /* sintético */ Node.OfInt truncate(long j, long j2, IntFunction intFunction) {
                return Node.OfInt.CC.$default$truncate((Node.OfInt) this, j, j2, intFunction);
            }

            @Override // j$.util.stream.Nodes.ConcNode.OfPrimitive, j$.util.stream.Nodes.AbstractConcNode, j$.util.stream.Node
            public /* bridge */ /* sintético */ Node.OfPrimitive truncate(long j, long j2, IntFunction intFunction) {
                Node.OfPrimitive truncate;
                truncate = truncate(j, j2, (IntFunction<Integer[]>) intFunction);
                return truncate;
            }

            @Override // j$.util.stream.Nodes.ConcNode.OfPrimitive, j$.util.stream.Nodes.AbstractConcNode, j$.util.stream.Node
            public /* bridge */ /* sintético */ Node truncate(long j, long j2, IntFunction intFunction) {
                Node truncate;
                truncate = truncate(j, j2, (IntFunction<Integer[]>) intFunction);
                return truncate;
            }

            OfInt(Node.OfInt left, Node.OfInt right) {
                super(left, right);
            }

            @Override // j$.util.stream.Nodes.ConcNode.OfPrimitive, j$.util.stream.Node
            public Spliterator.OfInt spliterator() {
                return new InternalNodeSpliterator.OfInt(this);
            }
        }

        static final class OfLong extends OfPrimitive<Long, LongConsumer, long[], Spliterator.OfLong, Node.OfLong> implements Node.OfLong {
            @Override // j$.util.stream.Node.OfLong
            public /* sintético */ void copyInto(Long[] lArr, int i) {
                Node.OfLong.CC.$default$copyInto((Node.OfLong) this, lArr, i);
            }

            @Override // j$.util.stream.Node
            public /* bridge */ /* sintético */ void copyInto(Object[] objArr, int i) {
                copyInto((Long[]) objArr, i);
            }

            @Override // j$.util.stream.Node
            public /* sintético */ void forEach(Consumer consumer) {
                Node.OfLong.CC.$default$forEach(this, consumer);
            }

            @Override // j$.util.stream.Nodes.AbstractConcNode, j$.util.stream.Node
            public /* sintético */ StreamShape getShape() {
                StreamShape streamShape;
                streamShape = StreamShape.LONG_VALUE;
                return streamShape;
            }

            /* JADX WARN: falha na inferência de tipo para: r1v1, types: [java.lang.Object, long[]] */
            @Override // j$.util.stream.Node.OfPrimitive
            public /* bridge */ /* sintético */ long[] newArray(int i) {
                ?? newArray;
                newArray = newArray(i);
                return newArray;
            }

            @Override // j$.util.stream.Node.OfPrimitive
            /* renomeado de: newArray, motivo: evitar colisão após correção de tipos em outro método */
            public /* sintético */ long[] newArray2(int i) {
                return Node.OfLong.CC.m861$default$newArray((Node.OfLong) this, i);
            }

            @Override // j$.util.stream.Nodes.ConcNode.OfPrimitive, j$.util.stream.Nodes.AbstractConcNode, j$.util.stream.Node
            public /* sintético */ Node.OfLong truncate(long j, long j2, IntFunction intFunction) {
                return Node.OfLong.CC.$default$truncate((Node.OfLong) this, j, j2, intFunction);
            }

            @Override // j$.util.stream.Nodes.ConcNode.OfPrimitive, j$.util.stream.Nodes.AbstractConcNode, j$.util.stream.Node
            public /* bridge */ /* sintético */ Node.OfPrimitive truncate(long j, long j2, IntFunction intFunction) {
                Node.OfPrimitive truncate;
                truncate = truncate(j, j2, (IntFunction<Long[]>) intFunction);
                return truncate;
            }

            @Override // j$.util.stream.Nodes.ConcNode.OfPrimitive, j$.util.stream.Nodes.AbstractConcNode, j$.util.stream.Node
            public /* bridge */ /* sintético */ Node truncate(long j, long j2, IntFunction intFunction) {
                Node truncate;
                truncate = truncate(j, j2, (IntFunction<Long[]>) intFunction);
                return truncate;
            }

            OfLong(Node.OfLong left, Node.OfLong right) {
                super(left, right);
            }

            @Override // j$.util.stream.Nodes.ConcNode.OfPrimitive, j$.util.stream.Node
            public Spliterator.OfLong spliterator() {
                return new InternalNodeSpliterator.OfLong(this);
            }
        }

        static final class OfDouble extends OfPrimitive<Double, DoubleConsumer, double[], Spliterator.OfDouble, Node.OfDouble> implements Node.OfDouble {
            @Override // j$.util.stream.Node.OfDouble
            public /* sintético */ void copyInto(Double[] dArr, int i) {
                Node.OfDouble.CC.$default$copyInto((Node.OfDouble) this, dArr, i);
            }

            @Override // j$.util.stream.Node
            public /* bridge */ /* sintético */ void copyInto(Object[] objArr, int i) {
                copyInto((Double[]) objArr, i);
            }

            @Override // j$.util.stream.Node
            public /* sintético */ void forEach(Consumer consumer) {
                Node.OfDouble.CC.$default$forEach(this, consumer);
            }

            @Override // j$.util.stream.Nodes.AbstractConcNode, j$.util.stream.Node
            public /* sintético */ StreamShape getShape() {
                StreamShape streamShape;
                streamShape = StreamShape.DOUBLE_VALUE;
                return streamShape;
            }

            /* JADX WARN: falha na inferência de tipo para: r1v1, types: [double[], java.lang.Object] */
            @Override // j$.util.stream.Node.OfPrimitive
            public /* bridge */ /* sintético */ double[] newArray(int i) {
                ?? newArray;
                newArray = newArray(i);
                return newArray;
            }

            @Override // j$.util.stream.Node.OfPrimitive
            /* renomeado de: newArray, motivo: evitar colisão após correção de tipos em outro método */
            public /* sintético */ double[] newArray2(int i) {
                return Node.OfDouble.CC.m855$default$newArray((Node.OfDouble) this, i);
            }

            @Override // j$.util.stream.Nodes.ConcNode.OfPrimitive, j$.util.stream.Nodes.AbstractConcNode, j$.util.stream.Node
            public /* sintético */ Node.OfDouble truncate(long j, long j2, IntFunction intFunction) {
                return Node.OfDouble.CC.$default$truncate((Node.OfDouble) this, j, j2, intFunction);
            }

            @Override // j$.util.stream.Nodes.ConcNode.OfPrimitive, j$.util.stream.Nodes.AbstractConcNode, j$.util.stream.Node
            public /* bridge */ /* sintético */ Node.OfPrimitive truncate(long j, long j2, IntFunction intFunction) {
                Node.OfPrimitive truncate;
                truncate = truncate(j, j2, (IntFunction<Double[]>) intFunction);
                return truncate;
            }

            @Override // j$.util.stream.Nodes.ConcNode.OfPrimitive, j$.util.stream.Nodes.AbstractConcNode, j$.util.stream.Node
            public /* bridge */ /* sintético */ Node truncate(long j, long j2, IntFunction intFunction) {
                Node truncate;
                truncate = truncate(j, j2, (IntFunction<Double[]>) intFunction);
                return truncate;
            }

            OfDouble(Node.OfDouble left, Node.OfDouble right) {
                super(left, right);
            }

            @Override // j$.util.stream.Nodes.ConcNode.OfPrimitive, j$.util.stream.Node
            public Spliterator.OfDouble spliterator() {
                return new InternalNodeSpliterator.OfDouble(this);
            }
        }
    }

    private static abstract class InternalNodeSpliterator<T, S extends Spliterator<T>, N extends Node<T>> implements Spliterator<T> {
        int curChildIndex;
        N curNode;
        S lastNodeSpliterator;
        S tryAdvanceSpliterator;
        Deque<N> tryAdvanceStack;

        @Override // j$.util.Spliterator
        public /* sintético */ void forEachRemaining(Consumer consumer) {
            Spliterator.CC.$default$forEachRemaining(this, consumer);
        }

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

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$InternalNodeSpliterator != java.util.stream.Nodes$InternalNodeSpliterator<T, S extends j$.util.Spliterator<T>, N extends j$.util.stream.Node<T>> */
        InternalNodeSpliterator(N curNode) {
            this.curNode = curNode;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$InternalNodeSpliterator != java.util.stream.Nodes$InternalNodeSpliterator<T, S extends j$.util.Spliterator<T>, N extends j$.util.stream.Node<T>> */
        protected final Deque<N> initStack() {
            ArrayDeque arrayDeque = new ArrayDeque(8);
            int i = this.curNode.getChildCount();
            while (true) {
                i--;
                if (i >= this.curChildIndex) {
                    arrayDeque.addFirst(this.curNode.getChild(i));
                } else {
                    return arrayDeque;
                }
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$InternalNodeSpliterator != java.util.stream.Nodes$InternalNodeSpliterator<T, S extends j$.util.Spliterator<T>, N extends j$.util.stream.Node<T>> */
        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        protected final N findNextLeafNode(Deque<N> deque) {
            while (true) {
                N n = (N) deque.pollFirst();
                if (n != null) {
                    if (n.getChildCount() != 0) {
                        for (int i = n.getChildCount() - 1; i >= 0; i--) {
                            deque.addFirst(n.getChild(i));
                        }
                    } else if (n.count() > 0) {
                        return n;
                    }
                } else {
                    return null;
                }
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$InternalNodeSpliterator != java.util.stream.Nodes$InternalNodeSpliterator<T, S extends j$.util.Spliterator<T>, N extends j$.util.stream.Node<T>> */
        protected final boolean initTryAdvance() {
            if (this.curNode == null) {
                return false;
            }
            if (this.tryAdvanceSpliterator == null) {
                if (this.lastNodeSpliterator == null) {
                    this.tryAdvanceStack = initStack();
                    N findNextLeafNode = findNextLeafNode(this.tryAdvanceStack);
                    if (findNextLeafNode != null) {
                        this.tryAdvanceSpliterator = (S) findNextLeafNode.spliterator();
                        return true;
                    }
                    this.curNode = null;
                    return false;
                }
                this.tryAdvanceSpliterator = this.lastNodeSpliterator;
                return true;
            }
            return true;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$InternalNodeSpliterator != java.util.stream.Nodes$InternalNodeSpliterator<T, S extends j$.util.Spliterator<T>, N extends j$.util.stream.Node<T>> */
        @Override // j$.util.Spliterator
        public final S trySplit() {
            if (this.curNode == null || this.tryAdvanceSpliterator != null) {
                return null;
            }
            if (this.lastNodeSpliterator != null) {
                return (S) this.lastNodeSpliterator.trySplit();
            }
            if (this.curChildIndex < this.curNode.getChildCount() - 1) {
                N n = this.curNode;
                int i = this.curChildIndex;
                this.curChildIndex = i + 1;
                return n.getChild(i).spliterator();
            }
            this.curNode = (N) this.curNode.getChild(this.curChildIndex);
            if (this.curNode.getChildCount() == 0) {
                this.lastNodeSpliterator = (S) this.curNode.spliterator();
                return (S) this.lastNodeSpliterator.trySplit();
            }
            this.curChildIndex = 0;
            N n2 = this.curNode;
            int i2 = this.curChildIndex;
            this.curChildIndex = i2 + 1;
            return n2.getChild(i2).spliterator();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$InternalNodeSpliterator != java.util.stream.Nodes$InternalNodeSpliterator<T, S extends j$.util.Spliterator<T>, N extends j$.util.stream.Node<T>> */
        @Override // j$.util.Spliterator
        public final long estimateSize() {
            if (this.curNode == null) {
                return 0L;
            }
            if (this.lastNodeSpliterator != null) {
                return this.lastNodeSpliterator.estimateSize();
            }
            long size = 0;
            for (int i = this.curChildIndex; i < this.curNode.getChildCount(); i++) {
                size += this.curNode.getChild(i).count();
            }
            return size;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$InternalNodeSpliterator != java.util.stream.Nodes$InternalNodeSpliterator<T, S extends j$.util.Spliterator<T>, N extends j$.util.stream.Node<T>> */
        @Override // j$.util.Spliterator
        public final int characteristics() {
            return 64;
        }

        private static final class OfRef<T> extends InternalNodeSpliterator<T, Spliterator<T>, Node<T>> {
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Node != java.util.stream.Node<T> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$InternalNodeSpliterator$OfRef != java.util.stream.Nodes$InternalNodeSpliterator$OfRef<T> */
            OfRef(Node<T> node) {
                super(node);
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Node != java.util.stream.Node<T> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$InternalNodeSpliterator$OfRef != java.util.stream.Nodes$InternalNodeSpliterator$OfRef<T> */
            @Override // j$.util.Spliterator
            public boolean tryAdvance(Consumer<? super T> consumer) {
                Node<T> findNextLeafNode;
                if (!initTryAdvance()) {
                    return false;
                }
                boolean tryAdvance = this.tryAdvanceSpliterator.tryAdvance(consumer);
                if (!tryAdvance) {
                    if (this.lastNodeSpliterator == null && (findNextLeafNode = findNextLeafNode(this.tryAdvanceStack)) != null) {
                        this.tryAdvanceSpliterator = findNextLeafNode.spliterator();
                        return this.tryAdvanceSpliterator.tryAdvance(consumer);
                    }
                    this.curNode = null;
                }
                return tryAdvance;
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Node != java.util.stream.Node<T> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$InternalNodeSpliterator$OfRef != java.util.stream.Nodes$InternalNodeSpliterator$OfRef<T> */
            @Override // j$.util.stream.Nodes.InternalNodeSpliterator, j$.util.Spliterator
            public void forEachRemaining(Consumer<? super T> consumer) {
                if (this.curNode == null) {
                    return;
                }
                if (this.tryAdvanceSpliterator == null) {
                    if (this.lastNodeSpliterator == null) {
                        Deque<java.util.stream.Node<T>> stack = initStack();
                        while (true) {
                            Node findNextLeafNode = findNextLeafNode(stack);
                            if (findNextLeafNode != null) {
                                findNextLeafNode.forEach(consumer);
                            } else {
                                this.curNode = null;
                                return;
                            }
                        }
                    } else {
                        this.lastNodeSpliterator.forEachRemaining(consumer);
                    }
                } else {
                    while (tryAdvance(consumer)) {
                    }
                }
            }
        }

        private static abstract class OfPrimitive<T, T_CONS, T_ARR, T_SPLITR extends Spliterator.OfPrimitive<T, T_CONS, T_SPLITR>, N extends Node.OfPrimitive<T, T_CONS, T_ARR, T_SPLITR, N>> extends InternalNodeSpliterator<T, T_SPLITR, N> implements Spliterator.OfPrimitive<T, T_CONS, T_SPLITR> {
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$InternalNodeSpliterator$OfPrimitive != java.util.stream.Nodes$InternalNodeSpliterator$OfPrimitive<T, T_CONS, T_ARR, T_SPLITR extends j$.util.Spliterator$OfPrimitive<T, T_CONS, T_SPLITR>, N extends j$.util.stream.Node$OfPrimitive<T, T_CONS, T_ARR, T_SPLITR, N>> */
            @Override // j$.util.stream.Nodes.InternalNodeSpliterator, j$.util.Spliterator
            public /* bridge */ /* sintético */ Spliterator.OfPrimitive trySplit() {
                return (Spliterator.OfPrimitive) super.trySplit();
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$InternalNodeSpliterator$OfPrimitive != java.util.stream.Nodes$InternalNodeSpliterator$OfPrimitive<T, T_CONS, T_ARR, T_SPLITR extends j$.util.Spliterator$OfPrimitive<T, T_CONS, T_SPLITR>, N extends j$.util.stream.Node$OfPrimitive<T, T_CONS, T_ARR, T_SPLITR, N>> */
            OfPrimitive(N cur) {
                super(cur);
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$InternalNodeSpliterator$OfPrimitive != java.util.stream.Nodes$InternalNodeSpliterator$OfPrimitive<T, T_CONS, T_ARR, T_SPLITR extends j$.util.Spliterator$OfPrimitive<T, T_CONS, T_SPLITR>, N extends j$.util.stream.Node$OfPrimitive<T, T_CONS, T_ARR, T_SPLITR, N>> */
            @Override // j$.util.Spliterator.OfPrimitive
            public boolean tryAdvance(T_CONS consumer) {
                Node.OfPrimitive ofPrimitive;
                if (!initTryAdvance()) {
                    return false;
                }
                boolean hasNext = ((Spliterator.OfPrimitive) this.tryAdvanceSpliterator).tryAdvance((Spliterator.OfPrimitive) consumer);
                if (!hasNext) {
                    if (this.lastNodeSpliterator == null && (ofPrimitive = (Node.OfPrimitive) findNextLeafNode(this.tryAdvanceStack)) != null) {
                        this.tryAdvanceSpliterator = ofPrimitive.spliterator();
                        return ((Spliterator.OfPrimitive) this.tryAdvanceSpliterator).tryAdvance((Spliterator.OfPrimitive) consumer);
                    }
                    this.curNode = null;
                }
                return hasNext;
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$InternalNodeSpliterator$OfPrimitive != java.util.stream.Nodes$InternalNodeSpliterator$OfPrimitive<T, T_CONS, T_ARR, T_SPLITR extends j$.util.Spliterator$OfPrimitive<T, T_CONS, T_SPLITR>, N extends j$.util.stream.Node$OfPrimitive<T, T_CONS, T_ARR, T_SPLITR, N>> */
            /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
            @Override // j$.util.Spliterator.OfPrimitive
            public void forEachRemaining(T_CONS consumer) {
                if (this.curNode == null) {
                    return;
                }
                if (this.tryAdvanceSpliterator == null) {
                    if (this.lastNodeSpliterator == null) {
                        Deque<N> stack = initStack();
                        while (true) {
                            Node.OfPrimitive ofPrimitive = (Node.OfPrimitive) findNextLeafNode(stack);
                            if (ofPrimitive != null) {
                                ofPrimitive.forEach((Node.OfPrimitive) consumer);
                            } else {
                                this.curNode = null;
                                return;
                            }
                        }
                    } else {
                        ((Spliterator.OfPrimitive) this.lastNodeSpliterator).forEachRemaining((Spliterator.OfPrimitive) consumer);
                    }
                } else {
                    while (tryAdvance((OfPrimitive<T, T_CONS, T_ARR, T_SPLITR, N>) consumer)) {
                    }
                }
            }
        }

        private static final class OfInt extends OfPrimitive<Integer, IntConsumer, int[], Spliterator.OfInt, Node.OfInt> implements Spliterator.OfInt {
            @Override // j$.util.stream.Nodes.InternalNodeSpliterator, j$.util.Spliterator
            public /* sintético */ void forEachRemaining(Consumer consumer) {
                Spliterator.OfInt.CC.$default$forEachRemaining((Spliterator.OfInt) this, consumer);
            }

            @Override // j$.util.Spliterator
            public /* sintético */ boolean tryAdvance(Consumer consumer) {
                return Spliterator.OfInt.CC.$default$tryAdvance((Spliterator.OfInt) this, consumer);
            }

            @Override // j$.util.Spliterator.OfInt
            public /* bridge */ /* sintético */ void forEachRemaining(IntConsumer intConsumer) {
                super.forEachRemaining((OfInt) intConsumer);
            }

            @Override // j$.util.Spliterator.OfInt
            public /* bridge */ /* sintético */ boolean tryAdvance(IntConsumer intConsumer) {
                return super.tryAdvance((OfInt) intConsumer);
            }

            @Override // j$.util.stream.Nodes.InternalNodeSpliterator.OfPrimitive, j$.util.stream.Nodes.InternalNodeSpliterator, j$.util.Spliterator
            public /* bridge */ /* sintético */ Spliterator.OfInt trySplit() {
                return (Spliterator.OfInt) super.trySplit();
            }

            OfInt(Node.OfInt cur) {
                super(cur);
            }
        }

        private static final class OfLong extends OfPrimitive<Long, LongConsumer, long[], Spliterator.OfLong, Node.OfLong> implements Spliterator.OfLong {
            @Override // j$.util.stream.Nodes.InternalNodeSpliterator, j$.util.Spliterator
            public /* sintético */ void forEachRemaining(Consumer consumer) {
                Spliterator.OfLong.CC.$default$forEachRemaining((Spliterator.OfLong) this, consumer);
            }

            @Override // j$.util.Spliterator
            public /* sintético */ boolean tryAdvance(Consumer consumer) {
                return Spliterator.OfLong.CC.$default$tryAdvance((Spliterator.OfLong) this, consumer);
            }

            @Override // j$.util.Spliterator.OfLong
            public /* bridge */ /* sintético */ void forEachRemaining(LongConsumer longConsumer) {
                super.forEachRemaining((OfLong) longConsumer);
            }

            @Override // j$.util.Spliterator.OfLong
            public /* bridge */ /* sintético */ boolean tryAdvance(LongConsumer longConsumer) {
                return super.tryAdvance((OfLong) longConsumer);
            }

            @Override // j$.util.stream.Nodes.InternalNodeSpliterator.OfPrimitive, j$.util.stream.Nodes.InternalNodeSpliterator, j$.util.Spliterator
            public /* bridge */ /* sintético */ Spliterator.OfLong trySplit() {
                return (Spliterator.OfLong) super.trySplit();
            }

            OfLong(Node.OfLong cur) {
                super(cur);
            }
        }

        private static final class OfDouble extends OfPrimitive<Double, DoubleConsumer, double[], Spliterator.OfDouble, Node.OfDouble> implements Spliterator.OfDouble {
            @Override // j$.util.stream.Nodes.InternalNodeSpliterator, j$.util.Spliterator
            public /* sintético */ void forEachRemaining(Consumer consumer) {
                Spliterator.OfDouble.CC.$default$forEachRemaining((Spliterator.OfDouble) this, consumer);
            }

            @Override // j$.util.Spliterator
            public /* sintético */ boolean tryAdvance(Consumer consumer) {
                return Spliterator.OfDouble.CC.$default$tryAdvance((Spliterator.OfDouble) this, consumer);
            }

            @Override // j$.util.Spliterator.OfDouble
            public /* bridge */ /* sintético */ void forEachRemaining(DoubleConsumer doubleConsumer) {
                super.forEachRemaining((OfDouble) doubleConsumer);
            }

            @Override // j$.util.Spliterator.OfDouble
            public /* bridge */ /* sintético */ boolean tryAdvance(DoubleConsumer doubleConsumer) {
                return super.tryAdvance((OfDouble) doubleConsumer);
            }

            @Override // j$.util.stream.Nodes.InternalNodeSpliterator.OfPrimitive, j$.util.stream.Nodes.InternalNodeSpliterator, j$.util.Spliterator
            public /* bridge */ /* sintético */ Spliterator.OfDouble trySplit() {
                return (Spliterator.OfDouble) super.trySplit();
            }

            OfDouble(Node.OfDouble cur) {
                super(cur);
            }
        }
    }

    private static final class FixedNodeBuilder<T> extends ArrayNode<T> implements Node.Builder<T> {
        static final /* sintético */ boolean $assertionsDisabled = false;

        @Override // j$.util.stream.Sink, java.util.function.DoubleConsumer
        public /* sintético */ void accept(double d) {
            Sink.CC.$default$accept(this, d);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ void accept(int i) {
            Sink.CC.$default$accept((Sink) this, i);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ void accept(long j) {
            Sink.CC.$default$accept((Sink) this, j);
        }

        @Override // java.util.function.Consumer
        public /* sintético */ Consumer andThen(Consumer consumer) {
            return Consumer$CC.$default$andThen(this, consumer);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ boolean cancellationRequested() {
            return Sink.CC.$default$cancellationRequested(this);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$FixedNodeBuilder != java.util.stream.Nodes$FixedNodeBuilder<T> */
        FixedNodeBuilder(long size, IntFunction<T[]> generator) {
            super(size, generator);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$FixedNodeBuilder != java.util.stream.Nodes$FixedNodeBuilder<T> */
        @Override // j$.util.stream.Node.Builder
        /* renomeado de: build */
        public Node<T> build2() {
            if (this.curSize < this.array.length) {
                throw new IllegalStateException(String.format("Current size %d is less than fixed size %d", Integer.valueOf(this.curSize), Integer.valueOf(this.array.length)));
            }
            return this;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$FixedNodeBuilder != java.util.stream.Nodes$FixedNodeBuilder<T> */
        @Override // j$.util.stream.Sink
        public void begin(long size) {
            if (size != this.array.length) {
                throw new IllegalStateException(String.format("Begin size %d is not equal to fixed size %d", Long.valueOf(size), Integer.valueOf(this.array.length)));
            }
            this.curSize = 0;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$FixedNodeBuilder != java.util.stream.Nodes$FixedNodeBuilder<T> */
        @Override // java.util.function.Consumer
        public void accept(T t) {
            if (this.curSize < this.array.length) {
                T[] tArr = this.array;
                int i = this.curSize;
                this.curSize = i + 1;
                tArr[i] = t;
                return;
            }
            throw new IllegalStateException(String.format("Accept exceeded fixed size of %d", Integer.valueOf(this.array.length)));
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$FixedNodeBuilder != java.util.stream.Nodes$FixedNodeBuilder<T> */
        @Override // j$.util.stream.Sink
        public void end() {
            if (this.curSize < this.array.length) {
                throw new IllegalStateException(String.format("End size %d is less than fixed size %d", Integer.valueOf(this.curSize), Integer.valueOf(this.array.length)));
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$FixedNodeBuilder != java.util.stream.Nodes$FixedNodeBuilder<T> */
        @Override // j$.util.stream.Nodes.ArrayNode
        public String toString() {
            return String.format("FixedNodeBuilder[%d][%s]", Integer.valueOf(this.array.length - this.curSize), Arrays.toString(this.array));
        }
    }

    private static final class SpinedNodeBuilder<T> extends SpinedBuffer<T> implements Node<T>, Node.Builder<T> {
        static final /* sintético */ boolean $assertionsDisabled = false;
        private boolean building = false;

        @Override // j$.util.stream.Sink, java.util.function.DoubleConsumer
        public /* sintético */ void accept(double d) {
            Sink.CC.$default$accept(this, d);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ void accept(int i) {
            Sink.CC.$default$accept((Sink) this, i);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ void accept(long j) {
            Sink.CC.$default$accept((Sink) this, j);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ boolean cancellationRequested() {
            return Sink.CC.$default$cancellationRequested(this);
        }

        @Override // j$.util.stream.Node
        public /* sintético */ Node getChild(int i) {
            return Node.CC.$default$getChild(this, i);
        }

        @Override // j$.util.stream.Node
        public /* sintético */ int getChildCount() {
            return Node.CC.$default$getChildCount(this);
        }

        @Override // j$.util.stream.Node
        public /* sintético */ StreamShape getShape() {
            StreamShape streamShape;
            streamShape = StreamShape.REFERENCE;
            return streamShape;
        }

        @Override // j$.util.stream.Node
        public /* sintético */ Node truncate(long j, long j2, IntFunction intFunction) {
            return Node.CC.$default$truncate(this, j, j2, intFunction);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SpinedNodeBuilder != java.util.stream.Nodes$SpinedNodeBuilder<T> */
        SpinedNodeBuilder() {
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SpinedNodeBuilder != java.util.stream.Nodes$SpinedNodeBuilder<T> */
        @Override // j$.util.stream.SpinedBuffer, java.lang.Iterable, j$.lang.Iterable, j$.util.Collection
        public Spliterator<T> spliterator() {
            return super.spliterator();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SpinedNodeBuilder != java.util.stream.Nodes$SpinedNodeBuilder<T> */
        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        @Override // j$.util.stream.SpinedBuffer, java.lang.Iterable, j$.lang.Iterable
        public void forEach(Consumer<? super T> consumer) {
            super.forEach(consumer);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SpinedNodeBuilder != java.util.stream.Nodes$SpinedNodeBuilder<T> */
        @Override // j$.util.stream.Sink
        public void begin(long size) {
            this.building = true;
            clear();
            ensureCapacity(size);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SpinedNodeBuilder != java.util.stream.Nodes$SpinedNodeBuilder<T> */
        @Override // j$.util.stream.SpinedBuffer, java.util.function.Consumer
        public void accept(T t) {
            super.accept((SpinedNodeBuilder<T>) t);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SpinedNodeBuilder != java.util.stream.Nodes$SpinedNodeBuilder<T> */
        @Override // j$.util.stream.Sink
        public void end() {
            this.building = false;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SpinedNodeBuilder != java.util.stream.Nodes$SpinedNodeBuilder<T> */
        @Override // j$.util.stream.SpinedBuffer, j$.util.stream.Node
        public void copyInto(T[] array, int offset) {
            super.copyInto(array, offset);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SpinedNodeBuilder != java.util.stream.Nodes$SpinedNodeBuilder<T> */
        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        @Override // j$.util.stream.SpinedBuffer, j$.util.stream.Node
        public T[] asArray(IntFunction<T[]> intFunction) {
            return (T[]) super.asArray(intFunction);
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SpinedNodeBuilder != java.util.stream.Nodes$SpinedNodeBuilder<T> */
        @Override // j$.util.stream.Node.Builder
        /* renomeado de: build */
        public Node<T> build2() {
            return this;
        }
    }

    private static class IntArrayNode implements Node.OfInt {
        final int[] array;
        int curSize;

        @Override // j$.util.stream.Node.OfPrimitive, j$.util.stream.Node
        public /* sintético */ Object[] asArray(IntFunction intFunction) {
            return Node.OfPrimitive.CC.$default$asArray(this, intFunction);
        }

        @Override // j$.util.stream.Node.OfInt
        public /* sintético */ void copyInto(Integer[] numArr, int i) {
            Node.OfInt.CC.$default$copyInto((Node.OfInt) this, numArr, i);
        }

        @Override // j$.util.stream.Node
        public /* bridge */ /* sintético */ void copyInto(Object[] objArr, int i) {
            copyInto((Integer[]) objArr, i);
        }

        @Override // j$.util.stream.Node.OfInt, j$.util.stream.Node
        public /* sintético */ void forEach(Consumer consumer) {
            Node.OfInt.CC.$default$forEach(this, consumer);
        }

        @Override // j$.util.stream.Node.OfPrimitive, j$.util.stream.Node
        public /* sintético */ Node.OfPrimitive getChild(int i) {
            return Node.OfPrimitive.CC.$default$getChild((Node.OfPrimitive) this, i);
        }

        @Override // j$.util.stream.Node
        public /* bridge */ /* sintético */ Node getChild(int i) {
            Node child;
            child = getChild(i);
            return child;
        }

        @Override // j$.util.stream.Node
        public /* sintético */ int getChildCount() {
            return Node.CC.$default$getChildCount(this);
        }

        @Override // j$.util.stream.Node.OfInt, j$.util.stream.Node
        public /* sintético */ StreamShape getShape() {
            StreamShape streamShape;
            streamShape = StreamShape.INT_VALUE;
            return streamShape;
        }

        /* JADX WARN: falha na inferência de tipo para: r1v1, types: [int[], java.lang.Object] */
        @Override // j$.util.stream.Node.OfPrimitive
        public /* bridge */ /* sintético */ int[] newArray(int i) {
            ?? newArray;
            newArray = newArray(i);
            return newArray;
        }

        @Override // j$.util.stream.Node.OfInt, j$.util.stream.Node.OfPrimitive
        /* renomeado de: newArray, motivo: evitar colisão após correção de tipos em outro método */
        public /* sintético */ int[] newArray2(int i) {
            return Node.OfInt.CC.m858$default$newArray((Node.OfInt) this, i);
        }

        @Override // j$.util.stream.Node.OfInt, j$.util.stream.Node.OfPrimitive, j$.util.stream.Node
        public /* sintético */ Node.OfInt truncate(long j, long j2, IntFunction intFunction) {
            return Node.OfInt.CC.$default$truncate((Node.OfInt) this, j, j2, intFunction);
        }

        @Override // j$.util.stream.Node.OfPrimitive, j$.util.stream.Node
        public /* bridge */ /* sintético */ Node.OfPrimitive truncate(long j, long j2, IntFunction intFunction) {
            Node.OfPrimitive truncate;
            truncate = truncate(j, j2, (IntFunction<Integer[]>) intFunction);
            return truncate;
        }

        @Override // j$.util.stream.Node
        public /* bridge */ /* sintético */ Node truncate(long j, long j2, IntFunction intFunction) {
            Node truncate;
            truncate = truncate(j, j2, (IntFunction<Integer[]>) intFunction);
            return truncate;
        }

        IntArrayNode(long size) {
            if (size >= Nodes.MAX_ARRAY_SIZE) {
                throw new IllegalArgumentException(Nodes.BAD_SIZE);
            }
            this.array = new int[(int) size];
            this.curSize = 0;
        }

        IntArrayNode(int[] array) {
            this.array = array;
            this.curSize = array.length;
        }

        @Override // j$.util.stream.Node
        public Spliterator.OfInt spliterator() {
            return DesugarArrays.spliterator(this.array, 0, this.curSize);
        }

        @Override // j$.util.stream.Node.OfPrimitive
        public int[] asPrimitiveArray() {
            if (this.array.length == this.curSize) {
                return this.array;
            }
            return Arrays.copyOf(this.array, this.curSize);
        }

        @Override // j$.util.stream.Node.OfPrimitive
        public void copyInto(int[] dest, int destOffset) {
            System.arraycopy(this.array, 0, dest, destOffset, this.curSize);
        }

        @Override // j$.util.stream.Node
        public long count() {
            return this.curSize;
        }

        @Override // j$.util.stream.Node.OfPrimitive
        public void forEach(IntConsumer consumer) {
            for (int i = 0; i < this.curSize; i++) {
                consumer.accept(this.array[i]);
            }
        }

        public String toString() {
            return String.format("IntArrayNode[%d][%s]", Integer.valueOf(this.array.length - this.curSize), Arrays.toString(this.array));
        }
    }

    private static class LongArrayNode implements Node.OfLong {
        final long[] array;
        int curSize;

        @Override // j$.util.stream.Node.OfPrimitive, j$.util.stream.Node
        public /* sintético */ Object[] asArray(IntFunction intFunction) {
            return Node.OfPrimitive.CC.$default$asArray(this, intFunction);
        }

        @Override // j$.util.stream.Node.OfLong
        public /* sintético */ void copyInto(Long[] lArr, int i) {
            Node.OfLong.CC.$default$copyInto((Node.OfLong) this, lArr, i);
        }

        @Override // j$.util.stream.Node
        public /* bridge */ /* sintético */ void copyInto(Object[] objArr, int i) {
            copyInto((Long[]) objArr, i);
        }

        @Override // j$.util.stream.Node.OfLong, j$.util.stream.Node
        public /* sintético */ void forEach(Consumer consumer) {
            Node.OfLong.CC.$default$forEach(this, consumer);
        }

        @Override // j$.util.stream.Node.OfPrimitive, j$.util.stream.Node
        public /* sintético */ Node.OfPrimitive getChild(int i) {
            return Node.OfPrimitive.CC.$default$getChild((Node.OfPrimitive) this, i);
        }

        @Override // j$.util.stream.Node
        public /* bridge */ /* sintético */ Node getChild(int i) {
            Node child;
            child = getChild(i);
            return child;
        }

        @Override // j$.util.stream.Node
        public /* sintético */ int getChildCount() {
            return Node.CC.$default$getChildCount(this);
        }

        @Override // j$.util.stream.Node.OfLong, j$.util.stream.Node
        public /* sintético */ StreamShape getShape() {
            StreamShape streamShape;
            streamShape = StreamShape.LONG_VALUE;
            return streamShape;
        }

        /* JADX WARN: falha na inferência de tipo para: r1v1, types: [java.lang.Object, long[]] */
        @Override // j$.util.stream.Node.OfPrimitive
        public /* bridge */ /* sintético */ long[] newArray(int i) {
            ?? newArray;
            newArray = newArray(i);
            return newArray;
        }

        @Override // j$.util.stream.Node.OfLong, j$.util.stream.Node.OfPrimitive
        /* renomeado de: newArray, motivo: evitar colisão após correção de tipos em outro método */
        public /* sintético */ long[] newArray2(int i) {
            return Node.OfLong.CC.m861$default$newArray((Node.OfLong) this, i);
        }

        @Override // j$.util.stream.Node.OfLong, j$.util.stream.Node.OfPrimitive, j$.util.stream.Node
        public /* sintético */ Node.OfLong truncate(long j, long j2, IntFunction intFunction) {
            return Node.OfLong.CC.$default$truncate((Node.OfLong) this, j, j2, intFunction);
        }

        @Override // j$.util.stream.Node.OfPrimitive, j$.util.stream.Node
        public /* bridge */ /* sintético */ Node.OfPrimitive truncate(long j, long j2, IntFunction intFunction) {
            Node.OfPrimitive truncate;
            truncate = truncate(j, j2, (IntFunction<Long[]>) intFunction);
            return truncate;
        }

        @Override // j$.util.stream.Node
        public /* bridge */ /* sintético */ Node truncate(long j, long j2, IntFunction intFunction) {
            Node truncate;
            truncate = truncate(j, j2, (IntFunction<Long[]>) intFunction);
            return truncate;
        }

        LongArrayNode(long size) {
            if (size >= Nodes.MAX_ARRAY_SIZE) {
                throw new IllegalArgumentException(Nodes.BAD_SIZE);
            }
            this.array = new long[(int) size];
            this.curSize = 0;
        }

        LongArrayNode(long[] array) {
            this.array = array;
            this.curSize = array.length;
        }

        @Override // j$.util.stream.Node
        public Spliterator.OfLong spliterator() {
            return DesugarArrays.spliterator(this.array, 0, this.curSize);
        }

        @Override // j$.util.stream.Node.OfPrimitive
        public long[] asPrimitiveArray() {
            if (this.array.length == this.curSize) {
                return this.array;
            }
            return Arrays.copyOf(this.array, this.curSize);
        }

        @Override // j$.util.stream.Node.OfPrimitive
        public void copyInto(long[] dest, int destOffset) {
            System.arraycopy(this.array, 0, dest, destOffset, this.curSize);
        }

        @Override // j$.util.stream.Node
        public long count() {
            return this.curSize;
        }

        @Override // j$.util.stream.Node.OfPrimitive
        public void forEach(LongConsumer consumer) {
            for (int i = 0; i < this.curSize; i++) {
                consumer.accept(this.array[i]);
            }
        }

        public String toString() {
            return String.format("LongArrayNode[%d][%s]", Integer.valueOf(this.array.length - this.curSize), Arrays.toString(this.array));
        }
    }

    private static class DoubleArrayNode implements Node.OfDouble {
        final double[] array;
        int curSize;

        @Override // j$.util.stream.Node.OfPrimitive, j$.util.stream.Node
        public /* sintético */ Object[] asArray(IntFunction intFunction) {
            return Node.OfPrimitive.CC.$default$asArray(this, intFunction);
        }

        @Override // j$.util.stream.Node.OfDouble
        public /* sintético */ void copyInto(Double[] dArr, int i) {
            Node.OfDouble.CC.$default$copyInto((Node.OfDouble) this, dArr, i);
        }

        @Override // j$.util.stream.Node
        public /* bridge */ /* sintético */ void copyInto(Object[] objArr, int i) {
            copyInto((Double[]) objArr, i);
        }

        @Override // j$.util.stream.Node.OfDouble, j$.util.stream.Node
        public /* sintético */ void forEach(Consumer consumer) {
            Node.OfDouble.CC.$default$forEach(this, consumer);
        }

        @Override // j$.util.stream.Node.OfPrimitive, j$.util.stream.Node
        public /* sintético */ Node.OfPrimitive getChild(int i) {
            return Node.OfPrimitive.CC.$default$getChild((Node.OfPrimitive) this, i);
        }

        @Override // j$.util.stream.Node
        public /* bridge */ /* sintético */ Node getChild(int i) {
            Node child;
            child = getChild(i);
            return child;
        }

        @Override // j$.util.stream.Node
        public /* sintético */ int getChildCount() {
            return Node.CC.$default$getChildCount(this);
        }

        @Override // j$.util.stream.Node.OfDouble, j$.util.stream.Node
        public /* sintético */ StreamShape getShape() {
            StreamShape streamShape;
            streamShape = StreamShape.DOUBLE_VALUE;
            return streamShape;
        }

        /* JADX WARN: falha na inferência de tipo para: r1v1, types: [double[], java.lang.Object] */
        @Override // j$.util.stream.Node.OfPrimitive
        public /* bridge */ /* sintético */ double[] newArray(int i) {
            ?? newArray;
            newArray = newArray(i);
            return newArray;
        }

        @Override // j$.util.stream.Node.OfDouble, j$.util.stream.Node.OfPrimitive
        /* renomeado de: newArray, motivo: evitar colisão após correção de tipos em outro método */
        public /* sintético */ double[] newArray2(int i) {
            return Node.OfDouble.CC.m855$default$newArray((Node.OfDouble) this, i);
        }

        @Override // j$.util.stream.Node.OfDouble, j$.util.stream.Node.OfPrimitive, j$.util.stream.Node
        public /* sintético */ Node.OfDouble truncate(long j, long j2, IntFunction intFunction) {
            return Node.OfDouble.CC.$default$truncate((Node.OfDouble) this, j, j2, intFunction);
        }

        @Override // j$.util.stream.Node.OfPrimitive, j$.util.stream.Node
        public /* bridge */ /* sintético */ Node.OfPrimitive truncate(long j, long j2, IntFunction intFunction) {
            Node.OfPrimitive truncate;
            truncate = truncate(j, j2, (IntFunction<Double[]>) intFunction);
            return truncate;
        }

        @Override // j$.util.stream.Node
        public /* bridge */ /* sintético */ Node truncate(long j, long j2, IntFunction intFunction) {
            Node truncate;
            truncate = truncate(j, j2, (IntFunction<Double[]>) intFunction);
            return truncate;
        }

        DoubleArrayNode(long size) {
            if (size >= Nodes.MAX_ARRAY_SIZE) {
                throw new IllegalArgumentException(Nodes.BAD_SIZE);
            }
            this.array = new double[(int) size];
            this.curSize = 0;
        }

        DoubleArrayNode(double[] array) {
            this.array = array;
            this.curSize = array.length;
        }

        @Override // j$.util.stream.Node
        public Spliterator.OfDouble spliterator() {
            return DesugarArrays.spliterator(this.array, 0, this.curSize);
        }

        @Override // j$.util.stream.Node.OfPrimitive
        public double[] asPrimitiveArray() {
            if (this.array.length == this.curSize) {
                return this.array;
            }
            return Arrays.copyOf(this.array, this.curSize);
        }

        @Override // j$.util.stream.Node.OfPrimitive
        public void copyInto(double[] dest, int destOffset) {
            System.arraycopy(this.array, 0, dest, destOffset, this.curSize);
        }

        @Override // j$.util.stream.Node
        public long count() {
            return this.curSize;
        }

        @Override // j$.util.stream.Node.OfPrimitive
        public void forEach(DoubleConsumer consumer) {
            for (int i = 0; i < this.curSize; i++) {
                consumer.accept(this.array[i]);
            }
        }

        public String toString() {
            return String.format("DoubleArrayNode[%d][%s]", Integer.valueOf(this.array.length - this.curSize), Arrays.toString(this.array));
        }
    }

    private static final class IntFixedNodeBuilder extends IntArrayNode implements Node.Builder.OfInt {
        static final /* sintético */ boolean $assertionsDisabled = false;

        @Override // j$.util.stream.Sink, java.util.function.DoubleConsumer
        public /* sintético */ void accept(double d) {
            Sink.CC.$default$accept(this, d);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ void accept(long j) {
            Sink.CC.$default$accept((Sink) this, j);
        }

        @Override // j$.util.stream.Sink.OfInt
        public /* sintético */ void accept(Integer num) {
            Sink.OfInt.CC.$default$accept((Sink.OfInt) this, num);
        }

        @Override // java.util.function.Consumer
        public /* bridge */ /* sintético */ void accept(Object obj) {
            Sink.OfInt.CC.$default$accept(this, obj);
        }

        @Override // java.util.function.Consumer
        public /* sintético */ Consumer andThen(Consumer consumer) {
            return Consumer$CC.$default$andThen(this, consumer);
        }

        @Override // java.util.function.IntConsumer
        public /* sintético */ IntConsumer andThen(IntConsumer intConsumer) {
            return IntConsumer$CC.$default$andThen(this, intConsumer);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ boolean cancellationRequested() {
            return Sink.CC.$default$cancellationRequested(this);
        }

        IntFixedNodeBuilder(long size) {
            super(size);
        }

        @Override // j$.util.stream.Node.Builder
        /* renomeado de: build */
        public Node<Integer> build2() {
            if (this.curSize < this.array.length) {
                throw new IllegalStateException(String.format("Current size %d is less than fixed size %d", Integer.valueOf(this.curSize), Integer.valueOf(this.array.length)));
            }
            return this;
        }

        @Override // j$.util.stream.Sink
        public void begin(long size) {
            if (size != this.array.length) {
                throw new IllegalStateException(String.format("Begin size %d is not equal to fixed size %d", Long.valueOf(size), Integer.valueOf(this.array.length)));
            }
            this.curSize = 0;
        }

        @Override // j$.util.stream.Sink
        public void accept(int i) {
            if (this.curSize < this.array.length) {
                int[] iArr = this.array;
                int i2 = this.curSize;
                this.curSize = i2 + 1;
                iArr[i2] = i;
                return;
            }
            throw new IllegalStateException(String.format("Accept exceeded fixed size of %d", Integer.valueOf(this.array.length)));
        }

        @Override // j$.util.stream.Sink
        public void end() {
            if (this.curSize < this.array.length) {
                throw new IllegalStateException(String.format("End size %d is less than fixed size %d", Integer.valueOf(this.curSize), Integer.valueOf(this.array.length)));
            }
        }

        @Override // j$.util.stream.Nodes.IntArrayNode
        public String toString() {
            return String.format("IntFixedNodeBuilder[%d][%s]", Integer.valueOf(this.array.length - this.curSize), Arrays.toString(this.array));
        }
    }

    private static final class LongFixedNodeBuilder extends LongArrayNode implements Node.Builder.OfLong {
        static final /* sintético */ boolean $assertionsDisabled = false;

        @Override // j$.util.stream.Sink, java.util.function.DoubleConsumer
        public /* sintético */ void accept(double d) {
            Sink.CC.$default$accept(this, d);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ void accept(int i) {
            Sink.CC.$default$accept((Sink) this, i);
        }

        @Override // j$.util.stream.Sink.OfLong
        public /* sintético */ void accept(Long l) {
            Sink.OfLong.CC.$default$accept((Sink.OfLong) this, l);
        }

        @Override // java.util.function.Consumer
        public /* bridge */ /* sintético */ void accept(Object obj) {
            Sink.OfLong.CC.$default$accept(this, obj);
        }

        @Override // java.util.function.Consumer
        public /* sintético */ Consumer andThen(Consumer consumer) {
            return Consumer$CC.$default$andThen(this, consumer);
        }

        @Override // java.util.function.LongConsumer
        public /* sintético */ LongConsumer andThen(LongConsumer longConsumer) {
            return LongConsumer$CC.$default$andThen(this, longConsumer);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ boolean cancellationRequested() {
            return Sink.CC.$default$cancellationRequested(this);
        }

        LongFixedNodeBuilder(long size) {
            super(size);
        }

        @Override // j$.util.stream.Node.Builder
        /* renomeado de: build */
        public Node<Long> build2() {
            if (this.curSize < this.array.length) {
                throw new IllegalStateException(String.format("Current size %d is less than fixed size %d", Integer.valueOf(this.curSize), Integer.valueOf(this.array.length)));
            }
            return this;
        }

        @Override // j$.util.stream.Sink
        public void begin(long size) {
            if (size != this.array.length) {
                throw new IllegalStateException(String.format("Begin size %d is not equal to fixed size %d", Long.valueOf(size), Integer.valueOf(this.array.length)));
            }
            this.curSize = 0;
        }

        @Override // j$.util.stream.Sink
        public void accept(long i) {
            if (this.curSize < this.array.length) {
                long[] jArr = this.array;
                int i2 = this.curSize;
                this.curSize = i2 + 1;
                jArr[i2] = i;
                return;
            }
            throw new IllegalStateException(String.format("Accept exceeded fixed size of %d", Integer.valueOf(this.array.length)));
        }

        @Override // j$.util.stream.Sink
        public void end() {
            if (this.curSize < this.array.length) {
                throw new IllegalStateException(String.format("End size %d is less than fixed size %d", Integer.valueOf(this.curSize), Integer.valueOf(this.array.length)));
            }
        }

        @Override // j$.util.stream.Nodes.LongArrayNode
        public String toString() {
            return String.format("LongFixedNodeBuilder[%d][%s]", Integer.valueOf(this.array.length - this.curSize), Arrays.toString(this.array));
        }
    }

    private static final class DoubleFixedNodeBuilder extends DoubleArrayNode implements Node.Builder.OfDouble {
        static final /* sintético */ boolean $assertionsDisabled = false;

        @Override // j$.util.stream.Sink
        public /* sintético */ void accept(int i) {
            Sink.CC.$default$accept((Sink) this, i);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ void accept(long j) {
            Sink.CC.$default$accept((Sink) this, j);
        }

        @Override // j$.util.stream.Sink.OfDouble
        public /* sintético */ void accept(Double d) {
            Sink.OfDouble.CC.$default$accept((Sink.OfDouble) this, d);
        }

        @Override // java.util.function.Consumer
        public /* bridge */ /* sintético */ void accept(Object obj) {
            Sink.OfDouble.CC.$default$accept(this, obj);
        }

        @Override // java.util.function.Consumer
        public /* sintético */ Consumer andThen(Consumer consumer) {
            return Consumer$CC.$default$andThen(this, consumer);
        }

        @Override // java.util.function.DoubleConsumer
        public /* sintético */ DoubleConsumer andThen(DoubleConsumer doubleConsumer) {
            return DoubleConsumer$CC.$default$andThen(this, doubleConsumer);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ boolean cancellationRequested() {
            return Sink.CC.$default$cancellationRequested(this);
        }

        DoubleFixedNodeBuilder(long size) {
            super(size);
        }

        @Override // j$.util.stream.Node.Builder
        /* renomeado de: build, motivo: mesclado com método bridge [métodos inline] */
        public Node<Double> build2() {
            if (this.curSize < this.array.length) {
                throw new IllegalStateException(String.format("Current size %d is less than fixed size %d", Integer.valueOf(this.curSize), Integer.valueOf(this.array.length)));
            }
            return this;
        }

        @Override // j$.util.stream.Sink
        public void begin(long size) {
            if (size != this.array.length) {
                throw new IllegalStateException(String.format("Begin size %d is not equal to fixed size %d", Long.valueOf(size), Integer.valueOf(this.array.length)));
            }
            this.curSize = 0;
        }

        @Override // j$.util.stream.Sink, java.util.function.DoubleConsumer
        public void accept(double i) {
            if (this.curSize < this.array.length) {
                double[] dArr = this.array;
                int i2 = this.curSize;
                this.curSize = i2 + 1;
                dArr[i2] = i;
                return;
            }
            throw new IllegalStateException(String.format("Accept exceeded fixed size of %d", Integer.valueOf(this.array.length)));
        }

        @Override // j$.util.stream.Sink
        public void end() {
            if (this.curSize < this.array.length) {
                throw new IllegalStateException(String.format("End size %d is less than fixed size %d", Integer.valueOf(this.curSize), Integer.valueOf(this.array.length)));
            }
        }

        @Override // j$.util.stream.Nodes.DoubleArrayNode
        public String toString() {
            return String.format("DoubleFixedNodeBuilder[%d][%s]", Integer.valueOf(this.array.length - this.curSize), Arrays.toString(this.array));
        }
    }

    private static final class IntSpinedNodeBuilder extends SpinedBuffer.OfInt implements Node.OfInt, Node.Builder.OfInt {
        static final /* sintético */ boolean $assertionsDisabled = false;
        private boolean building = false;

        @Override // j$.util.stream.Sink, java.util.function.DoubleConsumer
        public /* sintético */ void accept(double d) {
            Sink.CC.$default$accept(this, d);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ void accept(long j) {
            Sink.CC.$default$accept((Sink) this, j);
        }

        @Override // j$.util.stream.Sink.OfInt
        public /* sintético */ void accept(Integer num) {
            Sink.OfInt.CC.$default$accept((Sink.OfInt) this, num);
        }

        @Override // java.util.function.Consumer
        public /* bridge */ /* sintético */ void accept(Object obj) {
            Sink.OfInt.CC.$default$accept(this, obj);
        }

        @Override // java.util.function.Consumer
        public /* sintético */ Consumer andThen(Consumer consumer) {
            return Consumer$CC.$default$andThen(this, consumer);
        }

        @Override // j$.util.stream.Node.OfPrimitive, j$.util.stream.Node
        public /* sintético */ Object[] asArray(IntFunction intFunction) {
            return Node.OfPrimitive.CC.$default$asArray(this, intFunction);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ boolean cancellationRequested() {
            return Sink.CC.$default$cancellationRequested(this);
        }

        @Override // j$.util.stream.Node.OfInt
        public /* sintético */ void copyInto(Integer[] numArr, int i) {
            Node.OfInt.CC.$default$copyInto((Node.OfInt) this, numArr, i);
        }

        @Override // j$.util.stream.Node
        public /* bridge */ /* sintético */ void copyInto(Object[] objArr, int i) {
            copyInto((Integer[]) objArr, i);
        }

        @Override // j$.util.stream.Node.OfPrimitive, j$.util.stream.Node
        public /* sintético */ Node.OfPrimitive getChild(int i) {
            return Node.OfPrimitive.CC.$default$getChild((Node.OfPrimitive) this, i);
        }

        @Override // j$.util.stream.Node
        public /* bridge */ /* sintético */ Node getChild(int i) {
            Node child;
            child = getChild(i);
            return child;
        }

        @Override // j$.util.stream.Node
        public /* sintético */ int getChildCount() {
            return Node.CC.$default$getChildCount(this);
        }

        @Override // j$.util.stream.Node.OfInt, j$.util.stream.Node
        public /* sintético */ StreamShape getShape() {
            StreamShape streamShape;
            streamShape = StreamShape.INT_VALUE;
            return streamShape;
        }

        @Override // j$.util.stream.Node.OfInt, j$.util.stream.Node.OfPrimitive, j$.util.stream.Node
        public /* sintético */ Node.OfInt truncate(long j, long j2, IntFunction intFunction) {
            return Node.OfInt.CC.$default$truncate((Node.OfInt) this, j, j2, intFunction);
        }

        @Override // j$.util.stream.Node.OfPrimitive, j$.util.stream.Node
        public /* bridge */ /* sintético */ Node.OfPrimitive truncate(long j, long j2, IntFunction intFunction) {
            Node.OfPrimitive truncate;
            truncate = truncate(j, j2, (IntFunction<Integer[]>) intFunction);
            return truncate;
        }

        @Override // j$.util.stream.Node
        public /* bridge */ /* sintético */ Node truncate(long j, long j2, IntFunction intFunction) {
            Node truncate;
            truncate = truncate(j, j2, (IntFunction<Integer[]>) intFunction);
            return truncate;
        }

        IntSpinedNodeBuilder() {
        }

        @Override // j$.util.stream.SpinedBuffer.OfInt, j$.util.stream.SpinedBuffer.OfPrimitive, java.lang.Iterable, j$.lang.Iterable, j$.util.Collection
        public Spliterator.OfInt spliterator() {
            return super.spliterator();
        }

        @Override // j$.util.stream.SpinedBuffer.OfPrimitive, j$.util.stream.Node.OfPrimitive
        public void forEach(IntConsumer consumer) {
            super.forEach((IntSpinedNodeBuilder) consumer);
        }

        @Override // j$.util.stream.Sink
        public void begin(long size) {
            this.building = true;
            clear();
            ensureCapacity(size);
        }

        @Override // j$.util.stream.SpinedBuffer.OfInt, java.util.function.IntConsumer
        public void accept(int i) {
            super.accept(i);
        }

        @Override // j$.util.stream.Sink
        public void end() {
            this.building = false;
        }

        @Override // j$.util.stream.SpinedBuffer.OfPrimitive, j$.util.stream.Node.OfPrimitive
        public void copyInto(int[] array, int offset) {
            super.copyInto((IntSpinedNodeBuilder) array, offset);
        }

        @Override // j$.util.stream.SpinedBuffer.OfPrimitive, j$.util.stream.Node.OfPrimitive
        public int[] asPrimitiveArray() {
            return (int[]) super.asPrimitiveArray();
        }

        @Override // j$.util.stream.Node.Builder
        /* renomeado de: build */
        public Node<Integer> build2() {
            return this;
        }
    }

    private static final class LongSpinedNodeBuilder extends SpinedBuffer.OfLong implements Node.OfLong, Node.Builder.OfLong {
        static final /* sintético */ boolean $assertionsDisabled = false;
        private boolean building = false;

        @Override // j$.util.stream.Sink, java.util.function.DoubleConsumer
        public /* sintético */ void accept(double d) {
            Sink.CC.$default$accept(this, d);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ void accept(int i) {
            Sink.CC.$default$accept((Sink) this, i);
        }

        @Override // j$.util.stream.Sink.OfLong
        public /* sintético */ void accept(Long l) {
            Sink.OfLong.CC.$default$accept((Sink.OfLong) this, l);
        }

        @Override // java.util.function.Consumer
        public /* bridge */ /* sintético */ void accept(Object obj) {
            Sink.OfLong.CC.$default$accept(this, obj);
        }

        @Override // java.util.function.Consumer
        public /* sintético */ Consumer andThen(Consumer consumer) {
            return Consumer$CC.$default$andThen(this, consumer);
        }

        @Override // j$.util.stream.Node.OfPrimitive, j$.util.stream.Node
        public /* sintético */ Object[] asArray(IntFunction intFunction) {
            return Node.OfPrimitive.CC.$default$asArray(this, intFunction);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ boolean cancellationRequested() {
            return Sink.CC.$default$cancellationRequested(this);
        }

        @Override // j$.util.stream.Node.OfLong
        public /* sintético */ void copyInto(Long[] lArr, int i) {
            Node.OfLong.CC.$default$copyInto((Node.OfLong) this, lArr, i);
        }

        @Override // j$.util.stream.Node
        public /* bridge */ /* sintético */ void copyInto(Object[] objArr, int i) {
            copyInto((Long[]) objArr, i);
        }

        @Override // j$.util.stream.Node.OfPrimitive, j$.util.stream.Node
        public /* sintético */ Node.OfPrimitive getChild(int i) {
            return Node.OfPrimitive.CC.$default$getChild((Node.OfPrimitive) this, i);
        }

        @Override // j$.util.stream.Node
        public /* bridge */ /* sintético */ Node getChild(int i) {
            Node child;
            child = getChild(i);
            return child;
        }

        @Override // j$.util.stream.Node
        public /* sintético */ int getChildCount() {
            return Node.CC.$default$getChildCount(this);
        }

        @Override // j$.util.stream.Node.OfLong, j$.util.stream.Node
        public /* sintético */ StreamShape getShape() {
            StreamShape streamShape;
            streamShape = StreamShape.LONG_VALUE;
            return streamShape;
        }

        @Override // j$.util.stream.Node.OfLong, j$.util.stream.Node.OfPrimitive, j$.util.stream.Node
        public /* sintético */ Node.OfLong truncate(long j, long j2, IntFunction intFunction) {
            return Node.OfLong.CC.$default$truncate((Node.OfLong) this, j, j2, intFunction);
        }

        @Override // j$.util.stream.Node.OfPrimitive, j$.util.stream.Node
        public /* bridge */ /* sintético */ Node.OfPrimitive truncate(long j, long j2, IntFunction intFunction) {
            Node.OfPrimitive truncate;
            truncate = truncate(j, j2, (IntFunction<Long[]>) intFunction);
            return truncate;
        }

        @Override // j$.util.stream.Node
        public /* bridge */ /* sintético */ Node truncate(long j, long j2, IntFunction intFunction) {
            Node truncate;
            truncate = truncate(j, j2, (IntFunction<Long[]>) intFunction);
            return truncate;
        }

        LongSpinedNodeBuilder() {
        }

        @Override // j$.util.stream.SpinedBuffer.OfLong, j$.util.stream.SpinedBuffer.OfPrimitive, java.lang.Iterable, j$.lang.Iterable, j$.util.Collection
        public Spliterator.OfLong spliterator() {
            return super.spliterator();
        }

        @Override // j$.util.stream.SpinedBuffer.OfPrimitive, j$.util.stream.Node.OfPrimitive
        public void forEach(LongConsumer consumer) {
            super.forEach((LongSpinedNodeBuilder) consumer);
        }

        @Override // j$.util.stream.Sink
        public void begin(long size) {
            this.building = true;
            clear();
            ensureCapacity(size);
        }

        @Override // j$.util.stream.SpinedBuffer.OfLong, java.util.function.LongConsumer
        public void accept(long i) {
            super.accept(i);
        }

        @Override // j$.util.stream.Sink
        public void end() {
            this.building = false;
        }

        @Override // j$.util.stream.SpinedBuffer.OfPrimitive, j$.util.stream.Node.OfPrimitive
        public void copyInto(long[] array, int offset) {
            super.copyInto((LongSpinedNodeBuilder) array, offset);
        }

        @Override // j$.util.stream.SpinedBuffer.OfPrimitive, j$.util.stream.Node.OfPrimitive
        public long[] asPrimitiveArray() {
            return (long[]) super.asPrimitiveArray();
        }

        @Override // j$.util.stream.Node.Builder
        /* renomeado de: build */
        public Node<Long> build2() {
            return this;
        }
    }

    private static final class DoubleSpinedNodeBuilder extends SpinedBuffer.OfDouble implements Node.OfDouble, Node.Builder.OfDouble {
        static final /* sintético */ boolean $assertionsDisabled = false;
        private boolean building = false;

        @Override // j$.util.stream.Sink
        public /* sintético */ void accept(int i) {
            Sink.CC.$default$accept((Sink) this, i);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ void accept(long j) {
            Sink.CC.$default$accept((Sink) this, j);
        }

        @Override // j$.util.stream.Sink.OfDouble
        public /* sintético */ void accept(Double d) {
            Sink.OfDouble.CC.$default$accept((Sink.OfDouble) this, d);
        }

        @Override // java.util.function.Consumer
        public /* bridge */ /* sintético */ void accept(Object obj) {
            Sink.OfDouble.CC.$default$accept(this, obj);
        }

        @Override // java.util.function.Consumer
        public /* sintético */ Consumer andThen(Consumer consumer) {
            return Consumer$CC.$default$andThen(this, consumer);
        }

        @Override // j$.util.stream.Node.OfPrimitive, j$.util.stream.Node
        public /* sintético */ Object[] asArray(IntFunction intFunction) {
            return Node.OfPrimitive.CC.$default$asArray(this, intFunction);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ boolean cancellationRequested() {
            return Sink.CC.$default$cancellationRequested(this);
        }

        @Override // j$.util.stream.Node.OfDouble
        public /* sintético */ void copyInto(Double[] dArr, int i) {
            Node.OfDouble.CC.$default$copyInto((Node.OfDouble) this, dArr, i);
        }

        @Override // j$.util.stream.Node
        public /* bridge */ /* sintético */ void copyInto(Object[] objArr, int i) {
            copyInto((Double[]) objArr, i);
        }

        @Override // j$.util.stream.Node.OfPrimitive, j$.util.stream.Node
        public /* sintético */ Node.OfPrimitive getChild(int i) {
            return Node.OfPrimitive.CC.$default$getChild((Node.OfPrimitive) this, i);
        }

        @Override // j$.util.stream.Node
        public /* bridge */ /* sintético */ Node getChild(int i) {
            Node child;
            child = getChild(i);
            return child;
        }

        @Override // j$.util.stream.Node
        public /* sintético */ int getChildCount() {
            return Node.CC.$default$getChildCount(this);
        }

        @Override // j$.util.stream.Node.OfDouble, j$.util.stream.Node
        public /* sintético */ StreamShape getShape() {
            StreamShape streamShape;
            streamShape = StreamShape.DOUBLE_VALUE;
            return streamShape;
        }

        @Override // j$.util.stream.Node.OfDouble, j$.util.stream.Node.OfPrimitive, j$.util.stream.Node
        public /* sintético */ Node.OfDouble truncate(long j, long j2, IntFunction intFunction) {
            return Node.OfDouble.CC.$default$truncate((Node.OfDouble) this, j, j2, intFunction);
        }

        @Override // j$.util.stream.Node.OfPrimitive, j$.util.stream.Node
        public /* bridge */ /* sintético */ Node.OfPrimitive truncate(long j, long j2, IntFunction intFunction) {
            Node.OfPrimitive truncate;
            truncate = truncate(j, j2, (IntFunction<Double[]>) intFunction);
            return truncate;
        }

        @Override // j$.util.stream.Node
        public /* bridge */ /* sintético */ Node truncate(long j, long j2, IntFunction intFunction) {
            Node truncate;
            truncate = truncate(j, j2, (IntFunction<Double[]>) intFunction);
            return truncate;
        }

        DoubleSpinedNodeBuilder() {
        }

        @Override // j$.util.stream.SpinedBuffer.OfDouble, j$.util.stream.SpinedBuffer.OfPrimitive, java.lang.Iterable, j$.lang.Iterable, j$.util.Collection
        public Spliterator.OfDouble spliterator() {
            return super.spliterator();
        }

        @Override // j$.util.stream.SpinedBuffer.OfPrimitive, j$.util.stream.Node.OfPrimitive
        public void forEach(DoubleConsumer consumer) {
            super.forEach((DoubleSpinedNodeBuilder) consumer);
        }

        @Override // j$.util.stream.Sink
        public void begin(long size) {
            this.building = true;
            clear();
            ensureCapacity(size);
        }

        @Override // j$.util.stream.SpinedBuffer.OfDouble, java.util.function.DoubleConsumer
        public void accept(double i) {
            super.accept(i);
        }

        @Override // j$.util.stream.Sink
        public void end() {
            this.building = false;
        }

        @Override // j$.util.stream.SpinedBuffer.OfPrimitive, j$.util.stream.Node.OfPrimitive
        public void copyInto(double[] array, int offset) {
            super.copyInto((DoubleSpinedNodeBuilder) array, offset);
        }

        @Override // j$.util.stream.SpinedBuffer.OfPrimitive, j$.util.stream.Node.OfPrimitive
        public double[] asPrimitiveArray() {
            return (double[]) super.asPrimitiveArray();
        }

        @Override // j$.util.stream.Node.Builder
        /* renomeado de: build */
        public Node<Double> build2() {
            return this;
        }
    }

    private static abstract class SizedCollectorTask<P_IN, P_OUT, T_SINK extends Sink<P_OUT>, K extends SizedCollectorTask<P_IN, P_OUT, T_SINK, K>> extends CountedCompleter<Void> implements Sink<P_OUT> {
        static final /* sintético */ boolean $assertionsDisabled = false;
        protected int fence;
        protected final PipelineHelper<P_OUT> helper;
        protected int index;
        protected long length;
        protected long offset;
        protected final Spliterator<P_IN> spliterator;
        protected final long targetSize;

        @Override // j$.util.stream.Sink, java.util.function.DoubleConsumer
        public /* sintético */ void accept(double d) {
            Sink.CC.$default$accept(this, d);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ void accept(int i) {
            Sink.CC.$default$accept((Sink) this, i);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ void accept(long j) {
            Sink.CC.$default$accept((Sink) this, j);
        }

        @Override // java.util.function.Consumer
        public /* sintético */ Consumer andThen(Consumer consumer) {
            return Consumer$CC.$default$andThen(this, consumer);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ boolean cancellationRequested() {
            return Sink.CC.$default$cancellationRequested(this);
        }

        @Override // j$.util.stream.Sink
        public /* sintético */ void end() {
            Sink.CC.$default$end(this);
        }

        abstract K makeChild(Spliterator<P_IN> spliterator, long j, long j2);

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SizedCollectorTask != java.util.stream.Nodes$SizedCollectorTask<P_IN, P_OUT, T_SINK extends j$.util.stream.Sink<P_OUT>, K extends j$.util.stream.Nodes$SizedCollectorTask<P_IN, P_OUT, T_SINK, K>> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.PipelineHelper != java.util.stream.PipelineHelper<P_OUT> */
        SizedCollectorTask(Spliterator<P_IN> spliterator, PipelineHelper<P_OUT> pipelineHelper, int arrayLength) {
            this.spliterator = spliterator;
            this.helper = pipelineHelper;
            this.targetSize = AbstractTask.suggestTargetSize(spliterator.estimateSize());
            this.offset = 0L;
            this.length = arrayLength;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SizedCollectorTask != java.util.stream.Nodes$SizedCollectorTask<P_IN, P_OUT, T_SINK extends j$.util.stream.Sink<P_OUT>, K extends j$.util.stream.Nodes$SizedCollectorTask<P_IN, P_OUT, T_SINK, K>> */
        SizedCollectorTask(K parent, Spliterator<P_IN> spliterator, long offset, long length, int arrayLength) {
            super(parent);
            this.spliterator = spliterator;
            this.helper = parent.helper;
            this.targetSize = parent.targetSize;
            this.offset = offset;
            this.length = length;
            if (offset < 0 || length < 0 || (offset + length) - 1 >= arrayLength) {
                throw new IllegalArgumentException(String.format("offset and length interval [%d, %d + %d) is not within array size interval [0, %d)", Long.valueOf(offset), Long.valueOf(offset), Long.valueOf(length), Integer.valueOf(arrayLength)));
            }
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SizedCollectorTask != java.util.stream.Nodes$SizedCollectorTask<P_IN, P_OUT, T_SINK extends j$.util.stream.Sink<P_OUT>, K extends j$.util.stream.Nodes$SizedCollectorTask<P_IN, P_OUT, T_SINK, K>> */
        @Override // java.util.concurrent.CountedCompleter
        public void compute() {
            Spliterator<P_IN> spliterator = this.spliterator;
            SizedCollectorTask<P_IN, P_OUT, T_SINK, K> sizedCollectorTask = this;
            while (spliterator.estimateSize() > sizedCollectorTask.targetSize) {
                Spliterator<P_IN> trySplit = spliterator.trySplit();
                if (trySplit == null) {
                    break;
                }
                sizedCollectorTask.setPendingCount(1);
                long leftSplitSize = trySplit.estimateSize();
                sizedCollectorTask.makeChild(trySplit, sizedCollectorTask.offset, leftSplitSize).fork();
                sizedCollectorTask = sizedCollectorTask.makeChild(spliterator, sizedCollectorTask.offset + leftSplitSize, sizedCollectorTask.length - leftSplitSize);
            }
            sizedCollectorTask.helper.wrapAndCopyInto(sizedCollectorTask, spliterator);
            sizedCollectorTask.propagateCompletion();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SizedCollectorTask != java.util.stream.Nodes$SizedCollectorTask<P_IN, P_OUT, T_SINK extends j$.util.stream.Sink<P_OUT>, K extends j$.util.stream.Nodes$SizedCollectorTask<P_IN, P_OUT, T_SINK, K>> */
        @Override // j$.util.stream.Sink
        public void begin(long size) {
            if (size > this.length) {
                throw new IllegalStateException("size passed to Sink.begin exceeds array length");
            }
            this.index = (int) this.offset;
            this.fence = this.index + ((int) this.length);
        }

        static final class OfRef<P_IN, P_OUT> extends SizedCollectorTask<P_IN, P_OUT, Sink<P_OUT>, OfRef<P_IN, P_OUT>> implements Sink<P_OUT> {
            private final P_OUT[] array;

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SizedCollectorTask$OfRef != java.util.stream.Nodes$SizedCollectorTask$OfRef<P_IN, P_OUT> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.PipelineHelper != java.util.stream.PipelineHelper<P_OUT> */
            OfRef(Spliterator<P_IN> spliterator, PipelineHelper<P_OUT> pipelineHelper, P_OUT[] array) {
                super(spliterator, pipelineHelper, array.length);
                this.array = array;
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SizedCollectorTask$OfRef != java.util.stream.Nodes$SizedCollectorTask$OfRef<P_IN, P_OUT> */
            OfRef(OfRef<P_IN, P_OUT> ofRef, Spliterator<P_IN> spliterator, long offset, long length) {
                super(ofRef, spliterator, offset, length, ofRef.array.length);
                this.array = ofRef.array;
            }

            /* JADX INFO: modificadores de acesso alterados de: package-private */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SizedCollectorTask$OfRef != java.util.stream.Nodes$SizedCollectorTask$OfRef<P_IN, P_OUT> */
            @Override // j$.util.stream.Nodes.SizedCollectorTask
            public OfRef<P_IN, P_OUT> makeChild(Spliterator<P_IN> spliterator, long offset, long size) {
                return new OfRef<>(this, spliterator, offset, size);
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SizedCollectorTask$OfRef != java.util.stream.Nodes$SizedCollectorTask$OfRef<P_IN, P_OUT> */
            @Override // java.util.function.Consumer
            public void accept(P_OUT value) {
                if (this.index >= this.fence) {
                    throw new IndexOutOfBoundsException(Integer.toString(this.index));
                }
                P_OUT[] p_outArr = this.array;
                int i = this.index;
                this.index = i + 1;
                p_outArr[i] = value;
            }
        }

        static final class OfInt<P_IN> extends SizedCollectorTask<P_IN, Integer, Sink.OfInt, OfInt<P_IN>> implements Sink.OfInt {
            private final int[] array;

            @Override // j$.util.stream.Sink.OfInt
            public /* sintético */ void accept(Integer num) {
                Sink.OfInt.CC.$default$accept((Sink.OfInt) this, num);
            }

            @Override // java.util.function.Consumer
            public /* bridge */ /* sintético */ void accept(Object obj) {
                Sink.OfInt.CC.$default$accept(this, obj);
            }

            @Override // java.util.function.IntConsumer
            public /* sintético */ IntConsumer andThen(IntConsumer intConsumer) {
                return IntConsumer$CC.$default$andThen(this, intConsumer);
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SizedCollectorTask$OfInt != java.util.stream.Nodes$SizedCollectorTask$OfInt<P_IN> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.PipelineHelper != java.util.stream.PipelineHelper<java.lang.Integer> */
            OfInt(Spliterator<P_IN> spliterator, PipelineHelper<Integer> pipelineHelper, int[] array) {
                super(spliterator, pipelineHelper, array.length);
                this.array = array;
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SizedCollectorTask$OfInt != java.util.stream.Nodes$SizedCollectorTask$OfInt<P_IN> */
            OfInt(OfInt<P_IN> ofInt, Spliterator<P_IN> spliterator, long offset, long length) {
                super(ofInt, spliterator, offset, length, ofInt.array.length);
                this.array = ofInt.array;
            }

            /* JADX INFO: modificadores de acesso alterados de: package-private */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SizedCollectorTask$OfInt != java.util.stream.Nodes$SizedCollectorTask$OfInt<P_IN> */
            @Override // j$.util.stream.Nodes.SizedCollectorTask
            public OfInt<P_IN> makeChild(Spliterator<P_IN> spliterator, long offset, long size) {
                return new OfInt<>(this, spliterator, offset, size);
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SizedCollectorTask$OfInt != java.util.stream.Nodes$SizedCollectorTask$OfInt<P_IN> */
            @Override // j$.util.stream.Nodes.SizedCollectorTask, j$.util.stream.Sink
            public void accept(int value) {
                if (this.index >= this.fence) {
                    throw new IndexOutOfBoundsException(Integer.toString(this.index));
                }
                int[] iArr = this.array;
                int i = this.index;
                this.index = i + 1;
                iArr[i] = value;
            }
        }

        static final class OfLong<P_IN> extends SizedCollectorTask<P_IN, Long, Sink.OfLong, OfLong<P_IN>> implements Sink.OfLong {
            private final long[] array;

            @Override // j$.util.stream.Sink.OfLong
            public /* sintético */ void accept(Long l) {
                Sink.OfLong.CC.$default$accept((Sink.OfLong) this, l);
            }

            @Override // java.util.function.Consumer
            public /* bridge */ /* sintético */ void accept(Object obj) {
                Sink.OfLong.CC.$default$accept(this, obj);
            }

            @Override // java.util.function.LongConsumer
            public /* sintético */ LongConsumer andThen(LongConsumer longConsumer) {
                return LongConsumer$CC.$default$andThen(this, longConsumer);
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SizedCollectorTask$OfLong != java.util.stream.Nodes$SizedCollectorTask$OfLong<P_IN> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.PipelineHelper != java.util.stream.PipelineHelper<java.lang.Long> */
            OfLong(Spliterator<P_IN> spliterator, PipelineHelper<Long> pipelineHelper, long[] array) {
                super(spliterator, pipelineHelper, array.length);
                this.array = array;
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SizedCollectorTask$OfLong != java.util.stream.Nodes$SizedCollectorTask$OfLong<P_IN> */
            OfLong(OfLong<P_IN> ofLong, Spliterator<P_IN> spliterator, long offset, long length) {
                super(ofLong, spliterator, offset, length, ofLong.array.length);
                this.array = ofLong.array;
            }

            /* JADX INFO: modificadores de acesso alterados de: package-private */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SizedCollectorTask$OfLong != java.util.stream.Nodes$SizedCollectorTask$OfLong<P_IN> */
            @Override // j$.util.stream.Nodes.SizedCollectorTask
            public OfLong<P_IN> makeChild(Spliterator<P_IN> spliterator, long offset, long size) {
                return new OfLong<>(this, spliterator, offset, size);
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SizedCollectorTask$OfLong != java.util.stream.Nodes$SizedCollectorTask$OfLong<P_IN> */
            @Override // j$.util.stream.Nodes.SizedCollectorTask, j$.util.stream.Sink
            public void accept(long value) {
                if (this.index >= this.fence) {
                    throw new IndexOutOfBoundsException(Integer.toString(this.index));
                }
                long[] jArr = this.array;
                int i = this.index;
                this.index = i + 1;
                jArr[i] = value;
            }
        }

        static final class OfDouble<P_IN> extends SizedCollectorTask<P_IN, Double, Sink.OfDouble, OfDouble<P_IN>> implements Sink.OfDouble {
            private final double[] array;

            @Override // j$.util.stream.Sink.OfDouble
            public /* sintético */ void accept(Double d) {
                Sink.OfDouble.CC.$default$accept((Sink.OfDouble) this, d);
            }

            @Override // java.util.function.Consumer
            public /* bridge */ /* sintético */ void accept(Object obj) {
                Sink.OfDouble.CC.$default$accept(this, obj);
            }

            @Override // java.util.function.DoubleConsumer
            public /* sintético */ DoubleConsumer andThen(DoubleConsumer doubleConsumer) {
                return DoubleConsumer$CC.$default$andThen(this, doubleConsumer);
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SizedCollectorTask$OfDouble != java.util.stream.Nodes$SizedCollectorTask$OfDouble<P_IN> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.PipelineHelper != java.util.stream.PipelineHelper<java.lang.Double> */
            OfDouble(Spliterator<P_IN> spliterator, PipelineHelper<Double> pipelineHelper, double[] array) {
                super(spliterator, pipelineHelper, array.length);
                this.array = array;
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SizedCollectorTask$OfDouble != java.util.stream.Nodes$SizedCollectorTask$OfDouble<P_IN> */
            OfDouble(OfDouble<P_IN> ofDouble, Spliterator<P_IN> spliterator, long offset, long length) {
                super(ofDouble, spliterator, offset, length, ofDouble.array.length);
                this.array = ofDouble.array;
            }

            /* JADX INFO: modificadores de acesso alterados de: package-private */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SizedCollectorTask$OfDouble != java.util.stream.Nodes$SizedCollectorTask$OfDouble<P_IN> */
            @Override // j$.util.stream.Nodes.SizedCollectorTask
            public OfDouble<P_IN> makeChild(Spliterator<P_IN> spliterator, long offset, long size) {
                return new OfDouble<>(this, spliterator, offset, size);
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$SizedCollectorTask$OfDouble != java.util.stream.Nodes$SizedCollectorTask$OfDouble<P_IN> */
            @Override // j$.util.stream.Nodes.SizedCollectorTask, j$.util.stream.Sink, java.util.function.DoubleConsumer
            public void accept(double value) {
                if (this.index >= this.fence) {
                    throw new IndexOutOfBoundsException(Integer.toString(this.index));
                }
                double[] dArr = this.array;
                int i = this.index;
                this.index = i + 1;
                dArr[i] = value;
            }
        }
    }

    private static abstract class ToArrayTask<T, T_NODE extends Node<T>, K extends ToArrayTask<T, T_NODE, K>> extends CountedCompleter<Void> {
        protected final T_NODE node;
        protected final int offset;

        abstract void copyNodeToArray();

        abstract K makeChild(int i, int i2);

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ToArrayTask != java.util.stream.Nodes$ToArrayTask<T, T_NODE extends j$.util.stream.Node<T>, K extends j$.util.stream.Nodes$ToArrayTask<T, T_NODE, K>> */
        ToArrayTask(T_NODE node, int offset) {
            this.node = node;
            this.offset = offset;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ToArrayTask != java.util.stream.Nodes$ToArrayTask<T, T_NODE extends j$.util.stream.Node<T>, K extends j$.util.stream.Nodes$ToArrayTask<T, T_NODE, K>> */
        ToArrayTask(K parent, T_NODE node, int offset) {
            super(parent);
            this.node = node;
            this.offset = offset;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ToArrayTask != java.util.stream.Nodes$ToArrayTask<T, T_NODE extends j$.util.stream.Node<T>, K extends j$.util.stream.Nodes$ToArrayTask<T, T_NODE, K>> */
        @Override // java.util.concurrent.CountedCompleter
        public void compute() {
            ToArrayTask<T, T_NODE, K> toArrayTask = this;
            while (toArrayTask.node.getChildCount() != 0) {
                toArrayTask.setPendingCount(toArrayTask.node.getChildCount() - 1);
                int size = 0;
                int i = 0;
                while (i < toArrayTask.node.getChildCount() - 1) {
                    K leftTask = toArrayTask.makeChild(i, toArrayTask.offset + size);
                    size = (int) (size + leftTask.node.count());
                    leftTask.fork();
                    i++;
                }
                toArrayTask = toArrayTask.makeChild(i, toArrayTask.offset + size);
            }
            toArrayTask.copyNodeToArray();
            toArrayTask.propagateCompletion();
        }

        private static final class OfRef<T> extends ToArrayTask<T, Node<T>, OfRef<T>> {
            private final T[] array;

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Node != java.util.stream.Node<T> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ToArrayTask$OfRef != java.util.stream.Nodes$ToArrayTask$OfRef<T> */
            private OfRef(Node<T> node, T[] array, int offset) {
                super(node, offset);
                this.array = array;
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Node != java.util.stream.Node<T> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ToArrayTask$OfRef != java.util.stream.Nodes$ToArrayTask$OfRef<T> */
            private OfRef(OfRef<T> ofRef, Node<T> node, int offset) {
                super(ofRef, node, offset);
                this.array = ofRef.array;
            }

            /* JADX INFO: modificadores de acesso alterados de: package-private */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ToArrayTask$OfRef != java.util.stream.Nodes$ToArrayTask$OfRef<T> */
            @Override // j$.util.stream.Nodes.ToArrayTask
            public OfRef<T> makeChild(int childIndex, int offset) {
                return new OfRef<>(this, this.node.getChild(childIndex), offset);
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ToArrayTask$OfRef != java.util.stream.Nodes$ToArrayTask$OfRef<T> */
            @Override // j$.util.stream.Nodes.ToArrayTask
            void copyNodeToArray() {
                this.node.copyInto(this.array, this.offset);
            }
        }

        private static class OfPrimitive<T, T_CONS, T_ARR, T_SPLITR extends Spliterator.OfPrimitive<T, T_CONS, T_SPLITR>, T_NODE extends Node.OfPrimitive<T, T_CONS, T_ARR, T_SPLITR, T_NODE>> extends ToArrayTask<T, T_NODE, OfPrimitive<T, T_CONS, T_ARR, T_SPLITR, T_NODE>> {
            private final T_ARR array;

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ToArrayTask$OfPrimitive != java.util.stream.Nodes$ToArrayTask$OfPrimitive<T, T_CONS, T_ARR, T_SPLITR extends j$.util.Spliterator$OfPrimitive<T, T_CONS, T_SPLITR>, T_NODE extends j$.util.stream.Node$OfPrimitive<T, T_CONS, T_ARR, T_SPLITR, T_NODE>> */
            private OfPrimitive(T_NODE node, T_ARR array, int offset) {
                super(node, offset);
                this.array = array;
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ToArrayTask$OfPrimitive != java.util.stream.Nodes$ToArrayTask$OfPrimitive<T, T_CONS, T_ARR, T_SPLITR extends j$.util.Spliterator$OfPrimitive<T, T_CONS, T_SPLITR>, T_NODE extends j$.util.stream.Node$OfPrimitive<T, T_CONS, T_ARR, T_SPLITR, T_NODE>> */
            private OfPrimitive(OfPrimitive<T, T_CONS, T_ARR, T_SPLITR, T_NODE> ofPrimitive, T_NODE node, int offset) {
                super(ofPrimitive, node, offset);
                this.array = ofPrimitive.array;
            }

            /* JADX INFO: modificadores de acesso alterados de: package-private */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ToArrayTask$OfPrimitive != java.util.stream.Nodes$ToArrayTask$OfPrimitive<T, T_CONS, T_ARR, T_SPLITR extends j$.util.Spliterator$OfPrimitive<T, T_CONS, T_SPLITR>, T_NODE extends j$.util.stream.Node$OfPrimitive<T, T_CONS, T_ARR, T_SPLITR, T_NODE>> */
            @Override // j$.util.stream.Nodes.ToArrayTask
            public OfPrimitive<T, T_CONS, T_ARR, T_SPLITR, T_NODE> makeChild(int childIndex, int offset) {
                return new OfPrimitive<>(this, ((Node.OfPrimitive) this.node).getChild(childIndex), offset);
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$ToArrayTask$OfPrimitive != java.util.stream.Nodes$ToArrayTask$OfPrimitive<T, T_CONS, T_ARR, T_SPLITR extends j$.util.Spliterator$OfPrimitive<T, T_CONS, T_SPLITR>, T_NODE extends j$.util.stream.Node$OfPrimitive<T, T_CONS, T_ARR, T_SPLITR, T_NODE>> */
            @Override // j$.util.stream.Nodes.ToArrayTask
            void copyNodeToArray() {
                ((Node.OfPrimitive) this.node).copyInto((Node.OfPrimitive) this.array, this.offset);
            }
        }

        private static final class OfInt extends OfPrimitive<Integer, IntConsumer, int[], Spliterator.OfInt, Node.OfInt> {
            private OfInt(Node.OfInt node, int[] array, int offset) {
                super(node, array, offset);
            }
        }

        private static final class OfLong extends OfPrimitive<Long, LongConsumer, long[], Spliterator.OfLong, Node.OfLong> {
            private OfLong(Node.OfLong node, long[] array, int offset) {
                super(node, array, offset);
            }
        }

        private static final class OfDouble extends OfPrimitive<Double, DoubleConsumer, double[], Spliterator.OfDouble, Node.OfDouble> {
            private OfDouble(Node.OfDouble node, double[] array, int offset) {
                super(node, array, offset);
            }
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    static class CollectorTask<P_IN, P_OUT, T_NODE extends Node<P_OUT>, T_BUILDER extends Node.Builder<P_OUT>> extends AbstractTask<P_IN, P_OUT, T_NODE, CollectorTask<P_IN, P_OUT, T_NODE, T_BUILDER>> {
        protected final LongFunction<T_BUILDER> builderFactory;
        protected final BinaryOperator<T_NODE> concFactory;
        protected final PipelineHelper<P_OUT> helper;

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$CollectorTask != java.util.stream.Nodes$CollectorTask<P_IN, P_OUT, T_NODE extends j$.util.stream.Node<P_OUT>, T_BUILDER extends j$.util.stream.Node$Builder<P_OUT>> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.PipelineHelper != java.util.stream.PipelineHelper<P_OUT> */
        CollectorTask(PipelineHelper<P_OUT> pipelineHelper, Spliterator<P_IN> spliterator, LongFunction<T_BUILDER> builderFactory, BinaryOperator<T_NODE> concFactory) {
            super(pipelineHelper, spliterator);
            this.helper = pipelineHelper;
            this.builderFactory = builderFactory;
            this.concFactory = concFactory;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$CollectorTask != java.util.stream.Nodes$CollectorTask<P_IN, P_OUT, T_NODE extends j$.util.stream.Node<P_OUT>, T_BUILDER extends j$.util.stream.Node$Builder<P_OUT>> */
        CollectorTask(CollectorTask<P_IN, P_OUT, T_NODE, T_BUILDER> collectorTask, Spliterator<P_IN> spliterator) {
            super(collectorTask, spliterator);
            this.helper = collectorTask.helper;
            this.builderFactory = collectorTask.builderFactory;
            this.concFactory = collectorTask.concFactory;
        }

        /* JADX INFO: modificadores de acesso alterados de: protected */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$CollectorTask != java.util.stream.Nodes$CollectorTask<P_IN, P_OUT, T_NODE extends j$.util.stream.Node<P_OUT>, T_BUILDER extends j$.util.stream.Node$Builder<P_OUT>> */
        @Override // j$.util.stream.AbstractTask
        public CollectorTask<P_IN, P_OUT, T_NODE, T_BUILDER> makeChild(Spliterator<P_IN> spliterator) {
            return new CollectorTask<>(this, spliterator);
        }

        /* JADX INFO: modificadores de acesso alterados de: protected */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$CollectorTask != java.util.stream.Nodes$CollectorTask<P_IN, P_OUT, T_NODE extends j$.util.stream.Node<P_OUT>, T_BUILDER extends j$.util.stream.Node$Builder<P_OUT>> */
        @Override // j$.util.stream.AbstractTask
        public T_NODE doLeaf() {
            return (T_NODE) ((Node.Builder) this.helper.wrapAndCopyInto(this.builderFactory.apply(this.helper.exactOutputSizeIfKnown(this.spliterator)), this.spliterator)).build2();
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$CollectorTask != java.util.stream.Nodes$CollectorTask<P_IN, P_OUT, T_NODE extends j$.util.stream.Node<P_OUT>, T_BUILDER extends j$.util.stream.Node$Builder<P_OUT>> */
        @Override // j$.util.stream.AbstractTask, java.util.concurrent.CountedCompleter
        public void onCompletion(CountedCompleter<?> countedCompleter) {
            if (!isLeaf()) {
                setLocalResult((Node) this.concFactory.apply((Node) ((CollectorTask) this.leftChild).getLocalResult(), (Node) ((CollectorTask) this.rightChild).getLocalResult()));
            }
            super.onCompletion(countedCompleter);
        }

        /* JADX INFO: modificadores de acesso alterados de: private */
        static final class OfRef<P_IN, P_OUT> extends CollectorTask<P_IN, P_OUT, Node<P_OUT>, Node.Builder<P_OUT>> {
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$CollectorTask$OfRef != java.util.stream.Nodes$CollectorTask$OfRef<P_IN, P_OUT> */
            @Override // j$.util.stream.Nodes.CollectorTask, j$.util.stream.AbstractTask
            protected /* bridge */ /* sintético */ Object doLeaf() {
                return super.doLeaf();
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$CollectorTask$OfRef != java.util.stream.Nodes$CollectorTask$OfRef<P_IN, P_OUT> */
            @Override // j$.util.stream.Nodes.CollectorTask, j$.util.stream.AbstractTask
            protected /* bridge */ /* sintético */ AbstractTask makeChild(Spliterator spliterator) {
                return super.makeChild(spliterator);
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$CollectorTask$OfRef != java.util.stream.Nodes$CollectorTask$OfRef<P_IN, P_OUT> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.PipelineHelper != java.util.stream.PipelineHelper<P_OUT> */
            OfRef(PipelineHelper<P_OUT> pipelineHelper, final IntFunction<P_OUT[]> generator, Spliterator<P_IN> spliterator) {
                super(pipelineHelper, spliterator, new LongFunction() { // da classe: j$.util.stream.Nodes$CollectorTask$OfRef$$ExternalSyntheticLambda0
                    @Override // java.util.function.LongFunction
                    public final Object apply(long j) {
                        Node.Builder builder;
                        builder = Nodes.builder(j, IntFunction.this);
                        return builder;
                    }
                }, new BinaryOperator() { // da classe: j$.util.stream.Nodes$CollectorTask$OfRef$$ExternalSyntheticLambda1
                    @Override // java.util.function.BiFunction
                    public /* sintético */ BiFunction andThen(Function function) {
                        return BiFunction$CC.$default$andThen(this, function);
                    }

                    @Override // java.util.function.BiFunction
                    public final Object apply(Object obj, Object obj2) {
                        return new Nodes.ConcNode((Node) obj, (Node) obj2);
                    }
                });
            }
        }

        private static final class OfInt<P_IN> extends CollectorTask<P_IN, Integer, Node.OfInt, Node.Builder.OfInt> {
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$CollectorTask$OfInt != java.util.stream.Nodes$CollectorTask$OfInt<P_IN> */
            @Override // j$.util.stream.Nodes.CollectorTask, j$.util.stream.AbstractTask
            protected /* bridge */ /* sintético */ Object doLeaf() {
                return super.doLeaf();
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$CollectorTask$OfInt != java.util.stream.Nodes$CollectorTask$OfInt<P_IN> */
            @Override // j$.util.stream.Nodes.CollectorTask, j$.util.stream.AbstractTask
            protected /* bridge */ /* sintético */ AbstractTask makeChild(Spliterator spliterator) {
                return super.makeChild(spliterator);
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$CollectorTask$OfInt != java.util.stream.Nodes$CollectorTask$OfInt<P_IN> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.PipelineHelper != java.util.stream.PipelineHelper<java.lang.Integer> */
            OfInt(PipelineHelper<Integer> pipelineHelper, Spliterator<P_IN> spliterator) {
                super(pipelineHelper, spliterator, new LongFunction() { // da classe: j$.util.stream.Nodes$CollectorTask$OfInt$$ExternalSyntheticLambda0
                    @Override // java.util.function.LongFunction
                    public final Object apply(long j) {
                        return Nodes.intBuilder(j);
                    }
                }, new BinaryOperator() { // da classe: j$.util.stream.Nodes$CollectorTask$OfInt$$ExternalSyntheticLambda1
                    @Override // java.util.function.BiFunction
                    public /* sintético */ BiFunction andThen(Function function) {
                        return BiFunction$CC.$default$andThen(this, function);
                    }

                    @Override // java.util.function.BiFunction
                    public final Object apply(Object obj, Object obj2) {
                        return new Nodes.ConcNode.OfInt((Node.OfInt) obj, (Node.OfInt) obj2);
                    }
                });
            }
        }

        private static final class OfLong<P_IN> extends CollectorTask<P_IN, Long, Node.OfLong, Node.Builder.OfLong> {
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$CollectorTask$OfLong != java.util.stream.Nodes$CollectorTask$OfLong<P_IN> */
            @Override // j$.util.stream.Nodes.CollectorTask, j$.util.stream.AbstractTask
            protected /* bridge */ /* sintético */ Object doLeaf() {
                return super.doLeaf();
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$CollectorTask$OfLong != java.util.stream.Nodes$CollectorTask$OfLong<P_IN> */
            @Override // j$.util.stream.Nodes.CollectorTask, j$.util.stream.AbstractTask
            protected /* bridge */ /* sintético */ AbstractTask makeChild(Spliterator spliterator) {
                return super.makeChild(spliterator);
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$CollectorTask$OfLong != java.util.stream.Nodes$CollectorTask$OfLong<P_IN> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.PipelineHelper != java.util.stream.PipelineHelper<java.lang.Long> */
            OfLong(PipelineHelper<Long> pipelineHelper, Spliterator<P_IN> spliterator) {
                super(pipelineHelper, spliterator, new LongFunction() { // da classe: j$.util.stream.Nodes$CollectorTask$OfLong$$ExternalSyntheticLambda0
                    @Override // java.util.function.LongFunction
                    public final Object apply(long j) {
                        return Nodes.longBuilder(j);
                    }
                }, new BinaryOperator() { // da classe: j$.util.stream.Nodes$CollectorTask$OfLong$$ExternalSyntheticLambda1
                    @Override // java.util.function.BiFunction
                    public /* sintético */ BiFunction andThen(Function function) {
                        return BiFunction$CC.$default$andThen(this, function);
                    }

                    @Override // java.util.function.BiFunction
                    public final Object apply(Object obj, Object obj2) {
                        return new Nodes.ConcNode.OfLong((Node.OfLong) obj, (Node.OfLong) obj2);
                    }
                });
            }
        }

        private static final class OfDouble<P_IN> extends CollectorTask<P_IN, Double, Node.OfDouble, Node.Builder.OfDouble> {
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$CollectorTask$OfDouble != java.util.stream.Nodes$CollectorTask$OfDouble<P_IN> */
            @Override // j$.util.stream.Nodes.CollectorTask, j$.util.stream.AbstractTask
            protected /* bridge */ /* sintético */ Object doLeaf() {
                return super.doLeaf();
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$CollectorTask$OfDouble != java.util.stream.Nodes$CollectorTask$OfDouble<P_IN> */
            @Override // j$.util.stream.Nodes.CollectorTask, j$.util.stream.AbstractTask
            protected /* bridge */ /* sintético */ AbstractTask makeChild(Spliterator spliterator) {
                return super.makeChild(spliterator);
            }

            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.Nodes$CollectorTask$OfDouble != java.util.stream.Nodes$CollectorTask$OfDouble<P_IN> */
            /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.PipelineHelper != java.util.stream.PipelineHelper<java.lang.Double> */
            OfDouble(PipelineHelper<Double> pipelineHelper, Spliterator<P_IN> spliterator) {
                super(pipelineHelper, spliterator, new LongFunction() { // da classe: j$.util.stream.Nodes$CollectorTask$OfDouble$$ExternalSyntheticLambda0
                    @Override // java.util.function.LongFunction
                    public final Object apply(long j) {
                        return Nodes.doubleBuilder(j);
                    }
                }, new BinaryOperator() { // da classe: j$.util.stream.Nodes$CollectorTask$OfDouble$$ExternalSyntheticLambda1
                    @Override // java.util.function.BiFunction
                    public /* sintético */ BiFunction andThen(Function function) {
                        return BiFunction$CC.$default$andThen(this, function);
                    }

                    @Override // java.util.function.BiFunction
                    public final Object apply(Object obj, Object obj2) {
                        return new Nodes.ConcNode.OfDouble((Node.OfDouble) obj, (Node.OfDouble) obj2);
                    }
                });
            }
        }
    }
}
