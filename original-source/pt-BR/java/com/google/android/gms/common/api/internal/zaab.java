package com.google.android.gms.common.api.internal;

import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import java.util.Map;

/* compiled from: com.google.android.gms:play-services-base@@18.4.0 */
/* carregado de: classes16.dex */
final class zaab implements PendingResult.StatusListener {
    final /* sintético */ BasePendingResult zaa;
    final /* sintético */ zaad zab;

    zaab(zaad zaadVar, BasePendingResult basePendingResult) {
        this.zab = zaadVar;
        this.zaa = basePendingResult;
    }

    @Override // com.google.android.gms.common.api.PendingResult.StatusListener
    public final void onComplete(Status status) {
        Map map;
        map = this.zab.zaa;
        map.remove(this.zaa);
    }
}
