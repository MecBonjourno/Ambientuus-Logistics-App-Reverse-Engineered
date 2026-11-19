package org.chromium.net.impl;

import android.content.Context;
import java.util.Date;
import java.util.Set;
import org.chromium.net.CronetEngine;
import org.chromium.net.ExperimentalCronetEngine;
import org.chromium.net.ICronetEngineBuilder;

/* carregado de: classes17.dex */
public class NativeCronetEngineBuilderImpl extends CronetEngineBuilderImpl {
    @Override // org.chromium.net.impl.CronetEngineBuilderImpl, org.chromium.net.ICronetEngineBuilder
    public /* bridge */ /* sintético */ ICronetEngineBuilder addPublicKeyPins(String str, Set set, boolean z, Date date) {
        return super.addPublicKeyPins(str, (Set<byte[]>) set, z, date);
    }

    @Override // org.chromium.net.impl.CronetEngineBuilderImpl, org.chromium.net.ICronetEngineBuilder
    public /* bridge */ /* sintético */ ICronetEngineBuilder addQuicHint(String str, int i, int i2) {
        return super.addQuicHint(str, i, i2);
    }

    @Override // org.chromium.net.impl.CronetEngineBuilderImpl, org.chromium.net.ICronetEngineBuilder
    public /* bridge */ /* sintético */ ICronetEngineBuilder enableBrotli(boolean z) {
        return super.enableBrotli(z);
    }

    @Override // org.chromium.net.impl.CronetEngineBuilderImpl, org.chromium.net.ICronetEngineBuilder
    public /* bridge */ /* sintético */ ICronetEngineBuilder enableHttp2(boolean z) {
        return super.enableHttp2(z);
    }

    @Override // org.chromium.net.impl.CronetEngineBuilderImpl, org.chromium.net.ICronetEngineBuilder
    public /* bridge */ /* sintético */ ICronetEngineBuilder enableHttpCache(int i, long j) {
        return super.enableHttpCache(i, j);
    }

    @Override // org.chromium.net.impl.CronetEngineBuilderImpl, org.chromium.net.ICronetEngineBuilder
    public /* bridge */ /* sintético */ ICronetEngineBuilder enableNetworkQualityEstimator(boolean z) {
        return super.enableNetworkQualityEstimator(z);
    }

    @Override // org.chromium.net.impl.CronetEngineBuilderImpl, org.chromium.net.ICronetEngineBuilder
    public /* bridge */ /* sintético */ ICronetEngineBuilder enablePublicKeyPinningBypassForLocalTrustAnchors(boolean z) {
        return super.enablePublicKeyPinningBypassForLocalTrustAnchors(z);
    }

    @Override // org.chromium.net.impl.CronetEngineBuilderImpl, org.chromium.net.ICronetEngineBuilder
    public /* bridge */ /* sintético */ ICronetEngineBuilder enableQuic(boolean z) {
        return super.enableQuic(z);
    }

    @Override // org.chromium.net.impl.CronetEngineBuilderImpl, org.chromium.net.ICronetEngineBuilder
    public /* bridge */ /* sintético */ ICronetEngineBuilder enableSdch(boolean z) {
        return super.enableSdch(z);
    }

    @Override // org.chromium.net.impl.CronetEngineBuilderImpl, org.chromium.net.ICronetEngineBuilder
    public /* bridge */ /* sintético */ ICronetEngineBuilder setExperimentalOptions(String str) {
        return super.setExperimentalOptions(str);
    }

    @Override // org.chromium.net.impl.CronetEngineBuilderImpl, org.chromium.net.ICronetEngineBuilder
    public /* bridge */ /* sintético */ ICronetEngineBuilder setLibraryLoader(CronetEngine.Builder.LibraryLoader libraryLoader) {
        return super.setLibraryLoader(libraryLoader);
    }

    @Override // org.chromium.net.impl.CronetEngineBuilderImpl, org.chromium.net.ICronetEngineBuilder
    public /* bridge */ /* sintético */ ICronetEngineBuilder setStoragePath(String str) {
        return super.setStoragePath(str);
    }

    @Override // org.chromium.net.impl.CronetEngineBuilderImpl, org.chromium.net.ICronetEngineBuilder
    public /* bridge */ /* sintético */ ICronetEngineBuilder setThreadPriority(int i) {
        return super.setThreadPriority(i);
    }

    @Override // org.chromium.net.impl.CronetEngineBuilderImpl, org.chromium.net.ICronetEngineBuilder
    public /* bridge */ /* sintético */ ICronetEngineBuilder setUserAgent(String str) {
        return super.setUserAgent(str);
    }

    public NativeCronetEngineBuilderImpl(Context context) {
        super(context);
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public ExperimentalCronetEngine build() {
        if (getUserAgent() == null) {
            setUserAgent(getDefaultUserAgent());
        }
        ExperimentalCronetEngine builder = new CronetUrlRequestContext(this);
        this.mMockCertVerifier = 0L;
        return builder;
    }
}
