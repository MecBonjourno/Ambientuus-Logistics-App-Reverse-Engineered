package j$.util.stream;

import j$.util.Spliterator;
import j$.util.stream.AbstractTask;
import java.util.concurrent.CountedCompleter;
import java.util.concurrent.ForkJoinPool;

/* carregado de: classes15.dex */
abstract class AbstractTask<P_IN, P_OUT, R, K extends AbstractTask<P_IN, P_OUT, R, K>> extends CountedCompleter<R> {
    private static final int LEAF_TARGET = ForkJoinPool.getCommonPoolParallelism() << 2;
    protected final PipelineHelper<P_OUT> helper;
    protected K leftChild;
    private R localResult;
    protected K rightChild;
    protected Spliterator<P_IN> spliterator;
    protected long targetSize;

    protected abstract R doLeaf();

    protected abstract K makeChild(Spliterator<P_IN> spliterator);

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.AbstractTask != java.util.stream.AbstractTask<P_IN, P_OUT, R, K extends j$.util.stream.AbstractTask<P_IN, P_OUT, R, K>> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.PipelineHelper != java.util.stream.PipelineHelper<P_OUT> */
    protected AbstractTask(PipelineHelper<P_OUT> pipelineHelper, Spliterator<P_IN> spliterator) {
        super(null);
        this.helper = pipelineHelper;
        this.spliterator = spliterator;
        this.targetSize = 0L;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.AbstractTask != java.util.stream.AbstractTask<P_IN, P_OUT, R, K extends j$.util.stream.AbstractTask<P_IN, P_OUT, R, K>> */
    protected AbstractTask(K parent, Spliterator<P_IN> spliterator) {
        super(parent);
        this.spliterator = spliterator;
        this.helper = parent.helper;
        this.targetSize = parent.targetSize;
    }

    public static int getLeafTarget() {
        return LEAF_TARGET;
    }

    public static long suggestTargetSize(long sizeEstimate) {
        long est = sizeEstimate / getLeafTarget();
        if (est > 0) {
            return est;
        }
        return 1L;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.AbstractTask != java.util.stream.AbstractTask<P_IN, P_OUT, R, K extends j$.util.stream.AbstractTask<P_IN, P_OUT, R, K>> */
    protected final long getTargetSize(long sizeEstimate) {
        long s = this.targetSize;
        if (s != 0) {
            return s;
        }
        long suggestTargetSize = suggestTargetSize(sizeEstimate);
        this.targetSize = suggestTargetSize;
        return suggestTargetSize;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.AbstractTask != java.util.stream.AbstractTask<P_IN, P_OUT, R, K extends j$.util.stream.AbstractTask<P_IN, P_OUT, R, K>> */
    @Override // java.util.concurrent.CountedCompleter, java.util.concurrent.ForkJoinTask
    public R getRawResult() {
        return this.localResult;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.AbstractTask != java.util.stream.AbstractTask<P_IN, P_OUT, R, K extends j$.util.stream.AbstractTask<P_IN, P_OUT, R, K>> */
    @Override // java.util.concurrent.CountedCompleter, java.util.concurrent.ForkJoinTask
    protected void setRawResult(R result) {
        if (result != null) {
            throw new IllegalStateException();
        }
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.AbstractTask != java.util.stream.AbstractTask<P_IN, P_OUT, R, K extends j$.util.stream.AbstractTask<P_IN, P_OUT, R, K>> */
    protected R getLocalResult() {
        return this.localResult;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.AbstractTask != java.util.stream.AbstractTask<P_IN, P_OUT, R, K extends j$.util.stream.AbstractTask<P_IN, P_OUT, R, K>> */
    protected void setLocalResult(R localResult) {
        this.localResult = localResult;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.AbstractTask != java.util.stream.AbstractTask<P_IN, P_OUT, R, K extends j$.util.stream.AbstractTask<P_IN, P_OUT, R, K>> */
    protected boolean isLeaf() {
        return this.leftChild == null;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.AbstractTask != java.util.stream.AbstractTask<P_IN, P_OUT, R, K extends j$.util.stream.AbstractTask<P_IN, P_OUT, R, K>> */
    protected boolean isRoot() {
        return getParent() == null;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.AbstractTask != java.util.stream.AbstractTask<P_IN, P_OUT, R, K extends j$.util.stream.AbstractTask<P_IN, P_OUT, R, K>> */
    protected K getParent() {
        return (K) getCompleter();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.AbstractTask != java.util.stream.AbstractTask<P_IN, P_OUT, R, K extends j$.util.stream.AbstractTask<P_IN, P_OUT, R, K>> */
    @Override // java.util.concurrent.CountedCompleter
    public void compute() {
        Spliterator<P_IN> trySplit;
        K taskToFork;
        Spliterator<P_IN> spliterator = this.spliterator;
        long sizeEstimate = spliterator.estimateSize();
        long sizeThreshold = getTargetSize(sizeEstimate);
        boolean forkRight = false;
        K task = this;
        while (sizeEstimate > sizeThreshold && (trySplit = spliterator.trySplit()) != null) {
            K leftChild = task.makeChild(trySplit);
            task.leftChild = leftChild;
            K rightChild = task.makeChild(spliterator);
            task.rightChild = rightChild;
            task.setPendingCount(1);
            if (forkRight) {
                forkRight = false;
                spliterator = trySplit;
                task = leftChild;
                taskToFork = rightChild;
            } else {
                forkRight = true;
                task = rightChild;
                taskToFork = leftChild;
            }
            taskToFork.fork();
            sizeEstimate = spliterator.estimateSize();
        }
        task.setLocalResult(task.doLeaf());
        task.tryComplete();
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.AbstractTask != java.util.stream.AbstractTask<P_IN, P_OUT, R, K extends j$.util.stream.AbstractTask<P_IN, P_OUT, R, K>> */
    @Override // java.util.concurrent.CountedCompleter
    public void onCompletion(CountedCompleter<?> caller) {
        this.spliterator = null;
        this.rightChild = null;
        this.leftChild = null;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.AbstractTask != java.util.stream.AbstractTask<P_IN, P_OUT, R, K extends j$.util.stream.AbstractTask<P_IN, P_OUT, R, K>> */
    protected boolean isLeftmostNode() {
        K node = this;
        while (node != null) {
            K parent = node.getParent();
            if (parent != null && parent.leftChild != node) {
                return false;
            }
            node = parent;
        }
        return true;
    }
}
