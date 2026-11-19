package okhttp3.internal.cache2;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import okhttp3.internal.Util;
import okio.Buffer;
import okio.ByteString;
import okio.Source;
import okio.Timeout;

/* carregado de: classes17.dex */
final class Relay {
    private static final long FILE_HEADER_SIZE = 32;
    static final ByteString PREFIX_CLEAN = ByteString.encodeUtf8("OkHttp cache v1\n");
    static final ByteString PREFIX_DIRTY = ByteString.encodeUtf8("OkHttp DIRTY :(\n");
    private static final int SOURCE_FILE = 2;
    private static final int SOURCE_UPSTREAM = 1;
    final long bufferMaxSize;
    boolean complete;
    RandomAccessFile file;
    private final ByteString metadata;
    int sourceCount;
    Source upstream;
    long upstreamPos;
    Thread upstreamReader;
    final Buffer upstreamBuffer = new Buffer();
    final Buffer buffer = new Buffer();

    private Relay(RandomAccessFile file, Source upstream, long upstreamPos, ByteString metadata, long bufferMaxSize) {
        this.file = file;
        this.upstream = upstream;
        this.complete = upstream == null;
        this.upstreamPos = upstreamPos;
        this.metadata = metadata;
        this.bufferMaxSize = bufferMaxSize;
    }

    public static Relay edit(File file, Source upstream, ByteString metadata, long bufferMaxSize) throws IOException {
        RandomAccessFile randomAccessFile = new RandomAccessFile(file, "rw");
        Relay result = new Relay(randomAccessFile, upstream, 0L, metadata, bufferMaxSize);
        randomAccessFile.setLength(0L);
        result.writeHeader(PREFIX_DIRTY, -1L, -1L);
        return result;
    }

    public static Relay read(File file) throws IOException {
        RandomAccessFile randomAccessFile = new RandomAccessFile(file, "rw");
        FileOperator fileOperator = new FileOperator(randomAccessFile.getChannel());
        Buffer header = new Buffer();
        fileOperator.read(0L, header, 32L);
        ByteString prefix = header.readByteString(PREFIX_CLEAN.size());
        if (!prefix.equals(PREFIX_CLEAN)) {
            throw new IOException("unreadable cache file");
        }
        long upstreamSize = header.readLong();
        long metadataSize = header.readLong();
        Buffer metadataBuffer = new Buffer();
        fileOperator.read(32 + upstreamSize, metadataBuffer, metadataSize);
        ByteString metadata = metadataBuffer.readByteString();
        return new Relay(randomAccessFile, null, upstreamSize, metadata, 0L);
    }

    private void writeHeader(ByteString prefix, long upstreamSize, long metadataSize) throws IOException {
        Buffer header = new Buffer();
        header.write(prefix);
        header.writeLong(upstreamSize);
        header.writeLong(metadataSize);
        if (header.size() != 32) {
            throw new IllegalArgumentException();
        }
        FileOperator fileOperator = new FileOperator(this.file.getChannel());
        fileOperator.write(0L, header, 32L);
    }

    private void writeMetadata(long upstreamSize) throws IOException {
        Buffer metadataBuffer = new Buffer();
        metadataBuffer.write(this.metadata);
        FileOperator fileOperator = new FileOperator(this.file.getChannel());
        fileOperator.write(32 + upstreamSize, metadataBuffer, this.metadata.size());
    }

    void commit(long upstreamSize) throws IOException {
        writeMetadata(upstreamSize);
        this.file.getChannel().force(false);
        writeHeader(PREFIX_CLEAN, upstreamSize, this.metadata.size());
        this.file.getChannel().force(false);
        synchronized (this) {
            this.complete = true;
        }
        Util.closeQuietly(this.upstream);
        this.upstream = null;
    }

    boolean isClosed() {
        return this.file == null;
    }

    public ByteString metadata() {
        return this.metadata;
    }

    public Source newSource() {
        synchronized (this) {
            if (this.file == null) {
                return null;
            }
            this.sourceCount++;
            return new RelaySource();
        }
    }

    class RelaySource implements Source {
        private FileOperator fileOperator;
        private long sourcePos;
        private final Timeout timeout = new Timeout();

        RelaySource() {
            this.fileOperator = new FileOperator(Relay.this.file.getChannel());
        }

