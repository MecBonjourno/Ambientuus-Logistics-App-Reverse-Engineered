package com.google.android.gms.internal.fido;

import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import org.apache.commons.lang.CharEncoding;

/* compiled from: com.google.android.gms:play-services-fido@@21.0.0 */
/* carregado de: classes16.dex */
public final class zzhc {
    static final Charset zza = Charset.forName(CharEncoding.US_ASCII);
    static final Charset zzb = Charset.forName(CharEncoding.UTF_8);
    static final Charset zzc = Charset.forName(CharEncoding.ISO_8859_1);
    public static final byte[] zzd = new byte[0];
    public static final ByteBuffer zze = ByteBuffer.wrap(zzd);
    public static final zzhb zzf;

    static {
        int i = zzhb.zza;
        byte[] bArr = zzd;
        int length = bArr.length;
        zzgz zzgzVar = new zzgz(bArr, 0, 0, false, null);
        try {
            zzgzVar.zza(0);
            zzf = zzgzVar;
        } catch (zzhd e) {
            throw new IllegalArgumentException(e);
        }
    }
}
