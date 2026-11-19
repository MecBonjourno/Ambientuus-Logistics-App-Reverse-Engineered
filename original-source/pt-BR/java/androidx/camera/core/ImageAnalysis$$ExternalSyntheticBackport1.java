package androidx.camera.core;

import j$.util.DesugarCollections;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.List;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes.dex */
public final /* sintético */ class ImageAnalysis$$ExternalSyntheticBackport1 {
    public static /* sintético */ List m(Object[] objArr) {
        ArrayList arrayList = new ArrayList(objArr.length);
        for (Object obj : objArr) {
            arrayList.add(Objects.requireNonNull(obj));
        }
        return DesugarCollections.unmodifiableList(arrayList);
    }
}
