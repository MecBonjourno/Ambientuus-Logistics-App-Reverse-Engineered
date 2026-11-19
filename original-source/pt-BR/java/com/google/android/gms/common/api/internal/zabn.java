package com.google.android.gms.common.api.internal;

/* compiled from: com.google.android.gms:play-services-base@@18.4.0 */
/* carregado de: classes16.dex */
final class zabn implements Runnable {
    final /* sintético */ int zaa;
    final /* sintético */ zabq zab;

    zabn(zabq zabqVar, int i) {
        this.zab = zabqVar;
        this.zaa = i;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zab.zaI(this.zaa);
    }
}
