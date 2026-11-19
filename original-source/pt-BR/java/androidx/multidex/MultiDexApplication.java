package androidx.multidex;

import android.app.Application;
import android.content.Context;

/* carregado de: classes.dex */
public class MultiDexApplication extends Application {
    @Override // android.content.ContextWrapper
    protected void attachBaseContext(Context base) {
        super.attachBaseContext(base);
        MultiDex.install(this);
    }
}
