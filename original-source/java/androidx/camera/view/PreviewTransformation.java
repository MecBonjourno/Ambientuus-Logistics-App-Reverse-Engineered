package androidx.camera.view;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.util.Size;
import android.view.Display;
import android.view.TextureView;
import android.view.View;
import androidx.camera.core.Logger;
import androidx.camera.core.SurfaceRequest;
import androidx.camera.core.impl.utils.CameraOrientationUtil;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.camera.view.PreviewView;
import androidx.core.util.Preconditions;

/* loaded from: classes.dex */
final class PreviewTransformation {
    private static final PreviewView.ScaleType DEFAULT_SCALE_TYPE = PreviewView.ScaleType.FILL_CENTER;
    private static final String TAG = "PreviewTransform";
    private boolean mHasCameraTransform;
    private boolean mIsFrontCamera;
    private int mPreviewRotationDegrees;
    private Size mResolution;
    private PreviewView.ScaleType mScaleType = DEFAULT_SCALE_TYPE;
    private Matrix mSensorToBufferTransform;
    private Rect mSurfaceCropRect;
    private int mTargetRotation;

    PreviewTransformation() {
    }

    void setTransformationInfo(SurfaceRequest.TransformationInfo transformationInfo, Size resolution, boolean isFrontCamera) {
        Logger.d(TAG, "Transformation info set: " + transformationInfo + " " + resolution + " " + isFrontCamera);
        this.mSurfaceCropRect = transformationInfo.getCropRect();
        this.mPreviewRotationDegrees = transformationInfo.getRotationDegrees();
        this.mTargetRotation = transformationInfo.getTargetRotation();
        this.mResolution = resolution;
        this.mIsFrontCamera = isFrontCamera;
        this.mHasCameraTransform = transformationInfo.hasCameraTransform();
        this.mSensorToBufferTransform = transformationInfo.getSensorToBufferTransform();
    }

    void overrideWithDisplayRotation(int rotationDegrees, int displayRotation) {
        if (!this.mHasCameraTransform) {
            return;
        }
        this.mPreviewRotationDegrees = rotationDegrees;
        this.mTargetRotation = displayRotation;
    }

    Matrix getTextureViewCorrectionMatrix() {
        Preconditions.checkState(isTransformationInfoReady());
        RectF surfaceRect = new RectF(0.0f, 0.0f, this.mResolution.getWidth(), this.mResolution.getHeight());
        int rotationDegrees = getRemainingRotationDegrees();
        return TransformUtils.getRectToRect(surfaceRect, surfaceRect, rotationDegrees);
    }

    private int getRemainingRotationDegrees() {
        if (!this.mHasCameraTransform) {
            return this.mPreviewRotationDegrees;
        }
        return -CameraOrientationUtil.surfaceRotationToDegrees(this.mTargetRotation);
    }

    void transformView(Size previewViewSize, int layoutDirection, View preview) {
        if (previewViewSize.getHeight() == 0 || previewViewSize.getWidth() == 0) {
            Logger.w(TAG, "Transform not applied due to PreviewView size: " + previewViewSize);
            return;
        }
        if (!isTransformationInfoReady()) {
            return;
        }
        if (preview instanceof TextureView) {
            ((TextureView) preview).setTransform(getTextureViewCorrectionMatrix());
        } else {
            Display display = preview.getDisplay();
            boolean mismatchedDisplayRotation = (!this.mHasCameraTransform || display == null || display.getRotation() == this.mTargetRotation) ? false : true;
            boolean hasRemainingRotation = (this.mHasCameraTransform || getRemainingRotationDegrees() == 0) ? false : true;
            if (mismatchedDisplayRotation || hasRemainingRotation) {
                Logger.e(TAG, "Custom rotation not supported with SurfaceView/PERFORMANCE mode.");
            }
        }
        RectF surfaceRectInPreviewView = getTransformedSurfaceRect(previewViewSize, layoutDirection);
        preview.setPivotX(0.0f);
        preview.setPivotY(0.0f);
        preview.setScaleX(surfaceRectInPreviewView.width() / this.mResolution.getWidth());
        preview.setScaleY(surfaceRectInPreviewView.height() / this.mResolution.getHeight());
        preview.setTranslationX(surfaceRectInPreviewView.left - preview.getLeft());
        preview.setTranslationY(surfaceRectInPreviewView.top - preview.getTop());
    }

    void setScaleType(PreviewView.ScaleType scaleType) {
        this.mScaleType = scaleType;
    }

    PreviewView.ScaleType getScaleType() {
        return this.mScaleType;
    }

    private RectF getTransformedSurfaceRect(Size previewViewSize, int layoutDirection) {
        Preconditions.checkState(isTransformationInfoReady());
        Matrix surfaceToPreviewView = getSurfaceToPreviewViewMatrix(previewViewSize, layoutDirection);
        RectF rect = new RectF(0.0f, 0.0f, this.mResolution.getWidth(), this.mResolution.getHeight());
        surfaceToPreviewView.mapRect(rect);
        return rect;
    }

    Matrix getSensorToViewTransform(Size previewViewSize, int layoutDirection) {
        if (!isTransformationInfoReady()) {
            return null;
        }
        Matrix matrix = new Matrix(this.mSensorToBufferTransform);
        matrix.postConcat(getSurfaceToPreviewViewMatrix(previewViewSize, layoutDirection));
        return matrix;
    }

