package androidx.camera.core.imagecapture;

import android.graphics.Bitmap;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CaptureResult;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.ImageCaptureException;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.Logger;
import androidx.camera.core.imagecapture.Bitmap2JpegBytes;
import androidx.camera.core.imagecapture.DngImage2Disk;
import androidx.camera.core.imagecapture.Image2JpegBytes;
import androidx.camera.core.imagecapture.JpegBytes2Disk;
import androidx.camera.core.imagecapture.ProcessingNode;
import androidx.camera.core.impl.Quirks;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.internal.compat.quirk.DeviceQuirks;
import androidx.camera.core.internal.compat.quirk.IncorrectJpegMetadataQuirk;
import androidx.camera.core.internal.compat.quirk.LowMemoryQuirk;
import androidx.camera.core.internal.utils.ImageUtil;
import androidx.camera.core.processing.Edge;
import androidx.camera.core.processing.InternalImageProcessor;
import androidx.camera.core.processing.Node;
import androidx.camera.core.processing.Operation;
import androidx.camera.core.processing.Packet;
import androidx.core.util.Consumer;
import androidx.core.util.Preconditions;
import j$.util.Objects;
import java.util.List;
import java.util.concurrent.Executor;

/* carregado de: classes.dex */
public class ProcessingNode implements Node<In, Void> {
    private static final String TAG = "ProcessingNode";
    private Operation<Bitmap2JpegBytes.In, Packet<byte[]>> mBitmap2JpegBytes;
    private Operation<Packet<Bitmap>, Packet<Bitmap>> mBitmapEffect;
    final Executor mBlockingExecutor;
    private final CameraCharacteristics mCameraCharacteristics;
    DngImage2Disk mDngImage2Disk;
    private final boolean mHasIncorrectJpegMetadataQuirk;
    private Operation<Packet<ImageProxy>, Bitmap> mImage2Bitmap;
    private Operation<Image2JpegBytes.In, Packet<byte[]>> mImage2JpegBytes;
    final InternalImageProcessor mImageProcessor;
    private Operation<InputPacket, Packet<ImageProxy>> mInput2Packet;
    private In mInputEdge;
    private Operation<Packet<byte[]>, Packet<Bitmap>> mJpegBytes2CroppedBitmap;
    private Operation<JpegBytes2Disk.In, ImageCapture.OutputFileResults> mJpegBytes2Disk;
    private Operation<Packet<byte[]>, Packet<ImageProxy>> mJpegBytes2Image;
    private Operation<Packet<ImageProxy>, ImageProxy> mJpegImage2Result;
    private final Quirks mQuirks;

    ProcessingNode(Executor blockingExecutor, CameraCharacteristics cameraCharacteristics) {
        this(blockingExecutor, cameraCharacteristics, null, DeviceQuirks.getAll());
    }

    ProcessingNode(Executor blockingExecutor, Quirks quirks, CameraCharacteristics cameraCharacteristics) {
        this(blockingExecutor, cameraCharacteristics, null, quirks);
    }

    ProcessingNode(Executor blockingExecutor, CameraCharacteristics cameraCharacteristics, InternalImageProcessor imageProcessor) {
        this(blockingExecutor, cameraCharacteristics, imageProcessor, DeviceQuirks.getAll());
    }

    ProcessingNode(Executor blockingExecutor, CameraCharacteristics cameraCharacteristics, InternalImageProcessor imageProcessor, Quirks quirks) {
        boolean isLowMemoryDevice = DeviceQuirks.get(LowMemoryQuirk.class) != null;
        if (isLowMemoryDevice) {
            this.mBlockingExecutor = CameraXExecutors.newSequentialExecutor(blockingExecutor);
        } else {
            this.mBlockingExecutor = blockingExecutor;
        }
        this.mImageProcessor = imageProcessor;
        this.mCameraCharacteristics = cameraCharacteristics;
        this.mQuirks = quirks;
        this.mHasIncorrectJpegMetadataQuirk = quirks.contains(IncorrectJpegMetadataQuirk.class);
    }

