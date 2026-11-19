package androidx.appcompat.widget;

import android.graphics.Rect;

/* carregado de: classes.dex */
public interface FitWindowsViewGroup {

    public interface OnFitSystemWindowsListener {
        void onFitSystemWindows(Rect rect);
    }

    void setOnFitSystemWindowsListener(OnFitSystemWindowsListener onFitSystemWindowsListener);
}
