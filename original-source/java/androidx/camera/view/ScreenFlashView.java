package androidx.camera.view;

import android.animation.Animator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.view.internal.ScreenFlashUiInfo;
import j$.util.Objects;

/* loaded from: classes.dex */
public final class ScreenFlashView extends View {
    private static final long ANIMATION_DURATION_MILLIS = 1000;
    private static final String TAG = "ScreenFlashView";
    private CameraController mCameraController;
    private ImageCapture.ScreenFlash mScreenFlash;
    private Window mScreenFlashWindow;

    public ScreenFlashView(Context context) {
        this(context, null);
    }

    public ScreenFlashView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public ScreenFlashView(Context context, AttributeSet attrs, int defStyleAttr) {
        this(context, attrs, defStyleAttr, 0);
    }

    public ScreenFlashView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        setBackgroundColor(-1);
        setAlpha(0.0f);
        setElevation(Float.MAX_VALUE);
    }

    public void setController(CameraController cameraController) {
        Threads.checkMainThread();
        if (this.mCameraController != null && this.mCameraController != cameraController) {
            setScreenFlashUiInfo(null);
        }
        this.mCameraController = cameraController;
        if (cameraController == null) {
            return;
        }
        if (cameraController.getImageCaptureFlashMode() == 3 && this.mScreenFlashWindow == null) {
            throw new IllegalStateException("No window set despite setting FLASH_MODE_SCREEN in CameraController");
        }
        setScreenFlashUiInfo(getScreenFlash());
    }

    private void setScreenFlashUiInfo(ImageCapture.ScreenFlash control) {
        if (this.mCameraController == null) {
            Logger.d(TAG, "setScreenFlashUiInfo: mCameraController is null!");
        } else {
            this.mCameraController.setScreenFlashUiInfo(new ScreenFlashUiInfo(ScreenFlashUiInfo.ProviderType.SCREEN_FLASH_VIEW, control));
        }
    }

    public void setScreenFlashWindow(Window screenFlashWindow) {
        Threads.checkMainThread();
        updateScreenFlash(screenFlashWindow);
        this.mScreenFlashWindow = screenFlashWindow;
        setScreenFlashUiInfo(getScreenFlash());
    }

    private void updateScreenFlash(Window window) {
        Logger.d(TAG, "updateScreenFlash: is new window null = " + (window == null) + ",  is new window same as previous = " + (window == this.mScreenFlashWindow));
        if (this.mScreenFlashWindow != window) {
            this.mScreenFlash = window == null ? null : new ImageCapture.ScreenFlash() { // from class: androidx.camera.view.ScreenFlashView.1
                private ValueAnimator mAnimator;
                private float mPreviousBrightness;

                @Override // androidx.camera.core.ImageCapture.ScreenFlash
                public void apply(long expirationTimeMillis, final ImageCapture.ScreenFlashListener screenFlashListener) {
                    Logger.d(ScreenFlashView.TAG, "ScreenFlash#apply");
                    this.mPreviousBrightness = ScreenFlashView.this.getBrightness();
                    ScreenFlashView.this.setBrightness(1.0f);
                    if (this.mAnimator != null) {
                        this.mAnimator.cancel();
                    }
                    ScreenFlashView screenFlashView = ScreenFlashView.this;
                    Objects.requireNonNull(screenFlashListener);
                    this.mAnimator = screenFlashView.animateToFullOpacity(new Runnable() { // from class: androidx.camera.view.ScreenFlashView$1$$ExternalSyntheticLambda0
                        @Override // java.lang.Runnable
                        public final void run() {
                            ImageCapture.ScreenFlashListener.this.onCompleted();
                        }
                    });
                }

                @Override // androidx.camera.core.ImageCapture.ScreenFlash
                public void clear() {
                    Logger.d(ScreenFlashView.TAG, "ScreenFlash#clear");
                    if (this.mAnimator != null) {
                        this.mAnimator.cancel();
                        this.mAnimator = null;
                    }
                    ScreenFlashView.this.setAlpha(0.0f);
                    ScreenFlashView.this.setBrightness(this.mPreviousBrightness);
                }
            };
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public ValueAnimator animateToFullOpacity(final Runnable onAnimationEnd) {
        Logger.d(TAG, "animateToFullOpacity");
        ValueAnimator animator = ValueAnimator.ofFloat(0.0f, 1.0f);
        animator.setDuration(getVisibilityRampUpAnimationDurationMillis());
        animator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: androidx.camera.view.ScreenFlashView$$ExternalSyntheticLambda0
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                ScreenFlashView.this.m322x7abca040(valueAnimator);
            }
        });
        animator.addListener(new Animator.AnimatorListener() { // from class: androidx.camera.view.ScreenFlashView.2
            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationStart(Animator animation) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                Logger.d(ScreenFlashView.TAG, "ScreenFlash#apply: onAnimationEnd");
                if (onAnimationEnd != null) {
                    onAnimationEnd.run();
                }
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationCancel(Animator animation) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationRepeat(Animator animation) {
            }
        });
        animator.start();
        return animator;
    }

    /* renamed from: lambda$animateToFullOpacity$0$androidx-camera-view-ScreenFlashView, reason: not valid java name */
    /* synthetic */ void m322x7abca040(ValueAnimator animation) {
        Logger.d(TAG, "animateToFullOpacity: value = " + ((Float) animation.getAnimatedValue()).floatValue());
        setAlpha(((Float) animation.getAnimatedValue()).floatValue());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public float getBrightness() {
        if (this.mScreenFlashWindow == null) {
            Logger.e(TAG, "setBrightness: mScreenFlashWindow is null!");
            return Float.NaN;
        }
        WindowManager.LayoutParams layoutParam = this.mScreenFlashWindow.getAttributes();
        return layoutParam.screenBrightness;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setBrightness(float value) {
        if (this.mScreenFlashWindow == null) {
            Logger.e(TAG, "setBrightness: mScreenFlashWindow is null!");
            return;
        }
        if (Float.isNaN(value)) {
            Logger.e(TAG, "setBrightness: value is NaN!");
            return;
        }
        WindowManager.LayoutParams layoutParam = this.mScreenFlashWindow.getAttributes();
        layoutParam.screenBrightness = value;
        this.mScreenFlashWindow.setAttributes(layoutParam);
        Logger.d(TAG, "Brightness set to " + layoutParam.screenBrightness);
    }

    public ImageCapture.ScreenFlash getScreenFlash() {
        return this.mScreenFlash;
    }

    public long getVisibilityRampUpAnimationDurationMillis() {
        return 1000L;
    }
}
