package androidx.camera.video.internal.encoder;

import java.util.concurrent.Executor;

/* carregado de: classes.dex */
public interface EncoderFactory {
    Encoder createEncoder(Executor executor, EncoderConfig encoderConfig, int i) throws InvalidConfigException;
}
