package j$.util.stream;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes15.dex */
public final /* sintético */ class DoubleStream$$ExternalSyntheticLambda0 implements Runnable {
    public final /* sintético */ DoubleStream f$0;

    public /* sintético */ DoubleStream$$ExternalSyntheticLambda0(DoubleStream doubleStream) {
        this.f$0 = doubleStream;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f$0.close();
    }
}
