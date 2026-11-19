package okhttp3.internal.connection;

import com.google.android.gms.fido.fido2.api.common.DevicePublicKeyStringDef;
import com.google.api.client.http.HttpMethods;
import com.google.common.net.HttpHeaders;
import java.io.IOException;
import java.lang.ref.Reference;
import java.net.ConnectException;
import java.net.Proxy;
import java.net.Socket;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.security.cert.Certificate;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import javax.annotation.Nullable;
import javax.net.ssl.SSLPeerUnverifiedException;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;
import okhttp3.Address;
import okhttp3.Call;
import okhttp3.CertificatePinner;
import okhttp3.Connection;
import okhttp3.ConnectionSpec;
import okhttp3.EventListener;
import okhttp3.Handshake;
import okhttp3.HttpUrl;
import okhttp3.Interceptor;
import okhttp3.OkHttpClient;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.Route;
import okhttp3.internal.Internal;
import okhttp3.internal.Util;
import okhttp3.internal.Version;
import okhttp3.internal.http.ExchangeCodec;
import okhttp3.internal.http1.Http1ExchangeCodec;
import okhttp3.internal.http2.ConnectionShutdownException;
import okhttp3.internal.http2.ErrorCode;
import okhttp3.internal.http2.Http2Connection;
import okhttp3.internal.http2.Http2ExchangeCodec;
import okhttp3.internal.http2.Http2Stream;
import okhttp3.internal.http2.StreamResetException;
import okhttp3.internal.platform.Platform;
import okhttp3.internal.tls.OkHostnameVerifier;
import okhttp3.internal.ws.RealWebSocket;
import okio.BufferedSink;
import okio.BufferedSource;
import okio.Okio;

/* carregado de: classes17.dex */
public final class RealConnection extends Http2Connection.Listener implements Connection {
    static final /* sintético */ boolean $assertionsDisabled = false;
    private static final int MAX_TUNNEL_ATTEMPTS = 21;
    private static final String NPE_THROW_WITH_NULL = "throw with null exception";
    public final RealConnectionPool connectionPool;
    private Handshake handshake;
    private Http2Connection http2Connection;
    boolean noNewExchanges;
    private Protocol protocol;
    private Socket rawSocket;
    private int refusedStreamCount;
    private final Route route;
    int routeFailureCount;
    private BufferedSink sink;
    private Socket socket;
    private BufferedSource source;
    int successCount;
    private int allocationLimit = 1;
    final List<Reference<Transmitter>> transmitters = new ArrayList();
    long idleAtNanos = Long.MAX_VALUE;

    public RealConnection(RealConnectionPool connectionPool, Route route) {
        this.connectionPool = connectionPool;
        this.route = route;
    }

    public void noNewExchanges() {
        if (Thread.holdsLock(this.connectionPool)) {
            throw new AssertionError();
        }
        synchronized (this.connectionPool) {
            this.noNewExchanges = true;
        }
    }

