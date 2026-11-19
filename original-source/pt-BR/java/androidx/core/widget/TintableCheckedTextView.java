package androidx.core.widget;

import android.content.res.ColorStateList;
import android.graphics.PorterDuff;

/* carregado de: classes.dex */
public interface TintableCheckedTextView {
    ColorStateList getSupportCheckMarkTintList();

    PorterDuff.Mode getSupportCheckMarkTintMode();

    void setSupportCheckMarkTintList(ColorStateList colorStateList);

    void setSupportCheckMarkTintMode(PorterDuff.Mode mode);
}
