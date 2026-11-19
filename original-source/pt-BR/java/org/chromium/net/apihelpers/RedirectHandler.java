package org.chromium.net.apihelpers;

import org.chromium.net.UrlResponseInfo;

/* carregado de: classes17.dex */
public interface RedirectHandler {
    boolean shouldFollowRedirect(UrlResponseInfo urlResponseInfo, String str) throws Exception;
}
