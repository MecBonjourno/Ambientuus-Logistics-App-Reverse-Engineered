package org.chromium.base;

import org.chromium.base.Callback;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes17.dex */
public final /* sintético */ class Promise$$ExternalSyntheticLambda1 implements Callback {
    public final /* sintético */ Promise f$0;

    @Override // org.chromium.base.Callback
    public /* sintético */ Runnable bind(Object obj) {
        return Callback.CC.$default$bind(this, obj);
    }

    @Override // org.chromium.base.Callback
    public final void onResult(Object obj) {
        this.f$0.reject((Exception) obj);
    }
}
