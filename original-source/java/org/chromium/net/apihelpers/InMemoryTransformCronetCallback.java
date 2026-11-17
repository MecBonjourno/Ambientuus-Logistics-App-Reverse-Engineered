package org.chromium.net.apihelpers;

import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.nio.channels.WritableByteChannel;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import org.chromium.net.CronetException;
import org.chromium.net.UrlResponseInfo;

/* loaded from: classes17.dex */
public abstract class InMemoryTransformCronetCallback<T> extends ImplicitFlowControlCallback {
    private static final String CONTENT_LENGTH_HEADER_NAME = "Content-Length";
    private static final int MAX_ARRAY_SIZE = 2147483639;
    private final Set<CronetRequestCompletionListener<? super T>> mListeners = new LinkedHashSet();
    private WritableByteChannel mResponseBodyChannel;
    private ByteArrayOutputStream mResponseBodyStream;

    protected abstract T transformBodyBytes(UrlResponseInfo urlResponseInfo, byte[] bArr);

    public ImplicitFlowControlCallback addCompletionListener(CronetRequestCompletionListener<? super T> listener) {
        this.mListeners.add(listener);
        return this;
    }

    @Override // org.chromium.net.apihelpers.ImplicitFlowControlCallback
    protected final void onResponseStarted(UrlResponseInfo info) {
        long bodyLength = getBodyLength(info);
        if (bodyLength > 2147483639) {
            throw new IllegalArgumentException("The body is too large and wouldn't fit in a byte array!");
        }
        if (bodyLength >= 0) {
            this.mResponseBodyStream = new ByteArrayOutputStream((int) bodyLength);
        } else {
            this.mResponseBodyStream = new ByteArrayOutputStream();
        }
        this.mResponseBodyChannel = Channels.newChannel(this.mResponseBodyStream);
    }

    @Override // org.chromium.net.apihelpers.ImplicitFlowControlCallback
    protected final void onBodyChunkRead(UrlResponseInfo info, ByteBuffer bodyChunk) throws Exception {
        this.mResponseBodyChannel.write(bodyChunk);
    }

    @Override // org.chromium.net.apihelpers.ImplicitFlowControlCallback
    protected final void onSucceeded(UrlResponseInfo info) {
        T body = transformBodyBytes(info, this.mResponseBodyStream.toByteArray());
        for (CronetRequestCompletionListener<? super T> callback : this.mListeners) {
            callback.onSucceeded(info, body);
        }
    }

    @Override // org.chromium.net.apihelpers.ImplicitFlowControlCallback
    protected final void onFailed(UrlResponseInfo info, CronetException exception) {
        for (CronetRequestCompletionListener<? super T> callback : this.mListeners) {
            callback.onFailed(info, exception);
        }
    }

    @Override // org.chromium.net.apihelpers.ImplicitFlowControlCallback
    protected final void onCanceled(UrlResponseInfo info) {
        for (CronetRequestCompletionListener<? super T> callback : this.mListeners) {
            callback.onCanceled(info);
        }
    }

    private static long getBodyLength(UrlResponseInfo info) {
        List<String> contentLengthHeader = info.getAllHeaders().get("Content-Length");
        if (contentLengthHeader == null || contentLengthHeader.size() != 1) {
            return -1L;
        }
        try {
            return Long.parseLong(contentLengthHeader.get(0));
        } catch (NumberFormatException e) {
            return -1L;
        }
    }
}
