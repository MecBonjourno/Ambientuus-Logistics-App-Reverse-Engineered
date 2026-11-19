package okhttp3.internal.cache2;

import java.io.IOException;
import java.nio.channels.FileChannel;
import okio.Buffer;

/* carregado de: classes17.dex */
final class FileOperator {
    private final FileChannel fileChannel;

    FileOperator(FileChannel fileChannel) {
        this.fileChannel = fileChannel;
    }

    public void write(long pos, Buffer source, long byteCount) throws IOException {
        if (byteCount < 0 || byteCount > source.size()) {
            throw new IndexOutOfBoundsException();
        }
        long pos2 = pos;
        long byteCount2 = byteCount;
        while (byteCount2 > 0) {
            long bytesWritten = this.fileChannel.transferFrom(source, pos2, byteCount2);
            pos2 += bytesWritten;
            byteCount2 -= bytesWritten;
        }
    }

    public void read(long pos, Buffer sink, long byteCount) throws IOException {
        if (byteCount < 0) {
            throw new IndexOutOfBoundsException();
        }
        long pos2 = pos;
        long byteCount2 = byteCount;
        while (byteCount2 > 0) {
            long bytesRead = this.fileChannel.transferTo(pos2, byteCount2, sink);
            pos2 += bytesRead;
            byteCount2 -= bytesRead;
        }
    }
}
