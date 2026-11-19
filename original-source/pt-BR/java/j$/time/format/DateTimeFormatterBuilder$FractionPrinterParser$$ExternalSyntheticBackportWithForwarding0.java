package j$.time.format;

import java.math.BigDecimal;
import java.math.BigInteger;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes15.dex */
public final /* sintético */ class DateTimeFormatterBuilder$FractionPrinterParser$$ExternalSyntheticBackportWithForwarding0 {
    public static /* sintético */ BigDecimal m(BigDecimal bigDecimal) {
        return bigDecimal.signum() == 0 ? new BigDecimal(BigInteger.ZERO, 0) : bigDecimal.stripTrailingZeros();
    }
}
