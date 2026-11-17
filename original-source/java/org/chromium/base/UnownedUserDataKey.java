package org.chromium.base;

import j$.util.Objects;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.Set;
import java.util.WeakHashMap;
import org.chromium.base.UnownedUserData;
import org.chromium.build.BuildConfig;

/* loaded from: classes17.dex */
public final class UnownedUserDataKey<T extends UnownedUserData> {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private final Class<T> mClazz;
    private final Set<UnownedUserDataHost> mWeakHostAttachments = Collections.newSetFromMap(new WeakHashMap());

    public UnownedUserDataKey(Class<T> clazz) {
        this.mClazz = clazz;
    }

    final Class<T> getValueClass() {
        return this.mClazz;
    }

    public final void attachToHost(UnownedUserDataHost host, T object) {
        Objects.requireNonNull(object);
        host.set(this, object);
        if (!isAttachedToHost(host)) {
            this.mWeakHostAttachments.add(host);
        }
    }

    public final T retrieveDataFromHost(UnownedUserDataHost unownedUserDataHost) {
        assertNoDestroyedAttachments();
        Iterator<UnownedUserDataHost> it = this.mWeakHostAttachments.iterator();
        while (it.hasNext()) {
            if (unownedUserDataHost.equals(it.next())) {
                return (T) unownedUserDataHost.get(this);
            }
        }
        return null;
    }

    public final void detachFromHost(UnownedUserDataHost host) {
        assertNoDestroyedAttachments();
        Iterator it = new ArrayList(this.mWeakHostAttachments).iterator();
        while (it.hasNext()) {
            UnownedUserDataHost attachedHost = (UnownedUserDataHost) it.next();
            if (host.equals(attachedHost)) {
                removeHostAttachment(attachedHost);
            }
        }
    }

    public final void detachFromAllHosts(T object) {
        assertNoDestroyedAttachments();
        Iterator it = new ArrayList(this.mWeakHostAttachments).iterator();
        while (it.hasNext()) {
            UnownedUserDataHost attachedHost = (UnownedUserDataHost) it.next();
            if (object.equals(attachedHost.get(this))) {
                removeHostAttachment(attachedHost);
            }
        }
    }

    public final boolean isAttachedToHost(UnownedUserDataHost host) {
        T t = retrieveDataFromHost(host);
        return t != null;
    }

    public final boolean isAttachedToAnyHost(T object) {
        return getHostAttachmentCount(object) > 0;
    }

    int getHostAttachmentCount(T object) {
        assertNoDestroyedAttachments();
        int ret = 0;
        for (UnownedUserDataHost attachedHost : this.mWeakHostAttachments) {
            if (object.equals(attachedHost.get(this))) {
                ret++;
            }
        }
        return ret;
    }

    private void removeHostAttachment(UnownedUserDataHost host) {
        host.remove(this);
        this.mWeakHostAttachments.remove(host);
    }

    private void assertNoDestroyedAttachments() {
        if (BuildConfig.ENABLE_ASSERTS) {
            for (UnownedUserDataHost attachedHost : this.mWeakHostAttachments) {
                if (attachedHost.isDestroyed()) {
                    throw new AssertionError("Host should have been removed already.");
                }
            }
        }
    }
}
