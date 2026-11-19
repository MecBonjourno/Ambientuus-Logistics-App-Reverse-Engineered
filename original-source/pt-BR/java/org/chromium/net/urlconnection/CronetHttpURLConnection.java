package org.chromium.net.urlconnection;

import android.net.TrafficStats;
import android.os.Build;
import android.util.Log;
import android.util.Pair;
import com.google.api.client.http.HttpMethods;
import com.google.api.client.http.UrlEncodedParser;
import com.google.common.net.HttpHeaders;
import j$.util.DesugarCollections;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.nio.ByteBuffer;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.Executor;
import org.chromium.net.CronetEngine;
import org.chromium.net.CronetException;
import org.chromium.net.ExperimentalUrlRequest;
import org.chromium.net.UrlRequest;
import org.chromium.net.UrlResponseInfo;

/* carregado de: classes17.dex */
public class CronetHttpURLConnection extends HttpURLConnection {
    private static final String CONTENT_LENGTH = "Content-Length";
    private static final String TAG = CronetHttpURLConnection.class.getSimpleName();
    private final CronetEngine mCronetEngine;
    private IOException mException;
    private boolean mHasResponseHeadersOrCompleted;
    private CronetInputStream mInputStream;
    private final MessageLoop mMessageLoop;
    private boolean mOnRedirectCalled;
    private CronetOutputStream mOutputStream;
    private UrlRequest mRequest;
    private final List<Pair<String, String>> mRequestHeaders;
    private List<Map.Entry<String, String>> mResponseHeadersList;
    private Map<String, List<String>> mResponseHeadersMap;
    private UrlResponseInfo mResponseInfo;
    private int mTrafficStatsTag;
    private boolean mTrafficStatsTagSet;
    private int mTrafficStatsUid;
    private boolean mTrafficStatsUidSet;

    public CronetHttpURLConnection(URL url, CronetEngine cronetEngine) {
        super(url);
        this.mCronetEngine = cronetEngine;
        this.mMessageLoop = new MessageLoop();
        this.mInputStream = new CronetInputStream(this);
        this.mRequestHeaders = new ArrayList();
    }

    @Override // java.net.URLConnection
    public void connect() throws IOException {
        getOutputStream();
        startRequest();
    }

    @Override // java.net.HttpURLConnection
    public void disconnect() {
        if (this.connected) {
            this.mRequest.cancel();
        }
    }

    @Override // java.net.HttpURLConnection
    public String getResponseMessage() throws IOException {
        getResponse();
        return this.mResponseInfo.getHttpStatusText();
    }

    @Override // java.net.HttpURLConnection
    public int getResponseCode() throws IOException {
        getResponse();
        return this.mResponseInfo.getHttpStatusCode();
    }

    @Override // java.net.URLConnection
    public Map<String, List<String>> getHeaderFields() {
        try {
            getResponse();
            return getAllHeaders();
        } catch (IOException e) {
            return Collections.emptyMap();
        }
    }

    @Override // java.net.URLConnection
    public final String getHeaderField(String fieldName) {
        try {
            getResponse();
            Map<String, List<String>> map = getAllHeaders();
            if (!map.containsKey(fieldName)) {
                return null;
            }
            List<String> values = map.get(fieldName);
            return values.get(values.size() - 1);
        } catch (IOException e) {
            return null;
        }
    }

    @Override // java.net.HttpURLConnection, java.net.URLConnection
    public final String getHeaderFieldKey(int pos) {
        Map.Entry<String, String> header = getHeaderFieldEntry(pos);
        if (header == null) {
            return null;
        }
        return header.getKey();
    }

    @Override // java.net.HttpURLConnection, java.net.URLConnection
    public final String getHeaderField(int pos) {
        Map.Entry<String, String> header = getHeaderFieldEntry(pos);
        if (header == null) {
            return null;
        }
        return header.getValue();
    }

    @Override // java.net.URLConnection
    public InputStream getInputStream() throws IOException {
        getResponse();
        if (!this.instanceFollowRedirects && this.mOnRedirectCalled) {
            throw new IOException("Cannot read response body of a redirect.");
        }
        if (this.mResponseInfo.getHttpStatusCode() >= 400) {
            throw new FileNotFoundException(this.url.toString());
        }
        return this.mInputStream;
    }

