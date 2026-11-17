package okhttp3.internal.connection;

import com.google.common.net.HttpHeaders;
import java.io.IOException;
import java.net.ProtocolException;
import java.net.SocketException;
import javax.annotation.Nullable;
import okhttp3.Call;
import okhttp3.EventListener;
import okhttp3.Headers;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;
import okhttp3.internal.Internal;
import okhttp3.internal.http.ExchangeCodec;
import okhttp3.internal.http.RealResponseBody;
import okhttp3.internal.ws.RealWebSocket;
import okio.Buffer;
import okio.ForwardingSink;
import okio.ForwardingSource;
import okio.Okio;
import okio.Sink;
import okio.Source;

/* loaded from: classes17.dex */
public final class Exchange {
    final Call call;
    final ExchangeCodec codec;
    private boolean duplex;
    final EventListener eventListener;
    final ExchangeFinder finder;
    final Transmitter transmitter;

    public Exchange(Transmitter transmitter, Call call, EventListener eventListener, ExchangeFinder finder, ExchangeCodec codec) {
        this.transmitter = transmitter;
        this.call = call;
        this.eventListener = eventListener;
        this.finder = finder;
        this.codec = codec;
    }

    public RealConnection connection() {
        return this.codec.connection();
    }

    public boolean isDuplex() {
        return this.duplex;
    }

    public void writeRequestHeaders(Request request) throws IOException {
        try {
            this.eventListener.requestHeadersStart(this.call);
            this.codec.writeRequestHeaders(request);
            this.eventListener.requestHeadersEnd(this.call, request);
        } catch (IOException e) {
            this.eventListener.requestFailed(this.call, e);
            trackFailure(e);
            throw e;
        }
    }

    public Sink createRequestBody(Request request, boolean duplex) throws IOException {
        this.duplex = duplex;
        long contentLength = request.body().contentLength();
        this.eventListener.requestBodyStart(this.call);
        Sink rawRequestBody = this.codec.createRequestBody(request, contentLength);
        return new RequestBodySink(rawRequestBody, contentLength);
    }

    public void flushRequest() throws IOException {
        try {
            this.codec.flushRequest();
        } catch (IOException e) {
            this.eventListener.requestFailed(this.call, e);
            trackFailure(e);
            throw e;
        }
    }

    public void finishRequest() throws IOException {
        try {
            this.codec.finishRequest();
        } catch (IOException e) {
            this.eventListener.requestFailed(this.call, e);
            trackFailure(e);
            throw e;
        }
    }

    public void responseHeadersStart() {
        this.eventListener.responseHeadersStart(this.call);
    }

    @Nullable
    public Response.Builder readResponseHeaders(boolean expectContinue) throws IOException {
        try {
            Response.Builder result = this.codec.readResponseHeaders(expectContinue);
            if (result != null) {
                Internal.instance.initExchange(result, this);
            }
            return result;
        } catch (IOException e) {
            this.eventListener.responseFailed(this.call, e);
            trackFailure(e);
            throw e;
        }
    }

    public void responseHeadersEnd(Response response) {
        this.eventListener.responseHeadersEnd(this.call, response);
    }

    public ResponseBody openResponseBody(Response response) throws IOException {
        try {
            this.eventListener.responseBodyStart(this.call);
            String contentType = response.header(HttpHeaders.CONTENT_TYPE);
            long contentLength = this.codec.reportedContentLength(response);
            Source rawSource = this.codec.openResponseBodySource(response);
            ResponseBodySource source = new ResponseBodySource(rawSource, contentLength);
            return new RealResponseBody(contentType, contentLength, Okio.buffer(source));
        } catch (IOException e) {
            this.eventListener.responseFailed(this.call, e);
            trackFailure(e);
            throw e;
        }
    }

    public Headers trailers() throws IOException {
        return this.codec.trailers();
    }

    public void timeoutEarlyExit() {
        this.transmitter.timeoutEarlyExit();
    }

    public RealWebSocket.Streams newWebSocketStreams() throws SocketException {
        this.transmitter.timeoutEarlyExit();
        return this.codec.connection().newWebSocketStreams(this);
    }

    public void webSocketUpgradeFailed() {
        bodyComplete(-1L, true, true, null);
    }

    public void noNewExchangesOnConnection() {
        this.codec.connection().noNewExchanges();
    }

