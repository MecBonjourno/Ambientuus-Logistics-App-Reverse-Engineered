package androidx.camera.core.imagecapture;

import android.util.Size;
import android.view.Surface;
import androidx.camera.core.ForwardingImageProxy;
import androidx.camera.core.ImageCaptureException;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.ImageReaderProxyProvider;
import androidx.camera.core.ImageReaderProxys;
import androidx.camera.core.Logger;
import androidx.camera.core.MetadataImageReader;
import androidx.camera.core.SafeCloseImageReaderProxy;
import androidx.camera.core.imagecapture.CaptureNode;
import androidx.camera.core.imagecapture.ProcessingNode;
import androidx.camera.core.imagecapture.TakePictureManager;
import androidx.camera.core.impl.CameraCaptureCallback;
import androidx.camera.core.impl.CameraCaptureCallbacks;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.ImageReaderProxy;
import androidx.camera.core.impl.ImmediateSurface;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.core.processing.Edge;
import androidx.camera.core.processing.Node;
import androidx.core.util.Consumer;
import androidx.core.util.Preconditions;
import j$.util.Objects;
import java.util.List;

/* carregado de: classes.dex */
class CaptureNode implements Node<In, ProcessingNode.In> {
    static final int MAX_IMAGES = 4;
    private static final String TAG = "CaptureNode";
    private In mInputEdge;
    private ProcessingNode.In mOutputEdge;
    SafeCloseImageReaderProxy mSafeCloseImageReaderForPostview;
    SafeCloseImageReaderProxy mSafeCloseImageReaderProxy;
    SafeCloseImageReaderProxy mSecondarySafeCloseImageReaderProxy;
    ProcessingRequest mCurrentRequest = null;
    private NoMetadataImageReader mNoMetadataImageReader = null;

    CaptureNode() {
    }

