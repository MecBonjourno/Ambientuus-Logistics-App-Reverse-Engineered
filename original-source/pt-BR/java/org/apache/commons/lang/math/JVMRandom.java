package org.apache.commons.lang.math;

import java.util.Random;

/* carregado de: classes17.dex */
public final class JVMRandom extends Random {
    private static final long serialVersionUID = 1;
    private boolean constructed;

    public JVMRandom() {
        this.constructed = false;
        this.constructed = true;
    }

    @Override // java.util.Random
    public synchronized void setSeed(long seed) {
        if (this.constructed) {
            throw new UnsupportedOperationException();
        }
    }

    @Override // java.util.Random
    public synchronized double nextGaussian() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Random
    public void nextBytes(byte[] byteArray) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Random
    public int nextInt() {
        return nextInt(Integer.MAX_VALUE);
    }

    @Override // java.util.Random
    public int nextInt(int n) {
        if (n <= 0) {
            throw new IllegalArgumentException("Upper bound for nextInt must be positive");
        }
        return (int) (Math.random() * n);
    }

    @Override // java.util.Random
    public long nextLong() {
        return nextLong(Long.MAX_VALUE);
    }

    public static long nextLong(long n) {
        if (n <= 0) {
            throw new IllegalArgumentException("Upper bound for nextInt must be positive");
        }
        return (long) (Math.random() * n);
    }

    @Override // java.util.Random
    public boolean nextBoolean() {
        return Math.random() > 0.5d;
    }

    @Override // java.util.Random
    public float nextFloat() {
        return (float) Math.random();
    }

    @Override // java.util.Random
    public double nextDouble() {
        return Math.random();
    }
}
