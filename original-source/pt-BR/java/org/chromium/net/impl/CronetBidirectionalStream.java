package org.chromium.net.impl;

import com.google.api.client.http.HttpMethods;
import j$.util.Objects;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.nio.ByteBuffer;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import org.chromium.base.Log;
import org.chromium.base.annotations.JNINamespace;
import org.chromium.base.annotations.NativeClassQualifiedName;
import org.chromium.net.BidirectionalStream;
import org.chromium.net.CallbackException;
import org.chromium.net.CronetException;
import org.chromium.net.ExperimentalBidirectionalStream;
import org.chromium.net.RequestFinishedInfo;
import org.chromium.net.UrlResponseInfo;
import org.chromium.net.impl.UrlResponseInfoImpl;
import org.chromium.net.impl.VersionSafeCallbacks;

@JNINamespace("cronet")
/* carregado de: classes17.dex */
public class CronetBidirectionalStream extends ExperimentalBidirectionalStream {
    static final /* sintético */ boolean $assertionsDisabled = false;
    private final VersionSafeCallbacks.BidirectionalStreamCallback mCallback;
    private final boolean mDelayRequestHeadersUntilFirstFlush;
    private boolean mEndOfStreamWritten;
    private CronetException mException;
    private final Executor mExecutor;
    private RefCountDelegate mInflightDoneCallbackCount;
    private final String mInitialMethod;
    private final int mInitialPriority;
    private final String mInitialUrl;
    private RequestFinishedInfo.Metrics mMetrics;
    private long mNativeStream;
    private final long mNetworkHandle;
    private Runnable mOnDestroyedCallbackForTesting;
    private OnReadCompletedRunnable mOnReadCompletedTask;
    private final Collection<Object> mRequestAnnotations;
    private final CronetUrlRequestContext mRequestContext;
    private final String[] mRequestHeaders;
    private boolean mRequestHeadersSent;
    private UrlResponseInfoImpl mResponseInfo;
    private final int mTrafficStatsTag;
    private final boolean mTrafficStatsTagSet;
    private final int mTrafficStatsUid;
    private final boolean mTrafficStatsUidSet;
    private final Object mNativeStreamLock = new Object();
    private int mReadState = 0;
    private int mWriteState = 0;
    private LinkedList<ByteBuffer> mPendingData = new LinkedList<>();
    private LinkedList<ByteBuffer> mFlushData = new LinkedList<>();

    interface Natives {
        long createBidirectionalStream(CronetBidirectionalStream cronetBidirectionalStream, long j, boolean z, boolean z2, int i, boolean z3, int i2, long j2);

        @NativeClassQualifiedName("CronetBidirectionalStreamAdapter")
        void destroy(long j, CronetBidirectionalStream cronetBidirectionalStream, boolean z);

        @NativeClassQualifiedName("CronetBidirectionalStreamAdapter")
        boolean readData(long j, CronetBidirectionalStream cronetBidirectionalStream, ByteBuffer byteBuffer, int i, int i2);

        @NativeClassQualifiedName("CronetBidirectionalStreamAdapter")
        void sendRequestHeaders(long j, CronetBidirectionalStream cronetBidirectionalStream);

        @NativeClassQualifiedName("CronetBidirectionalStreamAdapter")
        int start(long j, CronetBidirectionalStream cronetBidirectionalStream, String str, int i, String str2, String[] strArr, boolean z);

        @NativeClassQualifiedName("CronetBidirectionalStreamAdapter")
        boolean writevData(long j, CronetBidirectionalStream cronetBidirectionalStream, ByteBuffer[] byteBufferArr, int[] iArr, int[] iArr2, boolean z);
    }

    @Retention(RetentionPolicy.SOURCE)
    private @interface State {
        public static final int CANCELED = 5;
        public static final int ERROR = 6;
        public static final int NOT_STARTED = 0;
        public static final int READING = 3;
        public static final int READING_DONE = 4;
        public static final int STARTED = 1;
        public static final int SUCCESS = 7;
        public static final int WAITING_FOR_FLUSH = 8;
        public static final int WAITING_FOR_READ = 2;
        public static final int WRITING = 9;
        public static final int WRITING_DONE = 10;
    }

    private final class OnReadCompletedRunnable implements Runnable {
        ByteBuffer mByteBuffer;
        boolean mEndOfStream;

