package com.google.api.client.http;

import com.google.api.client.util.Charsets;
import com.google.api.client.util.IOUtils;
import com.google.api.client.util.Preconditions;
import com.google.api.client.util.StringUtils;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Type;
import java.nio.charset.Charset;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes16.dex */
public final class HttpResponse {
    private InputStream content;
    private final String contentEncoding;
    private int contentLoggingLimit;
    private boolean contentRead;
    private final String contentType;
    private boolean loggingEnabled;
    private final HttpMediaType mediaType;
    private final HttpRequest request;
    LowLevelHttpResponse response;
    private final int statusCode;
    private final String statusMessage;

    HttpResponse(HttpRequest request, LowLevelHttpResponse response) throws IOException {
        this.request = request;
        this.contentLoggingLimit = request.getContentLoggingLimit();
        this.loggingEnabled = request.isLoggingEnabled();
        this.response = response;
        this.contentEncoding = response.getContentEncoding();
        int code = response.getStatusCode();
        boolean loggable = false;
        this.statusCode = code < 0 ? 0 : code;
        String message = response.getReasonPhrase();
        this.statusMessage = message;
        Logger logger = HttpTransport.LOGGER;
        if (this.loggingEnabled && logger.isLoggable(Level.CONFIG)) {
            loggable = true;
        }
        StringBuilder logbuf = null;
        if (loggable) {
            logbuf = new StringBuilder();
            logbuf.append("-------------- RESPONSE --------------").append(StringUtils.LINE_SEPARATOR);
            String statusLine = response.getStatusLine();
            if (statusLine != null) {
                logbuf.append(statusLine);
            } else {
                logbuf.append(this.statusCode);
                if (message != null) {
                    logbuf.append(' ').append(message);
                }
            }
            logbuf.append(StringUtils.LINE_SEPARATOR);
        }
        request.getResponseHeaders().fromHttpResponse(response, loggable ? logbuf : null);
        String contentType = response.getContentType();
        contentType = contentType == null ? request.getResponseHeaders().getContentType() : contentType;
        this.contentType = contentType;
        this.mediaType = contentType != null ? new HttpMediaType(contentType) : null;
        if (loggable) {
            logger.config(logbuf.toString());
        }
    }

    public int getContentLoggingLimit() {
        return this.contentLoggingLimit;
    }

    public HttpResponse setContentLoggingLimit(int contentLoggingLimit) {
        Preconditions.checkArgument(contentLoggingLimit >= 0, "The content logging limit must be non-negative.");
        this.contentLoggingLimit = contentLoggingLimit;
        return this;
    }

    public boolean isLoggingEnabled() {
        return this.loggingEnabled;
    }

    public HttpResponse setLoggingEnabled(boolean loggingEnabled) {
        this.loggingEnabled = loggingEnabled;
        return this;
    }

    public String getContentEncoding() {
        return this.contentEncoding;
    }

    public String getContentType() {
        return this.contentType;
    }

    public HttpMediaType getMediaType() {
        return this.mediaType;
    }

    public HttpHeaders getHeaders() {
        return this.request.getResponseHeaders();
    }

    public boolean isSuccessStatusCode() {
        return HttpStatusCodes.isSuccess(this.statusCode);
    }

    public int getStatusCode() {
        return this.statusCode;
    }

    public String getStatusMessage() {
        return this.statusMessage;
    }

    public HttpTransport getTransport() {
        return this.request.getTransport();
    }

