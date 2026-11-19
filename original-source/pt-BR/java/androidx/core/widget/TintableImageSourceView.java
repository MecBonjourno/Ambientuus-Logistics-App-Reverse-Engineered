package androidx.core.widget;

import android.content.res.ColorStateList;
import android.graphics.PorterDuff;

/* carregado de: classes.dex */
public interface TintableImageSourceView {
    ColorStateList getSupportImageTintList();

    PorterDuff.Mode getSupportImageTintMode();

    void setSupportImageTintList(ColorStateList colorStateList);

    void setSupportImageTintMode(PorterDuff.Mode mode);
}
