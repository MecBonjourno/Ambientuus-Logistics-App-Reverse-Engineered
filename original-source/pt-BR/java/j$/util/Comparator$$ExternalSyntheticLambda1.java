package j$.util;

import j$.util.Comparator;
import java.io.Serializable;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes15.dex */
public final /* sintético */ class Comparator$$ExternalSyntheticLambda1 implements java.util.Comparator, Serializable {
    public final /* sintético */ java.util.Comparator f$0;
    public final /* sintético */ java.util.Comparator f$1;

    public /* sintético */ Comparator$$ExternalSyntheticLambda1(java.util.Comparator comparator, java.util.Comparator comparator2) {
        this.f$0 = comparator;
        this.f$1 = comparator2;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        return Comparator.CC.$private$lambda$thenComparing$36697e65$1(this.f$0, this.f$1, obj, obj2);
    }
}
