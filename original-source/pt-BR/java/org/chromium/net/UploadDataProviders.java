package org.chromium.net;

import android.os.ParcelFileDescriptor;
import java.io.File;
import java.nio.ByteBuffer;

@Deprecated
/* carregado de: classes17.dex */
public final class UploadDataProviders {
    public static UploadDataProvider create(File file) {
        return org.chromium.net.apihelpers.UploadDataProviders.create(file);
    }

    public static UploadDataProvider create(ParcelFileDescriptor fd) {
        return org.chromium.net.apihelpers.UploadDataProviders.create(fd);
    }

    public static UploadDataProvider create(ByteBuffer buffer) {
        return org.chromium.net.apihelpers.UploadDataProviders.create(buffer);
    }

    public static UploadDataProvider create(byte[] data, int offset, int length) {
        return org.chromium.net.apihelpers.UploadDataProviders.create(data, offset, length);
    }

    public static UploadDataProvider create(byte[] data) {
        return org.chromium.net.apihelpers.UploadDataProviders.create(data);
    }

    private UploadDataProviders() {
    }
}
