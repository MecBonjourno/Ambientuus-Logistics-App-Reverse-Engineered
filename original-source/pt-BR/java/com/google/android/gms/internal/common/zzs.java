package com.google.android.gms.internal.common;

/* compiled from: com.google.android.gms:play-services-basement@@18.8.0 */
/* carregado de: classes16.dex */
final class zzs extends zzv {
    final /* sintético */ zzp zza;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    zzs(zzw zzwVar, CharSequence charSequence, zzp zzpVar) {
        super(zzwVar, charSequence);
        this.zza = zzpVar;
    }

    @Override // com.google.android.gms.internal.common.zzv
    final int zzc(int i) {
        CharSequence charSequence = this.zzb;
        int length = charSequence.length();
        zzr.zzc(i, length, "index");
        while (i < length) {
            if (this.zza.zza(charSequence.charAt(i))) {
                return i;
            }
            i++;
        }
        return -1;
    }

    @Override // com.google.android.gms.internal.common.zzv
    final int zzd(int i) {
        return i + 1;
    }
}
