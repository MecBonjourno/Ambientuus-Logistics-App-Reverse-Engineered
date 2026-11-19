package androidx.camera.core.internal.utils;

/* carregado de: classes.dex */
public interface RingBuffer<T> {

    public interface OnRemoveCallback<T> {
        void onRemove(T t);
    }

    T dequeue();

    void enqueue(T t);

    int getMaxCapacity();

    boolean isEmpty();
}
