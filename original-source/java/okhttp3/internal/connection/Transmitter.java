package okhttp3.internal.connection;

import java.io.IOException;
import java.io.InterruptedIOException;
import java.lang.ref.Reference;
import java.lang.ref.WeakReference;
import java.net.Socket;
import java.util.concurrent.TimeUnit;
import javax.annotation.Nullable;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLSocketFactory;
import okhttp3.Address;
import okhttp3.Call;
import okhttp3.CertificatePinner;
import okhttp3.Connection;
import okhttp3.EventListener;
import okhttp3.HttpUrl;
import okhttp3.Interceptor;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.internal.Internal;
import okhttp3.internal.Util;
import okhttp3.internal.http.ExchangeCodec;
import okhttp3.internal.platform.Platform;
import okio.AsyncTimeout;
import okio.Timeout;

/* loaded from: classes17.dex */
public final class Transmitter {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private final Call call;

    @Nullable
    private Object callStackTrace;
    private boolean canceled;
    private final OkHttpClient client;
    public RealConnection connection;
    private final RealConnectionPool connectionPool;
    private final EventListener eventListener;

    @Nullable
    private Exchange exchange;
    private ExchangeFinder exchangeFinder;
    private boolean exchangeRequestDone;
    private boolean exchangeResponseDone;
    private boolean noMoreExchanges;
    private Request request;
    private final AsyncTimeout timeout = new AsyncTimeout() { // from class: okhttp3.internal.connection.Transmitter.1
        @Override // okio.AsyncTimeout
        protected void timedOut() {
            Transmitter.this.cancel();
        }
    };
    private boolean timeoutEarlyExit;

    public Transmitter(OkHttpClient client, Call call) {
        this.client = client;
        this.connectionPool = Internal.instance.realConnectionPool(client.connectionPool());
        this.call = call;
        this.eventListener = client.eventListenerFactory().create(call);
        this.timeout.timeout(client.callTimeoutMillis(), TimeUnit.MILLISECONDS);
    }

    public Timeout timeout() {
        return this.timeout;
    }

    public void timeoutEnter() {
        this.timeout.enter();
    }

    public void timeoutEarlyExit() {
        if (this.timeoutEarlyExit) {
            throw new IllegalStateException();
        }
        this.timeoutEarlyExit = true;
        this.timeout.exit();
    }

    @Nullable
    private IOException timeoutExit(@Nullable IOException cause) {
        if (this.timeoutEarlyExit || !this.timeout.exit()) {
            return cause;
        }
        InterruptedIOException e = new InterruptedIOException("timeout");
        if (cause != null) {
            e.initCause(cause);
        }
        return e;
    }

    public void callStart() {
        this.callStackTrace = Platform.get().getStackTraceForCloseable("response.body().close()");
        this.eventListener.callStart(this.call);
    }

    public void prepareToConnect(Request request) {
        if (this.request != null) {
            if (Util.sameConnection(this.request.url(), request.url()) && this.exchangeFinder.hasRouteToTry()) {
                return;
            }
            if (this.exchange != null) {
                throw new IllegalStateException();
            }
            if (this.exchangeFinder != null) {
                maybeReleaseConnection(null, true);
                this.exchangeFinder = null;
            }
        }
        this.request = request;
        this.exchangeFinder = new ExchangeFinder(this, this.connectionPool, createAddress(request.url()), this.call, this.eventListener);
    }

    private Address createAddress(HttpUrl url) {
        SSLSocketFactory sslSocketFactory;
        HostnameVerifier hostnameVerifier;
        CertificatePinner certificatePinner;
        if (!url.isHttps()) {
            sslSocketFactory = null;
            hostnameVerifier = null;
            certificatePinner = null;
        } else {
            SSLSocketFactory sslSocketFactory2 = this.client.sslSocketFactory();
            HostnameVerifier hostnameVerifier2 = this.client.hostnameVerifier();
            CertificatePinner certificatePinner2 = this.client.certificatePinner();
            sslSocketFactory = sslSocketFactory2;
            hostnameVerifier = hostnameVerifier2;
            certificatePinner = certificatePinner2;
        }
        return new Address(url.host(), url.port(), this.client.dns(), this.client.socketFactory(), sslSocketFactory, hostnameVerifier, certificatePinner, this.client.proxyAuthenticator(), this.client.proxy(), this.client.protocols(), this.client.connectionSpecs(), this.client.proxySelector());
    }

