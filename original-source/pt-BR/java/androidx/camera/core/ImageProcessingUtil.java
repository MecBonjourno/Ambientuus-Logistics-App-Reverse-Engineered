package androidx.camera.core;

import android.graphics.Bitmap;
import android.media.Image;
import android.media.ImageWriter;
import android.util.Log;
import android.view.Surface;
import androidx.camera.core.ForwardingImageProxy;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.impl.ImageReaderProxy;
import androidx.camera.core.internal.compat.ImageWriterCompat;
import androidx.camera.core.internal.utils.ImageUtil;
import androidx.core.util.Preconditions;
import java.nio.ByteBuffer;
import java.util.Locale;

/* carregado de: classes.dex */
public final class ImageProcessingUtil {
    public static final String JNI_LIB_NAME = "image_processing_util_jni";
    private static final String TAG = "ImageProcessingUtil";
    private static int sImageCount = 0;

    enum Result {
        UNKNOWN,
        SUCCESS,
        ERROR_CONVERSION
    }

    private static native int nativeConvertAndroid420ToABGR(ByteBuffer byteBuffer, int i, ByteBuffer byteBuffer2, int i2, ByteBuffer byteBuffer3, int i3, int i4, int i5, Surface surface, ByteBuffer byteBuffer4, int i6, int i7, int i8, int i9, int i10, int i11);

    private static native int nativeConvertAndroid420ToBitmap(ByteBuffer byteBuffer, int i, ByteBuffer byteBuffer2, int i2, ByteBuffer byteBuffer3, int i3, int i4, int i5, Bitmap bitmap, int i6, int i7, int i8);

    private static native int nativeCopyBetweenByteBufferAndBitmap(Bitmap bitmap, ByteBuffer byteBuffer, int i, int i2, int i3, int i4, boolean z);

    public static native int nativeGetYUVImageVUOff(ByteBuffer byteBuffer, ByteBuffer byteBuffer2);

    public static native ByteBuffer nativeNewDirectByteBuffer(ByteBuffer byteBuffer, int i, int i2);

    private static native int nativeRotateYUV(ByteBuffer byteBuffer, int i, ByteBuffer byteBuffer2, int i2, ByteBuffer byteBuffer3, int i3, int i4, ByteBuffer byteBuffer4, int i5, int i6, ByteBuffer byteBuffer5, int i7, int i8, ByteBuffer byteBuffer6, int i9, int i10, ByteBuffer byteBuffer7, ByteBuffer byteBuffer8, ByteBuffer byteBuffer9, int i11, int i12, int i13);

    private static native int nativeShiftPixel(ByteBuffer byteBuffer, int i, ByteBuffer byteBuffer2, int i2, ByteBuffer byteBuffer3, int i3, int i4, int i5, int i6, int i7, int i8, int i9, int i10);

    private static native int nativeWriteJpegToSurface(byte[] bArr, Surface surface);

    static {
        System.loadLibrary(JNI_LIB_NAME);
    }

    private ImageProcessingUtil() {
    }

    public static ImageProxy convertJpegBytesToImage(ImageReaderProxy jpegImageReaderProxy, byte[] jpegBytes) {
        Preconditions.checkArgument(jpegImageReaderProxy.getImageFormat() == 256);
        Preconditions.checkNotNull(jpegBytes);
        Surface surface = jpegImageReaderProxy.getSurface();
        Preconditions.checkNotNull(surface);
        if (nativeWriteJpegToSurface(jpegBytes, surface) != 0) {
            Logger.e(TAG, "Failed to enqueue JPEG image.");
            return null;
        }
        ImageProxy imageProxy = jpegImageReaderProxy.acquireLatestImage();
        if (imageProxy == null) {
            Logger.e(TAG, "Failed to get acquire JPEG image.");
        }
        return imageProxy;
    }

    public static void copyBitmapToByteBuffer(Bitmap bitmap, ByteBuffer byteBuffer, int bufferStride) {
        int bitmapStride = bitmap.getRowBytes();
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        nativeCopyBetweenByteBufferAndBitmap(bitmap, byteBuffer, bitmapStride, bufferStride, width, height, false);
    }

    public static void copyByteBufferToBitmap(Bitmap bitmap, ByteBuffer byteBuffer, int bufferStride) {
        int bitmapStride = bitmap.getRowBytes();
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        nativeCopyBetweenByteBufferAndBitmap(bitmap, byteBuffer, bufferStride, bitmapStride, width, height, true);
    }

