package com.google.android.gms.internal.mlkit_vision_barcode_bundled;

import com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzeb;
import com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzeh;

/* compiled from: com.google.mlkit:barcode-scanning@@17.3.0 */
/* carregado de: classes16.dex */
public class zzeb<MessageType extends zzeh<MessageType, BuilderType>, BuilderType extends zzeb<MessageType, BuilderType>> extends zzcp<MessageType, BuilderType> {
    protected zzeh zza;
    private final zzeh zzb;

    protected zzeb(MessageType messagetype) {
        this.zzb = messagetype;
        if (messagetype.zzY()) {
            throw new IllegalArgumentException("Default instance must be immutable.");
        }
        this.zza = this.zzb.zzK();
    }

    private static void zza(Object obj, Object obj2) {
        zzfu.zza().zzb(obj.getClass()).zzg(obj, obj2);
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzfn
    public final /* bridge */ /* sintético */ zzfm zzac() {
        throw null;
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzfn
    public final boolean zzad() {
        return zzeh.zzX(this.zza, false);
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzcp
    /* renomeado de: zzf, motivo: mesclado com método bridge [métodos inline] */
    public final zzeb clone() {
        zzeb zzebVar = (zzeb) this.zzb.zzg(5, null, null);
        zzebVar.zza = zzk();
        return zzebVar;
    }

    public final zzeb zzg(zzeh zzehVar) {
        if (!this.zzb.equals(zzehVar)) {
            if (!this.zza.zzY()) {
                zzn();
            }
            zza(this.zza, zzehVar);
        }
        return this;
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzfl
    /* renomeado de: zzh, motivo: mesclado com método bridge [métodos inline] */
    public final MessageType zzj() {
        MessageType zzk = zzk();
        if (zzeh.zzX(zzk, true)) {
            return zzk;
        }
        throw new zzgr(zzk);
    }

    @Override // com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzfl
    /* renomeado de: zzi, motivo: mesclado com método bridge [métodos inline] */
    public MessageType zzk() {
        if (!this.zza.zzY()) {
            return (MessageType) this.zza;
        }
        this.zza.zzT();
        return (MessageType) this.zza;
    }

    protected final void zzm() {
        if (this.zza.zzY()) {
            return;
        }
        zzn();
    }

    protected void zzn() {
        zzeh zzK = this.zzb.zzK();
        zza(zzK, this.zza);
        this.zza = zzK;
    }
}