    public void cancel() {
        this.codec.cancel();
    }

    public void detachWithViolence() {
        this.codec.cancel();
        this.transmitter.exchangeMessageDone(this, true, true, null);
    }

    void trackFailure(IOException e) {
        this.finder.trackFailure();
        this.codec.connection().trackFailure(e);
    }

    @Nullable
    IOException bodyComplete(long bytesRead, boolean responseDone, boolean requestDone, @Nullable IOException e) {
        if (e != null) {
            trackFailure(e);
        }
        if (requestDone) {
            if (e != null) {
                this.eventListener.requestFailed(this.call, e);
            } else {
                this.eventListener.requestBodyEnd(this.call, bytesRead);
            }
        }
        if (responseDone) {
            if (e != null) {
                this.eventListener.responseFailed(this.call, e);
            } else {
                this.eventListener.responseBodyEnd(this.call, bytesRead);
            }
        }
        return this.transmitter.exchangeMessageDone(this, requestDone, responseDone, e);
    }

    public void noRequestBody() {
        this.transmitter.exchangeMessageDone(this, true, false, null);
    }

    private final class RequestBodySink extends ForwardingSink {
        private long bytesReceived;
        private boolean closed;
        private boolean completed;
        private long contentLength;

        RequestBodySink(Sink delegate, long contentLength) {
            super(delegate);
            this.contentLength = contentLength;
        }

        @Override // okio.ForwardingSink, okio.Sink
        public void write(Buffer source, long byteCount) throws IOException {
            if (this.closed) {
                throw new IllegalStateException("closed");
            }
            if (this.contentLength != -1 && this.bytesReceived + byteCount > this.contentLength) {
                throw new ProtocolException("expected " + this.contentLength + " bytes but received " + (this.bytesReceived + byteCount));
            }
            try {
                super.write(source, byteCount);
                this.bytesReceived += byteCount;
            } catch (IOException e) {
                throw complete(e);
            }
        }

        @Override // okio.ForwardingSink, okio.Sink, java.io.Flushable
        public void flush() throws IOException {
            try {
                super.flush();
            } catch (IOException e) {
                throw complete(e);
            }
        }

        @Override // okio.ForwardingSink, okio.Sink, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            if (this.closed) {
                return;
            }
            this.closed = true;
            if (this.contentLength != -1 && this.bytesReceived != this.contentLength) {
                throw new ProtocolException("unexpected end of stream");
            }
            try {
                super.close();
                complete(null);
            } catch (IOException e) {
                throw complete(e);
            }
        }

        @Nullable
        private IOException complete(@Nullable IOException e) {
            if (this.completed) {
                return e;
            }
            this.completed = true;
            return Exchange.this.bodyComplete(this.bytesReceived, false, true, e);
        }
    }

    final class ResponseBodySource extends ForwardingSource {
        private long bytesReceived;
        private boolean closed;
        private boolean completed;
        private final long contentLength;

        ResponseBodySource(Source delegate, long contentLength) {
            super(delegate);
            this.contentLength = contentLength;
            if (contentLength == 0) {
                complete(null);
            }
        }

        @Override // okio.ForwardingSource, okio.Source
        public long read(Buffer sink, long byteCount) throws IOException {
            if (this.closed) {
                throw new IllegalStateException("closed");
            }
            try {
                long read = delegate().read(sink, byteCount);
                if (read == -1) {
                    complete(null);
                    return -1L;
                }
                long newBytesReceived = this.bytesReceived + read;
                if (this.contentLength != -1 && newBytesReceived > this.contentLength) {
                    throw new ProtocolException("expected " + this.contentLength + " bytes but received " + newBytesReceived);
                }
                this.bytesReceived = newBytesReceived;
                if (newBytesReceived == this.contentLength) {
                    complete(null);
                }
                return read;
            } catch (IOException e) {
                throw complete(e);
            }
        }

        @Override // okio.ForwardingSource, okio.Source, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            if (this.closed) {
                return;
            }
            this.closed = true;
            try {
                super.close();
                complete(null);
            } catch (IOException e) {
                throw complete(e);
            }
        }

        @Nullable
        IOException complete(@Nullable IOException e) {
            if (this.completed) {
                return e;
            }
            this.completed = true;
            return Exchange.this.bodyComplete(this.bytesReceived, true, false, e);
        }
    }
}
