package java.util.function;

/* loaded from: classes15.dex */
public interface DoubleConsumer {
    void accept(double d);

    DoubleConsumer andThen(DoubleConsumer doubleConsumer);
}
