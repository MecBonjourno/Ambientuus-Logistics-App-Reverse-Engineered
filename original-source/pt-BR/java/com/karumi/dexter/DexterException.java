package com.karumi.dexter;

import com.karumi.dexter.listener.DexterError;

/* carregado de: classes16.dex */
final class DexterException extends IllegalStateException {
    final DexterError error;

    DexterException(String str, DexterError dexterError) {
        super(str);
        this.error = dexterError;
    }
}
