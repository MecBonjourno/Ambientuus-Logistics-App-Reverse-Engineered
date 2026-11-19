package me.dm7.barcodescanner.core;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.View;

/* carregado de: classes17.dex */
public class ViewFinderView extends View {
    private static final long ANIMATION_DELAY = 80;
    private static final float LANDSCAPE_HEIGHT_RATIO = 0.625f;
    private static final int LANDSCAPE_MAX_FRAME_HEIGHT = 675;
    private static final int LANDSCAPE_MAX_FRAME_WIDTH = 1200;
    private static final float LANDSCAPE_WIDTH_RATIO = 0.625f;
    private static final int MIN_FRAME_HEIGHT = 240;
    private static final int MIN_FRAME_WIDTH = 240;
    private static final int POINT_SIZE = 10;
    private static final float PORTRAIT_HEIGHT_RATIO = 0.375f;
    private static final int PORTRAIT_MAX_FRAME_HEIGHT = 720;
    private static final int PORTRAIT_MAX_FRAME_WIDTH = 945;
    private static final float PORTRAIT_WIDTH_RATIO = 0.875f;
    private static final int[] SCANNER_ALPHA = {0, 64, 128, 192, 255, 192, 128, 64};
    private static final String TAG = "ViewFinderView";
    private Rect mFramingRect;
    private int scannerAlpha;

    public ViewFinderView(Context context) {
        super(context);
    }

    public ViewFinderView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public void setupViewFinder() {
        updateFramingRect();
        invalidate();
    }

    public Rect getFramingRect() {
        return this.mFramingRect;
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        if (this.mFramingRect == null) {
            return;
        }
        drawViewFinderMask(canvas);
        drawViewFinderBorder(canvas);
        drawLaser(canvas);
    }

    public void drawViewFinderMask(Canvas canvas) {
        Paint paint = new Paint();
        Resources resources = getResources();
        paint.setColor(resources.getColor(R.color.viewfinder_mask));
        int width = canvas.getWidth();
        int height = canvas.getHeight();
        canvas.drawRect(0.0f, 0.0f, width, this.mFramingRect.top, paint);
        canvas.drawRect(0.0f, this.mFramingRect.top, this.mFramingRect.left, this.mFramingRect.bottom + 1, paint);
        canvas.drawRect(this.mFramingRect.right + 1, this.mFramingRect.top, width, this.mFramingRect.bottom + 1, paint);
        canvas.drawRect(0.0f, this.mFramingRect.bottom + 1, width, height, paint);
    }

    public void drawViewFinderBorder(Canvas canvas) {
        Paint paint = new Paint();
        Resources resources = getResources();
        paint.setColor(resources.getColor(R.color.viewfinder_border));
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(resources.getInteger(R.integer.viewfinder_border_width));
        int lineLength = resources.getInteger(R.integer.viewfinder_border_length);
        canvas.drawLine(this.mFramingRect.left - 1, this.mFramingRect.top - 1, this.mFramingRect.left - 1, (this.mFramingRect.top - 1) + lineLength, paint);
        canvas.drawLine(this.mFramingRect.left - 1, this.mFramingRect.top - 1, (this.mFramingRect.left - 1) + lineLength, this.mFramingRect.top - 1, paint);
        canvas.drawLine(this.mFramingRect.left - 1, this.mFramingRect.bottom + 1, this.mFramingRect.left - 1, (this.mFramingRect.bottom + 1) - lineLength, paint);
        canvas.drawLine(this.mFramingRect.left - 1, this.mFramingRect.bottom + 1, (this.mFramingRect.left - 1) + lineLength, this.mFramingRect.bottom + 1, paint);
        canvas.drawLine(this.mFramingRect.right + 1, this.mFramingRect.top - 1, this.mFramingRect.right + 1, (this.mFramingRect.top - 1) + lineLength, paint);
        canvas.drawLine(this.mFramingRect.right + 1, this.mFramingRect.top - 1, (this.mFramingRect.right + 1) - lineLength, this.mFramingRect.top - 1, paint);
        canvas.drawLine(this.mFramingRect.right + 1, this.mFramingRect.bottom + 1, this.mFramingRect.right + 1, (this.mFramingRect.bottom + 1) - lineLength, paint);
        canvas.drawLine(this.mFramingRect.right + 1, this.mFramingRect.bottom + 1, (this.mFramingRect.right + 1) - lineLength, this.mFramingRect.bottom + 1, paint);
    }

    public void drawLaser(Canvas canvas) {
        Paint paint = new Paint();
        Resources resources = getResources();
        paint.setColor(resources.getColor(R.color.viewfinder_laser));
        paint.setAlpha(SCANNER_ALPHA[this.scannerAlpha]);
        paint.setStyle(Paint.Style.FILL);
        this.scannerAlpha = (this.scannerAlpha + 1) % SCANNER_ALPHA.length;
        int middle = (this.mFramingRect.height() / 2) + this.mFramingRect.top;
        canvas.drawRect(this.mFramingRect.left + 2, middle - 1, this.mFramingRect.right - 1, middle + 2, paint);
        postInvalidateDelayed(ANIMATION_DELAY, this.mFramingRect.left - 10, this.mFramingRect.top - 10, this.mFramingRect.right + 10, this.mFramingRect.bottom + 10);
    }

    @Override // android.view.View
    protected void onSizeChanged(int xNew, int yNew, int xOld, int yOld) {
        updateFramingRect();
    }

    public synchronized void updateFramingRect() {
        int width;
        int height;
        Point viewResolution = new Point(getWidth(), getHeight());
        int orientation = DisplayUtils.getScreenOrientation(getContext());
        if (orientation != 1) {
            width = findDesiredDimensionInRange(0.625f, viewResolution.x, 240, LANDSCAPE_MAX_FRAME_WIDTH);
            height = findDesiredDimensionInRange(0.625f, viewResolution.y, 240, LANDSCAPE_MAX_FRAME_HEIGHT);
        } else {
            int width2 = viewResolution.x;
            width = findDesiredDimensionInRange(PORTRAIT_WIDTH_RATIO, width2, 240, PORTRAIT_MAX_FRAME_WIDTH);
            height = findDesiredDimensionInRange(PORTRAIT_HEIGHT_RATIO, viewResolution.y, 240, PORTRAIT_MAX_FRAME_HEIGHT);
        }
        int leftOffset = (viewResolution.x - width) / 2;
        int topOffset = (viewResolution.y - height) / 2;
        this.mFramingRect = new Rect(leftOffset, topOffset, leftOffset + width, topOffset + height);
    }

    private static int findDesiredDimensionInRange(float ratio, int resolution, int hardMin, int hardMax) {
        int dim = (int) (resolution * ratio);
        if (dim < hardMin) {
            return hardMin;
        }
        if (dim > hardMax) {
            return hardMax;
        }
        return dim;
    }
}
