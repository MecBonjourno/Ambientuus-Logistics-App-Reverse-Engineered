package com.google.android.gms.internal.fido;

import java.util.concurrent.TimeUnit;
import java.util.logging.Level;

/* compiled from: com.google.android.gms:play-services-fido@@21.0.0 */
/* loaded from: classes16.dex */
public abstract class zzeg {
    private static String zza = "com.google.android.gms.internal.fido.zzel";
    private static String zzb = "com.google.common.flogger.backend.google.GooglePlatform";
    private static String zzc = "com.google.common.flogger.backend.system.DefaultPlatform";
    private static final String[] zzd = {zza, zzb, zzc};

    public static int zza() {
        return zzfm.zza();
    }

    public static long zzb() {
        zzeg zzegVar;
        zzegVar = zzee.zza;
        return zzegVar.zzc();
    }

    public static zzdp zzd(String className) {
        zzeg zzegVar;
        zzegVar = zzee.zza;
        return zzegVar.zze(className);
    }

    public static zzdr zzf() {
        return zzi().zza();
    }

    public static zzef zzg() {
        zzeg zzegVar;
        zzegVar = zzee.zza;
        return zzegVar.zzh();
    }

    public static zzev zzi() {
        zzeg zzegVar;
        zzegVar = zzee.zza;
        return zzegVar.zzj();
    }

    public static zzfi zzk() {
        return zzi().zzc();
    }

    public static String zzl() {
        zzeg zzegVar;
        zzegVar = zzee.zza;
        return zzegVar.zzm();
    }

    public static boolean zzn(String loggerName, Level level, boolean isEnabled) {
        zzi().zzd(loggerName, level, isEnabled);
        return false;
    }

    protected long zzc() {
        return TimeUnit.MILLISECONDS.toNanos(System.currentTimeMillis());
    }

    protected abstract zzdp zze(String str);

    protected abstract zzef zzh();

    protected zzev zzj() {
        return zzev.zze();
    }

    protected abstract String zzm();
}