    @Override // androidx.camera.core.processing.Node
    public ProcessingNode.In transform(In inputEdge) {
        CameraCaptureCallback cameraCaptureCallbacks;
        ImageReaderProxy wrappedImageReader;
        Consumer<ProcessingRequest> requestConsumer;
        Preconditions.checkState(this.mInputEdge == null && this.mSafeCloseImageReaderProxy == null, "CaptureNode does not support recreation yet.");
        this.mInputEdge = inputEdge;
        Size size = inputEdge.getSize();
        int format = inputEdge.getInputFormat();
        ImageReaderProxy secondaryWrappedImageReader = null;
        boolean hasMetadata = !inputEdge.isVirtualCamera();
        CameraCaptureCallback progressCallback = new AnonymousClass1();
        CameraCaptureCallback secondaryCameraCaptureCallback = null;
        boolean isSimultaneousCaptureEnabled = inputEdge.getOutputFormats().size() > 1;
        if (hasMetadata && inputEdge.getImageReaderProxyProvider() == null) {
            if (isSimultaneousCaptureEnabled) {
                MetadataImageReader metadataImageReader = new MetadataImageReader(size.getWidth(), size.getHeight(), 256, 4);
                cameraCaptureCallbacks = CameraCaptureCallbacks.createComboCallback(progressCallback, metadataImageReader.getCameraCaptureCallback());
                wrappedImageReader = metadataImageReader;
                MetadataImageReader secondaryMetadataImageReader = new MetadataImageReader(size.getWidth(), size.getHeight(), 32, 4);
                secondaryCameraCaptureCallback = CameraCaptureCallbacks.createComboCallback(progressCallback, secondaryMetadataImageReader.getCameraCaptureCallback());
                secondaryWrappedImageReader = secondaryMetadataImageReader;
            } else {
                MetadataImageReader metadataImageReader2 = new MetadataImageReader(size.getWidth(), size.getHeight(), format, 4);
                cameraCaptureCallbacks = CameraCaptureCallbacks.createComboCallback(progressCallback, metadataImageReader2.getCameraCaptureCallback());
                wrappedImageReader = metadataImageReader2;
            }
            requestConsumer = new Consumer() { // da classe: androidx.camera.core.imagecapture.CaptureNode$$ExternalSyntheticLambda0
                @Override // androidx.core.util.Consumer
                public final void accept(Object obj) {
                    CaptureNode.this.onRequestAvailable((ProcessingRequest) obj);
                }
            };
        } else {
            cameraCaptureCallbacks = progressCallback;
            this.mNoMetadataImageReader = new NoMetadataImageReader(createImageReaderProxy(inputEdge.getImageReaderProxyProvider(), size.getWidth(), size.getHeight(), format));
            wrappedImageReader = this.mNoMetadataImageReader;
            requestConsumer = new Consumer() { // da classe: androidx.camera.core.imagecapture.CaptureNode$$ExternalSyntheticLambda1
                @Override // androidx.core.util.Consumer
                public final void accept(Object obj) {
                    CaptureNode.this.m164lambda$transform$0$androidxcameracoreimagecaptureCaptureNode((ProcessingRequest) obj);
                }
            };
        }
        inputEdge.setCameraCaptureCallback(cameraCaptureCallbacks);
        if (isSimultaneousCaptureEnabled && secondaryCameraCaptureCallback != null) {
            inputEdge.setSecondaryCameraCaptureCallback(secondaryCameraCaptureCallback);
        }
        inputEdge.setSurface((Surface) Objects.requireNonNull(wrappedImageReader.getSurface()));
        this.mSafeCloseImageReaderProxy = new SafeCloseImageReaderProxy(wrappedImageReader);
        setOnImageAvailableListener(wrappedImageReader);
        PostviewSettings postviewSettings = inputEdge.getPostviewSettings();
        if (postviewSettings != null) {
            ImageReaderProxy postviewImageReader = createImageReaderProxy(inputEdge.getImageReaderProxyProvider(), postviewSettings.getResolution().getWidth(), postviewSettings.getResolution().getHeight(), postviewSettings.getInputFormat());
            postviewImageReader.setOnImageAvailableListener(new ImageReaderProxy.OnImageAvailableListener() { // da classe: androidx.camera.core.imagecapture.CaptureNode$$ExternalSyntheticLambda2
                @Override // androidx.camera.core.impl.ImageReaderProxy.OnImageAvailableListener
                public final void onImageAvailable(ImageReaderProxy imageReaderProxy) {
                    CaptureNode.this.m165lambda$transform$1$androidxcameracoreimagecaptureCaptureNode(imageReaderProxy);
                }
            }, CameraXExecutors.mainThreadExecutor());
            this.mSafeCloseImageReaderForPostview = new SafeCloseImageReaderProxy(postviewImageReader);
            inputEdge.setPostviewSurface(postviewImageReader.getSurface(), postviewSettings.getResolution(), postviewSettings.getInputFormat());
        }
        if (isSimultaneousCaptureEnabled && secondaryWrappedImageReader != null) {
            inputEdge.setSecondarySurface(secondaryWrappedImageReader.getSurface());
            this.mSecondarySafeCloseImageReaderProxy = new SafeCloseImageReaderProxy(secondaryWrappedImageReader);
            setOnImageAvailableListener(secondaryWrappedImageReader);
        }
        inputEdge.getRequestEdge().setListener(requestConsumer);
        inputEdge.getErrorEdge().setListener(new Consumer() { // da classe: androidx.camera.core.imagecapture.CaptureNode$$ExternalSyntheticLambda3
            @Override // androidx.core.util.Consumer
            public final void accept(Object obj) {
                CaptureNode.this.sendCaptureError((TakePictureManager.CaptureError) obj);
            }
        });
        this.mOutputEdge = ProcessingNode.In.of(inputEdge.getInputFormat(), inputEdge.getOutputFormats());
        return this.mOutputEdge;
    }

    /* renomeado de: androidx.camera.core.imagecapture.CaptureNode$1, motivo: nome de classe inválido */
    class AnonymousClass1 extends CameraCaptureCallback {
        AnonymousClass1() {
        }

