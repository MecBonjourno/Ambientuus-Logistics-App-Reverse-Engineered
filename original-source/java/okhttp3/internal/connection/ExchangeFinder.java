package okhttp3.internal.connection;

import java.io.IOException;
import java.net.Socket;
import java.util.List;
import okhttp3.Address;
import okhttp3.Call;
import okhttp3.EventListener;
import okhttp3.Interceptor;
import okhttp3.OkHttpClient;
import okhttp3.Route;
import okhttp3.internal.Util;
import okhttp3.internal.connection.RouteSelector;
import okhttp3.internal.http.ExchangeCodec;

/* loaded from: classes17.dex */
final class ExchangeFinder {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private final Address address;
    private final Call call;
    private RealConnection connectingConnection;
    private final RealConnectionPool connectionPool;
    private final EventListener eventListener;
    private boolean hasStreamFailure;
    private Route nextRouteToTry;
    private RouteSelector.Selection routeSelection;
    private final RouteSelector routeSelector;
    private final Transmitter transmitter;

    ExchangeFinder(Transmitter transmitter, RealConnectionPool connectionPool, Address address, Call call, EventListener eventListener) {
        this.transmitter = transmitter;
        this.connectionPool = connectionPool;
        this.address = address;
        this.call = call;
        this.eventListener = eventListener;
        this.routeSelector = new RouteSelector(address, connectionPool.routeDatabase, call, eventListener);
    }

    public ExchangeCodec find(OkHttpClient client, Interceptor.Chain chain, boolean doExtensiveHealthChecks) {
        int connectTimeout = chain.connectTimeoutMillis();
        int readTimeout = chain.readTimeoutMillis();
        int writeTimeout = chain.writeTimeoutMillis();
        int pingIntervalMillis = client.pingIntervalMillis();
        boolean connectionRetryEnabled = client.retryOnConnectionFailure();
        try {
            RealConnection resultConnection = findHealthyConnection(connectTimeout, readTimeout, writeTimeout, pingIntervalMillis, connectionRetryEnabled, doExtensiveHealthChecks);
            return resultConnection.newCodec(client, chain);
        } catch (IOException e) {
            trackFailure();
            throw new RouteException(e);
        } catch (RouteException e2) {
            trackFailure();
            throw e2;
        }
    }

    private RealConnection findHealthyConnection(int connectTimeout, int connectTimeout2, int readTimeout, int writeTimeout, boolean connectionRetryEnabled, boolean doExtensiveHealthChecks) throws IOException {
        while (true) {
            RealConnection candidate = findConnection(connectTimeout, connectTimeout2, readTimeout, writeTimeout, connectionRetryEnabled);
            boolean connectionRetryEnabled2 = connectionRetryEnabled;
            int pingIntervalMillis = writeTimeout;
            int pingIntervalMillis2 = readTimeout;
            int writeTimeout2 = connectTimeout2;
            int readTimeout2 = connectTimeout;
            synchronized (this.connectionPool) {
                if (candidate.successCount == 0 && !candidate.isMultiplexed()) {
                    return candidate;
                }
                if (!candidate.isHealthy(doExtensiveHealthChecks)) {
                    candidate.noNewExchanges();
                    connectTimeout = readTimeout2;
                    connectTimeout2 = writeTimeout2;
                    readTimeout = pingIntervalMillis2;
                    writeTimeout = pingIntervalMillis;
                    connectionRetryEnabled = connectionRetryEnabled2;
                } else {
                    return candidate;
                }
            }
        }
    }

