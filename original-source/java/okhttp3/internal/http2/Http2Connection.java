package okhttp3.internal.http2;

import java.io.Closeable;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketAddress;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import javax.annotation.Nullable;
import okhttp3.Headers;
import okhttp3.internal.NamedRunnable;
import okhttp3.internal.Util;
import okhttp3.internal.http2.Http2Reader;
import okhttp3.internal.platform.Platform;
import okio.Buffer;
import okio.BufferedSink;
import okio.BufferedSource;
import okio.ByteString;
import okio.Okio;

/* loaded from: classes17.dex */
public final class Http2Connection implements Closeable {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    static final int AWAIT_PING = 3;
    static final int DEGRADED_PING = 2;
    static final long DEGRADED_PONG_TIMEOUT_NS = 1000000000;
    static final int INTERVAL_PING = 1;
    static final int OKHTTP_CLIENT_WINDOW_SIZE = 16777216;
    private static final ExecutorService listenerExecutor = new ThreadPoolExecutor(0, Integer.MAX_VALUE, 60, TimeUnit.SECONDS, new SynchronousQueue(), Util.threadFactory("OkHttp Http2Connection", true));
    long bytesLeftInWriteWindow;
    final boolean client;
    final String connectionName;
    int lastGoodStreamId;
    final Listener listener;
    int nextStreamId;
    private final ExecutorService pushExecutor;
    final PushObserver pushObserver;
    final ReaderRunnable readerRunnable;
    private boolean shutdown;
    final Socket socket;
    final Http2Writer writer;
    private final ScheduledExecutorService writerExecutor;
    final Map<Integer, Http2Stream> streams = new LinkedHashMap();
    private long intervalPingsSent = 0;
    private long intervalPongsReceived = 0;
    private long degradedPingsSent = 0;
    private long degradedPongsReceived = 0;
    private long awaitPingsSent = 0;
    private long awaitPongsReceived = 0;
    private long degradedPongDeadlineNs = 0;
    long unacknowledgedBytesRead = 0;
    Settings okHttpSettings = new Settings();
    final Settings peerSettings = new Settings();
    final Set<Integer> currentPushRequests = new LinkedHashSet();

    static /* synthetic */ long access$108(Http2Connection x0) {
        long j = x0.intervalPongsReceived;
        x0.intervalPongsReceived = 1 + j;
        return j;
    }

    static /* synthetic */ long access$208(Http2Connection x0) {
        long j = x0.intervalPingsSent;
        x0.intervalPingsSent = 1 + j;
        return j;
    }

    static /* synthetic */ long access$608(Http2Connection x0) {
        long j = x0.degradedPongsReceived;
        x0.degradedPongsReceived = 1 + j;
        return j;
    }

    static /* synthetic */ long access$708(Http2Connection x0) {
        long j = x0.awaitPongsReceived;
        x0.awaitPongsReceived = 1 + j;
        return j;
    }

    Http2Connection(Builder builder) {
        this.pushObserver = builder.pushObserver;
        this.client = builder.client;
        this.listener = builder.listener;
        this.nextStreamId = builder.client ? 1 : 2;
        if (builder.client) {
            this.nextStreamId += 2;
        }
        if (builder.client) {
            this.okHttpSettings.set(7, 16777216);
        }
        this.connectionName = builder.connectionName;
        this.writerExecutor = new ScheduledThreadPoolExecutor(1, Util.threadFactory(Util.format("OkHttp %s Writer", this.connectionName), false));
        if (builder.pingIntervalMillis != 0) {
            this.writerExecutor.scheduleAtFixedRate(new IntervalPingRunnable(), builder.pingIntervalMillis, builder.pingIntervalMillis, TimeUnit.MILLISECONDS);
        }
        this.pushExecutor = new ThreadPoolExecutor(0, 1, 60L, TimeUnit.SECONDS, new LinkedBlockingQueue(), Util.threadFactory(Util.format("OkHttp %s Push Observer", this.connectionName), true));
        this.peerSettings.set(7, 65535);
        this.peerSettings.set(5, 16384);
        this.bytesLeftInWriteWindow = this.peerSettings.getInitialWindowSize();
        this.socket = builder.socket;
        this.writer = new Http2Writer(builder.sink, this.client);
        this.readerRunnable = new ReaderRunnable(new Http2Reader(builder.source, this.client));
    }

    public synchronized int openStreamCount() {
        return this.streams.size();
    }

    synchronized Http2Stream getStream(int id) {
        return this.streams.get(Integer.valueOf(id));
    }

    synchronized Http2Stream removeStream(int streamId) {
        Http2Stream stream;
        stream = this.streams.remove(Integer.valueOf(streamId));
        notifyAll();
        return stream;
    }

