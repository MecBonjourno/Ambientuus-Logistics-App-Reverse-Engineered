package j$.util.stream;

import j$.util.Spliterator;
import j$.util.concurrent.ConcurrentHashMap$SearchEntriesTask$$ExternalSyntheticBackportWithForwarding0;
import j$.util.stream.AbstractShortCircuitTask;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes15.dex */
abstract class AbstractShortCircuitTask<P_IN, P_OUT, R, K extends AbstractShortCircuitTask<P_IN, P_OUT, R, K>> extends AbstractTask<P_IN, P_OUT, R, K> {
    protected volatile boolean canceled;
    protected final AtomicReference<R> sharedResult;

    protected abstract R getEmptyResult();

    /* JADX WARN: Generic types in debug info not equals: j$.util.Spliterator != java.util.Spliterator<P_IN> */
    /* JADX WARN: Generic types in debug info not equals: j$.util.stream.AbstractShortCircuitTask != java.util.stream.AbstractShortCircuitTask<P_IN, P_OUT, R, K extends j$.util.stream.AbstractShortCircuitTask<P_IN, P_OUT, R, K>> */
    /* JADX WARN: Generic types in debug info not equals: j$.util.stream.PipelineHelper != java.util.stream.PipelineHelper<P_OUT> */
    protected AbstractShortCircuitTask(PipelineHelper<P_OUT> pipelineHelper, Spliterator<P_IN> spliterator) {
        super(pipelineHelper, spliterator);
        this.sharedResult = new AtomicReference<>(null);
    }

