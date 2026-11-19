package androidx.camera.core;

import android.os.Process;
import androidx.camera.core.CameraExecutor;
import androidx.camera.core.impl.CameraFactory;
import androidx.core.util.Preconditions;
import java.util.Locale;
import java.util.concurrent.Executor;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

/* carregado de: classes.dex */
public class CameraExecutor implements Executor {
    private static final int CAMERA_THREAD_JAVA_PRIORITY = 7;
    private static final int CAMERA_THREAD_PROCESS_PRIORITY = -3;
    private static final int DEFAULT_CORE_THREADS = 1;
    private static final int DEFAULT_MAX_THREADS = 1;
    private static final String TAG = "CameraExecutor";
    private static final ThreadFactory THREAD_FACTORY = new AnonymousClass1();
    private final Object mExecutorLock = new Object();
    private ThreadPoolExecutor mThreadPoolExecutor = createExecutor();

    /* renomeado de: androidx.camera.core.CameraExecutor$1, motivo: nome de classe inválido */
    class AnonymousClass1 implements ThreadFactory {
        private static final String THREAD_NAME_STEM = "CameraX-core_camera_%d";
        private final AtomicInteger mThreadId = new AtomicInteger(0);

        AnonymousClass1() {
        }

        @Override // java.util.concurrent.ThreadFactory
        public Thread newThread(final Runnable runnable) {
            Thread t = new Thread(new Runnable() { // da classe: androidx.camera.core.CameraExecutor$1$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    CameraExecutor.AnonymousClass1.lambda$newThread$0(runnable);
                }
            });
            t.setPriority(7);
            t.setName(String.format(Locale.US, THREAD_NAME_STEM, Integer.valueOf(this.mThreadId.getAndIncrement())));
            return t;
        }

        static /* sintético */ void lambda$newThread$0(Runnable runnable) {
            Process.setThreadPriority(-3);
            runnable.run();
        }
    }

    void init(CameraFactory cameraFactory) {
        ThreadPoolExecutor executor;
        Preconditions.checkNotNull(cameraFactory);
        synchronized (this.mExecutorLock) {
            if (this.mThreadPoolExecutor.isShutdown()) {
                this.mThreadPoolExecutor = createExecutor();
            }
            executor = this.mThreadPoolExecutor;
        }
        int cameraNumber = cameraFactory.getAvailableCameraIds().size();
        int corePoolSize = Math.max(1, cameraNumber);
        executor.setMaximumPoolSize(corePoolSize);
        executor.setCorePoolSize(corePoolSize);
    }

    void deinit() {
        synchronized (this.mExecutorLock) {
            if (!this.mThreadPoolExecutor.isShutdown()) {
                this.mThreadPoolExecutor.shutdown();
            }
        }
    }

    @Override // java.util.concurrent.Executor
    public void execute(Runnable runnable) {
        Preconditions.checkNotNull(runnable);
        synchronized (this.mExecutorLock) {
            this.mThreadPoolExecutor.execute(runnable);
        }
    }

    private static ThreadPoolExecutor createExecutor() {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(1, 1, 0L, TimeUnit.MILLISECONDS, new LinkedBlockingQueue(), THREAD_FACTORY);
        threadPoolExecutor.setRejectedExecutionHandler(new RejectedExecutionHandler() { // da classe: androidx.camera.core.CameraExecutor$$ExternalSyntheticLambda0
            @Override // java.util.concurrent.RejectedExecutionHandler
            public final void rejectedExecution(Runnable runnable, ThreadPoolExecutor threadPoolExecutor2) {
                Logger.e(CameraExecutor.TAG, "A rejected execution occurred in CameraExecutor!");
            }
        });
        return threadPoolExecutor;
    }
}
