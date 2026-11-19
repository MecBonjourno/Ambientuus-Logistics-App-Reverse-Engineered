package java.util.function;

/* carregado de: classes15.dex */
public interface LongPredicate {
    LongPredicate and(LongPredicate longPredicate);

    LongPredicate negate();

    LongPredicate or(LongPredicate longPredicate);

    boolean test(long j);
}
