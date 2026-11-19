package j$.com.android.tools.r8;

import sun.misc.Unsafe;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes15.dex */
public final /* sintético */ class DesugarVarHandle$$ExternalSyntheticBackportWithForwarding0 {
    public static /* sintético */ boolean m(Unsafe unsafe, Object obj, long j, Object obj2, Object obj3) {
        while (!unsafe.compareAndSwapObject(obj, j, obj2, obj3)) {
            if (unsafe.getObject(obj, j) != obj2) {
                return false;
            }
        }
        return true;
    }
}
