package j$.util;

import java.io.Serializable;
import java.util.function.ToIntFunction;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes15.dex */
public final /* sintético */ class Comparator$$ExternalSyntheticLambda0 implements java.util.Comparator, Serializable {
    public final /* sintético */ ToIntFunction f$0;

    public /* sintético */ Comparator$$ExternalSyntheticLambda0(ToIntFunction toIntFunction) {
        this.f$0 = toIntFunction;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        int compare;
        compare = Integer.compare(r0.applyAsInt(obj), this.f$0.applyAsInt(obj2));
        return compare;
    }
}
