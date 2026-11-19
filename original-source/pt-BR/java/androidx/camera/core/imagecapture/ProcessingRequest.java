package androidx.camera.core.imagecapture;

import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.Rect;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.ImageCaptureException;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.impl.CaptureBundle;
import androidx.camera.core.impl.CaptureStage;
import com.google.common.util.concurrent.ListenableFuture;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.List;

/* carregado de: classes.dex */
class ProcessingRequest {
    static final int PROGRESS_NOT_RECEIVED = -1;
    private final TakePictureCallback mCallback;
    final ListenableFuture<Void> mCaptureFuture;
    private final Rect mCropRect;
    private final int mJpegQuality;
    private int mLastCaptureProcessProgressed;
    private final ImageCapture.OutputFileOptions mOutputFileOptions;
    private final int mRequestId;
    private final int mRotationDegrees;
    private final ImageCapture.OutputFileOptions mSecondaryOutputFileOptions;
    private final Matrix mSensorToBufferTransform;
    private final List<Integer> mStageIds;
    private final String mTagBundleKey;
    TakePictureRequest mTakePictureRequest;

    ProcessingRequest(CaptureBundle captureBundle, TakePictureRequest takePictureRequest, TakePictureCallback callback, ListenableFuture<Void> captureFuture) {
        this(captureBundle, takePictureRequest, callback, captureFuture, 0);
    }

    ProcessingRequest(CaptureBundle captureBundle, TakePictureRequest takePictureRequest, TakePictureCallback callback, ListenableFuture<Void> captureFuture, int requestId) {
        this.mLastCaptureProcessProgressed = -1;
        this.mRequestId = requestId;
        this.mTakePictureRequest = takePictureRequest;
        this.mOutputFileOptions = takePictureRequest.getOutputFileOptions();
        this.mSecondaryOutputFileOptions = takePictureRequest.getSecondaryOutputFileOptions();
        this.mJpegQuality = takePictureRequest.getJpegQuality();
        this.mRotationDegrees = takePictureRequest.getRotationDegrees();
        this.mCropRect = takePictureRequest.getCropRect();
        this.mSensorToBufferTransform = takePictureRequest.getSensorToBufferTransform();
        this.mCallback = callback;
        this.mTagBundleKey = String.valueOf(captureBundle.hashCode());
        this.mStageIds = new ArrayList();
        for (CaptureStage captureStage : (List) Objects.requireNonNull(captureBundle.getCaptureStages())) {
            this.mStageIds.add(Integer.valueOf(captureStage.getId()));
        }
        this.mCaptureFuture = captureFuture;
    }

    String getTagBundleKey() {
        return this.mTagBundleKey;
    }

    List<Integer> getStageIds() {
        return this.mStageIds;
    }

    public int getRequestId() {
        return this.mRequestId;
    }

    TakePictureRequest getTakePictureRequest() {
        return this.mTakePictureRequest;
    }

    ImageCapture.OutputFileOptions getOutputFileOptions() {
        return this.mOutputFileOptions;
    }

    ImageCapture.OutputFileOptions getSecondaryOutputFileOptions() {
        return this.mSecondaryOutputFileOptions;
    }

    Rect getCropRect() {
        return this.mCropRect;
    }

    int getRotationDegrees() {
        return this.mRotationDegrees;
    }

    int getJpegQuality() {
        return this.mJpegQuality;
    }

    Matrix getSensorToBufferTransform() {
        return this.mSensorToBufferTransform;
    }

    boolean isInMemoryCapture() {
        return getOutputFileOptions() == null && getSecondaryOutputFileOptions() == null;
    }

    void onCaptureStarted() {
        this.mCallback.onCaptureStarted();
    }

    void onCaptureProcessProgressed(int progress) {
        if (this.mLastCaptureProcessProgressed != progress) {
            this.mLastCaptureProcessProgressed = progress;
            this.mCallback.onCaptureProcessProgressed(progress);
        }
    }

    void onImageCaptured() {
        if (this.mLastCaptureProcessProgressed != -1) {
            onCaptureProcessProgressed(100);
        }
        this.mCallback.onImageCaptured();
    }

    void onFinalResult(ImageCapture.OutputFileResults outputFileResults) {
        this.mCallback.onFinalResult(outputFileResults);
    }

    void onPostviewBitmapAvailable(Bitmap bitmap) {
        this.mCallback.onPostviewBitmapAvailable(bitmap);
    }

    void onFinalResult(ImageProxy imageProxy) {
        this.mCallback.onFinalResult(imageProxy);
    }

    void onProcessFailure(ImageCaptureException imageCaptureException) {
        this.mCallback.onProcessFailure(imageCaptureException);
    }

    void onCaptureFailure(ImageCaptureException imageCaptureException) {
        this.mCallback.onCaptureFailure(imageCaptureException);
    }

    boolean isAborted() {
        return this.mCallback.isAborted();
    }

    ListenableFuture<Void> getCaptureFuture() {
        return this.mCaptureFuture;
    }
}