    @Override // androidx.camera.core.processing.Node
    public Void transform(In inputEdge) {
        this.mInputEdge = inputEdge;
        inputEdge.getEdge().setListener(new Consumer() { // da classe: androidx.camera.core.imagecapture.ProcessingNode$$ExternalSyntheticLambda1
            @Override // androidx.core.util.Consumer
            public final void accept(Object obj) {
                ProcessingNode.this.m170xc5c546f5((ProcessingNode.InputPacket) obj);
            }
        });
        inputEdge.getPostviewEdge().setListener(new Consumer() { // da classe: androidx.camera.core.imagecapture.ProcessingNode$$ExternalSyntheticLambda2
            @Override // androidx.core.util.Consumer
            public final void accept(Object obj) {
                ProcessingNode.this.m172xa9189333((ProcessingNode.InputPacket) obj);
            }
        });
        this.mInput2Packet = new ProcessingInput2Packet();
        this.mImage2JpegBytes = new Image2JpegBytes(this.mQuirks);
        this.mJpegBytes2CroppedBitmap = new JpegBytes2CroppedBitmap();
        this.mBitmap2JpegBytes = new Bitmap2JpegBytes();
        this.mJpegBytes2Disk = new JpegBytes2Disk();
        this.mJpegImage2Result = new JpegImage2Result();
        this.mImage2Bitmap = new Image2Bitmap();
        if (inputEdge.getInputFormat() == 35 || this.mImageProcessor != null || this.mHasIncorrectJpegMetadataQuirk) {
            this.mJpegBytes2Image = new JpegBytes2Image();
        }
        if (this.mImageProcessor != null) {
            this.mBitmapEffect = new BitmapEffect(this.mImageProcessor);
            return null;
        }
        return null;
    }

    /* renomeado de: lambda$transform$1$androidx-camera-core-imagecapture-ProcessingNode, motivo: nome Java inválido */
    /* sintético */ void m170xc5c546f5(final InputPacket inputPacket) {
        if (inputPacket.getProcessingRequest().isAborted()) {
            inputPacket.getImageProxy().close();
        } else {
            this.mBlockingExecutor.execute(new Runnable() { // da classe: androidx.camera.core.imagecapture.ProcessingNode$$ExternalSyntheticLambda7
                @Override // java.lang.Runnable
                public final void run() {
                    ProcessingNode.this.m169xd41ba0d6(inputPacket);
                }
            });
        }
    }

