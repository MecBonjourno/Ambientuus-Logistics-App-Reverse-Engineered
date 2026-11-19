package java.util.function;

/* carregado de: classes15.dex */
public interface BiConsumer<T, U> {
    void accept(T t, U u);

    BiConsumer<T, U> andThen(BiConsumer<? super T, ? super U> biConsumer);
}
