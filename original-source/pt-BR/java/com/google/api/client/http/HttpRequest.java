package com.google.api.client.http;

import androidx.core.view.accessibility.AccessibilityNodeInfoCompat;
import com.google.api.client.util.ObjectParser;
import com.google.api.client.util.Preconditions;
import com.google.api.client.util.Sleeper;
import java.util.concurrent.Callable;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.FutureTask;

/* carregado de: classes16.dex */
public final class HttpRequest {
    public static final int DEFAULT_NUMBER_OF_RETRIES = 10;
    public static final String USER_AGENT_SUFFIX = "Google-HTTP-Java-Client/1.26.0 (gzip)";
    public static final String VERSION = "1.26.0";

    @Deprecated
    private BackOffPolicy backOffPolicy;
    private HttpContent content;
    private HttpEncoding encoding;
    private HttpExecuteInterceptor executeInterceptor;
    private HttpIOExceptionHandler ioExceptionHandler;
    private ObjectParser objectParser;
    private String requestMethod;
    private HttpResponseInterceptor responseInterceptor;
    private boolean suppressUserAgentSuffix;
    private final HttpTransport transport;
    private HttpUnsuccessfulResponseHandler unsuccessfulResponseHandler;
    private GenericUrl url;
    private HttpHeaders headers = new HttpHeaders();
    private HttpHeaders responseHeaders = new HttpHeaders();
    private int numRetries = 10;
    private int contentLoggingLimit = 16384;
    private boolean loggingEnabled = true;
    private boolean curlLoggingEnabled = true;
    private int connectTimeout = AccessibilityNodeInfoCompat.EXTRA_DATA_TEXT_CHARACTER_LOCATION_ARG_MAX_LENGTH;
    private int readTimeout = AccessibilityNodeInfoCompat.EXTRA_DATA_TEXT_CHARACTER_LOCATION_ARG_MAX_LENGTH;
    private boolean followRedirects = true;
    private boolean throwExceptionOnExecuteError = true;

    @Deprecated
    private boolean retryOnExecuteIOException = false;
    private Sleeper sleeper = Sleeper.DEFAULT;

    HttpRequest(HttpTransport transport, String requestMethod) {
        this.transport = transport;
        setRequestMethod(requestMethod);
    }

    public HttpTransport getTransport() {
        return this.transport;
    }

    public String getRequestMethod() {
        return this.requestMethod;
    }

    public HttpRequest setRequestMethod(String requestMethod) {
        Preconditions.checkArgument(requestMethod == null || HttpMediaType.matchesToken(requestMethod));
        this.requestMethod = requestMethod;
        return this;
    }

    public GenericUrl getUrl() {
        return this.url;
    }

    public HttpRequest setUrl(GenericUrl url) {
        this.url = (GenericUrl) Preconditions.checkNotNull(url);
        return this;
    }

    public HttpContent getContent() {
        return this.content;
    }

    public HttpRequest setContent(HttpContent content) {
        this.content = content;
        return this;
    }

    public HttpEncoding getEncoding() {
        return this.encoding;
    }

    public HttpRequest setEncoding(HttpEncoding encoding) {
        this.encoding = encoding;
        return this;
    }

    @Deprecated
    public BackOffPolicy getBackOffPolicy() {
        return this.backOffPolicy;
    }

    @Deprecated
    public HttpRequest setBackOffPolicy(BackOffPolicy backOffPolicy) {
        this.backOffPolicy = backOffPolicy;
        return this;
    }

    public int getContentLoggingLimit() {
        return this.contentLoggingLimit;
    }

    public HttpRequest setContentLoggingLimit(int contentLoggingLimit) {
        Preconditions.checkArgument(contentLoggingLimit >= 0, "The content logging limit must be non-negative.");
        this.contentLoggingLimit = contentLoggingLimit;
        return this;
    }

    public boolean isLoggingEnabled() {
        return this.loggingEnabled;
    }

    public HttpRequest setLoggingEnabled(boolean loggingEnabled) {
        this.loggingEnabled = loggingEnabled;
        return this;
    }

    public boolean isCurlLoggingEnabled() {
        return this.curlLoggingEnabled;
    }

    public HttpRequest setCurlLoggingEnabled(boolean curlLoggingEnabled) {
        this.curlLoggingEnabled = curlLoggingEnabled;
        return this;
    }

    public int getConnectTimeout() {
        return this.connectTimeout;
    }

    public HttpRequest setConnectTimeout(int connectTimeout) {
        Preconditions.checkArgument(connectTimeout >= 0);
        this.connectTimeout = connectTimeout;
        return this;
    }

    public int getReadTimeout() {
        return this.readTimeout;
    }

    public HttpRequest setReadTimeout(int readTimeout) {
        Preconditions.checkArgument(readTimeout >= 0);
        this.readTimeout = readTimeout;
        return this;
    }

    public HttpHeaders getHeaders() {
        return this.headers;
    }

    public HttpRequest setHeaders(HttpHeaders headers) {
        this.headers = (HttpHeaders) Preconditions.checkNotNull(headers);
        return this;
    }

    public HttpHeaders getResponseHeaders() {
        return this.responseHeaders;
    }

    public HttpRequest setResponseHeaders(HttpHeaders responseHeaders) {
        this.responseHeaders = (HttpHeaders) Preconditions.checkNotNull(responseHeaders);
        return this;
    }

