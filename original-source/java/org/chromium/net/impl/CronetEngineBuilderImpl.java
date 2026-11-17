package org.chromium.net.impl;

import android.content.Context;
import android.util.Base64;
import androidx.credentials.exceptions.publickeycredential.DomExceptionUtils;
import java.io.File;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.net.IDN;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;
import org.chromium.net.CronetEngine;
import org.chromium.net.ICronetEngineBuilder;
import org.chromium.net.impl.VersionSafeCallbacks;

/* loaded from: classes17.dex */
public abstract class CronetEngineBuilderImpl extends ICronetEngineBuilder {
    private static final Pattern INVALID_PKP_HOST_NAME = Pattern.compile("^[0-9\\.]*$");
    private static final int INVALID_THREAD_PRIORITY = 20;
    private final Context mApplicationContext;
    private boolean mBrotiEnabled;
    private boolean mDisableCache;
    private String mExperimentalOptions;
    private boolean mHttp2Enabled;
    private long mHttpCacheMaxSize;
    private HttpCacheMode mHttpCacheMode;
    protected long mMockCertVerifier;
    private boolean mNetworkQualityEstimatorEnabled;
    private boolean mPublicKeyPinningBypassForLocalTrustAnchorsEnabled;
    private boolean mQuicEnabled;
    private String mStoragePath;
    private String mUserAgent;
    private final List<QuicHint> mQuicHints = new LinkedList();
    private final List<Pkp> mPkps = new LinkedList();
    private int mThreadPriority = 20;

    @Retention(RetentionPolicy.SOURCE)
    public @interface HttpCacheSetting {
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public /* bridge */ /* synthetic */ ICronetEngineBuilder addPublicKeyPins(String str, Set set, boolean z, Date date) {
        return addPublicKeyPins(str, (Set<byte[]>) set, z, date);
    }

    public static class QuicHint {
        final int mAlternatePort;
        final String mHost;
        final int mPort;

        QuicHint(String host, int port, int alternatePort) {
            this.mHost = host;
            this.mPort = port;
            this.mAlternatePort = alternatePort;
        }
    }

    public static class Pkp {
        final Date mExpirationDate;
        final byte[][] mHashes;
        final String mHost;
        final boolean mIncludeSubdomains;

        Pkp(String host, byte[][] hashes, boolean includeSubdomains, Date expirationDate) {
            this.mHost = host;
            this.mHashes = hashes;
            this.mIncludeSubdomains = includeSubdomains;
            this.mExpirationDate = expirationDate;
        }
    }

    enum HttpCacheMode {
        DISABLED(0, false),
        DISK(1, true),
        DISK_NO_HTTP(1, false),
        MEMORY(2, true);

        private final boolean mContentCacheEnabled;
        private final int mType;

        HttpCacheMode(int type, boolean contentCacheEnabled) {
            this.mContentCacheEnabled = contentCacheEnabled;
            this.mType = type;
        }

        int getType() {
            return this.mType;
        }

        boolean isContentCacheEnabled() {
            return this.mContentCacheEnabled;
        }

        int toPublicBuilderCacheMode() {
            switch (this) {
                case DISABLED:
                    return 0;
                case DISK_NO_HTTP:
                    return 2;
                case DISK:
                    return 3;
                case MEMORY:
                    return 1;
                default:
                    throw new IllegalArgumentException("Unknown internal builder cache mode");
            }
        }

        static HttpCacheMode fromPublicBuilderCacheMode(int cacheMode) {
            switch (cacheMode) {
                case 0:
                    return DISABLED;
                case 1:
                    return MEMORY;
                case 2:
                    return DISK_NO_HTTP;
                case 3:
                    return DISK;
                default:
                    throw new IllegalArgumentException("Unknown public builder cache mode");
            }
        }
    }

