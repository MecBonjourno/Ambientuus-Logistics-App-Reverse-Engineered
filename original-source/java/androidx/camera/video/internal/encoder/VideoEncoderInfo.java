package androidx.camera.video.internal.encoder;

import android.util.Range;

/* loaded from: classes.dex */
public interface VideoEncoderInfo extends EncoderInfo {

    public interface Finder {
        VideoEncoderInfo find(String str);
    }

    boolean canSwapWidthHeight();

    int getHeightAlignment();

    Range<Integer> getSupportedBitrateRange();

    Range<Integer> getSupportedHeights();

    Range<Integer> getSupportedHeightsFor(int i);

    Range<Integer> getSupportedWidths();

    Range<Integer> getSupportedWidthsFor(int i);

    int getWidthAlignment();

    boolean isSizeSupported(int i, int i2);

    boolean isSizeSupportedAllowSwapping(int i, int i2);

    /* renamed from: androidx.camera.video.internal.encoder.VideoEncoderInfo$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        public static boolean $default$isSizeSupportedAllowSwapping(VideoEncoderInfo _this, int width, int height) {
            return _this.isSizeSupported(width, height) || (_this.canSwapWidthHeight() && _this.isSizeSupported(height, width));
        }
    }
}
