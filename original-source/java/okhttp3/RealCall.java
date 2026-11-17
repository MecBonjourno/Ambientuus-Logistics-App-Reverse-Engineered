package okhttp3;

import androidx.core.app.NotificationCompat;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.atomic.AtomicInteger;
import okhttp3.Interceptor;
import okhttp3.internal.NamedRunnable;
import okhttp3.internal.Util;
import okhttp3.internal.cache.CacheInterceptor;
import okhttp3.internal.connection.ConnectInterceptor;
import okhttp3.internal.connection.Transmitter;
import okhttp3.internal.http.BridgeInterceptor;
import okhttp3.internal.http.CallServerInterceptor;
import okhttp3.internal.http.RealInterceptorChain;
import okhttp3.internal.http.RetryAndFollowUpInterceptor;
import okhttp3.internal.platform.Platform;
import okio.Timeout;

/* loaded from: classes17.dex */
final class RealCall implements Call {
    final OkHttpClient client;
    private boolean executed;
    final boolean forWebSocket;
    final Request originalRequest;
    private Transmitter transmitter;

    private RealCall(OkHttpClient client, Request originalRequest, boolean forWebSocket) {
        this.client = client;
        this.originalRequest = originalRequest;
        this.forWebSocket = forWebSocket;
    }

    static RealCall newRealCall(OkHttpClient client, Request originalRequest, boolean forWebSocket) {
        RealCall call = new RealCall(client, originalRequest, forWebSocket);
        call.transmitter = new Transmitter(client, call);
        return call;
    }

    @Override // okhttp3.Call
    public Request request() {
        return this.originalRequest;
    }

    @Override // okhttp3.Call
    public Response execute() throws IOException {
        synchronized (this) {
            if (this.executed) {
                throw new IllegalStateException("Already Executed");
            }
            this.executed = true;
        }
        this.transmitter.timeoutEnter();
        this.transmitter.callStart();
        try {
            this.client.dispatcher().executed(this);
            return getResponseWithInterceptorChain();
        } finally {
            this.client.dispatcher().finished(this);
        }
    }

    @Override // okhttp3.Call
    public void enqueue(Callback responseCallback) {
        synchronized (this) {
            if (this.executed) {
                throw new IllegalStateException("Already Executed");
            }
            this.executed = true;
        }
        this.transmitter.callStart();
        this.client.dispatcher().enqueue(new AsyncCall(responseCallback));
    }

    @Override // okhttp3.Call
    public void cancel() {
        this.transmitter.cancel();
    }

    @Override // okhttp3.Call
    public Timeout timeout() {
        return this.transmitter.timeout();
    }

    @Override // okhttp3.Call
    public synchronized boolean isExecuted() {
        return this.executed;
    }

    @Override // okhttp3.Call
    public boolean isCanceled() {
        return this.transmitter.isCanceled();
    }

    @Override // okhttp3.Call
    public RealCall clone() {
        return newRealCall(this.client, this.originalRequest, this.forWebSocket);
    }

    final class AsyncCall extends NamedRunnable {
        static final /* synthetic */ boolean $assertionsDisabled = false;
        private volatile AtomicInteger callsPerHost;
        private final Callback responseCallback;

        AsyncCall(Callback responseCallback) {
            super("OkHttp %s", RealCall.this.redactedUrl());
            this.callsPerHost = new AtomicInteger(0);
            this.responseCallback = responseCallback;
        }

        AtomicInteger callsPerHost() {
            return this.callsPerHost;
        }

        void reuseCallsPerHostFrom(AsyncCall other) {
            this.callsPerHost = other.callsPerHost;
        }

        String host() {
            return RealCall.this.originalRequest.url().host();
        }

        Request request() {
            return RealCall.this.originalRequest;
        }

        RealCall get() {
            return RealCall.this;
        }

        void executeOn(ExecutorService executorService) {
            if (Thread.holdsLock(RealCall.this.client.dispatcher())) {
                throw new AssertionError();
            }
            try {
                try {
                    executorService.execute(this);
                    if (1 != 0) {
                        return;
                    }
                } catch (RejectedExecutionException e) {
                    InterruptedIOException ioException = new InterruptedIOException("executor rejected");
                    ioException.initCause(e);
                    RealCall.this.transmitter.noMoreExchanges(ioException);
                    this.responseCallback.onFailure(RealCall.this, ioException);
                    if (0 != 0) {
                        return;
                    }
                }
                RealCall.this.client.dispatcher().finished(this);
            } catch (Throwable th) {
                if (0 == 0) {
                    RealCall.this.client.dispatcher().finished(this);
                }
                throw th;
            }
        }

        @Override // okhttp3.internal.NamedRunnable
        protected void execute() {
            boolean signalledCallback = false;
            RealCall.this.transmitter.timeoutEnter();
            try {
                try {
                    try {
                        Response response = RealCall.this.getResponseWithInterceptorChain();
                        signalledCallback = true;
                        this.responseCallback.onResponse(RealCall.this, response);
                    } catch (Throwable t) {
                        RealCall.this.cancel();
                        if (!signalledCallback) {
                            IOException canceledException = new IOException("canceled due to " + t);
                            canceledException.addSuppressed(t);
                            this.responseCallback.onFailure(RealCall.this, canceledException);
                        }
                        throw t;
                    }
                } catch (IOException e) {
                    if (signalledCallback) {
                        Platform.get().log(4, "Callback failure for " + RealCall.this.toLoggableString(), e);
                    } else {
                        this.responseCallback.onFailure(RealCall.this, e);
                    }
                }
                RealCall.this.client.dispatcher().finished(this);
            } catch (Throwable t2) {
                RealCall.this.client.dispatcher().finished(this);
                throw t2;
            }
        }
    }

    String toLoggableString() {
        return (isCanceled() ? "canceled " : "") + (this.forWebSocket ? "web socket" : NotificationCompat.CATEGORY_CALL) + " to " + redactedUrl();
    }

    String redactedUrl() {
        return this.originalRequest.url().redact();
    }

    Response getResponseWithInterceptorChain() throws IOException {
        List<Interceptor> interceptors = new ArrayList<>();
        interceptors.addAll(this.client.interceptors());
        interceptors.add(new RetryAndFollowUpInterceptor(this.client));
        interceptors.add(new BridgeInterceptor(this.client.cookieJar()));
        interceptors.add(new CacheInterceptor(this.client.internalCache()));
        interceptors.add(new ConnectInterceptor(this.client));
        if (!this.forWebSocket) {
            interceptors.addAll(this.client.networkInterceptors());
        }
        interceptors.add(new CallServerInterceptor(this.forWebSocket));
        Interceptor.Chain chain = new RealInterceptorChain(interceptors, this.transmitter, null, 0, this.originalRequest, this, this.client.connectTimeoutMillis(), this.client.readTimeoutMillis(), this.client.writeTimeoutMillis());
        boolean calledNoMoreExchanges = false;
        try {
            try {
                Response response = chain.proceed(this.originalRequest);
                if (this.transmitter.isCanceled()) {
                    Util.closeQuietly(response);
                    throw new IOException("Canceled");
                }
                return response;
            } catch (IOException e) {
                calledNoMoreExchanges = true;
                throw this.transmitter.noMoreExchanges(e);
            }
        } finally {
            if (!calledNoMoreExchanges) {
                this.transmitter.noMoreExchanges(null);
            }
        }
    }
}
