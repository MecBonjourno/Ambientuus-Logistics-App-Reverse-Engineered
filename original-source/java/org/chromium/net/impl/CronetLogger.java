package org.chromium.net.impl;

import j$.time.Duration;

/* loaded from: classes17.dex */
public abstract class CronetLogger {

    public enum CronetSource {
        CRONET_SOURCE_UNSPECIFIED,
        CRONET_SOURCE_STATICALLY_LINKED,
        CRONET_SOURCE_PLAY_SERVICES,
        CRONET_SOURCE_FALLBACK,
        CRONET_SOURCE_PLATFORM
    }

    public abstract void logCronetEngineCreation(int i, CronetEngineBuilderInfo cronetEngineBuilderInfo, CronetVersion cronetVersion, CronetSource cronetSource);

    public abstract void logCronetTrafficInfo(int i, CronetTrafficInfo cronetTrafficInfo);

    public static class CronetEngineBuilderInfo {
        private final boolean mBrotiEnabled;
        private final String mExperimentalOptions;
        private final boolean mHttp2Enabled;
        private final int mHttpCacheMode;
        private final boolean mNetworkQualityEstimatorEnabled;
        private final boolean mPublicKeyPinningBypassForLocalTrustAnchorsEnabled;
        private final boolean mQuicEnabled;
        private final String mStoragePath;
        private final int mThreadPriority;
        private final String mUserAgent;

        public CronetEngineBuilderInfo(CronetEngineBuilderImpl builder) {
            this.mPublicKeyPinningBypassForLocalTrustAnchorsEnabled = builder.publicKeyPinningBypassForLocalTrustAnchorsEnabled();
            this.mUserAgent = builder.getUserAgent();
            this.mStoragePath = builder.storagePath();
            this.mQuicEnabled = builder.quicEnabled();
            this.mHttp2Enabled = builder.http2Enabled();
            this.mBrotiEnabled = builder.brotliEnabled();
            this.mHttpCacheMode = builder.publicBuilderHttpCacheMode();
            this.mExperimentalOptions = builder.experimentalOptions();
            this.mNetworkQualityEstimatorEnabled = builder.networkQualityEstimatorEnabled();
            this.mThreadPriority = builder.threadPriority(10);
        }

        public boolean isPublicKeyPinningBypassForLocalTrustAnchorsEnabled() {
            return this.mPublicKeyPinningBypassForLocalTrustAnchorsEnabled;
        }

        public String getUserAgent() {
            return this.mUserAgent;
        }

        public String getStoragePath() {
            return this.mStoragePath;
        }

        public boolean isQuicEnabled() {
            return this.mQuicEnabled;
        }

        public boolean isHttp2Enabled() {
            return this.mHttp2Enabled;
        }

        public boolean isBrotliEnabled() {
            return this.mBrotiEnabled;
        }

        public int getHttpCacheMode() {
            return this.mHttpCacheMode;
        }

        public String getExperimentalOptions() {
            return this.mExperimentalOptions;
        }

        public boolean isNetworkQualityEstimatorEnabled() {
            return this.mNetworkQualityEstimatorEnabled;
        }

        public int getThreadPriority() {
            return this.mThreadPriority;
        }
    }

    public static class CronetTrafficInfo {
        private final boolean mDidConnectionMigrationSucceed;
        private final Duration mHeadersLatency;
        private final String mNegotiatedProtocol;
        private final long mRequestBodySizeInBytes;
        private final long mRequestHeaderSizeInBytes;
        private final long mResponseBodySizeInBytes;
        private final long mResponseHeaderSizeInBytes;
        private final int mResponseStatusCode;
        private final Duration mTotalLatency;
        private final boolean mWasConnectionMigrationAttempted;

        public CronetTrafficInfo(long requestHeaderSizeInBytes, long requestBodySizeInBytes, long responseHeaderSizeInBytes, long responseBodySizeInBytes, int responseStatusCode, Duration headersLatency, Duration totalLatency, String negotiatedProtocol, boolean wasConnectionMigrationAttempted, boolean didConnectionMigrationSucceed) {
            this.mRequestHeaderSizeInBytes = requestHeaderSizeInBytes;
            this.mRequestBodySizeInBytes = requestBodySizeInBytes;
            this.mResponseHeaderSizeInBytes = responseHeaderSizeInBytes;
            this.mResponseBodySizeInBytes = responseBodySizeInBytes;
            this.mResponseStatusCode = responseStatusCode;
            this.mHeadersLatency = headersLatency;
            this.mTotalLatency = totalLatency;
            this.mNegotiatedProtocol = negotiatedProtocol;
            this.mWasConnectionMigrationAttempted = wasConnectionMigrationAttempted;
            this.mDidConnectionMigrationSucceed = didConnectionMigrationSucceed;
        }

        public long getRequestHeaderSizeInBytes() {
            return this.mRequestHeaderSizeInBytes;
        }

        public long getRequestBodySizeInBytes() {
            return this.mRequestBodySizeInBytes;
        }

        public long getResponseHeaderSizeInBytes() {
            return this.mResponseHeaderSizeInBytes;
        }

        public long getResponseBodySizeInBytes() {
            return this.mResponseBodySizeInBytes;
        }

        public int getResponseStatusCode() {
            return this.mResponseStatusCode;
        }

        public Duration getHeadersLatency() {
            return this.mHeadersLatency;
        }

        public Duration getTotalLatency() {
            return this.mTotalLatency;
        }

        public String getNegotiatedProtocol() {
            return this.mNegotiatedProtocol;
        }

        public boolean wasConnectionMigrationAttempted() {
            return this.mWasConnectionMigrationAttempted;
        }

        public boolean didConnectionMigrationSucceed() {
            return this.mDidConnectionMigrationSucceed;
        }
    }

    public static class CronetVersion {
        private final int mBuildVersion;
        private final int mMajorVersion;
        private final int mMinorVersion;
        private final int mPatchVersion;

        public CronetVersion(String version) {
            String[] splitVersion = version.split("\\.");
            this.mMajorVersion = Integer.parseInt(splitVersion[0]);
            this.mMinorVersion = Integer.parseInt(splitVersion[1]);
            this.mBuildVersion = Integer.parseInt(splitVersion[2]);
            this.mPatchVersion = Integer.parseInt(splitVersion[3]);
        }

        public int getMajorVersion() {
            return this.mMajorVersion;
        }

        public int getMinorVersion() {
            return this.mMinorVersion;
        }

        public int getBuildVersion() {
            return this.mBuildVersion;
        }

        public int getPatchVersion() {
            return this.mPatchVersion;
        }

        public String toString() {
            return this.mMajorVersion + "." + this.mMinorVersion + "." + this.mBuildVersion + "." + this.mPatchVersion;
        }
    }
}
