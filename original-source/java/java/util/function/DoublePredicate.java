package java.util.function;

/* loaded from: classes15.dex */
public interface DoublePredicate {
    DoublePredicate and(DoublePredicate doublePredicate);

    DoublePredicate negate();

    DoublePredicate or(DoublePredicate doublePredicate);

    boolean test(double d);
}
