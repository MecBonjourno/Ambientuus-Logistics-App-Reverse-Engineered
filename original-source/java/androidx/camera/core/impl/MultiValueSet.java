package androidx.camera.core.impl;

import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/* loaded from: classes.dex */
public abstract class MultiValueSet<C> {
    private Set<C> mSet = new HashSet();

    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public abstract MultiValueSet<C> m196clone();

    public void addAll(List<C> value) {
        this.mSet.addAll(value);
    }

    public List<C> getAllItems() {
        return DesugarCollections.unmodifiableList(new ArrayList(this.mSet));
    }
}
