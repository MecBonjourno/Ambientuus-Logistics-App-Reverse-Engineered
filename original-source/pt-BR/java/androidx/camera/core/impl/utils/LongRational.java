package androidx.camera.core.impl.utils;

import androidx.credentials.exceptions.publickeycredential.DomExceptionUtils;

/* carregado de: classes.dex */
final class LongRational {
    private final long mDenominator;
    private final long mNumerator;

    LongRational(long nominator, long denominator) {
        this.mNumerator = nominator;
        this.mDenominator = denominator;
    }

    LongRational(double value) {
        this((long) (10000.0d * value), 10000L);
    }

    long getNumerator() {
        return this.mNumerator;
    }

    long getDenominator() {
        return this.mDenominator;
    }

    double toDouble() {
        return this.mNumerator / this.mDenominator;
    }

    public String toString() {
        return this.mNumerator + DomExceptionUtils.SEPARATOR + this.mDenominator;
    }
}
