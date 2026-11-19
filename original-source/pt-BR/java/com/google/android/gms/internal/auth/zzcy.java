package com.google.android.gms.internal.auth;

import android.util.Base64;
import android.util.Log;
import java.io.IOException;

/* compiled from: com.google.android.gms:play-services-auth-base@@18.0.10 */
/* carregado de: classes16.dex */
final class zzcy extends zzdc {
    final /* sintético */ zzhy zza;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    zzcy(zzcz zzczVar, String str, Object obj, boolean z, zzhy zzhyVar) {
        super(zzczVar, "getTokenRefactor__blocked_packages", obj, true, null);
        this.zza = zzhyVar;
    }

    @Override // com.google.android.gms.internal.auth.zzdc
    final Object zza(Object obj) {
        try {
            return zzhs.zzp(Base64.decode((String) obj, 3));
        } catch (IOException | IllegalArgumentException e) {
            Log.e("PhenotypeFlag", "Invalid byte[] value for " + this.zzc + ": " + ((String) obj));
            return null;
        }
    }
}
