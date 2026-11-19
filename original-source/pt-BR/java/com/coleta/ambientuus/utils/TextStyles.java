package com.coleta.ambientuus.utils;

import android.text.SpannableString;
import android.text.style.StyleSpan;

/* carregado de: classes5.dex */
public class TextStyles {
    public static SpannableString getTextWithBoldPrefix(String base, String text) {
        SpannableString spannable = new SpannableString(base + text);
        spannable.setSpan(new StyleSpan(1), 0, base.length(), 33);
        return spannable;
    }

    public static SpannableString getTextWithBoldSufix(String base, String text) {
        SpannableString spannable = new SpannableString(base + text);
        spannable.setSpan(new StyleSpan(1), base.length(), base.length() + text.length(), 33);
        return spannable;
    }

    public static SpannableString getTextBold(String text) {
        SpannableString spannable = new SpannableString(text);
        spannable.setSpan(new StyleSpan(1), 0, text.length(), 33);
        return spannable;
    }
}
