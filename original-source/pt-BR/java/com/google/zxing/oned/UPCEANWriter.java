package com.google.zxing.oned;

/* carregado de: classes16.dex */
public abstract class UPCEANWriter extends OneDimensionalCodeWriter {
    @Override // com.google.zxing.oned.OneDimensionalCodeWriter
    public int getDefaultMargin() {
        return UPCEANReader.START_END_PATTERN.length;
    }
}