    Matrix getSurfaceToPreviewViewMatrix(Size previewViewSize, int layoutDirection) {
        RectF previewViewCropRect;
        Preconditions.checkState(isTransformationInfoReady());
        if (isViewportAspectRatioMatchPreviewView(previewViewSize)) {
            previewViewCropRect = new RectF(0.0f, 0.0f, previewViewSize.getWidth(), previewViewSize.getHeight());
        } else {
            previewViewCropRect = getPreviewViewViewportRectForMismatchedAspectRatios(previewViewSize, layoutDirection);
        }
        Matrix matrix = TransformUtils.getRectToRect(new RectF(this.mSurfaceCropRect), previewViewCropRect, this.mPreviewRotationDegrees);
        if (this.mIsFrontCamera && this.mHasCameraTransform) {
            if (TransformUtils.is90or270(this.mPreviewRotationDegrees)) {
                matrix.preScale(1.0f, -1.0f, this.mSurfaceCropRect.centerX(), this.mSurfaceCropRect.centerY());
            } else {
                matrix.preScale(-1.0f, 1.0f, this.mSurfaceCropRect.centerX(), this.mSurfaceCropRect.centerY());
            }
        }
        return matrix;
    }

    RectF getPreviewViewViewportRectForMismatchedAspectRatios(Size previewViewSize, int layoutDirection) {
        RectF previewViewRect = new RectF(0.0f, 0.0f, previewViewSize.getWidth(), previewViewSize.getHeight());
        Size rotatedViewportSize = getRotatedViewportSize();
        RectF rotatedViewportRect = new RectF(0.0f, 0.0f, rotatedViewportSize.getWidth(), rotatedViewportSize.getHeight());
        Matrix matrix = new Matrix();
        setMatrixRectToRect(matrix, rotatedViewportRect, previewViewRect, this.mScaleType);
        matrix.mapRect(rotatedViewportRect);
        if (layoutDirection == 1) {
            return flipHorizontally(rotatedViewportRect, previewViewSize.getWidth() / 2.0f);
        }
        return rotatedViewportRect;
    }

    private static void setMatrixRectToRect(Matrix matrix, RectF source, RectF destination, PreviewView.ScaleType scaleType) {
        Matrix.ScaleToFit matrixScaleType;
        switch (scaleType) {
            case FIT_CENTER:
            case FILL_CENTER:
                matrixScaleType = Matrix.ScaleToFit.CENTER;
                break;
            case FIT_END:
            case FILL_END:
                matrixScaleType = Matrix.ScaleToFit.END;
                break;
            case FIT_START:
            case FILL_START:
                matrixScaleType = Matrix.ScaleToFit.START;
                break;
            default:
                Logger.e(TAG, "Unexpected crop rect: " + scaleType);
                matrixScaleType = Matrix.ScaleToFit.FILL;
                break;
        }
        boolean isFitTypes = scaleType == PreviewView.ScaleType.FIT_CENTER || scaleType == PreviewView.ScaleType.FIT_START || scaleType == PreviewView.ScaleType.FIT_END;
        if (isFitTypes) {
            matrix.setRectToRect(source, destination, matrixScaleType);
        } else {
            matrix.setRectToRect(destination, source, matrixScaleType);
            matrix.invert(matrix);
        }
    }

    private static RectF flipHorizontally(RectF original, float flipLineX) {
        return new RectF((flipLineX + flipLineX) - original.right, original.top, (flipLineX + flipLineX) - original.left, original.bottom);
    }

    private Size getRotatedViewportSize() {
        if (TransformUtils.is90or270(this.mPreviewRotationDegrees)) {
            return new Size(this.mSurfaceCropRect.height(), this.mSurfaceCropRect.width());
        }
        return new Size(this.mSurfaceCropRect.width(), this.mSurfaceCropRect.height());
    }

    boolean isViewportAspectRatioMatchPreviewView(Size previewViewSize) {
        Size rotatedViewportSize = getRotatedViewportSize();
        return TransformUtils.isAspectRatioMatchingWithRoundingError(previewViewSize, true, rotatedViewportSize, false);
    }

    Rect getSurfaceCropRect() {
        return this.mSurfaceCropRect;
    }

    Bitmap createTransformedBitmap(Bitmap original, Size previewViewSize, int layoutDirection) {
        if (!isTransformationInfoReady()) {
            return original;
        }
        Matrix textureViewCorrection = getTextureViewCorrectionMatrix();
        RectF surfaceRectInPreviewView = getTransformedSurfaceRect(previewViewSize, layoutDirection);
        Bitmap transformed = Bitmap.createBitmap(previewViewSize.getWidth(), previewViewSize.getHeight(), original.getConfig());
        Canvas canvas = new Canvas(transformed);
        Matrix canvasTransform = new Matrix();
        canvasTransform.postConcat(textureViewCorrection);
        canvasTransform.postScale(surfaceRectInPreviewView.width() / this.mResolution.getWidth(), surfaceRectInPreviewView.height() / this.mResolution.getHeight());
        canvasTransform.postTranslate(surfaceRectInPreviewView.left, surfaceRectInPreviewView.top);
        canvas.drawBitmap(original, canvasTransform, new Paint(7));
        return transformed;
    }

    Matrix getPreviewViewToNormalizedSensorMatrix(Size previewViewSize, int layoutDirection, Rect sensorRect) {
        if (!isTransformationInfoReady()) {
            return null;
        }
        Matrix matrix = new Matrix();
        getSensorToViewTransform(previewViewSize, layoutDirection).invert(matrix);
        Matrix normalization = new Matrix();
        normalization.setRectToRect(new RectF(0.0f, 0.0f, sensorRect.width(), sensorRect.height()), new RectF(0.0f, 0.0f, 1.0f, 1.0f), Matrix.ScaleToFit.FILL);
        matrix.postConcat(normalization);
        return matrix;
    }

    private boolean isTransformationInfoReady() {
        boolean isTargetRotationSpecified = (this.mHasCameraTransform && this.mTargetRotation == -1) ? false : true;
        return (this.mSurfaceCropRect == null || this.mResolution == null || !isTargetRotationSpecified) ? false : true;
    }
}
