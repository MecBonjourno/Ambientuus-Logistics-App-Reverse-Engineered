package okhttp3.internal.http2;

import java.io.EOFException;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.SocketTimeoutException;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.List;
import javax.annotation.Nullable;
import okhttp3.Headers;
import okhttp3.internal.Util;
import okio.AsyncTimeout;
import okio.Buffer;
import okio.BufferedSource;
import okio.Sink;
import okio.Source;
import okio.Timeout;

/* carregado de: classes17.dex */
public final class Http2Stream {
    static final /* sintético */ boolean $assertionsDisabled = false;
    long bytesLeftInWriteWindow;
    final Http2Connection connection;

    @Nullable
    ErrorCode errorCode;

    @Nullable
    IOException errorException;
    private boolean hasResponseHeaders;
    final int id;
    final FramingSink sink;
    private final FramingSource source;
    long unacknowledgedBytesRead = 0;
    private final Deque<Headers> headersQueue = new ArrayDeque();
    final StreamTimeout readTimeout = new StreamTimeout();
    final StreamTimeout writeTimeout = new StreamTimeout();

    Http2Stream(int id, Http2Connection connection, boolean outFinished, boolean inFinished, @Nullable Headers headers) {
        if (connection == null) {
            throw new NullPointerException("connection == null");
        }
        this.id = id;
        this.connection = connection;
        this.bytesLeftInWriteWindow = connection.peerSettings.getInitialWindowSize();
        this.source = new FramingSource(connection.okHttpSettings.getInitialWindowSize());
        this.sink = new FramingSink();
        this.source.finished = inFinished;
        this.sink.finished = outFinished;
        if (headers != null) {
            this.headersQueue.add(headers);
        }
        if (isLocallyInitiated() && headers != null) {
            throw new IllegalStateException("locally-initiated streams shouldn't have headers yet");
        }
        if (!isLocallyInitiated() && headers == null) {
            throw new IllegalStateException("remotely-initiated streams should have headers");
        }
    }

    public int getId() {
        return this.id;
    }

    public synchronized boolean isOpen() {
        if (this.errorCode != null) {
            return false;
        }
        if ((this.source.finished || this.source.closed) && (this.sink.finished || this.sink.closed)) {
            if (this.hasResponseHeaders) {
                return false;
            }
        }
        return true;
    }

    public boolean isLocallyInitiated() {
        boolean streamIsClient = (this.id & 1) == 1;
        return this.connection.client == streamIsClient;
    }

    public Http2Connection getConnection() {
        return this.connection;
    }

