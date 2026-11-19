package j$.util;

import j$.util.function.DoubleConsumer$CC;
import java.util.function.Consumer;
import java.util.function.DoubleConsumer;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes15.dex */
public final /* sintético */ class PrimitiveIterator$OfDouble$$ExternalSyntheticLambda0 implements DoubleConsumer {
    public final /* sintético */ Consumer f$0;

    public /* sintético */ PrimitiveIterator$OfDouble$$ExternalSyntheticLambda0(Consumer consumer) {
        this.f$0 = consumer;
    }

    @Override // java.util.function.DoubleConsumer
    public final void accept(double d) {
        this.f$0.accept(Double.valueOf(d));
    }

    @Override // java.util.function.DoubleConsumer
    public /* sintético */ DoubleConsumer andThen(DoubleConsumer doubleConsumer) {
        return DoubleConsumer$CC.$default$andThen(this, doubleConsumer);
    }
}
