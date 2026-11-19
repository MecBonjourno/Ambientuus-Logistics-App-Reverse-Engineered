package com.google.android.gms.internal.auth;

import android.os.Binder;

/* compiled from: com.google.android.gms:play-services-auth-base@@18.0.10 */
/* carregado de: classes16.dex */
public final /* sintético */ class zzcj {
    public static Object zza(zzck zzckVar) {
        try {
            return zzckVar.zza();
        } catch (SecurityException e) {
            long clearCallingIdentity = Binder.clearCallingIdentity();
            try {
                return zzckVar.zza();
            } finally {
                Binder.restoreCallingIdentity(clearCallingIdentity);
            }
        }
    }
}
