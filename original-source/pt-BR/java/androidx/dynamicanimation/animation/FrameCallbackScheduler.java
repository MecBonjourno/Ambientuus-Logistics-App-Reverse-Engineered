package androidx.dynamicanimation.animation;

/* carregado de: classes.dex */
public interface FrameCallbackScheduler {
    boolean isCurrentThread();

    void postFrameCallback(Runnable runnable);
}
