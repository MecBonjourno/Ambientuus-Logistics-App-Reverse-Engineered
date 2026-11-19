package com.google.android.gms.fido.fido2.api.common;

import android.net.Uri;

/* compiled from: com.google.android.gms:play-services-fido@@21.0.0 */
/* carregado de: classes16.dex */
public abstract class BrowserRequestOptions extends RequestOptions {
    public abstract byte[] getClientDataHash();

    public abstract Uri getOrigin();
}
