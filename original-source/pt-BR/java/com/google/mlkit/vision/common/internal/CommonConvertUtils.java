package com.google.mlkit.vision.common.internal;

import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.Point;
import android.graphics.PointF;
import android.graphics.Rect;
import android.graphics.RectF;
import android.media.Image;
import android.os.SystemClock;
import com.google.android.gms.internal.mlkit_vision_common.zzms;
import com.google.android.gms.internal.mlkit_vision_common.zzmu;
import com.google.android.gms.internal.mlkit_vision_common.zzmw;
import com.google.android.odml.image.BitmapExtractor;
import com.google.android.odml.image.ByteBufferExtractor;
import com.google.android.odml.image.ImageProperties;
import com.google.android.odml.image.MediaImageExtractor;
import com.google.android.odml.image.MlImage;
import com.google.mlkit.vision.common.InputImage;
import com.google.zxing.pdf417.PDF417Common;
import java.nio.ByteBuffer;
import java.util.List;

/* compiled from: com.google.mlkit:vision-common@@17.3.0 */
/* carregado de: classes16.dex */
public class CommonConvertUtils {
    public static InputImage convertMlImagetoInputImage(MlImage mlImage) {
        Integer num;
        ImageProperties imageProperties = mlImage.getContainedImageProperties().get(0);
        InputImage inputImage = null;
        switch (imageProperties.getStorageType()) {
            case 1:
                Bitmap extract = BitmapExtractor.extract(mlImage);
                zza(-1, 1, SystemClock.elapsedRealtime(), mlImage.getHeight(), mlImage.getWidth(), extract.getAllocationByteCount(), mlImage.getRotation());
                inputImage = InputImage.fromBitmap(extract, mlImage.getRotation());
                break;
            case 2:
                ByteBuffer extract2 = ByteBufferExtractor.extract(mlImage);
                switch (imageProperties.getImageFormat()) {
                    case 4:
                        num = 17;
                        break;
                    case 5:
                        num = Integer.valueOf(InputImage.IMAGE_FORMAT_YV12);
                        break;
                    default:
                        num = null;
                        break;
                }
                if (num != null) {
                    zza(num.intValue(), 3, SystemClock.elapsedRealtime(), mlImage.getHeight(), mlImage.getWidth(), extract2.limit(), mlImage.getRotation());
                    inputImage = InputImage.fromByteBuffer(extract2, mlImage.getWidth(), mlImage.getHeight(), mlImage.getRotation(), num.intValue());
                    break;
                }
                break;
            case 3:
                Image extract3 = MediaImageExtractor.extract(mlImage);
                zza(extract3.getFormat(), 5, SystemClock.elapsedRealtime(), mlImage.getHeight(), mlImage.getWidth(), extract3.getFormat() == 256 ? extract3.getPlanes()[0].getBuffer().limit() : (extract3.getPlanes()[0].getBuffer().limit() * 3) / 2, mlImage.getRotation());
                inputImage = InputImage.fromMediaImage(extract3, mlImage.getRotation());
                break;
        }
        if (inputImage != null) {
            zzmw.zza();
        }
        return inputImage;
    }

    public static int convertToAndroidImageFormat(int i) {
        switch (i) {
            case 17:
                return 17;
            case 35:
                return 35;
            case InputImage.IMAGE_FORMAT_YV12 /* 842094169 */:
                return InputImage.IMAGE_FORMAT_YV12;
            default:
                return 0;
        }
    }

    public static int convertToMVRotation(int rotation) {
        switch (rotation) {
            case 0:
                return 0;
            case PDF417Common.MAX_ROWS_IN_BARCODE /* 90 */:
                return 1;
            case 180:
                return 2;
            case 270:
                return 3;
            default:
                throw new IllegalArgumentException("Invalid rotation: " + rotation);
        }
    }

    public static void transformPointArray(Point[] pointArray, Matrix matrix) {
        int length = pointArray.length;
        float[] fArr = new float[length + length];
        for (int i = 0; i < pointArray.length; i++) {
            int i2 = i + i;
            fArr[i2] = pointArray[i].x;
            fArr[i2 + 1] = pointArray[i].y;
        }
        matrix.mapPoints(fArr);
        for (int i3 = 0; i3 < pointArray.length; i3++) {
            int i4 = i3 + i3;
            pointArray[i3].set((int) fArr[i4], (int) fArr[i4 + 1]);
        }
    }

    public static void transformPointF(PointF pointF, Matrix matrix) {
        float[] fArr = {pointF.x, pointF.y};
        matrix.mapPoints(fArr);
        pointF.set(fArr[0], fArr[1]);
    }

    public static void transformPointList(List<PointF> list, Matrix matrix) {
        int size = list.size();
        float[] fArr = new float[size + size];
        for (int i = 0; i < list.size(); i++) {
            int i2 = i + i;
            fArr[i2] = list.get(i).x;
            fArr[i2 + 1] = list.get(i).y;
        }
        matrix.mapPoints(fArr);
        for (int i3 = 0; i3 < list.size(); i3++) {
            int i4 = i3 + i3;
            list.get(i3).set(fArr[i4], fArr[i4 + 1]);
        }
    }

    public static void transformRect(Rect rect, Matrix matrix) {
        RectF rectF = new RectF(rect);
        matrix.mapRect(rectF);
        rect.set((int) rectF.left, (int) rectF.top, (int) rectF.right, (int) rectF.bottom);
    }

    private static void zza(int i, int i2, long j, int i3, int i4, int i5, int i6) {
        zzmu.zzb(zzms.zzb("vision-common"), i, i2, j, i3, i4, i5, i6);
    }
}
