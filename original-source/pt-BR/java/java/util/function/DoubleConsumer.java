package java.util.function;

/* carregado de: classes15.dex */
public interface DoubleConsumer {
    void accept(double d);

    DoubleConsumer andThen(DoubleConsumer doubleConsumer);
}
