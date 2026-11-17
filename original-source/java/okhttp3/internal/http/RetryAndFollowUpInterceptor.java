package okhttp3.internal.http;

import com.google.api.client.http.HttpMethods;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.ProtocolException;
import java.net.Proxy;
import java.net.SocketTimeoutException;
import java.security.cert.CertificateException;
import javax.annotation.Nullable;
import javax.net.ssl.SSLHandshakeException;
import javax.net.ssl.SSLPeerUnverifiedException;
import okhttp3.HttpUrl;
import okhttp3.Interceptor;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okhttp3.Route;
import okhttp3.internal.Internal;
import okhttp3.internal.Util;
import okhttp3.internal.connection.Exchange;
import okhttp3.internal.connection.RouteException;
import okhttp3.internal.connection.Transmitter;
import okhttp3.internal.http2.ConnectionShutdownException;

/* loaded from: classes17.dex */
public final class RetryAndFollowUpInterceptor implements Interceptor {
    private static final int MAX_FOLLOW_UPS = 20;
    private final OkHttpClient client;

    public RetryAndFollowUpInterceptor(OkHttpClient client) {
        this.client = client;
    }

    @Override // okhttp3.Interceptor
    public Response intercept(Interceptor.Chain chain) throws IOException {
        Response response;
        Exchange exchange;
        Request followUp;
        Request request = chain.request();
        RealInterceptorChain realChain = (RealInterceptorChain) chain;
        Transmitter transmitter = realChain.transmitter();
        int followUpCount = 0;
        Response priorResponse = null;
        while (true) {
            transmitter.prepareToConnect(request);
            if (transmitter.isCanceled()) {
                throw new IOException("Canceled");
            }
            boolean success = false;
            try {
                try {
                    response = realChain.proceed(request, transmitter, null);
                    success = true;
                    if (priorResponse != null) {
                        response = response.newBuilder().priorResponse(priorResponse.newBuilder().body(null).build()).build();
                    }
                    exchange = Internal.instance.exchange(response);
                    Route route = exchange != null ? exchange.connection().route() : null;
                    followUp = followUpRequest(response, route);
                } catch (IOException e) {
                    boolean requestSendStarted = e instanceof ConnectionShutdownException ? false : true;
                    if (!recover(e, transmitter, requestSendStarted, request)) {
                        throw e;
                    }
                    if (!success) {
                        transmitter.exchangeDoneDueToException();
                    }
                } catch (RouteException e2) {
                    if (!recover(e2.getLastConnectException(), transmitter, false, request)) {
                        throw e2.getFirstConnectException();
                    }
                    if (!success) {
                        transmitter.exchangeDoneDueToException();
                    }
                }
                if (followUp == null) {
                    if (exchange != null && exchange.isDuplex()) {
                        transmitter.timeoutEarlyExit();
                    }
                    return response;
                }
                RequestBody followUpBody = followUp.body();
                if (followUpBody != null && followUpBody.isOneShot()) {
                    return response;
                }
                Util.closeQuietly(response.body());
                if (transmitter.hasExchange()) {
                    exchange.detachWithViolence();
                }
                followUpCount++;
                if (followUpCount > 20) {
                    throw new ProtocolException("Too many follow-up requests: " + followUpCount);
                }
                request = followUp;
                priorResponse = response;
            } finally {
                if (!success) {
                    transmitter.exchangeDoneDueToException();
                }
            }
        }
    }

    private boolean recover(IOException e, Transmitter transmitter, boolean requestSendStarted, Request userRequest) {
        if (this.client.retryOnConnectionFailure()) {
            return !(requestSendStarted && requestIsOneShot(e, userRequest)) && isRecoverable(e, requestSendStarted) && transmitter.canRetry();
        }
        return false;
    }

    private boolean requestIsOneShot(IOException e, Request userRequest) {
        RequestBody requestBody = userRequest.body();
        return (requestBody != null && requestBody.isOneShot()) || (e instanceof FileNotFoundException);
    }