        private OnReadCompletedRunnable() {
        }

        @Override // java.lang.Runnable
        public void run() {
            try {
                ByteBuffer buffer = this.mByteBuffer;
                this.mByteBuffer = null;
                boolean maybeOnSucceeded = false;
                synchronized (CronetBidirectionalStream.this.mNativeStreamLock) {
                    if (CronetBidirectionalStream.this.isDoneLocked()) {
                        return;
                    }
                    if (this.mEndOfStream) {
                        CronetBidirectionalStream.this.mReadState = 4;
                        maybeOnSucceeded = CronetBidirectionalStream.this.mWriteState == 10;
                    } else {
                        CronetBidirectionalStream.this.mReadState = 2;
                    }
                    CronetBidirectionalStream.this.mCallback.onReadCompleted(CronetBidirectionalStream.this, CronetBidirectionalStream.this.mResponseInfo, buffer, this.mEndOfStream);
                    if (maybeOnSucceeded) {
                        CronetBidirectionalStream.this.maybeOnSucceededOnExecutor();
                    }
                }
            } catch (Exception e) {
                CronetBidirectionalStream.this.onCallbackException(e);
            }
        }
    }

    private final class OnWriteCompletedRunnable implements Runnable {
        private ByteBuffer mByteBuffer;
        private final boolean mEndOfStream;

        OnWriteCompletedRunnable(ByteBuffer buffer, boolean endOfStream) {
            this.mByteBuffer = buffer;
            this.mEndOfStream = endOfStream;
        }

        @Override // java.lang.Runnable
        public void run() {
            try {
                ByteBuffer buffer = this.mByteBuffer;
                this.mByteBuffer = null;
                boolean maybeOnSucceeded = false;
                synchronized (CronetBidirectionalStream.this.mNativeStreamLock) {
                    if (CronetBidirectionalStream.this.isDoneLocked()) {
                        return;
                    }
                    if (this.mEndOfStream) {
                        CronetBidirectionalStream.this.mWriteState = 10;
                        maybeOnSucceeded = CronetBidirectionalStream.this.mReadState == 4;
                    }
                    CronetBidirectionalStream.this.mCallback.onWriteCompleted(CronetBidirectionalStream.this, CronetBidirectionalStream.this.mResponseInfo, buffer, this.mEndOfStream);
                    if (maybeOnSucceeded) {
                        CronetBidirectionalStream.this.maybeOnSucceededOnExecutor();
                    }
                }
            } catch (Exception e) {
                CronetBidirectionalStream.this.onCallbackException(e);
            }
        }
    }

    CronetBidirectionalStream(CronetUrlRequestContext requestContext, String url, int priority, BidirectionalStream.Callback callback, Executor executor, String httpMethod, List<Map.Entry<String, String>> requestHeaders, boolean delayRequestHeadersUntilNextFlush, Collection<Object> requestAnnotations, boolean trafficStatsTagSet, int trafficStatsTag, boolean trafficStatsUidSet, int trafficStatsUid, long networkHandle) {
        this.mRequestContext = requestContext;
        this.mInitialUrl = url;
        this.mInitialPriority = convertStreamPriority(priority);
        this.mCallback = new VersionSafeCallbacks.BidirectionalStreamCallback(callback);
        this.mExecutor = executor;
        this.mInitialMethod = httpMethod;
        this.mRequestHeaders = stringsFromHeaderList(requestHeaders);
        this.mDelayRequestHeadersUntilFirstFlush = delayRequestHeadersUntilNextFlush;
        this.mRequestAnnotations = requestAnnotations;
        this.mTrafficStatsTagSet = trafficStatsTagSet;
        this.mTrafficStatsTag = trafficStatsTag;
        this.mTrafficStatsUidSet = trafficStatsUidSet;
        this.mTrafficStatsUid = trafficStatsUid;
        this.mNetworkHandle = networkHandle;
    }

