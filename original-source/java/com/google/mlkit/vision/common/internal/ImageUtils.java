package com.google.mlkit.vision.common.internal;

import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.media.Image;
import com.google.android.gms.common.internal.GmsLogger;
import com.google.android.gms.common.internal.Preconditions;
import com.google.android.gms.dynamic.IObjectWrapper;
import com.google.android.gms.dynamic.ObjectWrapper;
import com.google.mlkit.common.MlKitException;
import com.google.mlkit.vision.common.InputImage;
import java.nio.ByteBuffer;

/* compiled from: com.google.mlkit:vision-common@@17.3.0 */
/* loaded from: classes16.dex */
public class ImageUtils {
    private static final GmsLogger zza = new GmsLogger("MLKitImageUtils", "");
    private static final ImageUtils zzb = new ImageUtils();

    private ImageUtils() {
    }

    public static ImageUtils getInstance() {
        return zzb;
    }

    public IObjectWrapper getImageDataWrapper(InputImage inputImage) throws MlKitException {
        switch (inputImage.getFormat()) {
            case -1:
                return ObjectWrapper.wrap((Bitmap) Preconditions.checkNotNull(inputImage.getBitmapInternal()));
            case 17:
            case InputImage.IMAGE_FORMAT_YV12 /* 842094169 */:
                return ObjectWrapper.wrap((ByteBuffer) Preconditions.checkNotNull(inputImage.getByteBuffer()));
            case 35:
                return ObjectWrapper.wrap(inputImage.getMediaImage());
            default:
                throw new MlKitException("Unsupported image format: " + inputImage.getFormat(), 3);
        }
    }

    public int getMobileVisionImageFormat(InputImage input) {
        return input.getFormat();
    }

    public int getMobileVisionImageSize(InputImage input) {
        if (input.getFormat() == -1) {
            return ((Bitmap) Preconditions.checkNotNull(input.getBitmapInternal())).getAllocationByteCount();
        }
        if (input.getFormat() == 17 || input.getFormat() == 842094169) {
            return ((ByteBuffer) Preconditions.checkNotNull(input.getByteBuffer())).limit();
        }
        if (input.getFormat() != 35) {
            return 0;
        }
        return (((Image.Plane[]) Preconditions.checkNotNull(input.getPlanes()))[0].getBuffer().limit() * 3) / 2;
    }

