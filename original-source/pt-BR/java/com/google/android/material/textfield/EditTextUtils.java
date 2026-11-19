package com.google.android.material.textfield;

import android.widget.EditText;

/* carregado de: classes16.dex */
class EditTextUtils {
    private EditTextUtils() {
    }

    static boolean isEditable(EditText editText) {
        return editText.getInputType() != 0;
    }
}
