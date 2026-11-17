package com.google.android.gms.internal.auth;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/* compiled from: com.google.android.gms:play-services-auth-base@@18.0.10 */
/* loaded from: classes16.dex */
final class zzeq {
    private static final zzeq zzb = new zzeq(true);
    final zzgv zza = new zzgl(16);
    private boolean zzc;
    private boolean zzd;

    private zzeq() {
    }

    public static zzeq zza() {
        throw null;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:26:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static final void zzd(com.google.android.gms.internal.auth.zzep r4, java.lang.Object r5) {
        /*
            com.google.android.gms.internal.auth.zzho r0 = r4.zzb()
            byte[] r1 = com.google.android.gms.internal.auth.zzfa.zzd
            if (r5 == 0) goto L77
            com.google.android.gms.internal.auth.zzho r1 = com.google.android.gms.internal.auth.zzho.DOUBLE
            com.google.android.gms.internal.auth.zzhp r1 = com.google.android.gms.internal.auth.zzhp.INT
            com.google.android.gms.internal.auth.zzhp r0 = r0.zza()
            int r0 = r0.ordinal()
            switch(r0) {
                case 0: goto L42;
                case 1: goto L3f;
                case 2: goto L3c;
                case 3: goto L39;
                case 4: goto L36;
                case 5: goto L33;
                case 6: goto L2a;
                case 7: goto L21;
                case 8: goto L18;
                default: goto L17;
            }
        L17:
            goto L47
        L18:
            boolean r0 = r5 instanceof com.google.android.gms.internal.auth.zzfx
            if (r0 != 0) goto L46
            boolean r0 = r5 instanceof com.google.android.gms.internal.auth.zzfc
            if (r0 == 0) goto L47
            goto L46
        L21:
            boolean r0 = r5 instanceof java.lang.Integer
            if (r0 != 0) goto L46
            boolean r0 = r5 instanceof com.google.android.gms.internal.auth.zzex
            if (r0 == 0) goto L47
            goto L46
        L2a:
            boolean r0 = r5 instanceof com.google.android.gms.internal.auth.zzef
            if (r0 != 0) goto L46
            boolean r0 = r5 instanceof byte[]
            if (r0 == 0) goto L47
            goto L46
        L33:
            boolean r0 = r5 instanceof java.lang.String
            goto L44
        L36:
            boolean r0 = r5 instanceof java.lang.Boolean
            goto L44
        L39:
            boolean r0 = r5 instanceof java.lang.Double
            goto L44
        L3c:
            boolean r0 = r5 instanceof java.lang.Float
            goto L44
        L3f:
            boolean r0 = r5 instanceof java.lang.Long
            goto L44
        L42:
            boolean r0 = r5 instanceof java.lang.Integer
        L44:
            if (r0 == 0) goto L47
        L46:
            return
        L47:
            java.lang.IllegalArgumentException r0 = new java.lang.IllegalArgumentException
            int r1 = r4.zza()
            java.lang.Integer r1 = java.lang.Integer.valueOf(r1)
            com.google.android.gms.internal.auth.zzho r4 = r4.zzb()
            com.google.android.gms.internal.auth.zzhp r4 = r4.zza()
            java.lang.Class r5 = r5.getClass()
            java.lang.String r5 = r5.getName()
            r2 = 3
            java.lang.Object[] r2 = new java.lang.Object[r2]
            r3 = 0
            r2[r3] = r1
            r1 = 1
            r2[r1] = r4
            r4 = 2
            r2[r4] = r5
            java.lang.String r4 = "Wrong object type used with protocol message reflection.\nField number: %d, field java type: %s, value type: %s\n"
            java.lang.String r4 = java.lang.String.format(r4, r2)
            r0.<init>(r4)
            throw r0
        L77:
            r4 = 0
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.auth.zzeq.zzd(com.google.android.gms.internal.auth.zzep, java.lang.Object):void");
    }

    public final /* bridge */ /* synthetic */ Object clone() throws CloneNotSupportedException {
        zzeq zzeqVar = new zzeq();
        for (int i = 0; i < this.zza.zzb(); i++) {
            Map.Entry zzg = this.zza.zzg(i);
            zzeqVar.zzc((zzep) zzg.getKey(), zzg.getValue());
        }
        for (Map.Entry entry : this.zza.zzc()) {
            zzeqVar.zzc((zzep) entry.getKey(), entry.getValue());
        }
        zzeqVar.zzd = this.zzd;
        return zzeqVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof zzeq) {
            return this.zza.equals(((zzeq) obj).zza);
        }
        return false;
    }

    public final int hashCode() {
        return this.zza.hashCode();
    }

    public final void zzb() {
        if (this.zzc) {
            return;
        }
        for (int i = 0; i < this.zza.zzb(); i++) {
            Map.Entry zzg = this.zza.zzg(i);
            if (zzg.getValue() instanceof zzev) {
                ((zzev) zzg.getValue()).zzi();
            }
        }
        this.zza.zza();
        this.zzc = true;
    }

    public final void zzc(zzep zzepVar, Object obj) {
        if (!zzepVar.zzc()) {
            zzd(zzepVar, obj);
        } else {
            if (!(obj instanceof List)) {
                throw new IllegalArgumentException("Wrong object type used with protocol message reflection.");
            }
            ArrayList arrayList = new ArrayList();
            arrayList.addAll((List) obj);
            int size = arrayList.size();
            for (int i = 0; i < size; i++) {
                zzd(zzepVar, arrayList.get(i));
            }
            obj = arrayList;
        }
        if (obj instanceof zzfc) {
            this.zzd = true;
        }
        this.zza.put(zzepVar, obj);
    }

    private zzeq(boolean z) {
        zzb();
        zzb();
    }
}
