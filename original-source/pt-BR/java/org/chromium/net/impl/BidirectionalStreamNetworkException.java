package org.chromium.net.impl;

import org.chromium.net.NetError;

/* carregado de: classes17.dex */
public class BidirectionalStreamNetworkException extends NetworkExceptionImpl {
    static final /* sintético */ boolean $assertionsDisabled = false;

    public BidirectionalStreamNetworkException(String message, int errorCode, int cronetInternalErrorCode) {
        super(message, errorCode, cronetInternalErrorCode);
    }

    @Override // org.chromium.net.impl.NetworkExceptionImpl, org.chromium.net.NetworkException
    public boolean immediatelyRetryable() {
        switch (this.mCronetInternalErrorCode) {
            case NetError.ERR_QUIC_HANDSHAKE_FAILED /* -358 */:
            case NetError.ERR_HTTP2_PING_FAILED /* -352 */:
                if (this.mErrorCode != 11) {
                    throw new AssertionError();
                }
                return true;
            default:
                return super.immediatelyRetryable();
        }
    }
}
