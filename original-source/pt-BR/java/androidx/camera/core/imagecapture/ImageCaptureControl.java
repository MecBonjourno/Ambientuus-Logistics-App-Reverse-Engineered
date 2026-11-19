package androidx.camera.core.imagecapture;

import androidx.camera.core.impl.CaptureConfig;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.List;

/* carregado de: classes.dex */
public interface ImageCaptureControl {
    void lockFlashMode();

    ListenableFuture<Void> submitStillCaptureRequests(List<CaptureConfig> list);

    void unlockFlashMode();
}
