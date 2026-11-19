package com.google.android.gms.common.api.internal;

/* compiled from: com.google.android.gms:play-services-base@@18.4.0 */
/* carregado de: classes16.dex */
final class zacr implements Runnable {
    final /* sintético */ com.google.android.gms.signin.internal.zak zaa;
    final /* sintético */ zact zab;

    zacr(zact zactVar, com.google.android.gms.signin.internal.zak zakVar) {
        this.zab = zactVar;
        this.zaa = zakVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zact.zad(this.zab, this.zaa);
    }
}
