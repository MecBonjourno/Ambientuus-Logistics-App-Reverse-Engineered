package j$.util.function;

import j$.util.Objects;
import java.util.function.BiPredicate;

/* renomeado de: j$.util.function.BiPredicate$-CC, motivo: nome de classe inválido */
/* carregado de: classes15.dex */
public final /* sintético */ class BiPredicate$CC {
    public static BiPredicate $default$and(final BiPredicate _this, final BiPredicate biPredicate) {
        Objects.requireNonNull(biPredicate);
        return new BiPredicate() { // da classe: j$.util.function.BiPredicate$$ExternalSyntheticLambda2
            @Override // java.util.function.BiPredicate
            public /* sintético */ BiPredicate and(BiPredicate biPredicate2) {
                return BiPredicate$CC.$default$and(this, biPredicate2);
            }

            @Override // java.util.function.BiPredicate
            public /* sintético */ BiPredicate negate() {
                return BiPredicate$CC.$default$negate(this);
            }

            @Override // java.util.function.BiPredicate
            public /* sintético */ BiPredicate or(BiPredicate biPredicate2) {
                return BiPredicate$CC.$default$or(this, biPredicate2);
            }

            @Override // java.util.function.BiPredicate
            public final boolean test(Object obj, Object obj2) {
                return BiPredicate$CC.$private$lambda$and$0(BiPredicate.this, biPredicate, obj, obj2);
            }
        };
    }

    public static /* sintético */ boolean $private$lambda$and$0(BiPredicate _this, BiPredicate other, Object t, Object u) {
        return _this.test(t, u) && other.test(t, u);
    }

    public static BiPredicate $default$negate(final BiPredicate _this) {
        return new BiPredicate() { // da classe: j$.util.function.BiPredicate$$ExternalSyntheticLambda0
            @Override // java.util.function.BiPredicate
            public /* sintético */ BiPredicate and(BiPredicate biPredicate) {
                return BiPredicate$CC.$default$and(this, biPredicate);
            }

            @Override // java.util.function.BiPredicate
            public /* sintético */ BiPredicate negate() {
                return BiPredicate$CC.$default$negate(this);
            }

            @Override // java.util.function.BiPredicate
            public /* sintético */ BiPredicate or(BiPredicate biPredicate) {
                return BiPredicate$CC.$default$or(this, biPredicate);
            }

            @Override // java.util.function.BiPredicate
            public final boolean test(Object obj, Object obj2) {
                return BiPredicate$CC.$private$lambda$negate$1(BiPredicate.this, obj, obj2);
            }
        };
    }

    public static /* sintético */ boolean $private$lambda$negate$1(BiPredicate _this, Object t, Object u) {
        return !_this.test(t, u);
    }

    public static BiPredicate $default$or(final BiPredicate _this, final BiPredicate biPredicate) {
        Objects.requireNonNull(biPredicate);
        return new BiPredicate() { // da classe: j$.util.function.BiPredicate$$ExternalSyntheticLambda1
            @Override // java.util.function.BiPredicate
            public /* sintético */ BiPredicate and(BiPredicate biPredicate2) {
                return BiPredicate$CC.$default$and(this, biPredicate2);
            }

            @Override // java.util.function.BiPredicate
            public /* sintético */ BiPredicate negate() {
                return BiPredicate$CC.$default$negate(this);
            }

            @Override // java.util.function.BiPredicate
            public /* sintético */ BiPredicate or(BiPredicate biPredicate2) {
                return BiPredicate$CC.$default$or(this, biPredicate2);
            }

            @Override // java.util.function.BiPredicate
            public final boolean test(Object obj, Object obj2) {
                return BiPredicate$CC.$private$lambda$or$2(BiPredicate.this, biPredicate, obj, obj2);
            }
        };
    }

    public static /* sintético */ boolean $private$lambda$or$2(BiPredicate _this, BiPredicate other, Object t, Object u) {
        return _this.test(t, u) || other.test(t, u);
    }
}
