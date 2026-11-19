package com.google.android.gms.tasks;

import java.util.ArrayList;
import java.util.Collection;

/* compiled from: com.google.android.gms:play-services-tasks@@18.4.0 */
/* carregado de: classes16.dex */
final class zzz implements Continuation {
    final /* sintético */ Collection zza;

    zzz(Collection collection) {
        this.zza = collection;
    }

    @Override // com.google.android.gms.tasks.Continuation
    public final /* bridge */ /* sintético */ Object then(Task task) throws Exception {
        ArrayList arrayList = new ArrayList();
        arrayList.addAll(this.zza);
        return Tasks.forResult(arrayList);
    }
}
