package com.google.android.gms.internal.common;

import j$.util.Objects;

/* compiled from: com.google.android.gms:play-services-basement@@18.8.0 */
/* carregado de: classes16.dex */
public final class zzq {
    static final CharSequence zza(Object obj, String str) {
        Objects.requireNonNull(obj);
        return obj instanceof CharSequence ? (CharSequence) obj : obj.toString();
    }
}