    private boolean isRecoverable(IOException e, boolean requestSendStarted) {
        if (e instanceof ProtocolException) {
            return false;
        }
        return e instanceof InterruptedIOException ? (e instanceof SocketTimeoutException) && !requestSendStarted : (((e instanceof SSLHandshakeException) && (e.getCause() instanceof CertificateException)) || (e instanceof SSLPeerUnverifiedException)) ? false : true;
    }

    private Request followUpRequest(Response userResponse, @Nullable Route route) throws IOException {
        String location;
        HttpUrl url;
        Proxy selectedProxy;
        if (userResponse == null) {
            throw new IllegalStateException();
        }
        int responseCode = userResponse.code();
        String method = userResponse.request().method();
        switch (responseCode) {
            case 300:
            case 301:
            case 302:
            case 303:
                break;
            case 307:
            case 308:
                if (!method.equals(HttpMethods.GET) && !method.equals(HttpMethods.HEAD)) {
                    return null;
                }
                break;
            case 401:
                return this.client.authenticator().authenticate(route, userResponse);
            case 407:
                if (route != null) {
                    selectedProxy = route.proxy();
                } else {
                    selectedProxy = this.client.proxy();
                }
                if (selectedProxy.type() != Proxy.Type.HTTP) {
                    throw new ProtocolException("Received HTTP_PROXY_AUTH (407) code while not using proxy");
                }
                return this.client.proxyAuthenticator().authenticate(route, userResponse);
            case 408:
                if (!this.client.retryOnConnectionFailure()) {
                    return null;
                }
                RequestBody requestBody = userResponse.request().body();
                if (requestBody != null && requestBody.isOneShot()) {
                    return null;
                }
                if ((userResponse.priorResponse() == null || userResponse.priorResponse().code() != 408) && retryAfter(userResponse, 0) <= 0) {
                    return userResponse.request();
                }
                return null;
            case 503:
                if ((userResponse.priorResponse() == null || userResponse.priorResponse().code() != 503) && retryAfter(userResponse, Integer.MAX_VALUE) == 0) {
                    return userResponse.request();
                }
                return null;
            default:
                return null;
        }
        if (!this.client.followRedirects() || (location = userResponse.header(com.google.common.net.HttpHeaders.LOCATION)) == null || (url = userResponse.request().url().resolve(location)) == null) {
            return null;
        }
        boolean sameScheme = url.scheme().equals(userResponse.request().url().scheme());
        if (!sameScheme && !this.client.followSslRedirects()) {
            return null;
        }
        Request.Builder requestBuilder = userResponse.request().newBuilder();
        if (HttpMethod.permitsRequestBody(method)) {
            boolean maintainBody = HttpMethod.redirectsWithBody(method);
            if (HttpMethod.redirectsToGet(method)) {
                requestBuilder.method(HttpMethods.GET, null);
            } else {
                requestBuilder.method(method, maintainBody ? userResponse.request().body() : null);
            }
            if (!maintainBody) {
                requestBuilder.removeHeader(com.google.common.net.HttpHeaders.TRANSFER_ENCODING);
                requestBuilder.removeHeader(com.google.common.net.HttpHeaders.CONTENT_LENGTH);
                requestBuilder.removeHeader(com.google.common.net.HttpHeaders.CONTENT_TYPE);
            }
        }
        if (!Util.sameConnection(userResponse.request().url(), url)) {
            requestBuilder.removeHeader(com.google.common.net.HttpHeaders.AUTHORIZATION);
        }
        return requestBuilder.url(url).build();
    }

    private int retryAfter(Response userResponse, int defaultDelay) {
        String header = userResponse.header(com.google.common.net.HttpHeaders.RETRY_AFTER);
        if (header == null) {
            return defaultDelay;
        }
        if (header.matches("\\d+")) {
            return Integer.valueOf(header).intValue();
        }
        return Integer.MAX_VALUE;
    }
}
