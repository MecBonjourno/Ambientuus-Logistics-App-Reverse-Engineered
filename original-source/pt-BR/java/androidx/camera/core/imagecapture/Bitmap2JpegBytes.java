package androidx.camera.core.imagecapture;

import android.graphics.Bitmap;
import android.os.Build;
import androidx.camera.core.ImageCaptureException;
import androidx.camera.core.impl.utils.Exif;
import androidx.camera.core.processing.Operation;
import androidx.camera.core.processing.Packet;
import j$.util.Objects;
import java.io.ByteArrayOutputStream;

/* carregado de: classes.dex */
public class Bitmap2JpegBytes implements Operation<In, Packet<byte[]>> {
    @Override // androidx.camera.core.processing.Operation
    public Packet<byte[]> apply(In in) throws ImageCaptureException {
        Packet<Bitmap> packet = in.getPacket();
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        packet.getData().compress(Bitmap.CompressFormat.JPEG, in.getJpegQuality(), outputStream);
        return Packet.of(outputStream.toByteArray(), (Exif) Objects.requireNonNull(packet.getExif()), getOutputFormat(packet.getData()), packet.getSize(), packet.getCropRect(), packet.getRotationDegrees(), packet.getSensorToBufferTransform(), packet.getCameraCaptureResult());
    }

    private static int getOutputFormat(Bitmap bitmap) {
        if (Build.VERSION.SDK_INT >= 34 && Api34Impl.hasGainmap(bitmap)) {
            return 4101;
        }
        return 256;
    }

    private static class Api34Impl {
        static boolean hasGainmap(Bitmap bitmap) {
            return bitmap.hasGainmap();
        }

        private Api34Impl() {
        }
    }

    public static abstract class In {
        abstract int getJpegQuality();

        abstract Packet<Bitmap> getPacket();

        public static In of(Packet<Bitmap> imagePacket, int jpegQuality) {
            return new AutoValue_Bitmap2JpegBytes_In(imagePacket, jpegQuality);
        }
    }
}