    public Matrix getUprightRotationMatrix(int width, int height, int rotation) {
        if (rotation == 0) {
            return null;
        }
        Matrix matrix = new Matrix();
        matrix.postTranslate((-width) / 2.0f, (-height) / 2.0f);
        matrix.postRotate(rotation * 90);
        int i = rotation % 2;
        int i2 = i != 0 ? height : width;
        if (i == 0) {
            width = height;
        }
        matrix.postTranslate(i2 / 2.0f, width / 2.0f);
        return matrix;
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0092  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x00c6 A[Catch: FileNotFoundException -> 0x00de, TryCatch #2 {FileNotFoundException -> 0x00de, blocks: (B:3:0x0002, B:5:0x0008, B:7:0x0016, B:9:0x007a, B:10:0x008f, B:13:0x00c6, B:15:0x00cf, B:20:0x0094, B:22:0x0099, B:23:0x00a1, B:24:0x00a6, B:25:0x00ae, B:26:0x00b3, B:27:0x00bb, B:36:0x0074, B:42:0x005e, B:64:0x00d6, B:65:0x00dd), top: B:2:0x0002 }] */
    /* JADX WARN: Removed duplicated region for block: B:19:? A[ADDED_TO_REGION, RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0094 A[Catch: FileNotFoundException -> 0x00de, TryCatch #2 {FileNotFoundException -> 0x00de, blocks: (B:3:0x0002, B:5:0x0008, B:7:0x0016, B:9:0x007a, B:10:0x008f, B:13:0x00c6, B:15:0x00cf, B:20:0x0094, B:22:0x0099, B:23:0x00a1, B:24:0x00a6, B:25:0x00ae, B:26:0x00b3, B:27:0x00bb, B:36:0x0074, B:42:0x005e, B:64:0x00d6, B:65:0x00dd), top: B:2:0x0002 }] */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0099 A[Catch: FileNotFoundException -> 0x00de, TryCatch #2 {FileNotFoundException -> 0x00de, blocks: (B:3:0x0002, B:5:0x0008, B:7:0x0016, B:9:0x007a, B:10:0x008f, B:13:0x00c6, B:15:0x00cf, B:20:0x0094, B:22:0x0099, B:23:0x00a1, B:24:0x00a6, B:25:0x00ae, B:26:0x00b3, B:27:0x00bb, B:36:0x0074, B:42:0x005e, B:64:0x00d6, B:65:0x00dd), top: B:2:0x0002 }] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x00a1 A[Catch: FileNotFoundException -> 0x00de, TryCatch #2 {FileNotFoundException -> 0x00de, blocks: (B:3:0x0002, B:5:0x0008, B:7:0x0016, B:9:0x007a, B:10:0x008f, B:13:0x00c6, B:15:0x00cf, B:20:0x0094, B:22:0x0099, B:23:0x00a1, B:24:0x00a6, B:25:0x00ae, B:26:0x00b3, B:27:0x00bb, B:36:0x0074, B:42:0x005e, B:64:0x00d6, B:65:0x00dd), top: B:2:0x0002 }] */
    /* JADX WARN: Removed duplicated region for block: B:24:0x00a6 A[Catch: FileNotFoundException -> 0x00de, TryCatch #2 {FileNotFoundException -> 0x00de, blocks: (B:3:0x0002, B:5:0x0008, B:7:0x0016, B:9:0x007a, B:10:0x008f, B:13:0x00c6, B:15:0x00cf, B:20:0x0094, B:22:0x0099, B:23:0x00a1, B:24:0x00a6, B:25:0x00ae, B:26:0x00b3, B:27:0x00bb, B:36:0x0074, B:42:0x005e, B:64:0x00d6, B:65:0x00dd), top: B:2:0x0002 }] */
    /* JADX WARN: Removed duplicated region for block: B:25:0x00ae A[Catch: FileNotFoundException -> 0x00de, TryCatch #2 {FileNotFoundException -> 0x00de, blocks: (B:3:0x0002, B:5:0x0008, B:7:0x0016, B:9:0x007a, B:10:0x008f, B:13:0x00c6, B:15:0x00cf, B:20:0x0094, B:22:0x0099, B:23:0x00a1, B:24:0x00a6, B:25:0x00ae, B:26:0x00b3, B:27:0x00bb, B:36:0x0074, B:42:0x005e, B:64:0x00d6, B:65:0x00dd), top: B:2:0x0002 }] */
    /* JADX WARN: Removed duplicated region for block: B:26:0x00b3 A[Catch: FileNotFoundException -> 0x00de, TryCatch #2 {FileNotFoundException -> 0x00de, blocks: (B:3:0x0002, B:5:0x0008, B:7:0x0016, B:9:0x007a, B:10:0x008f, B:13:0x00c6, B:15:0x00cf, B:20:0x0094, B:22:0x0099, B:23:0x00a1, B:24:0x00a6, B:25:0x00ae, B:26:0x00b3, B:27:0x00bb, B:36:0x0074, B:42:0x005e, B:64:0x00d6, B:65:0x00dd), top: B:2:0x0002 }] */
    /* JADX WARN: Removed duplicated region for block: B:27:0x00bb A[Catch: FileNotFoundException -> 0x00de, TryCatch #2 {FileNotFoundException -> 0x00de, blocks: (B:3:0x0002, B:5:0x0008, B:7:0x0016, B:9:0x007a, B:10:0x008f, B:13:0x00c6, B:15:0x00cf, B:20:0x0094, B:22:0x0099, B:23:0x00a1, B:24:0x00a6, B:25:0x00ae, B:26:0x00b3, B:27:0x00bb, B:36:0x0074, B:42:0x005e, B:64:0x00d6, B:65:0x00dd), top: B:2:0x0002 }] */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0073  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0074 A[Catch: FileNotFoundException -> 0x00de, TryCatch #2 {FileNotFoundException -> 0x00de, blocks: (B:3:0x0002, B:5:0x0008, B:7:0x0016, B:9:0x007a, B:10:0x008f, B:13:0x00c6, B:15:0x00cf, B:20:0x0094, B:22:0x0099, B:23:0x00a1, B:24:0x00a6, B:25:0x00ae, B:26:0x00b3, B:27:0x00bb, B:36:0x0074, B:42:0x005e, B:64:0x00d6, B:65:0x00dd), top: B:2:0x0002 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final android.graphics.Bitmap zza(android.content.ContentResolver r11, android.net.Uri r12) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 262
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.mlkit.vision.common.internal.ImageUtils.zza(android.content.ContentResolver, android.net.Uri):android.graphics.Bitmap");
    }
}
