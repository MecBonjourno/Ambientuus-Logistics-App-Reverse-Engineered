package com.google.android.gms.internal.mlkit_vision_barcode;

import java.util.Map;
import javax.annotation.CheckForNull;

/* compiled from: com.google.android.gms:play-services-mlkit-barcode-scanning@@18.3.1 */
/* loaded from: classes16.dex */
public final class zzdf {
    @CheckForNull
    static Object zza(Map map, @CheckForNull Object obj) {
        if (map == null) {
            throw null;
        }
        try {
            return map.get(obj);
        } catch (ClassCastException | NullPointerException e) {
            return null;
        }
    }

    static boolean zzb(Map map, @CheckForNull Object obj) {
        if (map == null) {
            throw null;
        }
        try {
            return map.containsKey(obj);
        } catch (ClassCastException | NullPointerException e) {
            return false;
        }
    }
}
