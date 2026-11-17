package org.chromium.net.impl;

import android.os.Build;
import com.google.api.client.http.HttpMethods;
import com.google.common.net.HttpHeaders;
import j$.time.Duration;
import j$.util.Objects;
import java.nio.ByteBuffer;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import org.chromium.base.Log;
import org.chromium.base.annotations.JNINamespace;
import org.chromium.base.annotations.NativeClassQualifiedName;
import org.chromium.net.CallbackException;
import org.chromium.net.CronetException;
import org.chromium.net.InlineExecutionProhibitedException;
import org.chromium.net.RequestFinishedInfo;
import org.chromium.net.UploadDataProvider;
import org.chromium.net.UrlRequest;
import org.chromium.net.impl.CronetLogger;
import org.chromium.net.impl.VersionSafeCallbacks;

@JNINamespace("cronet")
/* loaded from: classes17.dex */
public final class CronetUrlRequest extends UrlRequestBase {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private final boolean mAllowDirectExecutor;
    private final VersionSafeCallbacks.UrlRequestCallback mCallback;
    private final int mCronetEngineId;
    private final boolean mDisableCache;
    private final boolean mDisableConnectionMigration;
    private CronetException mException;
    private final Executor mExecutor;
    private int mFinishedReason;
    private final int mIdempotency;
    private String mInitialMethod;
    private final String mInitialUrl;
    private final CronetLogger mLogger;
    private CronetMetrics mMetrics;
    private final long mNetworkHandle;
    private Runnable mOnDestroyedCallbackForTesting;
    private OnReadCompletedRunnable mOnReadCompletedTask;
    private final int mPriority;
    private boolean mQuicConnectionMigrationAttempted;
    private boolean mQuicConnectionMigrationSuccessful;
    private final Collection<Object> mRequestAnnotations;
    private final CronetUrlRequestContext mRequestContext;
    private final VersionSafeCallbacks.RequestFinishedInfoListener mRequestFinishedListener;
    private UrlResponseInfoImpl mResponseInfo;
    private boolean mStarted;
    private final int mTrafficStatsTag;
    private final boolean mTrafficStatsTagSet;
    private final int mTrafficStatsUid;
    private final boolean mTrafficStatsUidSet;
    private CronetUploadDataStream mUploadDataStream;
    private long mUrlRequestAdapter;
    private boolean mWaitingOnRead;
    private boolean mWaitingOnRedirect;
    private final Object mUrlRequestAdapterLock = new Object();
    private final List<String> mUrlChain = new ArrayList();
    private final HeadersList mRequestHeaders = new HeadersList();

    interface Natives {
        @NativeClassQualifiedName("CronetURLRequestAdapter")
        boolean addRequestHeader(long j, CronetUrlRequest cronetUrlRequest, String str, String str2);

        long createRequestAdapter(CronetUrlRequest cronetUrlRequest, long j, String str, int i, boolean z, boolean z2, boolean z3, int i2, boolean z4, int i3, int i4, long j2);

        @NativeClassQualifiedName("CronetURLRequestAdapter")
        void destroy(long j, CronetUrlRequest cronetUrlRequest, boolean z);

        @NativeClassQualifiedName("CronetURLRequestAdapter")
        void followDeferredRedirect(long j, CronetUrlRequest cronetUrlRequest);

        @NativeClassQualifiedName("CronetURLRequestAdapter")
        void getStatus(long j, CronetUrlRequest cronetUrlRequest, VersionSafeCallbacks.UrlRequestStatusListener urlRequestStatusListener);

        @NativeClassQualifiedName("CronetURLRequestAdapter")
        boolean readData(long j, CronetUrlRequest cronetUrlRequest, ByteBuffer byteBuffer, int i, int i2);

        @NativeClassQualifiedName("CronetURLRequestAdapter")
        boolean setHttpMethod(long j, CronetUrlRequest cronetUrlRequest, String str);

        @NativeClassQualifiedName("CronetURLRequestAdapter")
        void start(long j, CronetUrlRequest cronetUrlRequest);
    }

    static final class HeadersList extends ArrayList<Map.Entry<String, String>> {
        HeadersList() {
        }
    }

    private final class OnReadCompletedRunnable implements Runnable {
        ByteBuffer mByteBuffer;

        private OnReadCompletedRunnable() {
        }

