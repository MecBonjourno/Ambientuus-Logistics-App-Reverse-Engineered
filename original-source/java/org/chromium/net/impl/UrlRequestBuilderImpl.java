package org.chromium.net.impl;

import android.util.Log;
import android.util.Pair;
import com.google.api.client.http.HttpMethods;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.concurrent.Executor;
import org.chromium.net.ExperimentalUrlRequest;
import org.chromium.net.RequestFinishedInfo;
import org.chromium.net.UploadDataProvider;
import org.chromium.net.UrlRequest;

/* loaded from: classes17.dex */
public class UrlRequestBuilderImpl extends ExperimentalUrlRequest.Builder {
    private static final String ACCEPT_ENCODING = "Accept-Encoding";
    private static final String TAG = UrlRequestBuilderImpl.class.getSimpleName();
    private boolean mAllowDirectExecutor;
    private final UrlRequest.Callback mCallback;
    private final CronetEngineBase mCronetEngine;
    private boolean mDisableCache;
    private boolean mDisableConnectionMigration;
    private final Executor mExecutor;
    private String mMethod;
    private Collection<Object> mRequestAnnotations;
    private RequestFinishedInfo.Listener mRequestFinishedListener;
    private int mTrafficStatsTag;
    private boolean mTrafficStatsTagSet;
    private int mTrafficStatsUid;
    private boolean mTrafficStatsUidSet;
    private UploadDataProvider mUploadDataProvider;
    private Executor mUploadDataProviderExecutor;
    private final String mUrl;
    private final ArrayList<Pair<String, String>> mRequestHeaders = new ArrayList<>();
    private int mPriority = 3;
    private long mNetworkHandle = -1;
    private int mIdempotency = 0;

    UrlRequestBuilderImpl(String url, UrlRequest.Callback callback, Executor executor, CronetEngineBase cronetEngine) {
        if (url == null) {
            throw new NullPointerException("URL is required.");
        }
        if (callback == null) {
            throw new NullPointerException("Callback is required.");
        }
        if (executor == null) {
            throw new NullPointerException("Executor is required.");
        }
        if (cronetEngine == null) {
            throw new NullPointerException("CronetEngine is required.");
        }
        this.mUrl = url;
        this.mCallback = callback;
        this.mExecutor = executor;
        this.mCronetEngine = cronetEngine;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public ExperimentalUrlRequest.Builder setHttpMethod(String method) {
        if (method == null) {
            throw new NullPointerException("Method is required.");
        }
        this.mMethod = method;
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public UrlRequestBuilderImpl addHeader(String header, String value) {
        if (header == null) {
            throw new NullPointerException("Invalid header name.");
        }
        if (value == null) {
            throw new NullPointerException("Invalid header value.");
        }
        if ("Accept-Encoding".equalsIgnoreCase(header)) {
            Log.w(TAG, "It's not necessary to set Accept-Encoding on requests - cronet will do this automatically for you, and setting it yourself has no effect. See https://crbug.com/581399 for details.", new Exception());
            return this;
        }
        this.mRequestHeaders.add(Pair.create(header, value));
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public UrlRequestBuilderImpl disableCache() {
        this.mDisableCache = true;
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder
    public UrlRequestBuilderImpl disableConnectionMigration() {
        this.mDisableConnectionMigration = true;
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public UrlRequestBuilderImpl setPriority(int priority) {
        this.mPriority = priority;
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder
    public UrlRequestBuilderImpl setIdempotency(int idempotency) {
        this.mIdempotency = idempotency;
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public UrlRequestBuilderImpl setUploadDataProvider(UploadDataProvider uploadDataProvider, Executor executor) {
        if (uploadDataProvider == null) {
            throw new NullPointerException("Invalid UploadDataProvider.");
        }
        if (executor == null) {
            throw new NullPointerException("Invalid UploadDataProvider Executor.");
        }
        if (this.mMethod == null) {
            this.mMethod = HttpMethods.POST;
        }
        this.mUploadDataProvider = uploadDataProvider;
        this.mUploadDataProviderExecutor = executor;
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public UrlRequestBuilderImpl allowDirectExecutor() {
        this.mAllowDirectExecutor = true;
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public UrlRequestBuilderImpl addRequestAnnotation(Object annotation) {
        if (annotation == null) {
            throw new NullPointerException("Invalid metrics annotation.");
        }
        if (this.mRequestAnnotations == null) {
            this.mRequestAnnotations = new ArrayList();
        }
        this.mRequestAnnotations.add(annotation);
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public UrlRequestBuilderImpl setTrafficStatsTag(int tag) {
        this.mTrafficStatsTagSet = true;
        this.mTrafficStatsTag = tag;
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public UrlRequestBuilderImpl setTrafficStatsUid(int uid) {
        this.mTrafficStatsUidSet = true;
        this.mTrafficStatsUid = uid;
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public UrlRequestBuilderImpl setRequestFinishedListener(RequestFinishedInfo.Listener listener) {
        this.mRequestFinishedListener = listener;
        return this;
    }

    @Override // org.chromium.net.UrlRequest.Builder
    public UrlRequestBuilderImpl bindToNetwork(long networkHandle) {
        this.mNetworkHandle = networkHandle;
        return this;
    }

    @Override // org.chromium.net.ExperimentalUrlRequest.Builder, org.chromium.net.UrlRequest.Builder
    public UrlRequestBase build() {
        UrlRequestBase request = this.mCronetEngine.createRequest(this.mUrl, this.mCallback, this.mExecutor, this.mPriority, this.mRequestAnnotations, this.mDisableCache, this.mDisableConnectionMigration, this.mAllowDirectExecutor, this.mTrafficStatsTagSet, this.mTrafficStatsTag, this.mTrafficStatsUidSet, this.mTrafficStatsUid, this.mRequestFinishedListener, this.mIdempotency, this.mNetworkHandle);
        if (this.mMethod != null) {
            request.setHttpMethod(this.mMethod);
        }
        Iterator<Pair<String, String>> it = this.mRequestHeaders.iterator();
        while (it.hasNext()) {
            Pair<String, String> header = it.next();
            request.addHeader((String) header.first, (String) header.second);
        }
        if (this.mUploadDataProvider != null) {
            request.setUploadDataProvider(this.mUploadDataProvider, this.mUploadDataProviderExecutor);
        }
        return request;
    }
}
