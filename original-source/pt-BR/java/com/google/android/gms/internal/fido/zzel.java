package com.google.android.gms.internal.fido;

import android.os.Build;
import android.util.Log;
import dalvik.system.VMStack;

/* compiled from: com.google.android.gms:play-services-fido@@21.0.0 */
/* carregado de: classes16.dex */
public final class zzel extends zzeg {
    private static final boolean zza = zza.zza();
    private static final boolean zzb;
    private static final zzef zzc;

    /* compiled from: com.google.android.gms:play-services-fido@@21.0.0 */
    final class zza {
        zza() {
        }

        static boolean zza() {
            return zzel.zzt();
        }
    }

    static {
        boolean z = true;
        if (Build.FINGERPRINT != null && !"robolectric".equals(Build.FINGERPRINT)) {
            z = false;
        }
        zzb = z;
        Log.class.getName();
        zzc = new zzef() { // da classe: com.google.android.gms.internal.fido.zzel.1
            @Override // com.google.android.gms.internal.fido.zzef
            public zzdj zza(Class<?> cls, int i) {
                return zzdj.zza;
            }

            @Override // com.google.android.gms.internal.fido.zzef
            public String zzb(Class loggerClass) {
                StackTraceElement zza2;
                if (zzel.zza) {
                    try {
                        if (loggerClass.equals(zzel.zzp())) {
                            return VMStack.getStackClass2().getName();
                        }
                    } catch (Throwable th) {
                    }
                }
                if (!zzel.zzb || (zza2 = zzfj.zza(loggerClass, 1)) == null) {
                    return null;
                }
                return zza2.getClassName();
            }
        };
    }

    static Class<?> zzp() {
        return VMStack.getStackClass2();
    }

    static String zzq() {
        try {
            return VMStack.getStackClass2().getName();
        } catch (Throwable th) {
            return null;
        }
    }

    static boolean zzt() {
        try {
            Class.forName("dalvik.system.VMStack").getMethod("getStackClass2", new Class[0]);
            return zza.class.getName().equals(zzq());
        } catch (Throwable th) {
            return false;
        }
    }

    @Override // com.google.android.gms.internal.fido.zzeg
    protected zzdp zze(String className) {
        return zzeo.zzb(className);
    }

    @Override // com.google.android.gms.internal.fido.zzeg
    protected zzef zzh() {
        return zzc;
    }

    @Override // com.google.android.gms.internal.fido.zzeg
    protected zzev zzj() {
        return zzep.zzb();
    }

    @Override // com.google.android.gms.internal.fido.zzeg
    protected String zzm() {
        return "platform: Android";
    }
}