    @Override // java.net.URLConnection
    public OutputStream getOutputStream() throws IOException {
        if (this.mOutputStream == null && this.doOutput) {
            if (this.connected) {
                throw new ProtocolException("Cannot write to OutputStream after receiving response.");
            }
            if (isChunkedUpload()) {
                this.mOutputStream = new CronetChunkedOutputStream(this, this.chunkLength, this.mMessageLoop);
                startRequest();
            } else {
                long fixedStreamingModeContentLength = getStreamingModeContentLength();
                if (fixedStreamingModeContentLength != -1) {
                    this.mOutputStream = new CronetFixedModeOutputStream(this, fixedStreamingModeContentLength, this.mMessageLoop);
                    startRequest();
                } else {
                    Log.d(TAG, "Outputstream is being buffered in memory.");
                    String length = getRequestProperty("Content-Length");
                    if (length == null) {
                        this.mOutputStream = new CronetBufferedOutputStream(this);
                    } else {
                        long lengthParsed = Long.parseLong(length);
                        this.mOutputStream = new CronetBufferedOutputStream(this, lengthParsed);
                    }
                }
            }
        }
        return this.mOutputStream;
    }

    private long getStreamingModeContentLength() {
        long contentLength = this.fixedContentLength;
        if (this.fixedContentLengthLong != -1) {
            long contentLength2 = this.fixedContentLengthLong;
            return contentLength2;
        }
        return contentLength;
    }

    private void startRequest() throws IOException {
        if (this.connected) {
            return;
        }
        ExperimentalUrlRequest.Builder requestBuilder = (ExperimentalUrlRequest.Builder) this.mCronetEngine.newUrlRequestBuilder(getURL().toString(), new CronetUrlRequestCallback(), this.mMessageLoop);
        if (this.doOutput) {
            if (this.method.equals(HttpMethods.GET)) {
                this.method = HttpMethods.POST;
            }
            if (this.mOutputStream != null) {
                requestBuilder.setUploadDataProvider(this.mOutputStream.getUploadDataProvider(), (Executor) this.mMessageLoop);
                if (getRequestProperty("Content-Length") == null && !isChunkedUpload()) {
                    addRequestProperty("Content-Length", Long.toString(this.mOutputStream.getUploadDataProvider().getLength()));
                }
                this.mOutputStream.setConnected();
            } else if (getRequestProperty("Content-Length") == null) {
                addRequestProperty("Content-Length", "0");
            }
            if (getRequestProperty(HttpHeaders.CONTENT_TYPE) == null) {
                addRequestProperty(HttpHeaders.CONTENT_TYPE, UrlEncodedParser.CONTENT_TYPE);
            }
        }
        for (Pair<String, String> requestHeader : this.mRequestHeaders) {
            requestBuilder.addHeader((String) requestHeader.first, (String) requestHeader.second);
        }
        if (!getUseCaches()) {
            requestBuilder.disableCache();
        }
        requestBuilder.setHttpMethod(this.method);
        if (checkTrafficStatsTag()) {
            requestBuilder.setTrafficStatsTag(this.mTrafficStatsTag);
        }
        if (checkTrafficStatsUid()) {
            requestBuilder.setTrafficStatsUid(this.mTrafficStatsUid);
        }
        this.mRequest = requestBuilder.build();
        this.mRequest.start();
        this.connected = true;
    }

    private boolean checkTrafficStatsTag() {
        if (this.mTrafficStatsTagSet) {
            return true;
        }
        int tag = TrafficStats.getThreadStatsTag();
        if (tag != -1) {
            this.mTrafficStatsTag = tag;
            this.mTrafficStatsTagSet = true;
        }
        return this.mTrafficStatsTagSet;
    }

    private boolean checkTrafficStatsUid() {
        if (this.mTrafficStatsUidSet) {
            return true;
        }
        if (Build.VERSION.SDK_INT < 28) {
            return false;
        }
        int uid = TrafficStats.getThreadStatsUid();
        if (uid != -1) {
            this.mTrafficStatsUid = uid;
            this.mTrafficStatsUidSet = true;
        }
        return this.mTrafficStatsUidSet;
    }

    @Override // java.net.HttpURLConnection
    public InputStream getErrorStream() {
        try {
            getResponse();
            if (this.mResponseInfo.getHttpStatusCode() < 400) {
                return null;
            }
            return this.mInputStream;
        } catch (IOException e) {
            return null;
        }
    }

    @Override // java.net.URLConnection
    public final void addRequestProperty(String key, String value) {
        setRequestPropertyInternal(key, value, false);
    }

