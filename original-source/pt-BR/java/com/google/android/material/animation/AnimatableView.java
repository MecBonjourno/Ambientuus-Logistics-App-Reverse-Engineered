package com.google.android.material.animation;

/* carregado de: classes16.dex */
public interface AnimatableView {

    public interface Listener {
        void onAnimationEnd();
    }

    void startAnimation(Listener listener);

    void stopAnimation();
}
