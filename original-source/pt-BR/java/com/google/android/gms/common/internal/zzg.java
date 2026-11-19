package com.google.android.gms.common.internal;

import android.os.Bundle;
import com.google.android.gms.common.ConnectionResult;

/* compiled from: com.google.android.gms:play-services-basement@@18.8.0 */
/* carregado de: classes16.dex */
public final class zzg extends zza {
    final /* sintético */ BaseGmsClient zze;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    public zzg(BaseGmsClient baseGmsClient, int i, Bundle bundle) {
        super(baseGmsClient, i, bundle);
        j$.util.Objects.requireNonNull(baseGmsClient);
        this.zze = baseGmsClient;
    }

    @Override // com.google.android.gms.common.internal.zza
    protected final boolean zza() {
        this.zze.zzc.onReportServiceBinding(ConnectionResult.RESULT_SUCCESS);
        return true;
    }

    @Override // com.google.android.gms.common.internal.zza
    protected final void zzb(ConnectionResult connectionResult) {
        BaseGmsClient baseGmsClient = this.zze;
        if (baseGmsClient.enableLocalFallback() && baseGmsClient.zzg()) {
            baseGmsClient.zzf(16);
        } else {
            baseGmsClient.zzc.onReportServiceBinding(connectionResult);
            baseGmsClient.onConnectionFailed(connectionResult);
        }
    }
}
