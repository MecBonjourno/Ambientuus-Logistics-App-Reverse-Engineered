package java.util.function;

/* carregado de: classes15.dex */
public interface DoublePredicate {
    DoublePredicate and(DoublePredicate doublePredicate);

    DoublePredicate negate();

    DoublePredicate or(DoublePredicate doublePredicate);

    boolean test(double d);
}
