package androidx.profileinstaller;

import android.content.Context;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.view.Choreographer;
import androidx.startup.Initializer;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import java.util.concurrent.Executor;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* carregado de: classes.dex */
public class ProfileInstallerInitializer implements Initializer<Result> {
    private static final int DELAY_MS = 5000;

    public static class Result {
    }

    /* JADX WARN: não é possível renomear o método para resolver a colisão */
    @Override // androidx.startup.Initializer
    public Result create(Context context) {
        if (Build.VERSION.SDK_INT < 24) {
            return new Result();
        }
        final Context appContext = context.getApplicationContext();
        Choreographer.getInstance().postFrameCallback(new Choreographer.FrameCallback() { // da classe: androidx.profileinstaller.ProfileInstallerInitializer$$ExternalSyntheticLambda0
            @Override // android.view.Choreographer.FrameCallback
            public final void doFrame(long j) {
                ProfileInstallerInitializer.this.m476x451635a(appContext, j);
            }
        });
        return new Result();
    }

    /* renomeado de: lambda$create$0$androidx-profileinstaller-ProfileInstallerInitializer, motivo: nome Java inválido */
    /* sintético */ void m476x451635a(Context appContext, long frameTimeNanos) {
        installAfterDelay(appContext);
    }

    void installAfterDelay(final Context appContext) {
        Handler handler;
        if (Build.VERSION.SDK_INT >= 28) {
            handler = Handler28Impl.createAsync(Looper.getMainLooper());
        } else {
            handler = new Handler(Looper.getMainLooper());
        }
        Random random = new Random();
        int extra = random.nextInt(Math.max(1000, 1));
        handler.postDelayed(new Runnable() { // da classe: androidx.profileinstaller.ProfileInstallerInitializer$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                ProfileInstallerInitializer.writeInBackground(appContext);
            }
        }, extra + DELAY_MS);
    }

    @Override // androidx.startup.Initializer
    public List<Class<? extends Initializer<?>>> dependencies() {
        return Collections.emptyList();
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static void writeInBackground(final Context context) {
        Executor executor = new ThreadPoolExecutor(0, 1, 0L, TimeUnit.MILLISECONDS, new LinkedBlockingQueue());
        executor.execute(new Runnable() { // da classe: androidx.profileinstaller.ProfileInstallerInitializer$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                ProfileInstaller.writeProfile(context);
            }
        });
    }

    private static class Handler28Impl {
        private Handler28Impl() {
        }

        public static Handler createAsync(Looper looper) {
            return Handler.createAsync(looper);
        }
    }
}
