package j$.util.stream;

import j$.util.Spliterator;

/* carregado de: classes15.dex */
interface TerminalOp<E_IN, R> {
    <P_IN> R evaluateParallel(PipelineHelper<E_IN> pipelineHelper, Spliterator<P_IN> spliterator);

    <P_IN> R evaluateSequential(PipelineHelper<E_IN> pipelineHelper, Spliterator<P_IN> spliterator);

    int getOpFlags();

    StreamShape inputShape();

    /* renomeado de: j$.util.stream.TerminalOp$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        public static int $default$getOpFlags(TerminalOp _this) {
            return 0;
        }

        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.Spliterator != java.util.Spliterator<P_IN> */
        /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.PipelineHelper != java.util.stream.PipelineHelper<E_IN> */
        public static Object $default$evaluateParallel(TerminalOp _this, PipelineHelper pipelineHelper, Spliterator spliterator) {
            if (Tripwire.ENABLED) {
                Tripwire.trip(_this.getClass(), "{0} triggering TerminalOp.evaluateParallel serial default");
            }
            return _this.evaluateSequential(pipelineHelper, spliterator);
        }
    }
}
