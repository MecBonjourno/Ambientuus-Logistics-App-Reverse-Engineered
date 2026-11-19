package org.chromium.net.apihelpers;

import org.chromium.net.UrlResponseInfo;

/* carregado de: classes17.dex */
public abstract class ByteArrayCronetCallback extends InMemoryTransformCronetCallback<byte[]> {
    /* JADX WARN: não é possível renomear o método para resolver a colisão */
    @Override // org.chromium.net.apihelpers.InMemoryTransformCronetCallback
    public ByteArrayCronetCallback addCompletionListener(CronetRequestCompletionListener<? super byte[]> listener) {
        super.addCompletionListener((CronetRequestCompletionListener) listener);
        return this;
    }

    /* JADX INFO: modificadores de acesso alterados de: protected */
    @Override // org.chromium.net.apihelpers.InMemoryTransformCronetCallback
    public final byte[] transformBodyBytes(UrlResponseInfo info, byte[] bodyBytes) {
        return bodyBytes;
    }
}
