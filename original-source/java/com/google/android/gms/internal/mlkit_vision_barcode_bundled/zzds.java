package com.google.android.gms.internal.mlkit_vision_barcode_bundled;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/* compiled from: com.google.mlkit:barcode-scanning@@17.3.0 */
/* loaded from: classes16.dex */
public final class zzds {
    public static final /* synthetic */ int zzb = 0;
    private final Map zzd;
    private static volatile boolean zzc = false;
    static final zzds zza = new zzds(true);

    zzds() {
        this.zzd = new HashMap();
    }

    public static zzds zza() {
        int i = zzfu.zza;
        return zza;
    }

    public final zzef zzb(zzfm zzfmVar, int i) {
        return (zzef) this.zzd.get(new zzdr(zzfmVar, i));
    }

    zzds(boolean z) {
        this.zzd = Collections.emptyMap();
    }
}
