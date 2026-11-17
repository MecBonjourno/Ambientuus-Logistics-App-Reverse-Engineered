package j$.io;

import j$.util.Spliterators;
import j$.util.stream.Stream;
import j$.util.stream.StreamSupport;
import java.io.BufferedReader;
import java.util.Iterator;

/* loaded from: classes15.dex */
public final /* synthetic */ class DesugarBufferedReader {
    private DesugarBufferedReader() {
    }

    public static Stream lines(BufferedReader bufferedReader) {
        Iterator<String> iter = new DesugarBufferedReaderLinesIterator(bufferedReader);
        return StreamSupport.stream(Spliterators.spliteratorUnknownSize(iter, 272), false);
    }
}
