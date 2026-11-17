package org.chromium.base;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import j$.util.function.Function$CC;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileDescriptor;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Locale;
import java.util.function.Function;
import org.chromium.base.annotations.JNINamespace;

@JNINamespace("base::android")
/* loaded from: classes17.dex */
public class FileUtils {
    public static Function<String, Boolean> DELETE_ALL = new Function() { // from class: org.chromium.base.FileUtils$$ExternalSyntheticLambda0
        @Override // java.util.function.Function
        public /* synthetic */ Function andThen(Function function) {
            return Function$CC.$default$andThen(this, function);
        }

        @Override // java.util.function.Function
        public final Object apply(Object obj) {
            return FileUtils.lambda$static$0((String) obj);
        }

        @Override // java.util.function.Function
        public /* synthetic */ Function compose(Function function) {
            return Function$CC.$default$compose(this, function);
        }
    };
    private static final String TAG = "FileUtils";

    public interface Natives {
        String getAbsoluteFilePath(String str);
    }

    static /* synthetic */ Boolean lambda$static$0(String filepath) {
        return true;
    }

    public static boolean recursivelyDeleteFile(File currentFile, Function<String, Boolean> canDelete) {
        File[] files;
        if (!currentFile.exists()) {
            currentFile.delete();
            return true;
        }
        if (canDelete != null && !canDelete.apply(currentFile.getPath()).booleanValue()) {
            return true;
        }
        if (currentFile.isDirectory() && (files = currentFile.listFiles()) != null) {
            for (File file : files) {
                recursivelyDeleteFile(file, canDelete);
            }
        }
        boolean ret = currentFile.delete();
        if (!ret) {
            Log.e(TAG, "Failed to delete: %s", currentFile);
        }
        return ret;
    }

    public static void batchDeleteFiles(List<String> filePaths, Function<String, Boolean> canDelete) {
        for (String filePath : filePaths) {
            if (canDelete == null || canDelete.apply(filePath).booleanValue()) {
                if (ContentUriUtils.isContentUri(filePath)) {
                    ContentUriUtils.delete(filePath);
                } else {
                    File file = new File(filePath);
                    if (file.exists()) {
                        recursivelyDeleteFile(file, canDelete);
                    }
                }
            }
        }
    }

    public static long getFileSizeBytes(File file) {
        if (file == null) {
            return 0L;
        }
        if (file.isDirectory()) {
            long size = 0;
            File[] files = file.listFiles();
            if (files == null) {
                return 0L;
            }
            for (File f : files) {
                size += getFileSizeBytes(f);
            }
            return size;
        }
        long size2 = file.length();
        return size2;
    }

    public static void copyStream(InputStream inputStream, OutputStream outputStream) throws IOException {
        byte[] buffer = new byte[8192];
        while (true) {
            int amountRead = inputStream.read(buffer);
            if (amountRead != -1) {
                outputStream.write(buffer, 0, amountRead);
            } else {
                return;
            }
        }
    }

    public static void copyStreamToFile(InputStream is, File outFile) throws IOException {
        File tmpOutputFile = new File(outFile.getPath() + ".tmp");
        OutputStream os = new FileOutputStream(tmpOutputFile);
        try {
            Log.i(TAG, "Writing to %s", outFile);
            copyStream(is, os);
            os.close();
            if (!tmpOutputFile.renameTo(outFile)) {
                throw new IOException();
            }
        } catch (Throwable th) {
            try {
                os.close();
            } catch (Throwable th2) {
                th.addSuppressed(th2);
            }
            throw th;
        }
    }

    public static byte[] readStream(InputStream inputStream) throws IOException {
        ByteArrayOutputStream data = new ByteArrayOutputStream();
        copyStream(inputStream, data);
        return data.toByteArray();
    }

    public static Uri getUriForFile(File file) {
        Uri uri = null;
        try {
            uri = ContentUriUtils.getContentUriFromFile(file);
        } catch (IllegalArgumentException e) {
            Log.e(TAG, "Could not create content uri: " + e);
        }
        if (uri == null) {
            Uri uri2 = Uri.fromFile(file);
            return uri2;
        }
        return uri;
    }

    public static String getExtension(String file) {
        int lastSep = file.lastIndexOf(47);
        int lastDot = file.lastIndexOf(46);
        return lastSep >= lastDot ? "" : file.substring(lastDot + 1).toLowerCase(Locale.US);
    }

    public static Bitmap queryBitmapFromContentProvider(Context context, Uri uri) {
        try {
            ParcelFileDescriptor parcelFileDescriptor = context.getContentResolver().openFileDescriptor(uri, "r");
            try {
                if (parcelFileDescriptor == null) {
                    Log.w(TAG, "Null ParcelFileDescriptor from uri " + uri);
                    if (parcelFileDescriptor != null) {
                        parcelFileDescriptor.close();
                    }
                    return null;
                }
                FileDescriptor fileDescriptor = parcelFileDescriptor.getFileDescriptor();
                if (fileDescriptor == null) {
                    Log.w(TAG, "Null FileDescriptor from uri " + uri);
                    if (parcelFileDescriptor != null) {
                        parcelFileDescriptor.close();
                    }
                    return null;
                }
                Bitmap bitmap = BitmapFactory.decodeFileDescriptor(fileDescriptor);
                if (bitmap != null) {
                    if (parcelFileDescriptor != null) {
                        parcelFileDescriptor.close();
                    }
                    return bitmap;
                }
                Log.w(TAG, "Failed to decode image from uri " + uri);
                if (parcelFileDescriptor != null) {
                    parcelFileDescriptor.close();
                }
                return null;
            } finally {
            }
        } catch (IOException e) {
            Log.w(TAG, "IO exception when reading uri " + uri);
            return null;
        }
    }

    public static String getAbsoluteFilePath(String filePath) {
        return FileUtilsJni.get().getAbsoluteFilePath(filePath);
    }
}
