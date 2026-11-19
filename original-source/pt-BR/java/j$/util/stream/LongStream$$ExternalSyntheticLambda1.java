package j$.util.stream;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes15.dex */
public final /* sintético */ class LongStream$$ExternalSyntheticLambda1 implements Runnable {
    public final /* sintético */ LongStream f$0;

    public /* sintético */ LongStream$$ExternalSyntheticLambda1(LongStream longStream) {
        this.f$0 = longStream;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f$0.close();
    }
}
