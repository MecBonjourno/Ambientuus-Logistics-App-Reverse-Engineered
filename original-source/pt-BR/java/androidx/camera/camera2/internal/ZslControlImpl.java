package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.params.InputConfiguration;
import android.hardware.camera2.params.StreamConfigurationMap;
import android.media.Image;
import android.media.ImageWriter;
import android.util.Size;
import android.view.Surface;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.camera2.internal.compat.quirk.DeviceQuirks;
import androidx.camera.camera2.internal.compat.quirk.ZslDisablerQuirk;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.Logger;
import androidx.camera.core.MetadataImageReader;
import androidx.camera.core.SafeCloseImageReaderProxy;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.ImageReaderProxy;
import androidx.camera.core.impl.ImmediateSurface;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.utils.CompareSizesByArea;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.internal.compat.ImageWriterCompat;
import androidx.camera.core.internal.utils.RingBuffer;
import androidx.camera.core.internal.utils.ZslRingBuffer;
import j$.util.Objects;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;

/* carregado de: classes.dex */
final class ZslControlImpl implements ZslControl {
    static final int MAX_IMAGES = 9;
    static final int RING_BUFFER_CAPACITY = 3;
    private static final String TAG = "ZslControlImpl";
    private final CameraCharacteristicsCompat mCameraCharacteristicsCompat;
    private final Executor mExecutor;
    final ZslRingBuffer mImageRingBuffer;
    private boolean mIsPrivateReprocessingSupported;
    private DeferrableSurface mReprocessingImageDeferrableSurface;
    SafeCloseImageReaderProxy mReprocessingImageReader;
    ImageWriterHolder mReprocessingImageWriterHolder;
    private boolean mShouldZslDisabledByQuirks;
    private boolean mIsZslDisabledByUseCaseConfig = false;
    private boolean mIsZslDisabledByFlashMode = false;

    ZslControlImpl(CameraCharacteristicsCompat cameraCharacteristicsCompat, Executor executor) {
        this.mIsPrivateReprocessingSupported = false;
        this.mShouldZslDisabledByQuirks = false;
        this.mCameraCharacteristicsCompat = cameraCharacteristicsCompat;
        this.mExecutor = executor;
        this.mIsPrivateReprocessingSupported = ZslUtil.isCapabilitySupported(this.mCameraCharacteristicsCompat, 4);
        this.mShouldZslDisabledByQuirks = DeviceQuirks.get(ZslDisablerQuirk.class) != null;
        this.mImageRingBuffer = new ZslRingBuffer(3, new RingBuffer.OnRemoveCallback() { // da classe: androidx.camera.camera2.internal.ZslControlImpl$$ExternalSyntheticLambda2
            @Override // androidx.camera.core.internal.utils.RingBuffer.OnRemoveCallback
            public final void onRemove(Object obj) {
                ((ImageProxy) obj).close();
            }
        });
    }

    @Override // androidx.camera.camera2.internal.ZslControl
    public void setZslDisabledByUserCaseConfig(boolean disabled) {
        if (this.mIsZslDisabledByUseCaseConfig != disabled && disabled) {
            clearRingBuffer();
        }
        this.mIsZslDisabledByUseCaseConfig = disabled;
    }

    @Override // androidx.camera.camera2.internal.ZslControl
    public boolean isZslDisabledByUserCaseConfig() {
        return this.mIsZslDisabledByUseCaseConfig;
    }

    @Override // androidx.camera.camera2.internal.ZslControl
    public void setZslDisabledByFlashMode(boolean disabled) {
        this.mIsZslDisabledByFlashMode = disabled;
    }

    @Override // androidx.camera.camera2.internal.ZslControl
    public boolean isZslDisabledByFlashMode() {
        return this.mIsZslDisabledByFlashMode;
    }