    public HttpExecuteInterceptor getInterceptor() {
        return this.executeInterceptor;
    }

    public HttpRequest setInterceptor(HttpExecuteInterceptor interceptor) {
        this.executeInterceptor = interceptor;
        return this;
    }

    public HttpUnsuccessfulResponseHandler getUnsuccessfulResponseHandler() {
        return this.unsuccessfulResponseHandler;
    }

    public HttpRequest setUnsuccessfulResponseHandler(HttpUnsuccessfulResponseHandler unsuccessfulResponseHandler) {
        this.unsuccessfulResponseHandler = unsuccessfulResponseHandler;
        return this;
    }

    public HttpIOExceptionHandler getIOExceptionHandler() {
        return this.ioExceptionHandler;
    }

    public HttpRequest setIOExceptionHandler(HttpIOExceptionHandler ioExceptionHandler) {
        this.ioExceptionHandler = ioExceptionHandler;
        return this;
    }

    public HttpResponseInterceptor getResponseInterceptor() {
        return this.responseInterceptor;
    }

    public HttpRequest setResponseInterceptor(HttpResponseInterceptor responseInterceptor) {
        this.responseInterceptor = responseInterceptor;
        return this;
    }

    public int getNumberOfRetries() {
        return this.numRetries;
    }

    public HttpRequest setNumberOfRetries(int numRetries) {
        Preconditions.checkArgument(numRetries >= 0);
        this.numRetries = numRetries;
        return this;
    }

    public HttpRequest setParser(ObjectParser parser) {
        this.objectParser = parser;
        return this;
    }

    public final ObjectParser getParser() {
        return this.objectParser;
    }

    public boolean getFollowRedirects() {
        return this.followRedirects;
    }

    public HttpRequest setFollowRedirects(boolean followRedirects) {
        this.followRedirects = followRedirects;
        return this;
    }

    public boolean getThrowExceptionOnExecuteError() {
        return this.throwExceptionOnExecuteError;
    }

    public HttpRequest setThrowExceptionOnExecuteError(boolean throwExceptionOnExecuteError) {
        this.throwExceptionOnExecuteError = throwExceptionOnExecuteError;
        return this;
    }

    @Deprecated
    public boolean getRetryOnExecuteIOException() {
        return this.retryOnExecuteIOException;
    }

    @Deprecated
    public HttpRequest setRetryOnExecuteIOException(boolean retryOnExecuteIOException) {
        this.retryOnExecuteIOException = retryOnExecuteIOException;
        return this;
    }

    public boolean getSuppressUserAgentSuffix() {
        return this.suppressUserAgentSuffix;
    }

    public HttpRequest setSuppressUserAgentSuffix(boolean suppressUserAgentSuffix) {
        this.suppressUserAgentSuffix = suppressUserAgentSuffix;
        return this;
    }

    /* JADX WARN: região duplicada removida para o bloco: B:112:0x02ed  */
    /* JADX WARN: região duplicada removida para o bloco: B:113:0x028f A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: região duplicada removida para o bloco: B:85:0x02eb  */
    /* JADX WARN: região duplicada removida para o bloco: B:89:0x02f5 A[ADDED_TO_REGION, DONT_GENERATE] */
    /* JADX WARN: região duplicada removida para o bloco: B:92:0x031f A[LOOP:0: B:8:0x0023->B:92:0x031f, LOOP_END] */
    /* JADX WARN: região duplicada removida para o bloco: B:93:0x02fc A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.google.api.client.http.HttpResponse execute() throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 803
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.api.client.http.HttpRequest.execute():com.google.api.client.http.HttpResponse");
    }

    public Future<HttpResponse> executeAsync(Executor executor) {
        FutureTask<HttpResponse> future = new FutureTask<>(new Callable<HttpResponse>() { // da classe: com.google.api.client.http.HttpRequest.1
            /* JADX WARN: não é possível renomear o método para resolver a colisão */
            @Override // java.util.concurrent.Callable
            public HttpResponse call() throws Exception {
                return HttpRequest.this.execute();
            }
        });
        executor.execute(future);
        return future;
    }

    public Future<HttpResponse> executeAsync() {
        return executeAsync(Executors.newSingleThreadExecutor());
    }

    public boolean handleRedirect(int statusCode, HttpHeaders responseHeaders) {
        String redirectLocation = responseHeaders.getLocation();
        if (getFollowRedirects() && HttpStatusCodes.isRedirect(statusCode) && redirectLocation != null) {
            setUrl(new GenericUrl(this.url.toURL(redirectLocation)));
            if (statusCode == 303) {
                setRequestMethod(HttpMethods.GET);
                setContent(null);
            }
            this.headers.setAuthorization((String) null);
            this.headers.setIfMatch(null);
            this.headers.setIfNoneMatch(null);
            this.headers.setIfModifiedSince(null);
            this.headers.setIfUnmodifiedSince(null);
            this.headers.setIfRange(null);
            return true;
        }
        return false;
    }

    public Sleeper getSleeper() {
        return this.sleeper;
    }

    public HttpRequest setSleeper(Sleeper sleeper) {
        this.sleeper = (Sleeper) Preconditions.checkNotNull(sleeper);
        return this;
    }
}
