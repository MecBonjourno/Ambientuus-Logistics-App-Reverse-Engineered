package com.google.android.gms.common.signatureverification;

/* compiled from: com.google.android.gms:play-services-basement@@18.8.0 */
/* carregado de: classes16.dex */
public final class zzd {
    private static SignatureVerificationConfiguration zza = null;

    public static synchronized void zza(SignatureVerificationConfiguration signatureVerificationConfiguration) {
        synchronized (zzd.class) {
            if (zza != null) {
                throw new IllegalStateException("Redundantly setting SignatureVerificationConfiguration");
            }
            zza = signatureVerificationConfiguration;
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static synchronized SignatureVerificationConfiguration zzc() {
        SignatureVerificationConfiguration signatureVerificationConfiguration;
        synchronized (zzd.class) {
            if (zza == null) {
                zza(new zzb());
            }
            signatureVerificationConfiguration = zza;
        }
        return signatureVerificationConfiguration;
    }
}
