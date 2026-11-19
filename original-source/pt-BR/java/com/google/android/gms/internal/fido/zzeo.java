package com.google.android.gms.internal.fido;

import android.os.Build;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.apache.commons.lang.ClassUtils;

/* compiled from: com.google.android.gms:play-services-fido@@21.0.0 */
/* carregado de: classes16.dex */
final class zzeo extends zzei {
    static final boolean zza;
    static final boolean zzb;
    static final boolean zzc;
    private static final AtomicReference zzd;
    private static final AtomicLong zze;
    private static final ConcurrentLinkedQueue zzf;
    private volatile zzdp zzg;

    static {
        boolean z = false;
        zza = Build.FINGERPRINT != null ? "robolectric".equals(Build.FINGERPRINT) : true;
        zzb = !"goldfish".equals(Build.HARDWARE) ? "ranchu".equals(Build.HARDWARE) : true;
        if ("eng".equals(Build.TYPE)) {
            z = true;
        } else if ("userdebug".equals(Build.TYPE)) {
            z = true;
        }
        zzc = z;
        zzd = new AtomicReference();
        zze = new AtomicLong();
        zzf = new ConcurrentLinkedQueue();
    }

    private zzeo(String str) {
        super(str);
        if (zza || zzb) {
            this.zzg = new zzej().zza(zza());
        } else {
            this.zzg = zzc ? zzeu.zzc().zzb(false).zza(zza()) : null;
        }
    }

    public static zzdp zzb(String str) {
        if (zzd.get() != null) {
            return ((zzek) zzd.get()).zza(str);
        }
        int length = str.length() - 1;
        while (true) {
            if (length >= 0) {
                char charAt = str.charAt(length);
                if (charAt != '$') {
                    if (charAt == '.') {
                        break;
                    }
                    length--;
                } else {
                    str = str.replace('$', ClassUtils.PACKAGE_SEPARATOR_CHAR);
                    break;
                }
            } else {
                break;
            }
        }
        zzeo zzeoVar = new zzeo(str);
        zzem.zza.offer(zzeoVar);
        if (zzd.get() != null) {
            while (true) {
                zzeo zzeoVar2 = (zzeo) zzem.zza.poll();
                if (zzeoVar2 == null) {
                    break;
                }
                zzeoVar2.zzg = ((zzek) zzd.get()).zza(zzeoVar2.zza());
            }
            if (((zzen) zzf.poll()) != null) {
                zze.getAndDecrement();
                throw null;
            }
        }
        return zzeoVar;
    }
}