    public static boolean writeJpegBytesToSurface(Surface surface, byte[] jpegBytes) {
        Preconditions.checkNotNull(jpegBytes);
        Preconditions.checkNotNull(surface);
        if (nativeWriteJpegToSurface(jpegBytes, surface) != 0) {
            Logger.e(TAG, "Failed to enqueue JPEG image.");
            return false;
        }
        return true;
    }

    public static boolean convertYuvToJpegBytesIntoSurface(Image image, int jpegQuality, int rotationDegrees, Surface outputSurface) {
        return convertYuvToJpegBytesIntoSurface(new AndroidImageProxy(image), jpegQuality, rotationDegrees, outputSurface);
    }

    public static boolean convertYuvToJpegBytesIntoSurface(ImageProxy imageProxy, int jpegQuality, int rotationDegrees, Surface outputSurface) {
        try {
            byte[] jpegBytes = ImageUtil.yuvImageToJpegByteArray(imageProxy, null, jpegQuality, rotationDegrees);
            return writeJpegBytesToSurface(outputSurface, jpegBytes);
        } catch (ImageUtil.CodecFailedException e) {
            Logger.e(TAG, "Failed to encode YUV to JPEG", e);
            return false;
        }
    }

    public static ImageProxy convertYUVToRGB(final ImageProxy imageProxy, ImageReaderProxy rgbImageReaderProxy, ByteBuffer rgbConvertedBuffer, int rotationDegrees, boolean onePixelShiftEnabled) {
        if (!isSupportedYUVFormat(imageProxy)) {
            Logger.e(TAG, "Unsupported format for YUV to RGB");
            return null;
        }
        long startTimeMillis = System.currentTimeMillis();
        if (!isSupportedRotationDegrees(rotationDegrees)) {
            Logger.e(TAG, "Unsupported rotation degrees for rotate RGB");
            return null;
        }
        Result result = convertYUVToRGBInternal(imageProxy, rgbImageReaderProxy.getSurface(), rgbConvertedBuffer, rotationDegrees, onePixelShiftEnabled);
        if (result == Result.ERROR_CONVERSION) {
            Logger.e(TAG, "YUV to RGB conversion failure");
            return null;
        }
        if (Log.isLoggable("MH", 3)) {
            Logger.d(TAG, String.format(Locale.US, "Image processing performance profiling, duration: [%d], image count: %d", Long.valueOf(System.currentTimeMillis() - startTimeMillis), Integer.valueOf(sImageCount)));
            sImageCount++;
        }
        final ImageProxy rgbImageProxy = rgbImageReaderProxy.acquireLatestImage();
        if (rgbImageProxy == null) {
            Logger.e(TAG, "YUV to RGB acquireLatestImage failure");
            return null;
        }
        SingleCloseImageProxy wrappedRgbImageProxy = new SingleCloseImageProxy(rgbImageProxy);
        wrappedRgbImageProxy.addOnImageCloseListener(new ForwardingImageProxy.OnImageCloseListener() { // da classe: androidx.camera.core.ImageProcessingUtil$$ExternalSyntheticLambda0
            @Override // androidx.camera.core.ForwardingImageProxy.OnImageCloseListener
            public final void onImageClose(ImageProxy imageProxy2) {
                ImageProcessingUtil.lambda$convertYUVToRGB$0(ImageProxy.this, imageProxy, imageProxy2);
            }
        });
        return wrappedRgbImageProxy;
    }

    static /* sintético */ void lambda$convertYUVToRGB$0(ImageProxy rgbImageProxy, ImageProxy imageProxy, ImageProxy image) {
        if (rgbImageProxy != null && imageProxy != null) {
            imageProxy.close();
        }
    }

    public static Bitmap convertYUVToBitmap(ImageProxy imageProxy) {
        if (imageProxy.getFormat() != 35) {
            throw new IllegalArgumentException("Input image format must be YUV_420_888");
        }
        int imageWidth = imageProxy.getWidth();
        int imageHeight = imageProxy.getHeight();
        int srcStrideY = imageProxy.getPlanes()[0].getRowStride();
        int srcStrideU = imageProxy.getPlanes()[1].getRowStride();
        int srcStrideV = imageProxy.getPlanes()[2].getRowStride();
        int srcPixelStrideY = imageProxy.getPlanes()[0].getPixelStride();
        int srcPixelStrideUV = imageProxy.getPlanes()[1].getPixelStride();
        Bitmap bitmap = Bitmap.createBitmap(imageProxy.getWidth(), imageProxy.getHeight(), Bitmap.Config.ARGB_8888);
        int bitmapStride = bitmap.getRowBytes();
        int result = nativeConvertAndroid420ToBitmap(imageProxy.getPlanes()[0].getBuffer(), srcStrideY, imageProxy.getPlanes()[1].getBuffer(), srcStrideU, imageProxy.getPlanes()[2].getBuffer(), srcStrideV, srcPixelStrideY, srcPixelStrideUV, bitmap, bitmapStride, imageWidth, imageHeight);
        if (result != 0) {
            throw new UnsupportedOperationException("YUV to RGB conversion failed");
        }
        return bitmap;
    }

