package com.google.android.gms.dynamite;

import android.content.Context;
import android.content.pm.ProviderInfo;
import android.database.Cursor;
import android.os.IBinder;
import android.os.IInterface;
import android.os.RemoteException;
import android.os.SystemClock;
import android.util.Log;
import androidx.camera.video.internal.workaround.DefaultEncoderProfilesProvider;
import com.google.android.gms.common.GoogleApiAvailabilityLight;
import com.google.android.gms.common.internal.Objects;
import com.google.android.gms.common.internal.Preconditions;
import com.google.android.gms.common.util.CrashUtils;
import com.google.android.gms.common.util.PlatformVersion;
import com.google.android.gms.dynamic.IObjectWrapper;
import com.google.android.gms.dynamic.ObjectWrapper;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;

/* compiled from: com.google.android.gms:play-services-basement@@18.8.0 */
/* carregado de: classes16.dex */
public final class DynamiteModule {
    public static final int LOCAL = -1;
    public static final int NONE = 0;
    public static final int NO_SELECTION = 0;
    public static final int REMOTE = 1;
    private static Boolean zzc;
    private static String zzd;
    private static boolean zze;
    private static zzp zzl;
    private static zzq zzm;
    private final Context zzk;
    private static int zzf = -1;
    private static Boolean zzg = null;
    private static final ThreadLocal zzh = new ThreadLocal();
    private static final ThreadLocal zzi = new zze();
    private static final VersionPolicy.IVersions zzj = new zzf();
    public static final VersionPolicy PREFER_REMOTE = new zzg();
    public static final VersionPolicy PREFER_LOCAL = new zzh();
    public static final VersionPolicy PREFER_REMOTE_VERSION_NO_FORCE_STAGING = new zzi();
    public static final VersionPolicy PREFER_HIGHEST_OR_LOCAL_VERSION = new zzj();
    public static final VersionPolicy PREFER_HIGHEST_OR_LOCAL_VERSION_NO_FORCE_STAGING = new zzk();
    public static final VersionPolicy PREFER_HIGHEST_OR_REMOTE_VERSION = new zzl();
    public static final VersionPolicy zza = new zzm();
    public static final VersionPolicy zzb = new zzc();

    /* compiled from: com.google.android.gms:play-services-basement@@18.8.0 */
    public static class DynamiteLoaderClassLoader {
        public static ClassLoader sClassLoader;
    }

    /* compiled from: com.google.android.gms:play-services-basement@@18.8.0 */
    public static class LoadingException extends Exception {
        /* sintético */ LoadingException(String str, Throwable th, byte[] bArr) {
            super(str, th);
        }

        /* sintético */ LoadingException(String str, byte[] bArr) {
            super(str);
        }
    }

    /* compiled from: com.google.android.gms:play-services-basement@@18.8.0 */
    public interface VersionPolicy {

        /* compiled from: com.google.android.gms:play-services-basement@@18.8.0 */
        public interface IVersions {
            int zza(Context context, String str, boolean z) throws LoadingException;

            int zzb(Context context, String str);
        }

        /* compiled from: com.google.android.gms:play-services-basement@@18.8.0 */
        public static class SelectionResult {
            public int localVersion = 0;
            public int remoteVersion = 0;
            public int selection = 0;
        }

        SelectionResult selectModule(Context context, String str, IVersions iVersions) throws LoadingException;
    }

    private DynamiteModule(Context context) {
        Preconditions.checkNotNull(context);
        this.zzk = context;
    }

