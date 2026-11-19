package androidx.camera.featurecombinationquery;

import j$.util.DesugarCollections;
import j$.util.Objects;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes.dex */
public final /* sintético */ class SessionParametersLegacy$$ExternalSyntheticBackport0 {
    public static /* sintético */ Set m(Collection collection) {
        HashSet hashSet = new HashSet(collection.size());
        Iterator it = collection.iterator();
        while (it.hasNext()) {
            hashSet.add(Objects.requireNonNull(it.next()));
        }
        return DesugarCollections.unmodifiableSet(hashSet);
    }
}
