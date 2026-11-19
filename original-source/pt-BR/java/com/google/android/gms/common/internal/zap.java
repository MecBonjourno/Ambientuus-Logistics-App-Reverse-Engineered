package com.google.android.gms.common.internal;

import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.PendingResultUtil;
import com.google.android.gms.tasks.TaskCompletionSource;
import java.util.concurrent.TimeUnit;

/* compiled from: com.google.android.gms:play-services-base@@18.4.0 */
/* carregado de: classes16.dex */
final class zap implements PendingResult.StatusListener {
    final /* sintético */ PendingResult zaa;
    final /* sintético */ TaskCompletionSource zab;
    final /* sintético */ PendingResultUtil.ResultConverter zac;
    final /* sintético */ zas zad;

    zap(PendingResult pendingResult, TaskCompletionSource taskCompletionSource, PendingResultUtil.ResultConverter resultConverter, zas zasVar) {
        this.zaa = pendingResult;
        this.zab = taskCompletionSource;
        this.zac = resultConverter;
        this.zad = zasVar;
    }

    @Override // com.google.android.gms.common.api.PendingResult.StatusListener
    public final void onComplete(Status status) {
        if (!status.isSuccess()) {
            this.zab.setException(ApiExceptionUtil.fromStatus(status));
        } else {
            this.zab.setResult(this.zac.convert(this.zaa.await(0L, TimeUnit.MILLISECONDS)));
        }
    }
}