    public static int getLocalVersion(Context context, String moduleId) {
        try {
            ClassLoader classLoader = context.getApplicationContext().getClassLoader();
            StringBuilder sb = new StringBuilder(String.valueOf(moduleId).length() + 61);
            sb.append("com.google.android.gms.dynamite.descriptors.");
            sb.append(moduleId);
            sb.append(".ModuleDescriptor");
            Class<?> loadClass = classLoader.loadClass(sb.toString());
            Field declaredField = loadClass.getDeclaredField("MODULE_ID");
            Field declaredField2 = loadClass.getDeclaredField("MODULE_VERSION");
            if (Objects.equal(declaredField.get(null), moduleId)) {
                return declaredField2.getInt(null);
            }
            String valueOf = String.valueOf(declaredField.get(null));
            StringBuilder sb2 = new StringBuilder(String.valueOf(valueOf).length() + 50 + String.valueOf(moduleId).length() + 1);
            sb2.append("Module descriptor id '");
            sb2.append(valueOf);
            sb2.append("' didn't match expected id '");
            sb2.append(moduleId);
            sb2.append("'");
            Log.e("DynamiteModule", sb2.toString());
            return 0;
        } catch (ClassNotFoundException e) {
            StringBuilder sb3 = new StringBuilder(String.valueOf(moduleId).length() + 45);
            sb3.append("Local module descriptor class for ");
            sb3.append(moduleId);
            sb3.append(" not found.");
            Log.w("DynamiteModule", sb3.toString());
            return 0;
        } catch (Exception e2) {
            String message = e2.getMessage();
            String.valueOf(message);
            Log.e("DynamiteModule", "Failed to load module descriptor class: ".concat(String.valueOf(message)));
            return 0;
        }
    }

    public static int getRemoteVersion(Context context, String moduleId) {
        return zza(context, moduleId, false);
    }

