package com.google.api.client.auth.oauth;

/* loaded from: classes16.dex */
public class OAuthGetTemporaryToken extends AbstractOAuthGetToken {
    public String callback;

    public OAuthGetTemporaryToken(String authorizationServerUrl) {
        super(authorizationServerUrl);
    }

    @Override // com.google.api.client.auth.oauth.AbstractOAuthGetToken
    public OAuthParameters createParameters() {
        OAuthParameters result = super.createParameters();
        result.callback = this.callback;
        return result;
    }
}
