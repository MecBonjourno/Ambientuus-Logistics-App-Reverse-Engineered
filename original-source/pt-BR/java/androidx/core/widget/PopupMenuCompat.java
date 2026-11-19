package androidx.core.widget;

import android.view.View;
import android.widget.PopupMenu;

/* carregado de: classes.dex */
public final class PopupMenuCompat {
    private PopupMenuCompat() {
    }

    public static View.OnTouchListener getDragToOpenListener(Object popupMenu) {
        return ((PopupMenu) popupMenu).getDragToOpenListener();
    }
}
