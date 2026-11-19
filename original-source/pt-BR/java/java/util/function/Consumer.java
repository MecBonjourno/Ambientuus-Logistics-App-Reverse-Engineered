package java.util.function;

/* carregado de: classes15.dex */
public interface Consumer<T> {
    void accept(T t);

    Consumer<T> andThen(Consumer<? super T> consumer);
}
