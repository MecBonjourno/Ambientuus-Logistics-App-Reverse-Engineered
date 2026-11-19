package androidx.core.content;

import androidx.core.util.Predicate;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes.dex */
public final /* sintético */ class IntentSanitizer$Builder$$ExternalSyntheticLambda1 implements Predicate {
    public final /* sintético */ String f$0;

    @Override // androidx.core.util.Predicate
    public /* sintético */ Predicate and(Predicate predicate) {
        return Predicate.CC.$default$and(this, predicate);
    }

    @Override // androidx.core.util.Predicate
    public /* sintético */ Predicate negate() {
        return Predicate.CC.$default$negate(this);
    }

    @Override // androidx.core.util.Predicate
    public /* sintético */ Predicate or(Predicate predicate) {
        return Predicate.CC.$default$or(this, predicate);
    }

    @Override // androidx.core.util.Predicate
    public final boolean test(Object obj) {
        return this.f$0.equals((String) obj);
    }
}
