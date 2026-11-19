package com.google.android.gms.internal.mlkit_vision_barcode_bundled;

import java.util.Collections;
import java.util.Iterator;
import java.util.Map;

/* compiled from: com.google.mlkit:barcode-scanning@@17.3.0 */
/* carregado de: classes16.dex */
final class zzdx {
    private static final zzdx zzb = new zzdx(true);
    final zzgo zza = new zzgh();
    private boolean zzc;
    private boolean zzd;

    private zzdx() {
    }

    public static int zza(zzdw zzdwVar, Object obj) {
        zzhf zzd = zzdwVar.zzd();
        int zza = zzdwVar.zza();
        zzdwVar.zzg();
        int zzA = zzdn.zzA(zza << 3);
        if (zzd == zzhf.GROUP) {
            zzfm zzfmVar = (zzfm) obj;
            byte[] bArr = zzep.zzb;
            if (zzfmVar instanceof zzcr) {
                throw null;
            }
            zzA += zzA;
        }
        zzhg zzhgVar = zzhg.INT;
        int i = 4;
        switch (zzd) {
            case DOUBLE:
                ((Double) obj).doubleValue();
                i = 8;
                break;
            case FLOAT:
                ((Float) obj).floatValue();
                break;
            case INT64:
                i = zzdn.zzB(((Long) obj).longValue());
                break;
            case UINT64:
                i = zzdn.zzB(((Long) obj).longValue());
                break;
            case INT32:
                i = zzdn.zzB(((Integer) obj).intValue());
                break;
            case FIXED64:
                ((Long) obj).longValue();
                i = 8;
                break;
            case FIXED32:
                ((Integer) obj).intValue();
                break;
            case BOOL:
                ((Boolean) obj).booleanValue();
                i = 1;
                break;
            case STRING:
                if (!(obj instanceof zzdf)) {
                    i = zzdn.zzz((String) obj);
                    break;
                } else {
                    int zzd2 = ((zzdf) obj).zzd();
                    i = zzdn.zzA(zzd2) + zzd2;
                    break;
                }
            case GROUP:
                i = ((zzfm) obj).zzF();
                break;
            case MESSAGE:
                if (!(obj instanceof zzew)) {
                    i = zzdn.zzx((zzfm) obj);
                    break;
                } else {
                    int zza2 = ((zzew) obj).zza();
                    i = zzdn.zzA(zza2) + zza2;
                    break;
                }
            case BYTES:
                if (!(obj instanceof zzdf)) {
                    int length = ((byte[]) obj).length;
                    i = zzdn.zzA(length) + length;
                    break;
                } else {
                    int zzd3 = ((zzdf) obj).zzd();
                    i = zzdn.zzA(zzd3) + zzd3;
                    break;
                }
            case UINT32:
                i = zzdn.zzA(((Integer) obj).intValue());
                break;
            case ENUM:
                if (!(obj instanceof zzej)) {
                    i = zzdn.zzB(((Integer) obj).intValue());
                    break;
                } else {
                    i = zzdn.zzB(((zzej) obj).zza());
                    break;
                }
            case SFIXED32:
                ((Integer) obj).intValue();
                break;
            case SFIXED64:
                ((Long) obj).longValue();
                i = 8;
                break;
            case SINT32:
                int intValue = ((Integer) obj).intValue();
                i = zzdn.zzA((intValue >> 31) ^ (intValue + intValue));
                break;
            case SINT64:
                long longValue = ((Long) obj).longValue();
                i = zzdn.zzB((longValue >> 63) ^ (longValue + longValue));
                break;
            default:
                throw new RuntimeException("There is no way to get here, but the compiler thinks otherwise.");
        }
        return zzA + i;
    }

    public static zzdx zzd() {
        return zzb;
    }

    private static Object zzl(Object obj) {
        if (obj instanceof zzfr) {
            return ((zzfr) obj).zzc();
        }
        if (!(obj instanceof byte[])) {
            return obj;
        }
        byte[] bArr = (byte[]) obj;
        int length = bArr.length;
        byte[] bArr2 = new byte[length];
        System.arraycopy(bArr, 0, bArr2, 0, length);
        return bArr2;
    }

