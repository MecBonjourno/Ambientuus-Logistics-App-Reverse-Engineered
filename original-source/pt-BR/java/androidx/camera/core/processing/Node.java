package androidx.camera.core.processing;

/* carregado de: classes.dex */
public interface Node<I, O> {
    void release();

    O transform(I i);
}
