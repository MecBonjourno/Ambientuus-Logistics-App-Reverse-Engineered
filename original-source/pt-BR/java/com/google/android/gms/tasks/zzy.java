package com.google.android.gms.tasks;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

/* compiled from: com.google.android.gms:play-services-tasks@@18.4.0 */
/* carregado de: classes16.dex */
final class zzy implements Continuation {
    final /* sintético */ Collection zza;

    zzy(Collection collection) {
        this.zza = collection;
    }

    @Override // com.google.android.gms.tasks.Continuation
    public final /* bridge */ /* sintético */ Object then(Task task) throws Exception {
        ArrayList arrayList = new ArrayList();
        Iterator it = this.zza.iterator();
        while (it.hasNext()) {
            arrayList.add(((Task) it.next()).getResult());
        }
        return arrayList;
    }
}
