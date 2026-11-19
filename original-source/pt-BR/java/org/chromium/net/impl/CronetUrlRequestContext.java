package org.chromium.net.impl;

import android.os.ConditionVariable;
import androidx.credentials.exceptions.publickeycredential.DomExceptionUtils;
import java.net.Proxy;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLStreamHandlerFactory;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.atomic.AtomicInteger;
import org.chromium.base.Log;
import org.chromium.base.ObserverList;
import org.chromium.base.annotations.JNINamespace;
import org.chromium.base.annotations.NativeClassQualifiedName;
import org.chromium.net.BidirectionalStream;
import org.chromium.net.CronetEngine;
import org.chromium.net.ExperimentalBidirectionalStream;
import org.chromium.net.NetworkQualityRttListener;
import org.chromium.net.NetworkQualityThroughputListener;
import org.chromium.net.RequestContextConfigOptions;
import org.chromium.net.RequestFinishedInfo;
import org.chromium.net.UrlRequest;
import org.chromium.net.impl.CronetEngineBuilderImpl;
import org.chromium.net.impl.CronetLogger;
import org.chromium.net.impl.VersionSafeCallbacks;
import org.chromium.net.urlconnection.CronetHttpURLConnection;
import org.chromium.net.urlconnection.CronetURLStreamHandlerFactory;

@JNINamespace("cronet")
/* carregado de: classes17.dex */
public class CronetUrlRequestContext extends CronetEngineBase {
    static final String LOG_TAG = CronetUrlRequestContext.class.getSimpleName();
    private static final HashSet<String> sInUseStoragePaths = new HashSet<>();
    private final boolean mEnableTelemetry;
    private final String mInUseStoragePath;
    private boolean mIsLogging;
    private boolean mIsStoppingNetLog;
    private final CronetLogger mLogger;
    private final boolean mNetworkQualityEstimatorEnabled;
    private Thread mNetworkThread;
    private long mUrlRequestContextAdapter;
    private final Object mLock = new Object();
    private final ConditionVariable mInitCompleted = new ConditionVariable(false);
    private final AtomicInteger mRunningRequestCount = new AtomicInteger(0);
    private final AtomicInteger mActiveRequestCount = new AtomicInteger(0);
    private final Object mNetworkQualityLock = new Object();
    private final Object mFinishedListenerLock = new Object();
    private int mEffectiveConnectionType = 0;
    private int mHttpRttMs = -1;
    private int mTransportRttMs = -1;
    private int mDownstreamThroughputKbps = -1;
    private final ObserverList<VersionSafeCallbacks.NetworkQualityRttListenerWrapper> mRttListenerList = new ObserverList<>();
    private final ObserverList<VersionSafeCallbacks.NetworkQualityThroughputListenerWrapper> mThroughputListenerList = new ObserverList<>();
    private final Map<RequestFinishedInfo.Listener, VersionSafeCallbacks.RequestFinishedInfoListener> mFinishedListenerMap = new HashMap();
    private final ConditionVariable mStopNetLogCompleted = new ConditionVariable();
    private long mNetworkHandle = -1;
    private final int mCronetEngineId = hashCode();

    interface Natives {
        void addPkp(long j, String str, byte[][] bArr, boolean z, long j2);

        void addQuicHint(long j, String str, int i, int i2);

        @NativeClassQualifiedName("CronetContextAdapter")
        void configureNetworkQualityEstimatorForTesting(long j, CronetUrlRequestContext cronetUrlRequestContext, boolean z, boolean z2, boolean z3);

        long createRequestContextAdapter(long j);

        long createRequestContextConfig(byte[] bArr);

        @NativeClassQualifiedName("CronetContextAdapter")
        void destroy(long j, CronetUrlRequestContext cronetUrlRequestContext);

        @NativeClassQualifiedName("CronetContextAdapter")
        boolean getEnableTelemetry(long j, CronetUrlRequestContext cronetUrlRequestContext);

        byte[] getHistogramDeltas();

