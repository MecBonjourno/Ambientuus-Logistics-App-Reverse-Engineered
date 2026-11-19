package androidx.camera.core.internal.compat;

import android.media.Image;
import android.media.ImageWriter;
import android.view.Surface;
import androidx.camera.core.impl.utils.MainThreadAsyncHandler;
import java.util.concurrent.Executor;

/* carregado de: classes.dex */
final class ImageWriterCompatApi23Impl {
    static ImageWriter newInstance(Surface surface, int maxImages) {
        return ImageWriter.newInstance(surface, maxImages);
    }

    static Image dequeueInputImage(ImageWriter imageWriter) {
        return imageWriter.dequeueInputImage();
    }

    static void queueInputImage(ImageWriter imageWriter, Image image) {
        imageWriter.queueInputImage(image);
    }

    static void close(ImageWriter imageWriter) {
        imageWriter.close();
    }

    static void setOnImageReleasedListener(ImageWriter imageWriter, final ImageWriter.OnImageReleasedListener releasedListener, final Executor executor) {
        imageWriter.setOnImageReleasedListener(new ImageWriter.OnImageReleasedListener() { // da classe: androidx.camera.core.internal.compat.ImageWriterCompatApi23Impl$$ExternalSyntheticLambda1
            @Override // android.media.ImageWriter.OnImageReleasedListener
            public final void onImageReleased(ImageWriter imageWriter2) {
                executor.execute(new Runnable() { // da classe: androidx.camera.core.internal.compat.ImageWriterCompatApi23Impl$$ExternalSyntheticLambda0
                    @Override // java.lang.Runnable
                    public final void run() {
                        r1.onImageReleased(imageWriter2);
                    }
                });
            }
        }, MainThreadAsyncHandler.getInstance());
    }

    private ImageWriterCompatApi23Impl() {
    }
}
