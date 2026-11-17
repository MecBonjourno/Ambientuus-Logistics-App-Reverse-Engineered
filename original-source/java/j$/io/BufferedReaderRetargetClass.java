package j$.io;

import j$.util.stream.Stream;
import java.io.BufferedReader;

/* compiled from: D8$$SyntheticClass */
/* loaded from: classes15.dex */
public final /* synthetic */ class BufferedReaderRetargetClass {
    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ Stream lines(BufferedReader bufferedReader) {
        return bufferedReader instanceof BufferedReaderRetargetInterface ? ((BufferedReaderRetargetInterface) bufferedReader).lines() : DesugarBufferedReader.lines(bufferedReader);
    }
}
