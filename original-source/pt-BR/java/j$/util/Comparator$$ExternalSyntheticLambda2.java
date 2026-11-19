package j$.util;

import java.io.Serializable;
import java.util.function.ToDoubleFunction;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes15.dex */
public final /* sintético */ class Comparator$$ExternalSyntheticLambda2 implements java.util.Comparator, Serializable {
    public final /* sintético */ ToDoubleFunction f$0;

    public /* sintético */ Comparator$$ExternalSyntheticLambda2(ToDoubleFunction toDoubleFunction) {
        this.f$0 = toDoubleFunction;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        int compare;
        compare = Double.compare(r0.applyAsDouble(obj), this.f$0.applyAsDouble(obj2));
        return compare;
    }
}
