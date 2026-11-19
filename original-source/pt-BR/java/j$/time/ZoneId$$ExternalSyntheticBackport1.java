package j$.time;

import j$.util.Objects;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes15.dex */
public final /* sintético */ class ZoneId$$ExternalSyntheticBackport1 {
    public static /* sintético */ Map m(Map.Entry[] entryArr) {
        HashMap hashMap = new HashMap(entryArr.length);
        for (Map.Entry entry : entryArr) {
            Object requireNonNull = Objects.requireNonNull(entry.getKey());
            if (hashMap.put(requireNonNull, Objects.requireNonNull(entry.getValue())) != null) {
                throw new IllegalArgumentException("duplicate key: " + requireNonNull);
            }
        }
        return Collections.unmodifiableMap(hashMap);
    }
}