        @Override // androidx.camera.core.impl.CameraCaptureCallback
        public void onCaptureStarted(int captureConfigId) {
            CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // da classe: androidx.camera.core.imagecapture.CaptureNode$1$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    CaptureNode.AnonymousClass1.this.m167xc251443c();
                }
            });
        }

        /* renomeado de: lambda$onCaptureStarted$0$androidx-camera-core-imagecapture-CaptureNode$1, motivo: nome Java inválido */
        /* sintético */ void m167xc251443c() {
            if (CaptureNode.this.mCurrentRequest != null) {
                CaptureNode.this.mCurrentRequest.onCaptureStarted();
            }
        }

        @Override // androidx.camera.core.impl.CameraCaptureCallback
        public void onCaptureProcessProgressed(int captureConfigId, final int progress) {
            CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // da classe: androidx.camera.core.imagecapture.CaptureNode$1$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    CaptureNode.AnonymousClass1.this.m166xa945b317(progress);
                }
            });
        }

        /* renomeado de: lambda$onCaptureProcessProgressed$1$androidx-camera-core-imagecapture-CaptureNode$1, motivo: nome Java inválido */
        /* sintético */ void m166xa945b317(int progress) {
            if (CaptureNode.this.mCurrentRequest != null) {
                CaptureNode.this.mCurrentRequest.onCaptureProcessProgressed(progress);
            }
        }
    }

    /* renomeado de: lambda$transform$0$androidx-camera-core-imagecapture-CaptureNode, motivo: nome Java inválido */
    /* sintético */ void m164lambda$transform$0$androidxcameracoreimagecaptureCaptureNode(ProcessingRequest request) {
        onRequestAvailable(request);
        this.mNoMetadataImageReader.acceptProcessingRequest(request);
    }

    /* renomeado de: lambda$transform$1$androidx-camera-core-imagecapture-CaptureNode, motivo: nome Java inválido */
    /* sintético */ void m165lambda$transform$1$androidxcameracoreimagecaptureCaptureNode(ImageReaderProxy imageReader) {
        try {
            ImageProxy image = imageReader.acquireLatestImage();
            if (image != null) {
                propagatePostviewImage(image);
            }
        } catch (IllegalStateException e) {
            Logger.e(TAG, "Failed to acquire latest image of postview", e);
        }
    }

    private static ImageReaderProxy createImageReaderProxy(ImageReaderProxyProvider imageReaderProxyProvider, int width, int height, int format) {
        return imageReaderProxyProvider != null ? imageReaderProxyProvider.newInstance(width, height, format, 4, 0L) : ImageReaderProxys.createIsolatedReader(width, height, format, 4);
    }

    private void setOnImageAvailableListener(ImageReaderProxy imageReaderProxy) {
        imageReaderProxy.setOnImageAvailableListener(new ImageReaderProxy.OnImageAvailableListener() { // da classe: androidx.camera.core.imagecapture.CaptureNode$$ExternalSyntheticLambda4
            @Override // androidx.camera.core.impl.ImageReaderProxy.OnImageAvailableListener
            public final void onImageAvailable(ImageReaderProxy imageReaderProxy2) {
                CaptureNode.this.m163xcaddcb00(imageReaderProxy2);
            }
        }, CameraXExecutors.mainThreadExecutor());
    }

    /* renomeado de: lambda$setOnImageAvailableListener$2$androidx-camera-core-imagecapture-CaptureNode, motivo: nome Java inválido */
    /* sintético */ void m163xcaddcb00(ImageReaderProxy imageReader) {
        try {
            ImageProxy image = imageReader.acquireLatestImage();
            if (image != null) {
                onImageProxyAvailable(image);
            } else if (this.mCurrentRequest != null) {
                sendCaptureError(TakePictureManager.CaptureError.of(this.mCurrentRequest.getRequestId(), new ImageCaptureException(2, "Failed to acquire latest image", null)));
            }
        } catch (IllegalStateException e) {
            if (this.mCurrentRequest != null) {
                sendCaptureError(TakePictureManager.CaptureError.of(this.mCurrentRequest.getRequestId(), new ImageCaptureException(2, "Failed to acquire latest image", e)));
            }
        }
    }

    void onImageProxyAvailable(ImageProxy imageProxy) {
        Threads.checkMainThread();
        if (this.mCurrentRequest == null) {
            Logger.w(TAG, "Discarding ImageProxy which was inadvertently acquired: " + imageProxy);
            imageProxy.close();
            return;
        }
        Integer stageId = (Integer) imageProxy.getImageInfo().getTagBundle().getTag(this.mCurrentRequest.getTagBundleKey());
        if (stageId == null) {
            Logger.w(TAG, "Discarding ImageProxy which was acquired for aborted request");
            imageProxy.close();
        } else {
            matchAndPropagateImage(imageProxy);
        }
    }

    private void matchAndPropagateImage(ImageProxy imageProxy) {
        Threads.checkMainThread();
        ((ProcessingNode.In) Objects.requireNonNull(this.mOutputEdge)).getEdge().accept(ProcessingNode.InputPacket.of(this.mCurrentRequest, imageProxy));
        ProcessingRequest request = this.mCurrentRequest;
        boolean isProcessed = false;
        boolean isSimultaneousCaptureEnabled = this.mInputEdge != null && this.mInputEdge.getOutputFormats().size() > 1;
        if (isSimultaneousCaptureEnabled && this.mCurrentRequest != null) {
            this.mCurrentRequest.getTakePictureRequest().markFormatProcessStatusInSimultaneousCapture(imageProxy.getFormat(), true);
        }
        if (!isSimultaneousCaptureEnabled || (this.mCurrentRequest != null && this.mCurrentRequest.getTakePictureRequest().isFormatProcessedInSimultaneousCapture())) {
            isProcessed = true;
        }
        if (isProcessed) {
            this.mCurrentRequest = null;
        }
        request.onImageCaptured();
    }

    private void propagatePostviewImage(ImageProxy imageProxy) {
        if (this.mCurrentRequest == null) {
            Logger.w(TAG, "Postview image is closed due to request completed or aborted");
            imageProxy.close();
        } else {
            ((ProcessingNode.In) Objects.requireNonNull(this.mOutputEdge)).getPostviewEdge().accept(ProcessingNode.InputPacket.of(this.mCurrentRequest, imageProxy));
        }
    }

    void onRequestAvailable(final ProcessingRequest request) {
        Threads.checkMainThread();
        Preconditions.checkState(request.getStageIds().size() == 1, "only one capture stage is supported.");
        Preconditions.checkState(getCapacity() > 0, "Too many acquire images. Close image to be able to process next.");
        this.mCurrentRequest = request;
        Futures.addCallback(request.getCaptureFuture(), new FutureCallback<Void>() { // da classe: androidx.camera.core.imagecapture.CaptureNode.2
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(Void result) {
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
                Threads.checkMainThread();
                if (request == CaptureNode.this.mCurrentRequest) {
                    Logger.w(CaptureNode.TAG, "request aborted, id=" + CaptureNode.this.mCurrentRequest.getRequestId());
                    if (CaptureNode.this.mNoMetadataImageReader != null) {
                        CaptureNode.this.mNoMetadataImageReader.clearProcessingRequest();
                    }
                    CaptureNode.this.mCurrentRequest = null;
                }
            }
        }, CameraXExecutors.directExecutor());
    }

    void sendCaptureError(TakePictureManager.CaptureError error) {
        Threads.checkMainThread();
        if (this.mCurrentRequest != null && this.mCurrentRequest.getRequestId() == error.getRequestId()) {
            this.mCurrentRequest.onCaptureFailure(error.getImageCaptureException());
        }
    }

    @Override // androidx.camera.core.processing.Node
    public void release() {
        Threads.checkMainThread();
        releaseInputResources((In) Objects.requireNonNull(this.mInputEdge), (SafeCloseImageReaderProxy) Objects.requireNonNull(this.mSafeCloseImageReaderProxy), this.mSecondarySafeCloseImageReaderProxy, this.mSafeCloseImageReaderForPostview);
    }

    private void releaseInputResources(In inputEdge, final SafeCloseImageReaderProxy imageReader, final SafeCloseImageReaderProxy secondaryImageReader, final SafeCloseImageReaderProxy imageReaderForPostview) {
        inputEdge.getSurface().close();
        inputEdge.getSurface().getTerminationFuture().addListener(new Runnable() { // da classe: androidx.camera.core.imagecapture.CaptureNode$$ExternalSyntheticLambda5
            @Override // java.lang.Runnable
            public final void run() {
                SafeCloseImageReaderProxy.this.safeClose();
            }
        }, CameraXExecutors.mainThreadExecutor());
        if (inputEdge.getPostviewSurface() != null) {
            inputEdge.getPostviewSurface().close();
            inputEdge.getPostviewSurface().getTerminationFuture().addListener(new Runnable() { // da classe: androidx.camera.core.imagecapture.CaptureNode$$ExternalSyntheticLambda6
                @Override // java.lang.Runnable
                public final void run() {
                    CaptureNode.lambda$releaseInputResources$4(SafeCloseImageReaderProxy.this);
                }
            }, CameraXExecutors.mainThreadExecutor());
        }
        if (inputEdge.getOutputFormats().size() > 1 && inputEdge.getSecondarySurface() != null) {
            inputEdge.getSecondarySurface().close();
            inputEdge.getSecondarySurface().getTerminationFuture().addListener(new Runnable() { // da classe: androidx.camera.core.imagecapture.CaptureNode$$ExternalSyntheticLambda7
                @Override // java.lang.Runnable
                public final void run() {
                    CaptureNode.lambda$releaseInputResources$5(SafeCloseImageReaderProxy.this);
                }
            }, CameraXExecutors.mainThreadExecutor());
        }
    }

    static /* sintético */ void lambda$releaseInputResources$4(SafeCloseImageReaderProxy imageReaderForPostview) {
        if (imageReaderForPostview != null) {
            imageReaderForPostview.safeClose();
        }
    }

    static /* sintético */ void lambda$releaseInputResources$5(SafeCloseImageReaderProxy secondaryImageReader) {
        if (secondaryImageReader != null) {
            secondaryImageReader.safeClose();
        }
    }

    In getInputEdge() {
        return (In) Objects.requireNonNull(this.mInputEdge);
    }

    public SafeCloseImageReaderProxy getSafeCloseImageReaderProxy() {
        return (SafeCloseImageReaderProxy) Objects.requireNonNull(this.mSafeCloseImageReaderProxy);
    }

    public int getCapacity() {
        Threads.checkMainThread();
        Preconditions.checkState(this.mSafeCloseImageReaderProxy != null, "The ImageReader is not initialized.");
        return this.mSafeCloseImageReaderProxy.getCapacity();
    }

    public void setOnImageCloseListener(ForwardingImageProxy.OnImageCloseListener listener) {
        Threads.checkMainThread();
        Preconditions.checkState(this.mSafeCloseImageReaderProxy != null, "The ImageReader is not initialized.");
        this.mSafeCloseImageReaderProxy.setOnImageCloseListener(listener);
    }

    static abstract class In {
        private CameraCaptureCallback mCameraCaptureCallback = new CameraCaptureCallback() { // da classe: androidx.camera.core.imagecapture.CaptureNode.In.1
        };
        private DeferrableSurface mPostviewSurface = null;
        private CameraCaptureCallback mSecondaryCameraCaptureCallback;
        private DeferrableSurface mSecondarySurface;
        private DeferrableSurface mSurface;

        abstract Edge<TakePictureManager.CaptureError> getErrorEdge();

        abstract ImageReaderProxyProvider getImageReaderProxyProvider();

        abstract int getInputFormat();

        abstract List<Integer> getOutputFormats();

        abstract PostviewSettings getPostviewSettings();

        abstract Edge<ProcessingRequest> getRequestEdge();

        abstract Size getSize();

        abstract boolean isVirtualCamera();

        In() {
        }

        DeferrableSurface getSurface() {
            return (DeferrableSurface) Objects.requireNonNull(this.mSurface);
        }

        DeferrableSurface getPostviewSurface() {
            return this.mPostviewSurface;
        }

        DeferrableSurface getSecondarySurface() {
            return this.mSecondarySurface;
        }

        void setSurface(Surface surface) {
            Preconditions.checkState(this.mSurface == null, "The surface is already set.");
            this.mSurface = new ImmediateSurface(surface, getSize(), getInputFormat());
        }

        void setPostviewSurface(Surface surface, Size size, int imageFormat) {
            this.mPostviewSurface = new ImmediateSurface(surface, size, imageFormat);
        }

        void setSecondarySurface(Surface surface) {
            Preconditions.checkState(this.mSecondarySurface == null, "The secondary surface is already set.");
            this.mSecondarySurface = new ImmediateSurface(surface, getSize(), getInputFormat());
        }

        CameraCaptureCallback getCameraCaptureCallback() {
            return this.mCameraCaptureCallback;
        }

        void setCameraCaptureCallback(CameraCaptureCallback cameraCaptureCallback) {
            this.mCameraCaptureCallback = cameraCaptureCallback;
        }

        CameraCaptureCallback getSecondaryCameraCaptureCallback() {
            return this.mSecondaryCameraCaptureCallback;
        }

        void setSecondaryCameraCaptureCallback(CameraCaptureCallback cameraCaptureCallback) {
            this.mSecondaryCameraCaptureCallback = cameraCaptureCallback;
        }

        static In of(Size size, int inputFormat, List<Integer> outputFormats, boolean isVirtualCamera, ImageReaderProxyProvider imageReaderProxyProvider) {
            return new AutoValue_CaptureNode_In(size, inputFormat, outputFormats, isVirtualCamera, imageReaderProxyProvider, null, new Edge(), new Edge());
        }

        static In of(Size size, int inputFormat, List<Integer> outputFormats, boolean isVirtualCamera, ImageReaderProxyProvider imageReaderProxyProvider, PostviewSettings postviewSettings) {
            return new AutoValue_CaptureNode_In(size, inputFormat, outputFormats, isVirtualCamera, imageReaderProxyProvider, postviewSettings, new Edge(), new Edge());
        }
    }
}