    public synchronized int maxConcurrentStreams() {
        return this.peerSettings.getMaxConcurrentStreams(Integer.MAX_VALUE);
    }

    synchronized void updateConnectionFlowControl(long read) {
        this.unacknowledgedBytesRead += read;
        if (this.unacknowledgedBytesRead >= this.okHttpSettings.getInitialWindowSize() / 2) {
            writeWindowUpdateLater(0, this.unacknowledgedBytesRead);
            this.unacknowledgedBytesRead = 0L;
        }
    }

    public Http2Stream pushStream(int associatedStreamId, List<Header> requestHeaders, boolean out) throws IOException {
        if (this.client) {
            throw new IllegalStateException("Client cannot push requests.");
        }
        return newStream(associatedStreamId, requestHeaders, out);
    }

    public Http2Stream newStream(List<Header> requestHeaders, boolean out) throws IOException {
        return newStream(0, requestHeaders, out);
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0041 A[Catch: all -> 0x0078, TryCatch #1 {all -> 0x0078, blocks: (B:14:0x0024, B:16:0x0029, B:18:0x0031, B:22:0x003b, B:24:0x0041, B:25:0x004a, B:45:0x0076, B:41:0x006e, B:42:0x0073), top: B:4:0x0007 }] */
    /* JADX WARN: Removed duplicated region for block: B:27:0x004d A[Catch: all -> 0x007e, TRY_ENTER, TryCatch #3 {all -> 0x007e, blocks: (B:27:0x004d, B:28:0x005c, B:33:0x0053, B:35:0x0057, B:36:0x0065, B:37:0x006c, B:52:0x007c, B:46:0x0077), top: B:3:0x0007 }] */
    /* JADX WARN: Removed duplicated region for block: B:30:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0053 A[Catch: all -> 0x007e, TryCatch #3 {all -> 0x007e, blocks: (B:27:0x004d, B:28:0x005c, B:33:0x0053, B:35:0x0057, B:36:0x0065, B:37:0x006c, B:52:0x007c, B:46:0x0077), top: B:3:0x0007 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private okhttp3.internal.http2.Http2Stream newStream(int r13, java.util.List<okhttp3.internal.http2.Header> r14, boolean r15) throws java.io.IOException {
        /*
            r12 = this;
            r0 = r15 ^ 1
            r4 = r0
            r5 = 0
            okhttp3.internal.http2.Http2Writer r7 = r12.writer
            monitor-enter(r7)
            monitor-enter(r12)     // Catch: java.lang.Throwable -> L7a
            int r0 = r12.nextStreamId     // Catch: java.lang.Throwable -> L74
            r1 = 1073741823(0x3fffffff, float:1.9999999)
            if (r0 <= r1) goto L14
            okhttp3.internal.http2.ErrorCode r0 = okhttp3.internal.http2.ErrorCode.REFUSED_STREAM     // Catch: java.lang.Throwable -> L74
            r12.shutdown(r0)     // Catch: java.lang.Throwable -> L74
        L14:
            boolean r0 = r12.shutdown     // Catch: java.lang.Throwable -> L74
            if (r0 != 0) goto L6d
            int r2 = r12.nextStreamId     // Catch: java.lang.Throwable -> L74
            int r0 = r12.nextStreamId     // Catch: java.lang.Throwable -> L74
            int r0 = r0 + 2
            r12.nextStreamId = r0     // Catch: java.lang.Throwable -> L74
            okhttp3.internal.http2.Http2Stream r1 = new okhttp3.internal.http2.Http2Stream     // Catch: java.lang.Throwable -> L74
            r6 = 0
            r3 = r12
            r1.<init>(r2, r3, r4, r5, r6)     // Catch: java.lang.Throwable -> L78
            if (r15 == 0) goto L3a
            long r8 = r3.bytesLeftInWriteWindow     // Catch: java.lang.Throwable -> L78
            r10 = 0
            int r0 = (r8 > r10 ? 1 : (r8 == r10 ? 0 : -1))
            if (r0 == 0) goto L3a
            long r8 = r1.bytesLeftInWriteWindow     // Catch: java.lang.Throwable -> L78
            int r0 = (r8 > r10 ? 1 : (r8 == r10 ? 0 : -1))
            if (r0 != 0) goto L38
            goto L3a
        L38:
            r0 = 0
            goto L3b
        L3a:
            r0 = 1
        L3b:
            boolean r6 = r1.isOpen()     // Catch: java.lang.Throwable -> L78
            if (r6 == 0) goto L4a
            java.util.Map<java.lang.Integer, okhttp3.internal.http2.Http2Stream> r6 = r3.streams     // Catch: java.lang.Throwable -> L78
            java.lang.Integer r8 = java.lang.Integer.valueOf(r2)     // Catch: java.lang.Throwable -> L78
            r6.put(r8, r1)     // Catch: java.lang.Throwable -> L78
        L4a:
            monitor-exit(r12)     // Catch: java.lang.Throwable -> L78
            if (r13 != 0) goto L53
            okhttp3.internal.http2.Http2Writer r6 = r3.writer     // Catch: java.lang.Throwable -> L7e
            r6.headers(r4, r2, r14)     // Catch: java.lang.Throwable -> L7e
            goto L5c
        L53:
            boolean r6 = r3.client     // Catch: java.lang.Throwable -> L7e
            if (r6 != 0) goto L65
            okhttp3.internal.http2.Http2Writer r6 = r3.writer     // Catch: java.lang.Throwable -> L7e
            r6.pushPromise(r13, r2, r14)     // Catch: java.lang.Throwable -> L7e
        L5c:
            monitor-exit(r7)     // Catch: java.lang.Throwable -> L7e
            if (r0 == 0) goto L64
            okhttp3.internal.http2.Http2Writer r6 = r3.writer
            r6.flush()
        L64:
            return r1
        L65:
            java.lang.IllegalArgumentException r6 = new java.lang.IllegalArgumentException     // Catch: java.lang.Throwable -> L7e
            java.lang.String r8 = "client streams shouldn't have associated stream IDs"
            r6.<init>(r8)     // Catch: java.lang.Throwable -> L7e
            throw r6     // Catch: java.lang.Throwable -> L7e
        L6d:
            r3 = r12
            okhttp3.internal.http2.ConnectionShutdownException r0 = new okhttp3.internal.http2.ConnectionShutdownException     // Catch: java.lang.Throwable -> L78
            r0.<init>()     // Catch: java.lang.Throwable -> L78
            throw r0     // Catch: java.lang.Throwable -> L78
        L74:
            r0 = move-exception
            r3 = r12
        L76:
            monitor-exit(r12)     // Catch: java.lang.Throwable -> L78
            throw r0     // Catch: java.lang.Throwable -> L7e
        L78:
            r0 = move-exception
            goto L76
        L7a:
            r0 = move-exception
            r3 = r12
        L7c:
            monitor-exit(r7)     // Catch: java.lang.Throwable -> L7e
            throw r0
        L7e:
            r0 = move-exception
            goto L7c
        */
        throw new UnsupportedOperationException("Method not decompiled: okhttp3.internal.http2.Http2Connection.newStream(int, java.util.List, boolean):okhttp3.internal.http2.Http2Stream");
    }

    void writeHeaders(int streamId, boolean outFinished, List<Header> alternating) throws IOException {
        this.writer.headers(outFinished, streamId, alternating);
    }

    public void writeData(int streamId, boolean outFinished, Buffer buffer, long byteCount) throws IOException {
        int toWrite;
        if (byteCount == 0) {
            this.writer.data(outFinished, streamId, buffer, 0);
            return;
        }
        while (byteCount > 0) {
            synchronized (this) {
                while (this.bytesLeftInWriteWindow <= 0) {
                    try {
                        if (!this.streams.containsKey(Integer.valueOf(streamId))) {
                            throw new IOException("stream closed");
                        }
                        wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                        throw new InterruptedIOException();
                    }
                }
                toWrite = Math.min((int) Math.min(byteCount, this.bytesLeftInWriteWindow), this.writer.maxDataLength());
                this.bytesLeftInWriteWindow -= toWrite;
            }
            byteCount -= toWrite;
            this.writer.data(outFinished && byteCount == 0, streamId, buffer, toWrite);
        }
    }

    void writeSynResetLater(final int streamId, final ErrorCode errorCode) {
        try {
            try {
                this.writerExecutor.execute(new NamedRunnable("OkHttp %s stream %d", new Object[]{this.connectionName, Integer.valueOf(streamId)}) { // from class: okhttp3.internal.http2.Http2Connection.1
                    @Override // okhttp3.internal.NamedRunnable
                    public void execute() {
                        try {
                            Http2Connection.this.writeSynReset(streamId, errorCode);
                        } catch (IOException e) {
                            Http2Connection.this.failConnection(e);
                        }
                    }
                });
            } catch (RejectedExecutionException e) {
            }
        } catch (RejectedExecutionException e2) {
        }
    }

    void writeSynReset(int streamId, ErrorCode statusCode) throws IOException {
        this.writer.rstStream(streamId, statusCode);
    }

    void writeWindowUpdateLater(final int streamId, final long unacknowledgedBytesRead) {
        try {
            try {
                this.writerExecutor.execute(new NamedRunnable("OkHttp Window Update %s stream %d", new Object[]{this.connectionName, Integer.valueOf(streamId)}) { // from class: okhttp3.internal.http2.Http2Connection.2
                    @Override // okhttp3.internal.NamedRunnable
                    public void execute() {
                        try {
                            Http2Connection.this.writer.windowUpdate(streamId, unacknowledgedBytesRead);
                        } catch (IOException e) {
                            Http2Connection.this.failConnection(e);
                        }
                    }
                });
            } catch (RejectedExecutionException e) {
            }
        } catch (RejectedExecutionException e2) {
        }
    }

    final class PingRunnable extends NamedRunnable {
        final int payload1;
        final int payload2;
        final boolean reply;

        PingRunnable(boolean reply, int payload1, int payload2) {
            super("OkHttp %s ping %08x%08x", Http2Connection.this.connectionName, Integer.valueOf(payload1), Integer.valueOf(payload2));
            this.reply = reply;
            this.payload1 = payload1;
            this.payload2 = payload2;
        }

        @Override // okhttp3.internal.NamedRunnable
        public void execute() {
            Http2Connection.this.writePing(this.reply, this.payload1, this.payload2);
        }
    }

    final class IntervalPingRunnable extends NamedRunnable {
        IntervalPingRunnable() {
            super("OkHttp %s ping", Http2Connection.this.connectionName);
        }

        @Override // okhttp3.internal.NamedRunnable
        public void execute() {
            boolean failDueToMissingPong;
            synchronized (Http2Connection.this) {
                if (Http2Connection.this.intervalPongsReceived < Http2Connection.this.intervalPingsSent) {
                    failDueToMissingPong = true;
                } else {
                    Http2Connection.access$208(Http2Connection.this);
                    failDueToMissingPong = false;
                }
            }
            if (failDueToMissingPong) {
                Http2Connection.this.failConnection(null);
            } else {
                Http2Connection.this.writePing(false, 1, 0);
            }
        }
    }

    void writePing(boolean reply, int payload1, int payload2) {
        try {
            this.writer.ping(reply, payload1, payload2);
        } catch (IOException e) {
            failConnection(e);
        }
    }

    void writePingAndAwaitPong() throws InterruptedException {
        writePing();
        awaitPong();
    }

    void writePing() {
        synchronized (this) {
            this.awaitPingsSent++;
        }
        writePing(false, 3, 1330343787);
    }

    synchronized void awaitPong() throws InterruptedException {
        while (this.awaitPongsReceived < this.awaitPingsSent) {
            wait();
        }
    }

    public void flush() throws IOException {
        this.writer.flush();
    }

    public void shutdown(ErrorCode statusCode) throws IOException {
        synchronized (this.writer) {
            synchronized (this) {
                if (this.shutdown) {
                    return;
                }
                this.shutdown = true;
                int lastGoodStreamId = this.lastGoodStreamId;
                this.writer.goAway(lastGoodStreamId, statusCode, Util.EMPTY_BYTE_ARRAY);
            }
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        close(ErrorCode.NO_ERROR, ErrorCode.CANCEL, null);
    }

    void close(ErrorCode connectionCode, ErrorCode streamCode, @Nullable IOException cause) {
        if (Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        try {
            shutdown(connectionCode);
        } catch (IOException e) {
        }
        Http2Stream[] streamsToClose = null;
        synchronized (this) {
            if (!this.streams.isEmpty()) {
                streamsToClose = (Http2Stream[]) this.streams.values().toArray(new Http2Stream[this.streams.size()]);
                this.streams.clear();
            }
        }
        if (streamsToClose != null) {
            for (Http2Stream stream : streamsToClose) {
                try {
                    stream.close(streamCode, cause);
                } catch (IOException e2) {
                }
            }
        }
        try {
            this.writer.close();
        } catch (IOException e3) {
        }
        try {
            this.socket.close();
        } catch (IOException e4) {
        }
        this.writerExecutor.shutdown();
        this.pushExecutor.shutdown();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void failConnection(@Nullable IOException e) {
        close(ErrorCode.PROTOCOL_ERROR, ErrorCode.PROTOCOL_ERROR, e);
    }

    public void start() throws IOException {
        start(true);
    }

    void start(boolean sendConnectionPreface) throws IOException {
        if (sendConnectionPreface) {
            this.writer.connectionPreface();
            this.writer.settings(this.okHttpSettings);
            int windowSize = this.okHttpSettings.getInitialWindowSize();
            if (windowSize != 65535) {
                this.writer.windowUpdate(0, windowSize - 65535);
            }
        }
        new Thread(this.readerRunnable).start();
    }

    public void setSettings(Settings settings) throws IOException {
        synchronized (this.writer) {
            synchronized (this) {
                if (this.shutdown) {
                    throw new ConnectionShutdownException();
                }
                this.okHttpSettings.merge(settings);
            }
            this.writer.settings(settings);
        }
    }

    public synchronized boolean isHealthy(long nowNs) {
        if (this.shutdown) {
            return false;
        }
        if (this.degradedPongsReceived < this.degradedPingsSent) {
            if (nowNs >= this.degradedPongDeadlineNs) {
                return false;
            }
        }
        return true;
    }

    void sendDegradedPingLater() {
        synchronized (this) {
            if (this.degradedPongsReceived < this.degradedPingsSent) {
                return;
            }
            this.degradedPingsSent++;
            this.degradedPongDeadlineNs = System.nanoTime() + DEGRADED_PONG_TIMEOUT_NS;
            try {
                this.writerExecutor.execute(new NamedRunnable("OkHttp %s ping", this.connectionName) { // from class: okhttp3.internal.http2.Http2Connection.3
                    @Override // okhttp3.internal.NamedRunnable
                    public void execute() {
                        Http2Connection.this.writePing(false, 2, 0);
                    }
                });
            } catch (RejectedExecutionException e) {
            }
        }
    }

    public static class Builder {
        boolean client;
        String connectionName;
        int pingIntervalMillis;
        BufferedSink sink;
        Socket socket;
        BufferedSource source;
        Listener listener = Listener.REFUSE_INCOMING_STREAMS;
        PushObserver pushObserver = PushObserver.CANCEL;

        public Builder(boolean client) {
            this.client = client;
        }

        public Builder socket(Socket socket) throws IOException {
            String connectionName;
            SocketAddress remoteSocketAddress = socket.getRemoteSocketAddress();
            if (remoteSocketAddress instanceof InetSocketAddress) {
                connectionName = ((InetSocketAddress) remoteSocketAddress).getHostName();
            } else {
                connectionName = remoteSocketAddress.toString();
            }
            return socket(socket, connectionName, Okio.buffer(Okio.source(socket)), Okio.buffer(Okio.sink(socket)));
        }

        public Builder socket(Socket socket, String connectionName, BufferedSource source, BufferedSink sink) {
            this.socket = socket;
            this.connectionName = connectionName;
            this.source = source;
            this.sink = sink;
            return this;
        }

        public Builder listener(Listener listener) {
            this.listener = listener;
            return this;
        }

        public Builder pushObserver(PushObserver pushObserver) {
            this.pushObserver = pushObserver;
            return this;
        }

        public Builder pingIntervalMillis(int pingIntervalMillis) {
            this.pingIntervalMillis = pingIntervalMillis;
            return this;
        }

        public Http2Connection build() {
            return new Http2Connection(this);
        }
    }

    class ReaderRunnable extends NamedRunnable implements Http2Reader.Handler {
        final Http2Reader reader;

        ReaderRunnable(Http2Reader reader) {
            super("OkHttp %s", Http2Connection.this.connectionName);
            this.reader = reader;
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r1v0, types: [okhttp3.internal.http2.ErrorCode] */
        /* JADX WARN: Type inference failed for: r1v3, types: [java.io.Closeable, okhttp3.internal.http2.Http2Reader] */
        @Override // okhttp3.internal.NamedRunnable
        protected void execute() {
            ErrorCode streamErrorCode;
            ErrorCode connectionErrorCode = ErrorCode.INTERNAL_ERROR;
            ErrorCode streamErrorCode2 = ErrorCode.INTERNAL_ERROR;
            IOException errorException = null;
            try {
                try {
                    this.reader.readConnectionPreface(this);
                    while (this.reader.nextFrame(false, this)) {
                    }
                    connectionErrorCode = ErrorCode.NO_ERROR;
                    streamErrorCode = ErrorCode.CANCEL;
                } catch (IOException e) {
                    errorException = e;
                    connectionErrorCode = ErrorCode.PROTOCOL_ERROR;
                    streamErrorCode = ErrorCode.PROTOCOL_ERROR;
                }
            } finally {
                Http2Connection.this.close(connectionErrorCode, streamErrorCode2, errorException);
                Util.closeQuietly(this.reader);
            }
        }

        @Override // okhttp3.internal.http2.Http2Reader.Handler
        public void data(boolean inFinished, int streamId, BufferedSource source, int length) throws IOException {
            if (Http2Connection.this.pushedStream(streamId)) {
                Http2Connection.this.pushDataLater(streamId, source, length, inFinished);
                return;
            }
            Http2Stream dataStream = Http2Connection.this.getStream(streamId);
            if (dataStream == null) {
                Http2Connection.this.writeSynResetLater(streamId, ErrorCode.PROTOCOL_ERROR);
                Http2Connection.this.updateConnectionFlowControl(length);
                source.skip(length);
            } else {
                dataStream.receiveData(source, length);
                if (inFinished) {
                    dataStream.receiveHeaders(Util.EMPTY_HEADERS, true);
                }
            }
        }

        @Override // okhttp3.internal.http2.Http2Reader.Handler
        public void headers(boolean inFinished, int streamId, int associatedStreamId, List<Header> headerBlock) {
            if (Http2Connection.this.pushedStream(streamId)) {
                Http2Connection.this.pushHeadersLater(streamId, headerBlock, inFinished);
                return;
            }
            synchronized (Http2Connection.this) {
                try {
                    try {
                        Http2Stream stream = Http2Connection.this.getStream(streamId);
                        if (stream == null) {
                            try {
                                if (Http2Connection.this.shutdown) {
                                    return;
                                }
                                if (streamId <= Http2Connection.this.lastGoodStreamId) {
                                    return;
                                }
                                if (streamId % 2 == Http2Connection.this.nextStreamId % 2) {
                                    return;
                                }
                                Headers headers = Util.toHeaders(headerBlock);
                                final Http2Stream newStream = new Http2Stream(streamId, Http2Connection.this, false, inFinished, headers);
                                Http2Connection.this.lastGoodStreamId = streamId;
                                Http2Connection.this.streams.put(Integer.valueOf(streamId), newStream);
                                ExecutorService executorService = Http2Connection.listenerExecutor;
                                String str = "OkHttp %s stream %d";
                                String str2 = Http2Connection.this.connectionName;
                                Integer valueOf = Integer.valueOf(streamId);
                                try {
                                    Object[] objArr = new Object[2];
                                    try {
                                        objArr[0] = str2;
                                        objArr[1] = valueOf;
                                        executorService.execute(new NamedRunnable(str, objArr) { // from class: okhttp3.internal.http2.Http2Connection.ReaderRunnable.1
                                            @Override // okhttp3.internal.NamedRunnable
                                            public void execute() {
                                                try {
                                                    Http2Connection.this.listener.onStream(newStream);
                                                } catch (IOException e) {
                                                    Platform.get().log(4, "Http2Connection.Listener failure for " + Http2Connection.this.connectionName, e);
                                                    try {
                                                        newStream.close(ErrorCode.PROTOCOL_ERROR, e);
                                                    } catch (IOException e2) {
                                                    }
                                                }
                                            }
                                        });
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
                        } else {
                            stream.receiveHeaders(Util.toHeaders(headerBlock), inFinished);
                        }
                    } catch (Throwable th4) {
                        th = th4;
                    }
                } catch (Throwable th5) {
                    th = th5;
                }
            }
        }

        @Override // okhttp3.internal.http2.Http2Reader.Handler
        public void rstStream(int streamId, ErrorCode errorCode) {
            if (Http2Connection.this.pushedStream(streamId)) {
                Http2Connection.this.pushResetLater(streamId, errorCode);
                return;
            }
            Http2Stream rstStream = Http2Connection.this.removeStream(streamId);
            if (rstStream != null) {
                rstStream.receiveRstStream(errorCode);
            }
        }

        @Override // okhttp3.internal.http2.Http2Reader.Handler
        public void settings(final boolean clearPrevious, final Settings settings) {
            try {
                try {
                    Http2Connection.this.writerExecutor.execute(new NamedRunnable("OkHttp %s ACK Settings", new Object[]{Http2Connection.this.connectionName}) { // from class: okhttp3.internal.http2.Http2Connection.ReaderRunnable.2
                        @Override // okhttp3.internal.NamedRunnable
                        public void execute() {
                            ReaderRunnable.this.applyAndAckSettings(clearPrevious, settings);
                        }
                    });
                } catch (RejectedExecutionException e) {
                }
            } catch (RejectedExecutionException e2) {
            }
        }

        void applyAndAckSettings(boolean clearPrevious, Settings settings) {
            Http2Stream[] http2StreamArr;
            long delta = 0;
            Http2Stream[] streamsToNotify = null;
            synchronized (Http2Connection.this.writer) {
                synchronized (Http2Connection.this) {
                    int priorWriteWindowSize = Http2Connection.this.peerSettings.getInitialWindowSize();
                    if (clearPrevious) {
                        Http2Connection.this.peerSettings.clear();
                    }
                    Http2Connection.this.peerSettings.merge(settings);
                    int peerInitialWindowSize = Http2Connection.this.peerSettings.getInitialWindowSize();
                    if (peerInitialWindowSize != -1 && peerInitialWindowSize != priorWriteWindowSize) {
                        delta = peerInitialWindowSize - priorWriteWindowSize;
                        if (!Http2Connection.this.streams.isEmpty()) {
                            http2StreamArr = (Http2Stream[]) Http2Connection.this.streams.values().toArray(new Http2Stream[Http2Connection.this.streams.size()]);
                        } else {
                            http2StreamArr = null;
                        }
                        streamsToNotify = http2StreamArr;
                    }
                }
                try {
                    Http2Connection.this.writer.applyAndAckSettings(Http2Connection.this.peerSettings);
                } catch (IOException e) {
                    Http2Connection.this.failConnection(e);
                }
            }
            if (streamsToNotify != null) {
                for (Http2Stream stream : streamsToNotify) {
                    synchronized (stream) {
                        stream.addBytesToWriteWindow(delta);
                    }
                }
            }
            Http2Connection.listenerExecutor.execute(new NamedRunnable("OkHttp %s settings", Http2Connection.this.connectionName) { // from class: okhttp3.internal.http2.Http2Connection.ReaderRunnable.3
                @Override // okhttp3.internal.NamedRunnable
                public void execute() {
                    Http2Connection.this.listener.onSettings(Http2Connection.this);
                }
            });
        }

        @Override // okhttp3.internal.http2.Http2Reader.Handler
        public void ackSettings() {
        }

        @Override // okhttp3.internal.http2.Http2Reader.Handler
        public void ping(boolean reply, int payload1, int payload2) {
            if (!reply) {
                try {
                    Http2Connection.this.writerExecutor.execute(Http2Connection.this.new PingRunnable(true, payload1, payload2));
                    return;
                } catch (RejectedExecutionException e) {
                    return;
                }
            }
            synchronized (Http2Connection.this) {
                try {
                    if (payload1 == 1) {
                        Http2Connection.access$108(Http2Connection.this);
                    } else if (payload1 == 2) {
                        Http2Connection.access$608(Http2Connection.this);
                    } else if (payload1 == 3) {
                        Http2Connection.access$708(Http2Connection.this);
                        Http2Connection.this.notifyAll();
                    }
                } finally {
                }
            }
        }

        @Override // okhttp3.internal.http2.Http2Reader.Handler
        public void goAway(int lastGoodStreamId, ErrorCode errorCode, ByteString debugData) {
            Http2Stream[] streamsCopy;
            debugData.size();
            synchronized (Http2Connection.this) {
                streamsCopy = (Http2Stream[]) Http2Connection.this.streams.values().toArray(new Http2Stream[Http2Connection.this.streams.size()]);
                Http2Connection.this.shutdown = true;
            }
            for (Http2Stream http2Stream : streamsCopy) {
                if (http2Stream.getId() > lastGoodStreamId && http2Stream.isLocallyInitiated()) {
                    http2Stream.receiveRstStream(ErrorCode.REFUSED_STREAM);
                    Http2Connection.this.removeStream(http2Stream.getId());
                }
            }
        }

        @Override // okhttp3.internal.http2.Http2Reader.Handler
        public void windowUpdate(int streamId, long windowSizeIncrement) {
            if (streamId == 0) {
                synchronized (Http2Connection.this) {
                    Http2Connection.this.bytesLeftInWriteWindow += windowSizeIncrement;
                    Http2Connection.this.notifyAll();
                }
                return;
            }
            Http2Stream stream = Http2Connection.this.getStream(streamId);
            if (stream != null) {
                synchronized (stream) {
                    stream.addBytesToWriteWindow(windowSizeIncrement);
                }
            }
        }

        @Override // okhttp3.internal.http2.Http2Reader.Handler
        public void priority(int streamId, int streamDependency, int weight, boolean exclusive) {
        }

        @Override // okhttp3.internal.http2.Http2Reader.Handler
        public void pushPromise(int streamId, int promisedStreamId, List<Header> requestHeaders) {
            Http2Connection.this.pushRequestLater(promisedStreamId, requestHeaders);
        }

        @Override // okhttp3.internal.http2.Http2Reader.Handler
        public void alternateService(int streamId, String origin, ByteString protocol, String host, int port, long maxAge) {
        }
    }

    boolean pushedStream(int streamId) {
        return streamId != 0 && (streamId & 1) == 0;
    }

    void pushRequestLater(final int streamId, final List<Header> requestHeaders) {
        synchronized (this) {
            try {
                if (this.currentPushRequests.contains(Integer.valueOf(streamId))) {
                    try {
                        writeSynResetLater(streamId, ErrorCode.PROTOCOL_ERROR);
                    } catch (Throwable th) {
                        th = th;
                        while (true) {
                            try {
                                throw th;
                            } catch (Throwable th2) {
                                th = th2;
                            }
                        }
                    }
                } else {
                    this.currentPushRequests.add(Integer.valueOf(streamId));
                    try {
                        try {
                            pushExecutorExecute(new NamedRunnable("OkHttp %s Push Request[%s]", new Object[]{this.connectionName, Integer.valueOf(streamId)}) { // from class: okhttp3.internal.http2.Http2Connection.4
                                @Override // okhttp3.internal.NamedRunnable
                                public void execute() {
                                    boolean cancel = Http2Connection.this.pushObserver.onRequest(streamId, requestHeaders);
                                    if (cancel) {
                                        try {
                                            Http2Connection.this.writer.rstStream(streamId, ErrorCode.CANCEL);
                                            synchronized (Http2Connection.this) {
                                                Http2Connection.this.currentPushRequests.remove(Integer.valueOf(streamId));
                                            }
                                        } catch (IOException e) {
                                        }
                                    }
                                }
                            });
                        } catch (RejectedExecutionException e) {
                        }
                    } catch (RejectedExecutionException e2) {
                    }
                }
            } catch (Throwable th3) {
                th = th3;
            }
        }
    }

    void pushHeadersLater(final int streamId, final List<Header> requestHeaders, final boolean inFinished) {
        try {
            try {
                pushExecutorExecute(new NamedRunnable("OkHttp %s Push Headers[%s]", new Object[]{this.connectionName, Integer.valueOf(streamId)}) { // from class: okhttp3.internal.http2.Http2Connection.5
                    @Override // okhttp3.internal.NamedRunnable
                    public void execute() {
                        boolean cancel = Http2Connection.this.pushObserver.onHeaders(streamId, requestHeaders, inFinished);
                        if (cancel) {
                            try {
                                Http2Connection.this.writer.rstStream(streamId, ErrorCode.CANCEL);
                            } catch (IOException e) {
                                return;
                            }
                        }
                        if (cancel || inFinished) {
                            synchronized (Http2Connection.this) {
                                Http2Connection.this.currentPushRequests.remove(Integer.valueOf(streamId));
                            }
                        }
                    }
                });
            } catch (RejectedExecutionException e) {
            }
        } catch (RejectedExecutionException e2) {
        }
    }

    void pushDataLater(final int streamId, BufferedSource source, final int byteCount, final boolean inFinished) throws IOException {
        final Buffer buffer = new Buffer();
        source.require(byteCount);
        source.read(buffer, byteCount);
        if (buffer.size() != byteCount) {
            throw new IOException(buffer.size() + " != " + byteCount);
        }
        pushExecutorExecute(new NamedRunnable("OkHttp %s Push Data[%s]", new Object[]{this.connectionName, Integer.valueOf(streamId)}) { // from class: okhttp3.internal.http2.Http2Connection.6
            @Override // okhttp3.internal.NamedRunnable
            public void execute() {
                try {
                    boolean cancel = Http2Connection.this.pushObserver.onData(streamId, buffer, byteCount, inFinished);
                    if (cancel) {
                        Http2Connection.this.writer.rstStream(streamId, ErrorCode.CANCEL);
                    }
                    if (cancel || inFinished) {
                        synchronized (Http2Connection.this) {
                            Http2Connection.this.currentPushRequests.remove(Integer.valueOf(streamId));
                        }
                    }
                } catch (IOException e) {
                }
            }
        });
    }

    void pushResetLater(final int streamId, final ErrorCode errorCode) {
        pushExecutorExecute(new NamedRunnable("OkHttp %s Push Reset[%s]", new Object[]{this.connectionName, Integer.valueOf(streamId)}) { // from class: okhttp3.internal.http2.Http2Connection.7
            @Override // okhttp3.internal.NamedRunnable
            public void execute() {
                Http2Connection.this.pushObserver.onReset(streamId, errorCode);
                synchronized (Http2Connection.this) {
                    Http2Connection.this.currentPushRequests.remove(Integer.valueOf(streamId));
                }
            }
        });
    }

    private synchronized void pushExecutorExecute(NamedRunnable namedRunnable) {
        if (!this.shutdown) {
            this.pushExecutor.execute(namedRunnable);
        }
    }

    public static abstract class Listener {
        public static final Listener REFUSE_INCOMING_STREAMS = new Listener() { // from class: okhttp3.internal.http2.Http2Connection.Listener.1
            @Override // okhttp3.internal.http2.Http2Connection.Listener
            public void onStream(Http2Stream stream) throws IOException {
                stream.close(ErrorCode.REFUSED_STREAM, null);
            }
        };

        public abstract void onStream(Http2Stream http2Stream) throws IOException;

        public void onSettings(Http2Connection connection) {
        }
    }
}
