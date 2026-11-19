package androidx.camera.core.imagecapture;

import android.util.Size;

/* carregado de: classes.dex */
public abstract class PostviewSettings {
    public abstract int getInputFormat();

    public abstract Size getResolution();

    public static PostviewSettings create(Size resolution, int inputFormat) {
        return new AutoValue_PostviewSettings(resolution, inputFormat);
    }
}
