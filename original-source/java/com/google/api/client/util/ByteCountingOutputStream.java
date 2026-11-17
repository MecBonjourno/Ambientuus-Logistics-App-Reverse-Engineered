package com.google.api.client.util;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: classes16.dex */
final class ByteCountingOutputStream extends OutputStream {
    long count;

    ByteCountingOutputStream() {
    }

    @Override // java.io.OutputStream
    public void write(byte[] b, int off, int len) throws IOException {
        this.count += len;
    }

    @Override // java.io.OutputStream
    public void write(int b) throws IOException {
        this.count++;
    }
}
