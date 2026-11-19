package com.google.android.material.sidesheet;

/* carregado de: classes16.dex */
final class SheetUtils {
    private SheetUtils() {
    }

    static boolean isSwipeMostlyHorizontal(float xVelocity, float yVelocity) {
        return Math.abs(xVelocity) > Math.abs(yVelocity);
    }
}
