package java.util.function;

/* carregado de: classes15.dex */
public interface DoubleUnaryOperator {
    DoubleUnaryOperator andThen(DoubleUnaryOperator doubleUnaryOperator);

    double applyAsDouble(double d);

    DoubleUnaryOperator compose(DoubleUnaryOperator doubleUnaryOperator);
}
