package j$.util;

import java.io.Serializable;
import java.util.Map;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes15.dex */
public final /* sintético */ class Map$Entry$$ExternalSyntheticLambda3 implements java.util.Comparator, Serializable {
    public final /* sintético */ java.util.Comparator f$0;

    public /* sintético */ Map$Entry$$ExternalSyntheticLambda3(java.util.Comparator comparator) {
        this.f$0 = comparator;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        int compare;
        compare = this.f$0.compare(((Map.Entry) obj).getKey(), ((Map.Entry) obj2).getKey());
        return compare;
    }
}
