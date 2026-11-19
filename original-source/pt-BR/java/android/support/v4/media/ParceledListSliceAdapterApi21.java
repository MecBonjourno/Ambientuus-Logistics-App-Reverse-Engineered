package android.support.v4.media;

import android.media.browse.MediaBrowser;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

/* carregado de: classes.dex */
class ParceledListSliceAdapterApi21 {
    private static Constructor sConstructor;

    static {
        Class theClass;
        try {
            theClass = Class.forName("android.content.pm.ParceledListSlice");
        } catch (ClassNotFoundException | NoSuchMethodException e) {
            e = e;
        }
        try {
            sConstructor = theClass.getConstructor(List.class);
        } catch (NoSuchMethodException e2) {
            e = e2;
            e.printStackTrace();
        }
    }

    static Object newInstance(List<MediaBrowser.MediaItem> itemList) {
        try {
            Object result = sConstructor.newInstance(itemList);
            return result;
        } catch (IllegalAccessException | InstantiationException | InvocationTargetException e) {
            e.printStackTrace();
            return null;
        }
    }

    private ParceledListSliceAdapterApi21() {
    }
}
