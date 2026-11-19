package okhttp3.internal.http;

import java.io.IOException;
import java.util.List;
import okhttp3.Cookie;
import okhttp3.CookieJar;
import okhttp3.Headers;
import okhttp3.Interceptor;
import okhttp3.MediaType;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okhttp3.internal.Util;
import okhttp3.internal.Version;
import okio.GzipSource;
import okio.Okio;

/* carregado de: classes17.dex */
public final class BridgeInterceptor implements Interceptor {
    private final CookieJar cookieJar;

    public BridgeInterceptor(CookieJar cookieJar) {
        this.cookieJar = cookieJar;
    }

    @Override // okhttp3.Interceptor
    public Response intercept(Interceptor.Chain chain) throws IOException {
        Request userRequest = chain.request();
        Request.Builder requestBuilder = userRequest.newBuilder();
        RequestBody body = userRequest.body();
        if (body != null) {
            MediaType contentType = body.contentType();
            if (contentType != null) {
                requestBuilder.header(com.google.common.net.HttpHeaders.CONTENT_TYPE, contentType.toString());
            }
            long contentLength = body.contentLength();
            if (contentLength != -1) {
                requestBuilder.header(com.google.common.net.HttpHeaders.CONTENT_LENGTH, Long.toString(contentLength));
                requestBuilder.removeHeader(com.google.common.net.HttpHeaders.TRANSFER_ENCODING);
            } else {
                requestBuilder.header(com.google.common.net.HttpHeaders.TRANSFER_ENCODING, "chunked");
                requestBuilder.removeHeader(com.google.common.net.HttpHeaders.CONTENT_LENGTH);
            }
        }
        if (userRequest.header(com.google.common.net.HttpHeaders.HOST) == null) {
            requestBuilder.header(com.google.common.net.HttpHeaders.HOST, Util.hostHeader(userRequest.url(), false));
        }
        if (userRequest.header(com.google.common.net.HttpHeaders.CONNECTION) == null) {
            requestBuilder.header(com.google.common.net.HttpHeaders.CONNECTION, com.google.common.net.HttpHeaders.KEEP_ALIVE);
        }
        boolean transparentGzip = false;
        if (userRequest.header(com.google.common.net.HttpHeaders.ACCEPT_ENCODING) == null && userRequest.header(com.google.common.net.HttpHeaders.RANGE) == null) {
            transparentGzip = true;
            requestBuilder.header(com.google.common.net.HttpHeaders.ACCEPT_ENCODING, "gzip");
        }
        List<Cookie> cookies = this.cookieJar.loadForRequest(userRequest.url());
        if (!cookies.isEmpty()) {
            requestBuilder.header(com.google.common.net.HttpHeaders.COOKIE, cookieHeader(cookies));
        }
        if (userRequest.header(com.google.common.net.HttpHeaders.USER_AGENT) == null) {
            requestBuilder.header(com.google.common.net.HttpHeaders.USER_AGENT, Version.userAgent());
        }
        Response networkResponse = chain.proceed(requestBuilder.build());
        HttpHeaders.receiveHeaders(this.cookieJar, userRequest.url(), networkResponse.headers());
        Response.Builder responseBuilder = networkResponse.newBuilder().request(userRequest);
        if (transparentGzip && "gzip".equalsIgnoreCase(networkResponse.header(com.google.common.net.HttpHeaders.CONTENT_ENCODING)) && HttpHeaders.hasBody(networkResponse)) {
            GzipSource responseBody = new GzipSource(networkResponse.body().source());
            Headers strippedHeaders = networkResponse.headers().newBuilder().removeAll(com.google.common.net.HttpHeaders.CONTENT_ENCODING).removeAll(com.google.common.net.HttpHeaders.CONTENT_LENGTH).build();
            responseBuilder.headers(strippedHeaders);
            responseBuilder.body(new RealResponseBody(networkResponse.header(com.google.common.net.HttpHeaders.CONTENT_TYPE), -1L, Okio.buffer(responseBody)));
        }
        return responseBuilder.build();
    }

    private String cookieHeader(List<Cookie> cookies) {
        StringBuilder cookieHeader = new StringBuilder();
        int size = cookies.size();
        for (int i = 0; i < size; i++) {
            if (i > 0) {
                cookieHeader.append("; ");
            }
            Cookie cookie = cookies.get(i);
            cookieHeader.append(cookie.name()).append('=').append(cookie.value());
        }
        return cookieHeader.toString();
    }
}
