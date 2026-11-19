package j$.util.function;

import j$.util.Objects;
import java.util.function.DoublePredicate;

/* renomeado de: j$.util.function.DoublePredicate$-CC, motivo: nome de classe inválido */
/* carregado de: classes15.dex */
public final /* sintético */ class DoublePredicate$CC {
    public static DoublePredicate $default$and(final DoublePredicate _this, final DoublePredicate other) {
        Objects.requireNonNull(other);
        return new DoublePredicate() { // da classe: j$.util.function.DoublePredicate$$ExternalSyntheticLambda2
            @Override // java.util.function.DoublePredicate
            public /* sintético */ DoublePredicate and(DoublePredicate doublePredicate) {
                return DoublePredicate$CC.$default$and(this, doublePredicate);
            }

            @Override // java.util.function.DoublePredicate
            public /* sintético */ DoublePredicate negate() {
                return DoublePredicate$CC.$default$negate(this);
            }

            @Override // java.util.function.DoublePredicate
            public /* sintético */ DoublePredicate or(DoublePredicate doublePredicate) {
                return DoublePredicate$CC.$default$or(this, doublePredicate);
            }

            @Override // java.util.function.DoublePredicate
            public final boolean test(double d) {
                return DoublePredicate$CC.$private$lambda$and$0(DoublePredicate.this, other, d);
            }
        };
    }

    public static /* sintético */ boolean $private$lambda$and$0(DoublePredicate _this, DoublePredicate other, double value) {
        return _this.test(value) && other.test(value);
    }

    public static DoublePredicate $default$negate(final DoublePredicate _this) {
        return new DoublePredicate() { // da classe: j$.util.function.DoublePredicate$$ExternalSyntheticLambda0
            @Override // java.util.function.DoublePredicate
            public /* sintético */ DoublePredicate and(DoublePredicate doublePredicate) {
                return DoublePredicate$CC.$default$and(this, doublePredicate);
            }

            @Override // java.util.function.DoublePredicate
            public /* sintético */ DoublePredicate negate() {
                return DoublePredicate$CC.$default$negate(this);
            }

            @Override // java.util.function.DoublePredicate
            public /* sintético */ DoublePredicate or(DoublePredicate doublePredicate) {
                return DoublePredicate$CC.$default$or(this, doublePredicate);
            }

            @Override // java.util.function.DoublePredicate
            public final boolean test(double d) {
                return DoublePredicate$CC.$private$lambda$negate$1(DoublePredicate.this, d);
            }
        };
    }

    public static /* sintético */ boolean $private$lambda$negate$1(DoublePredicate _this, double value) {
        return !_this.test(value);
    }

    public static DoublePredicate $default$or(final DoublePredicate _this, final DoublePredicate other) {
        Objects.requireNonNull(other);
        return new DoublePredicate() { // da classe: j$.util.function.DoublePredicate$$ExternalSyntheticLambda1
            @Override // java.util.function.DoublePredicate
            public /* sintético */ DoublePredicate and(DoublePredicate doublePredicate) {
                return DoublePredicate$CC.$default$and(this, doublePredicate);
            }

            @Override // java.util.function.DoublePredicate
            public /* sintético */ DoublePredicate negate() {
                return DoublePredicate$CC.$default$negate(this);
            }

            @Override // java.util.function.DoublePredicate
            public /* sintético */ DoublePredicate or(DoublePredicate doublePredicate) {
                return DoublePredicate$CC.$default$or(this, doublePredicate);
            }

            @Override // java.util.function.DoublePredicate
            public final boolean test(double d) {
                return DoublePredicate$CC.$private$lambda$or$2(DoublePredicate.this, other, d);
            }
        };
    }

    public static /* sintético */ boolean $private$lambda$or$2(DoublePredicate _this, DoublePredicate other, double value) {
        return _this.test(value) || other.test(value);
    }
}
