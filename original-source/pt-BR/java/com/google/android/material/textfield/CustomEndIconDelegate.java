package com.google.android.material.textfield;

/* carregado de: classes16.dex */
class CustomEndIconDelegate extends EndIconDelegate {
    CustomEndIconDelegate(EndCompoundLayout endLayout) {
        super(endLayout);
    }

    @Override // com.google.android.material.textfield.EndIconDelegate
    void setUp() {
        this.endLayout.setEndIconOnLongClickListener(null);
    }
}
