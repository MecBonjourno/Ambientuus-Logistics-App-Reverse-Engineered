package java.util.function;

/* carregado de: classes15.dex */
public interface BiFunction<T, U, R> {
    <V> BiFunction<T, U, V> andThen(Function<? super R, ? extends V> function);

    R apply(T t, U u);
}
