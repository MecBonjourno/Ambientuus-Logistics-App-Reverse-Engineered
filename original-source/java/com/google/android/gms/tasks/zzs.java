package com.google.android.gms.tasks;

import j$.util.Objects;

/* compiled from: com.google.android.gms:play-services-tasks@@18.4.0 */
/* loaded from: classes16.dex */
final class zzs implements OnTokenCanceledListener {
    final /* synthetic */ TaskCompletionSource zza;

    zzs(TaskCompletionSource taskCompletionSource) {
        Objects.requireNonNull(taskCompletionSource);
        this.zza = taskCompletionSource;
    }

    @Override // com.google.android.gms.tasks.OnTokenCanceledListener
    public final void onCanceled() {
        this.zza.zza().zze();
    }
}