    Exchange newExchange(Interceptor.Chain chain, boolean doExtensiveHealthChecks) {
        synchronized (this.connectionPool) {
            try {
                try {
                    if (this.noMoreExchanges) {
                        throw new IllegalStateException("released");
                    }
                    if (this.exchange != null) {
                        throw new IllegalStateException("cannot make a new request because the previous response is still open: please call response.close()");
                    }
                    ExchangeCodec codec = this.exchangeFinder.find(this.client, chain, doExtensiveHealthChecks);
                    Exchange result = new Exchange(this, this.call, this.eventListener, this.exchangeFinder, codec);
                    synchronized (this.connectionPool) {
                        this.exchange = result;
                        this.exchangeRequestDone = false;
                        this.exchangeResponseDone = false;
                    }
                    return result;
                } catch (Throwable th) {
                    th = th;
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
            }
        }
    }

    void acquireConnectionNoEvents(RealConnection connection) {
        if (!Thread.holdsLock(this.connectionPool)) {
            throw new AssertionError();
        }
        if (this.connection != null) {
            throw new IllegalStateException();
        }
        this.connection = connection;
        connection.transmitters.add(new TransmitterReference(this, this.callStackTrace));
    }

    @Nullable
    Socket releaseConnectionNoEvents() {
        if (!Thread.holdsLock(this.connectionPool)) {
            throw new AssertionError();
        }
        int index = -1;
        int i = 0;
        int size = this.connection.transmitters.size();
        while (true) {
            if (i >= size) {
                break;
            }
            Reference<Transmitter> reference = this.connection.transmitters.get(i);
            if (reference.get() != this) {
                i++;
            } else {
                index = i;
                break;
            }
        }
        if (index == -1) {
            throw new IllegalStateException();
        }
        RealConnection released = this.connection;
        released.transmitters.remove(index);
        this.connection = null;
        if (released.transmitters.isEmpty()) {
            released.idleAtNanos = System.nanoTime();
            if (this.connectionPool.connectionBecameIdle(released)) {
                return released.socket();
            }
        }
        return null;
    }

    public void exchangeDoneDueToException() {
        synchronized (this.connectionPool) {
            if (this.noMoreExchanges) {
                throw new IllegalStateException();
            }
            this.exchange = null;
        }
    }

    @Nullable
    IOException exchangeMessageDone(Exchange exchange, boolean requestDone, boolean responseDone, @Nullable IOException e) {
        boolean exchangeDone = false;
        synchronized (this.connectionPool) {
            if (exchange != this.exchange) {
                return e;
            }
            if (requestDone) {
                changed = this.exchangeRequestDone ? false : true;
                this.exchangeRequestDone = true;
            }
            if (responseDone) {
                if (!this.exchangeResponseDone) {
                    changed = true;
                }
                this.exchangeResponseDone = true;
            }
            if (this.exchangeRequestDone && this.exchangeResponseDone && changed) {
                exchangeDone = true;
                this.exchange.connection().successCount++;
                this.exchange = null;
            }
            if (exchangeDone) {
                return maybeReleaseConnection(e, false);
            }
            return e;
        }
    }

    @Nullable
    public IOException noMoreExchanges(@Nullable IOException e) {
        synchronized (this.connectionPool) {
            this.noMoreExchanges = true;
        }
        return maybeReleaseConnection(e, false);
    }

    @Nullable
    private IOException maybeReleaseConnection(@Nullable IOException e, boolean force) {
        Connection releasedConnection;
        Socket socket;
        boolean callEnd;
        synchronized (this.connectionPool) {
            if (force) {
                if (this.exchange != null) {
                    throw new IllegalStateException("cannot release connection while it is in use");
                }
            }
            releasedConnection = this.connection;
            if (this.connection != null && this.exchange == null && (force || this.noMoreExchanges)) {
                socket = releaseConnectionNoEvents();
            } else {
                socket = null;
            }
            if (this.connection != null) {
                releasedConnection = null;
            }
            callEnd = this.noMoreExchanges && this.exchange == null;
        }
        Util.closeQuietly(socket);
        if (releasedConnection != null) {
            this.eventListener.connectionReleased(this.call, releasedConnection);
        }
        if (callEnd) {
            boolean callFailed = e != null;
            e = timeoutExit(e);
            if (callFailed) {
                this.eventListener.callFailed(this.call, e);
            } else {
                this.eventListener.callEnd(this.call);
            }
        }
        return e;
    }

    public boolean canRetry() {
        return this.exchangeFinder.hasStreamFailure() && this.exchangeFinder.hasRouteToTry();
    }

    public boolean hasExchange() {
        boolean z;
        synchronized (this.connectionPool) {
            z = this.exchange != null;
        }
        return z;
    }

    public void cancel() {
        Exchange exchangeToCancel;
        RealConnection connectionToCancel;
        synchronized (this.connectionPool) {
            this.canceled = true;
            exchangeToCancel = this.exchange;
            if (this.exchangeFinder != null && this.exchangeFinder.connectingConnection() != null) {
                connectionToCancel = this.exchangeFinder.connectingConnection();
            } else {
                connectionToCancel = this.connection;
            }
        }
        if (exchangeToCancel != null) {
            exchangeToCancel.cancel();
        } else if (connectionToCancel != null) {
            connectionToCancel.cancel();
        }
    }

    public boolean isCanceled() {
        boolean z;
        synchronized (this.connectionPool) {
            z = this.canceled;
        }
        return z;
    }

    static final class TransmitterReference extends WeakReference<Transmitter> {
        final Object callStackTrace;

        TransmitterReference(Transmitter referent, Object callStackTrace) {
            super(referent);
            this.callStackTrace = callStackTrace;
        }
    }
}
