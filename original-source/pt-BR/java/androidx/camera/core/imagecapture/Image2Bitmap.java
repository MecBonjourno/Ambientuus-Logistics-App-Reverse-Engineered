package androidx.camera.core.imagecapture;

import android.graphics.Bitmap;
import androidx.camera.core.ImageCaptureException;
import androidx.camera.core.ImageProcessingUtil;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.ImageReaderProxys;
import androidx.camera.core.SafeCloseImageReaderProxy;
import androidx.camera.core.internal.utils.ImageUtil;
import androidx.camera.core.processing.Operation;
import androidx.camera.core.processing.Packet;
import java.nio.ByteBuffer;

/* carregado de: classes.dex */
public class Image2Bitmap implements Operation<Packet<ImageProxy>, Bitmap> {
    @Override // androidx.camera.core.processing.Operation
    public Bitmap apply(Packet<ImageProxy> imageProxyPacket) throws ImageCaptureException {
        Bitmap result;
        SafeCloseImageReaderProxy rgbImageReader = null;
        try {
            try {
                int imageFormat = imageProxyPacket.getFormat();
                if (imageFormat == 35) {
                    ImageProxy yuvImage = imageProxyPacket.getData();
                    boolean needFlip = imageProxyPacket.getRotationDegrees() % 180 != 0;
                    int tempImageReaderWidth = needFlip ? yuvImage.getHeight() : yuvImage.getWidth();
                    int tempImageReaderHeight = needFlip ? yuvImage.getWidth() : yuvImage.getHeight();
                    rgbImageReader = new SafeCloseImageReaderProxy(ImageReaderProxys.createIsolatedReader(tempImageReaderWidth, tempImageReaderHeight, 1, 2));
                    ByteBuffer rgbConvertedBuffer = ByteBuffer.allocateDirect(yuvImage.getWidth() * yuvImage.getHeight() * 4);
                    ImageProxy imageProxyRGB = ImageProcessingUtil.convertYUVToRGB(yuvImage, rgbImageReader, rgbConvertedBuffer, imageProxyPacket.getRotationDegrees(), false);
                    yuvImage.close();
                    if (imageProxyRGB == null) {
                        throw new ImageCaptureException(0, "Can't covert YUV to RGB", null);
                    }
                    result = ImageUtil.createBitmapFromImageProxy(imageProxyRGB);
                    imageProxyRGB.close();
                } else {
                    if (imageFormat != 256 && imageFormat != 4101) {
                        throw new IllegalArgumentException("Invalid postview image format : " + imageProxyPacket.getFormat());
                    }
                    ImageProxy jpegImage = imageProxyPacket.getData();
                    Bitmap bitmap = ImageUtil.createBitmapFromImageProxy(jpegImage);
                    jpegImage.close();
                    result = ImageUtil.rotateBitmap(bitmap, imageProxyPacket.getRotationDegrees());
                }
                return result;
            } catch (UnsupportedOperationException e) {
                String format = imageProxyPacket.getFormat() == 35 ? "YUV" : "JPEG";
                throw new ImageCaptureException(0, "Can't convert " + format + " to bitmap", e);
            }
        } finally {
            if (0 != 0) {
                rgbImageReader.close();
            }
        }
    }
}
