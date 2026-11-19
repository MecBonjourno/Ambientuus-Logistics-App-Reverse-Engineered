package com.google.android.gms.identitycredentials.internal;

import android.content.Context;
import android.os.Looper;
import androidx.constraintlayout.widget.ConstraintLayout;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.internal.ConnectionCallbacks;
import com.google.android.gms.common.api.internal.OnConnectionFailedListener;
import com.google.android.gms.common.internal.ClientSettings;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: com.google.android.gms:play-services-identity-credentials@@16.0.0-alpha02 */
@Metadata(d1 = {"\u0000\u001d\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000*\u0001\u0004\"\u0014\u0010\u0000\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u0010\u0010\u0003\u001a\u00020\u0004X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0005\"\u0014\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u0007X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\t"}, d2 = {"CLIENT_KEY", "Lcom/google/android/gms/common/api/Api$ClientKey;", "Lcom/google/android/gms/identitycredentials/internal/IdentityCredentialClientImpl;", "clientBuilder", "com/google/android/gms/identitycredentials/internal/InternalIdentityCredentialClientKt$clientBuilder$1", "Lcom/google/android/gms/identitycredentials/internal/InternalIdentityCredentialClientKt$clientBuilder$1;", "API", "Lcom/google/android/gms/common/api/Api;", "Lcom/google/android/gms/common/api/Api$ApiOptions$NoOptions;", "java.com.google.android.gmscore.integ.client.identity_credentials_identity_credentials"}, k = 2, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes16.dex */
public final class InternalIdentityCredentialClientKt {
    private static final Api.ClientKey<IdentityCredentialClientImpl> CLIENT_KEY = new Api.ClientKey<>();
    private static final InternalIdentityCredentialClientKt$clientBuilder$1 clientBuilder = new Api.AbstractClientBuilder<IdentityCredentialClientImpl, Api.ApiOptions.NoOptions>() { // da classe: com.google.android.gms.identitycredentials.internal.InternalIdentityCredentialClientKt$clientBuilder$1
        @Override // com.google.android.gms.common.api.Api.AbstractClientBuilder
        public IdentityCredentialClientImpl buildClient(Context context, Looper looper, ClientSettings commonSettings, Api.ApiOptions.NoOptions apiOptions, ConnectionCallbacks connectedListener, OnConnectionFailedListener connectionFailedListener) {
            Intrinsics.checkNotNullParameter(context, "context");
            Intrinsics.checkNotNullParameter(looper, "looper");
            Intrinsics.checkNotNullParameter(commonSettings, "commonSettings");
            Intrinsics.checkNotNullParameter(apiOptions, "apiOptions");
            Intrinsics.checkNotNullParameter(connectedListener, "connectedListener");
            Intrinsics.checkNotNullParameter(connectionFailedListener, "connectionFailedListener");
            return new IdentityCredentialClientImpl(context, looper, commonSettings, connectedListener, connectionFailedListener);
        }
    };
    private static final Api<Api.ApiOptions.NoOptions> API = new Api<>("IdentityCredentials.API", clientBuilder, CLIENT_KEY);
}
