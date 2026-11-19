package j$.util;

import java.io.Serializable;
import java.util.Map;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes15.dex */
public final /* sintético */ class Map$Entry$$ExternalSyntheticLambda2 implements java.util.Comparator, Serializable {
    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        int compareTo;
        compareTo = ((Comparable) ((Map.Entry) obj).getKey()).compareTo(((Map.Entry) obj2).getKey());
        return compareTo;
    }
}