    public static boolean applyPixelShiftForYUV(ImageProxy imageProxy) {
        if (!isSupportedYUVFormat(imageProxy)) {
            Logger.e(TAG, "Unsupported format for YUV to RGB");
            return false;
        }
        Result result = applyPixelShiftInternal(imageProxy);
        if (result == Result.ERROR_CONVERSION) {
            Logger.e(TAG, "One pixel shift for YUV failure");
            return false;
        }
        return true;
    }

    public static ImageProxy rotateYUV(ImageProxy imageProxy, ImageReaderProxy rotatedImageReaderProxy, ImageWriter rotatedImageWriter, ByteBuffer yRotatedBuffer, ByteBuffer uRotatedBuffer, ByteBuffer vRotatedBuffer, int rotationDegrees) {
        final ImageProxy imageProxy2;
        if (!isSupportedYUVFormat(imageProxy)) {
            Logger.e(TAG, "Unsupported format for rotate YUV");
            return null;
        }
        if (!isSupportedRotationDegrees(rotationDegrees)) {
            Logger.e(TAG, "Unsupported rotation degrees for rotate YUV");
            return null;
        }
        Result result = Result.ERROR_CONVERSION;
        if (rotationDegrees <= 0) {
            imageProxy2 = imageProxy;
        } else {
            imageProxy2 = imageProxy;
            result = rotateYUVInternal(imageProxy2, rotatedImageWriter, yRotatedBuffer, uRotatedBuffer, vRotatedBuffer, rotationDegrees);
        }
        if (result == Result.ERROR_CONVERSION) {
            Logger.e(TAG, "rotate YUV failure");
            return null;
        }
        final ImageProxy rotatedImageProxy = rotatedImageReaderProxy.acquireLatestImage();
        if (rotatedImageProxy == null) {
            Logger.e(TAG, "YUV rotation acquireLatestImage failure");
            return null;
        }
        SingleCloseImageProxy wrappedRotatedImageProxy = new SingleCloseImageProxy(rotatedImageProxy);
        wrappedRotatedImageProxy.addOnImageCloseListener(new ForwardingImageProxy.OnImageCloseListener() { // da classe: androidx.camera.core.ImageProcessingUtil$$ExternalSyntheticLambda1
            @Override // androidx.camera.core.ForwardingImageProxy.OnImageCloseListener
            public final void onImageClose(ImageProxy imageProxy3) {
                ImageProcessingUtil.lambda$rotateYUV$1(ImageProxy.this, imageProxy2, imageProxy3);
            }
        });
        return wrappedRotatedImageProxy;
    }

    static /* sintético */ void lambda$rotateYUV$1(ImageProxy rotatedImageProxy, ImageProxy imageProxy, ImageProxy image) {
        if (rotatedImageProxy != null && imageProxy != null) {
            imageProxy.close();
        }
    }

    public static ImageProxy rotateYUVAndConvertToNV21(ImageProxy imageProxy, ByteBuffer yRotatedBuffer, ByteBuffer uRotatedBuffer, ByteBuffer vRotatedBuffer, ByteBuffer nv21YDelegatedBuffer, ByteBuffer nv21UVDelegatedBuffer, int rotationDegrees) {
        if (!isSupportedYUVFormat(imageProxy)) {
            Logger.e(TAG, "Unsupported format for rotate YUV");
            return null;
        }
        if (!isSupportedRotationDegrees(rotationDegrees)) {
            Logger.e(TAG, "Unsupported rotation degrees for rotate YUV");
            return null;
        }
        if (rotationDegrees == 0 && isNV21FormatImage(imageProxy)) {
            return null;
        }
        int rotatedWidth = rotationDegrees % 180 == 0 ? imageProxy.getWidth() : imageProxy.getHeight();
        int rotatedHeight = rotationDegrees % 180 == 0 ? imageProxy.getHeight() : imageProxy.getWidth();
        ByteBuffer position1ChildByteBuffer = nativeNewDirectByteBuffer(nv21UVDelegatedBuffer, 1, nv21UVDelegatedBuffer.capacity());
        int result = nativeRotateYUV(imageProxy.getPlanes()[0].getBuffer(), imageProxy.getPlanes()[0].getRowStride(), imageProxy.getPlanes()[1].getBuffer(), imageProxy.getPlanes()[1].getRowStride(), imageProxy.getPlanes()[2].getBuffer(), imageProxy.getPlanes()[2].getRowStride(), imageProxy.getPlanes()[2].getPixelStride(), nv21YDelegatedBuffer, rotatedWidth, 1, position1ChildByteBuffer, rotatedWidth, 2, nv21UVDelegatedBuffer, rotatedWidth, 2, yRotatedBuffer, uRotatedBuffer, vRotatedBuffer, imageProxy.getWidth(), imageProxy.getHeight(), rotationDegrees);
        if (result != 0) {
            Logger.e(TAG, "rotate YUV failure");
            return null;
        }
        return new SingleCloseImageProxy(new NV21ImageProxy(imageProxy, nv21YDelegatedBuffer, position1ChildByteBuffer, nv21UVDelegatedBuffer, rotatedWidth, rotatedHeight, rotationDegrees));
    }

