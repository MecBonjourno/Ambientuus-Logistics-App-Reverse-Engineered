package j$.util.function;

import j$.util.Objects;
import java.util.function.DoubleUnaryOperator;

/* renomeado de: j$.util.function.DoubleUnaryOperator$-CC, motivo: nome de classe inválido */
/* carregado de: classes15.dex */
public final /* sintético */ class DoubleUnaryOperator$CC {
    public static DoubleUnaryOperator $default$compose(final DoubleUnaryOperator _this, final DoubleUnaryOperator before) {
        Objects.requireNonNull(before);
        return new DoubleUnaryOperator() { // da classe: j$.util.function.DoubleUnaryOperator$$ExternalSyntheticLambda0
            @Override // java.util.function.DoubleUnaryOperator
            public /* sintético */ DoubleUnaryOperator andThen(DoubleUnaryOperator doubleUnaryOperator) {
                return DoubleUnaryOperator$CC.$default$andThen(this, doubleUnaryOperator);
            }

            @Override // java.util.function.DoubleUnaryOperator
            public final double applyAsDouble(double d) {
                double applyAsDouble;
                applyAsDouble = DoubleUnaryOperator.this.applyAsDouble(before.applyAsDouble(d));
                return applyAsDouble;
            }

            @Override // java.util.function.DoubleUnaryOperator
            public /* sintético */ DoubleUnaryOperator compose(DoubleUnaryOperator doubleUnaryOperator) {
                return DoubleUnaryOperator$CC.$default$compose(this, doubleUnaryOperator);
            }
        };
    }

    public static DoubleUnaryOperator $default$andThen(final DoubleUnaryOperator _this, final DoubleUnaryOperator after) {
        Objects.requireNonNull(after);
        return new DoubleUnaryOperator() { // da classe: j$.util.function.DoubleUnaryOperator$$ExternalSyntheticLambda2
            @Override // java.util.function.DoubleUnaryOperator
            public /* sintético */ DoubleUnaryOperator andThen(DoubleUnaryOperator doubleUnaryOperator) {
                return DoubleUnaryOperator$CC.$default$andThen(this, doubleUnaryOperator);
            }

            @Override // java.util.function.DoubleUnaryOperator
            public final double applyAsDouble(double d) {
                double applyAsDouble;
                applyAsDouble = after.applyAsDouble(DoubleUnaryOperator.this.applyAsDouble(d));
                return applyAsDouble;
            }

            @Override // java.util.function.DoubleUnaryOperator
            public /* sintético */ DoubleUnaryOperator compose(DoubleUnaryOperator doubleUnaryOperator) {
                return DoubleUnaryOperator$CC.$default$compose(this, doubleUnaryOperator);
            }
        };
    }

    public static DoubleUnaryOperator identity() {
        return new DoubleUnaryOperator() { // da classe: j$.util.function.DoubleUnaryOperator$$ExternalSyntheticLambda1
            @Override // java.util.function.DoubleUnaryOperator
            public /* sintético */ DoubleUnaryOperator andThen(DoubleUnaryOperator doubleUnaryOperator) {
                return DoubleUnaryOperator$CC.$default$andThen(this, doubleUnaryOperator);
            }

            @Override // java.util.function.DoubleUnaryOperator
            public final double applyAsDouble(double d) {
                return DoubleUnaryOperator$CC.lambda$identity$2(d);
            }

            @Override // java.util.function.DoubleUnaryOperator
            public /* sintético */ DoubleUnaryOperator compose(DoubleUnaryOperator doubleUnaryOperator) {
                return DoubleUnaryOperator$CC.$default$compose(this, doubleUnaryOperator);
            }
        };
    }

    public static /* sintético */ double lambda$identity$2(double t) {
        return t;
    }
}
