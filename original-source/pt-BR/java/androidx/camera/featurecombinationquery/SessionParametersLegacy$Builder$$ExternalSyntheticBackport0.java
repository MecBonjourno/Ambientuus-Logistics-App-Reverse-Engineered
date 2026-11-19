package androidx.camera.featurecombinationquery;

import j$.util.DesugarCollections;
import j$.util.Objects;
import java.util.HashMap;
import java.util.Map;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes.dex */
public final /* sintético */ class SessionParametersLegacy$Builder$$ExternalSyntheticBackport0 {
    public static /* sintético */ Map m(Map map) {
        HashMap hashMap = new HashMap(map.size());
        for (Map.Entry entry : map.entrySet()) {
            hashMap.put(Objects.requireNonNull(entry.getKey()), Objects.requireNonNull(entry.getValue()));
        }
        return DesugarCollections.unmodifiableMap(hashMap);
    }
}
