package com.google.android.gms.auth.api.accounttransfer;

/* compiled from: com.google.android.gms:play-services-auth-base@@18.0.10 */
/* carregado de: classes16.dex */
final class zzf extends zzj {
    final /* sintético */ zzg zza;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    zzf(zzg zzgVar, zzl zzlVar) {
        super(zzlVar);
        this.zza = zzgVar;
    }

    @Override // com.google.android.gms.internal.auth.zzan, com.google.android.gms.internal.auth.zzat
    public final void zzc(DeviceMetaData deviceMetaData) {
        this.zza.zzb.setResult(deviceMetaData);
    }
}
