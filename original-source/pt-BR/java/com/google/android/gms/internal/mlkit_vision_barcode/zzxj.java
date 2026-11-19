package com.google.android.gms.internal.mlkit_vision_barcode;

import com.google.android.gms.common.internal.GmsLogger;
import java.util.concurrent.atomic.AtomicBoolean;

/* compiled from: com.google.android.gms:play-services-mlkit-barcode-scanning@@18.3.1 */
/* carregado de: classes16.dex */
final class zzxj implements zzeh {
    final /* sintético */ zzrc zza;
    final /* sintético */ float zzb;
    final /* sintético */ zzxn zzc;
    final /* sintético */ float zzd;
    final /* sintético */ zzxk zze;

    zzxj(zzxk zzxkVar, zzrc zzrcVar, float f, zzxn zzxnVar, float f2) {
        this.zza = zzrcVar;
        this.zzb = f;
        this.zzc = zzxnVar;
        this.zzd = f2;
        this.zze = zzxkVar;
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode.zzeh
    public final void zza(Throwable th) {
        GmsLogger gmsLogger;
        AtomicBoolean atomicBoolean;
        gmsLogger = zzxk.zzf;
        gmsLogger.w("AutoZoom", "Unable to set zoom to " + this.zzd, th);
        atomicBoolean = this.zze.zzg;
        atomicBoolean.set(false);
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode.zzeh
    public final /* bridge */ /* sintético */ void zzb(Object obj) {
        AtomicBoolean atomicBoolean;
        Float f = (Float) obj;
        if (f.floatValue() >= 1.0f) {
            zzxk.zzg(this.zze, f.floatValue());
            this.zze.zzq(this.zza, this.zzb, f.floatValue(), this.zzc);
        }
        atomicBoolean = this.zze.zzg;
        atomicBoolean.set(false);
    }
}
