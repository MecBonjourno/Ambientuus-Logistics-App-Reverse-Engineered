package com.google.android.gms.common.api;

import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.ApiOptions;
import com.google.android.gms.common.api.internal.ApiKey;

/* compiled from: com.google.android.gms:play-services-base@@18.4.0 */
/* carregado de: classes16.dex */
public interface HasApiKey<O extends Api.ApiOptions> {
    ApiKey<O> getApiKey();
}
