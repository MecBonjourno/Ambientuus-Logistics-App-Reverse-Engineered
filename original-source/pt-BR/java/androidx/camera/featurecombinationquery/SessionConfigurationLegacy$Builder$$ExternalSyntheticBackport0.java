package androidx.camera.featurecombinationquery;

import j$.util.DesugarCollections;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes.dex */
public final /* sintético */ class SessionConfigurationLegacy$Builder$$ExternalSyntheticBackport0 {
    public static /* sintético */ List m(Collection collection) {
        ArrayList arrayList = new ArrayList(collection.size());
        Iterator it = collection.iterator();
        while (it.hasNext()) {
            arrayList.add(Objects.requireNonNull(it.next()));
        }
        return DesugarCollections.unmodifiableList(arrayList);
    }
}
