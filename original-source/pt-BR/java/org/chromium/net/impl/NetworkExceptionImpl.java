package org.chromium.net.impl;

import org.chromium.net.NetworkException;

/* carregado de: classes17.dex */
public class NetworkExceptionImpl extends NetworkException {
    static final /* sintético */ boolean $assertionsDisabled = false;
    protected final int mCronetInternalErrorCode;
    protected final int mErrorCode;

    public NetworkExceptionImpl(String message, int errorCode, int cronetInternalErrorCode) {
        super(message, null);
        if (errorCode <= 0 || errorCode >= 12) {
            throw new AssertionError();
        }
        if (cronetInternalErrorCode >= 0) {
            throw new AssertionError();
        }
        this.mErrorCode = errorCode;
        this.mCronetInternalErrorCode = cronetInternalErrorCode;
    }

    @Override // org.chromium.net.NetworkException
    public int getErrorCode() {
        return this.mErrorCode;
    }

    @Override // org.chromium.net.NetworkException
    public int getCronetInternalErrorCode() {
        return this.mCronetInternalErrorCode;
    }

    @Override // org.chromium.net.NetworkException
    public boolean immediatelyRetryable() {
        switch (this.mErrorCode) {
            case 3:
            case 4:
            case 5:
            case 6:
            case 8:
                return true;
            case 7:
            default:
                return false;
        }
    }

    @Override // java.lang.Throwable
    public String getMessage() {
        StringBuilder b = new StringBuilder(super.getMessage());
        b.append(", ErrorCode=").append(this.mErrorCode);
        if (this.mCronetInternalErrorCode != 0) {
            b.append(", InternalErrorCode=").append(this.mCronetInternalErrorCode);
        }
        b.append(", Retryable=").append(immediatelyRetryable());
        return b.toString();
    }
}
