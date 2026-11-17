package me.dm7.barcodescanner.core;

import android.content.Context;
import android.graphics.Point;
import android.hardware.Camera;
import android.os.Handler;
import android.util.AttributeSet;
import android.util.Log;
import android.view.Display;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.ViewGroup;
import android.view.WindowManager;
import java.util.List;

/* loaded from: classes17.dex */
public class CameraPreview extends SurfaceView implements SurfaceHolder.Callback {
    private static final String TAG = "CameraPreview";
    Camera.AutoFocusCallback autoFocusCB;
    private Runnable doAutoFocus;
    private boolean mAutoFocus;
    private Handler mAutoFocusHandler;
    private Camera mCamera;
    private Camera.PreviewCallback mPreviewCallback;
    private boolean mPreviewing;
    private boolean mSurfaceCreated;

    public CameraPreview(Context context) {
        super(context);
        this.mPreviewing = true;
        this.mAutoFocus = true;
        this.mSurfaceCreated = false;
        this.doAutoFocus = new Runnable() { // from class: me.dm7.barcodescanner.core.CameraPreview.1
            @Override // java.lang.Runnable
            public void run() {
                if (CameraPreview.this.mCamera != null && CameraPreview.this.mPreviewing && CameraPreview.this.mAutoFocus && CameraPreview.this.mSurfaceCreated) {
                    CameraPreview.this.safeAutoFocus();
                }
            }
        };
        this.autoFocusCB = new Camera.AutoFocusCallback() { // from class: me.dm7.barcodescanner.core.CameraPreview.2
            @Override // android.hardware.Camera.AutoFocusCallback
            public void onAutoFocus(boolean success, Camera camera) {
                CameraPreview.this.scheduleAutoFocus();
            }
        };
    }

    public CameraPreview(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mPreviewing = true;
        this.mAutoFocus = true;
        this.mSurfaceCreated = false;
        this.doAutoFocus = new Runnable() { // from class: me.dm7.barcodescanner.core.CameraPreview.1
            @Override // java.lang.Runnable
            public void run() {
                if (CameraPreview.this.mCamera != null && CameraPreview.this.mPreviewing && CameraPreview.this.mAutoFocus && CameraPreview.this.mSurfaceCreated) {
                    CameraPreview.this.safeAutoFocus();
                }
            }
        };
        this.autoFocusCB = new Camera.AutoFocusCallback() { // from class: me.dm7.barcodescanner.core.CameraPreview.2
            @Override // android.hardware.Camera.AutoFocusCallback
            public void onAutoFocus(boolean success, Camera camera) {
                CameraPreview.this.scheduleAutoFocus();
            }
        };
    }

    public void setCamera(Camera camera, Camera.PreviewCallback previewCallback) {
        this.mCamera = camera;
        this.mPreviewCallback = previewCallback;
        this.mAutoFocusHandler = new Handler();
    }

