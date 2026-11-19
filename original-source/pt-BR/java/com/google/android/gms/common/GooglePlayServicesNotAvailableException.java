package com.google.android.gms.common;

/* compiled from: com.google.android.gms:play-services-basement@@18.8.0 */
/* carregado de: classes16.dex */
public final class GooglePlayServicesNotAvailableException extends Exception {
    public final int errorCode;

    public GooglePlayServicesNotAvailableException(int errorCode) {
        this.errorCode = errorCode;
    }
}
