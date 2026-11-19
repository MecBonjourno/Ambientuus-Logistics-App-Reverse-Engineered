package com.google.android.gms.auth.api.signin;

import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.internal.PendingResultUtil;

/* compiled from: com.google.android.gms:play-services-auth@@21.4.0 */
/* carregado de: classes16.dex */
final class zba implements PendingResultUtil.ResultConverter {
    private zba() {
        throw null;
    }

    /* sintético */ zba(byte[] bArr) {
    }

    @Override // com.google.android.gms.common.internal.PendingResultUtil.ResultConverter
    public final /* sintético */ Object convert(Result result) {
        return ((GoogleSignInResult) result).getSignInAccount();
    }
}
