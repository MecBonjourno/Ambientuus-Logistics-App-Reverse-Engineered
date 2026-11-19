package androidx.camera.core.impl.utils;

import android.view.Surface;

/* carregado de: classes.dex */
public class SurfaceUtil {
    public static final String JNI_LIB_NAME = "surface_util_jni";
    private static final String TAG = "SurfaceUtil";

    public static class SurfaceInfo {
        public int format = 0;
        public int width = 0;
        public int height = 0;
    }

    private static native int[] nativeGetSurfaceInfo(Surface surface);

    static {
        System.loadLibrary(JNI_LIB_NAME);
    }

    private SurfaceUtil() {
    }

    public static SurfaceInfo getSurfaceInfo(Surface surface) {
        int[] surfaceInfoArray = nativeGetSurfaceInfo(surface);
        SurfaceInfo surfaceInfo = new SurfaceInfo();
        surfaceInfo.format = surfaceInfoArray[0];
        surfaceInfo.width = surfaceInfoArray[1];
        surfaceInfo.height = surfaceInfoArray[2];
        return surfaceInfo;
    }
}