    public synchronized Headers takeHeaders() throws IOException {
        this.readTimeout.enter();
        while (this.headersQueue.isEmpty()) {
            try {
                try {
                    if (this.errorCode != null) {
                        break;
                    }
                    waitForIo();
                } catch (Throwable th) {
                    th = th;
                    this.readTimeout.exitAndThrowIfTimedOut();
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
            }
        }
        this.readTimeout.exitAndThrowIfTimedOut();
        if (!this.headersQueue.isEmpty()) {
        } else {
            if (this.errorException != null) {
                throw this.errorException;
            }
            throw new StreamResetException(this.errorCode);
        }
        return this.headersQueue.removeFirst();
    }

    public synchronized Headers trailers() throws IOException {
        if (this.errorCode != null) {
            if (this.errorException != null) {
                throw this.errorException;
            }
            throw new StreamResetException(this.errorCode);
        }
        if (!this.source.finished || !this.source.receiveBuffer.exhausted() || !this.source.readBuffer.exhausted()) {
            throw new IllegalStateException("too early; can't read the trailers yet");
        }
        return this.source.trailers != null ? this.source.trailers : Util.EMPTY_HEADERS;
    }

    public synchronized ErrorCode getErrorCode() {
        return this.errorCode;
    }

    public void writeHeaders(List<Header> responseHeaders, boolean outFinished, boolean flushHeaders) throws IOException {
        boolean z;
        if (Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        if (responseHeaders == null) {
            throw new NullPointerException("headers == null");
        }
        synchronized (this) {
            z = true;
            this.hasResponseHeaders = true;
            if (outFinished) {
                this.sink.finished = true;
            }
        }
        if (!flushHeaders) {
            synchronized (this.connection) {
                if (this.connection.bytesLeftInWriteWindow != 0) {
                    z = false;
                }
                flushHeaders = z;
            }
        }
        this.connection.writeHeaders(this.id, outFinished, responseHeaders);
        if (flushHeaders) {
            this.connection.flush();
        }
    }

    public void enqueueTrailers(Headers trailers) {
        synchronized (this) {
            if (this.sink.finished) {
                throw new IllegalStateException("already finished");
            }
            if (trailers.size() == 0) {
                throw new IllegalArgumentException("trailers.size() == 0");
            }
            this.sink.trailers = trailers;
        }
    }

    public Timeout readTimeout() {
        return this.readTimeout;
    }

    public Timeout writeTimeout() {
        return this.writeTimeout;
    }

    public Source getSource() {
        return this.source;
    }

    public Sink getSink() {
        synchronized (this) {
            if (!this.hasResponseHeaders && !isLocallyInitiated()) {
                throw new IllegalStateException("reply before requesting the sink");
            }
        }
        return this.sink;
    }

    public void close(ErrorCode rstStatusCode, @Nullable IOException errorException) throws IOException {
        if (!closeInternal(rstStatusCode, errorException)) {
            return;
        }
        this.connection.writeSynReset(this.id, rstStatusCode);
    }

    public void closeLater(ErrorCode errorCode) {
        if (!closeInternal(errorCode, null)) {
            return;
        }
        this.connection.writeSynResetLater(this.id, errorCode);
    }

    private boolean closeInternal(ErrorCode errorCode, @Nullable IOException errorException) {
        if (Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        synchronized (this) {
            if (this.errorCode != null) {
                return false;
            }
            if (this.source.finished && this.sink.finished) {
                return false;
            }
            this.errorCode = errorCode;
            this.errorException = errorException;
            notifyAll();
            this.connection.removeStream(this.id);
            return true;
        }
    }

    void receiveData(BufferedSource in, int length) throws IOException {
        if (Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        this.source.receive(in, length);
    }

    /* JADX WARN: região duplicada removida para o bloco: B:11:0x001e A[Catch: all -> 0x0034, TryCatch #0 {, blocks: (B:5:0x0007, B:9:0x000f, B:11:0x001e, B:12:0x0022, B:13:0x0029, B:20:0x0015), top: B:4:0x0007 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    void receiveHeaders(okhttp3.Headers r4, boolean r5) {
        /*
            r3 = this;
            boolean r0 = java.lang.Thread.holdsLock(r3)
            if (r0 != 0) goto L37
            monitor-enter(r3)
            boolean r0 = r3.hasResponseHeaders     // Catch: java.lang.Throwable -> L34
            r1 = 1
            if (r0 == 0) goto L15
            if (r5 != 0) goto Lf
            goto L15
        Lf:
            okhttp3.internal.http2.Http2Stream$FramingSource r0 = r3.source     // Catch: java.lang.Throwable -> L34
            okhttp3.internal.http2.Http2Stream.FramingSource.access$202(r0, r4)     // Catch: java.lang.Throwable -> L34
            goto L1c
        L15:
            r3.hasResponseHeaders = r1     // Catch: java.lang.Throwable -> L34
            java.util.Deque<okhttp3.Headers> r0 = r3.headersQueue     // Catch: java.lang.Throwable -> L34
            r0.add(r4)     // Catch: java.lang.Throwable -> L34
        L1c:
            if (r5 == 0) goto L22
            okhttp3.internal.http2.Http2Stream$FramingSource r0 = r3.source     // Catch: java.lang.Throwable -> L34
            r0.finished = r1     // Catch: java.lang.Throwable -> L34
        L22:
            boolean r0 = r3.isOpen()     // Catch: java.lang.Throwable -> L34
            r3.notifyAll()     // Catch: java.lang.Throwable -> L34
            monitor-exit(r3)     // Catch: java.lang.Throwable -> L34
            if (r0 != 0) goto L33
            okhttp3.internal.http2.Http2Connection r1 = r3.connection
            int r2 = r3.id
            r1.removeStream(r2)
        L33:
            return
        L34:
            r0 = move-exception
            monitor-exit(r3)     // Catch: java.lang.Throwable -> L34
            throw r0
        L37:
            java.lang.AssertionError r0 = new java.lang.AssertionError
            r0.<init>()
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: okhttp3.internal.http2.Http2Stream.receiveHeaders(okhttp3.Headers, boolean):void");
    }

    synchronized void receiveRstStream(ErrorCode errorCode) {
        if (this.errorCode == null) {
            this.errorCode = errorCode;
            notifyAll();
        }
    }

    private final class FramingSource implements Source {
        static final /* sintético */ boolean $assertionsDisabled = false;
        boolean closed;
        boolean finished;
        private final long maxByteCount;
        private Headers trailers;
        private final Buffer receiveBuffer = new Buffer();
        private final Buffer readBuffer = new Buffer();

        FramingSource(long maxByteCount) {
            this.maxByteCount = maxByteCount;
        }

        /* JADX WARN: Code restructure failed: missing block: B:39:0x003c, code lost:
        
            r6 = r10.readBuffer.read(r11, java.lang.Math.min(r12, r10.readBuffer.size()));
         */
        /* JADX WARN: Code restructure failed: missing block: B:41:0x004c, code lost:
        
            r10.this$0.unacknowledgedBytesRead += r6;
         */
        /* JADX WARN: Code restructure failed: missing block: B:42:0x0053, code lost:
        
            if (r4 != null) goto L24;
         */
        /* JADX WARN: Code restructure failed: missing block: B:44:0x0068, code lost:
        
            if (r10.this$0.unacknowledgedBytesRead < (r10.this$0.connection.okHttpSettings.getInitialWindowSize() / 2)) goto L24;
         */
        /* JADX WARN: Code restructure failed: missing block: B:45:0x006a, code lost:
        
            r10.this$0.connection.writeWindowUpdateLater(r10.this$0.id, r10.this$0.unacknowledgedBytesRead);
            r10.this$0.unacknowledgedBytesRead = 0;
         */
        /* JADX WARN: Code restructure failed: missing block: B:47:0x007d, code lost:
        
            r2 = r6;
         */
        /* JADX WARN: Code restructure failed: missing block: B:48:0x007f, code lost:
        
            r0 = th;
         */
        /* JADX WARN: Code restructure failed: missing block: B:50:0x00b7, code lost:
        
            r10.this$0.readTimeout.exitAndThrowIfTimedOut();
         */
        /* JADX WARN: Code restructure failed: missing block: B:51:0x00be, code lost:
        
            throw r0;
         */
        /* JADX WARN: região duplicada removida para o bloco: B:31:0x00a6  */
        /* JADX WARN: região duplicada removida para o bloco: B:34:0x00aa  */
        @Override // okio.Source
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public long read(okio.Buffer r11, long r12) throws java.io.IOException {
            /*
                Method dump skipped, instructions count: 219
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: okhttp3.internal.http2.Http2Stream.FramingSource.read(okio.Buffer, long):long");
        }

        private void updateConnectionFlowControl(long read) {
            if (Thread.holdsLock(Http2Stream.this)) {
                throw new AssertionError();
            }
            Http2Stream.this.connection.updateConnectionFlowControl(read);
        }

        void receive(BufferedSource in, long byteCount) throws IOException {
            boolean finished;
            boolean wasEmpty;
            boolean flowControlError;
            if (Thread.holdsLock(Http2Stream.this)) {
                throw new AssertionError();
            }
            long bytesDiscarded = byteCount;
            while (bytesDiscarded > 0) {
                synchronized (Http2Stream.this) {
                    finished = this.finished;
                    wasEmpty = true;
                    flowControlError = this.readBuffer.size() + bytesDiscarded > this.maxByteCount;
                }
                if (flowControlError) {
                    in.skip(bytesDiscarded);
                    Http2Stream.this.closeLater(ErrorCode.FLOW_CONTROL_ERROR);
                    return;
                }
                if (finished) {
                    in.skip(bytesDiscarded);
                    return;
                }
                long read = in.read(this.receiveBuffer, bytesDiscarded);
                if (read == -1) {
                    throw new EOFException();
                }
                long byteCount2 = bytesDiscarded - read;
                long bytesDiscarded2 = 0;
                synchronized (Http2Stream.this) {
                    if (!this.closed) {
                        if (this.readBuffer.size() != 0) {
                            wasEmpty = false;
                        }
                        this.readBuffer.writeAll(this.receiveBuffer);
                        if (wasEmpty) {
                            Http2Stream.this.notifyAll();
                        }
                    } else {
                        bytesDiscarded2 = this.receiveBuffer.size();
                        this.receiveBuffer.clear();
                    }
                }
                if (bytesDiscarded2 > 0) {
                    updateConnectionFlowControl(bytesDiscarded2);
                }
                bytesDiscarded = byteCount2;
            }
        }

        @Override // okio.Source
        public Timeout timeout() {
            return Http2Stream.this.readTimeout;
        }

        @Override // okio.Source, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            long bytesDiscarded;
            synchronized (Http2Stream.this) {
                this.closed = true;
                bytesDiscarded = this.readBuffer.size();
                this.readBuffer.clear();
                Http2Stream.this.notifyAll();
            }
            if (bytesDiscarded > 0) {
                updateConnectionFlowControl(bytesDiscarded);
            }
            Http2Stream.this.cancelStreamIfNecessary();
        }
    }

    void cancelStreamIfNecessary() throws IOException {
        boolean cancel;
        boolean open;
        if (Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        synchronized (this) {
            cancel = !this.source.finished && this.source.closed && (this.sink.finished || this.sink.closed);
            open = isOpen();
        }
        if (cancel) {
            close(ErrorCode.CANCEL, null);
        } else if (!open) {
            this.connection.removeStream(this.id);
        }
    }

    final class FramingSink implements Sink {
        static final /* sintético */ boolean $assertionsDisabled = false;
        private static final long EMIT_BUFFER_SIZE = 16384;
        boolean closed;
        boolean finished;
        private final Buffer sendBuffer = new Buffer();
        private Headers trailers;

        FramingSink() {
        }

        @Override // okio.Sink
        public void write(Buffer source, long byteCount) throws IOException {
            if (Thread.holdsLock(Http2Stream.this)) {
                throw new AssertionError();
            }
            this.sendBuffer.write(source, byteCount);
            while (this.sendBuffer.size() >= 16384) {
                emitFrame(false);
            }
        }

        private void emitFrame(boolean outFinishedOnLastFrame) throws IOException {
            long toWrite;
            boolean z;
            synchronized (Http2Stream.this) {
                Http2Stream.this.writeTimeout.enter();
                while (Http2Stream.this.bytesLeftInWriteWindow <= 0 && !this.finished && !this.closed && Http2Stream.this.errorCode == null) {
                    try {
                        Http2Stream.this.waitForIo();
                    } finally {
                        Http2Stream.this.writeTimeout.exitAndThrowIfTimedOut();
                    }
                }
                Http2Stream.this.writeTimeout.exitAndThrowIfTimedOut();
                Http2Stream.this.checkOutNotClosed();
                toWrite = Math.min(Http2Stream.this.bytesLeftInWriteWindow, this.sendBuffer.size());
                Http2Stream.this.bytesLeftInWriteWindow -= toWrite;
            }
            Http2Stream.this.writeTimeout.enter();
            if (outFinishedOnLastFrame) {
                try {
                    if (toWrite == this.sendBuffer.size()) {
                        z = true;
                        boolean outFinished = z;
                        Http2Stream.this.connection.writeData(Http2Stream.this.id, outFinished, this.sendBuffer, toWrite);
                    }
                } catch (Throwable th) {
                    throw th;
                }
            }
            z = false;
            boolean outFinished2 = z;
            Http2Stream.this.connection.writeData(Http2Stream.this.id, outFinished2, this.sendBuffer, toWrite);
        }

        @Override // okio.Sink, java.io.Flushable
        public void flush() throws IOException {
            if (Thread.holdsLock(Http2Stream.this)) {
                throw new AssertionError();
            }
            synchronized (Http2Stream.this) {
                Http2Stream.this.checkOutNotClosed();
            }
            while (this.sendBuffer.size() > 0) {
                emitFrame(false);
                Http2Stream.this.connection.flush();
            }
        }

        @Override // okio.Sink
        public Timeout timeout() {
            return Http2Stream.this.writeTimeout;
        }

        @Override // okio.Sink, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            if (Thread.holdsLock(Http2Stream.this)) {
                throw new AssertionError();
            }
            synchronized (Http2Stream.this) {
                if (this.closed) {
                    return;
                }
                if (!Http2Stream.this.sink.finished) {
                    boolean hasData = this.sendBuffer.size() > 0;
                    boolean hasTrailers = this.trailers != null;
                    if (hasTrailers) {
                        while (this.sendBuffer.size() > 0) {
                            emitFrame(false);
                        }
                        Http2Stream.this.connection.writeHeaders(Http2Stream.this.id, true, Util.toHeaderBlock(this.trailers));
                    } else if (hasData) {
                        while (this.sendBuffer.size() > 0) {
                            emitFrame(true);
                        }
                    } else {
                        Http2Stream.this.connection.writeData(Http2Stream.this.id, true, null, 0L);
                    }
                }
                synchronized (Http2Stream.this) {
                    this.closed = true;
                }
                Http2Stream.this.connection.flush();
                Http2Stream.this.cancelStreamIfNecessary();
            }
        }
    }

    void addBytesToWriteWindow(long delta) {
        this.bytesLeftInWriteWindow += delta;
        if (delta > 0) {
            notifyAll();
        }
    }

    void checkOutNotClosed() throws IOException {
        if (this.sink.closed) {
            throw new IOException("stream closed");
        }
        if (this.sink.finished) {
            throw new IOException("stream finished");
        }
        if (this.errorCode != null) {
            if (this.errorException == null) {
                throw new StreamResetException(this.errorCode);
            }
        }
    }

    void waitForIo() throws InterruptedIOException {
        try {
            wait();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            throw new InterruptedIOException();
        }
    }

    class StreamTimeout extends AsyncTimeout {
        StreamTimeout() {
        }

        @Override // okio.AsyncTimeout
        protected void timedOut() {
            Http2Stream.this.closeLater(ErrorCode.CANCEL);
            Http2Stream.this.connection.sendDegradedPingLater();
        }

        @Override // okio.AsyncTimeout
        protected IOException newTimeoutException(IOException cause) {
            SocketTimeoutException socketTimeoutException = new SocketTimeoutException("timeout");
            if (cause != null) {
                socketTimeoutException.initCause(cause);
            }
            return socketTimeoutException;
        }

        public void exitAndThrowIfTimedOut() throws IOException {
            if (exit()) {
                throw newTimeoutException(null);
            }
        }
    }
}
