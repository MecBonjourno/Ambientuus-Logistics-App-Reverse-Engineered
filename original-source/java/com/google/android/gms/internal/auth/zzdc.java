package com.google.android.gms.internal.auth;

import android.content.Context;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import javax.annotation.Nullable;

/* compiled from: com.google.android.gms:play-services-auth-base@@18.0.10 */
/* loaded from: classes16.dex */
public abstract class zzdc {
    public static final /* synthetic */ int zzd = 0;
    final zzcz zzb;
    final String zzc;
    private final Object zzj;
    private volatile int zzk = -1;
    private volatile Object zzl;
    private static final Object zza = new Object();

    @Nullable
    private static volatile zzda zze = null;
    private static volatile boolean zzf = false;
    private static final AtomicReference zzg = new AtomicReference();
    private static final zzde zzh = new zzde(new Object() { // from class: com.google.android.gms.internal.auth.zzcu
    });
    private static final AtomicInteger zzi = new AtomicInteger();

    /* synthetic */ zzdc(zzcz zzczVar, String str, Object obj, boolean z, zzdb zzdbVar) {
        if (zzczVar.zza == null) {
            throw new IllegalArgumentException("Must pass a valid SharedPreferences file name or ContentProvider URI");
        }
        this.zzb = zzczVar;
        this.zzc = str;
        this.zzj = obj;
    }

    public static void zzc() {
        zzi.incrementAndGet();
    }

    public static void zzd(final Context context) {
        if (zze != null || context == null) {
            return;
        }
        synchronized (zza) {
            if (zze == null) {
                synchronized (zza) {
                    zzda zzdaVar = zze;
                    Context applicationContext = context.getApplicationContext();
                    if (applicationContext != null) {
                        context = applicationContext;
                    }
                    if (zzdaVar == null || zzdaVar.zza() != context) {
                        zzcg.zzd();
                        zzdd.zzc();
                        zzco.zze();
                        zze = new zzcd(context, zzdo.zza(new zzdj() { // from class: com.google.android.gms.internal.auth.zzct
                            @Override // com.google.android.gms.internal.auth.zzdj
                            public final Object zza() {
                                Context context2 = context;
                                int i = zzdc.zzd;
                                return zzcp.zza(context2);
                            }
                        }));
                        zzi.incrementAndGet();
                    }
                }
            }
        }
    }

    abstract Object zza(Object obj);

