package j$.util.stream;

import j$.util.function.BiConsumer$CC;
import java.util.Set;
import java.util.function.BiConsumer;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes15.dex */
public final /* sintético */ class Collectors$$ExternalSyntheticLambda44 implements BiConsumer {
    @Override // java.util.function.BiConsumer
    public final void accept(Object obj, Object obj2) {
        ((Set) obj).add(obj2);
    }

    @Override // java.util.function.BiConsumer
    public /* sintético */ BiConsumer andThen(BiConsumer biConsumer) {
        return BiConsumer$CC.$default$andThen(this, biConsumer);
    }
}
