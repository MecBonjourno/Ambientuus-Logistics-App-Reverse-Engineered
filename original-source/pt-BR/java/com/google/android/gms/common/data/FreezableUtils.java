package com.google.android.gms.common.data;

import java.util.ArrayList;
import java.util.Iterator;
import org.chromium.net.impl.CronetUrlRequest;

/* compiled from: com.google.android.gms:play-services-base@@18.4.0 */
/* carregado de: classes16.dex */
public final class FreezableUtils {
    public static <T, E extends Freezable<T>> ArrayList<T> freeze(ArrayList<E> arrayList) {
        CronetUrlRequest.HeadersList headersList = (ArrayList<T>) new ArrayList(arrayList.size());
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            headersList.add(arrayList.get(i).freeze());
        }
        return headersList;
    }

    public static <T, E extends Freezable<T>> ArrayList<T> freezeIterable(Iterable<E> iterable) {
        CronetUrlRequest.HeadersList headersList = (ArrayList<T>) new ArrayList();
        Iterator<E> it = iterable.iterator();
        while (it.hasNext()) {
            headersList.add(it.next().freeze());
        }
        return headersList;
    }

    public static <T, E extends Freezable<T>> ArrayList<T> freeze(E[] eArr) {
        CronetUrlRequest.HeadersList headersList = (ArrayList<T>) new ArrayList(eArr.length);
        for (E e : eArr) {
            headersList.add(e.freeze());
        }
        return headersList;
    }
}
