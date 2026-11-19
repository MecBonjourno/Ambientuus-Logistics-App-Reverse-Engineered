package j$.util;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes15.dex */
public final /* sintético */ class OptionalDouble$$ExternalSyntheticBackport0 {
    public static /* sintético */ int m(double d) {
        long doubleToLongBits = Double.doubleToLongBits(d);
        return (int) (doubleToLongBits ^ (doubleToLongBits >>> 32));
    }
}
