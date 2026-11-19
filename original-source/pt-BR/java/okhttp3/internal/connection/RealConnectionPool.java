package okhttp3.internal.connection;

import java.io.IOException;
import java.lang.ref.Reference;
import java.net.Proxy;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import javax.annotation.Nullable;
import okhttp3.Address;
import okhttp3.Route;
import okhttp3.internal.Util;
import okhttp3.internal.connection.Transmitter;
import okhttp3.internal.platform.Platform;
import org.chromium.base.TimeUtils;

/* carregado de: classes17.dex */
public final class RealConnectionPool {
    static final /* sintético */ boolean $assertionsDisabled = false;
    private static final Executor executor = new ThreadPoolExecutor(0, Integer.MAX_VALUE, 60, TimeUnit.SECONDS, new SynchronousQueue(), Util.threadFactory("OkHttp ConnectionPool", true));
    boolean cleanupRunning;
    private final long keepAliveDurationNs;
    private final int maxIdleConnections;
    private final Runnable cleanupRunnable = new Runnable() { // da classe: okhttp3.internal.connection.RealConnectionPool$$ExternalSyntheticLambda0
        @Override // java.lang.Runnable
        public final void run() {
            RealConnectionPool.this.m2452lambda$new$0$okhttp3internalconnectionRealConnectionPool();
        }
    };
    private final Deque<RealConnection> connections = new ArrayDeque();
    final RouteDatabase routeDatabase = new RouteDatabase();

    /* renomeado de: lambda$new$0$okhttp3-internal-connection-RealConnectionPool, motivo: nome Java inválido */
    /* sintético */ void m2452lambda$new$0$okhttp3internalconnectionRealConnectionPool() {
        while (true) {
            long waitNanos = cleanup(System.nanoTime());
            if (waitNanos == -1) {
                return;
            }
            if (waitNanos > 0) {
                long waitMillis = waitNanos / TimeUtils.NANOSECONDS_PER_MILLISECOND;
                long waitNanos2 = waitNanos - (TimeUtils.NANOSECONDS_PER_MILLISECOND * waitMillis);
                synchronized (this) {
                    try {
                        wait(waitMillis, (int) waitNanos2);
                    } catch (InterruptedException e) {
                    }
                }
            }
        }
    }

    public RealConnectionPool(int maxIdleConnections, long keepAliveDuration, TimeUnit timeUnit) {
        this.maxIdleConnections = maxIdleConnections;
        this.keepAliveDurationNs = timeUnit.toNanos(keepAliveDuration);
        if (keepAliveDuration <= 0) {
            throw new IllegalArgumentException("keepAliveDuration <= 0: " + keepAliveDuration);
        }
    }

    public synchronized int idleConnectionCount() {
        int total;
        total = 0;
        for (RealConnection connection : this.connections) {
            if (connection.transmitters.isEmpty()) {
                total++;
            }
        }
        return total;
    }

    public synchronized int connectionCount() {
        return this.connections.size();
    }

    boolean transmitterAcquirePooledConnection(Address address, Transmitter transmitter, @Nullable List<Route> routes, boolean requireMultiplexed) {
        if (!Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        for (RealConnection connection : this.connections) {
            if (!requireMultiplexed || connection.isMultiplexed()) {
                if (connection.isEligible(address, routes)) {
                    transmitter.acquireConnectionNoEvents(connection);
                    return true;
                }
            }
        }
        return false;
    }

    void put(RealConnection connection) {
        if (!Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        if (!this.cleanupRunning) {
            this.cleanupRunning = true;
            executor.execute(this.cleanupRunnable);
        }
        this.connections.add(connection);
    }

    boolean connectionBecameIdle(RealConnection connection) {
        if (!Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        if (connection.noNewExchanges || this.maxIdleConnections == 0) {
            this.connections.remove(connection);
            return true;
        }
        notifyAll();
        return false;
    }

    public void evictAll() {
        List<RealConnection> evictedConnections = new ArrayList<>();
        synchronized (this) {
            Iterator<RealConnection> i = this.connections.iterator();
            while (i.hasNext()) {
                RealConnection connection = i.next();
                if (connection.transmitters.isEmpty()) {
                    connection.noNewExchanges = true;
                    evictedConnections.add(connection);
                    i.remove();
                }
            }
        }
        Iterator<RealConnection> it = evictedConnections.iterator();
        while (it.hasNext()) {
            Util.closeQuietly(it.next().socket());
        }
    }

    long cleanup(long now) {
        int inUseConnectionCount = 0;
        int idleConnectionCount = 0;
        RealConnection longestIdleConnection = null;
        long longestIdleDurationNs = Long.MIN_VALUE;
        synchronized (this) {
            for (RealConnection connection : this.connections) {
                if (pruneAndGetAllocationCount(connection, now) > 0) {
                    inUseConnectionCount++;
                } else {
                    idleConnectionCount++;
                    long idleDurationNs = now - connection.idleAtNanos;
                    if (idleDurationNs > longestIdleDurationNs) {
                        longestIdleDurationNs = idleDurationNs;
                        longestIdleConnection = connection;
                    }
                }
            }
            if (longestIdleDurationNs < this.keepAliveDurationNs && idleConnectionCount <= this.maxIdleConnections) {
                if (idleConnectionCount > 0) {
                    return this.keepAliveDurationNs - longestIdleDurationNs;
                }
                if (inUseConnectionCount > 0) {
                    return this.keepAliveDurationNs;
                }
                this.cleanupRunning = false;
                return -1L;
            }
            this.connections.remove(longestIdleConnection);
            Util.closeQuietly(longestIdleConnection.socket());
            return 0L;
        }
    }

    private int pruneAndGetAllocationCount(RealConnection connection, long now) {
        List<Reference<Transmitter>> references = connection.transmitters;
        int i = 0;
        while (i < references.size()) {
            Reference<Transmitter> reference = references.get(i);
            if (reference.get() != null) {
                i++;
            } else {
                Transmitter.TransmitterReference transmitterRef = (Transmitter.TransmitterReference) reference;
                String message = "A connection to " + connection.route().address().url() + " was leaked. Did you forget to close a response body?";
                Platform.get().logCloseableLeak(message, transmitterRef.callStackTrace);
                references.remove(i);
                connection.noNewExchanges = true;
                if (references.isEmpty()) {
                    connection.idleAtNanos = now - this.keepAliveDurationNs;
                    return 0;
                }
            }
        }
        int i2 = references.size();
        return i2;
    }

    public void connectFailed(Route failedRoute, IOException failure) {
        if (failedRoute.proxy().type() != Proxy.Type.DIRECT) {
            Address address = failedRoute.address();
            address.proxySelector().connectFailed(address.url().uri(), failedRoute.proxy().address(), failure);
        }
        this.routeDatabase.failed(failedRoute);
    }
}
