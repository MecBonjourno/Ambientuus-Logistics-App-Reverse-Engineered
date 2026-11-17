package j$.util.stream;

import j$.util.function.IntConsumer$CC;
import java.util.function.IntConsumer;

/* compiled from: D8$$SyntheticClass */
/* loaded from: classes15.dex */
public final /* synthetic */ class IntPipeline$$ExternalSyntheticLambda10 implements IntConsumer {
    public final /* synthetic */ Sink f$0;

    @Override // java.util.function.IntConsumer
    public final void accept(int i) {
        this.f$0.accept(i);
    }

    @Override // java.util.function.IntConsumer
    public /* synthetic */ IntConsumer andThen(IntConsumer intConsumer) {
        return IntConsumer$CC.$default$andThen(this, intConsumer);
    }
}
