package com.google.android.gms.auth.blockstore;

import android.content.Context;
import com.google.android.gms.internal.auth_blockstore.zzaa;

/* compiled from: com.google.android.gms:play-services-auth-blockstore@@16.4.0 */
/* carregado de: classes16.dex */
public final class Blockstore {
    private Blockstore() {
    }

    public static BlockstoreClient getClient(Context context) {
        return new zzaa(context);
    }
}
