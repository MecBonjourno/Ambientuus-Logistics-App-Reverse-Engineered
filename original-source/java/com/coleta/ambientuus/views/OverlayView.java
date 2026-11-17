package com.coleta.ambientuus.views;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.view.View;
import android.view.animation.LinearInterpolator;
import androidx.core.content.ContextCompat;
import androidx.core.internal.view.SupportMenu;
import com.coleta.ambientuus.R;

/* loaded from: classes8.dex */
public class OverlayView extends View {
    private ValueAnimator animator;
    private final Paint cornerPaint;
    private final Paint laserPaint;
    private float laserY;

    public OverlayView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.cornerPaint = new Paint();
        this.cornerPaint.setColor(ContextCompat.getColor(context, R.color.verde_ambietuus));
        this.cornerPaint.setStyle(Paint.Style.STROKE);
        this.cornerPaint.setStrokeWidth(8.0f);
        this.cornerPaint.setAntiAlias(true);
        this.laserPaint = new Paint();
        this.laserPaint.setColor(SupportMenu.CATEGORY_MASK);
        this.laserPaint.setStrokeWidth(4.0f);
        this.laserPaint.setAntiAlias(true);
    }

    @Override // android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        startAnimation();
    }

    @Override // android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        stopAnimation();
    }

    private void startAnimation() {
        if (this.animator == null || !this.animator.isRunning()) {
            this.animator = ValueAnimator.ofFloat(0.0f, 1.0f);
            this.animator.setDuration(2000L);
            this.animator.setRepeatCount(-1);
            this.animator.setRepeatMode(2);
            this.animator.setInterpolator(new LinearInterpolator());
            this.animator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.coleta.ambientuus.views.OverlayView$$ExternalSyntheticLambda0
                @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                    OverlayView.this.lambda$startAnimation$0(valueAnimator);
                }
            });
            this.animator.start();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$startAnimation$0(ValueAnimator animation) {
        float progress = ((Float) animation.getAnimatedValue()).floatValue();
        int height = getHeight();
        int rectSize = (int) (getWidth() * 0.7d);
        int top = (height - rectSize) / 2;
        int bottom = top + rectSize;
        this.laserY = top + ((bottom - top) * progress);
        invalidate();
    }

    private void stopAnimation() {
        if (this.animator != null) {
            this.animator.cancel();
            this.animator = null;
        }
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        int width = getWidth();
        int height = getHeight();
        int rectSize = (int) (width * 0.7d);
        int left = (width - rectSize) / 2;
        int top = (height - rectSize) / 2;
        int right = left + rectSize;
        int bottom = top + rectSize;
        int cornerLength = rectSize / 6;
        canvas.drawLine(left, top, left + cornerLength, top, this.cornerPaint);
        canvas.drawLine(left, top, left, top + cornerLength, this.cornerPaint);
        canvas.drawLine(right, top, right - cornerLength, top, this.cornerPaint);
        canvas.drawLine(right, top, right, top + cornerLength, this.cornerPaint);
        canvas.drawLine(left, bottom, left + cornerLength, bottom, this.cornerPaint);
        canvas.drawLine(left, bottom, left, bottom - cornerLength, this.cornerPaint);
        canvas.drawLine(right, bottom, right - cornerLength, bottom, this.cornerPaint);
        canvas.drawLine(right, bottom, right, bottom - cornerLength, this.cornerPaint);
        canvas.drawLine(left, this.laserY, right, this.laserY, this.laserPaint);
    }
}
