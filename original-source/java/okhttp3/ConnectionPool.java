package okhttp3;

import java.util.concurrent.TimeUnit;
import okhttp3.internal.connection.RealConnectionPool;

/* loaded from: classes17.dex */
public final class ConnectionPool {
    final RealConnectionPool delegate;

    public ConnectionPool() {
        this(5, 5L, TimeUnit.MINUTES);
    }

    public ConnectionPool(int maxIdleConnections, long keepAliveDuration, TimeUnit timeUnit) {
        this.delegate = new RealConnectionPool(maxIdleConnections, keepAliveDuration, timeUnit);
    }

    public int idleConnectionCount() {
        return this.delegate.idleConnectionCount();
    }

    public int connectionCount() {
        return this.delegate.connectionCount();
    }

    public void evictAll() {
        this.delegate.evictAll();
    }
}