    public static DynamiteModule load(Context context, VersionPolicy policy, String moduleId) throws LoadingException {
        DynamiteModule zze2;
        int i;
        Boolean bool;
        IObjectWrapper zze3;
        zzq zzqVar;
        Boolean valueOf;
        IObjectWrapper zze4;
        Context applicationContext = context.getApplicationContext();
        byte[] bArr = null;
        if (applicationContext == null) {
            throw new LoadingException("null application Context", null);
        }
        ThreadLocal threadLocal = zzh;
        zzn zznVar = (zzn) threadLocal.get();
        zzn zznVar2 = new zzn(null);
        threadLocal.set(zznVar2);
        ThreadLocal threadLocal2 = zzi;
        long longValue = ((Long) threadLocal2.get()).longValue();
        try {
            threadLocal2.set(Long.valueOf(SystemClock.uptimeMillis()));
            VersionPolicy.SelectionResult selectModule = policy.selectModule(context, moduleId, zzj);
            int i2 = selectModule.localVersion;
            int i3 = selectModule.remoteVersion;
            StringBuilder sb = new StringBuilder(String.valueOf(moduleId).length() + 26 + String.valueOf(i2).length() + 19 + String.valueOf(moduleId).length() + 1 + String.valueOf(i3).length());
            sb.append("Considering local module ");
            sb.append(moduleId);
            sb.append(":");
            sb.append(i2);
            sb.append(" and remote module ");
            sb.append(moduleId);
            sb.append(":");
            sb.append(i3);
            Log.i("DynamiteModule", sb.toString());
            int i4 = selectModule.selection;
            if (i4 != 0) {
                if (i4 == -1) {
                    if (selectModule.localVersion != 0) {
                        i4 = -1;
                    }
                }
                if (i4 != 1 || selectModule.remoteVersion != 0) {
                    if (i4 == -1) {
                        DynamiteModule zze5 = zze(applicationContext, moduleId);
                        if (longValue == 0) {
                            threadLocal2.remove();
                        } else {
                            threadLocal2.set(Long.valueOf(longValue));
                        }
                        Cursor cursor = zznVar2.zza;
                        if (cursor != null) {
                            cursor.close();
                        }
                        threadLocal.set(zznVar);
                        return zze5;
                    }
                    if (i4 != 1) {
                        StringBuilder sb2 = new StringBuilder(String.valueOf(i4).length() + 36);
                        sb2.append("VersionPolicy returned invalid code:");
                        sb2.append(i4);
                        throw new LoadingException(sb2.toString(), null);
                    }
                    try {
                        i = selectModule.remoteVersion;
                    } catch (LoadingException e) {
                        String message = e.getMessage();
                        StringBuilder sb3 = new StringBuilder(String.valueOf(message).length() + 30);
                        sb3.append("Failed to load remote module: ");
                        sb3.append(message);
                        Log.w("DynamiteModule", sb3.toString());
                        int i5 = selectModule.localVersion;
                        if (i5 == 0 || policy.selectModule(context, moduleId, new zzo(i5, 0)).selection != -1) {
                            throw new LoadingException("Remote load failed. No local fallback found.", e, null);
                        }
                        zze2 = zze(applicationContext, moduleId);
                    }
                    try {
                        synchronized (DynamiteModule.class) {
                            if (!zzb(context)) {
                                throw new LoadingException("Remote loading disabled", null);
                            }
                            bool = zzc;
                        }
                        if (bool == null) {
                            throw new LoadingException("Failed to determine which loading route to use.", null);
                        }
                        if (bool.booleanValue()) {
                            StringBuilder sb4 = new StringBuilder(String.valueOf(moduleId).length() + 40 + String.valueOf(i).length());
                            sb4.append("Selected remote version of ");
                            sb4.append(moduleId);
                            sb4.append(", version >= ");
                            sb4.append(i);
                            Log.i("DynamiteModule", sb4.toString());
                            synchronized (DynamiteModule.class) {
                                zzqVar = zzm;
                            }
                            if (zzqVar == null) {
                                throw new LoadingException("DynamiteLoaderV2 was not cached.", null);
                            }
                            zzn zznVar3 = (zzn) zzh.get();
                            if (zznVar3 == null || zznVar3.zza == null) {
                                throw new LoadingException("No result cursor", null);
                            }
                            Context applicationContext2 = context.getApplicationContext();
                            Cursor cursor2 = zznVar3.zza;
                            ObjectWrapper.wrap(null);
                            synchronized (DynamiteModule.class) {
                                valueOf = Boolean.valueOf(zzf >= 2);
                            }
                            if (valueOf.booleanValue()) {
                                Log.v("DynamiteModule", "Dynamite loader version >= 2, using loadModule2NoCrashUtils");
                                zze4 = zzqVar.zzf(ObjectWrapper.wrap(applicationContext2), moduleId, i, ObjectWrapper.wrap(cursor2));
                            } else {
                                Log.w("DynamiteModule", "Dynamite loader version < 2, falling back to loadModule2");
                                zze4 = zzqVar.zze(ObjectWrapper.wrap(applicationContext2), moduleId, i, ObjectWrapper.wrap(cursor2));
                            }
                            Context context2 = (Context) ObjectWrapper.unwrap(zze4);
                            if (context2 == null) {
                                throw new LoadingException("Failed to get module context", bArr);
                            }
                            zze2 = new DynamiteModule(context2);
                        } else {
                            StringBuilder sb5 = new StringBuilder(String.valueOf(moduleId).length() + 40 + String.valueOf(i).length());
                            sb5.append("Selected remote version of ");
                            sb5.append(moduleId);
                            sb5.append(", version >= ");
                            sb5.append(i);
                            Log.i("DynamiteModule", sb5.toString());
                            zzp zzg2 = zzg(context);
                            if (zzg2 == null) {
                                throw new LoadingException("Failed to create IDynamiteLoader.", null);
                            }
                            int zzi2 = zzg2.zzi();
                            if (zzi2 >= 3) {
                                zzn zznVar4 = (zzn) zzh.get();
                                if (zznVar4 == null) {
                                    throw new LoadingException("No cached result cursor holder", null);
                                }
                                zze3 = zzg2.zzk(ObjectWrapper.wrap(context), moduleId, i, ObjectWrapper.wrap(zznVar4.zza));
                            } else if (zzi2 == 2) {
                                Log.w("DynamiteModule", "IDynamite loader version = 2");
                                zze3 = zzg2.zzg(ObjectWrapper.wrap(context), moduleId, i);
                            } else {
                                Log.w("DynamiteModule", "Dynamite loader version < 2, falling back to createModuleContext");
                                zze3 = zzg2.zze(ObjectWrapper.wrap(context), moduleId, i);
                            }
                            Object unwrap = ObjectWrapper.unwrap(zze3);
                            if (unwrap == null) {
                                throw new LoadingException("Failed to load remote module.", null);
                            }
                            zze2 = new DynamiteModule((Context) unwrap);
                        }
                        return zze2;
                    } catch (RemoteException e2) {
                        throw new LoadingException("Failed to load remote module.", e2, null);
                    } catch (LoadingException e3) {
                        throw e3;
                    } catch (Throwable th) {
                        CrashUtils.addDynamiteErrorToDropBox(context, th);
                        throw new LoadingException("Failed to load remote module.", th, null);
                    }
                }
            }
            int i6 = selectModule.localVersion;
            int i7 = selectModule.remoteVersion;
            StringBuilder sb6 = new StringBuilder(String.valueOf(moduleId).length() + 46 + String.valueOf(i6).length() + 23 + String.valueOf(i7).length() + 1);
            sb6.append("No acceptable module ");
            sb6.append(moduleId);
            sb6.append(" found. Local version is ");
            sb6.append(i6);
            sb6.append(" and remote version is ");
            sb6.append(i7);
            sb6.append(".");
            throw new LoadingException(sb6.toString(), null);
        } finally {
            if (longValue == 0) {
                zzi.remove();
            } else {
                zzi.set(Long.valueOf(longValue));
            }
            Cursor cursor3 = zznVar2.zza;
            if (cursor3 != null) {
                cursor3.close();
            }
            zzh.set(zznVar);
        }
    }