    @Override // java.net.URLConnection
    public final void setRequestProperty(String key, String value) {
        setRequestPropertyInternal(key, value, true);
    }

    private final void setRequestPropertyInternal(String key, String value, boolean overwrite) {
        if (this.connected) {
            throw new IllegalStateException("Cannot modify request property after connection is made.");
        }
        int index = findRequestProperty(key);
        if (index >= 0) {
            if (overwrite) {
                this.mRequestHeaders.remove(index);
            } else {
                throw new UnsupportedOperationException("Cannot add multiple headers of the same key, " + key + ". crbug.com/432719.");
            }
        }
        this.mRequestHeaders.add(Pair.create(key, value));
    }

    @Override // java.net.URLConnection
    public Map<String, List<String>> getRequestProperties() {
        if (this.connected) {
            throw new IllegalStateException("Cannot access request headers after connection is set.");
        }
        Map<String, List<String>> map = new TreeMap<>((Comparator<? super String>) String.CASE_INSENSITIVE_ORDER);
        for (Pair<String, String> entry : this.mRequestHeaders) {
            if (map.containsKey(entry.first)) {
                throw new IllegalStateException("Should not have multiple values.");
            }
            List<String> values = new ArrayList<>();
            values.add((String) entry.second);
            map.put((String) entry.first, DesugarCollections.unmodifiableList(values));
        }
        return DesugarCollections.unmodifiableMap(map);
    }

    @Override // java.net.URLConnection
    public String getRequestProperty(String key) {
        int index = findRequestProperty(key);
        if (index >= 0) {
            return (String) this.mRequestHeaders.get(index).second;
        }
        return null;
    }

    @Override // java.net.HttpURLConnection
    public boolean usingProxy() {
        return false;
    }

    @Override // java.net.URLConnection
    public void setConnectTimeout(int timeout) {
        Log.d(TAG, "setConnectTimeout is not supported by CronetHttpURLConnection");
    }

    void getMoreData(ByteBuffer byteBuffer) throws IOException {
        this.mRequest.read(byteBuffer);
        this.mMessageLoop.loop(getReadTimeout());
    }

    public void setTrafficStatsTag(int tag) {
        if (this.connected) {
            throw new IllegalStateException("Cannot modify traffic stats tag after connection is made.");
        }
        this.mTrafficStatsTagSet = true;
        this.mTrafficStatsTag = tag;
    }

    public void setTrafficStatsUid(int uid) {
        if (this.connected) {
            throw new IllegalStateException("Cannot modify traffic stats UID after connection is made.");
        }
        this.mTrafficStatsUidSet = true;
        this.mTrafficStatsUid = uid;
    }

    private int findRequestProperty(String key) {
        for (int i = 0; i < this.mRequestHeaders.size(); i++) {
            Pair<String, String> entry = this.mRequestHeaders.get(i);
            if (((String) entry.first).equalsIgnoreCase(key)) {
                return i;
            }
        }
        return -1;
    }

    private class CronetUrlRequestCallback extends UrlRequest.Callback {
        public CronetUrlRequestCallback() {
        }

        @Override // org.chromium.net.UrlRequest.Callback
        public void onResponseStarted(UrlRequest request, UrlResponseInfo info) {
            CronetHttpURLConnection.this.mResponseInfo = info;
            CronetHttpURLConnection.this.mHasResponseHeadersOrCompleted = true;
            CronetHttpURLConnection.this.mMessageLoop.quit();
        }

        @Override // org.chromium.net.UrlRequest.Callback
        public void onReadCompleted(UrlRequest request, UrlResponseInfo info, ByteBuffer byteBuffer) {
            CronetHttpURLConnection.this.mResponseInfo = info;
            CronetHttpURLConnection.this.mMessageLoop.quit();
        }

        @Override // org.chromium.net.UrlRequest.Callback
        public void onRedirectReceived(UrlRequest request, UrlResponseInfo info, String newLocationUrl) {
            CronetHttpURLConnection.this.mOnRedirectCalled = true;
            try {
                URL newUrl = new URL(newLocationUrl);
                boolean sameProtocol = newUrl.getProtocol().equals(CronetHttpURLConnection.this.url.getProtocol());
                if (CronetHttpURLConnection.this.instanceFollowRedirects) {
                    CronetHttpURLConnection.this.url = newUrl;
                }
                if (CronetHttpURLConnection.this.instanceFollowRedirects && sameProtocol) {
                    CronetHttpURLConnection.this.mRequest.followRedirect();
                    return;
                }
            } catch (MalformedURLException e) {
            }
            CronetHttpURLConnection.this.mResponseInfo = info;
            CronetHttpURLConnection.this.mRequest.cancel();
            setResponseDataCompleted(null);
        }

