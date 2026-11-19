package com.google.android.gms.common.api.internal;

import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.internal.IAccountAccessor;
import java.util.ArrayList;

/* compiled from: com.google.android.gms:play-services-base@@18.4.0 */
/* carregado de: classes16.dex */
final class zaap extends zaav {
    final /* sintético */ zaaw zaa;
    private final ArrayList zac;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    public zaap(zaaw zaawVar, ArrayList arrayList) {
        super(zaawVar, null);
        this.zaa = zaawVar;
        this.zac = arrayList;
    }

    @Override // com.google.android.gms.common.api.internal.zaav
    public final void zaa() {
        zabi zabiVar;
        IAccountAccessor iAccountAccessor;
        zabi zabiVar2;
        zaaw zaawVar = this.zaa;
        zabiVar = zaawVar.zaa;
        zabiVar.zag.zad = zaaw.zao(zaawVar);
        ArrayList arrayList = this.zac;
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            Api.Client client = (Api.Client) arrayList.get(i);
            zaaw zaawVar2 = this.zaa;
            iAccountAccessor = zaawVar2.zao;
            zabiVar2 = zaawVar2.zaa;
            client.getRemoteService(iAccountAccessor, zabiVar2.zag.zad);
        }
    }
}
