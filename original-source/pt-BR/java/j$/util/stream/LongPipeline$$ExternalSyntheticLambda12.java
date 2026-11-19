package j$.util.stream;

import j$.util.function.LongConsumer$CC;
import java.util.function.LongConsumer;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes15.dex */
public final /* sintético */ class LongPipeline$$ExternalSyntheticLambda12 implements LongConsumer {
    public final /* sintético */ Sink f$0;

    @Override // java.util.function.LongConsumer
    public final void accept(long j) {
        this.f$0.accept(j);
    }

    @Override // java.util.function.LongConsumer
    public /* sintético */ LongConsumer andThen(LongConsumer longConsumer) {
        return LongConsumer$CC.$default$andThen(this, longConsumer);
    }
}