    @Override // org.chromium.net.BidirectionalStream
    public void start() {
        CronetBidirectionalStream cronetBidirectionalStream = this;
        synchronized (cronetBidirectionalStream.mNativeStreamLock) {
            try {
                if (cronetBidirectionalStream.mReadState != 0) {
                    throw new IllegalStateException("Stream is already started.");
                }
                try {
                    cronetBidirectionalStream.mNativeStream = CronetBidirectionalStreamJni.get().createBidirectionalStream(cronetBidirectionalStream, cronetBidirectionalStream.mRequestContext.getUrlRequestContextAdapter(), !cronetBidirectionalStream.mDelayRequestHeadersUntilFirstFlush, cronetBidirectionalStream.mTrafficStatsTagSet, cronetBidirectionalStream.mTrafficStatsTag, cronetBidirectionalStream.mTrafficStatsUidSet, cronetBidirectionalStream.mTrafficStatsUid, cronetBidirectionalStream.mNetworkHandle);
                    cronetBidirectionalStream.mRequestContext.onRequestStarted();
                    final CronetUrlRequestContext cronetUrlRequestContext = cronetBidirectionalStream.mRequestContext;
                    Objects.requireNonNull(cronetUrlRequestContext);
                    cronetBidirectionalStream.mInflightDoneCallbackCount = new RefCountDelegate(new Runnable() { // da classe: org.chromium.net.impl.CronetBidirectionalStream$$ExternalSyntheticLambda0
                        @Override // java.lang.Runnable
                        public final void run() {
                            CronetUrlRequestContext.this.onRequestFinished();
                        }
                    });
                    cronetBidirectionalStream.mInflightDoneCallbackCount.increment();
                } catch (RuntimeException e) {
                    e = e;
                }
                try {
                    int startResult = CronetBidirectionalStreamJni.get().start(cronetBidirectionalStream.mNativeStream, cronetBidirectionalStream, cronetBidirectionalStream.mInitialUrl, cronetBidirectionalStream.mInitialPriority, cronetBidirectionalStream.mInitialMethod, cronetBidirectionalStream.mRequestHeaders, !doesMethodAllowWriteData(cronetBidirectionalStream.mInitialMethod));
                    if (startResult == -1) {
                        throw new IllegalArgumentException("Invalid http method " + cronetBidirectionalStream.mInitialMethod);
                    }
                    if (startResult > 0) {
                        int headerPos = startResult - 1;
                        throw new IllegalArgumentException("Invalid header " + cronetBidirectionalStream.mRequestHeaders[headerPos] + "=" + cronetBidirectionalStream.mRequestHeaders[headerPos + 1]);
                    }
                    cronetBidirectionalStream.mWriteState = 1;
                    cronetBidirectionalStream.mReadState = 1;
                } catch (RuntimeException e2) {
                    e = e2;
                    cronetBidirectionalStream = cronetBidirectionalStream;
                    cronetBidirectionalStream.destroyNativeStreamLocked(false);
                    cronetBidirectionalStream.mInflightDoneCallbackCount.decrement();
                    cronetBidirectionalStream.mInflightDoneCallbackCount.decrement();
                    throw e;
                } catch (Throwable th) {
                    th = th;
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
            }
        }
    }

    @Override // org.chromium.net.BidirectionalStream
    public void read(ByteBuffer buffer) {
        synchronized (this.mNativeStreamLock) {
            try {
                try {
                    Preconditions.checkHasRemaining(buffer);
                    Preconditions.checkDirect(buffer);
                    if (this.mReadState != 2) {
                        throw new IllegalStateException("Unexpected read attempt.");
                    }
                    try {
                        if (isDoneLocked()) {
                            return;
                        }
                        if (this.mOnReadCompletedTask == null) {
                            this.mOnReadCompletedTask = new OnReadCompletedRunnable();
                        }
                        this.mReadState = 3;
                        if (!CronetBidirectionalStreamJni.get().readData(this.mNativeStream, this, buffer, buffer.position(), buffer.limit())) {
                            this.mReadState = 2;
                            throw new IllegalArgumentException("Unable to call native read");
                        }
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

    @Override // org.chromium.net.BidirectionalStream
    public void write(ByteBuffer buffer, boolean endOfStream) {
        synchronized (this.mNativeStreamLock) {
            Preconditions.checkDirect(buffer);
            if (!buffer.hasRemaining() && !endOfStream) {
                throw new IllegalArgumentException("Empty buffer before end of stream.");
            }
            if (this.mEndOfStreamWritten) {
                throw new IllegalArgumentException("Write after writing end of stream.");
            }
            if (isDoneLocked()) {
                return;
            }
            this.mPendingData.add(buffer);
            if (endOfStream) {
                this.mEndOfStreamWritten = true;
            }
        }
    }

    @Override // org.chromium.net.BidirectionalStream
    public void flush() {
        synchronized (this.mNativeStreamLock) {
            if (!isDoneLocked() && (this.mWriteState == 8 || this.mWriteState == 9)) {
                if (this.mPendingData.isEmpty() && this.mFlushData.isEmpty()) {
                    if (!this.mRequestHeadersSent) {
                        this.mRequestHeadersSent = true;
                        CronetBidirectionalStreamJni.get().sendRequestHeaders(this.mNativeStream, this);
                        if (!doesMethodAllowWriteData(this.mInitialMethod)) {
                            this.mWriteState = 10;
                        }
                    }
                    return;
                }
                if (this.mPendingData.isEmpty() && this.mFlushData.isEmpty()) {
                    throw new AssertionError();
                }
                if (!this.mPendingData.isEmpty()) {
                    this.mFlushData.addAll(this.mPendingData);
                    this.mPendingData.clear();
                }
                if (this.mWriteState == 9) {
                    return;
                }
                sendFlushDataLocked();
            }
        }
    }

    private void sendFlushDataLocked() {
        if (this.mWriteState != 8) {
            throw new AssertionError();
        }
        int size = this.mFlushData.size();
        ByteBuffer[] buffers = new ByteBuffer[size];
        int[] positions = new int[size];
        int[] limits = new int[size];
        for (int i = 0; i < size; i++) {
            ByteBuffer buffer = this.mFlushData.poll();
            buffers[i] = buffer;
            positions[i] = buffer.position();
            limits[i] = buffer.limit();
        }
        if (!this.mFlushData.isEmpty()) {
            throw new AssertionError();
        }
        if (buffers.length < 1) {
            throw new AssertionError();
        }
        this.mWriteState = 9;
        this.mRequestHeadersSent = true;
        if (!CronetBidirectionalStreamJni.get().writevData(this.mNativeStream, this, buffers, positions, limits, this.mEndOfStreamWritten && this.mPendingData.isEmpty())) {
            this.mWriteState = 8;
            throw new IllegalArgumentException("Unable to call native writev.");
        }
    }

    public List<ByteBuffer> getPendingDataForTesting() {
        List<ByteBuffer> pendingData;
        synchronized (this.mNativeStreamLock) {
            pendingData = new LinkedList<>();
            Iterator<ByteBuffer> it = this.mPendingData.iterator();
            while (it.hasNext()) {
                ByteBuffer buffer = it.next();
                pendingData.add(buffer.asReadOnlyBuffer());
            }
        }
        return pendingData;
    }

    public List<ByteBuffer> getFlushDataForTesting() {
        List<ByteBuffer> flushData;
        synchronized (this.mNativeStreamLock) {
            flushData = new LinkedList<>();
            Iterator<ByteBuffer> it = this.mFlushData.iterator();
            while (it.hasNext()) {
                ByteBuffer buffer = it.next();
                flushData.add(buffer.asReadOnlyBuffer());
            }
        }
        return flushData;
    }

    @Override // org.chromium.net.BidirectionalStream
    public void cancel() {
        synchronized (this.mNativeStreamLock) {
            if (!isDoneLocked() && this.mReadState != 0) {
                this.mWriteState = 5;
                this.mReadState = 5;
                destroyNativeStreamLocked(true);
            }
        }
    }

    @Override // org.chromium.net.BidirectionalStream
    public boolean isDone() {
        boolean isDoneLocked;
        synchronized (this.mNativeStreamLock) {
            isDoneLocked = isDoneLocked();
        }
        return isDoneLocked;
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public boolean isDoneLocked() {
        return this.mReadState != 0 && this.mNativeStream == 0;
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public void maybeOnSucceededOnExecutor() {
        synchronized (this.mNativeStreamLock) {
            if (isDoneLocked()) {
                return;
            }
            if (this.mWriteState == 10 && this.mReadState == 4) {
                this.mWriteState = 7;
                this.mReadState = 7;
                destroyNativeStreamLocked(false);
                try {
                    this.mCallback.onSucceeded(this, this.mResponseInfo);
                } catch (Exception e) {
                    Log.e(CronetUrlRequestContext.LOG_TAG, "Exception in onSucceeded method", (Throwable) e);
                }
                this.mInflightDoneCallbackCount.decrement();
            }
        }
    }

    private void onStreamReady(final boolean requestHeadersSent) {
        postTaskToExecutor(new Runnable() { // da classe: org.chromium.net.impl.CronetBidirectionalStream.1
            @Override // java.lang.Runnable
            public void run() {
                synchronized (CronetBidirectionalStream.this.mNativeStreamLock) {
                    if (CronetBidirectionalStream.this.isDoneLocked()) {
                        return;
                    }
                    CronetBidirectionalStream.this.mRequestHeadersSent = requestHeadersSent;
                    CronetBidirectionalStream.this.mReadState = 2;
                    if (!CronetBidirectionalStream.doesMethodAllowWriteData(CronetBidirectionalStream.this.mInitialMethod) && CronetBidirectionalStream.this.mRequestHeadersSent) {
                        CronetBidirectionalStream.this.mWriteState = 10;
                    } else {
                        CronetBidirectionalStream.this.mWriteState = 8;
                    }
                    try {
                        CronetBidirectionalStream.this.mCallback.onStreamReady(CronetBidirectionalStream.this);
                    } catch (Exception e) {
                        CronetBidirectionalStream.this.onCallbackException(e);
                    }
                }
            }
        });
    }

    private void onResponseHeadersReceived(int httpStatusCode, String negotiatedProtocol, String[] headers, long receivedByteCount) {
        try {
            this.mResponseInfo = prepareResponseInfoOnNetworkThread(httpStatusCode, negotiatedProtocol, headers, receivedByteCount);
            postTaskToExecutor(new Runnable() { // da classe: org.chromium.net.impl.CronetBidirectionalStream.2
                @Override // java.lang.Runnable
                public void run() {
                    synchronized (CronetBidirectionalStream.this.mNativeStreamLock) {
                        if (CronetBidirectionalStream.this.isDoneLocked()) {
                            return;
                        }
                        CronetBidirectionalStream.this.mReadState = 2;
                        try {
                            CronetBidirectionalStream.this.mCallback.onResponseHeadersReceived(CronetBidirectionalStream.this, CronetBidirectionalStream.this.mResponseInfo);
                        } catch (Exception e) {
                            CronetBidirectionalStream.this.onCallbackException(e);
                        }
                    }
                }
            });
        } catch (Exception e) {
            failWithException(new CronetExceptionImpl("Cannot prepare ResponseInfo", null));
        }
    }

    private void onReadCompleted(ByteBuffer byteBuffer, int bytesRead, int initialPosition, int initialLimit, long receivedByteCount) {
        this.mResponseInfo.setReceivedByteCount(receivedByteCount);
        if (byteBuffer.position() != initialPosition || byteBuffer.limit() != initialLimit) {
            failWithException(new CronetExceptionImpl("ByteBuffer modified externally during read", null));
            return;
        }
        if (bytesRead < 0 || initialPosition + bytesRead > initialLimit) {
            failWithException(new CronetExceptionImpl("Invalid number of bytes read", null));
            return;
        }
        if (this.mOnReadCompletedTask.mByteBuffer != null) {
            throw new AssertionError();
        }
        this.mOnReadCompletedTask.mByteBuffer = byteBuffer;
        this.mOnReadCompletedTask.mEndOfStream = bytesRead == 0;
        postTaskToExecutor(this.mOnReadCompletedTask);
    }

    private void onWritevCompleted(ByteBuffer[] byteBuffers, int[] initialPositions, int[] initialLimits, boolean endOfStream) {
        boolean z;
        if (byteBuffers.length != initialPositions.length) {
            throw new AssertionError();
        }
        if (byteBuffers.length != initialLimits.length) {
            throw new AssertionError();
        }
        synchronized (this.mNativeStreamLock) {
            if (isDoneLocked()) {
                return;
            }
            this.mWriteState = 8;
            if (!this.mFlushData.isEmpty()) {
                sendFlushDataLocked();
            }
            for (int i = 0; i < byteBuffers.length; i++) {
                ByteBuffer buffer = byteBuffers[i];
                if (buffer.position() != initialPositions[i] || buffer.limit() != initialLimits[i]) {
                    failWithException(new CronetExceptionImpl("ByteBuffer modified externally during write", null));
                    return;
                }
                if (endOfStream) {
                    z = true;
                    if (i == byteBuffers.length - 1) {
                        postTaskToExecutor(new OnWriteCompletedRunnable(buffer, z));
                    }
                }
                z = false;
                postTaskToExecutor(new OnWriteCompletedRunnable(buffer, z));
            }
        }
    }

    private void onResponseTrailersReceived(String[] trailers) {
        final UrlResponseInfo.HeaderBlock trailersBlock = new UrlResponseInfoImpl.HeaderBlockImpl(headersListFromStrings(trailers));
        postTaskToExecutor(new Runnable() { // da classe: org.chromium.net.impl.CronetBidirectionalStream.3
            @Override // java.lang.Runnable
            public void run() {
                synchronized (CronetBidirectionalStream.this.mNativeStreamLock) {
                    if (CronetBidirectionalStream.this.isDoneLocked()) {
                        return;
                    }
                    try {
                        CronetBidirectionalStream.this.mCallback.onResponseTrailersReceived(CronetBidirectionalStream.this, CronetBidirectionalStream.this.mResponseInfo, trailersBlock);
                    } catch (Exception e) {
                        CronetBidirectionalStream.this.onCallbackException(e);
                    }
                }
            }
        });
    }

    private void onError(int errorCode, int nativeError, int nativeQuicError, String errorString, long receivedByteCount) {
        if (this.mResponseInfo != null) {
            this.mResponseInfo.setReceivedByteCount(receivedByteCount);
        }
        if (errorCode == 10 || errorCode == 3) {
            failWithException(new QuicExceptionImpl("Exception in BidirectionalStream: " + errorString, errorCode, nativeError, nativeQuicError));
        } else {
            failWithException(new BidirectionalStreamNetworkException("Exception in BidirectionalStream: " + errorString, errorCode, nativeError));
        }
    }

    private void onCanceled() {
        postTaskToExecutor(new Runnable() { // da classe: org.chromium.net.impl.CronetBidirectionalStream.4
            @Override // java.lang.Runnable
            public void run() {
                try {
                    CronetBidirectionalStream.this.mCallback.onCanceled(CronetBidirectionalStream.this, CronetBidirectionalStream.this.mResponseInfo);
                } catch (Exception e) {
                    Log.e(CronetUrlRequestContext.LOG_TAG, "Exception in onCanceled method", (Throwable) e);
                }
                CronetBidirectionalStream.this.mInflightDoneCallbackCount.decrement();
            }
        });
    }

    private void onMetricsCollected(long requestStartMs, long dnsStartMs, long dnsEndMs, long connectStartMs, long connectEndMs, long sslStartMs, long sslEndMs, long sendingStartMs, long sendingEndMs, long pushStartMs, long pushEndMs, long responseStartMs, long requestEndMs, boolean socketReused, long sentByteCount, long receivedByteCount) {
        int finishedReason;
        synchronized (this.mNativeStreamLock) {
            try {
                if (this.mMetrics == null) {
                    this.mMetrics = new CronetMetrics(requestStartMs, dnsStartMs, dnsEndMs, connectStartMs, connectEndMs, sslStartMs, sslEndMs, sendingStartMs, sendingEndMs, pushStartMs, pushEndMs, responseStartMs, requestEndMs, socketReused, sentByteCount, receivedByteCount);
                    if (this.mReadState != this.mWriteState) {
                        throw new AssertionError();
                    }
                    if (this.mReadState != 7 && this.mReadState != 6 && this.mReadState != 5) {
                        throw new AssertionError();
                    }
                    if (this.mReadState == 7) {
                        finishedReason = 0;
                    } else {
                        int finishedReason2 = this.mReadState;
                        if (finishedReason2 == 5) {
                            finishedReason = 2;
                        } else {
                            finishedReason = 1;
                        }
                    }
                    RequestFinishedInfo requestFinishedInfo = new RequestFinishedInfoImpl(this.mInitialUrl, this.mRequestAnnotations, this.mMetrics, finishedReason, this.mResponseInfo, this.mException);
                    this.mRequestContext.reportRequestFinished(requestFinishedInfo, this.mInflightDoneCallbackCount);
                } else {
                    throw new IllegalStateException("Metrics collection should only happen once.");
                }
            } finally {
                this.mInflightDoneCallbackCount.decrement();
            }
        }
    }

    public void setOnDestroyedCallbackForTesting(Runnable onDestroyedCallbackForTesting) {
        this.mOnDestroyedCallbackForTesting = onDestroyedCallbackForTesting;
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static boolean doesMethodAllowWriteData(String methodName) {
        return (methodName.equals(HttpMethods.GET) || methodName.equals(HttpMethods.HEAD)) ? false : true;
    }

    private static ArrayList<Map.Entry<String, String>> headersListFromStrings(String[] headers) {
        ArrayList<Map.Entry<String, String>> headersList = new ArrayList<>(headers.length / 2);
        for (int i = 0; i < headers.length; i += 2) {
            headersList.add(new AbstractMap.SimpleImmutableEntry(headers[i], headers[i + 1]));
        }
        return headersList;
    }

    private static String[] stringsFromHeaderList(List<Map.Entry<String, String>> headersList) {
        String[] headersArray = new String[headersList.size() * 2];
        int i = 0;
        for (Map.Entry<String, String> requestHeader : headersList) {
            int i2 = i + 1;
            headersArray[i] = requestHeader.getKey();
            i = i2 + 1;
            headersArray[i2] = requestHeader.getValue();
        }
        return headersArray;
    }

    private static int convertStreamPriority(int priority) {
        switch (priority) {
            case 0:
                return 1;
            case 1:
                return 2;
            case 2:
                return 3;
            case 3:
                return 4;
            case 4:
                return 5;
            default:
                throw new IllegalArgumentException("Invalid stream priority.");
        }
    }

    private void postTaskToExecutor(Runnable task) {
        try {
            this.mExecutor.execute(task);
        } catch (RejectedExecutionException failException) {
            Log.e(CronetUrlRequestContext.LOG_TAG, "Exception posting task to executor", (Throwable) failException);
            synchronized (this.mNativeStreamLock) {
                this.mWriteState = 6;
                this.mReadState = 6;
                destroyNativeStreamLocked(false);
            }
        }
    }

    private UrlResponseInfoImpl prepareResponseInfoOnNetworkThread(int httpStatusCode, String negotiatedProtocol, String[] headers, long receivedByteCount) {
        UrlResponseInfoImpl responseInfo = new UrlResponseInfoImpl(Arrays.asList(this.mInitialUrl), httpStatusCode, "", headersListFromStrings(headers), false, negotiatedProtocol, null, receivedByteCount);
        return responseInfo;
    }

    private void destroyNativeStreamLocked(boolean sendOnCanceled) {
        Log.i(CronetUrlRequestContext.LOG_TAG, "destroyNativeStreamLocked " + toString());
        if (this.mNativeStream == 0) {
            return;
        }
        CronetBidirectionalStreamJni.get().destroy(this.mNativeStream, this, sendOnCanceled);
        this.mRequestContext.onRequestDestroyed();
        this.mNativeStream = 0L;
        if (this.mOnDestroyedCallbackForTesting != null) {
            this.mOnDestroyedCallbackForTesting.run();
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public void failWithExceptionOnExecutor(CronetException e) {
        this.mException = e;
        synchronized (this.mNativeStreamLock) {
            if (isDoneLocked()) {
                return;
            }
            this.mWriteState = 6;
            this.mReadState = 6;
            destroyNativeStreamLocked(false);
            try {
                this.mCallback.onFailed(this, this.mResponseInfo, e);
            } catch (Exception failException) {
                Log.e(CronetUrlRequestContext.LOG_TAG, "Exception notifying of failed request", (Throwable) failException);
            }
            this.mInflightDoneCallbackCount.decrement();
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public void onCallbackException(Exception e) {
        CallbackException streamError = new CallbackExceptionImpl("CalledByNative method has thrown an exception", e);
        Log.e(CronetUrlRequestContext.LOG_TAG, "Exception in CalledByNative method", (Throwable) e);
        failWithExceptionOnExecutor(streamError);
    }

    private void failWithException(final CronetException exception) {
        postTaskToExecutor(new Runnable() { // da classe: org.chromium.net.impl.CronetBidirectionalStream.5
            @Override // java.lang.Runnable
            public void run() {
                CronetBidirectionalStream.this.failWithExceptionOnExecutor(exception);
            }
        });
    }
}