    /* JADX WARN: Generic types in debug info not equals: j$.util.Spliterator != java.util.Spliterator<P_IN> */
    /* JADX WARN: Generic types in debug info not equals: j$.util.stream.AbstractShortCircuitTask != java.util.stream.AbstractShortCircuitTask<P_IN, P_OUT, R, K extends j$.util.stream.AbstractShortCircuitTask<P_IN, P_OUT, R, K>> */
    protected AbstractShortCircuitTask(K parent, Spliterator<P_IN> spliterator) {
        super(parent, spliterator);
        this.sharedResult = parent.sharedResult;
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x0054, code lost:
    
        r9 = r6.doLeaf();
     */
    /* JADX WARN: Generic types in debug info not equals: j$.util.Spliterator != java.util.Spliterator<P_IN> */
    /* JADX WARN: Generic types in debug info not equals: j$.util.stream.AbstractShortCircuitTask != java.util.stream.AbstractShortCircuitTask<P_IN, P_OUT, R, K extends j$.util.stream.AbstractShortCircuitTask<P_IN, P_OUT, R, K>> */
    /* JADX WARN: Multi-variable type inference failed */
    @Override // j$.util.stream.AbstractTask, java.util.concurrent.CountedCompleter
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void compute() {
        /*
            r13 = this;
            j$.util.Spliterator<P_IN> r0 = r13.spliterator
            long r1 = r0.estimateSize()
            long r3 = r13.getTargetSize(r1)
            r5 = 0
            r6 = r13
            java.util.concurrent.atomic.AtomicReference<R> r7 = r13.sharedResult
        Le:
            java.lang.Object r8 = r7.get()
            r9 = r8
            if (r8 != 0) goto L59
            boolean r8 = r6.taskCanceled()
            if (r8 == 0) goto L20
            java.lang.Object r9 = r6.getEmptyResult()
            goto L59
        L20:
            int r8 = (r1 > r3 ? 1 : (r1 == r3 ? 0 : -1))
            if (r8 <= 0) goto L54
            j$.util.Spliterator r8 = r0.trySplit()
            r10 = r8
            if (r8 != 0) goto L2c
            goto L54
        L2c:
            j$.util.stream.AbstractTask r8 = r6.makeChild(r10)
            j$.util.stream.AbstractShortCircuitTask r8 = (j$.util.stream.AbstractShortCircuitTask) r8
            r11 = r8
            r6.leftChild = r8
            j$.util.stream.AbstractTask r8 = r6.makeChild(r0)
            j$.util.stream.AbstractShortCircuitTask r8 = (j$.util.stream.AbstractShortCircuitTask) r8
            r12 = r8
            r6.rightChild = r8
            r8 = 1
            r6.setPendingCount(r8)
            if (r5 == 0) goto L49
            r5 = 0
            r0 = r10
            r6 = r11
            r8 = r12
            goto L4c
        L49:
            r5 = 1
            r6 = r12
            r8 = r11
        L4c:
            r8.fork()
            long r1 = r0.estimateSize()
            goto Le
        L54:
            java.lang.Object r9 = r6.doLeaf()
        L59:
            r6.setLocalResult(r9)
            r6.tryComplete()
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: j$.util.stream.AbstractShortCircuitTask.compute():void");
    }

    /* JADX WARN: Generic types in debug info not equals: j$.util.stream.AbstractShortCircuitTask != java.util.stream.AbstractShortCircuitTask<P_IN, P_OUT, R, K extends j$.util.stream.AbstractShortCircuitTask<P_IN, P_OUT, R, K>> */
    protected void shortCircuit(R result) {
        if (result != null) {
            ConcurrentHashMap$SearchEntriesTask$$ExternalSyntheticBackportWithForwarding0.m(this.sharedResult, null, result);
        }
    }

    /* JADX WARN: Generic types in debug info not equals: j$.util.stream.AbstractShortCircuitTask != java.util.stream.AbstractShortCircuitTask<P_IN, P_OUT, R, K extends j$.util.stream.AbstractShortCircuitTask<P_IN, P_OUT, R, K>> */
    @Override // j$.util.stream.AbstractTask
    protected void setLocalResult(R localResult) {
        if (isRoot()) {
            if (localResult != null) {
                ConcurrentHashMap$SearchEntriesTask$$ExternalSyntheticBackportWithForwarding0.m(this.sharedResult, null, localResult);
                return;
            }
            return;
        }
        super.setLocalResult(localResult);
    }

    /* JADX WARN: Generic types in debug info not equals: j$.util.stream.AbstractShortCircuitTask != java.util.stream.AbstractShortCircuitTask<P_IN, P_OUT, R, K extends j$.util.stream.AbstractShortCircuitTask<P_IN, P_OUT, R, K>> */
    @Override // j$.util.stream.AbstractTask, java.util.concurrent.CountedCompleter, java.util.concurrent.ForkJoinTask
    public R getRawResult() {
        return getLocalResult();
    }

    /* JADX WARN: Generic types in debug info not equals: j$.util.stream.AbstractShortCircuitTask != java.util.stream.AbstractShortCircuitTask<P_IN, P_OUT, R, K extends j$.util.stream.AbstractShortCircuitTask<P_IN, P_OUT, R, K>> */
    @Override // j$.util.stream.AbstractTask
    public R getLocalResult() {
        if (isRoot()) {
            R r = this.sharedResult.get();
            return r == null ? getEmptyResult() : r;
        }
        return (R) super.getLocalResult();
    }

    /* JADX WARN: Generic types in debug info not equals: j$.util.stream.AbstractShortCircuitTask != java.util.stream.AbstractShortCircuitTask<P_IN, P_OUT, R, K extends j$.util.stream.AbstractShortCircuitTask<P_IN, P_OUT, R, K>> */
    protected void cancel() {
        this.canceled = true;
    }

    /* JADX WARN: Generic types in debug info not equals: j$.util.stream.AbstractShortCircuitTask != java.util.stream.AbstractShortCircuitTask<P_IN, P_OUT, R, K extends j$.util.stream.AbstractShortCircuitTask<P_IN, P_OUT, R, K>> */
    /* JADX WARN: Multi-variable type inference failed */
    protected boolean taskCanceled() {
        boolean cancel = this.canceled;
        if (!cancel) {
            for (AbstractShortCircuitTask abstractShortCircuitTask = (AbstractShortCircuitTask) getParent(); !cancel && abstractShortCircuitTask != null; abstractShortCircuitTask = (AbstractShortCircuitTask) abstractShortCircuitTask.getParent()) {
                cancel = abstractShortCircuitTask.canceled;
            }
        }
        return cancel;
    }

    /* JADX WARN: Generic types in debug info not equals: j$.util.stream.AbstractShortCircuitTask != java.util.stream.AbstractShortCircuitTask<P_IN, P_OUT, R, K extends j$.util.stream.AbstractShortCircuitTask<P_IN, P_OUT, R, K>> */
    /* JADX WARN: Multi-variable type inference failed */
    protected void cancelLaterNodes() {
        K node = this;
        for (AbstractShortCircuitTask<P_IN, P_OUT, R, K> abstractShortCircuitTask = (AbstractShortCircuitTask) getParent(); abstractShortCircuitTask != null; abstractShortCircuitTask = (AbstractShortCircuitTask) abstractShortCircuitTask.getParent()) {
            if (abstractShortCircuitTask.leftChild == node) {
                AbstractShortCircuitTask abstractShortCircuitTask2 = (AbstractShortCircuitTask) abstractShortCircuitTask.rightChild;
                if (!abstractShortCircuitTask2.canceled) {
                    abstractShortCircuitTask2.cancel();
                }
            }
            node = abstractShortCircuitTask;
        }
    }
}
