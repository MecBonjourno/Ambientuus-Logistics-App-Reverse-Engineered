package androidx.core.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.ProgressBar;

/* carregado de: classes.dex */
public class ContentLoadingProgressBar extends ProgressBar {
    private static final int MIN_DELAY_MS = 500;
    private static final int MIN_SHOW_TIME_MS = 500;
    private final Runnable mDelayedHide;
    private final Runnable mDelayedShow;
    boolean mDismissed;
    boolean mPostedHide;
    boolean mPostedShow;
    long mStartTime;

    /* renomeado de: lambda$new$0$androidx-core-widget-ContentLoadingProgressBar, motivo: nome Java inválido */
    /* sintético */ void m390lambda$new$0$androidxcorewidgetContentLoadingProgressBar() {
        this.mPostedHide = false;
        this.mStartTime = -1L;
        setVisibility(8);
    }

    /* renomeado de: lambda$new$1$androidx-core-widget-ContentLoadingProgressBar, motivo: nome Java inválido */
    /* sintético */ void m391lambda$new$1$androidxcorewidgetContentLoadingProgressBar() {
        this.mPostedShow = false;
        if (!this.mDismissed) {
            this.mStartTime = System.currentTimeMillis();
            setVisibility(0);
        }
    }

    public ContentLoadingProgressBar(Context context) {
        this(context, null);
    }

    public ContentLoadingProgressBar(Context context, AttributeSet attrs) {
        super(context, attrs, 0);
        this.mStartTime = -1L;
        this.mPostedHide = false;
        this.mPostedShow = false;
        this.mDismissed = false;
        this.mDelayedHide = new Runnable() { // da classe: androidx.core.widget.ContentLoadingProgressBar$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                ContentLoadingProgressBar.this.m390lambda$new$0$androidxcorewidgetContentLoadingProgressBar();
            }
        };
        this.mDelayedShow = new Runnable() { // da classe: androidx.core.widget.ContentLoadingProgressBar$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                ContentLoadingProgressBar.this.m391lambda$new$1$androidxcorewidgetContentLoadingProgressBar();
            }
        };
    }

    @Override // android.widget.ProgressBar, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        removeCallbacks();
    }

    @Override // android.widget.ProgressBar, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        removeCallbacks();
    }

    private void removeCallbacks() {
        removeCallbacks(this.mDelayedHide);
        removeCallbacks(this.mDelayedShow);
    }

    public void hide() {
        post(new Runnable() { // da classe: androidx.core.widget.ContentLoadingProgressBar$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                ContentLoadingProgressBar.this.hideOnUiThread();
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public void hideOnUiThread() {
        this.mDismissed = true;
        removeCallbacks(this.mDelayedShow);
        this.mPostedShow = false;
        long diff = System.currentTimeMillis() - this.mStartTime;
        if (diff >= 500 || this.mStartTime == -1) {
            setVisibility(8);
        } else if (!this.mPostedHide) {
            postDelayed(this.mDelayedHide, 500 - diff);
            this.mPostedHide = true;
        }
    }

    public void show() {
        post(new Runnable() { // da classe: androidx.core.widget.ContentLoadingProgressBar$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                ContentLoadingProgressBar.this.showOnUiThread();
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public void showOnUiThread() {
        this.mStartTime = -1L;
        this.mDismissed = false;
        removeCallbacks(this.mDelayedHide);
        this.mPostedHide = false;
        if (!this.mPostedShow) {
            postDelayed(this.mDelayedShow, 500L);
            this.mPostedShow = true;
        }
    }
}
