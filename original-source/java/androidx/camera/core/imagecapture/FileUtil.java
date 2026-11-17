package androidx.camera.core.imagecapture;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.net.Uri;
import android.os.Build;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.ImageCaptureException;
import androidx.camera.core.impl.utils.Exif;
import j$.util.Objects;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

/* loaded from: classes.dex */
public final class FileUtil {
    private static final int COPY_BUFFER_SIZE = 1024;
    private static final int NOT_PENDING = 0;
    private static final int PENDING = 1;
    private static final String TEMP_FILE_PREFIX = "CameraX";
    private static final String TEMP_FILE_SUFFIX = ".tmp";

    private FileUtil() {
    }

    static File createTempFile(ImageCapture.OutputFileOptions options) throws ImageCaptureException {
        try {
            File appProvidedFile = options.getFile();
            if (appProvidedFile == null) {
                return File.createTempFile(TEMP_FILE_PREFIX, TEMP_FILE_SUFFIX);
            }
            return new File(appProvidedFile.getParent(), TEMP_FILE_PREFIX + UUID.randomUUID().toString() + getFileExtensionWithDot(appProvidedFile));
        } catch (IOException e) {
            throw new ImageCaptureException(1, "Failed to create temp file.", e);
        }
    }

    static void updateFileExif(File tempFile, Exif originalExif, ImageCapture.OutputFileOptions options, int rotationDegrees) throws ImageCaptureException {
        try {
            Exif exif = Exif.createFromFile(tempFile);
            originalExif.copyToCroppedImage(exif);
            if (exif.getRotation() == 0 && rotationDegrees != 0) {
                exif.rotate(rotationDegrees);
            }
            ImageCapture.Metadata metadata = options.getMetadata();
            if (metadata.isReversedHorizontal()) {
                exif.flipHorizontally();
            }
            if (metadata.isReversedVertical()) {
                exif.flipVertically();
            }
            if (metadata.getLocation() != null) {
                exif.attachLocation(metadata.getLocation());
            }
            exif.save();
        } catch (IOException e) {
            throw new ImageCaptureException(1, "Failed to update Exif data", e);
        }
    }

    static Uri moveFileToTarget(File tempFile, ImageCapture.OutputFileOptions options) throws ImageCaptureException {
        Uri uri = null;
        try {
            try {
                if (isSaveToMediaStore(options)) {
                    uri = copyFileToMediaStore(tempFile, options);
                } else if (isSaveToOutputStream(options)) {
                    copyFileToOutputStream(tempFile, (OutputStream) Objects.requireNonNull(options.getOutputStream()));
                } else if (isSaveToFile(options)) {
                    uri = copyFileToFile(tempFile, (File) Objects.requireNonNull(options.getFile()));
                }
                return uri;
            } catch (IOException e) {
                throw new ImageCaptureException(1, "Failed to write to OutputStream.", null);
            }
        } finally {
            tempFile.delete();
        }
    }

    private static String getFileExtensionWithDot(File file) {
        String fileName = file.getName();
        int dotIndex = fileName.lastIndexOf(46);
        if (dotIndex >= 0) {
            return fileName.substring(dotIndex);
        }
        return "";
    }

    private static Uri copyFileToMediaStore(File file, ImageCapture.OutputFileOptions options) throws ImageCaptureException {
        ContentValues values;
        ContentResolver contentResolver = (ContentResolver) Objects.requireNonNull(options.getContentResolver());
        if (options.getContentValues() != null) {
            values = new ContentValues(options.getContentValues());
        } else {
            values = new ContentValues();
        }
        setContentValuePendingFlag(values, 1);
        Uri uri = null;
        try {
            try {
                uri = contentResolver.insert(options.getSaveCollection(), values);
                if (uri == null) {
                    throw new ImageCaptureException(1, "Failed to insert a MediaStore URI.", null);
                }
                copyTempFileToUri(file, uri, contentResolver);
                return uri;
            } finally {
                if (uri != null) {
                    updateUriPendingStatus(uri, contentResolver, 0);
                }
            }
        } catch (IOException | SecurityException e) {
            throw new ImageCaptureException(1, "Failed to write to MediaStore URI: " + uri, e);
        }
    }

    private static Uri copyFileToFile(File source, File target) throws ImageCaptureException {
        if (target.exists()) {
            target.delete();
        }
        if (!source.renameTo(target)) {
            throw new ImageCaptureException(1, "Failed to overwrite the file: " + target.getAbsolutePath(), null);
        }
        return Uri.fromFile(target);
    }

    private static void copyTempFileToUri(File tempFile, Uri uri, ContentResolver contentResolver) throws IOException {
        OutputStream outputStream = contentResolver.openOutputStream(uri);
        try {
            if (outputStream == null) {
                throw new FileNotFoundException(uri + " cannot be resolved.");
            }
            copyFileToOutputStream(tempFile, outputStream);
            if (outputStream != null) {
                outputStream.close();
            }
        } catch (Throwable th) {
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                }
            }
            throw th;
        }
    }

    private static void copyFileToOutputStream(File file, OutputStream outputStream) throws IOException {
        InputStream in = new FileInputStream(file);
        try {
            byte[] buf = new byte[1024];
            while (true) {
                int len = in.read(buf);
                if (len > 0) {
                    outputStream.write(buf, 0, len);
                } else {
                    in.close();
                    return;
                }
            }
        } catch (Throwable th) {
            try {
                in.close();
            } catch (Throwable th2) {
                th.addSuppressed(th2);
            }
            throw th;
        }
    }

    private static void updateUriPendingStatus(Uri outputUri, ContentResolver contentResolver, int isPending) {
        if (Build.VERSION.SDK_INT >= 29) {
            ContentValues values = new ContentValues();
            setContentValuePendingFlag(values, isPending);
            contentResolver.update(outputUri, values, null, null);
        }
    }

    private static void setContentValuePendingFlag(ContentValues values, int isPending) {
        if (Build.VERSION.SDK_INT >= 29) {
            values.put("is_pending", Integer.valueOf(isPending));
        }
    }

    private static boolean isSaveToMediaStore(ImageCapture.OutputFileOptions outputFileOptions) {
        return (outputFileOptions.getSaveCollection() == null || outputFileOptions.getContentResolver() == null || outputFileOptions.getContentValues() == null) ? false : true;
    }

    private static boolean isSaveToFile(ImageCapture.OutputFileOptions outputFileOptions) {
        return outputFileOptions.getFile() != null;
    }

    private static boolean isSaveToOutputStream(ImageCapture.OutputFileOptions outputFileOptions) {
        return outputFileOptions.getOutputStream() != null;
    }
}
