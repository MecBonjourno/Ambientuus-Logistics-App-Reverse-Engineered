package androidx.camera.core;

import android.graphics.PointF;
import android.view.Display;
import com.google.zxing.pdf417.PDF417Common;

/* loaded from: classes.dex */
public final class DisplayOrientedMeteringPointFactory extends MeteringPointFactory {
    private final CameraInfo mCameraInfo;
    private final Display mDisplay;
    private final float mHeight;
    private final float mWidth;

    public DisplayOrientedMeteringPointFactory(Display display, CameraInfo cameraInfo, float width, float height) {
        this.mWidth = width;
        this.mHeight = height;
        this.mDisplay = display;
        this.mCameraInfo = cameraInfo;
    }

    @Override // androidx.camera.core.MeteringPointFactory
    protected PointF convertPoint(float x, float y) {
        float width = this.mWidth;
        float height = this.mHeight;
        int lensFacing = this.mCameraInfo.getLensFacing();
        boolean compensateForMirroring = lensFacing == 0;
        int relativeCameraOrientation = getRelativeCameraOrientation(compensateForMirroring);
        float outputX = x;
        float outputY = y;
        float outputWidth = width;
        float outputHeight = height;
        if (relativeCameraOrientation == 90 || relativeCameraOrientation == 270) {
            outputX = y;
            outputY = x;
            outputWidth = height;
            outputHeight = width;
        }
        switch (relativeCameraOrientation) {
            case PDF417Common.MAX_ROWS_IN_BARCODE /* 90 */:
                outputY = outputHeight - outputY;
                break;
            case 180:
                outputX = outputWidth - outputX;
                outputY = outputHeight - outputY;
                break;
            case 270:
                outputX = outputWidth - outputX;
                break;
        }
        if (compensateForMirroring) {
            outputX = outputWidth - outputX;
        }
        return new PointF(outputX / outputWidth, outputY / outputHeight);
    }

    private int getRelativeCameraOrientation(boolean compensateForMirroring) {
        try {
            int displayRotation = this.mDisplay.getRotation();
            int rotationDegrees = this.mCameraInfo.getSensorRotationDegrees(displayRotation);
            if (compensateForMirroring) {
                return (360 - rotationDegrees) % 360;
            }
            return rotationDegrees;
        } catch (Exception e) {
            return 0;
        }
    }
}
