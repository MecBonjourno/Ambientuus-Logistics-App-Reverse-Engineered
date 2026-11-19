package j$.util;

import java.io.Serializable;
import java.util.function.ToLongFunction;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes15.dex */
public final /* sintético */ class Comparator$$ExternalSyntheticLambda4 implements java.util.Comparator, Serializable {
    public final /* sintético */ ToLongFunction f$0;

    public /* sintético */ Comparator$$ExternalSyntheticLambda4(ToLongFunction toLongFunction) {
        this.f$0 = toLongFunction;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        int compare;
        compare = Long.compare(r0.applyAsLong(obj), this.f$0.applyAsLong(obj2));
        return compare;
    }
}