        @Override // org.chromium.net.UrlRequest.Callback
        public void onSucceeded(UrlRequest request, UrlResponseInfo info) {
            CronetHttpURLConnection.this.mResponseInfo = info;
            setResponseDataCompleted(null);
        }

        @Override // org.chromium.net.UrlRequest.Callback
        public void onFailed(UrlRequest request, UrlResponseInfo info, CronetException exception) {
            if (exception == null) {
                throw new IllegalStateException("Exception cannot be null in onFailed.");
            }
            CronetHttpURLConnection.this.mResponseInfo = info;
            setResponseDataCompleted(exception);
        }

        @Override // org.chromium.net.UrlRequest.Callback
        public void onCanceled(UrlRequest request, UrlResponseInfo info) {
            CronetHttpURLConnection.this.mResponseInfo = info;
            setResponseDataCompleted(new IOException("disconnect() called"));
        }

        private void setResponseDataCompleted(IOException exception) {
            CronetHttpURLConnection.this.mException = exception;
            if (CronetHttpURLConnection.this.mInputStream != null) {
                CronetHttpURLConnection.this.mInputStream.setResponseDataCompleted(exception);
            }
            if (CronetHttpURLConnection.this.mOutputStream != null) {
                CronetHttpURLConnection.this.mOutputStream.setRequestCompleted(exception);
            }
            CronetHttpURLConnection.this.mHasResponseHeadersOrCompleted = true;
            CronetHttpURLConnection.this.mMessageLoop.quit();
        }
    }

    private void getResponse() throws IOException {
        if (this.mOutputStream != null) {
            this.mOutputStream.checkReceivedEnoughContent();
            if (isChunkedUpload()) {
                this.mOutputStream.close();
            }
        }
        if (!this.mHasResponseHeadersOrCompleted) {
            startRequest();
            this.mMessageLoop.loop();
        }
        checkHasResponseHeaders();
    }

    private void checkHasResponseHeaders() throws IOException {
        if (!this.mHasResponseHeadersOrCompleted) {
            throw new IllegalStateException("No response.");
        }
        if (this.mException != null) {
            throw this.mException;
        }
        if (this.mResponseInfo == null) {
            throw new NullPointerException("Response info is null when there is no exception.");
        }
    }

    private Map.Entry<String, String> getHeaderFieldEntry(int pos) {
        try {
            getResponse();
            List<Map.Entry<String, String>> headers = getAllHeadersAsList();
            if (pos >= headers.size()) {
                return null;
            }
            return headers.get(pos);
        } catch (IOException e) {
            return null;
        }
    }

    private boolean isChunkedUpload() {
        return this.chunkLength > 0;
    }

    private Map<String, List<String>> getAllHeaders() {
        if (this.mResponseHeadersMap != null) {
            return this.mResponseHeadersMap;
        }
        Map<String, List<String>> map = new TreeMap<>((Comparator<? super String>) String.CASE_INSENSITIVE_ORDER);
        for (Map.Entry<String, String> entry : getAllHeadersAsList()) {
            List<String> values = new ArrayList<>();
            if (map.containsKey(entry.getKey())) {
                values.addAll(map.get(entry.getKey()));
            }
            values.add(entry.getValue());
            map.put(entry.getKey(), DesugarCollections.unmodifiableList(values));
        }
        this.mResponseHeadersMap = DesugarCollections.unmodifiableMap(map);
        return this.mResponseHeadersMap;
    }

    private List<Map.Entry<String, String>> getAllHeadersAsList() {
        if (this.mResponseHeadersList != null) {
            return this.mResponseHeadersList;
        }
        this.mResponseHeadersList = new ArrayList();
        for (Map.Entry<String, String> entry : this.mResponseInfo.getAllHeadersAsList()) {
            if (!entry.getKey().equalsIgnoreCase(HttpHeaders.CONTENT_ENCODING)) {
                this.mResponseHeadersList.add(new AbstractMap.SimpleImmutableEntry(entry));
            }
        }
        this.mResponseHeadersList = DesugarCollections.unmodifiableList(this.mResponseHeadersList);
        return this.mResponseHeadersList;
    }
}
