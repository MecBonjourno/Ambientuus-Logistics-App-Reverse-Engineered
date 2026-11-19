package com.google.zxing.oned.rss;

/* carregado de: classes16.dex */
final class Pair extends DataCharacter {
    private int count;
    private final FinderPattern finderPattern;

    Pair(int value, int checksumPortion, FinderPattern finderPattern) {
        super(value, checksumPortion);
        this.finderPattern = finderPattern;
    }

    FinderPattern getFinderPattern() {
        return this.finderPattern;
    }

    int getCount() {
        return this.count;
    }

    void incrementCount() {
        this.count++;
    }
}
