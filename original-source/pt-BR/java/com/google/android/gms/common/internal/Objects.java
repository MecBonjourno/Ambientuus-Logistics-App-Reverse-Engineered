package com.google.android.gms.common.internal;

import android.os.Bundle;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;

/* compiled from: com.google.android.gms:play-services-basement@@18.8.0 */
/* carregado de: classes16.dex */
public final class Objects {

    /* compiled from: com.google.android.gms:play-services-basement@@18.8.0 */
    public static final class ToStringHelper {
        private final List zza;
        private final Object zzb;

        /* sintético */ ToStringHelper(Object obj, byte[] bArr) {
            Preconditions.checkNotNull(obj);
            this.zzb = obj;
            this.zza = new ArrayList();
        }

        public ToStringHelper add(String name, Object value) {
            Preconditions.checkNotNull(name);
            String str = name;
            int length = str.length();
            String valueOf = String.valueOf(value);
            StringBuilder sb = new StringBuilder(length + 1 + String.valueOf(valueOf).length());
            sb.append(str);
            sb.append("=");
            sb.append(valueOf);
            this.zza.add(sb.toString());
            return this;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder(100);
            sb.append(this.zzb.getClass().getSimpleName());
            sb.append('{');
            List list = this.zza;
            int size = list.size();
            for (int i = 0; i < size; i++) {
                sb.append((String) list.get(i));
                if (i < size - 1) {
                    sb.append(", ");
                }
            }
            sb.append('}');
            return sb.toString();
        }
    }

    private Objects() {
        throw new AssertionError("Uninstantiable");
    }

    public static boolean checkBundlesEquality(Bundle firstBundle, Bundle secondBundle) {
        if (firstBundle == null || secondBundle == null) {
            return firstBundle == secondBundle;
        }
        if (firstBundle.size() != secondBundle.size()) {
            return false;
        }
        Set<String> keySet = firstBundle.keySet();
        if (!keySet.containsAll(secondBundle.keySet())) {
            return false;
        }
        for (String str : keySet) {
            if (!equal(firstBundle.get(str), secondBundle.get(str))) {
                return false;
            }
        }
        return true;
    }

    public static boolean equal(Object a, Object b) {
        if (a != b) {
            return a != null && a.equals(b);
        }
        return true;
    }

    public static int hashCode(Object... objects) {
        return Arrays.hashCode(objects);
    }

    public static ToStringHelper toStringHelper(Object object) {
        return new ToStringHelper(object, null);
    }
}
