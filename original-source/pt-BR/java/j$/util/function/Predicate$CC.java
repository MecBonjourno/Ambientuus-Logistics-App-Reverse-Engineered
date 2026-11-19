package j$.util.function;

import j$.util.Objects;
import java.util.function.Predicate;

/* renomeado de: j$.util.function.Predicate$-CC, motivo: nome de classe inválido */
/* carregado de: classes15.dex */
public final /* sintético */ class Predicate$CC {
    public static Predicate $default$and(final Predicate _this, final Predicate predicate) {
        Objects.requireNonNull(predicate);
        return new Predicate() { // da classe: j$.util.function.Predicate$$ExternalSyntheticLambda0
            @Override // java.util.function.Predicate
            public /* sintético */ Predicate and(Predicate predicate2) {
                return Predicate$CC.$default$and(this, predicate2);
            }

            @Override // java.util.function.Predicate
            public /* sintético */ Predicate negate() {
                return Predicate$CC.$default$negate(this);
            }

            @Override // java.util.function.Predicate
            public /* sintético */ Predicate or(Predicate predicate2) {
                return Predicate$CC.$default$or(this, predicate2);
            }

            @Override // java.util.function.Predicate
            public final boolean test(Object obj) {
                return Predicate$CC.$private$lambda$and$0(Predicate.this, predicate, obj);
            }
        };
    }

    public static /* sintético */ boolean $private$lambda$and$0(Predicate _this, Predicate other, Object t) {
        return _this.test(t) && other.test(t);
    }

    public static Predicate $default$negate(final Predicate _this) {
        return new Predicate() { // da classe: j$.util.function.Predicate$$ExternalSyntheticLambda1
            @Override // java.util.function.Predicate
            public /* sintético */ Predicate and(Predicate predicate) {
                return Predicate$CC.$default$and(this, predicate);
            }

            @Override // java.util.function.Predicate
            public /* sintético */ Predicate negate() {
                return Predicate$CC.$default$negate(this);
            }

            @Override // java.util.function.Predicate
            public /* sintético */ Predicate or(Predicate predicate) {
                return Predicate$CC.$default$or(this, predicate);
            }

            @Override // java.util.function.Predicate
            public final boolean test(Object obj) {
                return Predicate$CC.$private$lambda$negate$1(Predicate.this, obj);
            }
        };
    }

    public static /* sintético */ boolean $private$lambda$negate$1(Predicate _this, Object t) {
        return !_this.test(t);
    }

    public static Predicate $default$or(final Predicate _this, final Predicate predicate) {
        Objects.requireNonNull(predicate);
        return new Predicate() { // da classe: j$.util.function.Predicate$$ExternalSyntheticLambda2
            @Override // java.util.function.Predicate
            public /* sintético */ Predicate and(Predicate predicate2) {
                return Predicate$CC.$default$and(this, predicate2);
            }

            @Override // java.util.function.Predicate
            public /* sintético */ Predicate negate() {
                return Predicate$CC.$default$negate(this);
            }

            @Override // java.util.function.Predicate
            public /* sintético */ Predicate or(Predicate predicate2) {
                return Predicate$CC.$default$or(this, predicate2);
            }

            @Override // java.util.function.Predicate
            public final boolean test(Object obj) {
                return Predicate$CC.$private$lambda$or$2(Predicate.this, predicate, obj);
            }
        };
    }

    public static /* sintético */ boolean $private$lambda$or$2(Predicate _this, Predicate other, Object t) {
        return _this.test(t) || other.test(t);
    }

    public static <T> Predicate<T> isEqual(final Object targetRef) {
        if (targetRef == null) {
            return new Predicate() { // da classe: j$.util.function.Predicate$$ExternalSyntheticLambda3
                @Override // java.util.function.Predicate
                public /* sintético */ Predicate and(Predicate predicate) {
                    return Predicate$CC.$default$and(this, predicate);
                }

                @Override // java.util.function.Predicate
                public /* sintético */ Predicate negate() {
                    return Predicate$CC.$default$negate(this);
                }

                @Override // java.util.function.Predicate
                public /* sintético */ Predicate or(Predicate predicate) {
                    return Predicate$CC.$default$or(this, predicate);
                }

                @Override // java.util.function.Predicate
                public final boolean test(Object obj) {
                    return Objects.isNull(obj);
                }
            };
        }
        return new Predicate() { // da classe: j$.util.function.Predicate$$ExternalSyntheticLambda4
            @Override // java.util.function.Predicate
            public /* sintético */ Predicate and(Predicate predicate) {
                return Predicate$CC.$default$and(this, predicate);
            }

            @Override // java.util.function.Predicate
            public /* sintético */ Predicate negate() {
                return Predicate$CC.$default$negate(this);
            }

            @Override // java.util.function.Predicate
            public /* sintético */ Predicate or(Predicate predicate) {
                return Predicate$CC.$default$or(this, predicate);
            }

            @Override // java.util.function.Predicate
            public final boolean test(Object obj) {
                boolean equals;
                equals = targetRef.equals(obj);
                return equals;
            }
        };
    }

    public static <T> Predicate<T> not(Predicate<? super T> predicate) {
        Objects.requireNonNull(predicate);
        return predicate.negate();
    }
}
