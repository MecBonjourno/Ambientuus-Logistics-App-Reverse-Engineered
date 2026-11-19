package j$.util.stream;

import j$.util.function.DoubleConsumer$CC;
import java.util.function.DoubleConsumer;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes15.dex */
public final /* sintético */ class DoublePipeline$$ExternalSyntheticLambda0 implements DoubleConsumer {
    public final /* sintético */ Sink f$0;

    @Override // java.util.function.DoubleConsumer
    public final void accept(double d) {
        this.f$0.accept(d);
    }

    @Override // java.util.function.DoubleConsumer
    public /* sintético */ DoubleConsumer andThen(DoubleConsumer doubleConsumer) {
        return DoubleConsumer$CC.$default$andThen(this, doubleConsumer);
    }
}