    private final void zzm(Map.Entry entry) {
        zzdw zzdwVar = (zzdw) entry.getKey();
        Object value = entry.getValue();
        boolean z = value instanceof zzew;
        zzdwVar.zzg();
        if (zzdwVar.zze() != zzhg.MESSAGE) {
            if (z) {
                throw new IllegalStateException("Lazy fields must be message-valued");
            }
            this.zza.put(zzdwVar, zzl(value));
            return;
        }
        Object zze = zze(zzdwVar);
        if (zze == null) {
            this.zza.put(zzdwVar, zzl(value));
            if (z) {
                this.zzd = true;
                return;
            }
            return;
        }
        if (z) {
            throw null;
        }
        this.zza.put(zzdwVar, zze instanceof zzfr ? zzdwVar.zzc((zzfr) zze, (zzfr) value) : zzdwVar.zzb(((zzfm) zze).zzaa(), (zzfm) value).zzj());
    }

    private static boolean zzn(Map.Entry entry) {
        zzdw zzdwVar = (zzdw) entry.getKey();
        if (zzdwVar.zze() != zzhg.MESSAGE) {
            return true;
        }
        zzdwVar.zzg();
        Object value = entry.getValue();
        if (value instanceof zzfn) {
            return ((zzfn) value).zzad();
        }
        if (value instanceof zzew) {
            return true;
        }
        throw new IllegalArgumentException("Wrong object type used with protocol message reflection.");
    }

