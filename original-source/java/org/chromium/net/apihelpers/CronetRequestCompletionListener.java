package org.chromium.net.apihelpers;

import org.chromium.net.CronetException;
import org.chromium.net.UrlResponseInfo;

/* loaded from: classes17.dex */
public interface CronetRequestCompletionListener<T> {
    void onCanceled(UrlResponseInfo urlResponseInfo);

    void onFailed(UrlResponseInfo urlResponseInfo, CronetException cronetException);

    void onSucceeded(UrlResponseInfo urlResponseInfo, T t);
}
