package org.chromium.net.impl;

import org.chromium.net.QuicException;

/* carregado de: classes17.dex */
public class QuicExceptionImpl extends QuicException {
    private final NetworkExceptionImpl mNetworkException;
    private final int mQuicDetailedErrorCode;

    public QuicExceptionImpl(String message, int errorCode, int netErrorCode, int quicDetailedErrorCode) {
        super(message, null);
        this.mNetworkException = new NetworkExceptionImpl(message, errorCode, netErrorCode);
        this.mQuicDetailedErrorCode = quicDetailedErrorCode;
    }

    @Override // java.lang.Throwable
    public String getMessage() {
        StringBuilder b = new StringBuilder(this.mNetworkException.getMessage());
        b.append(", QuicDetailedErrorCode=").append(this.mQuicDetailedErrorCode);
        return b.toString();
    }

    @Override // org.chromium.net.NetworkException
    public int getErrorCode() {
        return this.mNetworkException.getErrorCode();
    }

    @Override // org.chromium.net.NetworkException
    public int getCronetInternalErrorCode() {
        return this.mNetworkException.getCronetInternalErrorCode();
    }

    @Override // org.chromium.net.NetworkException
    public boolean immediatelyRetryable() {
        return this.mNetworkException.immediatelyRetryable();
    }

    @Override // org.chromium.net.QuicException
    public int getQuicDetailedErrorCode() {
        return this.mQuicDetailedErrorCode;
    }
}
