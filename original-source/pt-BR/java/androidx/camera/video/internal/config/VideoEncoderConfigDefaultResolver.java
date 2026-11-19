package androidx.camera.video.internal.config;

import android.util.Range;
import android.util.Size;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.Timebase;
import androidx.camera.video.VideoSpec;
import androidx.camera.video.internal.encoder.VideoEncoderConfig;
import androidx.camera.video.internal.encoder.VideoEncoderDataSpace;
import androidx.camera.video.internal.utils.DynamicRangeUtil;
import androidx.core.util.Supplier;

/* carregado de: classes.dex */
public class VideoEncoderConfigDefaultResolver implements Supplier<VideoEncoderConfig> {
    private static final String TAG = "VidEncCfgDefaultRslvr";
    private static final int VIDEO_BITRATE_BASE = 14000000;
    private static final int VIDEO_BIT_DEPTH_BASE = 8;
    private static final int VIDEO_FRAME_RATE_BASE = 30;
    private static final Size VIDEO_SIZE_BASE = new Size(1280, 720);
    private final DynamicRange mDynamicRange;
    private final Range<Integer> mExpectedFrameRateRange;
    private final Timebase mInputTimebase;
    private final String mMimeType;
    private final Size mSurfaceSize;
    private final VideoSpec mVideoSpec;

    public VideoEncoderConfigDefaultResolver(String mimeType, Timebase inputTimebase, VideoSpec videoSpec, Size surfaceSize, DynamicRange dynamicRange, Range<Integer> expectedFrameRateRange) {
        this.mMimeType = mimeType;
        this.mInputTimebase = inputTimebase;
        this.mVideoSpec = videoSpec;
        this.mSurfaceSize = surfaceSize;
        this.mDynamicRange = dynamicRange;
        this.mExpectedFrameRateRange = expectedFrameRateRange;
    }

    /* JADX WARN: não é possível renomear o método para resolver a colisão */
    @Override // androidx.core.util.Supplier
    public VideoEncoderConfig get() {
        CaptureEncodeRates resolvedFrameRates = VideoConfigUtil.resolveFrameRates(this.mVideoSpec, this.mExpectedFrameRateRange);
        Logger.d(TAG, "Resolved VIDEO frame rates: Capture frame rate = " + resolvedFrameRates.getCaptureRate() + "fps. Encode frame rate = " + resolvedFrameRates.getEncodeRate() + "fps.");
        Range<Integer> videoSpecBitrateRange = this.mVideoSpec.getBitrate();
        Logger.d(TAG, "Using fallback VIDEO bitrate");
        int resolvedBitrate = VideoConfigUtil.scaleAndClampBitrate(VIDEO_BITRATE_BASE, this.mDynamicRange.getBitDepth(), 8, resolvedFrameRates.getEncodeRate(), 30, this.mSurfaceSize.getWidth(), VIDEO_SIZE_BASE.getWidth(), this.mSurfaceSize.getHeight(), VIDEO_SIZE_BASE.getHeight(), videoSpecBitrateRange);
        int resolvedProfile = DynamicRangeUtil.dynamicRangeToCodecProfileLevelForMime(this.mMimeType, this.mDynamicRange);
        VideoEncoderDataSpace dataSpace = VideoConfigUtil.mimeAndProfileToEncoderDataSpace(this.mMimeType, resolvedProfile);
        return VideoEncoderConfig.builder().setMimeType(this.mMimeType).setInputTimebase(this.mInputTimebase).setResolution(this.mSurfaceSize).setBitrate(resolvedBitrate).setCaptureFrameRate(resolvedFrameRates.getCaptureRate()).setEncodeFrameRate(resolvedFrameRates.getEncodeRate()).setProfile(resolvedProfile).setDataSpace(dataSpace).build();
    }
}
