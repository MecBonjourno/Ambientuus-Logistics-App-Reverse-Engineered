package me.dm7.barcodescanner.core;

import android.content.Context;
import android.graphics.Point;
import android.view.Display;
import android.view.WindowManager;

/* carregado de: classes17.dex */
public class DisplayUtils {
    public static Point getScreenResolution(Context context) {
        WindowManager wm = (WindowManager) context.getSystemService("window");
        Display display = wm.getDefaultDisplay();
        Point screenResolution = new Point();
        display.getSize(screenResolution);
        return screenResolution;
    }

    public static int getScreenOrientation(Context context) {
        WindowManager wm = (WindowManager) context.getSystemService("window");
        Display display = wm.getDefaultDisplay();
        if (display.getWidth() == display.getHeight()) {
            return 3;
        }
        if (display.getWidth() < display.getHeight()) {
            return 1;
        }
        return 2;
    }
}
