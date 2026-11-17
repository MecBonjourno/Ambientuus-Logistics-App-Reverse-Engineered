package java.util.function;

/* loaded from: classes15.dex */
public interface IntConsumer {
    void accept(int i);

    IntConsumer andThen(IntConsumer intConsumer);
}
