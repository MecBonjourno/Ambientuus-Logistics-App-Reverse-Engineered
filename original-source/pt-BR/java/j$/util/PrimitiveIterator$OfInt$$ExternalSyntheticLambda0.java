package j$.util;

import j$.util.function.IntConsumer$CC;
import java.util.function.Consumer;
import java.util.function.IntConsumer;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes15.dex */
public final /* sintético */ class PrimitiveIterator$OfInt$$ExternalSyntheticLambda0 implements IntConsumer {
    public final /* sintético */ Consumer f$0;

    public /* sintético */ PrimitiveIterator$OfInt$$ExternalSyntheticLambda0(Consumer consumer) {
        this.f$0 = consumer;
    }

    @Override // java.util.function.IntConsumer
    public final void accept(int i) {
        this.f$0.accept(Integer.valueOf(i));
    }

    @Override // java.util.function.IntConsumer
    public /* sintético */ IntConsumer andThen(IntConsumer intConsumer) {
        return IntConsumer$CC.$default$andThen(this, intConsumer);
    }
}
