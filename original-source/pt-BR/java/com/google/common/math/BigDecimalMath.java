package com.google.common.math;

import java.math.BigDecimal;
import java.math.RoundingMode;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
public class BigDecimalMath {
    private BigDecimalMath() {
    }

    public static double roundToDouble(BigDecimal x, RoundingMode mode) {
        return BigDecimalToDoubleRounder.INSTANCE.roundToDouble(x, mode);
    }

    private static class BigDecimalToDoubleRounder extends ToDoubleRounder<BigDecimal> {
        static final BigDecimalToDoubleRounder INSTANCE = new BigDecimalToDoubleRounder();

        private BigDecimalToDoubleRounder() {
        }

        /* JADX INFO: modificadores de acesso alterados de: package-private */
        @Override // com.google.common.math.ToDoubleRounder
        public double roundToDoubleArbitrarily(BigDecimal bigDecimal) {
            return bigDecimal.doubleValue();
        }

        /* JADX INFO: modificadores de acesso alterados de: package-private */
        @Override // com.google.common.math.ToDoubleRounder
        public int sign(BigDecimal bigDecimal) {
            return bigDecimal.signum();
        }

        /* JADX INFO: modificadores de acesso alterados de: package-private */
        @Override // com.google.common.math.ToDoubleRounder
        public BigDecimal toX(double d, RoundingMode mode) {
            return new BigDecimal(d);
        }

        /* JADX INFO: modificadores de acesso alterados de: package-private */
        @Override // com.google.common.math.ToDoubleRounder
        public BigDecimal minus(BigDecimal a, BigDecimal b) {
            return a.subtract(b);
        }
    }
}
