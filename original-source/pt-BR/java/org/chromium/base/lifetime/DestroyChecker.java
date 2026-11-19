package org.chromium.base.lifetime;

/* carregado de: classes17.dex */
public class DestroyChecker implements Destroyable {
    static final /* sintético */ boolean $assertionsDisabled = false;
    private boolean mIsDestroyed;

    @Override // org.chromium.base.lifetime.Destroyable
    public void destroy() {
        checkNotDestroyed();
        this.mIsDestroyed = true;
    }

    public boolean isDestroyed() {
        return this.mIsDestroyed;
    }

    public void checkNotDestroyed() {
        if (this.mIsDestroyed) {
            throw new AssertionError("Object is already destroyed.");
        }
    }
}