        @NativeClassQualifiedName("CronetContextAdapter")
        void initRequestContextOnInitThread(long j, CronetUrlRequestContext cronetUrlRequestContext);

        @NativeClassQualifiedName("CronetContextAdapter")
        void provideRTTObservations(long j, CronetUrlRequestContext cronetUrlRequestContext, boolean z);

        @NativeClassQualifiedName("CronetContextAdapter")
        void provideThroughputObservations(long j, CronetUrlRequestContext cronetUrlRequestContext, boolean z);

        @NativeClassQualifiedName("CronetContextAdapter")
        void startNetLogToDisk(long j, CronetUrlRequestContext cronetUrlRequestContext, String str, boolean z, int i);

        @NativeClassQualifiedName("CronetContextAdapter")
        boolean startNetLogToFile(long j, CronetUrlRequestContext cronetUrlRequestContext, String str, boolean z);

        @NativeClassQualifiedName("CronetContextAdapter")
        void stopNetLog(long j, CronetUrlRequestContext cronetUrlRequestContext);
    }

    @Override // org.chromium.net.impl.CronetEngineBase, org.chromium.net.ExperimentalCronetEngine, org.chromium.net.CronetEngine
    public /* bridge */ /* sintético */ UrlRequest.Builder newUrlRequestBuilder(String str, UrlRequest.Callback callback, Executor executor) {
        return super.newUrlRequestBuilder(str, callback, executor);
    }

    int getCronetEngineId() {
        return this.mCronetEngineId;
    }

    CronetLogger getCronetLogger() {
        return this.mLogger;
    }

    public boolean getEnableTelemetryForTesting() {
        return this.mEnableTelemetry;
    }

    public CronetUrlRequestContext(CronetEngineBuilderImpl builder) {
        this.mRttListenerList.disableThreadAsserts();
        this.mThroughputListenerList.disableThreadAsserts();
        this.mNetworkQualityEstimatorEnabled = builder.networkQualityEstimatorEnabled();
        CronetLibraryLoader.ensureInitialized(builder.getContext(), builder);
        if (builder.httpCacheMode() == 1) {
            this.mInUseStoragePath = builder.storagePath();
            synchronized (sInUseStoragePaths) {
                if (!sInUseStoragePaths.add(this.mInUseStoragePath)) {
                    throw new IllegalStateException("Disk cache storage path already in use");
                }
            }
        } else {
            this.mInUseStoragePath = null;
        }
        synchronized (this.mLock) {
            this.mUrlRequestContextAdapter = CronetUrlRequestContextJni.get().createRequestContextAdapter(createNativeUrlRequestContextConfig(builder));
            if (this.mUrlRequestContextAdapter == 0) {
                throw new NullPointerException("Context Adapter creation failed.");
            }
            this.mEnableTelemetry = CronetUrlRequestContextJni.get().getEnableTelemetry(this.mUrlRequestContextAdapter, this);
        }
        if (this.mEnableTelemetry) {
            this.mLogger = CronetLoggerFactory.createLogger(builder.getContext(), getCronetSource());
        } else {
            this.mLogger = CronetLoggerFactory.createNoOpLogger();
        }
        try {
            this.mLogger.logCronetEngineCreation(getCronetEngineId(), new CronetLogger.CronetEngineBuilderInfo(builder), buildCronetVersion(), getCronetSource());
        } catch (RuntimeException e) {
            Log.e(LOG_TAG, "Error while trying to log CronetEngine creation: ", (Throwable) e);
        }
        CronetLibraryLoader.postToInitThread(new Runnable() { // da classe: org.chromium.net.impl.CronetUrlRequestContext.1
            @Override // java.lang.Runnable
            public void run() {
                CronetLibraryLoader.ensureInitializedOnInitThread();
                synchronized (CronetUrlRequestContext.this.mLock) {
                    CronetUrlRequestContextJni.get().initRequestContextOnInitThread(CronetUrlRequestContext.this.mUrlRequestContextAdapter, CronetUrlRequestContext.this);
                }
            }
        });
    }