    private RealConnection findConnection(int connectTimeout, int readTimeout, int writeTimeout, int pingIntervalMillis, boolean connectionRetryEnabled) throws IOException {
        RealConnection releasedConnection;
        Socket toClose;
        boolean newRouteSelection;
        RealConnection result;
        boolean foundPooledConnection = false;
        RealConnection result2 = null;
        Route selectedRoute = null;
        synchronized (this.connectionPool) {
            if (!this.transmitter.isCanceled()) {
                this.hasStreamFailure = false;
                releasedConnection = this.transmitter.connection;
                if (this.transmitter.connection != null && this.transmitter.connection.noNewExchanges) {
                    toClose = this.transmitter.releaseConnectionNoEvents();
                } else {
                    toClose = null;
                }
                if (this.transmitter.connection != null) {
                    result2 = this.transmitter.connection;
                    releasedConnection = null;
                }
                if (result2 == null) {
                    if (this.connectionPool.transmitterAcquirePooledConnection(this.address, this.transmitter, null, false)) {
                        foundPooledConnection = true;
                        result2 = this.transmitter.connection;
                    } else if (this.nextRouteToTry != null) {
                        selectedRoute = this.nextRouteToTry;
                        this.nextRouteToTry = null;
                    } else if (retryCurrentRoute()) {
                        selectedRoute = this.transmitter.connection.route();
                    }
                }
            } else {
                throw new IOException("Canceled");
            }
        }
        Util.closeQuietly(toClose);
        if (releasedConnection != null) {
            this.eventListener.connectionReleased(this.call, releasedConnection);
        }
        if (foundPooledConnection) {
            this.eventListener.connectionAcquired(this.call, result2);
        }
        if (result2 != null) {
            return result2;
        }
        if (selectedRoute == null && (this.routeSelection == null || !this.routeSelection.hasNext())) {
            this.routeSelection = this.routeSelector.next();
            newRouteSelection = true;
        } else {
            newRouteSelection = false;
        }
        List<Route> routes = null;
        synchronized (this.connectionPool) {
            try {
                if (this.transmitter.isCanceled()) {
                    throw new IOException("Canceled");
                }
                if (newRouteSelection) {
                    routes = this.routeSelection.getAll();
                    if (this.connectionPool.transmitterAcquirePooledConnection(this.address, this.transmitter, routes, false)) {
                        foundPooledConnection = true;
                        result2 = this.transmitter.connection;
                    }
                }
                if (foundPooledConnection) {
                    result = result2;
                } else {
                    if (selectedRoute == null) {
                        selectedRoute = this.routeSelection.next();
                    }
                    RealConnection result3 = new RealConnection(this.connectionPool, selectedRoute);
                    this.connectingConnection = result3;
                    result = result3;
                }
                try {
                    if (foundPooledConnection) {
                        this.eventListener.connectionAcquired(this.call, result);
                        return result;
                    }
                    result.connect(connectTimeout, readTimeout, writeTimeout, pingIntervalMillis, connectionRetryEnabled, this.call, this.eventListener);
                    this.connectionPool.routeDatabase.connected(result.route());
                    Socket socket = null;
                    synchronized (this.connectionPool) {
                        this.connectingConnection = null;
                        if (this.connectionPool.transmitterAcquirePooledConnection(this.address, this.transmitter, routes, true)) {
                            result.noNewExchanges = true;
                            socket = result.socket();
                            result = this.transmitter.connection;
                            this.nextRouteToTry = selectedRoute;
                        } else {
                            this.connectionPool.put(result);
                            this.transmitter.acquireConnectionNoEvents(result);
                        }
                    }
                    Util.closeQuietly(socket);
                    this.eventListener.connectionAcquired(this.call, result);
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

    RealConnection connectingConnection() {
        if (!Thread.holdsLock(this.connectionPool)) {
            throw new AssertionError();
        }
        return this.connectingConnection;
    }

    void trackFailure() {
        if (Thread.holdsLock(this.connectionPool)) {
            throw new AssertionError();
        }
        synchronized (this.connectionPool) {
            this.hasStreamFailure = true;
        }
    }

    boolean hasStreamFailure() {
        boolean z;
        synchronized (this.connectionPool) {
            z = this.hasStreamFailure;
        }
        return z;
    }

    boolean hasRouteToTry() {
        synchronized (this.connectionPool) {
            boolean z = true;
            if (this.nextRouteToTry != null) {
                return true;
            }
            if (retryCurrentRoute()) {
                this.nextRouteToTry = this.transmitter.connection.route();
                return true;
            }
            if ((this.routeSelection == null || !this.routeSelection.hasNext()) && !this.routeSelector.hasNext()) {
                z = false;
            }
            return z;
        }
    }

    private boolean retryCurrentRoute() {
        return this.transmitter.connection != null && this.transmitter.connection.routeFailureCount == 0 && Util.sameConnection(this.transmitter.connection.route().address().url(), this.address.url());
    }
}
