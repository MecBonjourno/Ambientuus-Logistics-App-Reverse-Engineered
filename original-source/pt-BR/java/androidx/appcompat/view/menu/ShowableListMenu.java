package androidx.appcompat.view.menu;

import android.widget.ListView;

/* carregado de: classes.dex */
public interface ShowableListMenu {
    void dismiss();

    ListView getListView();

    boolean isShowing();

    void show();
}
