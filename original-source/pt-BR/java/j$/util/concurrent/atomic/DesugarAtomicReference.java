package j$.util.concurrent.atomic;

import j$.util.concurrent.ConcurrentHashMap$SearchEntriesTask$$ExternalSyntheticBackportWithForwarding0;
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.BinaryOperator;
import java.util.function.UnaryOperator;

/* carregado de: classes15.dex */
public class DesugarAtomicReference {
    private DesugarAtomicReference() {
    }

    public static <V> V getAndUpdate(AtomicReference<V> atomic, UnaryOperator<V> updateFunction) {
        V prev;
        do {
            prev = atomic.get();
        } while (!ConcurrentHashMap$SearchEntriesTask$$ExternalSyntheticBackportWithForwarding0.m(atomic, prev, updateFunction.apply(prev)));
        return prev;
    }

    public static <V> V updateAndGet(AtomicReference<V> atomicReference, UnaryOperator<V> unaryOperator) {
        V v;
        V v2;
        do {
            v = atomicReference.get();
            v2 = (V) unaryOperator.apply(v);
        } while (!ConcurrentHashMap$SearchEntriesTask$$ExternalSyntheticBackportWithForwarding0.m(atomicReference, v, v2));
        return v2;
    }

    public static <V> V getAndAccumulate(AtomicReference<V> atomic, V x, BinaryOperator<V> accumulatorFunction) {
        V prev;
        do {
            prev = atomic.get();
        } while (!ConcurrentHashMap$SearchEntriesTask$$ExternalSyntheticBackportWithForwarding0.m(atomic, prev, accumulatorFunction.apply(prev, x)));
        return prev;
    }

    public static <V> V accumulateAndGet(AtomicReference<V> atomicReference, V v, BinaryOperator<V> binaryOperator) {
        V v2;
        V v3;
        do {
            v2 = atomicReference.get();
            v3 = (V) binaryOperator.apply(v2, v);
        } while (!ConcurrentHashMap$SearchEntriesTask$$ExternalSyntheticBackportWithForwarding0.m(atomicReference, v2, v3));
        return v3;
    }
}
