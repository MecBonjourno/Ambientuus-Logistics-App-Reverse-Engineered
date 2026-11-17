package com.google.mlkit.vision.common;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.media.Image;
import android.net.Uri;
import android.os.SystemClock;
import com.google.android.gms.common.internal.Preconditions;
import com.google.android.gms.internal.mlkit_vision_common.zzms;
import com.google.android.gms.internal.mlkit_vision_common.zzmu;
import com.google.mlkit.common.sdkinternal.MLTaskInput;
import com.google.mlkit.vision.common.internal.ImageConvertUtils;
import com.google.mlkit.vision.common.internal.ImageUtils;
import java.io.IOException;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.nio.ByteBuffer;

/* compiled from: com.google.mlkit:vision-common@@17.3.0 */
/* loaded from: classes16.dex */
public class InputImage implements MLTaskInput {
    public static final int IMAGE_FORMAT_BITMAP = -1;
    public static final int IMAGE_FORMAT_NV21 = 17;
    public static final int IMAGE_FORMAT_YUV_420_888 = 35;
    public static final int IMAGE_FORMAT_YV12 = 842094169;
    private volatile Bitmap zza;
    private volatile ByteBuffer zzb;
    private volatile zzb zzc;
    private final int zzd;
    private final int zze;
    private final int zzf;
    private final int zzg;
    private final Matrix zzh;

    /* compiled from: com.google.mlkit:vision-common@@17.3.0 */
    @Retention(RetentionPolicy.CLASS)
    public @interface ImageFormat {
    }

    private InputImage(Bitmap bitmap, int i) {
        this.zza = (Bitmap) Preconditions.checkNotNull(bitmap);
        this.zzd = bitmap.getWidth();
        this.zze = bitmap.getHeight();
        zza(i);
        this.zzf = i;
        this.zzg = -1;
        this.zzh = null;
    }

    public static InputImage fromBitmap(Bitmap bitmap, int rotationDegrees) {
        long elapsedRealtime = SystemClock.elapsedRealtime();
        InputImage inputImage = new InputImage(bitmap, rotationDegrees);
        zzc(-1, 1, elapsedRealtime, bitmap.getHeight(), bitmap.getWidth(), bitmap.getAllocationByteCount(), rotationDegrees);
        return inputImage;
    }

    public static InputImage fromByteArray(byte[] byteArray, int width, int height, int rotationDegrees, int format) {
        long elapsedRealtime = SystemClock.elapsedRealtime();
        InputImage inputImage = new InputImage(ByteBuffer.wrap((byte[]) Preconditions.checkNotNull(byteArray)), width, height, rotationDegrees, format);
        zzc(format, 2, elapsedRealtime, height, width, byteArray.length, rotationDegrees);
        return inputImage;
    }

    public static InputImage fromByteBuffer(ByteBuffer byteBuffer, int width, int height, int rotationDegrees, int format) {
        long elapsedRealtime = SystemClock.elapsedRealtime();
        InputImage inputImage = new InputImage(byteBuffer, width, height, rotationDegrees, format);
        zzc(format, 3, elapsedRealtime, height, width, byteBuffer.limit(), rotationDegrees);
        return inputImage;
    }

    public static InputImage fromFilePath(Context context, Uri imageUri) throws IOException {
        Preconditions.checkNotNull(context, "Please provide a valid Context");
        Preconditions.checkNotNull(imageUri, "Please provide a valid imageUri");
        long elapsedRealtime = SystemClock.elapsedRealtime();
        Bitmap zza = ImageUtils.getInstance().zza(context.getContentResolver(), imageUri);
        InputImage inputImage = new InputImage(zza, 0);
        zzc(-1, 4, elapsedRealtime, zza.getHeight(), zza.getWidth(), zza.getAllocationByteCount(), 0);
        return inputImage;
    }

    public static InputImage fromMediaImage(Image image, int rotationDegrees) {
        return zzb(image, rotationDegrees, null);
    }

