package com.google.api.client.auth.oauth;

import java.security.GeneralSecurityException;

/* carregado de: classes16.dex */
public interface OAuthSigner {
    String computeSignature(String str) throws GeneralSecurityException;

    String getSignatureMethod();
}
