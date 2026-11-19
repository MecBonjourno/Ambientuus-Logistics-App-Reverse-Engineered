package j$.util.concurrent;

import java.util.concurrent.atomic.AtomicReference;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes15.dex */
public final /* sintético */ class ConcurrentHashMap$SearchEntriesTask$$ExternalSyntheticBackportWithForwarding0 {
    public static /* sintético */ boolean m(AtomicReference atomicReference, Object obj, Object obj2) {
        while (!atomicReference.compareAndSet(obj, obj2)) {
            if (atomicReference.get() != obj) {
                return false;
            }
        }
        return true;
    }
}