        /* JADX WARN: Code restructure failed: missing block: B:18:0x0050, code lost:
        
            if (r7 != 2) goto L27;
         */
        /* JADX WARN: Code restructure failed: missing block: B:19:0x0052, code lost:
        
            r17 = java.lang.Math.min(r27, r7 - r25.sourcePos);
            r25.fileOperator.read(r25.sourcePos + 32, r26, r17);
            r25.sourcePos += r17;
         */
        /* JADX WARN: Code restructure failed: missing block: B:20:0x006b, code lost:
        
            return r17;
         */
        /* JADX WARN: Code restructure failed: missing block: B:24:0x006d, code lost:
        
            r0 = r25.this$0.upstream;
            r8 = r25.this$0.upstreamBuffer;
            r13 = r0.read(r8, r25.this$0.bufferMaxSize);
         */
        /* JADX WARN: Code restructure failed: missing block: B:25:0x007f, code lost:
        
            if (r13 != (-1)) goto L39;
         */
        /* JADX WARN: Code restructure failed: missing block: B:26:0x0081, code lost:
        
            r25.this$0.commit(r7);
         */
        /* JADX WARN: Code restructure failed: missing block: B:27:0x0087, code lost:
        
            r8 = r25.this$0;
         */
        /* JADX WARN: Code restructure failed: missing block: B:28:0x0089, code lost:
        
            monitor-enter(r8);
         */
        /* JADX WARN: Code restructure failed: missing block: B:30:0x008a, code lost:
        
            r25.this$0.upstreamReader = null;
            r25.this$0.notifyAll();
         */
        /* JADX WARN: Code restructure failed: missing block: B:31:0x0093, code lost:
        
            monitor-exit(r8);
         */
        /* JADX WARN: Code restructure failed: missing block: B:32:0x0094, code lost:
        
            return -1;
         */
        /* JADX WARN: Code restructure failed: missing block: B:37:0x0098, code lost:
        
            r23 = java.lang.Math.min(r13, r27);
            r25.this$0.upstreamBuffer.copyTo(r26, 0, r23);
            r25.sourcePos += r23;
            r25.fileOperator.write(r7 + 32, r25.this$0.upstreamBuffer.clone(), r13);
            r5 = r25.this$0;
         */
        /* JADX WARN: Code restructure failed: missing block: B:39:0x00c2, code lost:
        
            monitor-enter(r5);
         */
        /* JADX WARN: Code restructure failed: missing block: B:41:0x00c3, code lost:
        
            r25.this$0.buffer.write(r25.this$0.upstreamBuffer, r13);
         */
        /* JADX WARN: Code restructure failed: missing block: B:44:0x00dd, code lost:
        
            if (r25.this$0.buffer.size() <= r25.this$0.bufferMaxSize) goto L46;
         */
        /* JADX WARN: Code restructure failed: missing block: B:45:0x00df, code lost:
        
            r25.this$0.buffer.skip(r25.this$0.buffer.size() - r25.this$0.bufferMaxSize);
         */
        /* JADX WARN: Code restructure failed: missing block: B:46:0x00f3, code lost:
        
            r25.this$0.upstreamPos += r13;
         */
        /* JADX WARN: Code restructure failed: missing block: B:47:0x00fa, code lost:
        
            monitor-exit(r5);
         */
        /* JADX WARN: Code restructure failed: missing block: B:48:0x00fc, code lost:
        
            r4 = r25.this$0;
         */
        /* JADX WARN: Code restructure failed: missing block: B:49:0x00fe, code lost:
        
            monitor-enter(r4);
         */
        /* JADX WARN: Code restructure failed: missing block: B:51:0x00ff, code lost:
        
            r25.this$0.upstreamReader = null;
            r25.this$0.notifyAll();
         */
        /* JADX WARN: Code restructure failed: missing block: B:52:0x0109, code lost:
        
            monitor-exit(r4);
         */
        /* JADX WARN: Code restructure failed: missing block: B:53:0x010a, code lost:
        
            return r23;
         */
        /* JADX WARN: Code restructure failed: missing block: B:59:0x010e, code lost:
        
            r0 = th;
         */
        /* JADX WARN: Code restructure failed: missing block: B:60:0x010f, code lost:
        
            r8 = r5;
         */
        /* JADX WARN: Code restructure failed: missing block: B:61:0x0110, code lost:
        
            monitor-exit(r8);
         */
        /* JADX WARN: Code restructure failed: missing block: B:62:0x0111, code lost:
        
            throw r0;
         */
        /* JADX WARN: Code restructure failed: missing block: B:63:0x0112, code lost:
        
            r0 = th;
         */
        /* JADX WARN: Code restructure failed: missing block: B:64:0x0114, code lost:
        
            r0 = move-exception;
         */
        /* JADX WARN: Code restructure failed: missing block: B:66:0x0117, code lost:
        
            monitor-enter(r25.this$0);
         */
        /* JADX WARN: Code restructure failed: missing block: B:68:0x0118, code lost:
        
            r25.this$0.upstreamReader = null;
            r25.this$0.notifyAll();
         */
        /* JADX WARN: Code restructure failed: missing block: B:70:0x0123, code lost:
        
            throw r0;
         */
        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        /* JADX WARN: falha na inferência de tipo para: r5v10, types: [okhttp3.internal.cache2.Relay] */
        @Override // okio.Source
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public long read(okio.Buffer r26, long r27) throws java.io.IOException {
            /*
                Method dump skipped, instructions count: 337
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: okhttp3.internal.cache2.Relay.RelaySource.read(okio.Buffer, long):long");
        }

        @Override // okio.Source
        public Timeout timeout() {
            return this.timeout;
        }

        @Override // okio.Source, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            if (this.fileOperator == null) {
                return;
            }
            this.fileOperator = null;
            RandomAccessFile fileToClose = null;
            synchronized (Relay.this) {
                Relay relay = Relay.this;
                relay.sourceCount--;
                if (Relay.this.sourceCount == 0) {
                    fileToClose = Relay.this.file;
                    Relay.this.file = null;
                }
            }
            if (fileToClose != null) {
                Util.closeQuietly(fileToClose);
            }
        }
    }
}
