package com.google.android.gms.common.api.internal;

import com.google.android.gms.common.ConnectionResult;

/* compiled from: com.google.android.gms:play-services-base@@18.4.0 */
/* carregado de: classes16.dex */
final class zaam extends zabg {
    final /* sintético */ ConnectionResult zaa;
    final /* sintético */ zaao zab;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    zaam(zaao zaaoVar, zabf zabfVar, ConnectionResult connectionResult) {
        super(zabfVar);
        this.zab = zaaoVar;
        this.zaa = connectionResult;
    }

    @Override // com.google.android.gms.common.api.internal.zabg
    public final void zaa() {
        this.zab.zaa.zaD(this.zaa);
    }
}
