package com.google.android.gms.common.api.internal;

/* compiled from: com.google.android.gms:play-services-base@@18.4.0 */
/* carregado de: classes16.dex */
final class zaaq extends zabg {
    final /* sintético */ zaaw zaa;
    final /* sintético */ com.google.android.gms.signin.internal.zak zab;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    zaaq(zaar zaarVar, zabf zabfVar, zaaw zaawVar, com.google.android.gms.signin.internal.zak zakVar) {
        super(zabfVar);
        this.zaa = zaawVar;
        this.zab = zakVar;
    }

    @Override // com.google.android.gms.common.api.internal.zabg
    public final void zaa() {
        zaaw.zar(this.zaa, this.zab);
    }
}
