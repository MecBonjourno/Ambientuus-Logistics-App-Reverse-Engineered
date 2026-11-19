package java.util.function;

/* carregado de: classes15.dex */
public interface Function<T, R> {
    <V> Function<T, V> andThen(Function<? super R, ? extends V> function);

    R apply(T t);

    <V> Function<V, R> compose(Function<? super V, ? extends T> function);
}
