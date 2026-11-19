package androidx.camera.core.impl;

/* carregado de: classes.dex */
public abstract class Identifier {
    public abstract Object getValue();

    public static Identifier create(Object value) {
        return new AutoValue_Identifier(value);
    }
}
