package kotlin.ranges;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes17.dex */
public final /* sintético */ class ClosedDoubleRange$$ExternalSyntheticBackport0 {
    public static /* sintético */ int m(double d) {
        long doubleToLongBits = Double.doubleToLongBits(d);
        return (int) (doubleToLongBits ^ (doubleToLongBits >>> 32));
    }
}
