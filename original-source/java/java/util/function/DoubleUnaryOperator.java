package java.util.function;

/* loaded from: classes15.dex */
public interface DoubleUnaryOperator {
    DoubleUnaryOperator andThen(DoubleUnaryOperator doubleUnaryOperator);

    double applyAsDouble(double d);

    DoubleUnaryOperator compose(DoubleUnaryOperator doubleUnaryOperator);
}