    public HttpRequest getRequest() {
        return this.request;
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x003a, code lost:
    
        if (1 == 0) goto L20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x003c, code lost:
    
        r0.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0048, code lost:
    
        if (0 != 0) goto L28;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.io.InputStream getContent() throws java.io.IOException {
        /*
            r7 = this;
            boolean r0 = r7.contentRead
            if (r0 != 0) goto L4e
            com.google.api.client.http.LowLevelHttpResponse r0 = r7.response
            java.io.InputStream r0 = r0.getContent()
            if (r0 == 0) goto L4b
            r1 = 0
            java.lang.String r2 = r7.contentEncoding     // Catch: java.lang.Throwable -> L40 java.io.EOFException -> L47
            if (r2 == 0) goto L1f
            java.lang.String r3 = "gzip"
            boolean r3 = r2.contains(r3)     // Catch: java.lang.Throwable -> L40 java.io.EOFException -> L47
            if (r3 == 0) goto L1f
            java.util.zip.GZIPInputStream r3 = new java.util.zip.GZIPInputStream     // Catch: java.lang.Throwable -> L40 java.io.EOFException -> L47
            r3.<init>(r0)     // Catch: java.lang.Throwable -> L40 java.io.EOFException -> L47
            r0 = r3
        L1f:
            java.util.logging.Logger r3 = com.google.api.client.http.HttpTransport.LOGGER     // Catch: java.lang.Throwable -> L40 java.io.EOFException -> L47
            boolean r4 = r7.loggingEnabled     // Catch: java.lang.Throwable -> L40 java.io.EOFException -> L47
            if (r4 == 0) goto L37
            java.util.logging.Level r4 = java.util.logging.Level.CONFIG     // Catch: java.lang.Throwable -> L40 java.io.EOFException -> L47
            boolean r4 = r3.isLoggable(r4)     // Catch: java.lang.Throwable -> L40 java.io.EOFException -> L47
            if (r4 == 0) goto L37
            com.google.api.client.util.LoggingInputStream r4 = new com.google.api.client.util.LoggingInputStream     // Catch: java.lang.Throwable -> L40 java.io.EOFException -> L47
            java.util.logging.Level r5 = java.util.logging.Level.CONFIG     // Catch: java.lang.Throwable -> L40 java.io.EOFException -> L47
            int r6 = r7.contentLoggingLimit     // Catch: java.lang.Throwable -> L40 java.io.EOFException -> L47
            r4.<init>(r0, r3, r5, r6)     // Catch: java.lang.Throwable -> L40 java.io.EOFException -> L47
            r0 = r4
        L37:
            r7.content = r0     // Catch: java.lang.Throwable -> L40 java.io.EOFException -> L47
            r1 = 1
            if (r1 != 0) goto L4b
        L3c:
            r0.close()
            goto L4b
        L40:
            r2 = move-exception
            if (r1 != 0) goto L46
            r0.close()
        L46:
            throw r2
        L47:
            r2 = move-exception
            if (r1 != 0) goto L4b
            goto L3c
        L4b:
            r1 = 1
            r7.contentRead = r1
        L4e:
            java.io.InputStream r0 = r7.content
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.api.client.http.HttpResponse.getContent():java.io.InputStream");
    }

    public void download(OutputStream outputStream) throws IOException {
        InputStream inputStream = getContent();
        IOUtils.copy(inputStream, outputStream);
    }

    public void ignore() throws IOException {
        InputStream content = getContent();
        if (content != null) {
            content.close();
        }
    }

    public void disconnect() throws IOException {
        ignore();
        this.response.disconnect();
    }

    public <T> T parseAs(Class<T> cls) throws IOException {
        if (!hasMessageBody()) {
            return null;
        }
        return (T) this.request.getParser().parseAndClose(getContent(), getContentCharset(), (Class) cls);
    }

    private boolean hasMessageBody() throws IOException {
        int statusCode = getStatusCode();
        if (!getRequest().getRequestMethod().equals(HttpMethods.HEAD) && statusCode / 100 != 1 && statusCode != 204 && statusCode != 304) {
            return true;
        }
        ignore();
        return false;
    }

    public Object parseAs(Type dataType) throws IOException {
        if (!hasMessageBody()) {
            return null;
        }
        return this.request.getParser().parseAndClose(getContent(), getContentCharset(), dataType);
    }

    public String parseAsString() throws IOException {
        InputStream content = getContent();
        if (content == null) {
            return "";
        }
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        IOUtils.copy(content, out);
        return out.toString(getContentCharset().name());
    }

    public Charset getContentCharset() {
        if (this.mediaType == null || this.mediaType.getCharsetParameter() == null) {
            return Charsets.ISO_8859_1;
        }
        return this.mediaType.getCharsetParameter();
    }
}