    /* JADX WARN: Removed duplicated region for block: B:14:0x0040 A[Catch: all -> 0x00c8, TryCatch #0 {, blocks: (B:5:0x000b, B:7:0x000f, B:9:0x0018, B:11:0x0028, B:14:0x0040, B:16:0x0046, B:18:0x0050, B:20:0x0071, B:22:0x0079, B:24:0x0081, B:26:0x0087, B:29:0x0099, B:31:0x009f, B:32:0x0097, B:34:0x00a7, B:36:0x00ab, B:39:0x00b3, B:40:0x00b6, B:41:0x00bb, B:44:0x0065, B:45:0x00c0, B:46:0x00c5, B:49:0x00c6), top: B:4:0x000b }] */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00c0 A[Catch: all -> 0x00c8, TryCatch #0 {, blocks: (B:5:0x000b, B:7:0x000f, B:9:0x0018, B:11:0x0028, B:14:0x0040, B:16:0x0046, B:18:0x0050, B:20:0x0071, B:22:0x0079, B:24:0x0081, B:26:0x0087, B:29:0x0099, B:31:0x009f, B:32:0x0097, B:34:0x00a7, B:36:0x00ab, B:39:0x00b3, B:40:0x00b6, B:41:0x00bb, B:44:0x0065, B:45:0x00c0, B:46:0x00c5, B:49:0x00c6), top: B:4:0x000b }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object zzb() {
        /*
            r8 = this;
            java.util.concurrent.atomic.AtomicInteger r0 = com.google.android.gms.internal.auth.zzdc.zzi
            int r0 = r0.get()
            int r1 = r8.zzk
            if (r1 >= r0) goto Lcb
            monitor-enter(r8)
            int r1 = r8.zzk     // Catch: java.lang.Throwable -> Lc8
            if (r1 >= r0) goto Lc6
            com.google.android.gms.internal.auth.zzda r1 = com.google.android.gms.internal.auth.zzdc.zze     // Catch: java.lang.Throwable -> Lc8
            com.google.android.gms.internal.auth.zzdh r2 = com.google.android.gms.internal.auth.zzdh.zzc()     // Catch: java.lang.Throwable -> Lc8
            r3 = 0
            if (r1 == 0) goto L3b
            com.google.android.gms.internal.auth.zzdj r2 = r1.zzb()     // Catch: java.lang.Throwable -> Lc8
            java.lang.Object r2 = r2.zza()     // Catch: java.lang.Throwable -> Lc8
            com.google.android.gms.internal.auth.zzdh r2 = (com.google.android.gms.internal.auth.zzdh) r2     // Catch: java.lang.Throwable -> Lc8
            boolean r4 = r2.zzb()     // Catch: java.lang.Throwable -> Lc8
            if (r4 == 0) goto L3b
            java.lang.Object r4 = r2.zza()     // Catch: java.lang.Throwable -> Lc8
            com.google.android.gms.internal.auth.zzci r4 = (com.google.android.gms.internal.auth.zzci) r4     // Catch: java.lang.Throwable -> Lc8
            com.google.android.gms.internal.auth.zzcz r5 = r8.zzb     // Catch: java.lang.Throwable -> Lc8
            android.net.Uri r6 = r5.zza     // Catch: java.lang.Throwable -> Lc8
            java.lang.String r5 = r5.zzc     // Catch: java.lang.Throwable -> Lc8
            java.lang.String r7 = r8.zzc     // Catch: java.lang.Throwable -> Lc8
            java.lang.String r4 = r4.zza(r6, r3, r5, r7)     // Catch: java.lang.Throwable -> Lc8
            goto L3c
        L3b:
            r4 = r3
        L3c:
            java.lang.String r5 = "Must call PhenotypeFlag.init() first"
            if (r1 == 0) goto Lc0
            com.google.android.gms.internal.auth.zzcz r5 = r8.zzb     // Catch: java.lang.Throwable -> Lc8
            android.net.Uri r5 = r5.zza     // Catch: java.lang.Throwable -> Lc8
            if (r5 == 0) goto L65
            android.content.Context r6 = r1.zza()     // Catch: java.lang.Throwable -> Lc8
            boolean r5 = com.google.android.gms.internal.auth.zzcq.zza(r6, r5)     // Catch: java.lang.Throwable -> Lc8
            if (r5 == 0) goto L63
            android.content.Context r5 = r1.zza()     // Catch: java.lang.Throwable -> Lc8
            android.content.ContentResolver r5 = r5.getContentResolver()     // Catch: java.lang.Throwable -> Lc8
            com.google.android.gms.internal.auth.zzcz r6 = r8.zzb     // Catch: java.lang.Throwable -> Lc8
            android.net.Uri r6 = r6.zza     // Catch: java.lang.Throwable -> Lc8
            com.google.android.gms.internal.auth.zzcs r7 = new java.lang.Runnable() { // from class: com.google.android.gms.internal.auth.zzcs
                static {
                    /*
                        com.google.android.gms.internal.auth.zzcs r0 = new com.google.android.gms.internal.auth.zzcs
                        r0.<init>()
                        
                        // error: 0x0005: SPUT (r0 I:com.google.android.gms.internal.auth.zzcs) com.google.android.gms.internal.auth.zzcs.zza com.google.android.gms.internal.auth.zzcs
                        return
                    */
                    throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.auth.zzcs.<clinit>():void");
                }

                {
                    /*
                        r0 = this;
                        r0.<init>()
                        return
                    */
                    throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.auth.zzcs.<init>():void");
                }

