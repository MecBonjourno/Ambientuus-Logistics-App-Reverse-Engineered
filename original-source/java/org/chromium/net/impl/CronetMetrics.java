package org.chromium.net.impl;

import java.util.Date;
import org.chromium.net.RequestFinishedInfo;

/* loaded from: classes17.dex */
public final class CronetMetrics extends RequestFinishedInfo.Metrics {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private final long mConnectEndMs;
    private final long mConnectStartMs;
    private final long mDnsEndMs;
    private final long mDnsStartMs;
    private final long mPushEndMs;
    private final long mPushStartMs;
    private final Long mReceivedByteCount;
    private final long mRequestEndMs;
    private final long mRequestStartMs;
    private final long mResponseStartMs;
    private final long mSendingEndMs;
    private final long mSendingStartMs;
    private final Long mSentByteCount;
    private final boolean mSocketReused;
    private final long mSslEndMs;
    private final long mSslStartMs;
    private final Long mTotalTimeMs;
    private final Long mTtfbMs;

    private static Date toDate(long timestamp) {
        if (timestamp != -1) {
            return new Date(timestamp);
        }
        return null;
    }

    private static boolean checkOrder(long start, long end) {
        return (end >= start && start != -1) || end == -1;
    }

    public CronetMetrics(Long ttfbMs, Long totalTimeMs, Long sentByteCount, Long receivedByteCount) {
        this.mTtfbMs = ttfbMs;
        this.mTotalTimeMs = totalTimeMs;
        this.mSentByteCount = sentByteCount;
        this.mReceivedByteCount = receivedByteCount;
        this.mRequestStartMs = -1L;
        this.mDnsStartMs = -1L;
        this.mDnsEndMs = -1L;
        this.mConnectStartMs = -1L;
        this.mConnectEndMs = -1L;
        this.mSslStartMs = -1L;
        this.mSslEndMs = -1L;
        this.mSendingStartMs = -1L;
        this.mSendingEndMs = -1L;
        this.mPushStartMs = -1L;
        this.mPushEndMs = -1L;
        this.mResponseStartMs = -1L;
        this.mRequestEndMs = -1L;
        this.mSocketReused = false;
    }

    public CronetMetrics(long requestStartMs, long dnsStartMs, long dnsEndMs, long connectStartMs, long connectEndMs, long sslStartMs, long sslEndMs, long sendingStartMs, long sendingEndMs, long pushStartMs, long pushEndMs, long responseStartMs, long requestEndMs, boolean socketReused, long sentByteCount, long receivedByteCount) {
        if (!checkOrder(dnsStartMs, dnsEndMs)) {
            throw new AssertionError();
        }
        if (!checkOrder(connectStartMs, connectEndMs)) {
            throw new AssertionError();
        }
        if (!checkOrder(sslStartMs, sslEndMs)) {
            throw new AssertionError();
        }
        if (!checkOrder(sendingStartMs, sendingEndMs)) {
            throw new AssertionError();
        }
        if (!checkOrder(pushStartMs, pushEndMs)) {
            throw new AssertionError();
        }
        if (requestEndMs < responseStartMs) {
            throw new AssertionError();
        }
        if (dnsStartMs < requestStartMs && dnsStartMs != -1) {
            throw new AssertionError();
        }
        if (sendingStartMs < requestStartMs && sendingStartMs != -1) {
            throw new AssertionError();
        }
        if (sslStartMs < connectStartMs && sslStartMs != -1) {
            throw new AssertionError();
        }
        if (responseStartMs < sendingStartMs && responseStartMs != -1) {
            throw new AssertionError();
        }
        this.mRequestStartMs = requestStartMs;
        this.mDnsStartMs = dnsStartMs;
        this.mDnsEndMs = dnsEndMs;
        this.mConnectStartMs = connectStartMs;
        this.mConnectEndMs = connectEndMs;
        this.mSslStartMs = sslStartMs;
        this.mSslEndMs = sslEndMs;
        this.mSendingStartMs = sendingStartMs;
        this.mSendingEndMs = sendingEndMs;
        this.mPushStartMs = pushStartMs;
        this.mPushEndMs = pushEndMs;
        this.mResponseStartMs = responseStartMs;
        this.mRequestEndMs = requestEndMs;
        this.mSocketReused = socketReused;
        this.mSentByteCount = Long.valueOf(sentByteCount);
        this.mReceivedByteCount = Long.valueOf(receivedByteCount);
        if (requestStartMs != -1 && responseStartMs != -1) {
            this.mTtfbMs = Long.valueOf(responseStartMs - requestStartMs);
        } else {
            this.mTtfbMs = null;
        }
        if (requestStartMs != -1 && requestEndMs != -1) {
            this.mTotalTimeMs = Long.valueOf(requestEndMs - requestStartMs);
        } else {
            this.mTotalTimeMs = null;
        }
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public Date getRequestStart() {
        return toDate(this.mRequestStartMs);
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public Date getDnsStart() {
        return toDate(this.mDnsStartMs);
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public Date getDnsEnd() {
        return toDate(this.mDnsEndMs);
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public Date getConnectStart() {
        return toDate(this.mConnectStartMs);
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public Date getConnectEnd() {
        return toDate(this.mConnectEndMs);
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public Date getSslStart() {
        return toDate(this.mSslStartMs);
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public Date getSslEnd() {
        return toDate(this.mSslEndMs);
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public Date getSendingStart() {
        return toDate(this.mSendingStartMs);
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public Date getSendingEnd() {
        return toDate(this.mSendingEndMs);
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public Date getPushStart() {
        return toDate(this.mPushStartMs);
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public Date getPushEnd() {
        return toDate(this.mPushEndMs);
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public Date getResponseStart() {
        return toDate(this.mResponseStartMs);
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public Date getRequestEnd() {
        return toDate(this.mRequestEndMs);
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public boolean getSocketReused() {
        return this.mSocketReused;
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public Long getTtfbMs() {
        return this.mTtfbMs;
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public Long getTotalTimeMs() {
        return this.mTotalTimeMs;
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public Long getSentByteCount() {
        return this.mSentByteCount;
    }

    @Override // org.chromium.net.RequestFinishedInfo.Metrics
    public Long getReceivedByteCount() {
        return this.mReceivedByteCount;
    }
}
