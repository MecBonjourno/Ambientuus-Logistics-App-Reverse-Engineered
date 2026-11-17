package me.dm7.barcodescanner.core;

import android.content.Context;
import android.graphics.Rect;
import android.hardware.Camera;
import android.util.AttributeSet;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import androidx.core.view.ViewCompat;
import kotlinx.coroutines.DebugKt;

/* loaded from: classes17.dex */
public abstract class BarcodeScannerView extends FrameLayout implements Camera.PreviewCallback {
    private Camera mCamera;
    private Rect mFramingRectInPreview;
    private CameraPreview mPreview;
    private ViewFinderView mViewFinderView;

    public BarcodeScannerView(Context context) {
        super(context);
        setupLayout();
    }

    public BarcodeScannerView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        setupLayout();
    }

    public void setupLayout() {
        this.mPreview = new CameraPreview(getContext());
        this.mViewFinderView = new ViewFinderView(getContext());
        RelativeLayout relativeLayout = new RelativeLayout(getContext());
        relativeLayout.setGravity(17);
        relativeLayout.setBackgroundColor(ViewCompat.MEASURED_STATE_MASK);
        relativeLayout.addView(this.mPreview);
        addView(relativeLayout);
        addView(this.mViewFinderView);
    }

    public void startCamera(int cameraId) {
        startCamera(CameraUtils.getCameraInstance(cameraId));
    }

    public void startCamera(Camera camera) {
        this.mCamera = camera;
        if (this.mCamera != null) {
            this.mViewFinderView.setupViewFinder();
            this.mPreview.setCamera(this.mCamera, this);
            this.mPreview.initCameraPreview();
        }
    }

    public void startCamera() {
        startCamera(CameraUtils.getCameraInstance());
    }

    public void stopCamera() {
        if (this.mCamera != null) {
            this.mPreview.stopCameraPreview();
            this.mPreview.setCamera(null, null);
            this.mCamera.release();
            this.mCamera = null;
        }
    }

    public synchronized Rect getFramingRectInPreview(int previewWidth, int previewHeight) {
        if (this.mFramingRectInPreview == null) {
            Rect framingRect = this.mViewFinderView.getFramingRect();
            int viewFinderViewWidth = this.mViewFinderView.getWidth();
            int viewFinderViewHeight = this.mViewFinderView.getHeight();
            if (framingRect != null && viewFinderViewWidth != 0 && viewFinderViewHeight != 0) {
                Rect rect = new Rect(framingRect);
                rect.left = (rect.left * previewWidth) / viewFinderViewWidth;
                rect.right = (rect.right * previewWidth) / viewFinderViewWidth;
                rect.top = (rect.top * previewHeight) / viewFinderViewHeight;
                rect.bottom = (rect.bottom * previewHeight) / viewFinderViewHeight;
                this.mFramingRectInPreview = rect;
            }
            return null;
        }
        return this.mFramingRectInPreview;
    }

    public void setFlash(boolean flag) {
        if (this.mCamera != null && CameraUtils.isFlashSupported(this.mCamera)) {
            Camera.Parameters parameters = this.mCamera.getParameters();
            if (flag) {
                if (parameters.getFlashMode().equals("torch")) {
                    return;
                } else {
                    parameters.setFlashMode("torch");
                }
            } else if (parameters.getFlashMode().equals(DebugKt.DEBUG_PROPERTY_VALUE_OFF)) {
                return;
            } else {
                parameters.setFlashMode(DebugKt.DEBUG_PROPERTY_VALUE_OFF);
            }
            this.mCamera.setParameters(parameters);
        }
    }

    public boolean getFlash() {
        if (this.mCamera == null || !CameraUtils.isFlashSupported(this.mCamera)) {
            return false;
        }
        Camera.Parameters parameters = this.mCamera.getParameters();
        return parameters.getFlashMode().equals("torch");
    }

    public void toggleFlash() {
        if (this.mCamera != null && CameraUtils.isFlashSupported(this.mCamera)) {
            Camera.Parameters parameters = this.mCamera.getParameters();
            if (parameters.getFlashMode().equals("torch")) {
                parameters.setFlashMode(DebugKt.DEBUG_PROPERTY_VALUE_OFF);
            } else {
                parameters.setFlashMode("torch");
            }
            this.mCamera.setParameters(parameters);
        }
    }

    public void setAutoFocus(boolean state) {
        if (this.mPreview != null) {
            this.mPreview.setAutoFocus(state);
        }
    }
}
