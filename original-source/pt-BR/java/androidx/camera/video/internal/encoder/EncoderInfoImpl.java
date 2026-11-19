package androidx.camera.video.internal.encoder;

import android.media.MediaCodecInfo;
import j$.util.Objects;

/* carregado de: classes.dex */
public abstract class EncoderInfoImpl implements EncoderInfo {
    protected final MediaCodecInfo.CodecCapabilities mCodecCapabilities;
    private final MediaCodecInfo mMediaCodecInfo;

    EncoderInfoImpl(MediaCodecInfo codecInfo, String mime) throws InvalidConfigException {
        this.mMediaCodecInfo = codecInfo;
        try {
            this.mCodecCapabilities = (MediaCodecInfo.CodecCapabilities) Objects.requireNonNull(codecInfo.getCapabilitiesForType(mime));
        } catch (RuntimeException e) {
            throw new InvalidConfigException("Unable to get CodecCapabilities for mime: " + mime, e);
        }
    }

    @Override // androidx.camera.video.internal.encoder.EncoderInfo
    public String getName() {
        return this.mMediaCodecInfo.getName();
    }
}
