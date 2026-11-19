package java.util.function;

/* carregado de: classes15.dex */
public interface IntUnaryOperator {
    IntUnaryOperator andThen(IntUnaryOperator intUnaryOperator);

    int applyAsInt(int i);

    IntUnaryOperator compose(IntUnaryOperator intUnaryOperator);
}