        @Override // java.lang.Runnable
        public void run() {
            CronetUrlRequest.this.checkCallingThread();
            ByteBuffer buffer = this.mByteBuffer;
            this.mByteBuffer = null;
            try {
                synchronized (CronetUrlRequest.this.mUrlRequestAdapterLock) {
                    if (CronetUrlRequest.this.isDoneLocked()) {
                        return;
                    }
                    CronetUrlRequest.this.mWaitingOnRead = true;
                    CronetUrlRequest.this.mCallback.onReadCompleted(CronetUrlRequest.this, CronetUrlRequest.this.mResponseInfo, buffer);
                }
            } catch (Exception e) {
                CronetUrlRequest.this.onCallbackException(e);
            }
        }
    }

    CronetUrlRequest(CronetUrlRequestContext requestContext, String url, int priority, UrlRequest.Callback callback, Executor executor, Collection<Object> requestAnnotations, boolean disableCache, boolean disableConnectionMigration, boolean allowDirectExecutor, boolean trafficStatsTagSet, int trafficStatsTag, boolean trafficStatsUidSet, int trafficStatsUid, RequestFinishedInfo.Listener requestFinishedListener, int idempotency, long networkHandle) {
        VersionSafeCallbacks.RequestFinishedInfoListener requestFinishedInfoListener;
        Objects.requireNonNull(url, "URL is required");
        Objects.requireNonNull(callback, "Listener is required");
        Objects.requireNonNull(executor, "Executor is required");
        this.mAllowDirectExecutor = allowDirectExecutor;
        this.mRequestContext = requestContext;
        this.mCronetEngineId = requestContext.getCronetEngineId();
        this.mLogger = requestContext.getCronetLogger();
        this.mInitialUrl = url;
        this.mUrlChain.add(url);
        this.mPriority = convertRequestPriority(priority);
        this.mCallback = new VersionSafeCallbacks.UrlRequestCallback(callback);
        this.mExecutor = executor;
        this.mRequestAnnotations = requestAnnotations;
        this.mDisableCache = disableCache;
        this.mDisableConnectionMigration = disableConnectionMigration;
        this.mTrafficStatsTagSet = trafficStatsTagSet;
        this.mTrafficStatsTag = trafficStatsTag;
        this.mTrafficStatsUidSet = trafficStatsUidSet;
        this.mTrafficStatsUid = trafficStatsUid;
        if (requestFinishedListener != null) {
            requestFinishedInfoListener = new VersionSafeCallbacks.RequestFinishedInfoListener(requestFinishedListener);
        } else {
            requestFinishedInfoListener = null;
        }
        this.mRequestFinishedListener = requestFinishedInfoListener;
        this.mIdempotency = convertIdempotency(idempotency);
        this.mNetworkHandle = networkHandle;
    }

    @Override // org.chromium.net.impl.UrlRequestBase
    public void setHttpMethod(String method) {
        checkNotStarted();
        Objects.requireNonNull(method, "Method is required.");
        this.mInitialMethod = method;
    }

    @Override // org.chromium.net.impl.UrlRequestBase
    public void addHeader(String header, String value) {
        checkNotStarted();
        Objects.requireNonNull(header, "Invalid header name.");
        Objects.requireNonNull(value, "Invalid header value.");
        this.mRequestHeaders.add(new AbstractMap.SimpleImmutableEntry(header, value));
    }