                @Override // java.lang.Runnable
                public final void run() {
                    /*
                        r0 = this;
                        com.google.android.gms.internal.auth.zzdc.zzc()
                        return
                    */
                    throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.auth.zzcs.run():void");
                }
            }     // Catch: java.lang.Throwable -> Lc8
            com.google.android.gms.internal.auth.zzcg r5 = com.google.android.gms.internal.auth.zzcg.zza(r5, r6, r7)     // Catch: java.lang.Throwable -> Lc8
            goto L6f
        L63:
            r5 = r3
            goto L6f
        L65:
            android.content.Context r5 = r1.zza()     // Catch: java.lang.Throwable -> Lc8
            com.google.android.gms.internal.auth.zzcs r6 = com.google.android.gms.internal.auth.zzcs.zza     // Catch: java.lang.Throwable -> Lc8
            com.google.android.gms.internal.auth.zzdd r5 = com.google.android.gms.internal.auth.zzdd.zza(r5, r3, r6)     // Catch: java.lang.Throwable -> Lc8
        L6f:
            if (r5 == 0) goto L7e
            java.lang.String r6 = r8.zzc     // Catch: java.lang.Throwable -> Lc8
            java.lang.Object r5 = r5.zzb(r6)     // Catch: java.lang.Throwable -> Lc8
            if (r5 == 0) goto L7e
            java.lang.Object r5 = r8.zza(r5)     // Catch: java.lang.Throwable -> Lc8
            goto L7f
        L7e:
            r5 = r3
        L7f:
            if (r5 != 0) goto Lab
            com.google.android.gms.internal.auth.zzcz r5 = r8.zzb     // Catch: java.lang.Throwable -> Lc8
            boolean r5 = r5.zzd     // Catch: java.lang.Throwable -> Lc8
            if (r5 != 0) goto La4
            android.content.Context r1 = r1.zza()     // Catch: java.lang.Throwable -> Lc8
            com.google.android.gms.internal.auth.zzco r1 = com.google.android.gms.internal.auth.zzco.zza(r1)     // Catch: java.lang.Throwable -> Lc8
            com.google.android.gms.internal.auth.zzcz r5 = r8.zzb     // Catch: java.lang.Throwable -> Lc8
            boolean r5 = r5.zzd     // Catch: java.lang.Throwable -> Lc8
            if (r5 == 0) goto L97
            r5 = r3
            goto L99
        L97:
            java.lang.String r5 = r8.zzc     // Catch: java.lang.Throwable -> Lc8
        L99:
            java.lang.String r1 = r1.zzb(r5)     // Catch: java.lang.Throwable -> Lc8
            if (r1 == 0) goto La4
            java.lang.Object r3 = r8.zza(r1)     // Catch: java.lang.Throwable -> Lc8
            goto La5
        La4:
        La5:
            if (r3 != 0) goto Laa
            java.lang.Object r5 = r8.zzj     // Catch: java.lang.Throwable -> Lc8
            goto Lab
        Laa:
            r5 = r3
        Lab:
            boolean r1 = r2.zzb()     // Catch: java.lang.Throwable -> Lc8
            if (r1 == 0) goto Lba
            if (r4 != 0) goto Lb6
            java.lang.Object r5 = r8.zzj     // Catch: java.lang.Throwable -> Lc8
            goto Lbb
        Lb6:
            java.lang.Object r5 = r8.zza(r4)     // Catch: java.lang.Throwable -> Lc8
        Lba:
        Lbb:
            r8.zzl = r5     // Catch: java.lang.Throwable -> Lc8
            r8.zzk = r0     // Catch: java.lang.Throwable -> Lc8
            goto Lc6
        Lc0:
            java.lang.IllegalStateException r0 = new java.lang.IllegalStateException     // Catch: java.lang.Throwable -> Lc8
            r0.<init>(r5)     // Catch: java.lang.Throwable -> Lc8
            throw r0     // Catch: java.lang.Throwable -> Lc8
        Lc6:
            monitor-exit(r8)     // Catch: java.lang.Throwable -> Lc8
            goto Lcb
        Lc8:
            r0 = move-exception
            monitor-exit(r8)     // Catch: java.lang.Throwable -> Lc8
            throw r0
        Lcb:
            java.lang.Object r0 = r8.zzl
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.auth.zzdc.zzb():java.lang.Object");
    }
}
