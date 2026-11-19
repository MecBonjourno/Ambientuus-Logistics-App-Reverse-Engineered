package androidx.camera.core.internal;

import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.ReadableConfig;
import java.util.concurrent.Executor;

/* carregado de: classes.dex */
public interface ThreadConfig extends ReadableConfig {
    public static final Config.Option<Executor> OPTION_BACKGROUND_EXECUTOR = Config.Option.create("camerax.core.thread.backgroundExecutor", Executor.class);

    public interface Builder<B> {
        B setBackgroundExecutor(Executor executor);
    }

    Executor getBackgroundExecutor();

    Executor getBackgroundExecutor(Executor executor);

    /* renomeado de: androidx.camera.core.internal.ThreadConfig$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        public static Executor $default$getBackgroundExecutor(ThreadConfig _this, Executor valueIfMissing) {
            return (Executor) _this.retrieveOption(ThreadConfig.OPTION_BACKGROUND_EXECUTOR, valueIfMissing);
        }

        public static Executor $default$getBackgroundExecutor(ThreadConfig _this) {
            return (Executor) _this.retrieveOption(ThreadConfig.OPTION_BACKGROUND_EXECUTOR);
        }
    }
}
