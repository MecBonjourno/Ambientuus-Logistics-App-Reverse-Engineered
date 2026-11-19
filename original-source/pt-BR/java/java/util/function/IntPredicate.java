package java.util.function;

/* carregado de: classes15.dex */
public interface IntPredicate {
    IntPredicate and(IntPredicate intPredicate);

    IntPredicate negate();

    IntPredicate or(IntPredicate intPredicate);

    boolean test(int i);
}
