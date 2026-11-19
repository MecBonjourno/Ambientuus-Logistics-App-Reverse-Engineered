package com.google.api.client.http.javanet;

import com.google.api.client.http.HttpMethods;
import com.google.api.client.http.LowLevelHttpRequest;
import com.google.api.client.http.LowLevelHttpResponse;
import com.google.api.client.util.Preconditions;
import com.google.common.net.HttpHeaders;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;

/* carregado de: classes16.dex */
final class NetHttpRequest extends LowLevelHttpRequest {
    private final HttpURLConnection connection;

    NetHttpRequest(HttpURLConnection connection) {
        this.connection = connection;
        connection.setInstanceFollowRedirects(false);
    }

    @Override // com.google.api.client.http.LowLevelHttpRequest
    public void addHeader(String name, String value) {
        this.connection.addRequestProperty(name, value);
    }

    @Override // com.google.api.client.http.LowLevelHttpRequest
    public void setTimeout(int connectTimeout, int readTimeout) {
        this.connection.setReadTimeout(readTimeout);
        this.connection.setConnectTimeout(connectTimeout);
    }

    @Override // com.google.api.client.http.LowLevelHttpRequest
    public LowLevelHttpResponse execute() throws IOException {
        HttpURLConnection connection = this.connection;
        if (getStreamingContent() != null) {
            String contentType = getContentType();
            if (contentType != null) {
                addHeader(HttpHeaders.CONTENT_TYPE, contentType);
            }
            String contentEncoding = getContentEncoding();
            if (contentEncoding != null) {
                addHeader(HttpHeaders.CONTENT_ENCODING, contentEncoding);
            }
            long contentLength = getContentLength();
            if (contentLength >= 0) {
                connection.setRequestProperty(HttpHeaders.CONTENT_LENGTH, Long.toString(contentLength));
            }
            String requestMethod = connection.getRequestMethod();
            if (HttpMethods.POST.equals(requestMethod) || HttpMethods.PUT.equals(requestMethod)) {
                connection.setDoOutput(true);
                if (contentLength >= 0 && contentLength <= 2147483647L) {
                    connection.setFixedLengthStreamingMode((int) contentLength);
                } else {
                    connection.setChunkedStreamingMode(0);
                }
                OutputStream out = connection.getOutputStream();
                try {
                    getStreamingContent().writeTo(out);
                    try {
                        out.close();
                    } catch (IOException exception) {
                        if (0 == 0) {
                            throw exception;
                        }
                    }
                } catch (Throwable exception2) {
                    try {
                        out.close();
                    } catch (IOException exception3) {
                        if (1 == 0) {
                            throw exception3;
                        }
                    }
                    throw exception2;
                }
            } else {
                Preconditions.checkArgument(contentLength == 0, "%s with non-zero content length is not supported", requestMethod);
            }
        }
        boolean successfulConnection = null;
        try {
            connection.connect();
            NetHttpResponse response = new NetHttpResponse(connection);
            successfulConnection = true;
            return response;
        } finally {
            if (successfulConnection == null) {
                connection.disconnect();
            }
        }
    }
}