    /* renomeado de: lambda$transform$3$androidx-camera-core-imagecapture-ProcessingNode, motivo: nome Java inválido */
    /* sintético */ void m172xa9189333(final InputPacket inputPacket) {
        if (inputPacket.getProcessingRequest().isAborted()) {
            Logger.w(TAG, "The postview image is closed due to request aborted");
            inputPacket.getImageProxy().close();
        } else {
            this.mBlockingExecutor.execute(new Runnable() { // da classe: androidx.camera.core.imagecapture.ProcessingNode$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    ProcessingNode.this.m171xb76eed14(inputPacket);
                }
            });
        }
    }

    @Override // androidx.camera.core.processing.Node
    public void release() {
    }

    /* JADX INFO: modificadores de acesso alterados de: package-private */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0046, code lost:
    
        androidx.camera.core.impl.utils.executor.CameraXExecutors.mainThreadExecutor().execute(new androidx.camera.core.imagecapture.ProcessingNode$$ExternalSyntheticLambda5(r0, r4));
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:?, code lost:
    
        return;
     */
    /* renomeado de: processInputPacket, motivo: mesclado com método bridge [métodos inline] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void m169xd41ba0d6(androidx.camera.core.imagecapture.ProcessingNode.InputPacket r8) {
        /*
            r7 = this;
            androidx.camera.core.imagecapture.ProcessingRequest r0 = r8.getProcessingRequest()
            r1 = 0
            androidx.camera.core.imagecapture.ProcessingNode$In r2 = r7.mInputEdge     // Catch: java.lang.RuntimeException -> L53 java.lang.OutOfMemoryError -> L5f androidx.camera.core.ImageCaptureException -> L6b
            java.util.List r2 = r2.getOutputFormats()     // Catch: java.lang.RuntimeException -> L53 java.lang.OutOfMemoryError -> L5f androidx.camera.core.ImageCaptureException -> L6b
            int r2 = r2.size()     // Catch: java.lang.RuntimeException -> L53 java.lang.OutOfMemoryError -> L5f androidx.camera.core.ImageCaptureException -> L6b
            r3 = 1
            if (r2 <= r3) goto L14
            r2 = r3
            goto L15
        L14:
            r2 = r1
        L15:
            androidx.camera.core.imagecapture.ProcessingRequest r4 = r8.getProcessingRequest()     // Catch: java.lang.RuntimeException -> L53 java.lang.OutOfMemoryError -> L5f androidx.camera.core.ImageCaptureException -> L6b
            boolean r4 = r4.isInMemoryCapture()     // Catch: java.lang.RuntimeException -> L53 java.lang.OutOfMemoryError -> L5f androidx.camera.core.ImageCaptureException -> L6b
            if (r4 == 0) goto L30
            androidx.camera.core.ImageProxy r3 = r7.processInMemoryCapture(r8)     // Catch: java.lang.RuntimeException -> L53 java.lang.OutOfMemoryError -> L5f androidx.camera.core.ImageCaptureException -> L6b
            java.util.concurrent.ScheduledExecutorService r4 = androidx.camera.core.impl.utils.executor.CameraXExecutors.mainThreadExecutor()     // Catch: java.lang.RuntimeException -> L53 java.lang.OutOfMemoryError -> L5f androidx.camera.core.ImageCaptureException -> L6b
            androidx.camera.core.imagecapture.ProcessingNode$$ExternalSyntheticLambda4 r5 = new androidx.camera.core.imagecapture.ProcessingNode$$ExternalSyntheticLambda4     // Catch: java.lang.RuntimeException -> L53 java.lang.OutOfMemoryError -> L5f androidx.camera.core.ImageCaptureException -> L6b
            r5.<init>()     // Catch: java.lang.RuntimeException -> L53 java.lang.OutOfMemoryError -> L5f androidx.camera.core.ImageCaptureException -> L6b
            r4.execute(r5)     // Catch: java.lang.RuntimeException -> L53 java.lang.OutOfMemoryError -> L5f androidx.camera.core.ImageCaptureException -> L6b
            goto L6f
        L30:
            androidx.camera.core.ImageCapture$OutputFileResults r4 = r7.processOnDiskCapture(r8)     // Catch: java.lang.RuntimeException -> L53 java.lang.OutOfMemoryError -> L5f androidx.camera.core.ImageCaptureException -> L6b
            if (r2 == 0) goto L43
            androidx.camera.core.imagecapture.TakePictureRequest r5 = r0.getTakePictureRequest()     // Catch: java.lang.RuntimeException -> L53 java.lang.OutOfMemoryError -> L5f androidx.camera.core.ImageCaptureException -> L6b
            boolean r5 = r5.isFormatProcessedInSimultaneousCapture()     // Catch: java.lang.RuntimeException -> L53 java.lang.OutOfMemoryError -> L5f androidx.camera.core.ImageCaptureException -> L6b
            if (r5 == 0) goto L41
            goto L43
        L41:
            r3 = r1
            goto L44
        L43:
        L44:
            if (r3 == 0) goto L6f
            java.util.concurrent.ScheduledExecutorService r5 = androidx.camera.core.impl.utils.executor.CameraXExecutors.mainThreadExecutor()     // Catch: java.lang.RuntimeException -> L53 java.lang.OutOfMemoryError -> L5f androidx.camera.core.ImageCaptureException -> L6b
            androidx.camera.core.imagecapture.ProcessingNode$$ExternalSyntheticLambda5 r6 = new androidx.camera.core.imagecapture.ProcessingNode$$ExternalSyntheticLambda5     // Catch: java.lang.RuntimeException -> L53 java.lang.OutOfMemoryError -> L5f androidx.camera.core.ImageCaptureException -> L6b
            r6.<init>()     // Catch: java.lang.RuntimeException -> L53 java.lang.OutOfMemoryError -> L5f androidx.camera.core.ImageCaptureException -> L6b
            r5.execute(r6)     // Catch: java.lang.RuntimeException -> L53 java.lang.OutOfMemoryError -> L5f androidx.camera.core.ImageCaptureException -> L6b
            goto L6f
        L53:
            r2 = move-exception
            androidx.camera.core.ImageCaptureException r3 = new androidx.camera.core.ImageCaptureException
            java.lang.String r4 = "Processing failed."
            r3.<init>(r1, r4, r2)
            r7.sendError(r0, r3)
            goto L70
        L5f:
            r2 = move-exception
            androidx.camera.core.ImageCaptureException r3 = new androidx.camera.core.ImageCaptureException
            java.lang.String r4 = "Processing failed due to low memory."
            r3.<init>(r1, r4, r2)
            r7.sendError(r0, r3)
            goto L6f
        L6b:
            r1 = move-exception
            r7.sendError(r0, r1)
        L6f:
        L70:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.core.imagecapture.ProcessingNode.m169xd41ba0d6(androidx.camera.core.imagecapture.ProcessingNode$InputPacket):void");
    }

    /* JADX INFO: modificadores de acesso alterados de: package-private */
    /* renomeado de: processPostviewInputPacket, motivo: mesclado com método bridge [métodos inline] */
    public void m171xb76eed14(InputPacket inputPacket) {
        boolean z;
        final ProcessingRequest request = inputPacket.getProcessingRequest();
        try {
            Packet<ImageProxy> image = this.mInput2Packet.apply(inputPacket);
            int imageFormat = image.getFormat();
            if (imageFormat != 35 && imageFormat != 256 && imageFormat != 4101) {
                z = false;
                Preconditions.checkArgument(z, String.format("Postview only supports to convert YUV, JPEG and JPEG_R format image to the postview output bitmap. Image format: %s", Integer.valueOf(imageFormat)));
                final Bitmap bitmap = this.mImage2Bitmap.apply(image);
                CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // da classe: androidx.camera.core.imagecapture.ProcessingNode$$ExternalSyntheticLambda6
                    @Override // java.lang.Runnable
                    public final void run() {
                        ProcessingRequest.this.onPostviewBitmapAvailable(bitmap);
                    }
                });
            }
            z = true;
            Preconditions.checkArgument(z, String.format("Postview only supports to convert YUV, JPEG and JPEG_R format image to the postview output bitmap. Image format: %s", Integer.valueOf(imageFormat)));
            final Bitmap bitmap2 = this.mImage2Bitmap.apply(image);
            CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // da classe: androidx.camera.core.imagecapture.ProcessingNode$$ExternalSyntheticLambda6
                @Override // java.lang.Runnable
                public final void run() {
                    ProcessingRequest.this.onPostviewBitmapAvailable(bitmap2);
                }
            });
        } catch (Exception e) {
            inputPacket.getImageProxy().close();
            Logger.e(TAG, "process postview input packet failed.", e);
        }
    }

    ImageCapture.OutputFileResults processOnDiskCapture(InputPacket inputPacket) throws ImageCaptureException {
        List<Integer> outputFormats = this.mInputEdge.getOutputFormats();
        Preconditions.checkArgument(!outputFormats.isEmpty());
        boolean z = false;
        int format = outputFormats.get(0).intValue();
        Preconditions.checkArgument(ImageUtil.isJpegFormats(format) || ImageUtil.isRawFormats(format), String.format("On-disk capture only support JPEG and JPEG/R and RAW output formats. Output format: %s", Integer.valueOf(format)));
        ProcessingRequest request = inputPacket.getProcessingRequest();
        Preconditions.checkArgument(request.getOutputFileOptions() != null, "OutputFileOptions cannot be empty");
        Packet<ImageProxy> originalImage = this.mInput2Packet.apply(inputPacket);
        boolean isSimultaneousCaptureEnabled = outputFormats.size() > 1;
        if (isSimultaneousCaptureEnabled) {
            if (request.getOutputFileOptions() != null && request.getSecondaryOutputFileOptions() != null) {
                z = true;
            }
            Preconditions.checkArgument(z, "The number of OutputFileOptions for simultaneous capture should be at least two");
            switch (originalImage.getFormat()) {
                case 32:
                    ImageCapture.OutputFileResults outputFileResults = saveRawToDisk(originalImage, (ImageCapture.OutputFileOptions) Objects.requireNonNull(request.getOutputFileOptions()));
                    request.getTakePictureRequest().markFormatProcessStatusInSimultaneousCapture(32, true);
                    return outputFileResults;
                default:
                    ImageCapture.OutputFileResults outputFileResults2 = saveJpegToDisk(originalImage, (ImageCapture.OutputFileOptions) Objects.requireNonNull(request.getSecondaryOutputFileOptions()), request.getJpegQuality());
                    request.getTakePictureRequest().markFormatProcessStatusInSimultaneousCapture(256, true);
                    return outputFileResults2;
            }
        }
        switch (format) {
            case 32:
                return saveRawToDisk(originalImage, (ImageCapture.OutputFileOptions) Objects.requireNonNull(request.getOutputFileOptions()));
            default:
                return saveJpegToDisk(originalImage, (ImageCapture.OutputFileOptions) Objects.requireNonNull(request.getOutputFileOptions()), request.getJpegQuality());
        }
    }

    private ImageCapture.OutputFileResults saveRawToDisk(Packet<ImageProxy> originalImage, ImageCapture.OutputFileOptions outputFileOptions) throws ImageCaptureException {
        if (this.mDngImage2Disk == null) {
            if (this.mCameraCharacteristics == null) {
                throw new ImageCaptureException(0, "CameraCharacteristics is null, DngCreator cannot be created", null);
            }
            if (originalImage.getCameraCaptureResult().getCaptureResult() == null) {
                throw new ImageCaptureException(0, "CameraCaptureResult is null, DngCreator cannot be created", null);
            }
            this.mDngImage2Disk = new DngImage2Disk((CameraCharacteristics) Objects.requireNonNull(this.mCameraCharacteristics), (CaptureResult) Objects.requireNonNull(originalImage.getCameraCaptureResult().getCaptureResult()));
        }
        return this.mDngImage2Disk.apply(DngImage2Disk.In.of(originalImage.getData(), originalImage.getRotationDegrees(), (ImageCapture.OutputFileOptions) Objects.requireNonNull(outputFileOptions)));
    }

    private ImageCapture.OutputFileResults saveJpegToDisk(Packet<ImageProxy> originalImage, ImageCapture.OutputFileOptions outputFileOptions, int jpegQuality) throws ImageCaptureException {
        Packet<byte[]> jpegBytes = this.mImage2JpegBytes.apply(Image2JpegBytes.In.of(originalImage, jpegQuality));
        if (jpegBytes.hasCropping() || this.mBitmapEffect != null) {
            jpegBytes = cropAndMaybeApplyEffect(jpegBytes, jpegQuality);
        }
        return this.mJpegBytes2Disk.apply(JpegBytes2Disk.In.of(jpegBytes, (ImageCapture.OutputFileOptions) Objects.requireNonNull(outputFileOptions)));
    }

    ImageProxy processInMemoryCapture(InputPacket inputPacket) throws ImageCaptureException {
        ProcessingRequest request = inputPacket.getProcessingRequest();
        Packet<ImageProxy> image = this.mInput2Packet.apply(inputPacket);
        List<Integer> outputFormats = this.mInputEdge.getOutputFormats();
        Preconditions.checkArgument(!outputFormats.isEmpty());
        int format = outputFormats.get(0).intValue();
        if ((image.getFormat() == 35 || this.mBitmapEffect != null || this.mHasIncorrectJpegMetadataQuirk) && format == 256) {
            Packet<byte[]> jpegBytes = this.mImage2JpegBytes.apply(Image2JpegBytes.In.of(image, request.getJpegQuality()));
            if (this.mBitmapEffect != null) {
                jpegBytes = cropAndMaybeApplyEffect(jpegBytes, request.getJpegQuality());
            }
            image = this.mJpegBytes2Image.apply(jpegBytes);
        }
        ImageProxy imageProxy = this.mJpegImage2Result.apply(image);
        boolean isSimultaneousCaptureEnabled = outputFormats.size() > 1;
        if (isSimultaneousCaptureEnabled) {
            request.getTakePictureRequest().markFormatProcessStatusInSimultaneousCapture(imageProxy.getFormat(), true);
        }
        return imageProxy;
    }

    private Packet<byte[]> cropAndMaybeApplyEffect(Packet<byte[]> jpegPacket, int jpegQuality) throws ImageCaptureException {
        Preconditions.checkState(ImageUtil.isJpegFormats(jpegPacket.getFormat()));
        Packet<Bitmap> bitmapPacket = this.mJpegBytes2CroppedBitmap.apply(jpegPacket);
        if (this.mBitmapEffect != null) {
            bitmapPacket = this.mBitmapEffect.apply(bitmapPacket);
        }
        return this.mBitmap2JpegBytes.apply(Bitmap2JpegBytes.In.of(bitmapPacket, jpegQuality));
    }

    private void sendError(final ProcessingRequest request, final ImageCaptureException e) {
        CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // da classe: androidx.camera.core.imagecapture.ProcessingNode$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                ProcessingRequest.this.onProcessFailure(e);
            }
        });
    }

    static abstract class InputPacket {
        abstract ImageProxy getImageProxy();

        abstract ProcessingRequest getProcessingRequest();

        InputPacket() {
        }

        static InputPacket of(ProcessingRequest processingRequest, ImageProxy imageProxy) {
            return new AutoValue_ProcessingNode_InputPacket(processingRequest, imageProxy);
        }
    }

    static abstract class In {
        abstract Edge<InputPacket> getEdge();

        abstract int getInputFormat();

        abstract List<Integer> getOutputFormats();

        abstract Edge<InputPacket> getPostviewEdge();

        In() {
        }

        static In of(int inputFormat, List<Integer> outputFormats) {
            return new AutoValue_ProcessingNode_In(new Edge(), new Edge(), inputFormat, outputFormats);
        }
    }

    void injectProcessingInput2Packet(Operation<InputPacket, Packet<ImageProxy>> input2Packet) {
        this.mInput2Packet = input2Packet;
    }
}