    public CronetEngineBuilderImpl(Context context) {
        this.mApplicationContext = context.getApplicationContext();
        enableQuic(true);
        enableHttp2(true);
        enableBrotli(false);
        enableHttpCache(0, 0L);
        enableNetworkQualityEstimator(false);
        enablePublicKeyPinningBypassForLocalTrustAnchors(true);
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public String getDefaultUserAgent() {
        return UserAgent.from(this.mApplicationContext);
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public CronetEngineBuilderImpl setUserAgent(String userAgent) {
        this.mUserAgent = userAgent;
        return this;
    }

    String getUserAgent() {
        return this.mUserAgent;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public CronetEngineBuilderImpl setStoragePath(String value) {
        if (!new File(value).isDirectory()) {
            throw new IllegalArgumentException("Storage path must be set to existing directory");
        }
        this.mStoragePath = value;
        return this;
    }

    String storagePath() {
        return this.mStoragePath;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public CronetEngineBuilderImpl setLibraryLoader(CronetEngine.Builder.LibraryLoader loader) {
        return this;
    }

    VersionSafeCallbacks.LibraryLoader libraryLoader() {
        return null;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public CronetEngineBuilderImpl enableQuic(boolean value) {
        this.mQuicEnabled = value;
        return this;
    }

    boolean quicEnabled() {
        return this.mQuicEnabled;
    }

    String getDefaultQuicUserAgentId() {
        return this.mQuicEnabled ? UserAgent.getQuicUserAgentIdFrom(this.mApplicationContext) : "";
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public CronetEngineBuilderImpl enableHttp2(boolean value) {
        this.mHttp2Enabled = value;
        return this;
    }

    boolean http2Enabled() {
        return this.mHttp2Enabled;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public CronetEngineBuilderImpl enableSdch(boolean value) {
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public CronetEngineBuilderImpl enableBrotli(boolean value) {
        this.mBrotiEnabled = value;
        return this;
    }

    boolean brotliEnabled() {
        return this.mBrotiEnabled;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public CronetEngineBuilderImpl enableHttpCache(int cacheMode, long maxSize) {
        HttpCacheMode cacheModeEnum = HttpCacheMode.fromPublicBuilderCacheMode(cacheMode);
        if (cacheModeEnum.getType() == 1 && storagePath() == null) {
            throw new IllegalArgumentException("Storage path must be set");
        }
        this.mHttpCacheMode = cacheModeEnum;
        this.mHttpCacheMaxSize = maxSize;
        return this;
    }

    boolean cacheDisabled() {
        return !this.mHttpCacheMode.isContentCacheEnabled();
    }

    long httpCacheMaxSize() {
        return this.mHttpCacheMaxSize;
    }

    int httpCacheMode() {
        return this.mHttpCacheMode.getType();
    }

    int publicBuilderHttpCacheMode() {
        return this.mHttpCacheMode.toPublicBuilderCacheMode();
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public CronetEngineBuilderImpl addQuicHint(String host, int port, int alternatePort) {
        if (host.contains(DomExceptionUtils.SEPARATOR)) {
            throw new IllegalArgumentException("Illegal QUIC Hint Host: " + host);
        }
        this.mQuicHints.add(new QuicHint(host, port, alternatePort));
        return this;
    }

    List<QuicHint> quicHints() {
        return this.mQuicHints;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public CronetEngineBuilderImpl addPublicKeyPins(String hostName, Set<byte[]> pinsSha256, boolean includeSubdomains, Date expirationDate) {
        if (hostName == null) {
            throw new NullPointerException("The hostname cannot be null");
        }
        if (pinsSha256 == null) {
            throw new NullPointerException("The set of SHA256 pins cannot be null");
        }
        if (expirationDate == null) {
            throw new NullPointerException("The pin expiration date cannot be null");
        }
        String idnHostName = validateHostNameForPinningAndConvert(hostName);
        Map<String, byte[]> hashes = new HashMap<>();
        for (byte[] pinSha256 : pinsSha256) {
            if (pinSha256 == null || pinSha256.length != 32) {
                throw new IllegalArgumentException("Public key pin is invalid");
            }
            hashes.put(Base64.encodeToString(pinSha256, 0), pinSha256);
        }
        this.mPkps.add(new Pkp(idnHostName, (byte[][]) hashes.values().toArray(new byte[hashes.size()][]), includeSubdomains, expirationDate));
        return this;
    }

    List<Pkp> publicKeyPins() {
        return this.mPkps;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public CronetEngineBuilderImpl enablePublicKeyPinningBypassForLocalTrustAnchors(boolean value) {
        this.mPublicKeyPinningBypassForLocalTrustAnchorsEnabled = value;
        return this;
    }

    boolean publicKeyPinningBypassForLocalTrustAnchorsEnabled() {
        return this.mPublicKeyPinningBypassForLocalTrustAnchorsEnabled;
    }

    private static String validateHostNameForPinningAndConvert(String hostName) throws IllegalArgumentException {
        if (INVALID_PKP_HOST_NAME.matcher(hostName).matches()) {
            throw new IllegalArgumentException("Hostname " + hostName + " is illegal. A hostname should not consist of digits and/or dots only.");
        }
        if (hostName.length() > 255) {
            throw new IllegalArgumentException("Hostname " + hostName + " is too long. The name of the host does not comply with RFC 1122 and RFC 1123.");
        }
        try {
            return IDN.toASCII(hostName, 2);
        } catch (IllegalArgumentException e) {
            throw new IllegalArgumentException("Hostname " + hostName + " is illegal. The name of the host does not comply with RFC 1122 and RFC 1123.");
        }
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public CronetEngineBuilderImpl setExperimentalOptions(String options) {
        this.mExperimentalOptions = options;
        return this;
    }

    public String experimentalOptions() {
        return this.mExperimentalOptions;
    }

    public CronetEngineBuilderImpl setMockCertVerifierForTesting(long mockCertVerifier) {
        this.mMockCertVerifier = mockCertVerifier;
        return this;
    }

    long mockCertVerifier() {
        return this.mMockCertVerifier;
    }

    boolean networkQualityEstimatorEnabled() {
        return this.mNetworkQualityEstimatorEnabled;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public CronetEngineBuilderImpl enableNetworkQualityEstimator(boolean value) {
        this.mNetworkQualityEstimatorEnabled = value;
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public CronetEngineBuilderImpl setThreadPriority(int priority) {
        if (priority > 19 || priority < -20) {
            throw new IllegalArgumentException("Thread priority invalid");
        }
        this.mThreadPriority = priority;
        return this;
    }

    int threadPriority(int defaultThreadPriority) {
        return this.mThreadPriority == 20 ? defaultThreadPriority : this.mThreadPriority;
    }

    Context getContext() {
        return this.mApplicationContext;
    }
}
