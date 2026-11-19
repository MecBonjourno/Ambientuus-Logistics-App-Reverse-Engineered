package j$.util;

import java.util.Collections;
import java.util.HashSet;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes15.dex */
public final /* sintético */ class CollSer$$ExternalSyntheticBackport0 {
    public static /* sintético */ java.util.Set m(Object[] objArr) {
        HashSet hashSet = new HashSet(objArr.length);
        for (Object obj : objArr) {
            if (!hashSet.add(Objects.requireNonNull(obj))) {
                throw new IllegalArgumentException("duplicate element: " + obj);
            }
        }
        return Collections.unmodifiableSet(hashSet);
    }
}
