package androidx.camera.video.internal.encoder;

/* carregado de: classes.dex */
public interface EncoderCallback {
    public static final EncoderCallback EMPTY = new EncoderCallback() { // da classe: androidx.camera.video.internal.encoder.EncoderCallback.1
        @Override // androidx.camera.video.internal.encoder.EncoderCallback
        public /* sintético */ void onEncodePaused() {
            CC.$default$onEncodePaused(this);
        }

        @Override // androidx.camera.video.internal.encoder.EncoderCallback
        public void onEncodeStart() {
        }

        @Override // androidx.camera.video.internal.encoder.EncoderCallback
        public void onEncodeStop() {
        }

        @Override // androidx.camera.video.internal.encoder.EncoderCallback
        public void onEncodeError(EncodeException e) {
        }

        @Override // androidx.camera.video.internal.encoder.EncoderCallback
        public void onEncodedData(EncodedData encodedData) {
        }

        @Override // androidx.camera.video.internal.encoder.EncoderCallback
        public void onOutputConfigUpdate(OutputConfig outputConfig) {
        }
    };

    void onEncodeError(EncodeException encodeException);

    void onEncodePaused();

    void onEncodeStart();

    void onEncodeStop();

    void onEncodedData(EncodedData encodedData);

    void onOutputConfigUpdate(OutputConfig outputConfig);

    /* renomeado de: androidx.camera.video.internal.encoder.EncoderCallback$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        public static void $default$onEncodePaused(EncoderCallback _this) {
        }
    }
}
