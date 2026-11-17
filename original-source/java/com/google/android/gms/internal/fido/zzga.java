package com.google.android.gms.internal.fido;

import java.io.Serializable;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/* compiled from: com.google.android.gms:play-services-fido@@21.0.0 */
/* loaded from: classes16.dex */
final class zzga extends zzfq implements Serializable {
    private final MessageDigest zza = zzb("SHA-256");
    private final int zzb = this.zza.getDigestLength();
    private final String zzd = "Hashing.sha256()";
    private final boolean zzc = zzc(this.zza);

    zzga(String str, String str2) {
    }

    private static MessageDigest zzb(String str) {
        try {
            return MessageDigest.getInstance(str);
        } catch (NoSuchAlgorithmException e) {
            throw new AssertionError(e);
        }
    }

    private static boolean zzc(MessageDigest messageDigest) {
        try {
            messageDigest.clone();
            return true;
        } catch (CloneNotSupportedException e) {
            return false;
        }
    }

    public final String toString() {
        return this.zzd;
    }

    @Override // com.google.android.gms.internal.fido.zzfu
    public final zzfv zza() {
        zzfy zzfyVar = null;
        if (this.zzc) {
            try {
                return new zzfz((MessageDigest) this.zza.clone(), this.zzb, zzfyVar);
            } catch (CloneNotSupportedException e) {
            }
        }
        return new zzfz(zzb(this.zza.getAlgorithm()), this.zzb, zzfyVar);
    }
}
