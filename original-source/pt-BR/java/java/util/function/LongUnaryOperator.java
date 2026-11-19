package java.util.function;

/* carregado de: classes15.dex */
public interface LongUnaryOperator {
    LongUnaryOperator andThen(LongUnaryOperator longUnaryOperator);

    long applyAsLong(long j);

    LongUnaryOperator compose(LongUnaryOperator longUnaryOperator);
}
