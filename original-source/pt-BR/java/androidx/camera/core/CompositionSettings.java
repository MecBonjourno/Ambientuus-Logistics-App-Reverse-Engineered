package androidx.camera.core;

import androidx.core.util.Pair;

/* carregado de: classes.dex */
public class CompositionSettings {
    public static final CompositionSettings DEFAULT = new Builder().setAlpha(1.0f).setOffset(0.0f, 0.0f).setScale(1.0f, 1.0f).build();
    private final float mAlpha;
    private final Pair<Float, Float> mOffset;
    private final Pair<Float, Float> mScale;

    private CompositionSettings(float alpha, Pair<Float, Float> offset, Pair<Float, Float> scale) {
        this.mAlpha = alpha;
        this.mOffset = offset;
        this.mScale = scale;
    }

    public float getAlpha() {
        return this.mAlpha;
    }

    public Pair<Float, Float> getOffset() {
        return this.mOffset;
    }

    public Pair<Float, Float> getScale() {
        return this.mScale;
    }

    public static final class Builder {
        private float mAlpha;
        private Pair<Float, Float> mOffset;
        private Pair<Float, Float> mScale;

        public Builder() {
            Float valueOf = Float.valueOf(1.0f);
            this.mAlpha = 1.0f;
            Float valueOf2 = Float.valueOf(0.0f);
            this.mOffset = Pair.create(valueOf2, valueOf2);
            this.mScale = Pair.create(valueOf, valueOf);
        }

        public Builder setAlpha(float alpha) {
            this.mAlpha = alpha;
            return this;
        }

        public Builder setOffset(float offsetX, float offsetY) {
            this.mOffset = Pair.create(Float.valueOf(offsetX), Float.valueOf(offsetY));
            return this;
        }

        public Builder setScale(float scaleX, float scaleY) {
            this.mScale = Pair.create(Float.valueOf(scaleX), Float.valueOf(scaleY));
            return this;
        }

        public CompositionSettings build() {
            return new CompositionSettings(this.mAlpha, this.mOffset, this.mScale);
        }
    }
}