    private static boolean isSupportedYUVFormat(ImageProxy imageProxy) {
        return imageProxy.getFormat() == 35 && imageProxy.getPlanes().length == 3;
    }

    private static boolean isSupportedRotationDegrees(int rotationDegrees) {
        return rotationDegrees == 0 || rotationDegrees == 90 || rotationDegrees == 180 || rotationDegrees == 270;
    }

    private static Result convertYUVToRGBInternal(ImageProxy imageProxy, Surface surface, ByteBuffer rgbConvertedBuffer, int rotation, boolean onePixelShiftEnabled) {
        int imageWidth = imageProxy.getWidth();
        int imageHeight = imageProxy.getHeight();
        int srcStrideY = imageProxy.getPlanes()[0].getRowStride();
        int srcStrideU = imageProxy.getPlanes()[1].getRowStride();
        int srcStrideV = imageProxy.getPlanes()[2].getRowStride();
        int srcPixelStrideY = imageProxy.getPlanes()[0].getPixelStride();
        int srcPixelStrideUV = imageProxy.getPlanes()[1].getPixelStride();
        int startOffsetY = onePixelShiftEnabled ? srcPixelStrideY : 0;
        int startOffsetU = onePixelShiftEnabled ? srcPixelStrideUV : 0;
        int startOffsetV = onePixelShiftEnabled ? srcPixelStrideUV : 0;
        int result = nativeConvertAndroid420ToABGR(imageProxy.getPlanes()[0].getBuffer(), srcStrideY, imageProxy.getPlanes()[1].getBuffer(), srcStrideU, imageProxy.getPlanes()[2].getBuffer(), srcStrideV, srcPixelStrideY, srcPixelStrideUV, surface, rgbConvertedBuffer, imageWidth, imageHeight, startOffsetY, startOffsetU, startOffsetV, rotation);
        if (result != 0) {
            return Result.ERROR_CONVERSION;
        }
        return Result.SUCCESS;
    }

    private static Result applyPixelShiftInternal(ImageProxy imageProxy) {
        int imageWidth = imageProxy.getWidth();
        int imageHeight = imageProxy.getHeight();
        int srcStrideY = imageProxy.getPlanes()[0].getRowStride();
        int srcStrideU = imageProxy.getPlanes()[1].getRowStride();
        int srcStrideV = imageProxy.getPlanes()[2].getRowStride();
        int srcPixelStrideY = imageProxy.getPlanes()[0].getPixelStride();
        int srcPixelStrideUV = imageProxy.getPlanes()[1].getPixelStride();
        int result = nativeShiftPixel(imageProxy.getPlanes()[0].getBuffer(), srcStrideY, imageProxy.getPlanes()[1].getBuffer(), srcStrideU, imageProxy.getPlanes()[2].getBuffer(), srcStrideV, srcPixelStrideY, srcPixelStrideUV, imageWidth, imageHeight, srcPixelStrideY, srcPixelStrideUV, srcPixelStrideUV);
        if (result != 0) {
            return Result.ERROR_CONVERSION;
        }
        return Result.SUCCESS;
    }

