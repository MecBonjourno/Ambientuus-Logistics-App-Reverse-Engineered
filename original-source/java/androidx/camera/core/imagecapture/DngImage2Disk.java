package androidx.camera.core.imagecapture;

import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.DngCreator;
import android.net.Uri;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.ImageCaptureException;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.processing.Operation;
import com.google.zxing.pdf417.PDF417Common;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/* loaded from: classes.dex */
public class DngImage2Disk implements Operation<In, ImageCapture.OutputFileResults> {
    private DngCreator mDngCreator;

    public DngImage2Disk(CameraCharacteristics cameraCharacteristics, CaptureResult captureResult) {
        this(new DngCreator(cameraCharacteristics, captureResult));
    }

    DngImage2Disk(DngCreator dngCreator) {
        this.mDngCreator = dngCreator;
    }

    @Override // androidx.camera.core.processing.Operation
    public ImageCapture.OutputFileResults apply(In in) throws ImageCaptureException {
        ImageCapture.OutputFileOptions options = in.getOutputFileOptions();
        File tempFile = FileUtil.createTempFile(options);
        writeImageToFile(tempFile, in.getImageProxy(), in.getRotationDegrees());
        Uri uri = FileUtil.moveFileToTarget(tempFile, options);
        return new ImageCapture.OutputFileResults(uri, 32);
    }

    private void writeImageToFile(File tempFile, ImageProxy imageProxy, int rotationDegrees) throws ImageCaptureException {
        try {
            try {
                try {
                    FileOutputStream output = new FileOutputStream(tempFile);
                    try {
                        this.mDngCreator.setOrientation(computeExifOrientation(rotationDegrees));
                        this.mDngCreator.writeImage(output, imageProxy.getImage());
                        output.close();
                    } catch (Throwable th) {
                        try {
                            output.close();
                        } catch (Throwable th2) {
                            th.addSuppressed(th2);
                        }
                        throw th;
                    }
                } catch (IOException e) {
                    throw new ImageCaptureException(1, "Failed to write to temp file", e);
                }
            } catch (IllegalArgumentException e2) {
                throw new ImageCaptureException(1, "Image with an unsupported format was used", e2);
            } catch (IllegalStateException e3) {
                throw new ImageCaptureException(1, "Not enough metadata information has been set to write a well-formatted DNG file", e3);
            }
        } finally {
            imageProxy.close();
        }
    }

    static int computeExifOrientation(int rotationDegrees) {
        switch (rotationDegrees) {
            case 0:
                return 1;
            case PDF417Common.MAX_ROWS_IN_BARCODE /* 90 */:
                return 6;
            case 180:
                return 3;
            case 270:
                return 8;
            default:
                return 0;
        }
    }

    static abstract class In {
        abstract ImageProxy getImageProxy();

        abstract ImageCapture.OutputFileOptions getOutputFileOptions();

        abstract int getRotationDegrees();

        In() {
        }

        static In of(ImageProxy imageProxy, int rotationDegrees, ImageCapture.OutputFileOptions outputFileOptions) {
            return new AutoValue_DngImage2Disk_In(imageProxy, rotationDegrees, outputFileOptions);
        }
    }
}
