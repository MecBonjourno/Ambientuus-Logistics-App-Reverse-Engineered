package androidx.camera.video.internal.audio;

import java.nio.ByteBuffer;
import java.util.concurrent.Executor;

/* carregado de: classes.dex */
public interface AudioStream {
    PacketInfo read(ByteBuffer byteBuffer);

    void release();

    void setCallback(AudioStreamCallback audioStreamCallback, Executor executor);

    void start() throws AudioStreamException, IllegalStateException;

    void stop() throws IllegalStateException;

    public static abstract class PacketInfo {
        public abstract int getSizeInBytes();

        public abstract long getTimestampNs();

        public static PacketInfo of(int sizeInBytes, long timestampNs) {
            return new AutoValue_AudioStream_PacketInfo(sizeInBytes, timestampNs);
        }
    }

    public interface AudioStreamCallback {
        void onSilenceStateChanged(boolean z);

        /* renomeado de: androidx.camera.video.internal.audio.AudioStream$AudioStreamCallback$-CC, motivo: nome de classe inválido */
        public final /* sintético */ class CC {
            public static void $default$onSilenceStateChanged(AudioStreamCallback _this, boolean isSilenced) {
            }
        }
    }

    public static class AudioStreamException extends Exception {
        public AudioStreamException() {
        }

        public AudioStreamException(String message) {
            super(message);
        }

        public AudioStreamException(String message, Throwable cause) {
            super(message, cause);
        }

        public AudioStreamException(Throwable cause) {
            super(cause);
        }
    }
}
