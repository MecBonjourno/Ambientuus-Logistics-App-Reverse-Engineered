package com.google.android.gms.common.internal;

import android.content.Context;
import android.content.res.Resources;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import com.google.android.gms.common.R;

/* compiled from: com.google.android.gms:play-services-basement@@18.8.0 */
/* loaded from: classes16.dex */
public class StringResourceValueReader {
    private final Resources zza;
    private final String zzb;

    public StringResourceValueReader(Context context) {
        Preconditions.checkNotNull(context);
        this.zza = context.getResources();
        this.zzb = this.zza.getResourcePackageName(R.string.common_google_play_services_unknown_issue);
    }

    public String getString(String name) {
        String str = this.zzb;
        Resources resources = this.zza;
        int identifier = resources.getIdentifier(name, TypedValues.Custom.S_STRING, str);
        if (identifier == 0) {
            return null;
        }
        return resources.getString(identifier);
    }
}
