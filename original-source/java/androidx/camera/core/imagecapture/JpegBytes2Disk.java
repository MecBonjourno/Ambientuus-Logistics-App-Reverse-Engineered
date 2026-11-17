package androidx.camera.core.imagecapture;

import android.net.Uri;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.ImageCaptureException;
import androidx.camera.core.impl.utils.Exif;
import androidx.camera.core.internal.compat.workaround.InvalidJpegDataParser;
import androidx.camera.core.processing.Operation;
import androidx.camera.core.processing.Packet;
import j$.util.Objects;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/* loaded from: classes.dex */
public class JpegBytes2Disk implements Operation<In, ImageCapture.OutputFileResults> {
    @Override // androidx.camera.core.processing.Operation
    public ImageCapture.OutputFileResults apply(In in) throws ImageCaptureException {
        Packet<byte[]> packet = in.getPacket();
        ImageCapture.OutputFileOptions options = in.getOutputFileOptions();
        File tempFile = FileUtil.createTempFile(options);
        writeBytesToFile(tempFile, packet.getData());
        FileUtil.updateFileExif(tempFile, (Exif) Objects.requireNonNull(packet.getExif()), options, packet.getRotationDegrees());
        Uri uri = FileUtil.moveFileToTarget(tempFile, options);
        return new ImageCapture.OutputFileResults(uri, 256);
    }

    static void writeBytesToFile(File tempFile, byte[] bytes) throws ImageCaptureException {
        try {
            FileOutputStream output = new FileOutputStream(tempFile);
            try {
                InvalidJpegDataParser invalidJpegDataParser = new InvalidJpegDataParser();
                output.write(bytes, 0, invalidJpegDataParser.getValidDataLength(bytes));
                output.close();
            } finally {
            }
        } catch (IOException e) {
            throw new ImageCaptureException(1, "Failed to write to temp file", e);
        }
    }

    public static abstract class In {
        abstract ImageCapture.OutputFileOptions getOutputFileOptions();

        abstract Packet<byte[]> getPacket();

        public static In of(Packet<byte[]> jpegBytes, ImageCapture.OutputFileOptions outputFileOptions) {
            return new AutoValue_JpegBytes2Disk_In(jpegBytes, outputFileOptions);
        }
    }
}
