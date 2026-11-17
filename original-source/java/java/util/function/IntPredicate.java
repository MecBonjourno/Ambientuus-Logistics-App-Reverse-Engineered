package java.util.function;

/* loaded from: classes15.dex */
public interface IntPredicate {
    IntPredicate and(IntPredicate intPredicate);

    IntPredicate negate();

    IntPredicate or(IntPredicate intPredicate);

    boolean test(int i);
}
