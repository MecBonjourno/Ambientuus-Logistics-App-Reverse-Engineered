package com.google.android.gms.common.api.internal;

import android.os.Looper;
import android.os.Message;
import android.util.Log;

/* compiled from: com.google.android.gms:play-services-base@@18.4.0 */
/* carregado de: classes16.dex */
final class zabh extends com.google.android.gms.internal.base.zau {
    final /* sintético */ zabi zaa;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    zabh(zabi zabiVar, Looper looper) {
        super(looper);
        this.zaa = zabiVar;
    }

    @Override // android.os.Handler
    public final void handleMessage(Message message) {
        switch (message.what) {
            case 1:
                ((zabg) message.obj).zab(this.zaa);
                return;
            case 2:
                throw ((RuntimeException) message.obj);
            default:
                Log.w("GACStateManager", "Unknown message id: " + message.what);
                return;
        }
    }
}