    static RealConnection testConnection(RealConnectionPool connectionPool, Route route, Socket socket, long idleAtNanos) {
        RealConnection result = new RealConnection(connectionPool, route);
        result.socket = socket;
        result.idleAtNanos = idleAtNanos;
        return result;
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    /* JADX WARN: região duplicada removida para o bloco: B:37:0x00e5  */
    /* JADX WARN: região duplicada removida para o bloco: B:48:0x00f5 A[ORIG_RETURN, RETURN] */
    /* JADX WARN: região duplicada removida para o bloco: B:52:0x0130  */
    /* JADX WARN: região duplicada removida para o bloco: B:54:0x013c  */
    /* JADX WARN: região duplicada removida para o bloco: B:59:0x0144 A[SYNTHETIC] */
    /* JADX WARN: região duplicada removida para o bloco: B:61:0x0137  */
    /* JADX WARN: falha na inferência de tipo para: r1v10, types: [boolean] */
    /* JADX WARN: falha na inferência de tipo para: r1v29, types: [java.lang.String] */
    /* JADX WARN: falha na inferência de tipo para: r2v0, types: [java.lang.Object, okhttp3.Protocol] */
    /* JADX WARN: falha na inferência de tipo para: r2v14, types: [okhttp3.internal.platform.Platform] */
    /* JADX WARN: falha na inferência de tipo para: r2v15, types: [boolean] */
    /* JADX WARN: falha na inferência de tipo para: r4v4, types: [java.lang.StringBuilder] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void connect(int r13, int r14, int r15, int r16, boolean r17, okhttp3.Call r18, okhttp3.EventListener r19) {
        /*
            Method dump skipped, instructions count: 352
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: okhttp3.internal.connection.RealConnection.connect(int, int, int, int, boolean, okhttp3.Call, okhttp3.EventListener):void");
    }

    private void connectTunnel(int connectTimeout, int readTimeout, int writeTimeout, Call call, EventListener eventListener) throws IOException {
        Request tunnelRequest = createTunnelRequest();
        HttpUrl url = tunnelRequest.url();
        for (int i = 0; i < 21; i++) {
            connectSocket(connectTimeout, readTimeout, call, eventListener);
            tunnelRequest = createTunnel(readTimeout, writeTimeout, tunnelRequest, url);
            if (tunnelRequest != null) {
                Util.closeQuietly(this.rawSocket);
                this.rawSocket = null;
                this.sink = null;
                this.source = null;
                eventListener.connectEnd(call, this.route.socketAddress(), this.route.proxy(), null);
            } else {
                return;
            }
        }
    }

    private void connectSocket(int connectTimeout, int readTimeout, Call call, EventListener eventListener) throws IOException {
        Socket createSocket;
        Proxy proxy = this.route.proxy();
        Address address = this.route.address();
        if (proxy.type() == Proxy.Type.DIRECT || proxy.type() == Proxy.Type.HTTP) {
            createSocket = address.socketFactory().createSocket();
        } else {
            createSocket = new Socket(proxy);
        }
        this.rawSocket = createSocket;
        eventListener.connectStart(call, this.route.socketAddress(), proxy);
        this.rawSocket.setSoTimeout(readTimeout);
        try {
            Platform.get().connectSocket(this.rawSocket, this.route.socketAddress(), connectTimeout);
            try {
                this.source = Okio.buffer(Okio.source(this.rawSocket));
                this.sink = Okio.buffer(Okio.sink(this.rawSocket));
            } catch (NullPointerException npe) {
                if (NPE_THROW_WITH_NULL.equals(npe.getMessage())) {
                    throw new IOException(npe);
                }
            }
        } catch (ConnectException e) {
            ConnectException ce = new ConnectException("Failed to connect to " + this.route.socketAddress());
            ce.initCause(e);
            throw ce;
        }
    }

    private void establishProtocol(ConnectionSpecSelector connectionSpecSelector, int pingIntervalMillis, Call call, EventListener eventListener) throws IOException {
        if (this.route.address().sslSocketFactory() == null) {
            if (this.route.address().protocols().contains(Protocol.H2_PRIOR_KNOWLEDGE)) {
                this.socket = this.rawSocket;
                this.protocol = Protocol.H2_PRIOR_KNOWLEDGE;
                startHttp2(pingIntervalMillis);
                return;
            } else {
                this.socket = this.rawSocket;
                this.protocol = Protocol.HTTP_1_1;
                return;
            }
        }
        eventListener.secureConnectStart(call);
        connectTls(connectionSpecSelector);
        eventListener.secureConnectEnd(call, this.handshake);
        if (this.protocol == Protocol.HTTP_2) {
            startHttp2(pingIntervalMillis);
        }
    }

    private void startHttp2(int pingIntervalMillis) throws IOException {
        this.socket.setSoTimeout(0);
        this.http2Connection = new Http2Connection.Builder(true).socket(this.socket, this.route.address().url().host(), this.source, this.sink).listener(this).pingIntervalMillis(pingIntervalMillis).build();
        this.http2Connection.start();
    }

    private void connectTls(ConnectionSpecSelector connectionSpecSelector) throws IOException {
        String maybeProtocol;
        Protocol protocol;
        Address address = this.route.address();
        SSLSocketFactory sslSocketFactory = address.sslSocketFactory();
        boolean success = false;
        SSLSocket sslSocket = null;
        try {
            try {
                sslSocket = (SSLSocket) sslSocketFactory.createSocket(this.rawSocket, address.url().host(), address.url().port(), true);
                ConnectionSpec connectionSpec = connectionSpecSelector.configureSecureSocket(sslSocket);
                if (connectionSpec.supportsTlsExtensions()) {
                    Platform.get().configureTlsExtensions(sslSocket, address.url().host(), address.protocols());
                }
                sslSocket.startHandshake();
                SSLSession sslSocketSession = sslSocket.getSession();
                Handshake unverifiedHandshake = Handshake.get(sslSocketSession);
                if (!address.hostnameVerifier().verify(address.url().host(), sslSocketSession)) {
                    List<Certificate> peerCertificates = unverifiedHandshake.peerCertificates();
                    if (!peerCertificates.isEmpty()) {
                        X509Certificate cert = (X509Certificate) peerCertificates.get(0);
                        throw new SSLPeerUnverifiedException("Hostname " + address.url().host() + " not verified:\n    certificate: " + CertificatePinner.pin(cert) + "\n    DN: " + cert.getSubjectDN().getName() + "\n    subjectAltNames: " + OkHostnameVerifier.allSubjectAltNames(cert));
                    }
                    throw new SSLPeerUnverifiedException("Hostname " + address.url().host() + " not verified (no certificates)");
                }
                address.certificatePinner().check(address.url().host(), unverifiedHandshake.peerCertificates());
                if (connectionSpec.supportsTlsExtensions()) {
                    maybeProtocol = Platform.get().getSelectedProtocol(sslSocket);
                } else {
                    maybeProtocol = null;
                }
                this.socket = sslSocket;
                this.source = Okio.buffer(Okio.source(this.socket));
                this.sink = Okio.buffer(Okio.sink(this.socket));
                this.handshake = unverifiedHandshake;
                if (maybeProtocol != null) {
                    protocol = Protocol.get(maybeProtocol);
                } else {
                    protocol = Protocol.HTTP_1_1;
                }
                this.protocol = protocol;
                success = true;
            } catch (AssertionError e) {
                if (!Util.isAndroidGetsocknameError(e)) {
                    throw e;
                }
                throw new IOException(e);
            }
        } finally {
            if (sslSocket != null) {
                Platform.get().afterHandshake(sslSocket);
            }
            if (!success) {
                Util.closeQuietly((Socket) sslSocket);
            }
        }
    }

    /*  JADX ERROR: JadxRuntimeException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Failed to find switch 'out' block (already processed)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.calcSwitchOut(SwitchRegionMaker.java:202)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.process(SwitchRegionMaker.java:61)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:115)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:69)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.process(LoopRegionMaker.java:103)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:92)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:69)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeMthRegion(RegionMaker.java:49)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:25)
        */
    private okhttp3.Request createTunnel(int r8, int r9, okhttp3.Request r10, okhttp3.HttpUrl r11) throws java.io.IOException {
        /*
            r7 = this;
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            r0.<init>()
            java.lang.String r1 = "CONNECT "
            java.lang.StringBuilder r0 = r0.append(r1)
            r1 = 1
            java.lang.String r1 = okhttp3.internal.Util.hostHeader(r11, r1)
            java.lang.StringBuilder r0 = r0.append(r1)
            java.lang.String r1 = " HTTP/1.1"
            java.lang.StringBuilder r0 = r0.append(r1)
            java.lang.String r0 = r0.toString()
        L1e:
            okhttp3.internal.http1.Http1ExchangeCodec r1 = new okhttp3.internal.http1.Http1ExchangeCodec
            okio.BufferedSource r2 = r7.source
            okio.BufferedSink r3 = r7.sink
            r4 = 0
            r1.<init>(r4, r4, r2, r3)
            okio.BufferedSource r2 = r7.source
            okio.Timeout r2 = r2.timeout()
            long r5 = (long) r8
            java.util.concurrent.TimeUnit r3 = java.util.concurrent.TimeUnit.MILLISECONDS
            r2.timeout(r5, r3)
            okio.BufferedSink r2 = r7.sink
            okio.Timeout r2 = r2.timeout()
            long r5 = (long) r9
            java.util.concurrent.TimeUnit r3 = java.util.concurrent.TimeUnit.MILLISECONDS
            r2.timeout(r5, r3)
            okhttp3.Headers r2 = r10.headers()
            r1.writeRequest(r2, r0)
            r1.finishRequest()
            r2 = 0
            okhttp3.Response$Builder r2 = r1.readResponseHeaders(r2)
            okhttp3.Response$Builder r2 = r2.request(r10)
            okhttp3.Response r2 = r2.build()
            r1.skipConnectBody(r2)
            int r3 = r2.code()
            switch(r3) {
                case 200: goto La9;
                case 407: goto L7e;
                default: goto L61;
            }
        L61:
            java.io.IOException r3 = new java.io.IOException
            java.lang.StringBuilder r4 = new java.lang.StringBuilder
            r4.<init>()
            java.lang.String r5 = "Unexpected response code for CONNECT: "
            java.lang.StringBuilder r4 = r4.append(r5)
            int r5 = r2.code()
            java.lang.StringBuilder r4 = r4.append(r5)
            java.lang.String r4 = r4.toString()
            r3.<init>(r4)
            throw r3
        L7e:
            okhttp3.Route r3 = r7.route
            okhttp3.Address r3 = r3.address()
            okhttp3.Authenticator r3 = r3.proxyAuthenticator()
            okhttp3.Route r4 = r7.route
            okhttp3.Request r10 = r3.authenticate(r4, r2)
            if (r10 == 0) goto La1
            java.lang.String r3 = "Connection"
            java.lang.String r3 = r2.header(r3)
            java.lang.String r4 = "close"
            boolean r3 = r4.equalsIgnoreCase(r3)
            if (r3 == 0) goto L9f
            return r10
        L9f:
            goto L1e
        La1:
            java.io.IOException r3 = new java.io.IOException
            java.lang.String r4 = "Failed to authenticate with proxy"
            r3.<init>(r4)
            throw r3
        La9:
            okio.BufferedSource r3 = r7.source
            okio.Buffer r3 = r3.getBuffer()
            boolean r3 = r3.exhausted()
            if (r3 == 0) goto Lc2
            okio.BufferedSink r3 = r7.sink
            okio.Buffer r3 = r3.buffer()
            boolean r3 = r3.exhausted()
            if (r3 == 0) goto Lc2
            return r4
        Lc2:
            java.io.IOException r3 = new java.io.IOException
            java.lang.String r4 = "TLS tunnel buffered too many bytes!"
            r3.<init>(r4)
            throw r3
        */
        throw new UnsupportedOperationException("Method not decompiled: okhttp3.internal.connection.RealConnection.createTunnel(int, int, okhttp3.Request, okhttp3.HttpUrl):okhttp3.Request");
    }

    private Request createTunnelRequest() throws IOException {
        Request proxyConnectRequest = new Request.Builder().url(this.route.address().url()).method(HttpMethods.CONNECT, null).header(HttpHeaders.HOST, Util.hostHeader(this.route.address().url(), true)).header("Proxy-Connection", HttpHeaders.KEEP_ALIVE).header(HttpHeaders.USER_AGENT, Version.userAgent()).build();
        Response fakeAuthChallengeResponse = new Response.Builder().request(proxyConnectRequest).protocol(Protocol.HTTP_1_1).code(407).message("Preemptive Authenticate").body(Util.EMPTY_RESPONSE).sentRequestAtMillis(-1L).receivedResponseAtMillis(-1L).header(HttpHeaders.PROXY_AUTHENTICATE, "OkHttp-Preemptive").build();
        Request authenticatedRequest = this.route.address().proxyAuthenticator().authenticate(this.route, fakeAuthChallengeResponse);
        if (authenticatedRequest != null) {
            return authenticatedRequest;
        }
        return proxyConnectRequest;
    }

    boolean isEligible(Address address, @Nullable List<Route> routes) {
        if (this.transmitters.size() >= this.allocationLimit || this.noNewExchanges || !Internal.instance.equalsNonHost(this.route.address(), address)) {
            return false;
        }
        if (address.url().host().equals(route().address().url().host())) {
            return true;
        }
        if (this.http2Connection == null || routes == null || !routeMatchesAny(routes) || address.hostnameVerifier() != OkHostnameVerifier.INSTANCE || !supportsUrl(address.url())) {
            return false;
        }
        try {
            address.certificatePinner().check(address.url().host(), handshake().peerCertificates());
            return true;
        } catch (SSLPeerUnverifiedException e) {
            return false;
        }
    }

    private boolean routeMatchesAny(List<Route> candidates) {
        int size = candidates.size();
        for (int i = 0; i < size; i++) {
            Route candidate = candidates.get(i);
            if (candidate.proxy().type() == Proxy.Type.DIRECT && this.route.proxy().type() == Proxy.Type.DIRECT && this.route.socketAddress().equals(candidate.socketAddress())) {
                return true;
            }
        }
        return false;
    }

    public boolean supportsUrl(HttpUrl url) {
        if (url.port() != this.route.address().url().port()) {
            return false;
        }
        if (url.host().equals(this.route.address().url().host())) {
            return true;
        }
        return this.handshake != null && OkHostnameVerifier.INSTANCE.verify(url.host(), (X509Certificate) this.handshake.peerCertificates().get(0));
    }

    ExchangeCodec newCodec(OkHttpClient client, Interceptor.Chain chain) throws SocketException {
        if (this.http2Connection != null) {
            return new Http2ExchangeCodec(client, this, chain, this.http2Connection);
        }
        this.socket.setSoTimeout(chain.readTimeoutMillis());
        this.source.timeout().timeout(chain.readTimeoutMillis(), TimeUnit.MILLISECONDS);
        this.sink.timeout().timeout(chain.writeTimeoutMillis(), TimeUnit.MILLISECONDS);
        return new Http1ExchangeCodec(client, this, this.source, this.sink);
    }

    RealWebSocket.Streams newWebSocketStreams(final Exchange exchange) throws SocketException {
        this.socket.setSoTimeout(0);
        noNewExchanges();
        return new RealWebSocket.Streams(true, this.source, this.sink) { // da classe: okhttp3.internal.connection.RealConnection.1
            @Override // java.io.Closeable, java.lang.AutoCloseable
            public void close() throws IOException {
                exchange.bodyComplete(-1L, true, true, null);
            }
        };
    }

    @Override // okhttp3.Connection
    public Route route() {
        return this.route;
    }

    public void cancel() {
        Util.closeQuietly(this.rawSocket);
    }

    @Override // okhttp3.Connection
    public Socket socket() {
        return this.socket;
    }

    public boolean isHealthy(boolean doExtensiveChecks) {
        if (this.socket.isClosed() || this.socket.isInputShutdown() || this.socket.isOutputShutdown()) {
            return false;
        }
        if (this.http2Connection != null) {
            return this.http2Connection.isHealthy(System.nanoTime());
        }
        if (doExtensiveChecks) {
            try {
                int readTimeout = this.socket.getSoTimeout();
                try {
                    this.socket.setSoTimeout(1);
                    return !this.source.exhausted();
                } finally {
                    this.socket.setSoTimeout(readTimeout);
                }
            } catch (SocketTimeoutException e) {
            } catch (IOException e2) {
                return false;
            }
        }
        return true;
    }

    @Override // okhttp3.internal.http2.Http2Connection.Listener
    public void onStream(Http2Stream stream) throws IOException {
        stream.close(ErrorCode.REFUSED_STREAM, null);
    }

    @Override // okhttp3.internal.http2.Http2Connection.Listener
    public void onSettings(Http2Connection connection) {
        synchronized (this.connectionPool) {
            this.allocationLimit = connection.maxConcurrentStreams();
        }
    }

    @Override // okhttp3.Connection
    public Handshake handshake() {
        return this.handshake;
    }

    public boolean isMultiplexed() {
        return this.http2Connection != null;
    }

    void trackFailure(@Nullable IOException e) {
        if (Thread.holdsLock(this.connectionPool)) {
            throw new AssertionError();
        }
        synchronized (this.connectionPool) {
            if (e instanceof StreamResetException) {
                ErrorCode errorCode = ((StreamResetException) e).errorCode;
                if (errorCode == ErrorCode.REFUSED_STREAM) {
                    this.refusedStreamCount++;
                    if (this.refusedStreamCount > 1) {
                        this.noNewExchanges = true;
                        this.routeFailureCount++;
                    }
                } else if (errorCode != ErrorCode.CANCEL) {
                    this.noNewExchanges = true;
                    this.routeFailureCount++;
                }
            } else {
                if (isMultiplexed()) {
                    if (e instanceof ConnectionShutdownException) {
                    }
                }
                this.noNewExchanges = true;
                if (this.successCount == 0) {
                    if (e != null) {
                        this.connectionPool.connectFailed(this.route, e);
                    }
                    this.routeFailureCount++;
                }
            }
        }
    }

    @Override // okhttp3.Connection
    public Protocol protocol() {
        return this.protocol;
    }

    public String toString() {
        return "Connection{" + this.route.address().url().host() + ":" + this.route.address().url().port() + ", proxy=" + this.route.proxy() + " hostAddress=" + this.route.socketAddress() + " cipherSuite=" + (this.handshake != null ? this.handshake.cipherSuite() : DevicePublicKeyStringDef.NONE) + " protocol=" + this.protocol + '}';
    }
}
