package com.google.android.gms.internal.fido;

import java.util.Arrays;
import javax.annotation.CheckForNull;

/* compiled from: com.google.android.gms:play-services-fido@@21.0.0 */
/* carregado de: classes16.dex */
public final class zzbi {
    private final String zza;
    private final zzbg zzb = new zzbg();
    private zzbg zzc = this.zzb;

    /* sintético */ zzbi(String str, zzbh zzbhVar) {
        if (str == null) {
            throw null;
        }
        this.zza = str;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(32);
        sb.append(this.zza);
        sb.append('{');
        zzbg zzbgVar = this.zzb.zzc;
        String str = "";
        while (zzbgVar != null) {
            Object obj = zzbgVar.zzb;
            sb.append(str);
            String str2 = zzbgVar.zza;
            if (str2 != null) {
                sb.append(str2);
                sb.append('=');
            }
            if (obj == null || !obj.getClass().isArray()) {
                sb.append(obj);
            } else {
                sb.append((CharSequence) Arrays.deepToString(new Object[]{obj}), 1, r3.length() - 1);
            }
            zzbgVar = zzbgVar.zzc;
            str = ", ";
        }
        sb.append('}');
        return sb.toString();
    }

    public final zzbi zza(String str, int i) {
        String valueOf = String.valueOf(i);
        zzbf zzbfVar = new zzbf(null);
        this.zzc.zzc = zzbfVar;
        this.zzc = zzbfVar;
        zzbfVar.zzb = valueOf;
        zzbfVar.zza = "errorCode";
        return this;
    }

    public final zzbi zzb(String str, @CheckForNull Object obj) {
        zzbg zzbgVar = new zzbg();
        this.zzc.zzc = zzbgVar;
        this.zzc = zzbgVar;
        zzbgVar.zzb = obj;
        zzbgVar.zza = str;
        return this;
    }
}
