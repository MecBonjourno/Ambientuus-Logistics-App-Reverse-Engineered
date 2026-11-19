package j$.util;

import j$.util.function.LongConsumer$CC;
import java.util.function.Consumer;
import java.util.function.LongConsumer;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes15.dex */
public final /* sintético */ class PrimitiveIterator$OfLong$$ExternalSyntheticLambda0 implements LongConsumer {
    public final /* sintético */ Consumer f$0;

    public /* sintético */ PrimitiveIterator$OfLong$$ExternalSyntheticLambda0(Consumer consumer) {
        this.f$0 = consumer;
    }

    @Override // java.util.function.LongConsumer
    public final void accept(long j) {
        this.f$0.accept(Long.valueOf(j));
    }

    @Override // java.util.function.LongConsumer
    public /* sintético */ LongConsumer andThen(LongConsumer longConsumer) {
        return LongConsumer$CC.$default$andThen(this, longConsumer);
    }
}
