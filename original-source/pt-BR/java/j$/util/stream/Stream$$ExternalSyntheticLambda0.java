package j$.util.stream;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes15.dex */
public final /* sintético */ class Stream$$ExternalSyntheticLambda0 implements Runnable {
    public final /* sintético */ Stream f$0;

    public /* sintético */ Stream$$ExternalSyntheticLambda0(Stream stream) {
        this.f$0 = stream;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f$0.close();
    }
}