    private static Result rotateYUVInternal(ImageProxy imageProxy, ImageWriter rotatedImageWriter, ByteBuffer yRotatedBuffer, ByteBuffer uRotatedBuffer, ByteBuffer vRotatedBuffer, int rotationDegrees) {
        int imageWidth = imageProxy.getWidth();
        int imageHeight = imageProxy.getHeight();
        int srcStrideY = imageProxy.getPlanes()[0].getRowStride();
        int srcStrideU = imageProxy.getPlanes()[1].getRowStride();
        int srcStrideV = imageProxy.getPlanes()[2].getRowStride();
        int srcPixelStrideUV = imageProxy.getPlanes()[1].getPixelStride();
        Image rotatedImage = ImageWriterCompat.dequeueInputImage(rotatedImageWriter);
        if (rotatedImage == null) {
            return Result.ERROR_CONVERSION;
        }
        int result = nativeRotateYUV(imageProxy.getPlanes()[0].getBuffer(), srcStrideY, imageProxy.getPlanes()[1].getBuffer(), srcStrideU, imageProxy.getPlanes()[2].getBuffer(), srcStrideV, srcPixelStrideUV, rotatedImage.getPlanes()[0].getBuffer(), rotatedImage.getPlanes()[0].getRowStride(), rotatedImage.getPlanes()[0].getPixelStride(), rotatedImage.getPlanes()[1].getBuffer(), rotatedImage.getPlanes()[1].getRowStride(), rotatedImage.getPlanes()[1].getPixelStride(), rotatedImage.getPlanes()[2].getBuffer(), rotatedImage.getPlanes()[2].getRowStride(), rotatedImage.getPlanes()[2].getPixelStride(), yRotatedBuffer, uRotatedBuffer, vRotatedBuffer, imageWidth, imageHeight, rotationDegrees);
        if (result != 0) {
            return Result.ERROR_CONVERSION;
        }
        ImageWriterCompat.queueInputImage(rotatedImageWriter, rotatedImage);
        return Result.SUCCESS;
    }

    public static boolean isNV21FormatImage(ImageProxy imageProxy) {
        return imageProxy.getPlanes().length == 3 && imageProxy.getPlanes()[1].getPixelStride() == 2 && nativeGetYUVImageVUOff(imageProxy.getPlanes()[2].getBuffer(), imageProxy.getPlanes()[1].getBuffer()) == -1;
    }

    private static class NV21ImageProxy extends ForwardingImageProxy {
        private final int mHeight;
        private final ImageProxy.PlaneProxy[] mPlanes;
        private final int mWidth;

        NV21ImageProxy(ImageProxy imageProxy, ByteBuffer delegateBufferY, ByteBuffer delegateBufferU, ByteBuffer delegateBufferV, int width, int height, int rotatedRotationDegrees) {
            super(imageProxy);
            this.mPlanes = createPlanes(delegateBufferY, delegateBufferU, delegateBufferV, width);
            this.mWidth = width;
            this.mHeight = height;
        }

        @Override // androidx.camera.core.ForwardingImageProxy, androidx.camera.core.ImageProxy
        public int getHeight() {
            return this.mHeight;
        }

        @Override // androidx.camera.core.ForwardingImageProxy, androidx.camera.core.ImageProxy
        public int getWidth() {
            return this.mWidth;
        }

        @Override // androidx.camera.core.ForwardingImageProxy, androidx.camera.core.ImageProxy
        public ImageProxy.PlaneProxy[] getPlanes() {
            return this.mPlanes;
        }

        private ImageProxy.PlaneProxy[] createPlanes(final ByteBuffer delegateBufferY, ByteBuffer delegateBufferU, ByteBuffer delegateBufferV, final int rowStride) {
            ImageProxy.PlaneProxy[] planes = {new ImageProxy.PlaneProxy() { // da classe: androidx.camera.core.ImageProcessingUtil.NV21ImageProxy.1
                @Override // androidx.camera.core.ImageProxy.PlaneProxy
                public int getRowStride() {
                    return rowStride;
                }

                @Override // androidx.camera.core.ImageProxy.PlaneProxy
                public int getPixelStride() {
                    return 1;
                }

                @Override // androidx.camera.core.ImageProxy.PlaneProxy
                public ByteBuffer getBuffer() {
                    return delegateBufferY;
                }
            }, new NV21PlaneProxy(delegateBufferU, rowStride), new NV21PlaneProxy(delegateBufferV, rowStride)};
            return planes;
        }
    }

    private static class NV21PlaneProxy implements ImageProxy.PlaneProxy {
        private final ByteBuffer mByteBuffer;
        private final int mRowStride;

        NV21PlaneProxy(ByteBuffer byteBuffer, int rowStride) {
            this.mByteBuffer = byteBuffer;
            this.mRowStride = rowStride;
        }

        @Override // androidx.camera.core.ImageProxy.PlaneProxy
        public int getRowStride() {
            return this.mRowStride;
        }

        @Override // androidx.camera.core.ImageProxy.PlaneProxy
        public int getPixelStride() {
            return 2;
        }

        @Override // androidx.camera.core.ImageProxy.PlaneProxy
        public ByteBuffer getBuffer() {
            return this.mByteBuffer;
        }
    }
}