    /* JADX WARN: região duplicada removida para o bloco: B:54:0x01f1 A[Catch: all -> 0x01f9, TryCatch #10 {all -> 0x01f9, blocks: (B:4:0x0006, B:10:0x00ee, B:68:0x00f4, B:12:0x011e, B:41:0x0179, B:30:0x0189, B:54:0x01f1, B:55:0x01f4, B:49:0x01e6, B:73:0x00fb, B:134:0x01f8, B:6:0x0007, B:76:0x000d, B:77:0x0029, B:84:0x00eb, B:89:0x004c, B:107:0x00a7, B:115:0x00aa, B:127:0x00c5, B:9:0x00ed, B:130:0x00cb), top: B:3:0x0006, inners: #4, #9 }] */
    /* JADX WARN: região duplicada removida para o bloco: B:56:? A[Catch: all -> 0x01f9, SYNTHETIC, TRY_LEAVE, TryCatch #10 {all -> 0x01f9, blocks: (B:4:0x0006, B:10:0x00ee, B:68:0x00f4, B:12:0x011e, B:41:0x0179, B:30:0x0189, B:54:0x01f1, B:55:0x01f4, B:49:0x01e6, B:73:0x00fb, B:134:0x01f8, B:6:0x0007, B:76:0x000d, B:77:0x0029, B:84:0x00eb, B:89:0x004c, B:107:0x00a7, B:115:0x00aa, B:127:0x00c5, B:9:0x00ed, B:130:0x00cb), top: B:3:0x0006, inners: #4, #9 }] */
    /* JADX WARN: padrão de laço com múltiplas entradas não suportado (BACK_EDGE: B:31:0x01e9 -> B:24:0x01eb). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static int zza(android.content.Context r12, java.lang.String r13, boolean r14) {
        /*
            Method dump skipped, instructions count: 511
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.dynamite.DynamiteModule.zza(android.content.Context, java.lang.String, boolean):int");
    }

    private static boolean zzb(Context context) {
        if (Boolean.TRUE.equals(null) || Boolean.TRUE.equals(zzg)) {
            return true;
        }
        boolean z = false;
        if (zzg == null) {
            ProviderInfo resolveContentProvider = context.getPackageManager().resolveContentProvider("com.google.android.gms.chimera", true != PlatformVersion.isAtLeastQ() ? 0 : 268435456);
            if (GoogleApiAvailabilityLight.getInstance().isGooglePlayServicesAvailable(context, DefaultEncoderProfilesProvider.DEFAULT_VIDEO_BITRATE_FHD) == 0 && resolveContentProvider != null && "com.google.android.gms".equals(resolveContentProvider.packageName)) {
                z = true;
            }
            Boolean valueOf = Boolean.valueOf(z);
            zzg = valueOf;
            z = valueOf.booleanValue();
            if (z && resolveContentProvider.applicationInfo != null && (resolveContentProvider.applicationInfo.flags & 129) == 0) {
                Log.i("DynamiteModule", "Non-system-image GmsCore APK, forcing V1");
                zze = true;
            }
        }
        if (!z) {
            Log.e("DynamiteModule", "Invalid GmsCore APK, remote loading disabled.");
        }
        return z;
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    /* JADX WARN: região duplicada removida para o bloco: B:53:0x0166 A[Catch: all -> 0x018a, TryCatch #9 {all -> 0x018a, blocks: (B:51:0x0162, B:53:0x0166, B:54:0x0188, B:55:0x0189), top: B:50:0x0162 }] */
    /* JADX WARN: região duplicada removida para o bloco: B:55:0x0189 A[Catch: all -> 0x018a, TRY_LEAVE, TryCatch #9 {all -> 0x018a, blocks: (B:51:0x0162, B:53:0x0166, B:54:0x0188, B:55:0x0189), top: B:50:0x0162 }] */
    /* JADX WARN: região duplicada removida para o bloco: B:59:0x018f  */
    /* JADX WARN: região duplicada removida para o bloco: B:61:? A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static int zzc(android.content.Context r13, java.lang.String r14, boolean r15, boolean r16) throws com.google.android.gms.dynamite.DynamiteModule.LoadingException {
        /*
            Method dump skipped, instructions count: 418
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.dynamite.DynamiteModule.zzc(android.content.Context, java.lang.String, boolean, boolean):int");
    }

    private static boolean zzd(Cursor cursor) {
        zzn zznVar = (zzn) zzh.get();
        if (zznVar == null || zznVar.zza != null) {
            return false;
        }
        zznVar.zza = cursor;
        return true;
    }

    private static DynamiteModule zze(Context context, String str) {
        String.valueOf(str);
        Log.i("DynamiteModule", "Selected local version of ".concat(String.valueOf(str)));
        return new DynamiteModule(context);
    }

    private static void zzf(ClassLoader classLoader) throws LoadingException {
        zzq zzqVar;
        byte[] bArr = null;
        try {
            IBinder iBinder = (IBinder) classLoader.loadClass("com.google.android.gms.dynamiteloader.DynamiteLoaderV2").getConstructor(new Class[0]).newInstance(new Object[0]);
            if (iBinder == null) {
                zzqVar = null;
            } else {
                IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.dynamite.IDynamiteLoaderV2");
                zzqVar = queryLocalInterface instanceof zzq ? (zzq) queryLocalInterface : new zzq(iBinder);
            }
            zzm = zzqVar;
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | NoSuchMethodException | InvocationTargetException e) {
            throw new LoadingException("Failed to instantiate dynamite loader", e, bArr);
        }
    }

    private static zzp zzg(Context context) {
        zzp zzpVar;
        synchronized (DynamiteModule.class) {
            zzp zzpVar2 = zzl;
            if (zzpVar2 != null) {
                return zzpVar2;
            }
            try {
                IBinder iBinder = (IBinder) context.createPackageContext("com.google.android.gms", 3).getClassLoader().loadClass("com.google.android.gms.chimera.container.DynamiteLoaderImpl").newInstance();
                if (iBinder == null) {
                    zzpVar = null;
                } else {
                    IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.dynamite.IDynamiteLoader");
                    zzpVar = queryLocalInterface instanceof zzp ? (zzp) queryLocalInterface : new zzp(iBinder);
                }
                if (zzpVar != null) {
                    zzl = zzpVar;
                    return zzpVar;
                }
            } catch (Exception e) {
                String message = e.getMessage();
                StringBuilder sb = new StringBuilder(String.valueOf(message).length() + 45);
                sb.append("Failed to load IDynamiteLoader from GmsCore: ");
                sb.append(message);
                Log.e("DynamiteModule", sb.toString());
            }
            return null;
        }
    }

    public Context getModuleContext() {
        return this.zzk;
    }

    public IBinder instantiate(String className) throws LoadingException {
        try {
            return (IBinder) this.zzk.getClassLoader().loadClass(className).newInstance();
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException e) {
            String.valueOf(className);
            throw new LoadingException("Failed to instantiate module class: ".concat(String.valueOf(className)), e, null);
        }
    }
}
