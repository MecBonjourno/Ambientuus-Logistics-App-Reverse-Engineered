package java.util.function;

/* loaded from: classes15.dex */
public interface LongPredicate {
    LongPredicate and(LongPredicate longPredicate);

    LongPredicate negate();

    LongPredicate or(LongPredicate longPredicate);

    boolean test(long j);
}
