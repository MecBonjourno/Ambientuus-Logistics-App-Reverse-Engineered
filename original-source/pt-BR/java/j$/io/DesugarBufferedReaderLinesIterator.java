package j$.io;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.UncheckedIOException;
import java.util.Iterator;
import java.util.NoSuchElementException;

/* carregado de: classes15.dex */
class DesugarBufferedReaderLinesIterator implements Iterator<String> {
    private final BufferedReader bufferedReader;
    String nextLine = null;

    DesugarBufferedReaderLinesIterator(BufferedReader bufferedReader) {
        this.bufferedReader = bufferedReader;
    }

    @Override // java.util.Iterator
    public boolean hasNext() {
        if (this.nextLine != null) {
            return true;
        }
        try {
            this.nextLine = this.bufferedReader.readLine();
            return this.nextLine != null;
        } catch (IOException e) {
            throw new UncheckedIOException(e);
        }
    }

    @Override // java.util.Iterator
    public String next() {
        if (this.nextLine != null || hasNext()) {
            String line = this.nextLine;
            this.nextLine = null;
            return line;
        }
        throw new NoSuchElementException();
    }
}