    private static final int zzo(Map.Entry entry) {
        zzdw zzdwVar = (zzdw) entry.getKey();
        Object value = entry.getValue();
        if (zzdwVar.zze() != zzhg.MESSAGE) {
            return zza(zzdwVar, value);
        }
        zzdwVar.zzg();
        zzdwVar.zzf();
        if (!(value instanceof zzew)) {
            int zza = ((zzdw) entry.getKey()).zza();
            int zzA = zzdn.zzA(8);
            return zzA + zzA + zzdn.zzA(16) + zzdn.zzA(zza) + zzdn.zzA(24) + zzdn.zzx((zzfm) value);
        }
        int zza2 = ((zzdw) entry.getKey()).zza();
        int zzA2 = zzdn.zzA(8);
        int zzA3 = zzdn.zzA(16) + zzdn.zzA(zza2);
        int zzA4 = zzdn.zzA(24);
        int zza3 = ((zzew) value).zza();
        return zzA2 + zzA2 + zzA3 + zzA4 + zzdn.zzA(zza3) + zza3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof zzdx) {
            return this.zza.equals(((zzdx) obj).zza);
        }
        return false;
    }

    public final int hashCode() {
        return this.zza.hashCode();
    }

    public final int zzb() {
        int zzc = this.zza.zzc();
        int i = 0;
        for (int i2 = 0; i2 < zzc; i2++) {
            i += zzo(this.zza.zzg(i2));
        }
        Iterator it = this.zza.zzd().iterator();
        while (it.hasNext()) {
            i += zzo((Map.Entry) it.next());
        }
        return i;
    }

    /* renomeado de: zzc, motivo: mesclado com método bridge [métodos inline] */
    public final zzdx clone() {
        zzdx zzdxVar = new zzdx();
        int zzc = this.zza.zzc();
        for (int i = 0; i < zzc; i++) {
            Map.Entry zzg = this.zza.zzg(i);
            zzdxVar.zzi((zzdw) ((zzgi) zzg).zza(), zzg.getValue());
        }
        for (Map.Entry entry : this.zza.zzd()) {
            zzdxVar.zzi((zzdw) entry.getKey(), entry.getValue());
        }
        zzdxVar.zzd = this.zzd;
        return zzdxVar;
    }

    public final Object zze(zzdw zzdwVar) {
        Object obj = this.zza.get(zzdwVar);
        if (!(obj instanceof zzew)) {
            return obj;
        }
        throw null;
    }

    public final Iterator zzf() {
        return this.zza.isEmpty() ? Collections.emptyIterator() : this.zzd ? new zzev(this.zza.entrySet().iterator()) : this.zza.entrySet().iterator();
    }

    public final void zzg() {
        if (this.zzc) {
            return;
        }
        int zzc = this.zza.zzc();
        for (int i = 0; i < zzc; i++) {
            Map.Entry zzg = this.zza.zzg(i);
            if (zzg.getValue() instanceof zzeh) {
                ((zzeh) zzg.getValue()).zzT();
            }
        }
        this.zza.zza();
        this.zzc = true;
    }

    public final void zzh(zzdx zzdxVar) {
        int zzc = zzdxVar.zza.zzc();
        for (int i = 0; i < zzc; i++) {
            zzm(zzdxVar.zza.zzg(i));
        }
        Iterator it = zzdxVar.zza.zzd().iterator();
        while (it.hasNext()) {
            zzm((Map.Entry) it.next());
        }
    }

    /* JADX WARN: não é possível corrigir a ordem dos casos do switch; parte do código será duplicada */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x002b, code lost:
    
        if ((r7 instanceof com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzej) == false) goto L34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0034, code lost:
    
        if ((r7 instanceof byte[]) == false) goto L34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0048, code lost:
    
        if (r0 == false) goto L34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x0022, code lost:
    
        if ((r7 instanceof com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzew) == false) goto L34;
     */
    /* JADX WARN: região duplicada removida para o bloco: B:11:0x004e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void zzi(com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzdw r6, java.lang.Object r7) {
        /*
            r5 = this;
            r6.zzg()
            com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzhf r0 = r6.zzd()
            byte[] r1 = com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzep.zzb
            if (r7 == 0) goto L85
            com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzhf r1 = com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzhf.DOUBLE
            com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzhg r1 = com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzhg.INT
            com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzhg r0 = r0.zza()
            int r0 = r0.ordinal()
            r1 = 1
            switch(r0) {
                case 0: goto L46;
                case 1: goto L43;
                case 2: goto L40;
                case 3: goto L3d;
                case 4: goto L3a;
                case 5: goto L37;
                case 6: goto L2e;
                case 7: goto L25;
                case 8: goto L1c;
                default: goto L1b;
            }
        L1b:
            goto L56
        L1c:
            boolean r0 = r7 instanceof com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzfm
            if (r0 != 0) goto L4a
            boolean r0 = r7 instanceof com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzew
            if (r0 == 0) goto L56
            goto L4a
        L25:
            boolean r0 = r7 instanceof java.lang.Integer
            if (r0 != 0) goto L4a
            boolean r0 = r7 instanceof com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzej
            if (r0 == 0) goto L56
            goto L4a
        L2e:
            boolean r0 = r7 instanceof com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzdf
            if (r0 != 0) goto L4a
            boolean r0 = r7 instanceof byte[]
            if (r0 == 0) goto L56
            goto L4a
        L37:
            boolean r0 = r7 instanceof java.lang.String
            goto L48
        L3a:
            boolean r0 = r7 instanceof java.lang.Boolean
            goto L48
        L3d:
            boolean r0 = r7 instanceof java.lang.Double
            goto L48
        L40:
            boolean r0 = r7 instanceof java.lang.Float
            goto L48
        L43:
            boolean r0 = r7 instanceof java.lang.Long
            goto L48
        L46:
            boolean r0 = r7 instanceof java.lang.Integer
        L48:
            if (r0 == 0) goto L56
        L4a:
            boolean r0 = r7 instanceof com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzew
            if (r0 == 0) goto L50
            r5.zzd = r1
        L50:
            com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzgo r0 = r5.zza
            r0.put(r6, r7)
            return
        L56:
            java.lang.IllegalArgumentException r0 = new java.lang.IllegalArgumentException
            int r2 = r6.zza()
            java.lang.Integer r2 = java.lang.Integer.valueOf(r2)
            com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzhf r6 = r6.zzd()
            com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzhg r6 = r6.zza()
            java.lang.Class r7 = r7.getClass()
            java.lang.String r7 = r7.getName()
            r3 = 3
            java.lang.Object[] r3 = new java.lang.Object[r3]
            r4 = 0
            r3[r4] = r2
            r3[r1] = r6
            r6 = 2
            r3[r6] = r7
            java.lang.String r6 = "Wrong object type used with protocol message reflection.\nField number: %d, field java type: %s, value type: %s\n"
            java.lang.String r6 = java.lang.String.format(r6, r3)
            r0.<init>(r6)
            throw r0
        L85:
            r6 = 0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzdx.zzi(com.google.android.gms.internal.mlkit_vision_barcode_bundled.zzdw, java.lang.Object):void");
    }

    public final boolean zzj() {
        return this.zzc;
    }

    public final boolean zzk() {
        int zzc = this.zza.zzc();
        for (int i = 0; i < zzc; i++) {
            if (!zzn(this.zza.zzg(i))) {
                return false;
            }
        }
        Iterator it = this.zza.zzd().iterator();
        while (it.hasNext()) {
            if (!zzn((Map.Entry) it.next())) {
                return false;
            }
        }
        return true;
    }

    private zzdx(boolean z) {
        zzg();
        zzg();
    }
}