    public void initCameraPreview() {
        if (this.mCamera != null) {
            getHolder().addCallback(this);
            getHolder().setType(3);
            if (this.mPreviewing) {
                requestLayout();
            } else {
                showCameraPreview();
            }
        }
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceCreated(SurfaceHolder surfaceHolder) {
        this.mSurfaceCreated = true;
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceChanged(SurfaceHolder surfaceHolder, int i, int i2, int i3) {
        if (surfaceHolder.getSurface() == null) {
            return;
        }
        stopCameraPreview();
        showCameraPreview();
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceDestroyed(SurfaceHolder surfaceHolder) {
        this.mSurfaceCreated = false;
        stopCameraPreview();
    }

    public void showCameraPreview() {
        if (this.mCamera != null) {
            try {
                this.mPreviewing = true;
                setupCameraParameters();
                this.mCamera.setPreviewDisplay(getHolder());
                this.mCamera.setDisplayOrientation(getDisplayOrientation());
                this.mCamera.setOneShotPreviewCallback(this.mPreviewCallback);
                this.mCamera.startPreview();
                if (this.mAutoFocus) {
                    if (this.mSurfaceCreated) {
                        safeAutoFocus();
                    } else {
                        scheduleAutoFocus();
                    }
                }
            } catch (Exception e) {
                Log.e(TAG, e.toString(), e);
            }
        }
    }

    public void safeAutoFocus() {
        try {
            this.mCamera.autoFocus(this.autoFocusCB);
        } catch (RuntimeException e) {
            scheduleAutoFocus();
        }
    }

    public void stopCameraPreview() {
        if (this.mCamera != null) {
            try {
                this.mPreviewing = false;
                this.mCamera.cancelAutoFocus();
                this.mCamera.setOneShotPreviewCallback(null);
                this.mCamera.stopPreview();
            } catch (Exception e) {
                Log.e(TAG, e.toString(), e);
            }
        }
    }

    public void setupCameraParameters() {
        Camera.Size optimalSize = getOptimalPreviewSize();
        Camera.Parameters parameters = this.mCamera.getParameters();
        parameters.setPreviewSize(optimalSize.width, optimalSize.height);
        this.mCamera.setParameters(parameters);
        adjustViewSize(optimalSize);
    }

    private void adjustViewSize(Camera.Size cameraSize) {
        Point previewSize = convertSizeToLandscapeOrientation(new Point(getWidth(), getHeight()));
        float cameraRatio = cameraSize.width / cameraSize.height;
        float screenRatio = previewSize.x / previewSize.y;
        if (screenRatio > cameraRatio) {
            setViewSize((int) (previewSize.y * cameraRatio), previewSize.y);
        } else {
            setViewSize(previewSize.x, (int) (previewSize.x / cameraRatio));
        }
    }

    private Point convertSizeToLandscapeOrientation(Point size) {
        if (getDisplayOrientation() % 180 == 0) {
            return size;
        }
        return new Point(size.y, size.x);
    }

    private void setViewSize(int width, int height) {
        ViewGroup.LayoutParams layoutParams = getLayoutParams();
        if (getDisplayOrientation() % 180 == 0) {
            layoutParams.width = width;
            layoutParams.height = height;
        } else {
            layoutParams.width = height;
            layoutParams.height = width;
        }
        setLayoutParams(layoutParams);
    }

    public int getDisplayOrientation() {
        Camera.CameraInfo info = new Camera.CameraInfo();
        Camera.getCameraInfo(0, info);
        WindowManager wm = (WindowManager) getContext().getSystemService("window");
        Display display = wm.getDefaultDisplay();
        int rotation = display.getRotation();
        int degrees = 0;
        switch (rotation) {
            case 0:
                degrees = 0;
                break;
            case 1:
                degrees = 90;
                break;
            case 2:
                degrees = 180;
                break;
            case 3:
                degrees = 270;
                break;
        }
        if (info.facing == 1) {
            int result = (info.orientation + degrees) % 360;
            return (360 - result) % 360;
        }
        int result2 = ((info.orientation - degrees) + 360) % 360;
        return result2;
    }

    private Camera.Size getOptimalPreviewSize() {
        if (this.mCamera == null) {
            return null;
        }
        List<Camera.Size> sizes = this.mCamera.getParameters().getSupportedPreviewSizes();
        Point screenResolution = DisplayUtils.getScreenResolution(getContext());
        int w = screenResolution.x;
        int h = screenResolution.y;
        if (DisplayUtils.getScreenOrientation(getContext()) == 1) {
            w = screenResolution.y;
            h = screenResolution.x;
        }
        double targetRatio = w / h;
        if (sizes == null) {
            return null;
        }
        Camera.Size optimalSize = null;
        double minDiff = Double.MAX_VALUE;
        int targetHeight = h;
        for (Camera.Size size : sizes) {
            List<Camera.Size> sizes2 = sizes;
            double ratio = size.width / size.height;
            if (Math.abs(ratio - targetRatio) > 0.1d) {
                sizes = sizes2;
            } else {
                double ratio2 = Math.abs(size.height - targetHeight);
                if (ratio2 < minDiff) {
                    minDiff = Math.abs(size.height - targetHeight);
                    optimalSize = size;
                }
                sizes = sizes2;
            }
        }
        List<Camera.Size> sizes3 = sizes;
        if (optimalSize == null) {
            double minDiff2 = Double.MAX_VALUE;
            for (Camera.Size size2 : sizes3) {
                if (Math.abs(size2.height - targetHeight) < minDiff2) {
                    optimalSize = size2;
                    minDiff2 = Math.abs(size2.height - targetHeight);
                }
            }
        }
        return optimalSize;
    }

    public void setAutoFocus(boolean state) {
        if (this.mCamera == null || !this.mPreviewing || state == this.mAutoFocus) {
            return;
        }
        this.mAutoFocus = state;
        if (this.mAutoFocus) {
            if (this.mSurfaceCreated) {
                Log.v(TAG, "Starting autofocus");
                safeAutoFocus();
                return;
            } else {
                scheduleAutoFocus();
                return;
            }
        }
        Log.v(TAG, "Cancelling autofocus");
        this.mCamera.cancelAutoFocus();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void scheduleAutoFocus() {
        this.mAutoFocusHandler.postDelayed(this.doAutoFocus, 1000L);
    }
}
