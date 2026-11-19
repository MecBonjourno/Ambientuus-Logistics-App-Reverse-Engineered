package org.chromium.base.supplier;

import org.chromium.base.UnownedUserData;
import org.chromium.base.UnownedUserDataHost;
import org.chromium.base.UnownedUserDataKey;
import org.chromium.base.lifetime.DestroyChecker;
import org.chromium.base.lifetime.Destroyable;

/* carregado de: classes17.dex */
public abstract class UnownedUserDataSupplier<E> extends ObservableSupplierImpl<E> implements Destroyable, UnownedUserData {
    private final DestroyChecker mDestroyChecker = new DestroyChecker();
    private final UnownedUserDataKey<UnownedUserDataSupplier<E>> mUudKey;

    @Override // org.chromium.base.UnownedUserData
    public /* sintético */ boolean informOnDetachmentFromHost() {
        return UnownedUserData.CC.$default$informOnDetachmentFromHost(this);
    }

    @Override // org.chromium.base.UnownedUserData
    public /* sintético */ void onDetachedFromHost(UnownedUserDataHost unownedUserDataHost) {
        UnownedUserData.CC.$default$onDetachedFromHost(this, unownedUserDataHost);
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    protected UnownedUserDataSupplier(UnownedUserDataKey<? extends UnownedUserDataSupplier<E>> unownedUserDataKey) {
        this.mUudKey = unownedUserDataKey;
    }

    public void attach(UnownedUserDataHost host) {
        this.mDestroyChecker.checkNotDestroyed();
        this.mUudKey.attachToHost(host, this);
    }

    @Override // org.chromium.base.lifetime.Destroyable
    public void destroy() {
        this.mDestroyChecker.destroy();
        this.mUudKey.detachFromAllHosts(this);
    }
}
