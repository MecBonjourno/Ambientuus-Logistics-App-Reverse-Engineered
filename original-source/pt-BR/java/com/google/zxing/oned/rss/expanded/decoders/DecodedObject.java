package com.google.zxing.oned.rss.expanded.decoders;

/* carregado de: classes16.dex */
abstract class DecodedObject {
    private final int newPosition;

    DecodedObject(int newPosition) {
        this.newPosition = newPosition;
    }

    final int getNewPosition() {
        return this.newPosition;
    }
}
