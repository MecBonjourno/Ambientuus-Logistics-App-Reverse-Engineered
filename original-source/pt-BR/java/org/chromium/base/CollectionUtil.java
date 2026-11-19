package org.chromium.base;

import android.util.Pair;
import com.google.protobuf.MapFieldLite;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

/* carregado de: classes17.dex */
public final class CollectionUtil {
    private CollectionUtil() {
    }

    @SafeVarargs
    public static <E> HashSet<E> newHashSet(E... elements) {
        HashSet<E> set = new HashSet<>(elements.length);
        Collections.addAll(set, elements);
        return set;
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @SafeVarargs
    public static <K, V> HashMap<K, V> newHashMap(Pair<? extends K, ? extends V>... pairArr) {
        MapFieldLite mapFieldLite = (HashMap<K, V>) new HashMap();
        for (Pair<? extends K, ? extends V> pair : pairArr) {
            mapFieldLite.put(pair.first, pair.second);
        }
        return mapFieldLite;
    }

    public static boolean[] booleanListToBooleanArray(List<Boolean> list) {
        boolean[] array = new boolean[list.size()];
        for (int i = 0; i < list.size(); i++) {
            array[i] = list.get(i).booleanValue();
        }
        return array;
    }

    public static int[] integerCollectionToIntArray(Collection<Integer> collection) {
        int[] array = new int[collection.size()];
        int index = 0;
        Iterator<Integer> it = collection.iterator();
        while (it.hasNext()) {
            int num = it.next().intValue();
            array[index] = num;
            index++;
        }
        return array;
    }

    public static long[] longListToLongArray(List<Long> list) {
        long[] array = new long[list.size()];
        for (int i = 0; i < list.size(); i++) {
            array[i] = list.get(i).longValue();
        }
        return array;
    }

    public static <T> List<T> strengthen(Collection<WeakReference<T>> weakRefs) {
        ArrayList<T> ret = new ArrayList<>(weakRefs.size());
        Iterator<WeakReference<T>> it = weakRefs.iterator();
        while (it.hasNext()) {
            WeakReference<T> weakRef = it.next();
            T strongRef = weakRef.get();
            if (strongRef == null) {
                it.remove();
            } else {
                ret.add(strongRef);
            }
        }
        return ret;
    }
}
