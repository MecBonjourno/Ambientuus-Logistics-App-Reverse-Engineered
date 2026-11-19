package com.google.android.gms.internal.mlkit_vision_barcode;

import sun.misc.Unsafe;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes16.dex */
public final /* sintético */ class zzec$$ExternalSyntheticBackportWithForwarding0 {
    public static /* sintético */ boolean m(Unsafe unsafe, Object obj, long j, Object obj2, Object obj3) {
        while (!unsafe.compareAndSwapObject(obj, j, obj2, obj3)) {
            if (unsafe.getObject(obj, j) != obj2) {
                return false;
            }
        }
        return true;
    }
}
