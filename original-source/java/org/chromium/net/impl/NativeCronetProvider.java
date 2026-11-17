package org.chromium.net.impl;

import android.content.Context;
import java.util.Arrays;
import org.chromium.net.CronetEngine;
import org.chromium.net.CronetProvider;
import org.chromium.net.ExperimentalCronetEngine;
import org.chromium.net.ICronetEngineBuilder;

/* loaded from: classes17.dex */
public class NativeCronetProvider extends CronetProvider {
    public NativeCronetProvider(Context context) {
        super(context);
    }

    @Override // org.chromium.net.CronetProvider
    public CronetEngine.Builder createBuilder() {
        ICronetEngineBuilder impl = new NativeCronetEngineBuilderWithLibraryLoaderImpl(this.mContext);
        return new ExperimentalCronetEngine.Builder(impl);
    }

    @Override // org.chromium.net.CronetProvider
    public String getName() {
        return CronetProvider.PROVIDER_NAME_APP_PACKAGED;
    }

    @Override // org.chromium.net.CronetProvider
    public String getVersion() {
        return ImplVersion.getCronetVersion();
    }

    @Override // org.chromium.net.CronetProvider
    public boolean isEnabled() {
        return true;
    }

    public int hashCode() {
        return Arrays.hashCode(new Object[]{NativeCronetProvider.class, this.mContext});
    }

    public boolean equals(Object other) {
        return other == this || ((other instanceof NativeCronetProvider) && this.mContext.equals(((NativeCronetProvider) other).mContext));
    }
}
