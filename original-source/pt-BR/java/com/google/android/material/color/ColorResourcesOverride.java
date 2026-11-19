package com.google.android.material.color;

import android.content.Context;
import android.os.Build;
import java.util.Map;

/* carregado de: classes16.dex */
public interface ColorResourcesOverride {
    boolean applyIfPossible(Context context, Map<Integer, Integer> map);

    Context wrapContextIfPossible(Context context, Map<Integer, Integer> map);

    /* renomeado de: com.google.android.material.color.ColorResourcesOverride$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        public static ColorResourcesOverride getInstance() {
            if (30 <= Build.VERSION.SDK_INT && Build.VERSION.SDK_INT <= 33) {
                return ResourcesLoaderColorResourcesOverride.getInstance();
            }
            if (Build.VERSION.SDK_INT >= 34) {
                return ResourcesLoaderColorResourcesOverride.getInstance();
            }
            return null;
        }
    }
}
