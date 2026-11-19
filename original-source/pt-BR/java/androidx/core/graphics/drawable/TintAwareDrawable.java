package androidx.core.graphics.drawable;

import android.content.res.ColorStateList;
import android.graphics.PorterDuff;

/* carregado de: classes.dex */
public interface TintAwareDrawable {
    void setTint(int i);

    void setTintList(ColorStateList colorStateList);

    void setTintMode(PorterDuff.Mode mode);
}
