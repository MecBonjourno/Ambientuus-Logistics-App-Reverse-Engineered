package java.util.function;

/* loaded from: classes15.dex */
public interface LongConsumer {
    void accept(long j);

    LongConsumer andThen(LongConsumer longConsumer);
}
