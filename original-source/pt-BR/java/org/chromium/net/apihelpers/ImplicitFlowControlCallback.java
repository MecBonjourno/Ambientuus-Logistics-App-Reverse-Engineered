package org.chromium.net.apihelpers;

import java.nio.ByteBuffer;
import org.chromium.net.CronetException;
import org.chromium.net.UrlRequest;
import org.chromium.net.UrlResponseInfo;

/* carregado de: classes17.dex */
public abstract class ImplicitFlowControlCallback extends UrlRequest.Callback {
    private static final int BYTE_BUFFER_CAPACITY = 32768;

    protected abstract void onBodyChunkRead(UrlResponseInfo urlResponseInfo, ByteBuffer byteBuffer) throws Exception;

    protected abstract void onCanceled(UrlResponseInfo urlResponseInfo);

    protected abstract void onFailed(UrlResponseInfo urlResponseInfo, CronetException cronetException);

    protected abstract void onResponseStarted(UrlResponseInfo urlResponseInfo) throws Exception;

    protected abstract void onSucceeded(UrlResponseInfo urlResponseInfo);

    protected abstract boolean shouldFollowRedirect(UrlResponseInfo urlResponseInfo, String str) throws Exception;

    @Override // org.chromium.net.UrlRequest.Callback
    public final void onResponseStarted(UrlRequest request, UrlResponseInfo info) throws Exception {
        onResponseStarted(info);
        request.read(ByteBuffer.allocateDirect(32768));
    }

    @Override // org.chromium.net.UrlRequest.Callback
    public final void onRedirectReceived(UrlRequest request, UrlResponseInfo info, String newLocationUrl) throws Exception {
        if (shouldFollowRedirect(info, newLocationUrl)) {
            request.followRedirect();
        } else {
            request.cancel();
        }
    }

    @Override // org.chromium.net.UrlRequest.Callback
    public final void onReadCompleted(UrlRequest request, UrlResponseInfo info, ByteBuffer byteBuffer) throws Exception {
        onBodyChunkRead(info, byteBuffer);
        request.read(byteBuffer);
    }

    @Override // org.chromium.net.UrlRequest.Callback
    public final void onSucceeded(UrlRequest request, UrlResponseInfo info) {
        onSucceeded(info);
    }

    @Override // org.chromium.net.UrlRequest.Callback
    public final void onFailed(UrlRequest request, UrlResponseInfo info, CronetException error) {
        onFailed(info, error);
    }

    @Override // org.chromium.net.UrlRequest.Callback
    public final void onCanceled(UrlRequest request, UrlResponseInfo info) {
        onCanceled(info);
    }
}
