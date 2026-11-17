package org.chromium.base;

import org.chromium.base.Callback;

/* compiled from: D8$$SyntheticClass */
/* loaded from: classes17.dex */
public final /* synthetic */ class Promise$$ExternalSyntheticLambda1 implements Callback {
    public final /* synthetic */ Promise f$0;

    @Override // org.chromium.base.Callback
    public /* synthetic */ Runnable bind(Object obj) {
        return Callback.CC.$default$bind(this, obj);
    }

    @Override // org.chromium.base.Callback
    public final void onResult(Object obj) {
        this.f$0.reject((Exception) obj);
    }
}