    @Override // org.chromium.net.impl.UrlRequestBase
    public void setUploadDataProvider(UploadDataProvider uploadDataProvider, Executor executor) {
        Objects.requireNonNull(uploadDataProvider, "Invalid UploadDataProvider.");
        if (this.mInitialMethod == null) {
            this.mInitialMethod = HttpMethods.POST;
        }
        this.mUploadDataStream = new CronetUploadDataStream(uploadDataProvider, executor, this);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // org.chromium.net.UrlRequest
    public void start() {
        Object obj;
        int i;
        int i2;
        boolean hasContentType;
        CronetUrlRequest cronetUrlRequest = this;
        Object obj2 = cronetUrlRequest.mUrlRequestAdapterLock;
        synchronized (obj2) {
            try {
                try {
                    cronetUrlRequest.checkNotStarted();
                    i = 1;
                    try {
                        obj = obj2;
                    } catch (RuntimeException e) {
                        e = e;
                    }
                    try {
                    } catch (RuntimeException e2) {
                        e = e2;
                        i2 = 1;
                        cronetUrlRequest.destroyRequestAdapterLocked(i2);
                        cronetUrlRequest.mRequestContext.onRequestFinished();
                        throw e;
                    }
                } catch (Throwable th) {
                    e = th;
                }
            } catch (Throwable th2) {
                e = th2;
                obj = obj2;
            }
            try {
                long createRequestAdapter = CronetUrlRequestJni.get().createRequestAdapter(cronetUrlRequest, cronetUrlRequest.mRequestContext.getUrlRequestContextAdapter(), cronetUrlRequest.mInitialUrl, cronetUrlRequest.mPriority, cronetUrlRequest.mDisableCache, cronetUrlRequest.mDisableConnectionMigration, cronetUrlRequest.mTrafficStatsTagSet, cronetUrlRequest.mTrafficStatsTag, cronetUrlRequest.mTrafficStatsUidSet, cronetUrlRequest.mTrafficStatsUid, cronetUrlRequest.mIdempotency, cronetUrlRequest.mNetworkHandle);
                cronetUrlRequest = cronetUrlRequest;
                cronetUrlRequest.mUrlRequestAdapter = createRequestAdapter;
                cronetUrlRequest.mRequestContext.onRequestStarted();
                if (cronetUrlRequest.mInitialMethod != null && !CronetUrlRequestJni.get().setHttpMethod(cronetUrlRequest.mUrlRequestAdapter, cronetUrlRequest, cronetUrlRequest.mInitialMethod)) {
                    throw new IllegalArgumentException("Invalid http method " + cronetUrlRequest.mInitialMethod);
                }
                boolean hasContentType2 = false;
                Iterator<Map.Entry<String, String>> it = cronetUrlRequest.mRequestHeaders.iterator();
                while (it.hasNext()) {
                    Map.Entry<String, String> header = it.next();
                    if (header.getKey().equalsIgnoreCase(HttpHeaders.CONTENT_TYPE) && !header.getValue().isEmpty()) {
                        hasContentType = true;
                    } else {
                        hasContentType = hasContentType2;
                    }
                    int i3 = i;
                    try {
                        i2 = i3;
                        try {
                            if (!CronetUrlRequestJni.get().addRequestHeader(cronetUrlRequest.mUrlRequestAdapter, cronetUrlRequest, header.getKey(), header.getValue())) {
                                throw new IllegalArgumentException("Invalid header " + header.getKey() + "=" + header.getValue());
                            }
                            hasContentType2 = hasContentType;
                            i = i2;
                        } catch (RuntimeException e3) {
                            e = e3;
                            cronetUrlRequest.destroyRequestAdapterLocked(i2);
                            cronetUrlRequest.mRequestContext.onRequestFinished();
                            throw e;
                        }
                    } catch (RuntimeException e4) {
                        e = e4;
                        i2 = i3;
                    }
                }
                boolean z = i;
                if (cronetUrlRequest.mUploadDataStream != null) {
                    if (!hasContentType2) {
                        throw new IllegalArgumentException("Requests with upload data must have a Content-Type.");
                    }
                    cronetUrlRequest.mStarted = z;
                    cronetUrlRequest.mUploadDataStream.postTaskToExecutor(new Runnable() { // from class: org.chromium.net.impl.CronetUrlRequest.1
                        @Override // java.lang.Runnable
                        public void run() {
                            CronetUrlRequest.this.mUploadDataStream.initializeWithRequest();
                            synchronized (CronetUrlRequest.this.mUrlRequestAdapterLock) {
                                if (CronetUrlRequest.this.isDoneLocked()) {
                                    return;
                                }
                                CronetUrlRequest.this.mUploadDataStream.attachNativeAdapterToRequest(CronetUrlRequest.this.mUrlRequestAdapter);
                                CronetUrlRequest.this.startInternalLocked();
                            }
                        }
                    });
                    return;
                }
                cronetUrlRequest.mStarted = z;
                cronetUrlRequest.startInternalLocked();
            } catch (RuntimeException e5) {
                e = e5;
                i2 = 1;
                cronetUrlRequest = cronetUrlRequest;
            } catch (Throwable th3) {
                e = th3;
                throw e;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startInternalLocked() {
        CronetUrlRequestJni.get().start(this.mUrlRequestAdapter, this);
    }

    @Override // org.chromium.net.UrlRequest
    public void followRedirect() {
        synchronized (this.mUrlRequestAdapterLock) {
            if (!this.mWaitingOnRedirect) {
                throw new IllegalStateException("No redirect to follow.");
            }
            this.mWaitingOnRedirect = false;
            if (isDoneLocked()) {
                return;
            }
            CronetUrlRequestJni.get().followDeferredRedirect(this.mUrlRequestAdapter, this);
        }
    }

    @Override // org.chromium.net.UrlRequest
    public void read(ByteBuffer buffer) {
        Preconditions.checkHasRemaining(buffer);
        Preconditions.checkDirect(buffer);
        synchronized (this.mUrlRequestAdapterLock) {
            try {
                try {
                    if (!this.mWaitingOnRead) {
                        throw new IllegalStateException("Unexpected read attempt.");
                    }
                    this.mWaitingOnRead = false;
                    if (!isDoneLocked()) {
                        if (!CronetUrlRequestJni.get().readData(this.mUrlRequestAdapter, this, buffer, buffer.position(), buffer.limit())) {
                            this.mWaitingOnRead = true;
                            throw new IllegalArgumentException("Unable to call native read");
                        }
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

    @Override // org.chromium.net.UrlRequest
    public void cancel() {
        synchronized (this.mUrlRequestAdapterLock) {
            if (!isDoneLocked() && this.mStarted) {
                destroyRequestAdapterLocked(2);
            }
        }
    }

    @Override // org.chromium.net.UrlRequest
    public boolean isDone() {
        boolean isDoneLocked;
        synchronized (this.mUrlRequestAdapterLock) {
            isDoneLocked = isDoneLocked();
        }
        return isDoneLocked;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isDoneLocked() {
        return this.mStarted && this.mUrlRequestAdapter == 0;
    }

    @Override // org.chromium.net.UrlRequest
    public void getStatus(UrlRequest.StatusListener unsafeListener) {
        final VersionSafeCallbacks.UrlRequestStatusListener listener = new VersionSafeCallbacks.UrlRequestStatusListener(unsafeListener);
        synchronized (this.mUrlRequestAdapterLock) {
            if (this.mUrlRequestAdapter != 0) {
                CronetUrlRequestJni.get().getStatus(this.mUrlRequestAdapter, this, listener);
            } else {
                Runnable task = new Runnable() { // from class: org.chromium.net.impl.CronetUrlRequest.2
                    @Override // java.lang.Runnable
                    public void run() {
                        listener.onStatus(-1);
                    }
                };
                postTaskToExecutor(task);
            }
        }
    }

    public void setOnDestroyedCallbackForTesting(Runnable onDestroyedCallbackForTesting) {
        synchronized (this.mUrlRequestAdapterLock) {
            this.mOnDestroyedCallbackForTesting = onDestroyedCallbackForTesting;
        }
    }

    public void setOnDestroyedUploadCallbackForTesting(Runnable onDestroyedUploadCallbackForTesting) {
        this.mUploadDataStream.setOnDestroyedCallbackForTesting(onDestroyedUploadCallbackForTesting);
    }

    public long getUrlRequestAdapterForTesting() {
        long j;
        synchronized (this.mUrlRequestAdapterLock) {
            j = this.mUrlRequestAdapter;
        }
        return j;
    }

    private void postTaskToExecutor(Runnable task) {
        try {
            this.mExecutor.execute(task);
        } catch (RejectedExecutionException failException) {
            Log.e(CronetUrlRequestContext.LOG_TAG, "Exception posting task to executor", (Throwable) failException);
            failWithException(new CronetExceptionImpl("Exception posting task to executor", failException));
        }
    }

    private static int convertRequestPriority(int priority) {
        switch (priority) {
        }
        return 4;
    }

    private static int convertIdempotency(int idempotency) {
        switch (idempotency) {
        }
        return 0;
    }

    static long estimateHeadersSizeInBytes(Map<String, List<String>> headers) {
        if (headers == null) {
            return 0L;
        }
        long responseHeaderSizeInBytes = 0;
        for (Map.Entry<String, List<String>> entry : headers.entrySet()) {
            String key = entry.getKey();
            if (key != null) {
                responseHeaderSizeInBytes += key.length();
            }
            if (entry.getValue() != null) {
                for (String content : entry.getValue()) {
                    responseHeaderSizeInBytes += content.length();
                }
            }
        }
        return responseHeaderSizeInBytes;
    }

    static long estimateHeadersSizeInBytes(HeadersList headers) {
        if (headers == null) {
            return 0L;
        }
        long responseHeaderSizeInBytes = 0;
        Iterator<Map.Entry<String, String>> it = headers.iterator();
        while (it.hasNext()) {
            Map.Entry<String, String> entry = it.next();
            String key = entry.getKey();
            if (key != null) {
                responseHeaderSizeInBytes += key.length();
            }
            String value = entry.getValue();
            if (value != null) {
                responseHeaderSizeInBytes += entry.getValue().length();
            }
        }
        return responseHeaderSizeInBytes;
    }

    private UrlResponseInfoImpl prepareResponseInfoOnNetworkThread(int httpStatusCode, String httpStatusText, String[] headers, boolean wasCached, String negotiatedProtocol, String proxyServer, long receivedByteCount) {
        HeadersList headersList = new HeadersList();
        for (int i = 0; i < headers.length; i += 2) {
            headersList.add(new AbstractMap.SimpleImmutableEntry(headers[i], headers[i + 1]));
        }
        return new UrlResponseInfoImpl(new ArrayList(this.mUrlChain), httpStatusCode, httpStatusText, headersList, wasCached, negotiatedProtocol, proxyServer, receivedByteCount);
    }

    private void checkNotStarted() {
        synchronized (this.mUrlRequestAdapterLock) {
            if (this.mStarted || isDoneLocked()) {
                throw new IllegalStateException("Request is already started.");
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void destroyRequestAdapterLocked(int finishedReason) {
        if (this.mException != null && finishedReason != 1) {
            throw new AssertionError();
        }
        this.mFinishedReason = finishedReason;
        if (this.mUrlRequestAdapter == 0) {
            return;
        }
        this.mRequestContext.onRequestDestroyed();
        CronetUrlRequestJni.get().destroy(this.mUrlRequestAdapter, this, finishedReason == 2);
        this.mUrlRequestAdapter = 0L;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onCallbackException(Exception e) {
        CallbackException requestError = new CallbackExceptionImpl("Exception received from UrlRequest.Callback", e);
        Log.e(CronetUrlRequestContext.LOG_TAG, "Exception in CalledByNative method", (Throwable) e);
        failWithException(requestError);
    }

    void onUploadException(Throwable e) {
        CallbackException uploadError = new CallbackExceptionImpl("Exception received from UploadDataProvider", e);
        Log.e(CronetUrlRequestContext.LOG_TAG, "Exception in upload method", e);
        failWithException(uploadError);
    }

    private void failWithException(CronetException exception) {
        synchronized (this.mUrlRequestAdapterLock) {
            if (isDoneLocked()) {
                return;
            }
            if (this.mException != null) {
                throw new AssertionError();
            }
            this.mException = exception;
            destroyRequestAdapterLocked(1);
        }
    }

    private void onRedirectReceived(final String newLocation, int httpStatusCode, String httpStatusText, String[] headers, boolean wasCached, String negotiatedProtocol, String proxyServer, long receivedByteCount) {
        final UrlResponseInfoImpl responseInfo = prepareResponseInfoOnNetworkThread(httpStatusCode, httpStatusText, headers, wasCached, negotiatedProtocol, proxyServer, receivedByteCount);
        this.mUrlChain.add(newLocation);
        Runnable task = new Runnable() { // from class: org.chromium.net.impl.CronetUrlRequest.3
            @Override // java.lang.Runnable
            public void run() {
                CronetUrlRequest.this.checkCallingThread();
                synchronized (CronetUrlRequest.this.mUrlRequestAdapterLock) {
                    if (CronetUrlRequest.this.isDoneLocked()) {
                        return;
                    }
                    CronetUrlRequest.this.mWaitingOnRedirect = true;
                    try {
                        CronetUrlRequest.this.mCallback.onRedirectReceived(CronetUrlRequest.this, responseInfo, newLocation);
                    } catch (Exception e) {
                        CronetUrlRequest.this.onCallbackException(e);
                    }
                }
            }
        };
        postTaskToExecutor(task);
    }

    private void onResponseStarted(int httpStatusCode, String httpStatusText, String[] headers, boolean wasCached, String negotiatedProtocol, String proxyServer, long receivedByteCount) {
        this.mResponseInfo = prepareResponseInfoOnNetworkThread(httpStatusCode, httpStatusText, headers, wasCached, negotiatedProtocol, proxyServer, receivedByteCount);
        Runnable task = new Runnable() { // from class: org.chromium.net.impl.CronetUrlRequest.4
            @Override // java.lang.Runnable
            public void run() {
                CronetUrlRequest.this.checkCallingThread();
                synchronized (CronetUrlRequest.this.mUrlRequestAdapterLock) {
                    if (CronetUrlRequest.this.isDoneLocked()) {
                        return;
                    }
                    CronetUrlRequest.this.mWaitingOnRead = true;
                    try {
                        CronetUrlRequest.this.mCallback.onResponseStarted(CronetUrlRequest.this, CronetUrlRequest.this.mResponseInfo);
                    } catch (Exception e) {
                        CronetUrlRequest.this.onCallbackException(e);
                    }
                }
            }
        };
        postTaskToExecutor(task);
    }

    private void onReadCompleted(ByteBuffer byteBuffer, int bytesRead, int initialPosition, int initialLimit, long receivedByteCount) {
        this.mResponseInfo.setReceivedByteCount(receivedByteCount);
        if (byteBuffer.position() != initialPosition || byteBuffer.limit() != initialLimit) {
            failWithException(new CronetExceptionImpl("ByteBuffer modified externally during read", null));
            return;
        }
        if (this.mOnReadCompletedTask == null) {
            this.mOnReadCompletedTask = new OnReadCompletedRunnable();
        }
        this.mOnReadCompletedTask.mByteBuffer = byteBuffer;
        postTaskToExecutor(this.mOnReadCompletedTask);
    }

    private void onSucceeded(long receivedByteCount) {
        this.mResponseInfo.setReceivedByteCount(receivedByteCount);
        Runnable task = new Runnable() { // from class: org.chromium.net.impl.CronetUrlRequest.5
            @Override // java.lang.Runnable
            public void run() {
                synchronized (CronetUrlRequest.this.mUrlRequestAdapterLock) {
                    if (CronetUrlRequest.this.isDoneLocked()) {
                        return;
                    }
                    CronetUrlRequest.this.destroyRequestAdapterLocked(0);
                    try {
                        CronetUrlRequest.this.mCallback.onSucceeded(CronetUrlRequest.this, CronetUrlRequest.this.mResponseInfo);
                    } catch (Exception e) {
                        Log.e(CronetUrlRequestContext.LOG_TAG, "Exception in onSucceeded method", (Throwable) e);
                    }
                    CronetUrlRequest.this.maybeReportMetrics();
                }
            }
        };
        postTaskToExecutor(task);
    }

    private void onError(int errorCode, int nativeError, int nativeQuicError, String errorString, long receivedByteCount) {
        if (this.mResponseInfo != null) {
            this.mResponseInfo.setReceivedByteCount(receivedByteCount);
        }
        if (errorCode == 10 || errorCode == 3) {
            failWithException(new QuicExceptionImpl("Exception in CronetUrlRequest: " + errorString, errorCode, nativeError, nativeQuicError));
        } else {
            int javaError = mapUrlRequestErrorToApiErrorCode(errorCode);
            failWithException(new NetworkExceptionImpl("Exception in CronetUrlRequest: " + errorString, javaError, nativeError));
        }
    }

    private void onCanceled() {
        Runnable task = new Runnable() { // from class: org.chromium.net.impl.CronetUrlRequest.6
            @Override // java.lang.Runnable
            public void run() {
                try {
                    CronetUrlRequest.this.mCallback.onCanceled(CronetUrlRequest.this, CronetUrlRequest.this.mResponseInfo);
                } catch (Exception e) {
                    Log.e(CronetUrlRequestContext.LOG_TAG, "Exception in onCanceled method", (Throwable) e);
                }
                CronetUrlRequest.this.maybeReportMetrics();
            }
        };
        postTaskToExecutor(task);
    }

    private void onStatus(final VersionSafeCallbacks.UrlRequestStatusListener listener, final int loadState) {
        Runnable task = new Runnable() { // from class: org.chromium.net.impl.CronetUrlRequest.7
            @Override // java.lang.Runnable
            public void run() {
                listener.onStatus(UrlRequestBase.convertLoadState(loadState));
            }
        };
        postTaskToExecutor(task);
    }

    private void onMetricsCollected(long requestStartMs, long dnsStartMs, long dnsEndMs, long connectStartMs, long connectEndMs, long sslStartMs, long sslEndMs, long sendingStartMs, long sendingEndMs, long pushStartMs, long pushEndMs, long responseStartMs, long requestEndMs, boolean socketReused, long sentByteCount, long receivedByteCount, boolean quicConnectionMigrationAttempted, boolean quicConnectionMigrationSuccessful) {
        synchronized (this.mUrlRequestAdapterLock) {
            try {
                try {
                    if (this.mMetrics != null) {
                        throw new IllegalStateException("Metrics collection should only happen once.");
                    }
                    this.mMetrics = new CronetMetrics(requestStartMs, dnsStartMs, dnsEndMs, connectStartMs, connectEndMs, sslStartMs, sslEndMs, sendingStartMs, sendingEndMs, pushStartMs, pushEndMs, responseStartMs, requestEndMs, socketReused, sentByteCount, receivedByteCount);
                    try {
                        this.mQuicConnectionMigrationAttempted = quicConnectionMigrationAttempted;
                        this.mQuicConnectionMigrationSuccessful = quicConnectionMigrationSuccessful;
                    } catch (Throwable th) {
                        th = th;
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                }
            } catch (Throwable th3) {
                th = th3;
            }
        }
    }

    private void onNativeAdapterDestroyed() {
        synchronized (this.mUrlRequestAdapterLock) {
            if (this.mOnDestroyedCallbackForTesting != null) {
                this.mOnDestroyedCallbackForTesting.run();
            }
            if (this.mException == null) {
                return;
            }
            Runnable task = new Runnable() { // from class: org.chromium.net.impl.CronetUrlRequest.8
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        CronetUrlRequest.this.mCallback.onFailed(CronetUrlRequest.this, CronetUrlRequest.this.mResponseInfo, CronetUrlRequest.this.mException);
                    } catch (Exception e) {
                        Log.e(CronetUrlRequestContext.LOG_TAG, "Exception in onFailed method", (Throwable) e);
                    }
                    CronetUrlRequest.this.maybeReportMetrics();
                }
            };
            try {
                this.mExecutor.execute(task);
            } catch (RejectedExecutionException e) {
                Log.e(CronetUrlRequestContext.LOG_TAG, "Exception posting task to executor", (Throwable) e);
            }
        }
    }

    void checkCallingThread() {
        if (!this.mAllowDirectExecutor && this.mRequestContext.isNetworkThread(Thread.currentThread())) {
            throw new InlineExecutionProhibitedException();
        }
    }

    private int mapUrlRequestErrorToApiErrorCode(int errorCode) {
        switch (errorCode) {
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
            case 6:
                return 6;
            case 7:
                return 7;
            case 8:
                return 8;
            case 9:
                return 9;
            case 10:
                return 10;
            case 11:
                return 11;
            default:
                Log.e(CronetUrlRequestContext.LOG_TAG, "Unknown error code: " + errorCode);
                return errorCode;
        }
    }

    private CronetLogger.CronetTrafficInfo buildCronetTrafficInfo() {
        Map<String, List<String>> responseHeaders;
        String negotiatedProtocol;
        int httpStatusCode;
        boolean wasCached;
        long requestHeaderSizeInBytes;
        long requestBodySizeInBytes;
        long responseHeaderSizeInBytes;
        long responseBodySizeInBytes;
        Duration headersLatency;
        Duration totalLatency;
        if (this.mMetrics == null) {
            throw new AssertionError();
        }
        if (this.mRequestHeaders == null) {
            throw new AssertionError();
        }
        if (this.mResponseInfo != null) {
            responseHeaders = this.mResponseInfo.getAllHeaders();
            String negotiatedProtocol2 = this.mResponseInfo.getNegotiatedProtocol();
            int httpStatusCode2 = this.mResponseInfo.getHttpStatusCode();
            negotiatedProtocol = negotiatedProtocol2;
            httpStatusCode = httpStatusCode2;
            wasCached = this.mResponseInfo.wasCached();
        } else {
            responseHeaders = Collections.emptyMap();
            negotiatedProtocol = "";
            httpStatusCode = 0;
            wasCached = false;
        }
        long requestTotalSizeInBytes = this.mMetrics.getSentByteCount().longValue();
        if (wasCached && requestTotalSizeInBytes == 0) {
            requestHeaderSizeInBytes = 0;
            requestBodySizeInBytes = 0;
        } else {
            requestHeaderSizeInBytes = estimateHeadersSizeInBytes(this.mRequestHeaders);
            requestBodySizeInBytes = Math.max(0L, requestTotalSizeInBytes - requestHeaderSizeInBytes);
        }
        long responseTotalSizeInBytes = this.mMetrics.getReceivedByteCount().longValue();
        if (wasCached && responseTotalSizeInBytes == 0) {
            responseHeaderSizeInBytes = 0;
            responseBodySizeInBytes = 0;
        } else {
            responseHeaderSizeInBytes = estimateHeadersSizeInBytes(responseHeaders);
            responseBodySizeInBytes = Math.max(0L, responseTotalSizeInBytes - responseHeaderSizeInBytes);
        }
        if (this.mMetrics.getRequestStart() != null && this.mMetrics.getResponseStart() != null) {
            headersLatency = Duration.ofMillis(this.mMetrics.getResponseStart().getTime() - this.mMetrics.getRequestStart().getTime());
        } else {
            headersLatency = Duration.ofSeconds(0L);
        }
        if (this.mMetrics.getRequestStart() != null && this.mMetrics.getRequestEnd() != null) {
            totalLatency = Duration.ofMillis(this.mMetrics.getRequestEnd().getTime() - this.mMetrics.getRequestStart().getTime());
        } else {
            totalLatency = Duration.ofSeconds(0L);
        }
        return new CronetLogger.CronetTrafficInfo(requestHeaderSizeInBytes, requestBodySizeInBytes, responseHeaderSizeInBytes, responseBodySizeInBytes, httpStatusCode, headersLatency, totalLatency, negotiatedProtocol, this.mQuicConnectionMigrationAttempted, this.mQuicConnectionMigrationSuccessful);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void maybeReportMetrics() {
        final RefCountDelegate inflightCallbackCount = new RefCountDelegate(new Runnable() { // from class: org.chromium.net.impl.CronetUrlRequest$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                CronetUrlRequest.this.m2707xc1d70a00();
            }
        });
        try {
            if (this.mMetrics != null) {
                if (Build.VERSION.SDK_INT >= 26) {
                    try {
                        this.mLogger.logCronetTrafficInfo(this.mCronetEngineId, buildCronetTrafficInfo());
                    } catch (RuntimeException e) {
                        Log.e(CronetUrlRequestContext.LOG_TAG, "Error while trying to log CronetTrafficInfo: ", (Throwable) e);
                    }
                }
                final RequestFinishedInfo requestInfo = new RequestFinishedInfoImpl(this.mInitialUrl, this.mRequestAnnotations, this.mMetrics, this.mFinishedReason, this.mResponseInfo, this.mException);
                this.mRequestContext.reportRequestFinished(requestInfo, inflightCallbackCount);
                if (this.mRequestFinishedListener != null) {
                    inflightCallbackCount.increment();
                    try {
                        this.mRequestFinishedListener.getExecutor().execute(new Runnable() { // from class: org.chromium.net.impl.CronetUrlRequest.9
                            @Override // java.lang.Runnable
                            public void run() {
                                try {
                                    try {
                                        CronetUrlRequest.this.mRequestFinishedListener.onRequestFinished(requestInfo);
                                    } catch (Exception e2) {
                                        Log.e(CronetUrlRequestContext.LOG_TAG, "Exception thrown from request finished listener", (Throwable) e2);
                                    }
                                } finally {
                                    inflightCallbackCount.decrement();
                                }
                            }
                        });
                    } catch (RejectedExecutionException failException) {
                        Log.e(CronetUrlRequestContext.LOG_TAG, "Exception posting task to executor", (Throwable) failException);
                        inflightCallbackCount.decrement();
                    }
                }
                inflightCallbackCount.decrement();
                return;
            }
            inflightCallbackCount.decrement();
        } catch (Throwable th) {
            inflightCallbackCount.decrement();
            throw th;
        }
    }

    /* renamed from: lambda$maybeReportMetrics$0$org-chromium-net-impl-CronetUrlRequest, reason: not valid java name */
    /* synthetic */ void m2707xc1d70a00() {
        this.mRequestContext.onRequestFinished();
    }
}