    @Override // androidx.camera.camera2.internal.ZslControl
    public void addZslConfig(SessionConfig.Builder sessionConfigBuilder) {
        cleanup();
        if (this.mIsZslDisabledByUseCaseConfig) {
            sessionConfigBuilder.setTemplateType(1);
            return;
        }
        if (this.mShouldZslDisabledByQuirks) {
            sessionConfigBuilder.setTemplateType(1);
            return;
        }
        Map<Integer, Size> mReprocessingInputSizeMap = createReprocessingInputSizeMap(this.mCameraCharacteristicsCompat);
        if (!this.mIsPrivateReprocessingSupported || mReprocessingInputSizeMap.isEmpty() || !mReprocessingInputSizeMap.containsKey(34) || !isJpegValidOutputForInputFormat(this.mCameraCharacteristicsCompat, 34)) {
            sessionConfigBuilder.setTemplateType(1);
            return;
        }
        Size resolution = mReprocessingInputSizeMap.get(34);
        MetadataImageReader metadataImageReader = new MetadataImageReader(resolution.getWidth(), resolution.getHeight(), 34, 9);
        final SafeCloseImageReaderProxy reprocessingImageReaderProxy = new SafeCloseImageReaderProxy(metadataImageReader);
        DeferrableSurface reprocessingImageDeferrableSurface = new ImmediateSurface((Surface) Objects.requireNonNull(reprocessingImageReaderProxy.getSurface()), new Size(reprocessingImageReaderProxy.getWidth(), reprocessingImageReaderProxy.getHeight()), 34);
        final ImageWriterHolder imageWriterHolder = new ImageWriterHolder(this.mExecutor);
        this.mReprocessingImageReader = reprocessingImageReaderProxy;
        this.mReprocessingImageDeferrableSurface = reprocessingImageDeferrableSurface;
        this.mReprocessingImageWriterHolder = imageWriterHolder;
        reprocessingImageReaderProxy.setOnImageAvailableListener(new ImageReaderProxy.OnImageAvailableListener() { // da classe: androidx.camera.camera2.internal.ZslControlImpl$$ExternalSyntheticLambda0
            @Override // androidx.camera.core.impl.ImageReaderProxy.OnImageAvailableListener
            public final void onImageAvailable(ImageReaderProxy imageReaderProxy) {
                ZslControlImpl.this.m107xd50834cf(imageReaderProxy);
            }
        }, CameraXExecutors.ioExecutor());
        reprocessingImageDeferrableSurface.getTerminationFuture().addListener(new Runnable() { // da classe: androidx.camera.camera2.internal.ZslControlImpl$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                ZslControlImpl.lambda$addZslConfig$1(SafeCloseImageReaderProxy.this, imageWriterHolder);
            }
        }, this.mExecutor);
        sessionConfigBuilder.addSurface(reprocessingImageDeferrableSurface);
        sessionConfigBuilder.addCameraCaptureCallback(metadataImageReader.getCameraCaptureCallback());
        sessionConfigBuilder.addSessionStateCallback(new CameraCaptureSession.StateCallback() { // da classe: androidx.camera.camera2.internal.ZslControlImpl.1
            @Override // android.hardware.camera2.CameraCaptureSession.StateCallback
            public void onConfigured(CameraCaptureSession cameraCaptureSession) {
                Surface surface = cameraCaptureSession.getInputSurface();
                if (surface != null) {
                    imageWriterHolder.onImageWriterCreated(ImageWriterCompat.newInstance(surface, 1));
                }
            }

            @Override // android.hardware.camera2.CameraCaptureSession.StateCallback
            public void onConfigureFailed(CameraCaptureSession cameraCaptureSession) {
            }
        });
        sessionConfigBuilder.setInputConfiguration(new InputConfiguration(reprocessingImageReaderProxy.getWidth(), reprocessingImageReaderProxy.getHeight(), reprocessingImageReaderProxy.getImageFormat()));
    }

    /* renomeado de: lambda$addZslConfig$0$androidx-camera-camera2-internal-ZslControlImpl, motivo: nome Java inválido */
    /* sintético */ void m107xd50834cf(ImageReaderProxy imageReader) {
        try {
            ImageProxy imageProxy = imageReader.acquireLatestImage();
            if (imageProxy != null) {
                this.mImageRingBuffer.enqueue(imageProxy);
            }
        } catch (IllegalStateException e) {
            Logger.e(TAG, "Failed to acquire latest image IllegalStateException = " + e.getMessage());
        }
    }

    static /* sintético */ void lambda$addZslConfig$1(SafeCloseImageReaderProxy reprocessingImageReaderProxy, ImageWriterHolder imageWriterHolder) {
        reprocessingImageReaderProxy.safeClose();
        imageWriterHolder.release();
    }

    @Override // androidx.camera.camera2.internal.ZslControl
    public void clearZslConfig() {
        cleanup();
    }

    @Override // androidx.camera.camera2.internal.ZslControl
    public ImageProxy dequeueImageFromBuffer() {
        try {
            ImageProxy imageProxy = this.mImageRingBuffer.dequeue();
            return imageProxy;
        } catch (NoSuchElementException e) {
            Logger.e(TAG, "dequeueImageFromBuffer no such element");
            return null;
        }
    }

    @Override // androidx.camera.camera2.internal.ZslControl
    public boolean enqueueImageToImageWriter(ImageProxy imageProxy) {
        if (this.mReprocessingImageWriterHolder != null) {
            return this.mReprocessingImageWriterHolder.enqueueImageToImageWriter(imageProxy);
        }
        return false;
    }

    private void cleanup() {
        if (this.mReprocessingImageReader != null) {
            this.mReprocessingImageReader.clearOnImageAvailableListener();
            this.mReprocessingImageReader = null;
        }
        if (this.mReprocessingImageWriterHolder != null) {
            this.mReprocessingImageWriterHolder.deactivate();
            this.mReprocessingImageWriterHolder = null;
        }
        clearRingBuffer();
        if (this.mReprocessingImageDeferrableSurface != null) {
            this.mReprocessingImageDeferrableSurface.close();
            this.mReprocessingImageDeferrableSurface = null;
        }
    }

    private void clearRingBuffer() {
        ZslRingBuffer imageRingBuffer = this.mImageRingBuffer;
        while (!imageRingBuffer.isEmpty()) {
            ImageProxy imageProxy = imageRingBuffer.dequeue();
            imageProxy.close();
        }
    }

    private Map<Integer, Size> createReprocessingInputSizeMap(CameraCharacteristicsCompat cameraCharacteristicsCompat) {
        StreamConfigurationMap map = null;
        try {
            map = (StreamConfigurationMap) cameraCharacteristicsCompat.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP);
        } catch (AssertionError e) {
            Logger.e(TAG, "Failed to retrieve StreamConfigurationMap, error = " + e.getMessage());
        }
        if (map == null || map.getInputFormats() == null) {
            return new HashMap();
        }
        Map<Integer, Size> inputSizeMap = new HashMap<>();
        for (int format : map.getInputFormats()) {
            Size[] inputSizes = map.getInputSizes(format);
            if (inputSizes != null) {
                Arrays.sort(inputSizes, new CompareSizesByArea(true));
                inputSizeMap.put(Integer.valueOf(format), inputSizes[0]);
            }
        }
        return inputSizeMap;
    }

    private boolean isJpegValidOutputForInputFormat(CameraCharacteristicsCompat cameraCharacteristicsCompat, int inputFormat) {
        int[] validOutputFormats;
        StreamConfigurationMap map = (StreamConfigurationMap) cameraCharacteristicsCompat.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP);
        if (map == null || (validOutputFormats = map.getValidOutputFormatsForInput(inputFormat)) == null) {
            return false;
        }
        for (int outputFormat : validOutputFormats) {
            if (outputFormat == 256) {
                return true;
            }
        }
        return false;
    }

    static class ImageWriterHolder {
        private final Executor mExecutor;
        private ImageWriter mImageWriter;
        private final AtomicBoolean mIsOpened = new AtomicBoolean(true);

        ImageWriterHolder(Executor executor) {
            this.mExecutor = executor;
        }

        public void onImageWriterCreated(ImageWriter imageWriter) {
            if (this.mIsOpened.get()) {
                if (this.mImageWriter != null) {
                    Logger.w(ZslControlImpl.TAG, "ImageWriter already existed in the ImageWriter holder. Closing the previous one.");
                    this.mImageWriter.close();
                }
                this.mImageWriter = imageWriter;
            }
        }

        public boolean enqueueImageToImageWriter(final ImageProxy imageProxy) {
            Image image = imageProxy.getImage();
            if (!this.mIsOpened.get() || this.mImageWriter == null || image == null) {
                return false;
            }
            try {
                ImageWriterCompat.queueInputImage(this.mImageWriter, image);
                ImageWriterCompat.setOnImageReleasedListener(this.mImageWriter, new ImageWriter.OnImageReleasedListener() { // da classe: androidx.camera.camera2.internal.ZslControlImpl$ImageWriterHolder$$ExternalSyntheticLambda0
                    @Override // android.media.ImageWriter.OnImageReleasedListener
                    public final void onImageReleased(ImageWriter imageWriter) {
                        ImageProxy.this.close();
                    }
                }, this.mExecutor);
                return true;
            } catch (IllegalStateException e) {
                Logger.e(ZslControlImpl.TAG, "enqueueImageToImageWriter throws IllegalStateException = " + e.getMessage());
                return false;
            }
        }

        public void deactivate() {
            this.mIsOpened.set(false);
        }

        public void release() {
            deactivate();
            if (this.mImageWriter != null) {
                this.mImageWriter.close();
            }
        }
    }
}
