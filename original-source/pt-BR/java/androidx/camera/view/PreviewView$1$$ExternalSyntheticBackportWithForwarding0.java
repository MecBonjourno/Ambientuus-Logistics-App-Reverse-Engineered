package androidx.camera.view;

import java.util.concurrent.atomic.AtomicReference;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes.dex */
public final /* sintético */ class PreviewView$1$$ExternalSyntheticBackportWithForwarding0 {
    public static /* sintético */ boolean m(AtomicReference atomicReference, Object obj, Object obj2) {
        while (!atomicReference.compareAndSet(obj, obj2)) {
            if (atomicReference.get() != obj) {
                return false;
            }
        }
        return true;
    }
}