    private static int zza(int i) {
        boolean z = true;
        if (i != 0 && i != 90 && i != 180) {
            if (i == 270) {
                i = 270;
            } else {
                z = false;
            }
        }
        Preconditions.checkArgument(z, "Invalid rotation. Only 0, 90, 180, 270 are supported currently.");
        return i;
    }

    private static InputImage zzb(Image image, int i, Matrix matrix) {
        Image image2;
        int i2;
        InputImage inputImage;
        int limit;
        long elapsedRealtime = SystemClock.elapsedRealtime();
        Preconditions.checkNotNull(image, "Please provide a valid image");
        zza(i);
        boolean z = true;
        if (image.getFormat() != 256 && image.getFormat() != 35) {
            z = false;
        }
        Preconditions.checkArgument(z, "Only JPEG and YUV_420_888 are supported now");
        Image.Plane[] planes = image.getPlanes();
        if (image.getFormat() == 256) {
            int limit2 = image.getPlanes()[0].getBuffer().limit();
            image2 = image;
            i2 = i;
            inputImage = new InputImage(ImageConvertUtils.getInstance().convertJpegToUpRightBitmap(image, i), 0);
            limit = limit2;
        } else {
            for (Image.Plane plane : planes) {
                if (plane.getBuffer() != null) {
                    plane.getBuffer().rewind();
                }
            }
            image2 = image;
            i2 = i;
            inputImage = new InputImage(image2, image.getWidth(), image.getHeight(), i2, matrix);
            limit = (image2.getPlanes()[0].getBuffer().limit() * 3) / 2;
        }
        zzc(image2.getFormat(), 5, elapsedRealtime, image2.getHeight(), image2.getWidth(), limit, i2);
        return inputImage;
    }

    private static void zzc(int i, int i2, long j, int i3, int i4, int i5, int i6) {
        zzmu.zza(zzms.zzb("vision-common"), i, i2, j, i3, i4, i5, i6);
    }

    public Bitmap getBitmapInternal() {
        return this.zza;
    }

    public ByteBuffer getByteBuffer() {
        return this.zzb;
    }

    public Matrix getCoordinatesMatrix() {
        return this.zzh;
    }

    public int getFormat() {
        return this.zzg;
    }

    public int getHeight() {
        return this.zze;
    }

    public Image getMediaImage() {
        if (this.zzc == null) {
            return null;
        }
        return this.zzc.zza();
    }

    public Image.Plane[] getPlanes() {
        if (this.zzc == null) {
            return null;
        }
        return this.zzc.zzb();
    }

    public int getRotationDegrees() {
        return this.zzf;
    }

    public int getWidth() {
        return this.zzd;
    }

    public static InputImage fromMediaImage(Image image, int rotationDegrees, Matrix coordinatesMatrix) {
        Preconditions.checkArgument(image.getFormat() == 35, "Only YUV_420_888 is supported now");
        return zzb(image, rotationDegrees, coordinatesMatrix);
    }

    private InputImage(Image image, int i, int i2, int i3, Matrix matrix) {
        Preconditions.checkNotNull(image);
        this.zzc = new zzb(image);
        this.zzd = i;
        this.zze = i2;
        zza(i3);
        this.zzf = i3;
        this.zzg = 35;
        this.zzh = matrix;
    }

    private InputImage(ByteBuffer byteBuffer, int i, int i2, int i3, int i4) {
        boolean z;
        if (i4 == 842094169) {
            z = true;
        } else if (i4 == 17) {
            i4 = 17;
            z = true;
        } else {
            z = false;
        }
        Preconditions.checkArgument(z);
        this.zzb = (ByteBuffer) Preconditions.checkNotNull(byteBuffer);
        Preconditions.checkArgument(byteBuffer.limit() > i * i2, "Image dimension, ByteBuffer size and format don't match. Please check if the ByteBuffer is in the decalred format.");
        byteBuffer.rewind();
        this.zzd = i;
        this.zze = i2;
        zza(i3);
        this.zzf = i3;
        this.zzg = i4;
        this.zzh = null;
    }
}
