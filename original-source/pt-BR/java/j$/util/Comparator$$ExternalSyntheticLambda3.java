package j$.util;

import java.io.Serializable;
import java.util.function.Function;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes15.dex */
public final /* sintético */ class Comparator$$ExternalSyntheticLambda3 implements java.util.Comparator, Serializable {
    public final /* sintético */ Function f$0;

    public /* sintético */ Comparator$$ExternalSyntheticLambda3(Function function) {
        this.f$0 = function;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        int compareTo;
        compareTo = ((Comparable) r0.apply(obj)).compareTo(this.f$0.apply(obj2));
        return compareTo;
    }
}