    static CronetLogger.CronetSource getCronetSource() {
        ClassLoader implClassLoader = CronetUrlRequest.class.getClassLoader();
        if (implClassLoader.toString().startsWith("java.lang.BootClassLoader")) {
            return CronetLogger.CronetSource.CRONET_SOURCE_PLATFORM;
        }
        ClassLoader apiClassLoader = CronetEngine.class.getClassLoader();
        return apiClassLoader.equals(implClassLoader) ? CronetLogger.CronetSource.CRONET_SOURCE_STATICALLY_LINKED : CronetLogger.CronetSource.CRONET_SOURCE_PLAY_SERVICES;
    }

    public static long createNativeUrlRequestContextConfig(CronetEngineBuilderImpl builder) {
        long urlRequestContextConfig = CronetUrlRequestContextJni.get().createRequestContextConfig(createRequestContextConfigOptions(builder).toByteArray());
        if (urlRequestContextConfig == 0) {
            throw new IllegalArgumentException("Experimental options parsing failed.");
        }
        for (CronetEngineBuilderImpl.QuicHint quicHint : builder.quicHints()) {
            CronetUrlRequestContextJni.get().addQuicHint(urlRequestContextConfig, quicHint.mHost, quicHint.mPort, quicHint.mAlternatePort);
        }
        for (CronetEngineBuilderImpl.Pkp pkp : builder.publicKeyPins()) {
            CronetUrlRequestContextJni.get().addPkp(urlRequestContextConfig, pkp.mHost, pkp.mHashes, pkp.mIncludeSubdomains, pkp.mExpirationDate.getTime());
        }
        return urlRequestContextConfig;
    }

    private static RequestContextConfigOptions createRequestContextConfigOptions(CronetEngineBuilderImpl engineBuilder) {
        RequestContextConfigOptions.Builder resultBuilder = RequestContextConfigOptions.newBuilder().setQuicEnabled(engineBuilder.quicEnabled()).setHttp2Enabled(engineBuilder.http2Enabled()).setBrotliEnabled(engineBuilder.brotliEnabled()).setDisableCache(engineBuilder.cacheDisabled()).setHttpCacheMode(engineBuilder.httpCacheMode()).setHttpCacheMaxSize(engineBuilder.httpCacheMaxSize()).setMockCertVerifier(engineBuilder.mockCertVerifier()).setEnableNetworkQualityEstimator(engineBuilder.networkQualityEstimatorEnabled()).setBypassPublicKeyPinningForLocalTrustAnchors(engineBuilder.publicKeyPinningBypassForLocalTrustAnchorsEnabled()).setNetworkThreadPriority(engineBuilder.threadPriority(10));
        if (engineBuilder.getUserAgent() != null) {
            resultBuilder.setUserAgent(engineBuilder.getUserAgent());
        }
        if (engineBuilder.storagePath() != null) {
            resultBuilder.setStoragePath(engineBuilder.storagePath());
        }
        if (engineBuilder.getDefaultQuicUserAgentId() != null) {
            resultBuilder.setQuicDefaultUserAgentId(engineBuilder.getDefaultQuicUserAgentId());
        }
        if (engineBuilder.experimentalOptions() != null) {
            resultBuilder.setExperimentalOptions(engineBuilder.experimentalOptions());
        }
        return resultBuilder.build();
    }

    @Override // org.chromium.net.impl.CronetEngineBase, org.chromium.net.ExperimentalCronetEngine, org.chromium.net.CronetEngine
    public ExperimentalBidirectionalStream.Builder newBidirectionalStreamBuilder(String url, BidirectionalStream.Callback callback, Executor executor) {
        return new BidirectionalStreamBuilderImpl(url, callback, executor, this);
    }

