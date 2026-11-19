package com.google.android.gms.internal.mlkit_vision_common;

import com.google.mlkit.common.sdkinternal.OptionalModuleUtils;
import j$.util.Map;
import java.io.Serializable;
import java.util.Map;
import java.util.Set;
import java.util.function.BiConsumer;
import java.util.function.BiFunction;
import java.util.function.Function;
import javax.annotation.CheckForNull;

/* compiled from: com.google.mlkit:vision-common@@17.3.0 */
/* carregado de: classes16.dex */
public abstract class zzr implements Map, Serializable, j$.util.Map {

    @CheckForNull
    private transient zzs zza;

    @CheckForNull
    private transient zzs zzb;

    @CheckForNull
    private transient zzl zzc;

    zzr() {
    }

    public static zzr zzc(Object obj, Object obj2) {
        zzi.zza("optional-module-barcode", OptionalModuleUtils.BARCODE_MODULE_ID);
        return zzz.zzg(1, new Object[]{"optional-module-barcode", OptionalModuleUtils.BARCODE_MODULE_ID}, null);
    }

    @Override // java.util.Map
    @Deprecated
    public final void clear() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map, j$.util.Map
    public /* sintético */ Object compute(Object obj, BiFunction biFunction) {
        return Map.CC.$default$compute(this, obj, biFunction);
    }

    @Override // java.util.Map, j$.util.Map
    public /* sintético */ Object computeIfAbsent(Object obj, Function function) {
        return Map.CC.$default$computeIfAbsent(this, obj, function);
    }

    @Override // java.util.Map, j$.util.Map
    public /* sintético */ Object computeIfPresent(Object obj, BiFunction biFunction) {
        return Map.CC.$default$computeIfPresent(this, obj, biFunction);
    }

    @Override // java.util.Map
    public final boolean containsKey(@CheckForNull Object obj) {
        return get(obj) != null;
    }

    @Override // java.util.Map
    public final boolean containsValue(@CheckForNull Object obj) {
        return values().contains(obj);
    }

    @Override // java.util.Map
    public final boolean equals(@CheckForNull Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof java.util.Map) {
            return entrySet().equals(((java.util.Map) obj).entrySet());
        }
        return false;
    }

    @Override // java.util.Map, j$.util.Map
    public /* sintético */ void forEach(BiConsumer biConsumer) {
        Map.CC.$default$forEach(this, biConsumer);
    }

    @Override // java.util.Map
    @CheckForNull
    public abstract Object get(@CheckForNull Object obj);

    @Override // java.util.Map, j$.util.Map
    @CheckForNull
    public final Object getOrDefault(@CheckForNull Object obj, @CheckForNull Object obj2) {
        Object obj3 = get(obj);
        return obj3 != null ? obj3 : obj2;
    }

    @Override // java.util.Map
    public final int hashCode() {
        return zzaa.zza(entrySet());
    }

    @Override // java.util.Map
    public final boolean isEmpty() {
        return size() == 0;
    }

    @Override // java.util.Map
    public final /* bridge */ /* sintético */ Set keySet() {
        zzs zzsVar = this.zzb;
        if (zzsVar != null) {
            return zzsVar;
        }
        zzs zze = zze();
        this.zzb = zze;
        return zze;
    }

    @Override // java.util.Map, j$.util.Map
    public /* sintético */ Object merge(Object obj, Object obj2, BiFunction biFunction) {
        return Map.CC.$default$merge(this, obj, obj2, biFunction);
    }

    @Override // java.util.Map
    @CheckForNull
    @Deprecated
    public final Object put(Object obj, Object obj2) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    @Deprecated
    public final void putAll(java.util.Map map) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map, j$.util.Map
    public /* sintético */ Object putIfAbsent(Object obj, Object obj2) {
        return Map.CC.$default$putIfAbsent(this, obj, obj2);
    }

    @Override // java.util.Map
    @CheckForNull
    @Deprecated
    public final Object remove(@CheckForNull Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map, j$.util.Map
    public /* sintético */ boolean remove(Object obj, Object obj2) {
        return Map.CC.$default$remove(this, obj, obj2);
    }

    @Override // java.util.Map, j$.util.Map
    public /* sintético */ Object replace(Object obj, Object obj2) {
        return Map.CC.$default$replace(this, obj, obj2);
    }

    @Override // java.util.Map, j$.util.Map
    public /* sintético */ boolean replace(Object obj, Object obj2, Object obj3) {
        return Map.CC.$default$replace(this, obj, obj2, obj3);
    }

    @Override // java.util.Map, j$.util.Map
    public /* sintético */ void replaceAll(BiFunction biFunction) {
        Map.CC.$default$replaceAll(this, biFunction);
    }

    public final String toString() {
        int size = size();
        if (size < 0) {
            throw new IllegalArgumentException("size cannot be negative but was: " + size);
        }
        StringBuilder sb = new StringBuilder((int) Math.min(size * 8, 1073741824L));
        sb.append('{');
        boolean z = true;
        for (Map.Entry entry : entrySet()) {
            if (!z) {
                sb.append(", ");
            }
            sb.append(entry.getKey());
            sb.append('=');
            sb.append(entry.getValue());
            z = false;
        }
        sb.append('}');
        return sb.toString();
    }

    abstract zzl zza();

    @Override // java.util.Map
    /* renomeado de: zzb, motivo: mesclado com método bridge [métodos inline] */
    public final zzl values() {
        zzl zzlVar = this.zzc;
        if (zzlVar != null) {
            return zzlVar;
        }
        zzl zza = zza();
        this.zzc = zza;
        return zza;
    }

    abstract zzs zzd();

    abstract zzs zze();

    @Override // java.util.Map
    /* renomeado de: zzf, motivo: mesclado com método bridge [métodos inline] */
    public final zzs entrySet() {
        zzs zzsVar = this.zza;
        if (zzsVar != null) {
            return zzsVar;
        }
        zzs zzd = zzd();
        this.zza = zzd;
        return zzd;
    }
}
