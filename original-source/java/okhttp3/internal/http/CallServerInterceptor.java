package okhttp3.internal.http;

import java.io.IOException;
import java.net.ProtocolException;
import okhttp3.Interceptor;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.internal.Util;
import okhttp3.internal.connection.Exchange;
import okio.BufferedSink;
import okio.Okio;

/* loaded from: classes17.dex */
public final class CallServerInterceptor implements Interceptor {
    private final boolean forWebSocket;

    public CallServerInterceptor(boolean forWebSocket) {
        this.forWebSocket = forWebSocket;
    }

    @Override // okhttp3.Interceptor
    public Response intercept(Interceptor.Chain chain) throws IOException {
        Response response;
        RealInterceptorChain realChain = (RealInterceptorChain) chain;
        Exchange exchange = realChain.exchange();
        Request request = realChain.request();
        long sentRequestMillis = System.currentTimeMillis();
        exchange.writeRequestHeaders(request);
        boolean responseHeadersStarted = false;
        Response.Builder responseBuilder = null;
        if (HttpMethod.permitsRequestBody(request.method()) && request.body() != null) {
            if ("100-continue".equalsIgnoreCase(request.header(com.google.common.net.HttpHeaders.EXPECT))) {
                exchange.flushRequest();
                responseHeadersStarted = true;
                exchange.responseHeadersStart();
                responseBuilder = exchange.readResponseHeaders(true);
            }
            if (responseBuilder == null) {
                if (request.body().isDuplex()) {
                    exchange.flushRequest();
                    request.body().writeTo(Okio.buffer(exchange.createRequestBody(request, true)));
                } else {
                    BufferedSink bufferedRequestBody = Okio.buffer(exchange.createRequestBody(request, false));
                    request.body().writeTo(bufferedRequestBody);
                    bufferedRequestBody.close();
                }
            } else {
                exchange.noRequestBody();
                if (!exchange.connection().isMultiplexed()) {
                    exchange.noNewExchangesOnConnection();
                }
            }
        } else {
            exchange.noRequestBody();
        }
        if (request.body() == null || !request.body().isDuplex()) {
            exchange.finishRequest();
        }
        if (!responseHeadersStarted) {
            exchange.responseHeadersStart();
        }
        if (responseBuilder == null) {
            responseBuilder = exchange.readResponseHeaders(false);
        }
        Response response2 = responseBuilder.request(request).handshake(exchange.connection().handshake()).sentRequestAtMillis(sentRequestMillis).receivedResponseAtMillis(System.currentTimeMillis()).build();
        int code = response2.code();
        if (code == 100) {
            response2 = exchange.readResponseHeaders(false).request(request).handshake(exchange.connection().handshake()).sentRequestAtMillis(sentRequestMillis).receivedResponseAtMillis(System.currentTimeMillis()).build();
            code = response2.code();
        }
        exchange.responseHeadersEnd(response2);
        if (this.forWebSocket && code == 101) {
            response = response2.newBuilder().body(Util.EMPTY_RESPONSE).build();
        } else {
            response = response2.newBuilder().body(exchange.openResponseBody(response2)).build();
        }
        if ("close".equalsIgnoreCase(response.request().header(com.google.common.net.HttpHeaders.CONNECTION)) || "close".equalsIgnoreCase(response.header(com.google.common.net.HttpHeaders.CONNECTION))) {
            exchange.noNewExchangesOnConnection();
        }
        if ((code == 204 || code == 205) && response.body().contentLength() > 0) {
            throw new ProtocolException("HTTP " + code + " had non-zero Content-Length: " + response.body().contentLength());
        }
        return response;
    }
}
