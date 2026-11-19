package org.chromium.net.apihelpers;

import org.chromium.net.UrlResponseInfo;

/* carregado de: classes17.dex */
public class RedirectHandlers {
    static /* sintético */ boolean lambda$neverFollow$0(UrlResponseInfo info, String newLocationUrl) throws Exception {
        return false;
    }

    public static RedirectHandler neverFollow() {
        return new RedirectHandler() { // da classe: org.chromium.net.apihelpers.RedirectHandlers$$ExternalSyntheticLambda0
            @Override // org.chromium.net.apihelpers.RedirectHandler
            public final boolean shouldFollowRedirect(UrlResponseInfo urlResponseInfo, String str) {
                return RedirectHandlers.lambda$neverFollow$0(urlResponseInfo, str);
            }
        };
    }

    public static RedirectHandler alwaysFollow() {
        return new RedirectHandler() { // da classe: org.chromium.net.apihelpers.RedirectHandlers$$ExternalSyntheticLambda1
            @Override // org.chromium.net.apihelpers.RedirectHandler
            public final boolean shouldFollowRedirect(UrlResponseInfo urlResponseInfo, String str) {
                return RedirectHandlers.lambda$alwaysFollow$1(urlResponseInfo, str);
            }
        };
    }

    static /* sintético */ boolean lambda$alwaysFollow$1(UrlResponseInfo info, String newLocationUrl) throws Exception {
        return true;
    }

    private RedirectHandlers() {
    }
}