    @Override // org.chromium.net.impl.CronetEngineBase
    public UrlRequestBase createRequest(String url, UrlRequest.Callback callback, Executor executor, int priority, Collection<Object> requestAnnotations, boolean disableCache, boolean disableConnectionMigration, boolean allowDirectExecutor, boolean trafficStatsTagSet, int trafficStatsTag, boolean trafficStatsUidSet, int trafficStatsUid, RequestFinishedInfo.Listener requestFinishedListener, int idempotency, long networkHandle) {
        long networkHandle2;
        if (networkHandle != -1) {
            networkHandle2 = networkHandle;
        } else {
            networkHandle2 = this.mNetworkHandle;
        }
        synchronized (this.mLock) {
            try {
                try {
                    checkHaveAdapter();
                    return new CronetUrlRequest(this, url, priority, callback, executor, requestAnnotations, disableCache, disableConnectionMigration, allowDirectExecutor, trafficStatsTagSet, trafficStatsTag, trafficStatsUidSet, trafficStatsUid, requestFinishedListener, idempotency, networkHandle2);
                } catch (Throwable th) {
                    th = th;
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
            }
        }
    }

    @Override // org.chromium.net.impl.CronetEngineBase
    protected ExperimentalBidirectionalStream createBidirectionalStream(String url, BidirectionalStream.Callback callback, Executor executor, String httpMethod, List<Map.Entry<String, String>> requestHeaders, int priority, boolean delayRequestHeadersUntilFirstFlush, Collection<Object> requestAnnotations, boolean trafficStatsTagSet, int trafficStatsTag, boolean trafficStatsUidSet, int trafficStatsUid, long networkHandle) {
        long networkHandle2;
        if (networkHandle != -1) {
            networkHandle2 = networkHandle;
        } else {
            networkHandle2 = this.mNetworkHandle;
        }
        synchronized (this.mLock) {
            try {
                try {
                    checkHaveAdapter();
                    return new CronetBidirectionalStream(this, url, priority, callback, executor, httpMethod, requestHeaders, delayRequestHeadersUntilFirstFlush, requestAnnotations, trafficStatsTagSet, trafficStatsTag, trafficStatsUidSet, trafficStatsUid, networkHandle2);
                } catch (Throwable th) {
                    th = th;
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
            }
        }
    }

    @Override // org.chromium.net.CronetEngine
    public String getVersionString() {
        return "Cronet/" + ImplVersion.getCronetVersionWithLastChange();
    }

    @Override // org.chromium.net.CronetEngine
    public int getActiveRequestCount() {
        return this.mActiveRequestCount.get();
    }

    private CronetLogger.CronetVersion buildCronetVersion() {
        String version = getVersionString();
        return new CronetLogger.CronetVersion(version.split(DomExceptionUtils.SEPARATOR)[1].split("@")[0]);
    }

    @Override // org.chromium.net.CronetEngine
    public void shutdown() {
        if (this.mInUseStoragePath != null) {
            synchronized (sInUseStoragePaths) {
                sInUseStoragePaths.remove(this.mInUseStoragePath);
            }
        }
        synchronized (this.mLock) {
            checkHaveAdapter();
            if (this.mRunningRequestCount.get() != 0) {
                throw new IllegalStateException("Cannot shutdown with running requests.");
            }
            if (Thread.currentThread() == this.mNetworkThread) {
                throw new IllegalThreadStateException("Cannot shutdown from network thread.");
            }
        }
        this.mInitCompleted.block();
        stopNetLog();
        synchronized (this.mLock) {
            if (haveRequestContextAdapter()) {
                CronetUrlRequestContextJni.get().destroy(this.mUrlRequestContextAdapter, this);
                this.mUrlRequestContextAdapter = 0L;
            }
        }
    }

    @Override // org.chromium.net.CronetEngine
    public void startNetLogToFile(String fileName, boolean logAll) {
        synchronized (this.mLock) {
            try {
                try {
                    checkHaveAdapter();
                    if (!this.mIsLogging) {
                        if (!CronetUrlRequestContextJni.get().startNetLogToFile(this.mUrlRequestContextAdapter, this, fileName, logAll)) {
                            throw new RuntimeException("Unable to start NetLog");
                        }
                        this.mIsLogging = true;
                    } else {
                        try {
                        } catch (Throwable th) {
                            th = th;
                            throw th;
                        }
                    }
                } catch (Throwable th2) {
                    th = th2;
                }
            } catch (Throwable th3) {
                th = th3;
            }
        }
    }

    @Override // org.chromium.net.CronetEngine
    public void startNetLogToDisk(String dirPath, boolean logAll, int maxSize) {
        synchronized (this.mLock) {
            try {
                try {
                    checkHaveAdapter();
                    if (!this.mIsLogging) {
                        CronetUrlRequestContextJni.get().startNetLogToDisk(this.mUrlRequestContextAdapter, this, dirPath, logAll, maxSize);
                        this.mIsLogging = true;
                    } else {
                        try {
                        } catch (Throwable th) {
                            th = th;
                            throw th;
                        }
                    }
                } catch (Throwable th2) {
                    th = th2;
                }
            } catch (Throwable th3) {
                th = th3;
            }
        }
    }

    @Override // org.chromium.net.CronetEngine
    public void stopNetLog() {
        synchronized (this.mLock) {
            checkHaveAdapter();
            if (this.mIsLogging && !this.mIsStoppingNetLog) {
                CronetUrlRequestContextJni.get().stopNetLog(this.mUrlRequestContextAdapter, this);
                this.mIsStoppingNetLog = true;
                this.mStopNetLogCompleted.block();
                this.mStopNetLogCompleted.close();
                synchronized (this.mLock) {
                    this.mIsStoppingNetLog = false;
                    this.mIsLogging = false;
                }
            }
        }
    }

    public void stopNetLogCompleted() {
        this.mStopNetLogCompleted.open();
    }

    @Override // org.chromium.net.CronetEngine
    public byte[] getGlobalMetricsDeltas() {
        return CronetUrlRequestContextJni.get().getHistogramDeltas();
    }

    @Override // org.chromium.net.CronetEngine
    public int getEffectiveConnectionType() {
        int convertConnectionTypeToApiValue;
        if (!this.mNetworkQualityEstimatorEnabled) {
            throw new IllegalStateException("Network quality estimator must be enabled");
        }
        synchronized (this.mNetworkQualityLock) {
            convertConnectionTypeToApiValue = convertConnectionTypeToApiValue(this.mEffectiveConnectionType);
        }
        return convertConnectionTypeToApiValue;
    }

    @Override // org.chromium.net.CronetEngine
    public int getHttpRttMs() {
        int i;
        if (!this.mNetworkQualityEstimatorEnabled) {
            throw new IllegalStateException("Network quality estimator must be enabled");
        }
        synchronized (this.mNetworkQualityLock) {
            i = this.mHttpRttMs != -1 ? this.mHttpRttMs : -1;
        }
        return i;
    }

    @Override // org.chromium.net.CronetEngine
    public int getTransportRttMs() {
        int i;
        if (!this.mNetworkQualityEstimatorEnabled) {
            throw new IllegalStateException("Network quality estimator must be enabled");
        }
        synchronized (this.mNetworkQualityLock) {
            i = this.mTransportRttMs != -1 ? this.mTransportRttMs : -1;
        }
        return i;
    }

    @Override // org.chromium.net.CronetEngine
    public int getDownstreamThroughputKbps() {
        int i;
        if (!this.mNetworkQualityEstimatorEnabled) {
            throw new IllegalStateException("Network quality estimator must be enabled");
        }
        synchronized (this.mNetworkQualityLock) {
            i = this.mDownstreamThroughputKbps != -1 ? this.mDownstreamThroughputKbps : -1;
        }
        return i;
    }

    @Override // org.chromium.net.CronetEngine
    public void bindToNetwork(long networkHandle) {
        this.mNetworkHandle = networkHandle;
    }

    @Override // org.chromium.net.CronetEngine
    public void configureNetworkQualityEstimatorForTesting(boolean useLocalHostRequests, boolean useSmallerResponses, boolean disableOfflineCheck) {
        Throwable th;
        if (!this.mNetworkQualityEstimatorEnabled) {
            throw new IllegalStateException("Network quality estimator must be enabled");
        }
        synchronized (this.mLock) {
            try {
                try {
                    checkHaveAdapter();
                    CronetUrlRequestContextJni.get().configureNetworkQualityEstimatorForTesting(this.mUrlRequestContextAdapter, this, useLocalHostRequests, useSmallerResponses, disableOfflineCheck);
                } catch (Throwable th2) {
                    th = th2;
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                throw th;
            }
        }
    }

    @Override // org.chromium.net.CronetEngine
    public void addRttListener(NetworkQualityRttListener listener) {
        if (!this.mNetworkQualityEstimatorEnabled) {
            throw new IllegalStateException("Network quality estimator must be enabled");
        }
        synchronized (this.mNetworkQualityLock) {
            if (this.mRttListenerList.isEmpty()) {
                synchronized (this.mLock) {
                    checkHaveAdapter();
                    CronetUrlRequestContextJni.get().provideRTTObservations(this.mUrlRequestContextAdapter, this, true);
                }
            }
            this.mRttListenerList.addObserver(new VersionSafeCallbacks.NetworkQualityRttListenerWrapper(listener));
        }
    }

    @Override // org.chromium.net.CronetEngine
    public void removeRttListener(NetworkQualityRttListener listener) {
        if (!this.mNetworkQualityEstimatorEnabled) {
            throw new IllegalStateException("Network quality estimator must be enabled");
        }
        synchronized (this.mNetworkQualityLock) {
            if (this.mRttListenerList.removeObserver(new VersionSafeCallbacks.NetworkQualityRttListenerWrapper(listener)) && this.mRttListenerList.isEmpty()) {
                synchronized (this.mLock) {
                    checkHaveAdapter();
                    CronetUrlRequestContextJni.get().provideRTTObservations(this.mUrlRequestContextAdapter, this, false);
                }
            }
        }
    }

    @Override // org.chromium.net.CronetEngine
    public void addThroughputListener(NetworkQualityThroughputListener listener) {
        if (!this.mNetworkQualityEstimatorEnabled) {
            throw new IllegalStateException("Network quality estimator must be enabled");
        }
        synchronized (this.mNetworkQualityLock) {
            if (this.mThroughputListenerList.isEmpty()) {
                synchronized (this.mLock) {
                    checkHaveAdapter();
                    CronetUrlRequestContextJni.get().provideThroughputObservations(this.mUrlRequestContextAdapter, this, true);
                }
            }
            this.mThroughputListenerList.addObserver(new VersionSafeCallbacks.NetworkQualityThroughputListenerWrapper(listener));
        }
    }

    @Override // org.chromium.net.CronetEngine
    public void removeThroughputListener(NetworkQualityThroughputListener listener) {
        if (!this.mNetworkQualityEstimatorEnabled) {
            throw new IllegalStateException("Network quality estimator must be enabled");
        }
        synchronized (this.mNetworkQualityLock) {
            if (this.mThroughputListenerList.removeObserver(new VersionSafeCallbacks.NetworkQualityThroughputListenerWrapper(listener)) && this.mThroughputListenerList.isEmpty()) {
                synchronized (this.mLock) {
                    checkHaveAdapter();
                    CronetUrlRequestContextJni.get().provideThroughputObservations(this.mUrlRequestContextAdapter, this, false);
                }
            }
        }
    }

    @Override // org.chromium.net.CronetEngine
    public void addRequestFinishedListener(RequestFinishedInfo.Listener listener) {
        synchronized (this.mFinishedListenerLock) {
            this.mFinishedListenerMap.put(listener, new VersionSafeCallbacks.RequestFinishedInfoListener(listener));
        }
    }

    @Override // org.chromium.net.CronetEngine
    public void removeRequestFinishedListener(RequestFinishedInfo.Listener listener) {
        synchronized (this.mFinishedListenerLock) {
            this.mFinishedListenerMap.remove(listener);
        }
    }

    boolean hasRequestFinishedListener() {
        boolean z;
        synchronized (this.mFinishedListenerLock) {
            z = !this.mFinishedListenerMap.isEmpty();
        }
        return z;
    }

    @Override // org.chromium.net.CronetEngine
    public URLConnection openConnection(URL url) {
        return openConnection(url, Proxy.NO_PROXY);
    }

    @Override // org.chromium.net.ExperimentalCronetEngine
    public URLConnection openConnection(URL url, Proxy proxy) {
        if (proxy.type() != Proxy.Type.DIRECT) {
            throw new UnsupportedOperationException();
        }
        String protocol = url.getProtocol();
        if ("http".equals(protocol) || "https".equals(protocol)) {
            return new CronetHttpURLConnection(url, this);
        }
        throw new UnsupportedOperationException("Unexpected protocol:" + protocol);
    }

    @Override // org.chromium.net.CronetEngine
    public URLStreamHandlerFactory createURLStreamHandlerFactory() {
        return new CronetURLStreamHandlerFactory(this);
    }

    void onRequestStarted() {
        this.mActiveRequestCount.incrementAndGet();
        this.mRunningRequestCount.incrementAndGet();
    }

    void onRequestDestroyed() {
        this.mRunningRequestCount.decrementAndGet();
    }

    void onRequestFinished() {
        this.mActiveRequestCount.decrementAndGet();
    }

    public long getUrlRequestContextAdapter() {
        long j;
        synchronized (this.mLock) {
            checkHaveAdapter();
            j = this.mUrlRequestContextAdapter;
        }
        return j;
    }

    private void checkHaveAdapter() throws IllegalStateException {
        if (!haveRequestContextAdapter()) {
            throw new IllegalStateException("Engine is shut down.");
        }
    }

    private boolean haveRequestContextAdapter() {
        return this.mUrlRequestContextAdapter != 0;
    }

    private static int convertConnectionTypeToApiValue(int type) {
        switch (type) {
            case 0:
                return 0;
            case 1:
                return 1;
            case 2:
                return 2;
            case 3:
                return 3;
            case 4:
                return 4;
            case 5:
                return 5;
            default:
                throw new RuntimeException("Internal Error: Illegal EffectiveConnectionType value " + type);
        }
    }

    private void initNetworkThread() {
        this.mNetworkThread = Thread.currentThread();
        this.mInitCompleted.open();
        Thread.currentThread().setName("ChromiumNet");
    }

    private void onEffectiveConnectionTypeChanged(int effectiveConnectionType) {
        synchronized (this.mNetworkQualityLock) {
            this.mEffectiveConnectionType = effectiveConnectionType;
        }
    }

    private void onRTTOrThroughputEstimatesComputed(int httpRttMs, int transportRttMs, int downstreamThroughputKbps) {
        synchronized (this.mNetworkQualityLock) {
            this.mHttpRttMs = httpRttMs;
            this.mTransportRttMs = transportRttMs;
            this.mDownstreamThroughputKbps = downstreamThroughputKbps;
        }
    }

    private void onRttObservation(int rttMs, long whenMs, int source) {
        Throwable th;
        synchronized (this.mNetworkQualityLock) {
            try {
                try {
                    Iterator<VersionSafeCallbacks.NetworkQualityRttListenerWrapper> it = this.mRttListenerList.iterator();
                    while (it.hasNext()) {
                        final VersionSafeCallbacks.NetworkQualityRttListenerWrapper listener = it.next();
                        final int rttMs2 = rttMs;
                        final long whenMs2 = whenMs;
                        final int source2 = source;
                        Runnable task = new Runnable() { // da classe: org.chromium.net.impl.CronetUrlRequestContext.2
                            @Override // java.lang.Runnable
                            public void run() {
                                listener.onRttObservation(rttMs2, whenMs2, source2);
                            }
                        };
                        postObservationTaskToExecutor(listener.getExecutor(), task);
                        rttMs = rttMs2;
                        whenMs = whenMs2;
                        source = source2;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                throw th;
            }
        }
    }

    private void onThroughputObservation(int throughputKbps, long whenMs, int source) {
        Throwable th;
        synchronized (this.mNetworkQualityLock) {
            try {
                try {
                    Iterator<VersionSafeCallbacks.NetworkQualityThroughputListenerWrapper> it = this.mThroughputListenerList.iterator();
                    while (it.hasNext()) {
                        final VersionSafeCallbacks.NetworkQualityThroughputListenerWrapper listener = it.next();
                        final int throughputKbps2 = throughputKbps;
                        final long whenMs2 = whenMs;
                        final int source2 = source;
                        Runnable task = new Runnable() { // da classe: org.chromium.net.impl.CronetUrlRequestContext.3
                            @Override // java.lang.Runnable
                            public void run() {
                                listener.onThroughputObservation(throughputKbps2, whenMs2, source2);
                            }
                        };
                        postObservationTaskToExecutor(listener.getExecutor(), task);
                        throughputKbps = throughputKbps2;
                        whenMs = whenMs2;
                        source = source2;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                throw th;
            }
        }
    }

    void reportRequestFinished(final RequestFinishedInfo requestInfo, RefCountDelegate inflightCallbackCount) {
        synchronized (this.mFinishedListenerLock) {
            if (this.mFinishedListenerMap.isEmpty()) {
                return;
            }
            ArrayList<VersionSafeCallbacks.RequestFinishedInfoListener> currentListeners = new ArrayList<>(this.mFinishedListenerMap.values());
            Iterator<VersionSafeCallbacks.RequestFinishedInfoListener> it = currentListeners.iterator();
            while (it.hasNext()) {
                final VersionSafeCallbacks.RequestFinishedInfoListener listener = it.next();
                Runnable task = new Runnable() { // da classe: org.chromium.net.impl.CronetUrlRequestContext.4
                    @Override // java.lang.Runnable
                    public void run() {
                        listener.onRequestFinished(requestInfo);
                    }
                };
                postObservationTaskToExecutor(listener.getExecutor(), task, inflightCallbackCount);
            }
        }
    }

    private static void postObservationTaskToExecutor(Executor executor, final Runnable task, final RefCountDelegate inflightCallbackCount) {
        if (inflightCallbackCount != null) {
            inflightCallbackCount.increment();
        }
        try {
            executor.execute(new Runnable() { // da classe: org.chromium.net.impl.CronetUrlRequestContext$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    CronetUrlRequestContext.lambda$postObservationTaskToExecutor$0(task, inflightCallbackCount);
                }
            });
        } catch (RejectedExecutionException failException) {
            if (inflightCallbackCount != null) {
                inflightCallbackCount.decrement();
            }
            Log.e(LOG_TAG, "Exception posting task to executor", (Throwable) failException);
        }
    }

    static /* sintético */ void lambda$postObservationTaskToExecutor$0(Runnable task, RefCountDelegate inflightCallbackCount) {
        try {
            try {
                task.run();
                if (inflightCallbackCount == null) {
                    return;
                }
            } catch (Exception e) {
                Log.e(LOG_TAG, "Exception thrown from observation task", (Throwable) e);
                if (inflightCallbackCount == null) {
                    return;
                }
            }
            inflightCallbackCount.decrement();
        } catch (Throwable th) {
            if (inflightCallbackCount != null) {
                inflightCallbackCount.decrement();
            }
            throw th;
        }
    }

    private static void postObservationTaskToExecutor(Executor executor, Runnable task) {
        postObservationTaskToExecutor(executor, task, null);
    }

    public boolean isNetworkThread(Thread thread) {
        return thread == this.mNetworkThread;
    }
}
