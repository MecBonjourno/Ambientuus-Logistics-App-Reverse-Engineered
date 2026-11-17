package j$.util;

import java.util.LinkedHashSet;

/* loaded from: classes15.dex */
public final /* synthetic */ class DesugarLinkedHashSet {
    private DesugarLinkedHashSet() {
    }

    public static Spliterator spliterator(LinkedHashSet linkedHashSet) {
        return Spliterators.spliterator(linkedHashSet, 17);
    }
}
