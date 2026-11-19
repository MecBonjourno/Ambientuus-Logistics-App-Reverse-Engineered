package j$.util.stream;

import j$.util.Spliterator;
import j$.util.stream.Node;
import java.util.function.IntFunction;

/* carregado de: classes15.dex */
abstract class PipelineHelper<P_OUT> {
    abstract <P_IN> void copyInto(Sink<P_IN> sink, Spliterator<P_IN> spliterator);

    abstract <P_IN> boolean copyIntoWithCancel(Sink<P_IN> sink, Spliterator<P_IN> spliterator);

    abstract <P_IN> Node<P_OUT> evaluate(Spliterator<P_IN> spliterator, boolean z, IntFunction<P_OUT[]> intFunction);

    abstract <P_IN> long exactOutputSizeIfKnown(Spliterator<P_IN> spliterator);

    abstract StreamShape getSourceShape();

    abstract int getStreamAndOpFlags();

    abstract Node.Builder<P_OUT> makeNodeBuilder(long j, IntFunction<P_OUT[]> intFunction);

    abstract <P_IN, S extends Sink<P_OUT>> S wrapAndCopyInto(S s, Spliterator<P_IN> spliterator);

    abstract <P_IN> Sink<P_IN> wrapSink(Sink<P_OUT> sink);

    abstract <P_IN> Spliterator<P_OUT> wrapSpliterator(Spliterator<P_IN> spliterator);

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.util.stream.PipelineHelper != java.util.stream.PipelineHelper<P_OUT> */
    PipelineHelper() {
    }
}
