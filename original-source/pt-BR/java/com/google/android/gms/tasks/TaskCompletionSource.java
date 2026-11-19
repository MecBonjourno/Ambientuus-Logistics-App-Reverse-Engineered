package com.google.android.gms.tasks;

/* compiled from: com.google.android.gms:play-services-tasks@@18.4.0 */
/* carregado de: classes16.dex */
public class TaskCompletionSource<TResult> {
    private final zzw zza = new zzw();

    public TaskCompletionSource() {
    }

    public TaskCompletionSource(CancellationToken cancellationToken) {
        cancellationToken.onCanceledRequested(new zzs(this));
    }

    public Task<TResult> getTask() {
        return this.zza;
    }

    public void setException(Exception e) {
        this.zza.zzc(e);
    }

    public void setResult(TResult tresult) {
        this.zza.zza(tresult);
    }

    public boolean trySetException(Exception e) {
        return this.zza.zzd(e);
    }

    public boolean trySetResult(TResult tresult) {
        return this.zza.zzb(tresult);
    }

    final /* sintético */ zzw zza() {
        return this.zza;
    }
}
