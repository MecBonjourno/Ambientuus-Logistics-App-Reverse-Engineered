package j$.util;

import java.util.LinkedHashSet;

/* carregado de: classes15.dex */
public final /* sintético */ class DesugarLinkedHashSet {
    private DesugarLinkedHashSet() {
    }

    public static Spliterator spliterator(LinkedHashSet linkedHashSet) {
        return Spliterators.spliterator(linkedHashSet, 17);
    }
}
