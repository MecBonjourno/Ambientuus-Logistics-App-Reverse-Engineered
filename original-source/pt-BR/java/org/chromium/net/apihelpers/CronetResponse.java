package org.chromium.net.apihelpers;

import j$.util.Objects;
import org.chromium.net.UrlResponseInfo;

/* carregado de: classes17.dex */
public class CronetResponse<T> {
    private final T mResponseBody;
    private final UrlResponseInfo mUrlResponseInfo;

    CronetResponse(UrlResponseInfo urlResponseInfo, T responseBody) {
        this.mUrlResponseInfo = urlResponseInfo;
        this.mResponseBody = responseBody;
    }

    public UrlResponseInfo getUrlResponseInfo() {
        return this.mUrlResponseInfo;
    }

    public T getResponseBody() {
        return this.mResponseBody;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof CronetResponse)) {
            return false;
        }
        CronetResponse<?> that = (CronetResponse) o;
        return Objects.equals(this.mUrlResponseInfo, that.mUrlResponseInfo) && Objects.equals(this.mResponseBody, that.mResponseBody);
    }

    public int hashCode() {
        return Objects.hash(this.mUrlResponseInfo, this.mResponseBody);
    }
}
