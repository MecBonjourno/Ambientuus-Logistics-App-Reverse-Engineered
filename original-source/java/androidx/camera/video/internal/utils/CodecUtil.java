package androidx.camera.video.internal.utils;

import android.media.MediaCodec;
import android.media.MediaCodecInfo;
import android.util.LruCache;
import androidx.camera.video.internal.encoder.EncoderConfig;
import androidx.camera.video.internal.encoder.InvalidConfigException;
import java.io.IOException;

/* loaded from: classes.dex */
public final class CodecUtil {
    private static final int MAX_CODEC_INFO_CACHE_COUNT = 10;
    private static final LruCache<String, MediaCodecInfo> sCodecInfoCache = new LruCache<>(10);

    private CodecUtil() {
    }

    public static MediaCodec createCodec(EncoderConfig encoderConfig) throws InvalidConfigException {
        return createCodec(encoderConfig.getMimeType());
    }

    public static MediaCodecInfo findCodecAndGetCodecInfo(String mimeType) throws InvalidConfigException {
        MediaCodecInfo codecInfo;
        synchronized (sCodecInfoCache) {
            codecInfo = sCodecInfoCache.get(mimeType);
        }
        if (codecInfo != null) {
            return codecInfo;
        }
        MediaCodec codec = null;
        try {
            codec = createCodec(mimeType);
            MediaCodecInfo codecInfo2 = codec.getCodecInfo();
            synchronized (sCodecInfoCache) {
                sCodecInfoCache.put(mimeType, codecInfo2);
            }
            return codecInfo2;
        } finally {
            if (codec != null) {
                codec.release();
            }
        }
    }

    private static MediaCodec createCodec(String mimeType) throws InvalidConfigException {
        try {
            return MediaCodec.createEncoderByType(mimeType);
        } catch (IOException | IllegalArgumentException e) {
            throw new InvalidConfigException(e);
        }
    }
}
