package org.chromium.net.apihelpers;

import org.chromium.net.CronetException;
import org.chromium.net.UrlResponseInfo;

/* carregado de: classes17.dex */
public interface CronetRequestCompletionListener<T> {
    void onCanceled(UrlResponseInfo urlResponseInfo);

    void onFailed(UrlResponseInfo urlResponseInfo, CronetException cronetException);

    void onSucceeded(UrlResponseInfo urlResponseInfo, T t);
}
