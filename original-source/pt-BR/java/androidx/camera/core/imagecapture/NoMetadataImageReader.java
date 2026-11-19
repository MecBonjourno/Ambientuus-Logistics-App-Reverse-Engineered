package androidx.camera.core.imagecapture;

import android.util.Pair;
import android.util.Size;
import android.view.Surface;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.SettableImageProxy;
import androidx.camera.core.impl.ImageReaderProxy;
import androidx.camera.core.impl.TagBundle;
import androidx.camera.core.internal.CameraCaptureResultImageInfo;
import androidx.camera.core.streamsharing.VirtualCameraCaptureResult;
import androidx.core.util.Preconditions;
import java.util.concurrent.Executor;

/* carregado de: classes.dex */
public class NoMetadataImageReader implements ImageReaderProxy {
    private ProcessingRequest mPendingRequest;
    private final ImageReaderProxy mWrappedImageReader;

    NoMetadataImageReader(ImageReaderProxy imageReaderProxy) {
        this.mWrappedImageReader = imageReaderProxy;
    }

    void acceptProcessingRequest(ProcessingRequest request) {
        Preconditions.checkState(this.mPendingRequest == null, "Pending request should be null");
        this.mPendingRequest = request;
    }

    void clearProcessingRequest() {
        this.mPendingRequest = null;
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public ImageProxy acquireLatestImage() {
        return createImageProxyWithEmptyMetadata(this.mWrappedImageReader.acquireLatestImage());
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public ImageProxy acquireNextImage() {
        return createImageProxyWithEmptyMetadata(this.mWrappedImageReader.acquireNextImage());
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public void close() {
        this.mWrappedImageReader.close();
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public int getHeight() {
        return this.mWrappedImageReader.getHeight();
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public int getWidth() {
        return this.mWrappedImageReader.getWidth();
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public int getImageFormat() {
        return this.mWrappedImageReader.getImageFormat();
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public int getMaxImages() {
        return this.mWrappedImageReader.getMaxImages();
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public Surface getSurface() {
        return this.mWrappedImageReader.getSurface();
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public void setOnImageAvailableListener(final ImageReaderProxy.OnImageAvailableListener listener, Executor executor) {
        this.mWrappedImageReader.setOnImageAvailableListener(new ImageReaderProxy.OnImageAvailableListener() { // da classe: androidx.camera.core.imagecapture.NoMetadataImageReader$$ExternalSyntheticLambda0
            @Override // androidx.camera.core.impl.ImageReaderProxy.OnImageAvailableListener
            public final void onImageAvailable(ImageReaderProxy imageReaderProxy) {
                NoMetadataImageReader.this.m168xfcc2464(listener, imageReaderProxy);
            }
        }, executor);
    }

    /* renomeado de: lambda$setOnImageAvailableListener$0$androidx-camera-core-imagecapture-NoMetadataImageReader, motivo: nome Java inválido */
    /* sintético */ void m168xfcc2464(ImageReaderProxy.OnImageAvailableListener listener, ImageReaderProxy imageReader) {
        listener.onImageAvailable(this);
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public void clearOnImageAvailableListener() {
        this.mWrappedImageReader.clearOnImageAvailableListener();
    }

    private ImageProxy createImageProxyWithEmptyMetadata(ImageProxy originalImage) {
        if (originalImage == null) {
            return null;
        }
        TagBundle tagBundle = this.mPendingRequest == null ? TagBundle.emptyBundle() : TagBundle.create(new Pair(this.mPendingRequest.getTagBundleKey(), this.mPendingRequest.getStageIds().get(0)));
        this.mPendingRequest = null;
        return new SettableImageProxy(originalImage, new Size(originalImage.getWidth(), originalImage.getHeight()), new CameraCaptureResultImageInfo(new VirtualCameraCaptureResult(tagBundle, originalImage.getImageInfo().getTimestamp())));
    }
}
