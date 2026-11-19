package com.google.android.gms.internal.fido;

import java.util.Set;
import java.util.logging.Level;
import org.checkerframework.checker.nullness.compatqual.NullableDecl;

/* compiled from: com.google.android.gms:play-services-fido@@21.0.0 */
/* carregado de: classes16.dex */
final class zzes extends zzei {
    private final zzdn zza;
    private final Level zzb;
    private final Set zzc;
    private final zzea zzd;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    zzes(String str, @NullableDecl String str2, boolean z, zzdn zzdnVar, boolean z2, boolean z3) {
        super(str2);
        Set set;
        zzea zzeaVar;
        Level level = Level.ALL;
        set = zzeu.zza;
        zzeaVar = zzeu.zzb;
        this.zza = zzdnVar;
        this.zzb = level;
        this.zzc = set;
        this.zzd = zzeaVar;
    }
}
