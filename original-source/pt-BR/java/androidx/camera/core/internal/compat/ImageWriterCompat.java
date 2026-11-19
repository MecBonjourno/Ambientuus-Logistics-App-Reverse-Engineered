package androidx.camera.core.internal.compat;

import android.media.Image;
import android.media.ImageWriter;
import android.os.Build;
import android.view.Surface;
import java.util.concurrent.Executor;

/* carregado de: classes.dex */
public final class ImageWriterCompat {
    public static ImageWriter newInstance(Surface surface, int maxImages, int format) {
        if (Build.VERSION.SDK_INT >= 29) {
            return ImageWriterCompatApi29Impl.newInstance(surface, maxImages, format);
        }
        if (Build.VERSION.SDK_INT >= 26) {
            return ImageWriterCompatApi26Impl.newInstance(surface, maxImages, format);
        }
        throw new RuntimeException("Unable to call newInstance(Surface, int, int) on API " + Build.VERSION.SDK_INT + ". Version 26 or higher required.");
    }

    public static ImageWriter newInstance(Surface surface, int maxImages) {
        return ImageWriterCompatApi23Impl.newInstance(surface, maxImages);
    }

    public static Image dequeueInputImage(ImageWriter imageWriter) {
        return ImageWriterCompatApi23Impl.dequeueInputImage(imageWriter);
    }

    public static void queueInputImage(ImageWriter imageWriter, Image image) {
        ImageWriterCompatApi23Impl.queueInputImage(imageWriter, image);
    }

    public static void setOnImageReleasedListener(ImageWriter imageWriter, ImageWriter.OnImageReleasedListener releasedListener, Executor executor) {
        ImageWriterCompatApi23Impl.setOnImageReleasedListener(imageWriter, releasedListener, executor);
    }

    public static void close(ImageWriter imageWriter) {
        ImageWriterCompatApi23Impl.close(imageWriter);
    }

    private ImageWriterCompat() {
    }
}
