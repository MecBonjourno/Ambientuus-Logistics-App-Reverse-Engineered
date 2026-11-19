package java.util.function;

/* carregado de: classes15.dex */
public interface IntConsumer {
    void accept(int i);

    IntConsumer andThen(IntConsumer intConsumer);
}
