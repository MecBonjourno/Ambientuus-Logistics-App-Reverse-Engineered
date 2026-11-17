package java.util.function;

/* loaded from: classes15.dex */
public interface BiPredicate<T, U> {
    BiPredicate<T, U> and(BiPredicate<? super T, ? super U> biPredicate);

    BiPredicate<T, U> negate();

    BiPredicate<T, U> or(BiPredicate<? super T, ? super U> biPredicate);

    boolean test(T t, U u);
}
