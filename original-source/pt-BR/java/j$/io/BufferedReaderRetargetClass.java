package j$.io;

import j$.util.stream.Stream;
import java.io.BufferedReader;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes15.dex */
public final /* sintético */ class BufferedReaderRetargetClass {
    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    public static /* sintético */ Stream lines(BufferedReader bufferedReader) {
        return bufferedReader instanceof BufferedReaderRetargetInterface ? ((BufferedReaderRetargetInterface) bufferedReader).lines() : DesugarBufferedReader.lines(bufferedReader);
    }
}
